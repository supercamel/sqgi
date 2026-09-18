#ifndef SQJIT_LLVM_OBJECTS_H
#define SQJIT_LLVM_OBJECTS_H
#include "sqjit_backend.h"
bool sqjit_llvm_object_region(SQFunctionProto *, SQInteger, SQInteger *, SQInteger *, SQInteger *);
SQJitCompileResult sqjit_llvm_object_compile(SQFunctionProto *, SQInteger, SQInteger,
    SQInteger, SQJitCode *, bool);
#endif
