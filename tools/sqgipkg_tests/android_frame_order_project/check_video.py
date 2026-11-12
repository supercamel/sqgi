#!/usr/bin/env python3
"""Check the two binary counters in a recording of the emulator window.

Requires ffmpeg. Capture the host window: Android screenrecord can miss a
presentation bug in the emulator's host compositor. Exit 1 on stale frames.
"""
import argparse
import json
import subprocess


def decode(path, filters, frames=None):
    command = ["ffmpeg", "-v", "error", "-i", str(path), "-vf", filters]
    if frames is not None:
        command += ["-frames:v", str(frames)]
    command += ["-f", "rawvideo", "-pix_fmt", "gray", "-"]
    return subprocess.check_output(command, timeout=120)


def check(path):
    # Normalize both the host window and the Android display to tablet size.
    first = decode(path, "scale=1920:1200", frames=1)
    if len(first) != 1920 * 1200:
        raise ValueError("Missing first frame")
    # Locate the bars rather than assuming system-bar insets stay constant.
    groups = []
    for y in range(121, 1150):
        row = first[y * 1920 + 192:y * 1920 + 1728:8]
        if sum(value < 30 or value > 225 for value in row) / len(row) > .95:
            if not groups or groups[-1][-1] != y - 1:
                groups.append([])
            groups[-1].append(y)
    centers = [group[len(group) // 2] for group in groups if len(group) > 5]
    if len(centers) != 2:
        raise ValueError(f"Expected two counter bars; found {centers}")
    bands = []
    for kind, y in zip(("GPU", "CPU"), centers):
        pixels = decode(path, f"scale=1920:1200,crop=1536:4:192:{y},scale=16:1:flags=neighbor")
        if len(pixels) % 16:
            raise ValueError("Incomplete counter frame")
        sequence = [sum(1 << bit for bit, value in enumerate(pixels[i:i + 16]) if value > 128)
                    for i in range(0, len(pixels), 16)]
        if len(set(sequence)) <= 10:
            raise ValueError(f"{kind} counter did not advance sufficiently")
        backwards = [dict(frame=i, previous=before, current=after)
                     for i, (before, after) in enumerate(zip(sequence, sequence[1:]), 1)
                     if after < before and not (before > 65000 and after < 500)]
        bands.append(dict(kind=kind, y=y, samples=len(sequence), first=sequence[0],
                          last=sequence[-1], backwards=backwards))
    return dict(video=str(path), passed=not any(band["backwards"] for band in bands), bands=bands)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("video")
    args = parser.parse_args()
    result = check(args.video)
    print(json.dumps(result, indent=2))
    raise SystemExit(0 if result["passed"] else 1)
