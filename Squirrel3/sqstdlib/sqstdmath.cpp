/* see copyright notice in squirrel.h */
#include <squirrel.h>
#include <math.h>
#include <stdlib.h>
#include <sqstdmath.h>

#define SINGLE_ARG_FUNC(_funcname) static SQInteger math_##_funcname(HSQUIRRELVM v){ \
    SQFloat f; \
    sq_getfloat(v,2,&f); \
    sq_pushfloat(v,(SQFloat)_funcname(f)); \
    return 1; \
}

#define TWO_ARGS_FUNC(_funcname) static SQInteger math_##_funcname(HSQUIRRELVM v){ \
    SQFloat p1,p2; \
    sq_getfloat(v,2,&p1); \
    sq_getfloat(v,3,&p2); \
    sq_pushfloat(v,(SQFloat)_funcname(p1,p2)); \
    return 1; \
}

#define SINGLE_ARG_BOOL_FUNC(_funcname) static SQInteger math_##_funcname(HSQUIRRELVM v){ \
    SQFloat f; \
    sq_getfloat(v,2,&f); \
    sq_pushbool(v,_funcname(f) ? SQTrue : SQFalse); \
    return 1; \
}

static SQInteger math_srand(HSQUIRRELVM v)
{
    SQInteger i;
    if(SQ_FAILED(sq_getinteger(v,2,&i)))
        return sq_throwerror(v,_SC("invalid param"));
    srand((unsigned int)i);
    return 0;
}

static SQInteger math_rand(HSQUIRRELVM v)
{
    sq_pushinteger(v,rand());
    return 1;
}

static SQInteger math_abs(HSQUIRRELVM v)
{
    SQInteger n;
    sq_getinteger(v,2,&n);
    sq_pushinteger(v,(SQInteger)abs((int)n));
    return 1;
}

SINGLE_ARG_FUNC(sqrt)
SINGLE_ARG_FUNC(fabs)
SINGLE_ARG_FUNC(sin)
SINGLE_ARG_FUNC(cos)
SINGLE_ARG_FUNC(asin)
SINGLE_ARG_FUNC(acos)
SINGLE_ARG_FUNC(log)
SINGLE_ARG_FUNC(log10)
SINGLE_ARG_FUNC(tan)
SINGLE_ARG_FUNC(atan)
TWO_ARGS_FUNC(atan2)
TWO_ARGS_FUNC(pow)
SINGLE_ARG_FUNC(sinh)
SINGLE_ARG_FUNC(cosh)
SINGLE_ARG_FUNC(tanh)
SINGLE_ARG_FUNC(asinh)
SINGLE_ARG_FUNC(acosh)
SINGLE_ARG_FUNC(atanh)
SINGLE_ARG_FUNC(exp2)
SINGLE_ARG_FUNC(expm1)
SINGLE_ARG_FUNC(log2)
SINGLE_ARG_FUNC(log1p)
SINGLE_ARG_FUNC(cbrt)
TWO_ARGS_FUNC(hypot)
TWO_ARGS_FUNC(fmod)
SINGLE_ARG_FUNC(trunc)
SINGLE_ARG_FUNC(round)
SINGLE_ARG_BOOL_FUNC(isnan)
SINGLE_ARG_BOOL_FUNC(isinf)
SINGLE_ARG_BOOL_FUNC(isfinite)
SINGLE_ARG_FUNC(floor)
SINGLE_ARG_FUNC(ceil)
SINGLE_ARG_FUNC(exp)

