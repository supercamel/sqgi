/* Scalar replacement of bounded, nonescaping arrays and string-key tables across loops. */
#ifndef SQJIT_LOCAL_ARRAY_H
#define SQJIT_LOCAL_ARRAY_H
#include "sqpcheader.h"
#include <vector>
struct SQFunctionProto;
class SQJitLocalArrayPlan {
public:
    bool Build(SQFunctionProto *proto, const std::vector<SQInteger> &incoming_writes = {});
    std::vector<SQInteger> temporary_writes;
    SQFunctionProto *Lowered() const;
private:
    SQObjectPtr lowered;
};
#endif
