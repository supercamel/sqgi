# sqgipkg version 2 demos

The demo manifests use `schema_version: 2`. C and Vala libraries use shared
Meson recipes; the runtime recipe builds SQGI from this checkout. The Rust
example demonstrates the custom-build escape hatch. The standalone C entry
builds an executable without bundling SQGI. ImageViewer packages an existing
runtime and demonstrates a minimal GTK manifest.

From the repository root:

```sh
build/sqgi tools/sqgipkg explain \
  --manifest tools/sqgipkg_tests/native_vala_project/sqgipkg.json
build/sqgi tools/sqgipkg build \
  --manifest tools/sqgipkg_tests/native_vala_project/sqgipkg.json \
  --no-linux-deb-download --output /tmp/sqgipkg-vala --smoke-test ""
```

`--no-linux-deb-download` tests against installed host development libraries.
Omit it to use the declared private dependency sysroot. The demo runtime's
`HEAD` plus local `source` intentionally exercises this checkout; release
applications should select a pinned runtime revision.

Run all packaging regressions and retain the generated AppImages and logs:

```sh
SQGIPKG_KEEP_TEST_WORK=1 CMAKE_BUILD_PARALLEL_LEVEL=4 \
  bash tools/sqgipkg_tests/run_tests.sh build/sqgi
```

The test prints its temporary output directory. It packages the actual demo
manifests, including the GTK/GStreamer overlay, and checks their outputs.

## Validation on 2026-09-15

| Demo | Linux AppImage smoke test | Windows directory under Wine |
| --- | --- | --- |
| NativeGI | Greeting and sum = 42 | Passed |
| NativeVala | Async results, progress and expected error | Passed |
| NativeRust | Counter = 42 and two signals | Not exercised |
| NativeEntryProject | Native entry and argument forwarding | Passed |
| GtkWidgetThemes | Bundled theme and clean GTK exit | Not exercised |
| GtkGstOverlay | Video pipeline and timed exit | Not exercised |
| ImageViewer (`demo/gtk4`) | Packaged image resource loaded | Not exercised |

The full packaging suite and 14 focused ergonomics regressions passed. Windows
packages were cross-built with an existing MinGW64 sysroot and executed under
Wine; these are not actual Windows or ARM64 acceptance results. The overlay
used its GTK fallback renderer because `gtk4paintablesink` was unavailable.

The demo runs exposed and fixed executable-only recipe validation, unnecessary
runtime test-target builds, and a MinGW `_inline` macro collision in the JIT
write log. The write-log unit test passed. The broader JIT member-plan test
failed identically in an unchanged HEAD checkout; that pre-existing failure
remains outside the packaging migration.
