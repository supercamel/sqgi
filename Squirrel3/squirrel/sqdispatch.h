// Internal threaded-dispatch support. Normal gotos leave instruction scopes
// first, ensuring C++ destructors run before the computed goto dispatches.
#if defined(SQGI_THREADED_DISPATCH) && !defined(SQGI_ENABLE_LLVM_SQUIRREL) && (defined(__GNUC__) || defined(__clang__))
#define SQ_VM_THREADED 1
#define SQ_VM_CASE(op) case op: sq_op_##op:
#define SQ_VM_NEXT(op) goto sq_next_##op
#define SQ_VM_OPS(X) \
    X(_OP_LINE) \
    X(_OP_LOAD) \
    X(_OP_LOADINT) \
    X(_OP_LOADFLOAT) \
    X(_OP_DLOAD) \
    X(_OP_TAILCALL) \
    X(_OP_CALL) \
    X(_OP_PREPCALL) \
    X(_OP_PREPCALLK) \
    X(_OP_GETK) \
    X(_OP_MOVE) \
    X(_OP_NEWSLOT) \
    X(_OP_DELETE) \
    X(_OP_SET) \
    X(_OP_GET) \
    X(_OP_EQ) \
    X(_OP_NE) \
    X(_OP_ADD) \
    X(_OP_SUB) \
    X(_OP_MUL) \
    X(_OP_DIV) \
    X(_OP_MOD) \
    X(_OP_BITW) \
    X(_OP_RETURN) \
    X(_OP_LOADNULLS) \
    X(_OP_LOADROOT) \
    X(_OP_LOADBOOL) \
    X(_OP_DMOVE) \
    X(_OP_JMP) \
    X(_OP_JCMP) \
    X(_OP_JZ) \
    X(_OP_SETOUTER) \
    X(_OP_GETOUTER) \
    X(_OP_NEWOBJ) \
    X(_OP_APPENDARRAY) \
    X(_OP_COMPARITH) \
    X(_OP_INC) \
    X(_OP_INCL) \
    X(_OP_PINC) \
    X(_OP_PINCL) \
    X(_OP_CMP) \
    X(_OP_EXISTS) \
    X(_OP_INSTANCEOF) \
    X(_OP_AND) \
    X(_OP_OR) \
    X(_OP_NEG) \
    X(_OP_NOT) \
    X(_OP_BWNOT) \
    X(_OP_CLOSURE) \
    X(_OP_YIELD) \
    X(_OP_RESUME) \
    X(_OP_FOREACH) \
    X(_OP_POSTFOREACH) \
    X(_OP_CLONE) \
    X(_OP_TYPEOF) \
    X(_OP_PUSHTRAP) \
    X(_OP_POPTRAP) \
    X(_OP_THROW) \
    X(_OP_NEWSLOTA) \
    X(_OP_GETBASE) \
    X(_OP_CLOSE)
#else
#define SQ_VM_CASE(op) case op:
#define SQ_VM_NEXT(op) continue
#endif
