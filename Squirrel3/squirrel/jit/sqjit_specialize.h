#ifndef _SQJIT_SPECIALIZE_H_
#define _SQJIT_SPECIALIZE_H_
#include "sqjit_backend.h"
bool sqjit_native_precheck(SQJitNative *native, SQObjectPtr *stack);
bool sqjit_compile_specialized_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQJitNative *native);
#endif
