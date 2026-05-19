#!/usr/bin/env bash
set -euo pipefail

BUILD_DIR="${BUILD_DIR:-build}"
MESON_ARGS=()

if [[ -n "${MESON_CROSS_FILE:-}" ]]; then
  MESON_ARGS+=(--cross-file "${MESON_CROSS_FILE}")
fi

if [[ -d "${BUILD_DIR}" ]]; then
  meson setup "${BUILD_DIR}" "${MESON_ARGS[@]}" --wipe
else
  meson setup "${BUILD_DIR}" "${MESON_ARGS[@]}"
fi

meson compile -C "${BUILD_DIR}"
g-ir-compiler "${BUILD_DIR}/SqVala-1.0.gir" --output "${BUILD_DIR}/SqVala-1.0.typelib"
