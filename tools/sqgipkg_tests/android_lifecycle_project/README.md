# Android application shutdown regression

This native GTK application creates a real GL context, closes its window,
returns from the main entrypoint and records its explicit shutdown hook.
The checker verifies that cleanup completed and the process exited without
a crash, Android ANR or system kill. It also checks that process-wide exit
handlers did not run while Android framework threads were still alive.

Build with the Android runtime being tested, then choose a test device:

```sh
sqgipkg build --platform android --arch x86_64
python3 check_exit.py dist-android-x86_64/org.sqgi.NativeExit-x86_64-debug.apk results \
  --serial emulator-5564
```

Use `--adb` or `--sqgipkg` if those commands are outside `PATH`.
The checker installs and runs the dedicated `org.sqgi.NativeExit` app.
For a negative control against the original GTK glue, pass
`--expect-original-failure`; that requires an unsafe global exit handler,
native crash, ANR or system kill to be observed.

The original glue can block Android's UI thread during window destruction
after GTK's event loop has stopped. Its `exit()` path can also destroy locks
that Android rendering threads still use. A successful application report
alone does not prove successful process termination.
