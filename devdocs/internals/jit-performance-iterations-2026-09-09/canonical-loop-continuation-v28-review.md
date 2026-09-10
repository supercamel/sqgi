# Canonical loop continuation: current VM boundary review

Source review while frozen V28 measurements run; no loop change is applied.
The existing canonical-loop-entry-next.md requirements remain authoritative.
This note identifies an additional concrete same-header continuation obligation.

In sqvm.cpp, instruction fetch increments ci->_ip before dispatch (line843).
The JCMP/JZ handlers calculate header_ip as ci->_ip minus one, then call the
legacy bool sqjit_try_execute_current_loop. False falls through to the already
decoded comparison/branch; true fetches again. The existing loop admission guard
also reads only the legacy single-header code/failure state. A new canonical
route needs both a separate artifact/admission path and an explicit result
contract; changing only the backend cannot enable it safely.

A canonical region may complete several iterations, then exit before executing
its entry-header comparison because the old temporary has become sensitive.
Blindly setting ci->_ip to that same header and continuing dispatch would
attempt the same native entry again before the comparison executes. Backoff
alone is not a semantic continuation contract. The VM must execute that
unexecuted header exactly once through the ordinary comparison/branch path.
A distinct RESUME_CURRENT result can validate the frame/prototype and exact IP,
then fall through to the already-decoded opcode while preserving ci->_ip at
header+1. RESUME_OTHER publishes a validated different continuation and fetches
again. ERROR must raise without replaying any prefix. No-artifact/entry-guard
failure stays distinguishable from committed execution. These are proposed
states, not existing behavior or permission to reuse the unsafe legacy route.

Necessary generated witnesses include:

- A sensitive JCMP temporary at first entry: ordinary release occurs once,
  before the next observable member operation, without native-entry recursion.
- Successful native iterations followed by a same-header exit: the completed
  iterations and stores persist, and only the unexecuted comparison falls
  through. Count callbacks and body effects to detect replay or duplication.
- An internal branch selecting either CALL boundary: all prefix stores persist,
  the selected call runs once in the VM, and the next backedge may enter a fresh
  native activation. Cache addresses never survive that interpreted call.
- Invalid continuation metadata after effects: execution raises; neither the
  header nor any earlier prefix runs again.
- Multiple hot headers after initialization: rejected initialization loops do
  not prevent a later eligible region, and existing profitable private loops
  retain their independent admission/backoff state.

Region compilation must preserve the full prototype's literal/dataflow facts,
not create a sliced pseudo-prototype that loses reaching writes. RETURN, CALL,
allocation and other unsupported operations can be explicit before-effect
boundaries, but actual native entry and both internal branch paths must be
proved. Measure whether per-iteration entry/cache initialization pays for the
saved dispatch; a native prefix alone is not a performance result.
