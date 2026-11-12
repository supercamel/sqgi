This Android app runs the JIT correctness and typed kernel suites through a
native SQGI entry point. Build it with a source runtime and
`platforms.android.compiler` set to `"llvm"`, using a catalog that provides
`compiler-llvm18`.

Run the host checker against a dedicated test device or emulator:

```sh
python3 check_compiler.py --serial emulator-5570 --abi x86_64 \
  --apk dist-android/org.sqgi.android.compilerqualification-x86_64-debug.apk \
  --output /tmp/android-compiler-check
```

Use `--disable-jit` to test interpreter fallback with typed kernels available.
For a separate build with `runtime.jit` set to `false`, use `--kernels-only`.
That check keeps `SQGI_JIT=1` in the environment and verifies that no bytecode
JIT code executes, while the typed kernel suites still pass.

The checker installs the APK and clears this test app's development overlay
and previous test results. It verifies the packaged native libraries, compiler
package lock, application session and execution trace, and saves a screenshot.
Use `--abi arm64-v8a` for an ARM64 APK. Record whether ARM64 runs on hardware or
through an emulator's native translation layer when reporting results.
