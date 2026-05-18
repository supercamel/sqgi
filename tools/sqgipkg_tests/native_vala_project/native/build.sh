#!/usr/bin/env bash
set -euo pipefail

BUILD_DIR="${BUILD_DIR:-build}"

if [[ -d "${BUILD_DIR}" ]]; then
  meson setup "${BUILD_DIR}" --wipe
else
  meson setup "${BUILD_DIR}"
fi

meson compile -C "${BUILD_DIR}"
g-ir-compiler "${BUILD_DIR}/SqVala-1.0.gir" --output "${BUILD_DIR}/SqVala-1.0.typelib"
