# Android USB serial package check

This fixture uses the production `extras-gserial` 0.3 package and
`extras-sqgi-worker` from the Android catalog. It checks GObject introspection,
the packaged Java drivers, Android USB discovery, unavailable-device errors,
and the same operations in an isolated worker process.

Build and run it on an emulator without attached USB devices:

```sh
sqgipkg build --manifest tools/sqgipkg_tests/android_gserial_project/sqgipkg.json \
  --platform android --arch x86_64 --output /tmp/sqgi-serial-apk
python3 tools/sqgipkg_tests/android_gserial_project/check_serial.py \
  --adb "$ANDROID_SDK_ROOT/platform-tools/adb" --serial emulator-5570 \
  --abi x86_64 \
  --apk /tmp/sqgi-serial-apk/org.sqgi.android.gserialqualification-x86_64-debug.apk \
  --output /tmp/sqgi-serial-check
```

Repeat with `arm64-v8a` on an emulator that supports ARM64 applications. The
checker verifies that the production APK excludes the optional test backend
and that its worker exits cleanly. USB permission dialogs, adapter protocols
and actual transfers require separate tests with USB host hardware.
