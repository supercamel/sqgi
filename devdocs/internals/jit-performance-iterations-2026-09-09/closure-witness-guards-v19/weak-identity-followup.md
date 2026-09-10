# Alternative weak identity comparison to investigate

V19 loads the expected weak object's type and referent inside the existing helper.
That removes emitted code but still introduces dependent loads. No alternative is
implemented or timed in this note.

SQRefCounted starts with _weakref=NULL. GetWeakRef lazily creates one SQWeakRef
whose referent is this object. The referent's destructor clears the weak payload;
SQWeakRef::Release clears the live object's backpointer before deleting the weak
object. A generated artifact retains its witness, so that weak object's allocation
cannot be released/reused while the artifact is alive. SQClosure::Clone and
SQNativeClosure::Clone both Create a fresh object; they do not copy _weakref.

After borrowing and checking the current member's closure type, it may therefore
be sufficient to compare current_closure->_weakref against the retained witness.
A different or recycled closure has NULL or its own distinct weak object. This
could avoid loading/checking the old weak payload and comparing its referent.
The current member must be demonstrably live and borrowed without callbacks;
never dereference the former expected raw closure. Review all writes to _weakref
and every helper lookup path before implementing. Keep both actual address-reuse
contracts, native guard failures, weak death, and cross-activation replacement
coverage. Direct-call pre-materialization guards need their own treatment.

Evaluate only if fresh controls/profiles justify it. Fewer instructions alone do
not establish faster execution, as the V19 pressure workload is illustrating.
