#ifndef SQJIT_NUMERIC_H
#define SQJIT_NUMERIC_H
#include "sqpcheader.h"
#include <vector>
struct SQFunctionProto;
struct SQClosure;
struct SQJitNumericBinding { SQObjectPtr key; SQInteger kind; };
class SQJitNumericPlan {
public:
    bool Build(SQFunctionProto *,SQObjectPtr *,SQClosure *,const std::vector<SQInteger> &);
    SQFunctionProto *Lowered() const;
    std::vector<SQInteger> temporary_writes;
    std::vector<SQJitNumericBinding> bindings;
private:
    SQObjectPtr lowered;
};
#endif
