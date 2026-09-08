#ifndef SQJIT_BACKEND_X64_LEAF_H
#define SQJIT_BACKEND_X64_LEAF_H
#include "sqjit_backend_x64_emit.h"
#include "sqjit_leaf.h"
#include <functional>

bool sqjit_x64_inline_leaf(SQJitNativeCodeBuffer &buf, SQFunctionProto *callee,
    const SQJitLeafPlan &plan, SQInteger scratch, SQInteger target,
    const std::function<bool()> &guard_not_equal);
#endif
