Build this fixture with `sqgipkg build --platform android --arch x86_64` or
`--arch arm64-v8a`. It exercises isolated worker processes, Unicode arguments,
working directories, child environments, 256 KiB pipe transfers, cancellation,
script failures, concurrency limits and repeated service-slot reuse.

Run the APK on an explicitly selected test device:

```sh
python3 check_worker.py \
  --serial emulator-5570 \
  --abi x86_64 \
  --apk dist-android-x86_64/org.sqgi.android.workerqualification-x86_64-debug.apk \
  --output /tmp/sqgi-worker-result
```

Use `--adb /path/to/adb` when it is not on `PATH`. The checker installs the APK,
restarts this fixture, checks all 17 cases and waits for the worker processes
to disappear. It leaves the result window open. Reports include the packaged
runtime's ABI and the device's native bridge, so an ARM64 run through an x86_64
emulator's translation layer can be distinguished from an ARM64 device run.

To test a prebuilt package, use a copy of this fixture and replace its `native`
recipe with `{"name":"sqgi-worker","android_package":"extras-sqgi-worker"}`.
Select an SDK catalog containing that package. The same checker validates both
source-built and prebuilt worker APKs.

Add `--lifecycle` to send SIGABRT to a running worker, verify that the application
survives and can launch another worker, then send SIGKILL only to the application
and check that its worker disappears too. These tests use dedicated fixture PIDs;
they do not use `am force-stop` to simulate parent death. Native crash logs and
the worker's heartbeat are recorded. An unexpected worker crash reports abnormal
termination with an unknown signal; forced termination through the API reports
SIGKILL. This mode closes the fixture at the end.
