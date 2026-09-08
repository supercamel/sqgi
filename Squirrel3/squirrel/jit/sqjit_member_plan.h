/* Invocation-local field locations for native regions without layout changes. */
#ifndef SQJIT_MEMBER_PLAN_H
#define SQJIT_MEMBER_PLAN_H
#include "sqbytecode.h"
#include <vector>

struct SQFunctionProto;

// Native-only key facts: accepted arithmetic is scalar and cannot invoke an
// overload. Unknown definitions and disagreeing control-flow paths stay unknown.
class SQJitKeyFlow {
public:
    bool Build(SQFunctionProto *proto, const SQBytecodeAnalysis &analysis,
        SQInteger first, SQInteger last);
    SQInteger Literal(SQInteger ip, SQInteger slot) const;
    bool MayEqual(SQInteger ip, SQInteger slot, const SQChar *name) const;
private:
    enum { UNKNOWN = -1, SCALAR = -2, UNREACHED = -3 };
    SQFunctionProto *_proto = NULL;
    SQInteger _first = 0, _last = -1, _slots = 0;
    std::vector<std::vector<SQInteger> > _in;
    SQInteger Value(SQInteger ip, SQInteger slot) const;
};

// Plain machine words live in the native frame. These pointers borrow from
// unchanged VM-stack owners and the undo log; they never retain objects alone.
struct SQJitMemberCell {
    SQObjectPtr *value;
    const SQObjectPtr *owner;
    const SQObjectPtr *key;
    SQInteger logged;
    SQInteger retained_type;
    SQRefCounted *retained[2];
};

class SQJitMemberPlan {
public:
    enum { MAX_FIELDS = 16, CELL_WORDS = sizeof(SQJitMemberCell) / sizeof(SQInteger) };
    struct Field { SQInteger base, literal; };
    void Build(SQFunctionProto *proto, SQObjectPtr *entry,
        const SQBytecodeAnalysis &analysis, SQInteger first, SQInteger last);
    SQInteger Find(SQInteger base, SQInteger literal) const;
    SQInteger Key(SQInteger ip, SQInteger slot) const { return _keys.Literal(ip, slot); }
    SQInteger Words() const { return (SQInteger)fields.size() * CELL_WORDS; }
    std::vector<Field> fields;
private:
    SQJitKeyFlow _keys;
};

SQInteger sqjit_member_cell_init(SQObjectPtr *stack, SQInteger base,
    const SQObjectPtr *key, SQJitMemberCell *cell);
SQInteger sqjit_member_cell_store(SQInteger *log, SQJitMemberCell *cell,
    SQInteger bits, SQInteger type);
#endif
