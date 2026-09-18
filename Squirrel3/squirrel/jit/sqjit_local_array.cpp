#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_leaf.h"
#include "sqjit_virtual_array.h"
#include "sqjit_local_array.h"
#include <algorithm>

namespace {
struct LocalArray { SQInteger reg, create, last_append, base; std::vector<SQInteger> appends, keys; bool table, tokens; };
struct Branch { SQInteger at, target; };
}
bool SQJitLocalArrayPlan::Build(SQFunctionProto *p, const std::vector<SQInteger> &incoming_writes) {
    lowered.Null(); temporary_writes.clear();
    if(!p || p->_ninstructions <= 0 || p->_ninstructions > 512 || p->_bgenerator ||
       p->_varparams || p->_ndefaultparams || p->_noutervalues || p->_stacksize <= 0 ||
       p->_stacksize > SQJitLeafPlan::MAX_SCALAR_SLOTS || p->_nparameters < 1 ||
       p->_nparameters > p->_stacksize) return false;
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(p->_instructions, p->_ninstructions, p->_stacksize)) return false;
    SQInteger first_control = p->_ninstructions;
    for(SQInteger ip=0; ip<p->_ninstructions; ++ip) {
        const auto &facts = analysis.facts[ip];
        if(facts.target >= p->_ninstructions) return false;
        if(facts.target >= 0 || !facts.fallthrough) first_control = std::min(first_control, ip);
    }
    // Validate literal operands before indexing them, including malformed
    // protos supplied directly through the internal compilation API.
    auto valid_literal=[&](SQInteger n){return n>=0 && n<p->_nliterals;};
    for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
        const auto &i=p->_instructions[ip];
        if((i.op==_OP_LOAD || i.op==_OP_DLOAD || i.op==_OP_GETK ||
            ((i.op==_OP_EQ || i.op==_OP_NE) && i._arg3) ||
            (i.op==_OP_APPENDARRAY && i._arg2==AAT_LITERAL)) && !valid_literal(i._arg1))return false;
        if(i.op==_OP_DLOAD && !valid_literal(i._arg3))return false;
    }
    // Strings are symbolic keys only. Their integer identities must never
    // escape into arithmetic, comparisons, returns or externally visible stores.
    std::vector<SQInteger> tokens(p->_nliterals, -1);
    SQInteger next_token=0;
    for(SQInteger n=0;n<p->_nliterals;++n) if(sq_type(p->_literals[n])==OT_STRING) {
        for(SQInteger j=0;j<n;++j) if(sq_type(p->_literals[j])==OT_STRING &&
            _string(p->_literals[j])->_len==_string(p->_literals[n])->_len &&
            !memcmp(_stringval(p->_literals[j]),_stringval(p->_literals[n]),sq_rsl(_string(p->_literals[n])->_len))) tokens[n]=tokens[j];
        if(tokens[n]<0) tokens[n]=next_token++;
    }
    std::vector<SQInteger> init_key(p->_ninstructions,-1), literal_in(p->_stacksize,-1);
    for(SQInteger ip=0;ip<first_control;++ip) {
        const auto &i=p->_instructions[ip];
        if(i.op==_OP_NEWSLOT) init_key[ip]=literal_in[i._arg2];
        SQInteger move=i.op==_OP_MOVE?literal_in[i._arg1]:-1;
        SQInteger move2=i.op==_OP_DMOVE?literal_in[i._arg3]:-1;
        if(i.op==_OP_DMOVE)move=literal_in[i._arg1];
        for(SQInteger r=0;r<p->_stacksize;++r) if(analysis.facts[ip].writes.test(r))literal_in[r]=-1;
        if(i.op==_OP_LOAD || i.op==_OP_DLOAD)literal_in[i._arg0]=i._arg1;
        if(i.op==_OP_DLOAD)literal_in[i._arg2]=i._arg3;
        if(i.op==_OP_MOVE || i.op==_OP_DMOVE)literal_in[i._arg0]=move;
        if(i.op==_OP_DMOVE)literal_in[i._arg2]=i._arg3==i._arg0?move:move2;
    }
    std::vector<LocalArray> arrays;
    std::vector<SQInteger> by_register(p->_stacksize, -1), append_slot(p->_ninstructions, -1);
    SQInteger slots = p->_stacksize, initialized = -1;
    for(SQInteger ip=0; ip<p->_ninstructions; ++ip) {
        const auto &i = p->_instructions[ip];
        if(i.op != _OP_NEWOBJ) continue;
        if((i._arg3 != NOT_ARRAY && i._arg3 != NOT_TABLE) || ip >= first_control || i._arg0 < p->_nparameters ||
           by_register[i._arg0] >= 0 || arrays.size() >= SQJitVirtualArrayPlan::MAX_ARRAYS) return false;
        by_register[i._arg0] = arrays.size();
        LocalArray array = {i._arg0, ip, -1, 0, {}, {}, i._arg3==NOT_TABLE, false};
        arrays.push_back(array);
    }
    if(arrays.empty()) return false;
    for(auto &array : arrays) {
        // Before creation the compiler may reuse this register for scalar
        // initializer temporaries belonging to an earlier aggregate.
        for(SQInteger ip=array.create+1; ip<p->_ninstructions; ++ip) {
            const auto &i = p->_instructions[ip]; const auto &facts = analysis.facts[ip];
            if(facts.writes.test(array.reg)) return false;
            if(!facts.reads.test(array.reg)) continue;
            if(array.table && i.op==_OP_NEWSLOT && i._arg1==array.reg && i._arg0==255 && i._arg3!=array.reg) {
                SQInteger key=init_key[ip];
                if(ip>=first_control || key<0 || key>=p->_nliterals || tokens[key]<0 ||
                   array.appends.size()>=SQJitVirtualArrayPlan::MAX_ELEMENTS ||
                   std::find(array.keys.begin(),array.keys.end(),tokens[key])!=array.keys.end())return false;
                array.appends.push_back(ip);array.keys.push_back(tokens[key]);array.last_append=ip;
            } else if(!array.table && i.op == _OP_APPENDARRAY && i._arg0 == array.reg) {
                if(ip >= first_control || array.appends.size() >= SQJitVirtualArrayPlan::MAX_ELEMENTS ||
                   (i._arg2 == AAT_STACK && i._arg1 == array.reg) || i._arg2 == AAT_FLOAT) return false;
                bool token=i._arg2==AAT_LITERAL && i._arg1>=0 && i._arg1<p->_nliterals && tokens[i._arg1]>=0;
                if(!array.appends.empty() && token!=array.tokens)return false;
                array.tokens=token;
                array.appends.push_back(ip); array.last_append = ip;
            } else if(i.op == _OP_GET && i._arg1 == array.reg && i._arg2 != array.reg) {
                // Verified below to occur after every initialization append.
            } else if(i.op == _OP_GETK && i._arg2 == array.reg) {
                if(i._arg1 < 0 || i._arg1 >= p->_nliterals || (array.table?tokens[i._arg1]<0:sq_type(p->_literals[i._arg1]) != OT_INTEGER)) return false;
            } else if(i.op == _OP_SET && i._arg1 == array.reg && i._arg2 != array.reg && i._arg3 != array.reg) {
                if(array.tokens)return false; // String-key arrays are immutable.
                // Private scalar cells, never externally visible heap writes.
            } else return false; // No aliases, calls, nested arrays, returns or identity observations.
        }
        if(array.appends.empty()) return false;
        initialized = std::max(initialized, array.last_append);
        array.base = slots;
        for(SQInteger ip : array.appends) append_slot[ip] = slots++;
        for(SQInteger ip=array.create+1; ip<=array.last_append; ++ip)
            if(analysis.facts[ip].reads.test(array.reg) && p->_instructions[ip].op != (array.table?_OP_NEWSLOT:_OP_APPENDARRAY)) return false;
    }
    // Allocation/initialization must run exactly once before entering any loop;
    // no branch may reenter the prefix and recreate or append to a virtual array.
    for(const auto &facts : analysis.facts)
        if(facts.target >= 0 && facts.target <= initialized) return false;
    // Forward may-type analysis. At joins preserve both possibilities rather
    // than confusing an ordinary integer with an encoded string key.
    enum { SCALAR=1, TOKEN=2 };
    std::vector<std::vector<unsigned char>> types(p->_ninstructions);
    types[0].assign(p->_stacksize,SCALAR);
    bool changed=true;
    while(changed) {
        changed=false;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            if(types[ip].empty())continue;
            auto out=types[ip];const auto &i=p->_instructions[ip];const auto &f=analysis.facts[ip];
            for(SQInteger r=0;r<p->_stacksize;++r)if(f.writes.test(r))out[r]=SCALAR;
            auto literal_type=[&](SQInteger n){return n>=0 && n<p->_nliterals && tokens[n]>=0?TOKEN:SCALAR;};
            if(i.op==_OP_LOAD || i.op==_OP_DLOAD)out[i._arg0]=literal_type(i._arg1);
            if(i.op==_OP_DLOAD)out[i._arg2]=literal_type(i._arg3);
            if(i.op==_OP_MOVE || i.op==_OP_DMOVE)out[i._arg0]=types[ip][i._arg1];
            if(i.op==_OP_DMOVE)out[i._arg2]=i._arg3==i._arg0?out[i._arg0]:types[ip][i._arg3];
            if(i.op==_OP_GET || i.op==_OP_GETK) {
                SQInteger a=by_register[i.op==_OP_GET?i._arg1:i._arg2];
                if(a>=0 && ip>arrays[a].create && arrays[a].tokens)out[i._arg0]=TOKEN;
            }
            auto merge=[&](SQInteger target) {
                if(target<0 || target>=p->_ninstructions)return;
                if(types[target].empty()){types[target]=out;changed=true;return;}
                for(SQInteger r=0;r<p->_stacksize;++r) {
                    auto joined=types[target][r]|out[r];
                    if(joined!=types[target][r]){types[target][r]=joined;changed=true;}
                }
            };
            if(f.fallthrough)merge(ip+1);
            if(f.target>=0)merge(f.target);
        }
    }
    for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
        if(types[ip].empty())continue;
        const auto &i=p->_instructions[ip];SQSlotSet allowed;
        if(i.op==_OP_MOVE || i.op==_OP_DMOVE)allowed.set(i._arg1);
        if(i.op==_OP_DMOVE)allowed.set(i._arg3);
        if(i.op==_OP_GET || i.op==_OP_SET || i.op==_OP_NEWSLOT) {
            SQInteger a=by_register[i._arg1];
            if(a>=0 && ip>arrays[a].create && arrays[a].table) {
                if(types[ip][i._arg2]!=TOKEN)return false;
                allowed.set(i._arg2);
                // The key and value may be the same register. Permission to
                // consume a symbolic key must not authorize storing it.
                if((i.op==_OP_SET || i.op==_OP_NEWSLOT) && (types[ip][i._arg3]&TOKEN))return false;
            }
        }
        for(SQInteger r=0;r<p->_stacksize;++r)
            if(analysis.facts[ip].reads.test(r) && (types[ip][r]&TOKEN) && !allowed.test(r))return false;
        // Literal comparisons can otherwise bypass the register read facts.
        if((i.op==_OP_EQ || i.op==_OP_NE) && i._arg3 && tokens[i._arg1]>=0)return false;
    }
    SQInteger index = slots++, compare = slots++, constant = slots++;
    if(slots > SQJitLeafPlan::MAX_SCALAR_SLOTS) return false;
    std::vector<SQInstruction> code;
    std::vector<SQInteger> offsets(p->_ninstructions);
    std::vector<Branch> branches;
    auto emit = [&](SQOpcode op, SQInteger a0=0, SQInteger a1=0, SQInteger a2=0, SQInteger a3=0) {
        code.push_back(SQInstruction(op, a0, a1, a2, a3));
    };
    for(SQInteger ip=0; ip<p->_ninstructions; ++ip) {
        offsets[ip] = code.size(); const auto &i = p->_instructions[ip];
        if(i.op == _OP_NEWOBJ) emit(_OP_LINE);
        else if(append_slot[ip] >= 0) {
            SQInteger dst = append_slot[ip];
            if(i.op==_OP_NEWSLOT) { emit(_OP_MOVE,dst,i._arg3); }
            else switch(i._arg2) {
            case AAT_STACK: emit(_OP_MOVE, dst, i._arg1); break;
            case AAT_LITERAL: if(tokens[i._arg1]>=0)emit(_OP_LOADINT,dst,tokens[i._arg1]); else emit(_OP_LOAD, dst, i._arg1); break;
            case AAT_INT: emit(_OP_LOADINT, dst, i._arg1); break;
            case AAT_BOOL: emit(_OP_LOADBOOL, dst, i._arg1); break;
            default: return false;
            }
        } else if((i.op == _OP_GET || i.op == _OP_SET || i.op == _OP_GETK) &&
                  by_register[i.op == _OP_GETK ? i._arg2 : i._arg1] >= 0 &&
                  ip>arrays[by_register[i.op == _OP_GETK ? i._arg2 : i._arg1]].create) {
            if(i.op != _OP_SET) temporary_writes.push_back(code.size());
            const auto &array = arrays[by_register[i.op == _OP_GETK ? i._arg2 : i._arg1]];
            if(i.op == _OP_GETK) { if(array.table)emit(_OP_LOADINT,index,tokens[i._arg1]); else emit(_OP_LOAD, index, i._arg1); }
            else emit(_OP_MOVE, index, i._arg2);
            std::vector<SQInteger> done;
            for(SQInteger element=0; element<(SQInteger)array.appends.size(); ++element) {
                emit(_OP_LOADINT, constant, array.table?array.keys[element]:element);
                emit(_OP_EQ, compare, constant, index);
                SQInteger next = code.size(); emit(_OP_JZ, compare);
                if(i.op == _OP_SET) {
                    emit(_OP_MOVE, array.base + element, i._arg3);
                    if(i._arg0 != 255) emit(_OP_MOVE, i._arg0, i._arg3);
                } else emit(_OP_MOVE, i._arg0, array.base + element);
                done.push_back(code.size()); emit(_OP_JMP);
                code[next]._arg1 = code.size() - next - 1;
            }
            // Internal, guaranteed guard failure. The LLVM division lowerer
            // returns GUARD_FAILED before evaluating division by zero. There
            // is no edge from this block to the scalar join, so a float read
            // cannot acquire an artificial integer result in type analysis.
            // This lowered proto is never installed as interpreter bytecode.
            emit(_OP_LOADINT, constant, 0);
            emit(_OP_DIV, constant, constant, constant);
            emit(_OP_JMP, 0, -1);
            for(SQInteger at : done) code[at]._arg1 = code.size() - at - 1;
        } else if(i.op==_OP_LOAD || i.op==_OP_DLOAD) {
            auto load_literal=[&](SQInteger dst,SQInteger lit) {
                if(tokens[lit]>=0)emit(_OP_LOADINT,dst,tokens[lit]);else emit(_OP_LOAD,dst,lit);
            };
            load_literal(i._arg0,i._arg1);
            if(i.op==_OP_DLOAD)load_literal(i._arg2,i._arg3);
        } else {
            if(analysis.facts[ip].target >= 0) branches.push_back({(SQInteger)code.size(), analysis.facts[ip].target});
            code.push_back(i);
        }
        if(code.size() > 512) return false;
    }
    for(const auto &branch : branches) code[branch.at]._arg1 = offsets[branch.target] - branch.at - 1;
    for(SQInteger ip : incoming_writes) {
        if(ip < 0 || ip >= p->_ninstructions) return false;
        temporary_writes.push_back(offsets[ip]);
    }
    std::sort(temporary_writes.begin(), temporary_writes.end());
    temporary_writes.erase(std::unique(temporary_writes.begin(), temporary_writes.end()), temporary_writes.end());
    auto result = SQFunctionProto::Create(p->_sharedstate, code.size(), p->_nliterals, p->_nparameters, 0, 0, 0, 0, 0);
    if(!result) return false;
    lowered = SQObjectPtr(result); result->_stacksize = slots;
    result->_bgenerator = false; result->_varparams = 0;
    result->_name = p->_name; result->_sourcename = p->_sourcename;
    std::copy(code.begin(), code.end(), result->_instructions);
    std::copy(p->_literals, p->_literals+p->_nliterals, result->_literals);
    return true;
}
SQFunctionProto *SQJitLocalArrayPlan::Lowered() const {
    return sq_type(lowered) == OT_FUNCPROTO ? _funcproto(lowered) : nullptr;
}
