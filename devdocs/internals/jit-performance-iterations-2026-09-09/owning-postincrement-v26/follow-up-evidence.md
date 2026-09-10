# Short method lookup evidence for the next iteration

The frozen V26 binary executes 42 native transfer and 42 native publish calls
on the unchanged method workload with n=7, warmups=0. Five observed GETK/constant
SET sites make 210 helper calls. Each current table or current class-member map
has the literal in its first hash bucket, with a matching key identity and a
valid field for every instance case. The probe counts only callers inside the
captured native mappings. It does not join profiler and debugger addresses.

This initial probe omits opcode 14 GET with a proven literal key; extend that
instrumentation before claiming the total member helper count. Its 210 calls
already establish repeated cold lookup costs in actual native methods. Both
failed diagnostic attempts (GDB default template argument and pre-load PIE
address) are retained alongside the corrected script and completed metadata.

Candidate direction: resolve immutable literal keys from the current table's
bucket or current instance class's member map, checking key tag and bits before
using the slot. Keep collisions, equal but nonidentical strings, missing fields,
methods and unsuitable receivers on the existing resolver. Populate only the
existing activation-local borrowed cache. Preserve the GET temporary swap and
SET release proof. No persistent object pointers and no unmanaged precise calls.
Try the richer code layout before the existing layout at the same budget tier;
resource failures must still stop and retry on a later invocation.

V26 full timing/profiling is running; no further diagnostic or build may overlap.

The completed method probe also instruments opcode 14 GET with a proven literal
key. Six sites make **252** member helper calls across the same 84 native
invocations. All 252 match the first bucket, with valid current instance fields.
The original five-site probe and its explicit limitation remain archived.

Application tracing captures only loop code for route_events, pricing_events and
filter_stream. Across 4/2/2 native loop invocations, every return reports success
and **zero call_native_closure helpers** run inside those captured mappings.
These cases already use native loop paths; whole-function call inlining is not
a demonstrated improvement target for them. The runtime helper fraction and
mutation-journal costs remain stronger application leads.

The first application return-count probe incorrectly accumulated temporary GDB
breakpoints when stop() returned false. Its failed log/script are preserved.
The corrected probe uses one persistent return breakpoint per address and a
matching pending-entry stack; all eight entries have exactly one successful
return and no pending entries remain. This is a diagnostic correction, not a
repeated performance sample.

All seven V26 ordinary profiles have zero lost samples. Owners now spend 12.04%
in DLOAD and 2.19% in CanReleaseInContext; the former PINCL hotspot is absent
from the >=0.5% flat report. Methods spend 48.66% in VM Execute and 7.43% in
constant SET helpers. Applications show VM Execute 15.00%, RecordMember 11.63%,
Table::Get 5.99%, array_get_object 5.26% and member_set_integer_logged 4.37%.
