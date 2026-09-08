#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqbytecode.h"
#include "sqjit_leaf.h"

static bool numeric(SQJitSlotKind k) { return k == SQ_JIT_SLOT_INT || k == SQ_JIT_SLOT_FLOAT; }
static bool scalar(SQJitSlotKind k) { return numeric(k) || k == SQ_JIT_SLOT_BOOL; }
static SQJitLeafValue literal(SQFunctionProto *p, SQInteger index)
{
    SQJitLeafValue result;
    if(index < 0 || index >= p->_nliterals) return result;
    const SQObjectPtr &v = p->_literals[index];
    if(sq_type(v) == OT_INTEGER || sq_type(v) == OT_BOOL) {
        result.kind = sq_type(v) == OT_INTEGER ? SQ_JIT_SLOT_INT : SQ_JIT_SLOT_BOOL;
        result.constant = true; result.integer = _integer(v);
    }
    else if(sq_type(v) == OT_FLOAT) result.kind = SQ_JIT_SLOT_FLOAT;
    return result;
}

bool SQJitLeafPlan::Eligible(SQFunctionProto *p)
{
    if(!p || p->_bgenerator || p->_varparams || p->_ndefaultparams || p->_noutervalues ||
        p->_stacksize <= 0 || p->_stacksize > MAX_SLOTS || p->_nparameters < 1 ||
        p->_nparameters > MAX_PARAMETERS || p->_nparameters > p->_stacksize ||
        p->_ninstructions <= 0 || p->_ninstructions > MAX_INSTRUCTIONS) return false;
    for(SQInteger ip = 0; ip < p->_ninstructions; ++ip) {
        const SQInstruction &i = p->_instructions[ip];
        SQBytecodeFacts f = sq_bytecode_facts(i, ip, p->_stacksize);
        if(!f.valid || f.reads.test(0) || f.writes.test(0) ||
            (f.target >= 0 && (f.target <= ip || f.target >= p->_ninstructions))) return false;
        switch(i.op) {
        case _OP_LINE: case _OP_LOADINT: case _OP_LOADBOOL:
        case _OP_MOVE: case _OP_DMOVE: case _OP_ADD: case _OP_SUB: case _OP_MUL:
        case _OP_DIV: case _OP_MOD: case _OP_NEG: case _OP_EQ: case _OP_NE:
        case _OP_CMP: case _OP_JCMP: case _OP_JZ: case _OP_JMP: case _OP_RETURN:
            break;
        case _OP_LOADFLOAT: if(sizeof(SQFloat) != sizeof(SQInt32)) return false; break;
        case _OP_LOAD: if(!scalar(literal(p, i._arg1).kind)) return false; break;
        case _OP_DLOAD:
            if(!scalar(literal(p, i._arg1).kind) || !scalar(literal(p, i._arg3).kind)) return false;
            break;
        default: return false;
        }
    }
    return true;
}

