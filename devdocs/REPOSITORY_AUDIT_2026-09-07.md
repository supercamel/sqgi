# Repository audit — 7 September 2026

Audited working tree based on `01192f8`, including the changes already present
when the audit started. Those existing changes have been preserved. The scope
covered the C runtime and GI boundary, async and VM lifetimes, bundled Squirrel
and experimental JIT integration, sqgicheck, sqgipkg, build/install rules, test
entry points, and supporting documentation.

The main correctness problems were lifetime and ownership errors that ordinary
single-VM tests did not expose. The fixes below include eight new CTest cases
across six new test files. Existing failing tests also provide regression
coverage for GVariant and JIT failures. Remaining findings are explicitly open;
the passing results are not a claim that every GI signature or platform works.

## Verification

Tests ran on Linux x86-64, Ubuntu 24.04, GCC 13.3, GLib 2.80,
GIRepository 1.80, libffi 3.4.6 and Cairo 1.18. Builds were isolated under
`/tmp/sqgi-audit-20260907`; the existing project build and installed binaries
were not replaced.

| Configuration | Initial result | Result after fixes |
| --- | --- | --- |
| Debug, JIT disabled | 66/67 CTests passed | 74/74 passed, excluding the packaging integration test |
| Debug, ASan + UBSan, JIT enabled | 60/68 CTests passed | 75/75 passed, excluding the packaging integration test |
| sqgicheck dedicated coverage gate | Not measured in the initial run | Passed: 100% adjusted lines, functions and branches |
| sqgicheck mutation gate | Not measured in the initial run | All five deliberate mutants killed |

The initial packaging integration test failed in both configurations with an
HTTP 404 while downloading dependencies for the native-entry fixture. Real
AppImages and earlier Linux staging checks had succeeded before that failure.
It was excluded from the final runtime runs; its downstream Windows and native
project cases have **not** been established as passing by this audit.

Six additional recipe tests outside CTest were exercised under ASan without
leak suppressions. After the list-ownership fix, GLib, Gio, GdkPixbuf, Gtk
TextBuffer and Soup passed. GStreamer still reports 1,907 leaked bytes across
20 allocations and remains an open finding. These extra runs are not included
in the CTest totals above.

The checker coverage percentages use its existing source-pinned exclusion
policy: two lines and 81 branch outcomes are excluded. This is a useful gate,
but differs from unadjusted compiler coverage. The mutation gate covers five
specific faults: arity, state merging, resolution precedence, metadata category
and exit status; it is not a mutation score over arbitrary changes.

## Correctness failures fixed

Priority P1 means a reproducible crash, invalid memory access, or wrong result.
P2 means a reproducible leak or a build/test integration defect.