#define _DECL_FUNC(name,nparams,tycheck) {_SC(#name),math_##name,nparams,tycheck}
static const SQRegFunction mathlib_funcs[] = {
    _DECL_FUNC(sqrt,2,_SC(".n")),
    _DECL_FUNC(sin,2,_SC(".n")),
    _DECL_FUNC(cos,2,_SC(".n")),
    _DECL_FUNC(asin,2,_SC(".n")),
    _DECL_FUNC(acos,2,_SC(".n")),
    _DECL_FUNC(log,2,_SC(".n")),
    _DECL_FUNC(log10,2,_SC(".n")),
    _DECL_FUNC(tan,2,_SC(".n")),
    _DECL_FUNC(atan,2,_SC(".n")),
    _DECL_FUNC(atan2,3,_SC(".nn")),
    _DECL_FUNC(pow,3,_SC(".nn")),
    _DECL_FUNC(sinh,2,_SC(".n")),
    _DECL_FUNC(cosh,2,_SC(".n")),
    _DECL_FUNC(tanh,2,_SC(".n")),
    _DECL_FUNC(asinh,2,_SC(".n")),
    _DECL_FUNC(acosh,2,_SC(".n")),
    _DECL_FUNC(atanh,2,_SC(".n")),
    _DECL_FUNC(exp2,2,_SC(".n")),
    _DECL_FUNC(expm1,2,_SC(".n")),
    _DECL_FUNC(log2,2,_SC(".n")),
    _DECL_FUNC(log1p,2,_SC(".n")),
    _DECL_FUNC(cbrt,2,_SC(".n")),
    _DECL_FUNC(hypot,3,_SC(".nn")),
    _DECL_FUNC(fmod,3,_SC(".nn")),
    _DECL_FUNC(trunc,2,_SC(".n")),
    _DECL_FUNC(round,2,_SC(".n")),
    _DECL_FUNC(isnan,2,_SC(".n")),
    _DECL_FUNC(isinf,2,_SC(".n")),
    _DECL_FUNC(isfinite,2,_SC(".n")),
    _DECL_FUNC(floor,2,_SC(".n")),
    _DECL_FUNC(ceil,2,_SC(".n")),
    _DECL_FUNC(exp,2,_SC(".n")),
    _DECL_FUNC(srand,2,_SC(".n")),
    _DECL_FUNC(rand,1,NULL),
    _DECL_FUNC(fabs,2,_SC(".n")),
    _DECL_FUNC(abs,2,_SC(".n")),
    {NULL,(SQFUNCTION)0,0,NULL}
};
#undef _DECL_FUNC

#ifndef M_PI
#define M_PI (3.14159265358979323846)
#endif

#ifndef M_E
#define M_E (2.71828182845904523536)
#endif

#ifndef M_LN2
#define M_LN2 (0.69314718055994530942)
#endif

#ifndef M_LN10
#define M_LN10 (2.30258509299404568402)
#endif

#ifndef M_SQRT2
#define M_SQRT2 (1.41421356237309504880)
#endif

static void sqstd_math_push_float_const(HSQUIRRELVM v, const SQChar *name, SQFloat value)
{
    sq_pushstring(v,name,-1);
    sq_pushfloat(v,value);
    sq_newslot(v,-3,SQFalse);
}

SQRESULT sqstd_register_mathlib(HSQUIRRELVM v)
{
    SQInteger i=0;
    while(mathlib_funcs[i].name!=0) {
        sq_pushstring(v,mathlib_funcs[i].name,-1);
        sq_newclosure(v,mathlib_funcs[i].f,0);
        sq_setparamscheck(v,mathlib_funcs[i].nparamscheck,mathlib_funcs[i].typemask);
        sq_setnativeclosurename(v,-1,mathlib_funcs[i].name);
        sq_newslot(v,-3,SQFalse);
        i++;
    }
    sq_pushstring(v,_SC("RAND_MAX"),-1);
    sq_pushinteger(v,RAND_MAX);
    sq_newslot(v,-3,SQFalse);
    sq_pushstring(v,_SC("PI"),-1);
    sq_pushfloat(v,(SQFloat)M_PI);
    sq_newslot(v,-3,SQFalse);
    sqstd_math_push_float_const(v,_SC("E"),(SQFloat)M_E);
    sqstd_math_push_float_const(v,_SC("TAU"),(SQFloat)(2.0 * M_PI));
    sqstd_math_push_float_const(v,_SC("HALF_PI"),(SQFloat)(M_PI / 2.0));
    sqstd_math_push_float_const(v,_SC("SQRT2"),(SQFloat)M_SQRT2);
    sqstd_math_push_float_const(v,_SC("LN2"),(SQFloat)M_LN2);
    sqstd_math_push_float_const(v,_SC("LN10"),(SQFloat)M_LN10);
    return SQ_OK;
}