bool SQJitLeafPlan::Build(SQFunctionProto *p, const std::vector<SQJitSlotKind> &arguments)
{
    instructions.clear(); return_kind = SQ_JIT_SLOT_UNKNOWN;
    if(!Eligible(p) || arguments.size() != (size_t)p->_nparameters) return false;
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(p->_instructions, p->_ninstructions, p->_stacksize)) return false;
    instructions.resize(p->_ninstructions);
    for(Instruction &n : instructions) n.incoming.resize(p->_stacksize);
    instructions[0].reachable = true;
    for(SQInteger n = 1; n < p->_nparameters; ++n) instructions[0].incoming[n].kind = arguments[n];
    auto merge = [&](SQInteger target, const std::vector<SQJitLeafValue> &state) {
        if(target < 0 || target >= p->_ninstructions) return false;
        Instruction &dest = instructions[target];
        if(!dest.reachable) { dest.reachable = true; dest.incoming = state; return true; }
        for(SQInteger n = 0; n < p->_stacksize; ++n) {
            SQJitLeafValue &v = dest.incoming[n];
            if(v.kind != state[n].kind) {
                if(analysis.live_in[target].test(n)) return false;
                v = SQJitLeafValue();
            }
            v.constant = v.constant && state[n].constant && v.integer == state[n].integer;
        }
        return true;
    };
    // Eligible bytecode has only forward edges, so instruction order is a
    // topological order. Merge every predecessor before analyzing a use.
    for(SQInteger ip = 0; ip < p->_ninstructions; ++ip) {
        Instruction &node = instructions[ip];
        if(!node.reachable) continue;
        std::vector<SQJitLeafValue> state = node.incoming;
        const SQInstruction &i = p->_instructions[ip];
        const SQBytecodeFacts &facts = analysis.facts[ip];
        auto set = [&](SQInteger dst, SQJitLeafValue value) { state[dst] = value; node.result = value.kind; };
        switch(i.op) {
        case _OP_LOADINT: case _OP_LOADBOOL: {
            SQJitLeafValue v(i.op == _OP_LOADBOOL ? SQ_JIT_SLOT_BOOL : SQ_JIT_SLOT_INT);
            v.constant = true; v.integer = i.op == _OP_LOADBOOL ? i._arg1 != 0 : (SQInt32)i._arg1;
            set(i._arg0, v); break;
        }
        case _OP_LOADFLOAT: set(i._arg0, SQJitLeafValue(SQ_JIT_SLOT_FLOAT)); break;
        case _OP_LOAD: set(i._arg0, literal(p, i._arg1)); break;
        case _OP_DLOAD: set(i._arg0, literal(p, i._arg1)); set(i._arg2, literal(p, i._arg3)); break;
        case _OP_MOVE: case _OP_DMOVE:
            if(!scalar(state[i._arg1].kind)) return false;
            set(i._arg0, state[i._arg1]);
            if(i.op == _OP_DMOVE) {
                if(!scalar(state[i._arg3].kind)) return false;
                set(i._arg2, state[i._arg3]);
            }
            break;
        case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD: {
            SQJitSlotKind left = state[i._arg2].kind, right = state[i._arg1].kind;
            if(!numeric(left) || !numeric(right)) return false;
            SQJitSlotKind result = left == SQ_JIT_SLOT_FLOAT || right == SQ_JIT_SLOT_FLOAT ? SQ_JIT_SLOT_FLOAT : SQ_JIT_SLOT_INT;
            if(i.op == _OP_MOD && result != SQ_JIT_SLOT_INT) return false;
            set(i._arg0, SQJitLeafValue(result)); break;
        }
        case _OP_NEG:
            if(state[i._arg1].kind != SQ_JIT_SLOT_INT) return false;
            set(i._arg0, SQJitLeafValue(SQ_JIT_SLOT_INT)); break;
        case _OP_EQ: case _OP_NE: {
            SQJitSlotKind left = state[i._arg2].kind;
            SQJitSlotKind right = i._arg3 ? literal(p, i._arg1).kind : state[i._arg1].kind;
            if((left != SQ_JIT_SLOT_INT && left != SQ_JIT_SLOT_BOOL) || left != right) return false;
            set(i._arg0, SQJitLeafValue(SQ_JIT_SLOT_BOOL)); break;
        }
        case _OP_CMP: case _OP_JCMP: {
            SQInteger right = i.op == _OP_CMP ? i._arg1 : i._arg0;
            if(state[right].kind != SQ_JIT_SLOT_INT || state[i._arg2].kind != SQ_JIT_SLOT_INT ||
                (i._arg3 != CMP_G && i._arg3 != CMP_GE && i._arg3 != CMP_L && i._arg3 != CMP_LE)) return false;
            if(i.op == _OP_CMP) set(i._arg0, SQJitLeafValue(SQ_JIT_SLOT_BOOL));
            break;
        }
        case _OP_JZ:
            if(state[i._arg0].kind != SQ_JIT_SLOT_INT && state[i._arg0].kind != SQ_JIT_SLOT_BOOL) return false;
            break;
        case _OP_RETURN:
            if(i._arg0 == 0xff || !scalar(state[i._arg1].kind)) return false;
            if(return_kind != SQ_JIT_SLOT_UNKNOWN && return_kind != state[i._arg1].kind) return false;
            return_kind = state[i._arg1].kind; break;
        case _OP_LINE: case _OP_JMP: break;
        default: return false;
        }
        if(facts.fallthrough && !merge(ip + 1, state)) return false;
        if(facts.target >= 0 && !merge(facts.target, state)) return false;
    }
    return return_kind != SQ_JIT_SLOT_UNKNOWN;
}
