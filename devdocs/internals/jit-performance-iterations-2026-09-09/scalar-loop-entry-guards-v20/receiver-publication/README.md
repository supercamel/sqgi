# V20 rejection: unused receiver publication order

The extra raw-frame witness finds a correctness regression in the newly enabled
closure-parameter receiver preparation. A previously scalar destination is replaced
by one final-owned userdata before entering the compiled loop. The release hook
reads the loop's canonical sum slot.

V19: `status=0 releases=0 callback_sum=-1 frame_sum=0`. The native guard rejects
before effects, leaving the interpreter/raw caller to execute the original moves.
V20: `status=1 releases=1 callback_sum=28 frame_sum=28`. The loop completes and
publishes its sum before releasing the userdata. The original receiver MOVE must
release that old destination before the subsequent call/result updates.

Thus V20 is rejected despite its 400 selected test passes and improved timings.
Those earlier tests did not cover this additional raw-input lifetime transition.
Retain the complete measurements as an unaccepted experiment. Do not promote the
new receiver path or report 1.749× as an accepted replacement for V19.

The next candidate must guard every elided receiver/result destination against
owning references at native entry, and require its source to be an unchanged
canonical parameter (a surviving owner). Unknown/reference destinations must
reject before effects. If mandatory guards do not fit, or later effects defeat
the proof, compile using the prior fallback. Add the witness to permanent tests,
including nonfinal ownership/ancestor cases as appropriate, and remeasure the
hardened frozen candidate. Root call guard reuse retains its existing invariants;
this failure is specifically in newly enabled unused-receiver preparation.

The diagnostic was compiled after all accepted timing/profile/GDB work finished,
using the Release test's DSQ_ENABLE_JIT/O3/DNDEBUG/g/gnu++11/pthread flags and internal
headers, linked to libsqgi. `witness.cpp` and the executable are retained. Run it
with LD_LIBRARY_PATH set to the retained candidate or V19 `native-validation`
directory; its embedded temporary RUNPATH must not select a subsequently rebuilt
engine. The retained logs correspond to the frozen engines, before further edits.
