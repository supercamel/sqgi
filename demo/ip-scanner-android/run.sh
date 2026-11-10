#!/usr/bin/env bash
set -euo pipefail
demo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
packager="${SQGIPKG:-sqgipkg}"
serial=""
arch=""
emulator_args=()
usage() { echo "Usage: $0 [--serial DEVICE] [--arch x86_64|arm64-v8a] [--headless]"; }
while (($#)); do
    case "$1" in
        --serial) serial="${2:?Missing device serial}"; shift 2 ;;
        --arch) arch="${2:?Missing architecture}"; shift 2 ;;
        --headless) emulator_args+=(--headless); shift ;;
        -h|--help) usage; exit 0 ;;
        *) usage >&2; exit 2 ;;
    esac
done
if [[ -n "$arch" && "$arch" != x86_64 && "$arch" != arm64-v8a ]]; then
    echo "Unsupported ABI: $arch" >&2; exit 2
fi
if [[ -n "$serial" && ${#emulator_args[@]} -gt 0 ]]; then
    echo "--headless applies when starting the demo's emulator." >&2; exit 2
fi
command -v "$packager" >/dev/null || { echo "Install SQGI and add sqgipkg to PATH." >&2; exit 1; }
if [[ -z "$serial" ]]; then
    "$packager" emulator "${emulator_args[@]}"
    serial=emulator-5564
    arch="${arch:-x86_64}"
fi
args=(deploy --manifest "$demo_dir/sqgipkg.json" --platform android --serial "$serial")
if [[ -n "$arch" ]]; then args+=(--arch "$arch"); fi
exec "$packager" "${args[@]}"
