# Windows packaging CI corrections — 28 September 2026

The reported Cairo/callback/checker CTest step passed. The following failures
were in the subsequent 43-case packaging ergonomics suite:

| Failure | Cause | Correction |
| --- | --- | --- |
| Local runtime without revision | Checkout on D:, temporary manifest on C:; `relpath` cannot cross Windows volumes. | Put the source fixture beside its manifest and retain relative-path resolution assertions. |
| Indirect sysroot link | Presence of `cc` and `readelf` did not establish an ELF toolchain; MinGW emits PE. | Run this Linux ELF regression on Linux; keep the real linker/RPATH assertions there. |
| Ooblerg LLVM import library | Assertion required `/` in a host-native path. | Normalize separators when inspecting the command argument. |
| Linux LLVM target includes/library | Expected string concatenation disagreed with GLib's native Windows separators. | Build expected paths with GLib while retaining exact target sysroot and architecture assertions. |
| NSIS bootstrap and spaced payload | Stable Windows NSIS lacks `zlib-amd64-unicode`, although this Linux installation has it. | Prefer amd64 when its stub exists, otherwise compile the standard x86 Unicode bootstrap. |

A 32-bit installer can deploy the unchanged x86_64 application payload. Both
installer and uninstaller now require 64-bit Windows and select the 64-bit
registry view. The regression compiles the selected bootstrap and a forced
fallback, inspecting PE headers and retaining the spaced-payload compilation
check. Compiler output is included on failure instead of hidden by check=True.
This does not change the target architecture or claim 32-bit application support.

Validation:

- All 43 ergonomics cases pass on Linux, including actual NSIS compilation of
  amd64 and x86 fallback executables.
- Windows SQGI and Windows Python under Wine pass the three path regressions;
  the Linux linker case correctly skips. The test uses a Z: source checkout and
  a C: temporary manifest, exercising the original cross-volume setup.
- The reported six Cairo/callback/checker cases plus both new Secret/hash-table
  cases pass on Linux (eight focused CTest cases).
- The Secret change separately passes seven focused cases under ASan/UBSan with
  leak detection, including isolated real Secret Service operations.

Native GitHub Windows execution is a separate CI result; Wine is not a native
Windows runner. No system installation was changed.

## Follow-up: Windows short-name paths and CI coverage

Run 36369904266 passed compilation, LLVM/JIT/kernel checks and the six native
Cairo/callback/checker tests. The remaining ergonomics failure compared the
canonical `C:/Users/runneradmin/...` source path against the equivalent
`C:/Users/RUNNER~1/...` temporary path. This was a test assertion defect, not
failure to resolve the requested source directory.

The source check now uses filesystem identity (`Path.samefile`). A regression
supplies an actual Windows 8.3 alias (or a POSIX symlink on Linux), verifies the
intended directory, and rejects a distinct directory with the same leaf name.
Windows volumes with short-name creation disabled report that case as skipped.
Manifest fixtures canonicalize their temporary root before comparing paths to
outputs that do not exist yet. Relative-path and cross-volume coverage remain.

The CI changes address the feedback loop as well:

- `ctest -L packaging` now includes the previously unlabelled ergonomics suite.
- An interpreter-only native Windows preflight runs CLI and manifest checks
  before the approximately 42-minute LLVM bootstrap. It is additional coverage;
  the default LLVM-enabled runtime, kernels and repeated lifecycle checks remain.
- Independent post-build suites run after another suite fails. They still fail
  the job; there is no `continue-on-error`. CTest also runs all selected suites.
- Every CTest group retains its own log and JUnit result; native package execution
  retains its log. Diagnostic upload runs even on failure. Python uses UTF-8.

Local reproduction after configuring/building SQGI:

```sh
python3 tools/sqgipkg_tests/test_ergonomics.py build/sqgi -v
ctest --test-dir build -L packaging --output-on-failure --no-tests=error
```

On native Windows, substitute `python` and `build/sqgi.exe`. Use the workflow's
CTest selectors for its exact groups. Test candidate commits on a branch first;
merge them to master only after the native Windows workflow succeeds for that
exact commit. A Linux pass or an older green Windows run is insufficient.

Enable the checked-in local guard with `git config core.hooksPath .githooks`.
It allows candidate-branch pushes, but rejects master updates whose latest native
Windows run is missing, pending, failed or cancelled. API errors also block the
update. It checks the destination repository and exact proposed SHA, not whichever
branch happens to be checked out. Run the same check manually with
`python3 tools/check_windows_ci.py HEAD`. Use a fast-forward promotion of the
tested candidate so the SHA remains unchanged. Git hooks are local and bypassable;
server-side required checks are still needed to enforce this for every contributor.

The first candidate's native run (36377642160) passed the original path case,
LLVM/JIT/kernel suites, CLI regressions, GUI launcher, relocated Windows payload
execution and NSIS compilation. Running the previously hidden delivery suite
revealed a second defect: `JOB-real-package` referenced a deliberately untracked
private study report. The inventory now labels this manual acceptance and points
to its checked-in procedure. Traceability rejects dependencies on private report
files, and delivery checks are included in the early preflight. Clean-source
validation must not borrow the developer's local evidence to pass.