| Priority | Failure and evidence | Fix and regression coverage |
| --- | --- | --- |
| P1 | A GI callback registered by an async function retained the coroutine VM after it was freed. ASan reported use-after-free in `sq_gettop`. | [GI callbacks](../src/sqgi_gi.c) retain the root VM and are invalidated before shutdown. [Callback lifetime regression](../test/test_callback_async_lifetime.nut) registers an idle callback, finishes the coroutine, collects garbage, then dispatches it. |
| P1 | Creating a second VM reused a process-global Task delegate belonging to the first. Async bindings also removed the wrong hash key, leaving stale entries. | [Async state](../src/sqgi_async.c) and the Task delegate now belong to each VM registry; bindings remove the child VM key before releasing references. [Lifecycle tests](../test/c/test_vm_lifecycle.c) recreate VMs and use Tasks in each. |
| P1 | Pending timers, continuations, wakeups and native callbacks could access a closed VM. Old signal connections could become active again when an allocator reused a VM address. | VM shutdown destroys its async sources while references can still be released, invalidates native callbacks and signals, and handles the closing-address marker on VM creation. Lifecycle tests drain pending work after closure and retain an old native signal source across VM recreation. |
| P1 | Subclass vfunc overrides retained the registering coroutine and permanent GTypes could call into a VM after closure. A new native test reproduced use-after-free in the vfunc trampoline. | [Subclass overrides](../src/sqgi_subclass.c) use the root VM. Shutdown releases script handlers and makes surviving vfunc trampolines call their native parent implementation. The lifecycle subclass case tests calls after both coroutine completion and VM shutdown. |
| P1 | Returned C arrays treated an argument-index annotation as an element count, and read packed integers as pointer-sized elements. A three-element integer list triggered an ASan buffer overread. | [Marshaling](../src/sqgi_marshal.c) uses companion runtime lengths, fixed-size metadata and native scalar widths. Existing numeric-input support now also allocates valid empty buffers. [Array regressions](../test/test_numeric_arrays.nut) cover empty, single and varying-length integer arrays, doubles and strings. |
| P1 | Input-array cleanup freed storage already consumed or reallocated by a successful transfer-full call such as `GLib.environ_setenv`. | Successful invocation preserves transferred ownership. The array regression checks the returned environment. Ownership on native error paths and other input shapes still needs a broader matrix, as described below. |
| P1 | `_tojson()` returning itself, or another instance in a cycle, recursively entered the writer without increasing nesting depth and overflowed the native stack. | [JSON serialization](../src/sqgi_json.c) accounts for instance conversions in its depth limit. [Cycle regressions](../test/test_json_instance_cycles.nut) require bounded errors for both cycle shapes and preserve valid conversion behavior. |
| P1 | Native JIT code treated a changing loop index as constant; the existing array-write checksum was 462237 instead of 461837. Loop exits also overwrote object slots without releasing their references, causing GC assertions. | [JIT compilation](../Squirrel3/squirrel/jit/sqjit.cpp) invalidates constants written across loop backedges and uses reference-aware assignments at exits, with register spilling where needed. [Loop regression](../test/test_jit_loop_regressions.nut) varies arrays and lengths. All ten JIT-labeled cases pass in the native JIT build. |
| P2 | JIT-enabled sqgicheck compiled against a different internal Squirrel object layout than the linked runtime: 51 engine assertions failed and CLI diagnostics disappeared. | [CMake](../CMakeLists.txt) supplies the matching JIT definition to runtime consumers. The separate bundled interpreter target keeps its own consistent layout. Existing checker engine and CLI tests pass in the JIT configuration. |
| P2 | Floating GVariant results leaked: the existing variant test reported 814 bytes in 22 allocations. | The marshaller consumes floating variants correctly while converting them into Squirrel values. Existing variant tests now pass LeakSanitizer. |
| P2 | Transfer-full GList/GSList returns freed list nodes but retained element ownership. Gio and Soup recipe tests exposed the leak. | List elements now receive the declared ownership transfer. The new [native ownership test](../test/c/test_list_ownership.c) checks element finalization for none, container and full transfer. Gio and Soup recipe runs now pass without suppressions. |

GTypes and their native trampoline storage remain process-lifetime allocations
because registered static GTypes cannot be unregistered. Script handlers are
released at VM shutdown. Deferred native callback storage must similarly remain
valid until the native API dispatches its one-shot callback or destroy notifier.
These fixes preserve the existing requirement that VM operations run on their
owning thread; they do not add general concurrent VM access.

## Open findings and recommended work

### 1. The installed embedding SDK cannot compile a basic consumer — P2, reproduced

[CMake](../CMakeLists.txt) installs public SQGI headers but disables the bundled
Squirrel installer and never installs Squirrel's public headers. Including
`sqgi_vm.h` from a fresh staged installation fails with
`fatal error: squirrel.h: No such file or directory`.

Also, [sqgi.pc.in](../sqgi.pc.in) retains `/usr/local` when installation is
relocated with `cmake --install --prefix`; querying the staged `.pc` file
confirmed that prefix. The installed `sqgi_gi.h` includes `ffi.h`, but libffi is
absent from the pkg-config requirements.

Install the required Squirrel headers, make pkg-config metadata match the
supported installation/relocation model, and add an external C consumer that
compiles, links and runs using only the staged installation. The current
[install test](../tools/sqgicheck_tests/install.sh) exercises executables and
does not compile an embedder.

### 2. GI validation and ownership remain incomplete — P2, partly reproduced

The concrete fixes above do not cover the full GI type/direction/ownership
matrix. The highest-value next cases are:

- **Byte-buffer instances:** `GLib.base64_encode(GLib.Bytes.new("abc"))`
  returns null with a GLib critical. Input byte arrays accept strings, while
  auto-length inference in `sqgi_gi.c` treats arbitrary byte-array instance
  arguments as `GBytes` without validating their type. Validate types before
  dereferencing and either support GBytes consistently or reject the argument.
