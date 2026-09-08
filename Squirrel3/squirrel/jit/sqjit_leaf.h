/* Bounded scalar data flow for calls that cannot reenter the VM. */
#ifndef SQJIT_LEAF_H
#define SQJIT_LEAF_H
#include "sqjit_value.h"
#include <vector>
struct SQFunctionProto;

struct SQJitLeafValue {
    SQJitLeafValue(SQJitSlotKind k = SQ_JIT_SLOT_UNKNOWN) : kind(k), constant(false), integer(0) {}
    SQJitSlotKind kind;
    bool constant;
    SQInteger integer;
};

class SQJitLeafPlan {
public:
    enum { MAX_INSTRUCTIONS = 64, MAX_SLOTS = 32, MAX_PARAMETERS = 8 };
    struct Instruction {
        Instruction() : reachable(false), result(SQ_JIT_SLOT_UNKNOWN) {}
        bool reachable;
        std::vector<SQJitLeafValue> incoming;
        SQJitSlotKind result;
    };
    static bool Eligible(SQFunctionProto *proto);
    bool Build(SQFunctionProto *proto, const std::vector<SQJitSlotKind> &arguments);
    std::vector<Instruction> instructions;
    SQJitSlotKind return_kind = SQ_JIT_SLOT_UNKNOWN;
};
#endif
