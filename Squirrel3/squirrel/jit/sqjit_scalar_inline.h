/* Guarded expansion of ordinary root-table scalar helper calls. */
#ifndef SQJIT_SCALAR_INLINE_H
#define SQJIT_SCALAR_INLINE_H
#include "sqpcheader.h"
#include <vector>
struct SQFunctionProto;
struct SQClosure;
struct SQJitScalarBinding {
    // Strings and weak references are non-GC objects. Do not retain a closure
    // strongly in an artifact that is not traversed by Squirrel's collector.
    SQObjectPtr key, target;
};
class SQJitScalarInlinePlan {
public:
    bool Build(SQFunctionProto *proto, SQObjectPtr *entry, SQClosure *closure);
    SQFunctionProto *Lowered() const;
    std::vector<SQJitScalarBinding> bindings;
    std::vector<SQInteger> temporary_writes;
private:
    SQObjectPtr lowered;
};
#endif
