/* Bounded escape analysis for fresh numeric arrays used within one block. */
#ifndef SQJIT_VIRTUAL_ARRAY_H
#define SQJIT_VIRTUAL_ARRAY_H
#include "sqbytecode.h"
#include "sqfuncproto.h"

// Interpreter arithmetic may invoke metamethods. Once admitted by the native
// scalar lowerer it cannot call user code, allocate, or mutate the heap. Keep
// this list explicit rather than weakening the shared bytecode effect facts.
inline bool sqjit_native_scalar_opcode(SQOpcode op) {
    switch(op) {
    case _OP_LOAD: case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
    case _OP_LOADNULLS: case _OP_DLOAD: case _OP_MOVE: case _OP_DMOVE:
    case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD:
    case _OP_BITW: case _OP_NEG: case _OP_NOT: case _OP_BWNOT:
    case _OP_EQ: case _OP_NE: case _OP_CMP: case _OP_INCL: case _OP_PINCL:
        return true;
    default: return false;
    }
}

class SQJitVirtualArrayPlan {
public:
    struct Array { SQInteger create, end, reg, first_slot, elements; };
    enum { MAX_ARRAYS = 4, MAX_ELEMENTS = 8 };
    std::vector<Array> arrays;
    SQInteger slots;
    SQJitVirtualArrayPlan() : slots(0) {}
    void Build(SQFunctionProto *proto, const SQBytecodeAnalysis &analysis, SQInteger first, SQInteger last) {
        for(SQInteger ip=first; ip<=last && arrays.size()<MAX_ARRAYS; ++ip) {
            const SQInstruction &create = proto->_instructions[ip];
            if(create.op != _OP_NEWOBJ || create._arg3 != NOT_ARRAY) continue;
            Array a = {ip,-1,create._arg0,slots,0};
            bool read = false;
            for(SQInteger n=ip+1; n<=last && n<=ip+64; ++n) {
                const SQInstruction &i = proto->_instructions[n];
                const SQBytecodeFacts &f = analysis.facts[n];
                if(analysis.leaders[n] || f.target >= 0 || !f.fallthrough) break;
                if(i.op == _OP_APPENDARRAY && i._arg0 == a.reg) {
                    if(read || ++a.elements > MAX_ELEMENTS || (i._arg2 == AAT_STACK && i._arg1 == a.reg)) break;
                }
                else if(f.reads.test(a.reg)) {
                    SQInteger index;
                    if(!Index(proto, analysis, n, a.reg, index) || index < 0 || index >= a.elements) break;
                    read = true;
                }
                else if(!sqjit_native_scalar_opcode((SQOpcode)i.op)) break;
                else if(f.writes.test(a.reg)) break;
                if(!analysis.live_in[n+1].test(a.reg) || f.kills.test(a.reg)) {
                    if(read) a.end=n;
                    break;
                }
            }
            if(a.end >= 0) { arrays.push_back(a); slots += a.elements; }
        }
    }
    const Array *At(SQInteger ip, SQInteger reg) const {
        for(const Array &a : arrays) if(a.reg == reg && ip >= a.create && ip <= a.end) return &a;
        return NULL;
    }
    static bool Index(SQFunctionProto *p, const SQBytecodeAnalysis &analysis,
        SQInteger ip, SQInteger reg, SQInteger &index) {
        const SQInstruction &i = p->_instructions[ip];
        if(i.op == _OP_GETK && i._arg2 == reg && i._arg1 >= 0 && i._arg1 < p->_nliterals &&
            sq_type(p->_literals[i._arg1]) == OT_INTEGER) { index=_integer(p->_literals[i._arg1]); return true; }
        if(i.op != _OP_GET || i._arg1 != reg || i._arg2 == reg || ip == 0 || analysis.leaders[ip]) return false;
        const SQInstruction &load = p->_instructions[ip-1];
        if(load._arg0 != i._arg2) return false;
        if(load.op == _OP_LOADINT) { index=load._arg1; return true; }
        if(load.op == _OP_LOAD && load._arg1 >= 0 && load._arg1 < p->_nliterals &&
            sq_type(p->_literals[load._arg1]) == OT_INTEGER) { index=_integer(p->_literals[load._arg1]); return true; }
        return false;
    }
};
#endif
