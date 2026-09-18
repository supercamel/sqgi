/* Internal lowered IR only: never installed as executable VM bytecode. */
#ifndef SQJIT_NUMERIC_OPS_H
#define SQJIT_NUMERIC_OPS_H
#include "../sqopcodes.h"
#include "../sqnativebuiltins.h"
constexpr SQOpcode SQJIT_OP_TOFLOAT = (SQOpcode)0x80;
constexpr SQOpcode SQJIT_OP_MATH = (SQOpcode)0x81;
constexpr SQOpcode SQJIT_OP_VECTOR_APPEND = (SQOpcode)0x82;
constexpr SQOpcode SQJIT_OP_VECTOR_GET = (SQOpcode)0x83;
constexpr SQOpcode SQJIT_OP_VECTOR_LEN = (SQOpcode)0x84;
constexpr SQOpcode SQJIT_OP_INSTANCE = (SQOpcode)0x85;
constexpr SQOpcode SQJIT_OP_CLASS_GUARD = (SQOpcode)0x86;
#endif
