# V27 cold literal lookup — applied candidate

Production contains the two-file V27 change. All 96 V26 source files were
verified and backed up before application. The first release build, fourteen
native groups and the 100-test release-enabled suite pass. Candidate SHA256:
`368d035b336f997a7f5a5e6a5bdbf7fa092ce53aa1d8f59e9ddb476f848eecfa`.
V26 remains the latest accepted performance result (1.866476378× audit).

The native path resolves string/integer/boolean literal keys at cold sites
using the current table's backing storage or current instance class's member
map. It checks key tag and identity, field encoding and current bounds.
Collision chains, equal but nonidentical strings, methods, missing fields and
other receivers retain checked helpers. Existing array checks, weak reads,
GET temporary swaps and SET ownership checks remain. Borrowed cache addresses
are activation-local; no pointers persist across calls.

Actual tracing verifies 84 native entries and 84 successful native returns:
constant GET/GETK/SET helper calls fall from 252 to zero. This is native helper
elimination, not interpreter fallback. No performance gain is claimed yet.

All 40 initial budget functions execute correctly, but their 856-byte spacing
missed the narrow same-tier fallback boundary: the richer layout adds 752 bytes
and the last large original function still fits at 8184 bytes. Sixteen refined
legal bytecode fixtures replace unused marker loads with four-byte jumps;
fourteen prove that exceeding 8192 bytes preserves byte-identical original
code at the SAME tier, including existing native owning heap stores. All 56
functions execute natively. Benchmark sources remain unchanged.

Nine allocation/reference probes pass against the current engine, including a
new cold-lookup install failure. One failed mprotect stops the attempt; the next
call retries and installs native code. The initial expanded-allocation probe
could not load its copied interposer because that file had been omitted from
setup; the failed log is retained. The missing shim was copied, only that GDB
probe was rerun, and all nine results were verified. Successful cases were not
repeated. This was a diagnostic setup correction, not an engine change.

The new test group covers current class layouts, table rehash between calls,
boolean/integer literal prototypes, hash collisions, runtime-produced equal
noninterned strings, method fallback, live/dead weak reads, and exact raw exits
for missing slots and receiver-tag collisions. Existing release, ancestor,
aliasing and callback tests still execute. The pre-application draft manifest
is retained as historical evidence; application-status.json and the applied
source manifest describe the current candidate.

Remaining release/sanitizer/holdout/x64 gates are running. Six five-round pilots
(methods/members/owners, warmups4/5, identical candidate repeats) are prepared but
have not started. Full56, fresh profiles, wider controls and matched PGO/LTO
remain outstanding. The full goal and method JIT-off regression remain open.

V27 is now accepted. Completed immutable evidence lives in the sibling
cold-literal-lookup-v27 directory; this directory preserves draft diagnostics.
