# Android native-module fixture

This app exercises four GI namespaces built for Android:

- `base`: C GObject properties, signals, asynchronous calls/errors and object
  finalization; its exported record differs between x86-64 and ARM64.
- `cpp`: C++ standard-library use and exceptions contained behind a C ABI.
- `vala`: a Vala GObject with properties, signals and asynchronous results/errors.
- `rust`: an explicit Rust C ABI calling the C dependency.

The source recipes intentionally list C++ before its C dependency. `depends_on`
orders the build and each recipe consumes the private SDK exports from earlier
recipes. The C dependency uses `stage: false`; the runtime closure still includes
it because the other modules depend on it.

With the core Android Ooblerg SDK staged at a local origin and the documented
host tools installed:

```sh
sqgipkg build --platform android --android-repository http://127.0.0.1:8787 --write-lock
```

This builds separate APKs for both ABIs. See
[`docs/packaging/android.md`](../../../docs/packaging/android.md) for NDK/JDK,
Rust targets, GI runners, native hook context and package selection.

`main.nut` runs the native suite and opens a GTK window. The button calls C++
from a GTK signal. `check_cli.nut` runs the same suite without a display under
the target inspection environment. Both write `native-result.json` in the
working directory; a failure in the CLI raises an error and returns nonzero.

For the emulator acceptance check, from the SQGI repository:

```sh
python3 tools/sqgipkg_tests/android_native_acceptance.py \
  --apk tools/sqgipkg_tests/android_native_project/dist-android-x86_64/org.sqgi.android.nativefixture-x86_64-debug.apk \
  --serial emulator-5554 --adb "$ANDROID_SDK_ROOT/platform-tools/adb" \
  --out .sqgipkg/validation/android-native-ui/x86_64
```

The driver checks installed provenance, native results and the ABI-specific
record size, taps the actual GTK button, verifies its callback and captures a
screenshot. It records device properties and whether the requested ABI uses
native translation. ARM64 on an x86-64 emulator is not physical ARM64 coverage.

Only this fixture's private telemetry files are reset. The Gallery is a separate
application ID and remains installed.
