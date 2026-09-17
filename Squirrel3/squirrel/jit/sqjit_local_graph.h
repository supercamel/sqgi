/* Scalar replacement of bounded private object graphs. */
#ifndef SQJIT_LOCAL_GRAPH_H
#define SQJIT_LOCAL_GRAPH_H
#include "sqpcheader.h"
#include <vector>
struct SQFunctionProto;
class SQJitLocalGraphPlan {
public:
    bool Build(SQFunctionProto *, const std::vector<SQInteger> &incoming = {});
    SQFunctionProto *Lowered() const;
    std::vector<SQInteger> temporary_writes;
    bool string_length = false;
    bool array_length = false;
private:
    SQObjectPtr lowered;
};
#endif
