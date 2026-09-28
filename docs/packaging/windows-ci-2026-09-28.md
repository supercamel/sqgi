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
