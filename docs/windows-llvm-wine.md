# Windows LLVM JIT and kernel validation

## Results: 2026-09-25

The Windows x86-64 runtime was cross-compiled with both LLVM backends enabled
and executed under Wine 9.0. This was actual LLVM execution: the default-JIT
test checks native execution traces, the C++ LLVM test checks the backend and
successful native entries, and the kernel tests execute generated code against
reference results.

| Check | Result |
| --- | --- |
| Windows `jit` / `kernel` CTest selection, excluding packaging | 60/60 passed |
| Linux equivalent selection after the changes | 60/60 passed |
| Windows forced-JIT performance correctness regression | 30/30 separate runs passed |
| Windows matrix recurrence, default settings | 30/30 separate runs passed |
| JIT defaults, explicit enable, explicit disable | Passed |

The selection excludes `kernel_packaging`: its Python driver expects a native
host executable and tests deployment, rather than execution under a cross-build
emulator. Native Windows CI runs that packaging test separately. These results
do not establish a native-Windows pass; the Windows workflow now runs the full
JIT/kernel selection and repeats the performance and matrix regressions 30
times each to cover that environment too. It checks that both LLVM backends
remain enabled in the default CMake configuration and saves the test logs and
configuration as the `windows-llvm-test-logs` artifact, including on failure.

The tested toolchain was MinGW GCC 13-win32, with MSYS2 mingw64 GLib 2.88.1,
GI 1.86.0, cairo 1.18.4 and libffi 3.5.2. The LLVM runtime was the official
[LLVM 18.1.8 Windows x64 distribution](https://github.com/llvm/llvm-project/releases/tag/llvmorg-18.1.8),
using its `LLVM-C.dll` through a MinGW import library. Compilation used LLVM
18.1.3 C headers from the Linux development package. Only the LLVM C API crosses
that boundary; this run did not validate a MinGW-built LLVM DLL. Native Windows
CI builds LLVM 18.1.8 and its headers with its own toolchain.

## Failures found and fixed

1. **MinGW C++ test link failure:** `libsqgi.dll` auto-exported the private
   `_Unwind_Resume` from its static `libgcc_eh.a`. C++ clients also linked their
   own unwinder, causing a duplicate definition. The DLL now excludes that
   archive from automatic exports.
2. **Intermittent LLVM process abort:** the forced-JIT performance test failed
   with `IMAGE_REL_AMD64_ADDR32NB relocation requires an ordered section layout`.
   LLVM 18's default allocator can place a later COFF section below its cached
   image base or outside the relocation's address range. The shared Windows
   helper allocates each object's sections in increasing addresses within one
   256 MiB virtual reservation, committing only used pages. Code becomes RX,
   constants R, and mutable data RW. ORC destruction releases the reservation.
   All SQGI LLVM compilation paths use the helper.
3. **False matrix timeout:** the script printed its success message and SQGI
   exited, but Wine's `explorer.exe` retained CTest's stderr pipe. The pipe was
   observed in both processes' `/proc` descriptors. The Wine runner captures
   output in a temporary file and forwards it when the foreground executable
   exits, so a background Wine service cannot keep CTest waiting.

LLVM 18's C API cannot enable the custom object layer's automatic claiming of
codegen-created COFF symbols. On Windows the helper therefore emits a complete
object before adding it to LLJIT. Its symbol set includes floating constant
symbols such as `__real@...`. The existing object transform, including the
kernel object-size budget, still runs. Linux uses the original LLJIT IR path.

`sqgi_test_llvm_jit_memory` covers generated integer and floating-point code,
external calls, mutable and constant data, Windows page permissions, section
address range, and repeated object creation/removal with other objects live.
The existing correctness, guard, ownership, math and kernel tests are retained.

LLVM implementation references:

- [LLVM 18 COFF relocations and cached image base](https://github.com/llvm/llvm-project/blob/llvmorg-18.1.8/llvm/lib/ExecutionEngine/RuntimeDyld/Targets/RuntimeDyldCOFFX86_64.h)
- [LLVM 18 default LLJIT object-layer configuration](https://github.com/llvm/llvm-project/blob/llvmorg-18.1.8/llvm/lib/ExecutionEngine/Orc/LLJIT.cpp)
- [LLVM 18 memory-manager C callbacks](https://github.com/llvm/llvm-project/blob/llvmorg-18.1.8/llvm/include/llvm-c/OrcEE.h)

## Repeating the tests

Use a MinGW x86-64 CMake toolchain configured against a Windows GLib/GI/cairo
sysroot, plus LLVM 18 C headers and a matching Windows import library. Linux
LLVM shared libraries cannot be linked into the Windows executable. A native
MinGW LLVM SDK can be built with `tools/build-llvm18.cmake` on Windows.

For an official LLVM Windows DLL, a MinGW import archive can also be generated
from its exports with `llvm-readobj --coff-exports` and
`x86_64-w64-mingw32-dlltool -D LLVM-C.dll -d LLVM-C.def -l libLLVM-C.a`.
The DEF file must contain `LIBRARY LLVM-C.dll`, `EXPORTS`, and the exported
names, one per line. Keep the distribution's MSVC runtime DLLs beside it.

Set `WINEPREFIX` to a dedicated absolute directory and initialize it with
`WINEARCH=win64 wineboot -i`. Use an active display, or run the commands inside
an Xvfb session. Set `WINEPATH` to the semicolon-separated **Windows** paths of
the LLVM and sysroot `bin` directories, and `GI_TYPELIB_PATH` to the Windows
path of the sysroot's `lib/girepository-1.0`. `winepath -w` converts host paths.
The runner assumes the isolated prefix's default `Z:` filesystem mapping.
Keep the Wine server warm with `wineserver -p` before the suite.

```sh
cmake -S . -B build-windows-llvm-wine -G Ninja \
  -DCMAKE_TOOLCHAIN_FILE="$SQGI_WINDOWS_TOOLCHAIN" \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_CROSSCOMPILING_EMULATOR="$PWD/tools/run_wine_test.py" \
  -DSQ_ENABLE_JIT=ON -DSQGI_BYTECODE_JIT_BACKEND=LLVM \
  -DSQGI_ENABLE_KERNELS=ON -DSQGI_KERNEL_BACKEND=LLVM \
  -DSQGI_LLVM_INCLUDE_DIR="$SQGI_LLVM_HEADERS" \
  -DSQGI_LLVM_LIBRARY="$SQGI_LLVM_IMPORT_LIBRARY" \
  -DSQGI_WINDOWS_GUI=OFF -DSQGI_BUILD_PACKAGER_GUI=OFF
cmake --build build-windows-llvm-wine --parallel
ctest --test-dir build-windows-llvm-wine -L 'jit|kernel' \
  -E kernel_packaging --output-on-failure --timeout 30

# Additional repeats for an intermittent crash:
ctest --test-dir build-windows-llvm-wine \
  -R '^(sqgi_test_jit_perf_correctness_runtime|sqgi_demo_kernel_matrix_recurrence)$' \
  --repeat until-fail:30 --output-on-failure --timeout 30
```

After testing, `wineserver -k` with that same dedicated `WINEPREFIX` stops its
services. The investigation's local SDK, Wine prefix, preserved pre-fix binaries
and logs are under `/tmp/sqgi-windows-llvm`; the build is
`build-windows-llvm-wine`. Those generated artifacts are not source files.
