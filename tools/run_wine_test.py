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
    # false timeout. Capture in a file and forward output on foreground exit.
    with tempfile.TemporaryFile() as output:
        result = subprocess.run(["wine", *args], env=env,
                                stdout=output, stderr=subprocess.STDOUT)
        output.seek(0)
        shutil.copyfileobj(output, sys.stdout.buffer)
    return result.returncode


if __name__ == "__main__":
    raise SystemExit(main())