- **Transfer-full values on error:** array cleanup distinguishes successful
  calls from failures, but a native function may consume input before reporting
  a GError. Callback cleanup after native errors needs the same explicit
  ownership audit. These paths need fixture APIs that consume input and then
  fail; they have not been proven safe by the new success-path regression.
- **Other container and element shapes:** GHashTable ownership, GArray data,
  enum arrays, inline record arrays, and transfer-full input object/byte arrays
  need dedicated support and tests. Unknown array shapes currently often become
  null or empty values. Prefer explicit unsupported-signature errors to silent
  conversion.
- **Repeated boxed references:** `sqgi_gi_object.c` tracks ownership with one
  entry per native pointer. A ref-returning method can legitimately produce
  multiple owned wrappers for the same pointer; the current map cannot express
  those separate references. The code comments already acknowledge the resulting
  leak, but describe collisions as rare. Add same-pointer reference tests and
  track ownership per wrapper or with an appropriate count.
- **Callback return types:** the generic callback trampoline prepares float and
  double ABI types but its return conversion falls through to a null/zero
  pointer write. Add signature fixtures for numeric returns and out/inout
  callback arguments, or reject unsupported signatures during registration.

These observations come from source inspection except for the explicitly
described byte-buffer reproduction and leak tests. They should not be read as
claims that every listed API shape was executed or that every failure has the
same root cause.

### 3. GStreamer leaks need investigation; current suppressions are too broad — P2

The unsuppressed recipe run reports 1,907 bytes in 20 allocations, including an
owned GError copied by `gst_message_parse_error` and allocations associated with
pipeline construction. The generic `GI_TYPE_TAG_ERROR` conversion copies error
fields without honoring full-transfer cleanup. Native invocation error paths
also deserve inspection when an API returns an object alongside an error.

[test/lsan.supp](../test/lsan.supp) suppresses broad allocation stacks including
`gst_parse_launch`, factory creation and `gst_structure_id_get_valist`. Such
rules can hide binding ownership bugs as well as library caches. Reduce these
to small native reproductions before classifying them as unavoidable library
leaks. The audit did not suppress them to obtain a passing result.

### 4. Test entry points cover different sets of behavior — P2, verified

- [test/run_tests.sh](../test/run_tests.sh) selects 20 runtime scripts, whereas
  [test/run_tests_asan.sh](../test/run_tests_asan.sh) selects 14 despite describing
  a full suite. Neither list contains all CTest regressions or the native tests.
- CTest omits six recipe tests exercised separately in this audit. Gio and Soup
  leaks were found in that omitted group. Make CTest the shared test manifest,
  with dependency checks and labels for optional recipe integrations.
- The `check` build target depends on only the CLI, checker and checker engine
  test. It does not build all native CTest executables. A dry run from the
  checker-only build scheduled CTest without building those missing binaries.
  Track native test targets as dependencies of `check`.
- JIT-labeled script tests run through the interpreter when the JIT is compiled
  out. Keep an explicit JIT-enabled lane that verifies actual native execution.
- No repository CI workflow was found. Add interpreter and ASan/UBSan/JIT lanes,
  checker gates and an installed-SDK smoke test. External CI, if present, was
  not inspected.

### 5. Packaging tests and downloads need better reproducibility — P2

The monolithic [packaging test](../tools/sqgipkg_tests/run_tests.sh) failed after
successful native-entry AppImage execution, on the next native project build's
dependency download. The failing URL was hidden in a temporary substep log that
the cleanup trap removed. Preserve failed substep logs and report the URL and
package identity on download failures.

Split deterministic module/platform/path tests from network and native-build
integration tests, so an early download failure does not prevent later Windows,
Rust, Vala and other fixtures from running. The initial run did exercise the
module and platform helper tests before failing.

[linux_deps.nut](../tools/sqgipkg_lib/linux_deps.nut) indefinitely reuses package
indexes unless refresh is explicitly requested. Stale metadata is a plausible
cause of a missing package archive, but this audit did not establish the exact
cause of the observed 404. Refresh-and-retry for stale package URLs would improve
recovery. AppImage tooling/runtime downloads use moving `continuous` artifacts;
pin versions for release tests. Direct repository archive downloads also need
authenticated metadata and archive digest verification instead of relying only
on successful transport and extraction.

### 6. Platform and lifecycle coverage should expand — review limitations

Native Windows and AArch64 execution were not available in this audit. The
x86-64 JIT findings cannot establish AArch64 correctness. Cross-packaging tests
and assembler-byte tests should be supplemented with native runtime tests.

