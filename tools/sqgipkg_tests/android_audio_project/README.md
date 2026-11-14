# Android audio playback test

This app generates a short WAV tone, plays it through `autoaudiosink`, then
repeats playback in an isolated SQGI worker. It checks that both pipelines use
`openslessink`, reach end of stream at the expected time, and release the worker.
The tone plays quietly through the device's current audio output.

The Android media packages must include the OpenSL ES and autodetect plugins.
Build and test on an explicitly selected device:

```sh
sqgipkg build --platform android --arch x86_64
python3 check_audio.py --adb adb --serial emulator-5570 --abi x86_64 \
  --apk dist-android-x86_64/org.sqgi.android.audioqualification-x86_64-debug.apk \
  --output audio-results
```

Use `arm64-v8a` for an ARM64 device or an emulator with ARM translation.
The checker records the package hash, runtime ABI, pipeline results, screenshot
and Android audio diagnostics. Emulator results establish software playback;
speaker routing and audible output still need checking on physical hardware.
