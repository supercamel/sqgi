# Combined Android catalog fixture

This app selects GStreamer and GWorldScene through `platforms.android.packages`.
It creates a GWorldScene widget and receives eight synthetic RGBA video frames
through GStreamer. It needs no camera permission or network connection at runtime.

```sh
sqgipkg build --platform android --arch x86_64 --write-lock
sqgipkg install --platform android --arch x86_64 --android-serial emulator-5564
sqgipkg run --platform android --arch x86_64 --android-serial emulator-5564
adb -s emulator-5564 shell run-as org.sqgi.test.catalog cat files/data/catalog-result.json
sqgipkg build --platform android --arch x86_64 --locked --no-android-download
```

The result must contain `passed: true`, `frames: 8` and `world_realized: true`.
The build lock's `android-catalog` and `android-modules` inputs must refer to the
same repository URL and index checksum.
