#!/usr/bin/env bash
set -euo pipefail

BUILD_DIR="${BUILD_DIR:-build}"

args=()
if [[ -n "${MESON_CROSS_FILE:-}" ]]; then
  args+=(--cross-file "${MESON_CROSS_FILE}")
fi

meson setup "${BUILD_DIR}" "${args[@]}" --wipe
meson compile -C "${BUILD_DIR}"
