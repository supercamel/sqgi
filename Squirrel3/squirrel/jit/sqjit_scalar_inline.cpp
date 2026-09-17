#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqbytecode.h"
#include "sqjit_leaf.h"
#include "sqjit_scalar_inline.h"
#include <algorithm>

namespace {
struct CallSite {
    SQInteger prepare = -1;
    SQFunctionProto *callee = nullptr;
};
struct Fixup { SQInteger instruction, target; };
// Leaf eligibility validates every operand before this remapping runs.
SQInstruction remap(SQInstruction i, SQInteger base, SQInteger literals) {
    switch(i.op) {
    case _OP_LINE: case _OP_JMP: break;
    case _OP_LOAD: i._arg0 += base; i._arg1 += literals; break;
    case _OP_DLOAD: i._arg0 += base; i._arg2 += base; i._arg1 += literals; i._arg3 += literals; break;
    case _OP_LOADINT: case _OP_LOADBOOL: case _OP_LOADFLOAT: i._arg0 += base; break;
    case _OP_MOVE: case _OP_NEG: i._arg0 += base; i._arg1 += base; break;
    case _OP_DMOVE: i._arg0 += base; i._arg1 += base; i._arg2 += base; i._arg3 += base; break;
    case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD: case _OP_CMP:
        i._arg0 += base; i._arg1 += base; i._arg2 += base; break;
    case _OP_EQ: case _OP_NE:
        i._arg0 += base; i._arg2 += base; i._arg1 += i._arg3 ? literals : base; break;
    case _OP_JZ: i._arg0 += base; break;
    case _OP_JCMP: i._arg0 += base; i._arg2 += base; break;
    default: assert(false); break;
    }
    return i;
}
}
bool SQJitScalarInlinePlan::Build(SQFunctionProto *p, SQObjectPtr *entry, SQClosure *closure) {
    bindings.clear(); temporary_writes.clear(); lowered.Null();
    if(!p || !entry || !closure || closure->_env || p->_bgenerator || p->_varparams ||
       p->_ndefaultparams || p->_noutervalues || p->_nparameters < 1 ||
       p->_nparameters > SQJitLeafPlan::MAX_PARAMETERS || p->_nparameters > p->_stacksize || p->_ninstructions > 512 ||
       p->_stacksize <= 0 || p->_stacksize > SQJitLeafPlan::MAX_SCALAR_SLOTS ||
       sq_type(entry[0]) != OT_TABLE) return false;
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(p->_instructions, p->_ninstructions, p->_stacksize)) return false;
    std::vector<CallSite> sites(p->_ninstructions);
    std::vector<bool> preparations(p->_ninstructions, false);
    for(SQInteger ip = 0; ip < p->_ninstructions; ++ip) {
        const auto &i = p->_instructions[ip];
        if(analysis.facts[ip].writes.test(0) || analysis.facts[ip].target >= p->_ninstructions) return false;
        if(i.op != _OP_CALL && i.op != _OP_TAILCALL) continue;
        if(i._arg3 < 1 || i._arg3 > SQJitLeafPlan::MAX_PARAMETERS) return false;
        // Only accept an unambiguous PREPCALLK in the same basic block. No
        // predecessor can skip preparation or replace the callable/receiver.
        SQInteger prep = ip - 1;
        while(prep >= 0) {
            if(analysis.leaders[prep + 1]) return false;
            if(analysis.facts[prep].writes.test(i._arg1)) break;
            if(analysis.facts[prep].writes.test(i._arg2)) return false;
            --prep;
        }
        if(prep < 0 || preparations[prep]) return false;
        const auto &prepare = p->_instructions[prep];
        if(prepare.op != _OP_PREPCALLK || prepare._arg2 != 0 || prepare._arg3 != i._arg2 ||
           prepare._arg0 == prepare._arg3 || prepare._arg1 < 0 || prepare._arg1 >= p->_nliterals)
            return false;
        // Prepared managed values must not escape into scalar expressions or
        // remain live after the call. Nested argument calls may still be pure.
        for(SQInteger at = prep + 1; at < ip; ++at)
            if(analysis.facts[at].reads.test(prepare._arg0) || analysis.facts[at].reads.test(prepare._arg3))
                return false;
        if(i.op != _OP_TAILCALL && ip + 1 < p->_ninstructions)
            for(SQInteger slot : {(SQInteger)prepare._arg0, (SQInteger)prepare._arg3})
                if(slot != i._arg0 && analysis.live_in[ip + 1].test(slot)) return false;
        const auto &key = p->_literals[prepare._arg1];
        SQObjectPtr value;
        if(sq_type(key) != OT_STRING || !_table(entry[0])->GetRaw(key, value) || sq_type(value) != OT_CLOSURE)
            return false;
        SQClosure *callee = _closure(value);
        if(callee->_env || callee->_function->_nparameters != i._arg3 ||
           !SQJitLeafPlan::Eligible(callee->_function)) return false;
        for(SQInteger at = 0; at < callee->_function->_ninstructions; ++at) {
            const auto &op = callee->_function->_instructions[at];
            if((op.op == _OP_EQ || op.op == _OP_NE) && op._arg3 &&
               (op._arg1 < 0 || op._arg1 >= callee->_function->_nliterals)) return false;
        }
        SQJitScalarBinding binding;
        binding.key = key;
        binding.target = SQObjectPtr(callee->GetWeakRef(OT_CLOSURE));
        bindings.push_back(binding);
        sites[ip].prepare = prep; sites[ip].callee = callee->_function;
        preparations[prep] = true;
    }
    if(bindings.empty()) return false;
    for(SQInteger ip = 0; ip < p->_ninstructions; ++ip)
        if(p->_instructions[ip].op == _OP_PREPCALLK && !preparations[ip]) return false;
    std::vector<SQInstruction> code;
    std::vector<SQObjectPtr> literals(p->_literals, p->_literals + p->_nliterals);
    std::vector<SQInteger> offsets(p->_ninstructions);
    std::vector<Fixup> branches;
    SQInteger slots = p->_stacksize;
    for(SQInteger ip = 0; ip < p->_ninstructions; ++ip) {
        offsets[ip] = code.size();
        const auto &i = p->_instructions[ip];
        if(preparations[ip]) { temporary_writes.push_back(code.size()); code.push_back(SQInstruction(_OP_LINE)); continue; }
        SQFunctionProto *callee = sites[ip].callee;
        if(!callee) {
            if(analysis.facts[ip].target >= 0) branches.push_back({(SQInteger)code.size(), analysis.facts[ip].target});
            code.push_back(i); continue;
        }
        SQInteger base = slots;
        slots += callee->_stacksize;
        SQInteger result = i._arg0 == 255 ? slots++ : (SQInteger)i._arg0;
        if(slots > SQJitLeafPlan::MAX_SCALAR_SLOTS) return false;
        SQInteger literal_base = literals.size();
        if(literal_base + callee->_nliterals > 255) return false; // DLOAD's second index is one byte.
        literals.insert(literals.end(), callee->_literals, callee->_literals + callee->_nliterals);
        // Isolate every parameter from the caller: helpers may overwrite them.
        for(SQInteger n = 1; n < i._arg3; ++n)
            code.push_back(SQInstruction(_OP_MOVE, base + n, i._arg2 + n));
        std::vector<SQInteger> leaf_offsets(callee->_ninstructions);
        std::vector<Fixup> leaf_branches;
        std::vector<SQInteger> returns;
        for(SQInteger at = 0; at < callee->_ninstructions; ++at) {
            leaf_offsets[at] = code.size();
            const auto &op = callee->_instructions[at];
            if(op.op == _OP_RETURN) {
                if(op._arg0 == 255) return false;
                code.push_back(SQInstruction(_OP_MOVE, result, base + op._arg1));
                returns.push_back(code.size()); code.push_back(SQInstruction(_OP_JMP));
            } else {
                SQInteger target;
                if(sq_bytecode_branch_target(op, at, target)) leaf_branches.push_back({(SQInteger)code.size(), target});
                code.push_back(remap(op, base, literal_base));
            }
        }
        for(const auto &branch : leaf_branches)
            code[branch.instruction]._arg1 = leaf_offsets[branch.target] - branch.instruction - 1;
        for(SQInteger at : returns) code[at]._arg1 = code.size() - at - 1;
        if(i.op == _OP_TAILCALL) code.push_back(SQInstruction(_OP_RETURN, 1, result));
        if(code.size() > 512) return false;
    }
    for(const auto &branch : branches)
        code[branch.instruction]._arg1 = offsets[branch.target] - branch.instruction - 1;
    if(code.empty() || code.size() > 512) return false;
    auto result = SQFunctionProto::Create(p->_sharedstate, code.size(), literals.size(), p->_nparameters, 0, 0, 0, 0, 0);
    if(!result) return false;
    lowered = SQObjectPtr(result);
    result->_stacksize = slots; result->_bgenerator = false; result->_varparams = 0;
    result->_name = p->_name; result->_sourcename = p->_sourcename;
    std::copy(code.begin(), code.end(), result->_instructions);
    std::copy(literals.begin(), literals.end(), result->_literals);
    return true;
}
SQFunctionProto *SQJitScalarInlinePlan::Lowered() const {
    return sq_type(lowered) == OT_FUNCPROTO ? _funcproto(lowered) : nullptr;
}
