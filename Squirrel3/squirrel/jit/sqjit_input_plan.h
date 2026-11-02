/* Read-only object methods lowered to scalar LLVM regions. */
#ifndef SQJIT_INPUT_PLAN_H
#define SQJIT_INPUT_PLAN_H
#include "sqpcheader.h"
#include <vector>

struct SQFunctionProto;
struct SQClosure;
struct SQJitInputBinding {
    enum Source { Argument, EntryClosure, Field, Element, Metamethod, Root, RootFallback };
    Source source;
    SQInteger parent=-1, index=-1, owner=-1, length=-1, math=-1, lookup=-1;
    SQObjectType type=OT_NULL;
    // Only strings and weak references survive compilation; no untraced GC roots.
    SQObjectPtr key, expected;
};
struct SQJitInputBindings {
    enum { MAX_INPUTS=128 };
    std::vector<SQJitInputBinding> nodes;
    bool array_length=false;
    SQInteger Read(SQObjectPtr *entry,SQClosure *closure,SQInteger *values) const;
};
class SQJitInputPlan {
public:
    bool Build(SQFunctionProto *,SQObjectPtr *,SQClosure *);
    SQFunctionProto *Lowered() const;
    SQJitInputBindings bindings;
    std::vector<SQInteger> temporary_writes;
private:
    SQObjectPtr lowered;
};
#endif
