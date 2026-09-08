/* Bytecode facts shared by the compiler, checker and native backends. */
#ifndef SQBYTECODE_H
#define SQBYTECODE_H
#include "sqopcodes.h"
#include <bitset>
#include <vector>

typedef std::bitset<MAX_FUNC_STACKSIZE> SQSlotSet;
enum SQBytecodeEffect {
    SQ_BC_THROW = 1, SQ_BC_CALL = 2, SQ_BC_ALLOCATE = 4,
    SQ_BC_MUTATE = 8, SQ_BC_RELEASE = 16, SQ_BC_OUTER = 32
};
struct SQBytecodeFacts {
    SQSlotSet reads, writes;
    // Conditional writes are not kills in liveness analysis.
    SQSlotSet kills;
    unsigned effects;
    SQInteger target;
    bool fallthrough;
    bool valid;
};

bool sq_bytecode_branch_target(const SQInstruction &inst, SQInteger ip, SQInteger &target);
bool sq_bytecode_fallthrough(const SQInstruction &inst);
SQBytecodeFacts sq_bytecode_facts(const SQInstruction &inst, SQInteger ip, SQInteger slots);

class SQBytecodeAnalysis {
public:
    bool Build(const SQInstruction *code, SQInteger count, SQInteger slots);
    std::vector<SQBytecodeFacts> facts;
    std::vector<SQSlotSet> live_in;
    std::vector<SQSlotSet> loop_written;
    std::vector<bool> leaders;
};
#endif
