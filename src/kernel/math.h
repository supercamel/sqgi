#pragma once
#include <cmath>
#include <cstring>
#include <string>
#include <stdexcept>

namespace sqkernel {
// A closed catalog, not a general foreign-function interface. All functions use
// binary64 operands. Predicates return bool; other results are binary64.
#define SQK_MATH_UNARY(X) \
    X(sqrt, "llvm.sqrt.f64") X(cbrt, nullptr) \
    X(sin, "llvm.sin.f64") X(cos, "llvm.cos.f64") X(tan, nullptr) \
    X(asin, nullptr) X(acos, nullptr) X(atan, nullptr) \
    X(sinh, nullptr) X(cosh, nullptr) X(tanh, nullptr) \
    X(asinh, nullptr) X(acosh, nullptr) X(atanh, nullptr) \
    X(exp, "llvm.exp.f64") X(exp2, "llvm.exp2.f64") X(expm1, nullptr) \
    X(log, "llvm.log.f64") X(log2, "llvm.log2.f64") X(log10, "llvm.log10.f64") X(log1p, nullptr) \
    X(fabs, "llvm.fabs.f64") X(floor, "llvm.floor.f64") \
    X(ceil, "llvm.ceil.f64") X(trunc, "llvm.trunc.f64") X(round, "llvm.round.f64") \
    X(erf, nullptr) X(erfc, nullptr) X(tgamma, nullptr) X(lgamma, nullptr)
#define SQK_MATH_BINARY(X) \
    X(atan2, nullptr) X(pow, "llvm.pow.f64") X(hypot, nullptr) X(fmod, nullptr) \
    X(remainder, nullptr) X(fmin, nullptr) X(fmax, nullptr) X(copysign, nullptr)
#define SQK_MATH_PREDICATE(X) X(isnan) X(isinf) X(isfinite) X(signbit)
#define SQK_UNARY_WRAPPER(name, intrinsic) inline double math_##name(double x) noexcept { return std::name(x); }
#define SQK_BINARY_WRAPPER(name, intrinsic) inline double math_##name(double x,double y) noexcept { return std::name(x,y); }
#define SQK_PREDICATE_WRAPPER(name) inline bool math_##name(double x) noexcept { return std::name(x); }
SQK_MATH_UNARY(SQK_UNARY_WRAPPER)
SQK_MATH_BINARY(SQK_BINARY_WRAPPER)
SQK_MATH_PREDICATE(SQK_PREDICATE_WRAPPER)
#undef SQK_UNARY_WRAPPER
#undef SQK_BINARY_WRAPPER
#undef SQK_PREDICATE_WRAPPER
struct MathBuiltin {
    const char *name;
    const char *intrinsic;
    double (*unary)(double);
    double (*binary)(double,double);
    bool (*predicate)(double);
    int arity() const { return binary ? 2 : 1; }
};
inline const MathBuiltin *math_builtins(size_t &count) {
#define SQK_UNARY_ENTRY(name, intrinsic) {#name, intrinsic, math_##name, nullptr, nullptr},
#define SQK_BINARY_ENTRY(name, intrinsic) {#name, intrinsic, nullptr, math_##name, nullptr},
#define SQK_PREDICATE_ENTRY(name) {#name, nullptr, nullptr, nullptr, math_##name},
    static const MathBuiltin entries[] = {
        SQK_MATH_UNARY(SQK_UNARY_ENTRY)
        SQK_MATH_BINARY(SQK_BINARY_ENTRY)
        SQK_MATH_PREDICATE(SQK_PREDICATE_ENTRY)
        {"abs", "llvm.fabs.f64", math_fabs, nullptr, nullptr},
    };
#undef SQK_UNARY_ENTRY
#undef SQK_BINARY_ENTRY
#undef SQK_PREDICATE_ENTRY
    count=sizeof(entries)/sizeof(entries[0]); return entries;
}
inline int math_builtin_index(const std::string &name) {
    size_t count; const auto *entries=math_builtins(count);
    for(size_t i=0;i<count;++i) if(name==entries[i].name) return (int)i;
    return -1;
}
inline const MathBuiltin &math_builtin(size_t index) {
    size_t count; const auto *entries=math_builtins(count);
    if(index>=count) throw std::runtime_error("invalid kernel math builtin");
    return entries[index];
}
#undef SQK_MATH_UNARY
#undef SQK_MATH_BINARY
#undef SQK_MATH_PREDICATE
}
