#include "sqpcheader.h"
#include "sqbytecode.h"

bool sq_bytecode_branch_target(const SQInstruction &i, SQInteger ip, SQInteger &target)
{
    switch(i.op) {
    case _OP_JMP: case _OP_JZ: case _OP_JCMP: case _OP_AND: case _OP_OR:
    case _OP_FOREACH: case _OP_PUSHTRAP:
        target = ip + 1 + (SQInteger)i._arg1; return true;
    case _OP_POSTFOREACH:
        target = ip + (SQInteger)i._arg1; return true;
    default: return false;
    }
}

bool sq_bytecode_fallthrough(const SQInstruction &i)
{
    // TAILCALL only leaves this frame for a non-generator Squirrel closure.
    // Native closures and other callable values still fall through to RETURN.
    return i.op != _OP_JMP && i.op != _OP_RETURN && i.op != _OP_THROW;
}

SQBytecodeFacts sq_bytecode_facts(const SQInstruction &i, SQInteger ip, SQInteger slots)
{
    SQBytecodeFacts f = {};
    f.valid = slots > 0 && slots <= MAX_FUNC_STACKSIZE;
    f.target = -1;
    f.fallthrough = sq_bytecode_fallthrough(i);
    sq_bytecode_branch_target(i, ip, f.target);
    auto read = [&](SQInteger n) { if(n < 0 || n >= slots) f.valid = false; else f.reads.set(n); };
    auto write = [&](SQInteger n) { if(n < 0 || n >= slots) f.valid = false; else f.writes.set(n); };
    auto result = [&]() { if(i._arg0 != 0xFF) write(i._arg0); };
    const unsigned dynamic = SQ_BC_THROW | SQ_BC_CALL | SQ_BC_ALLOCATE;
    switch(i.op) {
    case _OP_LINE: case _OP_JMP: case _OP_POPTRAP: break;
    case _OP_LOAD: case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
    case _OP_LOADROOT: case _OP_GETBASE: write(i._arg0); break;
    case _OP_DLOAD: write(i._arg0); write(i._arg2); break;
    case _OP_LOADNULLS:
        if(i._arg1 < 0 || i._arg1 > slots) { f.valid = false; break; }
        for(SQInteger n = 0; n < i._arg1; ++n) write(i._arg0 + n);
        break;
    case _OP_MOVE: read(i._arg1); write(i._arg0); break;
    case _OP_DMOVE:
        read(i._arg1);
        // The second assignment sees the result of the first assignment.
        if(i._arg3 != i._arg0) read(i._arg3);
        write(i._arg0); write(i._arg2); break;
    case _OP_CALL: case _OP_TAILCALL:
        read(i._arg1);
        for(SQInteger n = 0; n < i._arg3; ++n) read(i._arg2 + n);
        result(); f.effects = dynamic | SQ_BC_MUTATE; break;
    case _OP_PREPCALL: case _OP_PREPCALLK:
        if(i.op == _OP_PREPCALL) read(i._arg1);
        read(i._arg2); write(i._arg0); write(i._arg3); f.effects = dynamic; break;
    case _OP_GETK: read(i._arg2); write(i._arg0); f.effects = dynamic; break;
    case _OP_NEWSLOT: case _OP_SET:
        read(i._arg1); read(i._arg2); read(i._arg3); result();
        f.effects = dynamic | SQ_BC_MUTATE; break;
    case _OP_DELETE: case _OP_GET:
        read(i._arg1); read(i._arg2); write(i._arg0); f.effects = dynamic;
        if(i.op == _OP_DELETE) f.effects |= SQ_BC_MUTATE;
        break;
    case _OP_EQ: case _OP_NE:
        read(i._arg2); if(!i._arg3) read(i._arg1);
        write(i._arg0); f.effects = SQ_BC_THROW; break;
    case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD:
    case _OP_CMP: case _OP_BITW: case _OP_EXISTS: case _OP_INSTANCEOF:
        read(i._arg1); read(i._arg2); write(i._arg0); f.effects = dynamic; break;
    case _OP_RETURN:
        if(i._arg0 != 0xFF) read(i._arg1);
        f.effects = SQ_BC_RELEASE | SQ_BC_OUTER; break;
    case _OP_JZ: read(i._arg0); break;
    case _OP_JCMP: read(i._arg0); read(i._arg2); f.effects = dynamic; break;
    case _OP_GETOUTER: write(i._arg0); f.effects = SQ_BC_OUTER; break;
    case _OP_SETOUTER: read(i._arg2); result(); f.effects = SQ_BC_OUTER | SQ_BC_MUTATE; break;
    case _OP_NEWOBJ:
        if(i._arg3 == NOT_CLASS) {
            if(i._arg1 != -1) read(i._arg1);
            if(i._arg2 != 0xFF) read(i._arg2);
        }
        else if(i._arg3 != NOT_TABLE && i._arg3 != NOT_ARRAY) f.valid = false;
        write(i._arg0); f.effects = dynamic; break;
    case _OP_APPENDARRAY:
        read(i._arg0); if(i._arg2 == AAT_STACK) read(i._arg1);
        if(i._arg2 > AAT_BOOL) f.valid = false;
        f.effects = SQ_BC_ALLOCATE | SQ_BC_MUTATE; break;
    case _OP_COMPARITH:
        read(((SQUnsignedInteger)i._arg1 >> 16) & 0xffff);
        read(i._arg1 & 0xffff); read(i._arg2); write(i._arg0);
        f.effects = dynamic | SQ_BC_MUTATE; break;
    case _OP_INC: case _OP_PINC:
        read(i._arg1); read(i._arg2); write(i._arg0); f.effects = dynamic | SQ_BC_MUTATE; break;
    case _OP_INCL: case _OP_PINCL:
        read(i._arg1); write(i._arg1); if(i.op == _OP_PINCL) result(); f.effects = dynamic; break;
    case _OP_AND: case _OP_OR:
        read(i._arg2); write(i._arg0); break;
    case _OP_NEG: case _OP_NOT: case _OP_BWNOT: case _OP_RESUME: case _OP_CLONE: case _OP_TYPEOF:
        read(i._arg1); write(i._arg0); f.effects = dynamic; break;
    case _OP_CLOSURE:
        // Captured locals and default arguments are described by the child
        // prototype. Treat them conservatively in this instruction-only API.
        f.reads.set(); write(i._arg0); f.effects = dynamic | SQ_BC_OUTER; break;
    case _OP_YIELD:
        f.reads.set(); f.effects = dynamic | SQ_BC_OUTER; break;
    case _OP_FOREACH:
        read(i._arg0); read(i._arg2 + 2);
        write(i._arg2); write(i._arg2 + 1); write(i._arg2 + 2); f.effects = dynamic; break;
    case _OP_POSTFOREACH: read(i._arg0); break;
    case _OP_PUSHTRAP:
        write(i._arg0); f.effects = SQ_BC_ALLOCATE; break;
    case _OP_THROW: read(i._arg0); f.effects = SQ_BC_THROW; break;
    case _OP_NEWSLOTA:
        read(i._arg1); read(i._arg2); read(i._arg3);
        if(i._arg0 & NEW_SLOT_ATTRIBUTES_FLAG) read(i._arg2 - 1);
        f.effects = dynamic | SQ_BC_MUTATE; break;
    case _OP_CLOSE:
        for(SQInteger n = i._arg1; n < slots; ++n) read(n);
        f.effects = SQ_BC_OUTER; break;
    default: f.valid = false; break;
    }
    f.kills = f.writes;
    if(i.op == _OP_AND || i.op == _OP_OR || i.op == _OP_FOREACH || i.op == _OP_PUSHTRAP) f.kills.reset();
    if(f.writes.any()) f.effects |= SQ_BC_RELEASE;
    return f;
}

