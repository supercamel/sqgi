#!/usr/bin/env bash
set -euo pipefail

BUILD_DIR="${BUILD_DIR:-build}"
mkdir -p "${BUILD_DIR}"

if [[ -n "${MESON_CROSS_FILE:-}" ]]; then
  echo "native Rust fixture does not support cross builds yet" >&2
  exit 1
fi

cargo rustc --locked --release --manifest-path Cargo.toml --target-dir "${BUILD_DIR}/cargo-target" -- \
  -C link-arg=-Wl,-soname,libsqrust-1.0.so
cp "${BUILD_DIR}/cargo-target/release/libsqrust.so" "${BUILD_DIR}/libsqrust-1.0.so"

LD_LIBRARY_PATH="${BUILD_DIR}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" \
g-ir-scanner \
  --namespace=SqRust \
  --nsversion=1.0 \
  --identifier-prefix=SqRust \
  --symbol-prefix=sq_rust \
  --include=GObject-2.0 \
  --pkg=gobject-2.0 \
  --library=sqrust-1.0 \
  --library-path="${BUILD_DIR}" \
  --c-include=sq-rust.h \
  --output="${BUILD_DIR}/SqRust-1.0.gir" \
  sq-rust.h

g-ir-compiler "${BUILD_DIR}/SqRust-1.0.gir" \
  --output "${BUILD_DIR}/SqRust-1.0.typelib"
