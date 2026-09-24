# Cairo binding repair — 2026-09-24

Implemented and tested against base revision
`fded3cc5e96ccd06ed4268ffc4a3ee25c048123f`. System installation was not changed.
Unrelated member-cache work was excluded from the repair.

## Changes

- Native Context, Surface and Pattern wrappers have distinct type tags. Wrong
  arguments and receivers raise Squirrel errors before native pointer casts.
  This also applies to Cairo arguments passed through GI, including Gdk.
- Added `Context.get_source()`, `Pattern.set_extend()` and `Pattern.get_extend()`.
  The source getter owns one reference to the actual pattern.
- Native methods enforce argument counts; integer arguments reject floats and
  booleans. Extension modes are validated before narrowing, and image dimensions
  cannot wrap when converted to native integers.
- Runtime registration and sqgicheck share a native API declaration. The checker
  tracks factory/getter return types, method names and argument counts.
- Fixed a callback leak found by the GTK sanitizer test: a legacy caller's
  explicit destroy callback is replaced by the binding's ownership notifier;
  its unused FFI wrapper is now released after registration.

The prior executable aborted on `cr.set_source(surface); cr.paint()` and
segfaulted on `Context.create(pattern)`. Both now raise catchable errors.
The new weak-reference regression for the unused destroy callback fails on the
installed old runtime and passes on the repaired build.

## Validation

Linux x86_64, Cairo 1.18.0, GTK 4.14.5. The local Release build uses the x64 JIT;
the Cairo script is tested both interpreted and with the JIT threshold set to 1.
The separate Debug sanitizer build enables ASan, UBSan and leak detection.

| Check | Result |
| --- | --- |
| Selected binding, callback, marshalling, GValue and checker CTests | 25 passed |
| Cairo, callback and checker CTests under sanitizers | 9 passed |
| Existing GdkPixbuf recipe tests | 69 assertions passed |
| Existing GTK text-buffer test | Passed |
| Existing GStreamer recipe tests | 46 assertions passed |
| Shell syntax and `git diff --check` | Passed |

New coverage includes mismatched and uninitialized wrappers, invalid argument
counts/types/ranges, source identity, save/restore, GC in both ownership
directions, repeated getters with exact native reference counts, distinct-color
pixels for all extension modes, GdkPixbuf scaling with alpha and clipping,
boxed Cairo GValues, both GTK callback-registration forms, and checker errors.

Only the GTK integration test suppresses Fontconfig allocations whose stack
contains `FcInit`; Cairo reference-count and raster tests run without leak
suppression. Test success is determined by process exit status, so a success
message cannot mask a sanitizer error at shutdown.

The shell runners now include the Cairo/callback tests and invoke the native,
GTK and forced-JIT CTest cases. Windows CI includes the headless regressions;
Windows and ARM64 were not executed here. This is targeted validation, not a
full packaging run.

## Tested executable

Path: `/home/sam/Programming/sqgi/build/sqgi`

SHA-256: `a0165280b5bc0892c96f92d7689a7a73bff1159a5ccce818b7c3134145336f39`

`/usr/bin/sqgi` remains the previous executable. Validation used the repaired
local build.

See the [native Cairo API](api/cairo.md) for the public contracts and test entry
points. The sanitizer build used for this report is `/tmp/sqgi-cairo-asan`.
