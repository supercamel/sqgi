#include "sqpcheader.h"
#include "sqbytecode.h"
#include <stdio.h>
#define CHECK(c, msg) do { if(!(c)) { fprintf(stderr, "FAIL: %s\n", msg); ++rc; } } while(0)
int main()
{
    int rc = 0;
    SQInteger target;
    CHECK(sq_bytecode_branch_target(SQInstruction(_OP_JMP, 0, -3), 5, target) && target == 3, "signed jump offset");
    CHECK(sq_bytecode_branch_target(SQInstruction(_OP_POSTFOREACH, 0, 3), 5, target) && target == 8, "postforeach offset origin");
    CHECK(sq_bytecode_fallthrough(SQInstruction(_OP_TAILCALL)), "native tail calls fall through to return");
    SQBytecodeFacts f = sq_bytecode_facts(SQInstruction(_OP_DMOVE, 1, 2, 3, 1), 0, 4);
    CHECK(f.valid && f.reads.count() == 1 && f.reads.test(2) && f.writes.test(1) && f.writes.test(3), "DMOVE sequential use/def");
    f = sq_bytecode_facts(SQInstruction(_OP_CMP, 0, 1, 2, CMP_L), 0, 4);
    CHECK(f.reads.test(1) && f.reads.test(2) && !f.reads.test(0) && f.writes.test(0), "CMP operand roles differ from JCMP");
    f = sq_bytecode_facts(SQInstruction(_OP_GET, 1, 2, 3, 0), 0, 4);
    CHECK(!f.reads.test(0) && f.reads.test(2) && f.reads.test(3), "GET ignores arg3");
    f = sq_bytecode_facts(SQInstruction(_OP_AND, 1, 1, 2), 0, 4);
    CHECK(f.writes.test(1) && !f.kills.test(1), "conditional writes are not unconditional kills");
    CHECK(!sq_bytecode_facts(SQInstruction(_OP_MOVE, 0, 4), 0, 4).valid, "out-of-frame operand rejected");
    CHECK(!sq_bytecode_facts(SQInstruction(_OP_LOADNULLS, 2, 100000), 0, 4).valid, "invalid ranges rejected without scanning them");
    SQBytecodeAnalysis graph;
    SQInstruction branch[] = {
        SQInstruction(_OP_JZ, 0, 1), SQInstruction(_OP_LOADINT, 2, 7), SQInstruction(_OP_RETURN, 1, 2)
    };
    CHECK(graph.Build(branch, 3, 3) && graph.live_in[0].test(2), "branch can bypass first write before a read");
    SQInstruction loop[] = {
        SQInstruction(_OP_JCMP, 1, 2, 2, CMP_L), SQInstruction(_OP_INCL, 0, 1, 0, 1),
        SQInstruction(_OP_JMP, 0, -3), SQInstruction(_OP_RETURN, 1, 1)
    };
    CHECK(graph.Build(loop, 4, 3) && graph.loop_written[0].test(1) && !graph.loop_written[0].test(2), "loop-written sets include backedges");
    SQInstruction trap[] = {
        SQInstruction(_OP_PUSHTRAP, 0, 3), SQInstruction(_OP_GET, 2, 1, 0),
        SQInstruction(_OP_POPTRAP, 1), SQInstruction(_OP_RETURN, 0xff), SQInstruction(_OP_RETURN, 1, 2)
    };
    CHECK(graph.Build(trap, 5, 3) && graph.live_in[1].test(2), "exception sees destination before throwing assignment");
    branch[0] = SQInstruction(_OP_JMP, 0, -100);
    CHECK(!graph.Build(branch, 3, 3), "out-of-range branch rejected");
    return rc ? 1 : 0;
}
