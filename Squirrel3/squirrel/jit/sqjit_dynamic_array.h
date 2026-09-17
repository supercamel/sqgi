#ifndef SQJIT_DYNAMIC_ARRAY_H
#define SQJIT_DYNAMIC_ARRAY_H
#include "sqpcheader.h"
#include <vector>
struct SQFunctionProto;
class SQJitDynamicArrayPlan {
public:
    bool Build(SQFunctionProto *,const std::vector<SQInteger> &);
    SQFunctionProto *Lowered() const;
    std::vector<SQInteger> temporary_writes;
private:
    SQObjectPtr lowered;
};
#endif
