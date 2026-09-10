/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqjit_backend.h"
SQJitCompileResult sqjit_backend_compile_proto(SQFunctionProto *SQ_UNUSED_ARG(proto),
    SQObjectPtr *SQ_UNUSED_ARG(entry_stack), SQClosure *SQ_UNUSED_ARG(closure),
    SQJitNative *SQ_UNUSED_ARG(native), bool /* allow_side_exits */)
{
    return {false, false, SQ_JIT_BACKEND_NONE, SQ_JIT_REJECT_OTHER, -1, "no native backend"};
}

bool sqjit_backend_loop_find_region(SQFunctionProto *SQ_UNUSED_ARG(proto), SQInteger SQ_UNUSED_ARG(header_ip),
    SQInteger *SQ_UNUSED_ARG(start_ip), SQInteger *SQ_UNUSED_ARG(end_ip), SQInteger *SQ_UNUSED_ARG(exit_ip))
{
    return false;
}

SQJitCompileResult sqjit_backend_compile_loop(SQFunctionProto *SQ_UNUSED_ARG(proto),
    SQObjectPtr *SQ_UNUSED_ARG(entry_stack), SQClosure *SQ_UNUSED_ARG(closure),
    SQInteger SQ_UNUSED_ARG(start_ip), SQInteger SQ_UNUSED_ARG(header_ip),
    SQInteger SQ_UNUSED_ARG(end_ip), SQInteger SQ_UNUSED_ARG(exit_ip),
    SQJitProto *SQ_UNUSED_ARG(jit), SQJitCode *SQ_UNUSED_ARG(destination))
{
    return {false, false, SQ_JIT_BACKEND_NONE, SQ_JIT_REJECT_OTHER, -1, "no native backend"};
}