bool SQBytecodeAnalysis::Build(const SQInstruction *code, SQInteger count, SQInteger slots)
{
    if(!code || count <= 0 || count > 65536 || slots <= 0 || slots > MAX_FUNC_STACKSIZE) return false;
    facts.resize(count); live_in.assign(count + 1, SQSlotSet());
    loop_written.assign(count, SQSlotSet()); leaders.assign(count + 1, false);
    leaders[0] = true;
    std::vector<SQInteger> handlers;
    bool captures = false;
    for(SQInteger ip = 0; ip < count; ++ip) {
        facts[ip] = sq_bytecode_facts(code[ip], ip, slots);
        SQBytecodeFacts &f = facts[ip];
        if(!f.valid || f.target > count || (f.target < 0 &&
            sq_bytecode_branch_target(code[ip], ip, f.target))) return false;
        if(f.target >= 0) {
            leaders[f.target] = true; leaders[ip + 1] = true;
            if(code[ip].op == _OP_PUSHTRAP) handlers.push_back(f.target);
        }
        if(!f.fallthrough) leaders[ip + 1] = true;
        captures = captures || code[ip].op == _OP_CLOSURE || code[ip].op == _OP_CLOSE;
    }
    for(SQInteger ip = 0; ip < count; ++ip) {
        if(captures && (facts[ip].effects & (SQ_BC_CALL | SQ_BC_OUTER))) facts[ip].reads.set();
        SQInteger target = facts[ip].target;
        if(target >= 0 && target <= ip) {
            for(SQInteger n = target; n <= ip; ++n) loop_written[target] |= facts[n].writes;
        }
    }
    bool changed;
    do {
        changed = false;
        for(SQInteger ip = count; ip-- > 0;) {
            const SQBytecodeFacts &f = facts[ip];
            SQSlotSet out;
            if(f.fallthrough) out |= live_in[ip + 1];
            if(f.target >= 0) out |= live_in[f.target];
            // Over-approximate exceptional flow instead of relying on lexical
            // trap nesting; handlers may observe values from anywhere protected.
            SQSlotSet in = f.reads | (out & ~f.kills);
            // A throwing instruction may fail before writing its destination.
            if(f.effects & SQ_BC_THROW) for(SQInteger handler : handlers) in |= live_in[handler];
            if(in != live_in[ip]) { live_in[ip] = in; changed = true; }
        }
    } while(changed);
    return true;
}
