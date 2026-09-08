/* Internal identities and pure evaluators for audited standard-library calls. */
#ifndef SQNATIVEBUILTINS_H
#define SQNATIVEBUILTINS_H
#include "squirrel.h"
enum SQNativeMathKind {
    SQ_NATIVE_MATH_NONE = 0, SQ_NATIVE_MATH_SQRT, SQ_NATIVE_MATH_SIN, SQ_NATIVE_MATH_COS,
    SQ_NATIVE_MATH_ASIN, SQ_NATIVE_MATH_ACOS, SQ_NATIVE_MATH_LOG, SQ_NATIVE_MATH_LOG10,
    SQ_NATIVE_MATH_TAN, SQ_NATIVE_MATH_ATAN, SQ_NATIVE_MATH_FLOOR, SQ_NATIVE_MATH_CEIL,
    SQ_NATIVE_MATH_EXP, SQ_NATIVE_MATH_FABS, SQ_NATIVE_MATH_ATAN2, SQ_NATIVE_MATH_POW
};
struct SQNativeMathSpec {
    SQNativeMathKind kind;
    SQFUNCTION function;
    SQInteger nargs;
    SQFloat (*unary)(SQFloat);
    SQFloat (*binary)(SQFloat, SQFloat);
};
const SQNativeMathSpec *sq_native_math_spec(SQFUNCTION function);
const SQNativeMathSpec *sq_native_math_spec(SQNativeMathKind kind);
SQFUNCTION sq_native_number_tofloat();
#endif
