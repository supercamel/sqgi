#ifndef SQJIT_INTRINSICS_H
#define SQJIT_INTRINSICS_H
#include "sqnativebuiltins.h"
struct SQNativeClosure;
struct SQObjectPtr;
struct SQClosure;
struct SQMemberCache;
const SQNativeMathSpec *sqjit_math_spec(SQNativeClosure *closure);
SQInteger sqjit_math_unary(SQInteger op, const SQFloat *arg, SQFloat *out);
SQInteger sqjit_math_binary(SQInteger op, const SQFloat *left, const SQFloat *right, SQFloat *out);
SQInteger sqjit_integer_to_float(SQInteger value, SQFloat *out);
SQInteger sqjit_math_guard(SQObjectPtr *stack, SQInteger base, const SQObjectPtr *key, SQInteger kind, SQMemberCache *cache);
SQInteger sqjit_number_conversion_guard(SQClosure *closure, const SQObjectPtr *key);
#endif
