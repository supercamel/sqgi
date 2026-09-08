/* Bounded inlining and scalar replacement for closed numeric object kernels. */
#ifndef SQJIT_OBJECT_PLAN_H
#define SQJIT_OBJECT_PLAN_H
#include "sqpcheader.h"
#include "sqjit_backend.h"
#include <memory>

struct SQJitObjectPlan {
    SQJitObjectPlan();
    ~SQJitObjectPlan();
    SQJitObjectPlan(const SQJitObjectPlan &) = delete;
    SQJitObjectPlan &operator=(const SQJitObjectPlan &) = delete;
    bool Build(SQFunctionProto *proto, SQObjectPtr *entry, SQClosure *closure);
    bool Guard(SQObjectPtr *entry, SQClosure *closure) const;
    SQFunctionProto *Lowered() const;
    void Mark(SQCollectable **chain);
    SQJitNative body;
    bool retryable;
    const char *reason;
    SQInteger allocations_removed, calls_inlined;
private:
    struct Impl;
    std::unique_ptr<Impl> impl;
};

SQInteger sqjit_object_plan_entry(SQObjectPtr *stack, SQObjectPtr *out, SQClosure *closure);
#endif
