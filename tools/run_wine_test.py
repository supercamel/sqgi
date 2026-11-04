#!/usr/bin/env python3
"""CMake cross-compiling emulator for Windows console tests under Wine.

Set WINEPREFIX to an isolated test prefix, WINEPATH to the Windows DLL search
directories and GI_TYPELIB_PATH to the Windows typelib directory. Configure
CMake with -DCMAKE_CROSSCOMPILING_EMULATOR=/absolute/path/run_wine_test.py.
Run under Xvfb when no display is available.
"""
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import time


def main():
    if len(sys.argv) < 2:
        print("usage: run_wine_test.py EXECUTABLE [ARG ...]", file=sys.stderr)
        return 2
    if not os.environ.get("WINEPREFIX"):
        print("Set WINEPREFIX to an isolated Wine test prefix", file=sys.stderr)
        return 2
    env = os.environ.copy()
    env.setdefault("WINEDEBUG", "-all")
    # The isolated prefix uses Wine's default Z: mapping of the host filesystem.
    args = ["Z:" + str(Path(arg).absolute()).replace("/", "\\")
            if Path(arg).exists() else arg for arg in sys.argv[1:]]
    # Wine desktop/services may outlive the executable and inherit stderr.
    # Giving them CTest's pipe keeps it open after a successful test, causing a
    # false timeout. Use independent file handles so output can be forwarded
    # while the foreground process runs, including before a CTest timeout.
    with tempfile.TemporaryDirectory(prefix="sqgi-wine-output-") as directory:
        path = Path(directory) / "output.log"
        with path.open("wb") as output, path.open("rb") as reader:
            # /exec inherits the console, waits for the Windows process, and
            # returns GetExitCodeProcess. Direct Wine invocation can instead
            # report SIGKILL when wineserver reaps an already-exited process.
            process = subprocess.Popen(["wine", "start", "/exec", *args], env=env,
                                       stdout=output, stderr=subprocess.STDOUT)
            while process.poll() is None:
                shutil.copyfileobj(reader, sys.stdout.buffer)
                sys.stdout.buffer.flush()
                time.sleep(0.05)
            shutil.copyfileobj(reader, sys.stdout.buffer)
            sys.stdout.buffer.flush()
    if process.returncode:
        print(f"Wine exited with status {process.returncode}", file=sys.stderr)
    return process.returncode


if __name__ == "__main__":
    raise SystemExit(main())
