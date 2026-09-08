/* Canonical floating registers at loop headers, with ordinary memory exits. */
#ifndef SQJIT_BACKEND_X64_FLOAT_LOOPS_H
#define SQJIT_BACKEND_X64_FLOAT_LOOPS_H
#include "sqjit_backend_x64_emit.h"
#include "sqbytecode.h"
#include <map>

struct SQFunctionProto;
class SQJitX64FloatLoops {
public:
    SQJitX64FloatLoops(SQFunctionProto *proto, const SQBytecodeAnalysis &analysis,
        SQInteger first, SQInteger last, bool enabled);
    bool Enter(SQInteger ip, SQJitNativeCodeBuffer &buf, const SQJitSlotState *slots);
    bool Condition(SQInteger ip, SQJitNativeCodeBuffer &buf, SQJitNativeJcc condition, SQInteger *patch);
    bool Jump(SQInteger target, SQJitNativeCodeBuffer &buf, SQInteger *patch);
private:
    struct Header { SQInteger exit; std::vector<SQInteger> slots; };
    std::map<SQInteger, Header> _headers;
    SQFunctionProto *_proto;
    const SQBytecodeAnalysis &_analysis;
};
#endif