Audit path helpers against Windows drive paths, UNC paths and backslash
traversal. For example, `relative_dest()` in `core.nut` normalizes `/` components
while supporting a Windows packaging target. Its target-path behavior needs
tests independent of the host OS. This is an inspection finding, not a verified
Windows staging escape.

The subclass implementation explicitly restricts vfunc execution to the VM's
owning thread. Add tests for two simultaneously live VMs, separate main
contexts, teardown with queued cross-thread signals, and cancellation racing a
native completion. Existing cross-thread signal tests and the new sequential
lifecycle cases do not prove those scenarios safe.

## Coverage assessment

The initial full Debug run used GCC `--coverage`. For SQGI's C runtime sources,
unadjusted totals were **3,666/4,509 executable lines (81.3%)** and
**1,577/2,913 branch outcomes (54.1%)**. These are baseline measurements taken
before adding the new regressions, not final coverage claims or measurements
of Squirrel-level sqgipkg modules.

| Runtime source | Baseline line coverage |
| --- | ---: |
| sqgi_marshal.c | 65.6% |
| sqgi_gi.c | 70.9% |
| sqgi_cairo.c | 71.5% |
| sqgi_subclass.c | 80.3% |
| sqgi_gi_object.c | 85.9% |
| sqgi_import.c | 87.4% |
| sqgi_vm.c | 88.4% |
| sqgi_gerror.c | 89.9% |
| sqgi_async.c | 93.4% |
| sqgi_system.c | 97.1% |
| sqgi_json.c | 97.3% |
| sqgi_signal.c | 100.0% |

Signal code had 100% baseline line coverage and still had a VM lifetime bug;
JSON had 97.3% and still crashed on instance cycles. Prioritize behavior
dimensions over a line-percentage target: ownership, scalar width, array length,
argument direction, callback scope, object aliasing, cancellation, garbage
collection, shutdown and errors after partial work.

A small native fixture library with a GIR/typelib is the best next investment
for the runtime. It can deterministically return every ownership/type shape,
count frees, retain callbacks past calls, and report errors after consuming
arguments. This would make many boundary failures testable without depending on
large optional desktop libraries. The checker already demonstrates the value
of fixture metadata and targeted mutation checks.

## Reproduction and retained evidence

The final test commands were:

```sh
ctest --test-dir /tmp/sqgi-audit-20260907/default \
  -E '^sqgi_test_sqgipkg$' --output-on-failure -j 4
ctest --test-dir /tmp/sqgi-audit-20260907/asan \
  -E '^sqgi_test_sqgipkg$' --output-on-failure -j 4
cmake --build /tmp/sqgi-audit-20260907/checker -j 6 \
  --target sqgicheck-coverage sqgicheck-mutation
```

To recreate the configurations, use Debug builds with JIT disabled for the first,
`SQGI_ENABLE_ASAN=ON` and `SQ_ENABLE_JIT=ON` for the second, and
`SQGICHECK_ENABLE_COVERAGE=ON` plus `SQGICHECK_ENABLE_MUTATION_TESTS=ON` for the
third. The baseline coverage build additionally used GCC `--coverage -Wall
-Wextra` in C/C++ flags and `--coverage` in executable/shared linker flags.

Temporary evidence files remain on this machine:

- `/tmp/sqgi-audit-default-tests.log` and `/tmp/sqgi-audit-asan-tests.log`:
  initial suite failures, including packaging and JIT/checker failures.
- `/tmp/sqgi-audit-regressions-before.log`,
  `/tmp/sqgi-audit-transfer-before.log`, `/tmp/sqgi-audit-json-before.log`,
  `/tmp/sqgi-audit-subclass-before.log`, `/tmp/sqgi-audit-list-before.log`:
  failing regression evidence captured before the corresponding fixes.
- `/tmp/sqgi-audit-final-default-tests.log`,
  `/tmp/sqgi-audit-final-asan-tests.log`, `/tmp/sqgi-audit-checker-gates.log`:
  final verification.
- `/tmp/sqgi-audit-sdk-before.log`: staged embedder compilation failure.
- `/tmp/sqgi-audit-list-fix-test_gstreamer_recipes.nut.log`: remaining
  unsuppressed GStreamer leak report.
- `/tmp/sqgi-audit-20260907/baseline-coverage/summary.json`: baseline coverage.
