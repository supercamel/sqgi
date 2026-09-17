#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_leaf.h"
#include "sqjit_local_graph.h"
#include "sqjit_numeric_ops.h"
#include <algorithm>
#include <cstdint>
#include <set>

namespace {
// Separate provenance for scalar/string values and up to 64 local objects.
// Two portable words avoid compiler-specific 128-bit integer requirements.
struct Mask {
    uint64_t values,refs;
    constexpr Mask(uint64_t v=0,uint64_t r=0):values(v),refs(r){}
    explicit operator bool() const{return values || refs;}
    Mask operator~() const{return {~values,~refs};}
    Mask operator&(Mask b) const{return {values&b.values,refs&b.refs};}
    Mask operator|(Mask b) const{return {values|b.values,refs|b.refs};}
    Mask &operator|=(Mask b){values|=b.values;refs|=b.refs;return *this;}
    bool operator==(Mask b) const{return values==b.values && refs==b.refs;}
    bool operator!=(Mask b) const{return !(*this==b);}
};
constexpr Mask integer_value = 1, float_value = UINT64_C(1)<<34;
constexpr Mask absent = UINT64_C(1)<<35;
constexpr Mask scalar = Mask(1|(UINT64_C(1)<<34)), strings = UINT64_C(0x1fffffffe);
constexpr Mask objects = Mask(0,UINT64_MAX), callable = UINT64_C(1)<<63;
constexpr Mask uninitialized = UINT64_C(1)<<62;
constexpr Mask null_value = UINT64_C(1)<<33;
Mask object_bit(size_t n) { return Mask(0,UINT64_C(1)<<n); }
Mask string_bit(size_t n) { return UINT64_C(1) << (1+n); }
struct Object { bool table; SQInteger base; std::vector<SQInteger> keys; SQInteger klass=-1; Object(bool t,SQInteger b):table(t),base(b){} };
struct Shape { SQInteger object=-1, literal=-1; };
struct Branch { SQInteger at, target; };
bool single(Mask m) { return m.refs? !m.values && !(m.refs&(m.refs-1)): m.values && !(m.values&(m.values-1)); }
}

bool SQJitLocalGraphPlan::Build(SQFunctionProto *p, const std::vector<SQInteger> &incoming) {
    lowered.Null(); temporary_writes.clear(); string_length=array_length=false;
    if(!p || p->_ninstructions<=0 || p->_ninstructions>2048 || p->_bgenerator ||
       p->_varparams || p->_noutervalues || p->_ndefaultparams || p->_stacksize<=0 ||
       p->_stacksize>192 || p->_nparameters<1 || p->_nparameters>p->_stacksize)return false;
    // Reject unrelated functions before allocating analysis state. In
    // particular, constructors and arbitrary method calls are not graphs.
    unsigned allocations=0;
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){
        const auto &i=p->_instructions[ip];
        switch(i.op){
        case SQJIT_OP_INSTANCE:++allocations;break;
        case SQJIT_OP_CLASS_GUARD:break;
        case _OP_NEWOBJ:
            if(i._arg3!=NOT_ARRAY && i._arg3!=NOT_TABLE)return false;
            ++allocations;break;
        case _OP_PREPCALLK:
            if(i._arg1<0 || i._arg1>=p->_nliterals || sq_type(p->_literals[i._arg1])!=OT_STRING ||
               _string(p->_literals[i._arg1])->_len!=3 ||
               memcmp(_stringval(p->_literals[i._arg1]),_SC("len"),3*sizeof(SQChar)))return false;
            break;
        case SQJIT_OP_TOFLOAT:case SQJIT_OP_MATH:
        case _OP_LOADNULLS:
        case _OP_LINE:case _OP_LOADINT:case _OP_LOADFLOAT:case _OP_LOADBOOL:case _OP_LOAD:case _OP_DLOAD:
        case _OP_MOVE:case _OP_DMOVE:case _OP_GET:case _OP_GETK:case _OP_SET:
        case _OP_NEWSLOT:case _OP_APPENDARRAY:case _OP_CALL:
        case _OP_ADD:case _OP_SUB:case _OP_MUL:case _OP_DIV:case _OP_MOD:case _OP_NEG:
        case _OP_EQ:case _OP_NE:case _OP_CMP:case _OP_JCMP:case _OP_JZ:case _OP_JMP:
        case _OP_RETURN:case _OP_INCL:case _OP_PINCL:break;
        default:return false;
        }
    }
    if(allocations<2 || allocations>64)return false;
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize))return false;
    std::vector<SQInteger> tokens(p->_nliterals,-1), representatives;
    for(SQInteger n=0;n<p->_nliterals;++n)if(sq_type(p->_literals[n])==OT_STRING){
        for(size_t j=0;j<representatives.size();++j)
            if(_string(p->_literals[n])==_string(p->_literals[representatives[j]]))tokens[n]=j;
        if(tokens[n]<0){if(representatives.size()==32)return false;tokens[n]=representatives.size();representatives.push_back(n);}
    }
    auto literal_valid=[&](SQInteger n){return n>=0 && n<p->_nliterals;};
    auto literal_type=[&](SQInteger n)->Mask {
        if(!literal_valid(n))return 0;
        auto type=sq_type(p->_literals[n]);
        return type==OT_NULL?null_value:tokens[n]>=0?string_bit(tokens[n]):
            type==OT_FLOAT?float_value:(type==OT_INTEGER || type==OT_BOOL)?integer_value:Mask();
    };
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){
        const auto &i=p->_instructions[ip];const auto &f=analysis.facts[ip];
        if(f.target>=p->_ninstructions || f.reads.test(0) || f.writes.test(0))return false;
        if((i.op==_OP_LOAD || i.op==_OP_DLOAD || i.op==_OP_GETK || i.op==_OP_PREPCALLK ||
            ((i.op==_OP_EQ || i.op==_OP_NE) && i._arg3) ||
            (i.op==_OP_APPENDARRAY && i._arg2==AAT_LITERAL)) && !literal_valid(i._arg1))return false;
        if(i.op==_OP_DLOAD && !literal_valid(i._arg3))return false;
    }
    // Constant array indices often arrive through LOADINT rather than GETK.
    // Recover them within a basic block, before expanding nested selections.
    std::vector<bool> fixed(p->_ninstructions,false);
    std::vector<SQInteger> indices(p->_ninstructions,0);
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){
        const auto &i=p->_instructions[ip];
        if(i.op==_OP_GETK){if(sq_type(p->_literals[i._arg1])==OT_INTEGER){fixed[ip]=true;indices[ip]=_integer(p->_literals[i._arg1]);}continue;}
        if(i.op!=_OP_GET && i.op!=_OP_SET)continue;
        SQInteger reg=i._arg2;
        for(SQInteger at=ip-1;at>=0;--at){
            if(analysis.leaders[at+1])break;
            if(!analysis.facts[at].writes.test(reg))continue;
            const auto &op=p->_instructions[at];
            if(op.op==_OP_LOADINT && op._arg0==reg){fixed[ip]=true;indices[ip]=(SQInt32)op._arg1;break;}
            SQInteger literal=-1;
            if((op.op==_OP_LOAD || op.op==_OP_DLOAD) && op._arg0==reg)literal=op._arg1;
            if(op.op==_OP_DLOAD && op._arg2==reg)literal=op._arg3;
            if(literal>=0 && sq_type(p->_literals[literal])==OT_INTEGER){fixed[ip]=true;indices[ip]=_integer(p->_literals[literal]);break;}
            if(op.op==_OP_MOVE){reg=op._arg1;continue;}
            if(op.op==_OP_DMOVE){reg=op._arg2==reg && op._arg3!=op._arg0?op._arg3:op._arg1;continue;}
            break;
        }
    }
    // Discover each allocation's shape within its basic block. Repeated
    // allocations require a separate liveness proof below before reusing cells.
    std::vector<Object> graph;
    std::vector<Shape> shape(p->_stacksize);
    std::vector<SQInteger> created(p->_ninstructions,-1), initialized(p->_ninstructions,-1), init_object(p->_ninstructions,-1);
    bool nested=false;
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){
        if(analysis.leaders[ip])shape.assign(p->_stacksize,Shape());
        const auto &i=p->_instructions[ip];auto old=shape;
        for(SQInteger r=0;r<p->_stacksize;++r)if(analysis.facts[ip].writes.test(r))shape[r]={};
        if(i.op==_OP_NEWOBJ || i.op==SQJIT_OP_INSTANCE){
            if((i.op==_OP_NEWOBJ && i._arg3!=NOT_ARRAY && i._arg3!=NOT_TABLE) || i._arg1<0 || graph.size()==64)return false;
            created[ip]=graph.size();graph.emplace_back(i.op==SQJIT_OP_INSTANCE || i._arg3==NOT_TABLE,0);
            if(i.op==SQJIT_OP_INSTANCE)graph.back().klass=i._arg1;
            shape[i._arg0].object=created[ip];
        }else if(i.op==_OP_NEWSLOT || i.op==_OP_APPENDARRAY){
            SQInteger a=old[i.op==_OP_NEWSLOT?i._arg1:i._arg0].object;
            if(a<0 || graph[a].keys.size()==8)return false;
            auto &g=graph[a];SQInteger key=g.keys.size();
            if(i.op==_OP_NEWSLOT){
                auto lit=old[i._arg2].literal;
                if(!g.table || i._arg0!=255 || !literal_valid(lit) || tokens[lit]<0)return false;
                key=tokens[lit];
                if(std::find(g.keys.begin(),g.keys.end(),key)!=g.keys.end())return false;
                nested=nested || old[i._arg3].object>=0;
            }else{
                if(g.table || i._arg2==AAT_FLOAT)return false;
                nested=nested || (i._arg2==AAT_STACK && old[i._arg1].object>=0);
            }
            init_object[ip]=a;initialized[ip]=g.keys.size();g.keys.push_back(key);
        }else if(i.op==_OP_SET){nested=nested || old[i._arg3].object>=0;
        }else if(i.op==_OP_LOAD || i.op==_OP_DLOAD){
            shape[i._arg0].literal=i._arg1;if(i.op==_OP_DLOAD)shape[i._arg2].literal=i._arg3;
        }else if(i.op==_OP_MOVE || i.op==_OP_DMOVE){
            shape[i._arg0]=old[i._arg1];
            if(i.op==_OP_DMOVE)shape[i._arg2]=i._arg3==i._arg0?shape[i._arg0]:old[i._arg3];
        }
    }
    // Keep established simple aggregate plans first; this pass handles graphs.
    if(!nested)return false;
    SQInteger slots=p->_stacksize;
    for(auto &g:graph){if(g.keys.empty())return false;g.base=slots;slots+=g.keys.size();}
    if(slots+4>SQJitLeafPlan::MAX_SCALAR_SLOTS)return false;
    using State=std::vector<Mask>;
    std::vector<State> types(p->_ninstructions);
    types[0].assign(slots,uninitialized);for(SQInteger n=1;n<p->_nparameters;++n)types[0][n]=integer_value;
    for(SQInteger n=p->_stacksize;n<slots;++n)types[0][n]=absent;
    auto cells=[&](Mask owners,Mask key,bool constant,SQInteger index){
        std::vector<SQInteger> result;
        for(size_t a=0;a<graph.size();++a)if(owners&object_bit(a)){
            const auto &g=graph[a];
            for(size_t e=0;e<g.keys.size();++e){
                bool possible=g.table?(key&string_bit(g.keys[e]))!=0:(key&scalar)!=0;
                if(!g.table && constant)possible=(key&scalar) && index==(SQInteger)e;
                if(possible)result.push_back(g.base+e);
            }
        }
        return result;
    };
    auto member=[&](SQInteger ip,const State &s){const auto &i=p->_instructions[ip];return cells(s[i.op==_OP_GETK?i._arg2:i._arg1],i.op==_OP_GETK?literal_type(i._arg1):s[i._arg2],fixed[ip],indices[ip]);};
    std::set<SQInteger> pending{0};unsigned visits=0;
    while(!pending.empty()){
        if(++visits>32768)return false;
        SQInteger ip=*pending.begin();pending.erase(pending.begin());
        auto out=types[ip];const auto &in=types[ip];const auto &i=p->_instructions[ip];const auto &f=analysis.facts[ip];
        for(SQInteger r=0;r<p->_stacksize;++r)if(f.writes.test(r))out[r]=integer_value;
        if(created[ip]>=0){
            out[i._arg0]=object_bit(created[ip]);
            const auto &g=graph[created[ip]];for(size_t n=0;n<g.keys.size();++n)out[g.base+n]=uninitialized;
        }
        else if(initialized[ip]>=0){
            Mask value=i.op==_OP_NEWSLOT?in[i._arg3]:i._arg2==AAT_STACK?in[i._arg1]:i._arg2==AAT_LITERAL?literal_type(i._arg1):integer_value;
            out[graph[init_object[ip]].base+initialized[ip]]=value;
        }else switch(i.op){
        case _OP_LOADFLOAT:case SQJIT_OP_TOFLOAT:case SQJIT_OP_MATH:out[i._arg0]=float_value;break;
        case _OP_ADD:case _OP_SUB:case _OP_MUL:case _OP_DIV:case _OP_MOD:
            out[i._arg0]=(in[i._arg1]==float_value || in[i._arg2]==float_value)?float_value:
                ((in[i._arg1]|in[i._arg2])&float_value)?scalar:integer_value;break;
        case _OP_LOADNULLS:for(SQInteger n=0;n<i._arg1;++n)out[i._arg0+n]=null_value;break;
        case _OP_LOAD:case _OP_DLOAD:out[i._arg0]=literal_type(i._arg1);if(i.op==_OP_DLOAD)out[i._arg2]=literal_type(i._arg3);break;
        case _OP_MOVE:case _OP_DMOVE:out[i._arg0]=in[i._arg1];if(i.op==_OP_DMOVE)out[i._arg2]=i._arg3==i._arg0?out[i._arg0]:in[i._arg3];break;
        case _OP_GET:case _OP_GETK:{Mask value=0;for(auto cell:member(ip,in))value|=in[cell]&~absent;out[i._arg0]=value;break;}
        case _OP_SET:{auto targets=member(ip,in);for(auto cell:targets){if(targets.size()==1)out[cell]=in[i._arg3];else out[cell]|=in[i._arg3];}if(i._arg0!=255)out[i._arg0]=in[i._arg3];break;}
        case _OP_PREPCALLK:out[i._arg0]=callable;out[i._arg3]=in[i._arg2];break;
        default:break;
        }
        auto merge=[&](SQInteger dest){
            if(dest<0 || dest>=p->_ninstructions)return;
            if(types[dest].empty()){types[dest]=out;pending.insert(dest);return;}
            bool changed=false;for(SQInteger n=0;n<slots;++n){Mask v=types[dest][n]|out[n];if(n>=p->_stacksize && (v&~absent))v=v&~absent;if(v!=types[dest][n]){types[dest][n]=v;changed=true;}}
            if(changed)pending.insert(dest);
        };
        if(f.fallthrough)merge(ip+1);if(f.target>=0)merge(f.target);
    }
    // Encoded references/strings may only flow through local cells and moves.
    // No identity test, external mutation, arbitrary call or return can see one.
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){
        if(types[ip].empty())continue;
        const auto &i=p->_instructions[ip];const auto &s=types[ip];SQSlotSet permitted;
        auto allow=[&](SQInteger r){permitted.set(r);};
        if(created[ip]>=0){
            // A fixed cell set can represent an allocation site again only if
            // no live register can reach an instance from its previous visit.
            Mask reachable;
            for(SQInteger r=1;r<p->_stacksize;++r)if(analysis.live_in[ip].test(r))reachable|=s[r]&objects;
            for(size_t round=0;round<graph.size();++round){
                Mask next=reachable;
                for(size_t a=0;a<graph.size();++a)if(reachable&object_bit(a))
                    for(size_t e=0;e<graph[a].keys.size();++e)next|=s[graph[a].base+e]&objects;
                if(next==reachable)break;reachable=next;
            }
            if(reachable&object_bit(created[ip]))return false;
        }
        else if(initialized[ip]>=0){
            if(i.op==_OP_NEWSLOT){allow(i._arg1);allow(i._arg2);allow(i._arg3);}
            else {allow(i._arg0);if(i._arg2==AAT_STACK)allow(i._arg1);}
        }else switch(i.op){
        case SQJIT_OP_CLASS_GUARD:
            if(!s[i._arg0] || (s[i._arg0]&~objects))return false;
            for(size_t a=0;a<graph.size();++a)if((s[i._arg0]&object_bit(a)) && graph[a].klass!=i._arg1)return false;
            allow(i._arg0);break;
        case _OP_MOVE:case _OP_DMOVE:allow(i._arg1);if(i.op==_OP_DMOVE)allow(i._arg3);break;
        case _OP_GET:case _OP_GETK:case _OP_SET:{
            SQInteger owner=i.op==_OP_GETK?i._arg2:i._arg1;Mask key=i.op==_OP_GETK?literal_type(i._arg1):s[i._arg2];
            if(!s[owner] || (s[owner]&~objects) || !key)return false;
            for(size_t a=0;a<graph.size();++a)if(s[owner]&object_bit(a))
                if(key&~(graph[a].table?strings:scalar))return false;
            allow(owner);if(i.op!=_OP_GETK)allow(i._arg2);if(i.op==_OP_SET)allow(i._arg3);break;
        }
        case _OP_PREPCALLK:{
            if(tokens[i._arg1]<0 || _string(p->_literals[i._arg1])->_len!=3 ||
               memcmp(_stringval(p->_literals[i._arg1]),_SC("len"),3*sizeof(SQChar)) ||
               ip+1>=p->_ninstructions)return false;
            const auto &next=p->_instructions[ip+1];
            if(next.op!=_OP_CALL || next._arg1!=i._arg0 || next._arg2!=i._arg3 || next._arg3!=1 ||
               i._arg0==i._arg3)return false;
            for(const auto &f:analysis.facts)if(f.target==ip+1)return false;
            Mask receiver=s[i._arg2];if(!receiver || (receiver&~(strings|objects)))return false;
            // Array len's VM shortcut leaves temp_reg alone; string lookup
            // overwrites it. Keep this ownership effect statically decidable.
            if((receiver&strings) && (receiver&objects))return false;
            if(receiver&strings)string_length=true;
            for(size_t a=0;a<graph.size();++a)if(receiver&object_bit(a)){if(graph[a].table)return false;array_length=true;}
            allow(i._arg2);break;
        }
        case _OP_CALL:if(ip==0 || p->_instructions[ip-1].op!=_OP_PREPCALLK || s[i._arg1]!=callable)return false;allow(i._arg1);allow(i._arg2);break;
        case SQJIT_OP_TOFLOAT:case SQJIT_OP_MATH:
        case _OP_LOADNULLS:
        case _OP_LINE:case _OP_LOADINT:case _OP_LOADFLOAT:case _OP_LOADBOOL:case _OP_LOAD:case _OP_DLOAD:
        case _OP_ADD:case _OP_SUB:case _OP_MUL:case _OP_DIV:case _OP_MOD:case _OP_NEG:
        case _OP_EQ:case _OP_NE:case _OP_CMP:case _OP_JCMP:case _OP_JZ:case _OP_JMP:
        case _OP_RETURN:case _OP_INCL:case _OP_PINCL:break;
        default:return false;
        }
        if((i.op==_OP_EQ || i.op==_OP_NE) && i._arg3 && (!literal_type(i._arg1) || (literal_type(i._arg1)&~scalar)))return false;
        for(SQInteger r=0;r<p->_stacksize;++r)if(analysis.facts[ip].reads.test(r)){
            if(!s[r] || (s[r]&uninitialized) || ((s[r]&~scalar) && !permitted.test(r)))return false;
        }
    }
    SQInteger index=slots++, owner=slots++, compare=slots++, constant=slots++;
    std::vector<SQInstruction> code;std::vector<Branch> branches;
    std::vector<SQInteger> offsets(p->_ninstructions);
    auto emit=[&](SQOpcode op,SQInteger a0=0,SQInteger a1=0,SQInteger a2=0,SQInteger a3=0){code.push_back(SQInstruction(op,a0,a1,a2,a3));};
    auto load_literal=[&](SQInteger dst,SQInteger lit){if(sq_type(p->_literals[lit])==OT_NULL)emit(_OP_LOADINT,dst,0);else if(tokens[lit]>=0)emit(_OP_LOADINT,dst,tokens[lit]);else emit(_OP_LOAD,dst,lit);};
    auto fail=[&](){emit(_OP_LOADINT,constant,0);emit(_OP_DIV,constant,constant,constant);emit(_OP_JMP,0,-1);};
    auto test=[&](SQInteger reg,SQInteger value){emit(_OP_LOADINT,constant,value);emit(_OP_EQ,compare,constant,reg);SQInteger at=code.size();emit(_OP_JZ,compare);return at;};
    auto patch=[&](SQInteger at){code[at]._arg1=code.size()-at-1;};
    for(SQInteger r=p->_stacksize;r<slots-4;++r){
        Mask possible;for(const auto &state:types)if(!state.empty())possible|=state[r]&~(absent|uninitialized);
        if(possible==float_value)emit(_OP_LOAD,r,p->_nliterals);
        else if(possible&float_value)return false;
        else emit(_OP_LOADINT,r,0);
    }
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){
        offsets[ip]=code.size();const auto &i=p->_instructions[ip];
        if(types[ip].empty()){emit(_OP_LINE);continue;}
        const auto &s=types[ip];
        if(i.op==SQJIT_OP_CLASS_GUARD)emit(_OP_LINE);
        else if(i.op==_OP_LOADNULLS){if(i._arg1==0)emit(_OP_LINE);for(SQInteger n=0;n<i._arg1;++n)emit(_OP_LOADINT,i._arg0+n,0);}
        else if(created[ip]>=0)emit(_OP_LOADINT,i._arg0,64+created[ip]);
        else if(initialized[ip]>=0){
            SQInteger dst=graph[init_object[ip]].base+initialized[ip];
            if(i.op==_OP_NEWSLOT)emit(_OP_MOVE,dst,i._arg3);
            else switch(i._arg2){case AAT_STACK:emit(_OP_MOVE,dst,i._arg1);break;case AAT_LITERAL:load_literal(dst,i._arg1);break;case AAT_INT:emit(_OP_LOADINT,dst,i._arg1);break;case AAT_BOOL:emit(_OP_LOADBOOL,dst,i._arg1);break;default:return false;}
        }else if(i.op==_OP_LOAD || i.op==_OP_DLOAD){load_literal(i._arg0,i._arg1);if(i.op==_OP_DLOAD)load_literal(i._arg2,i._arg3);}
        else if(i.op==_OP_GET || i.op==_OP_GETK || i.op==_OP_SET){
            if(i.op!=_OP_SET)temporary_writes.push_back(code.size());
            SQInteger receiver=i.op==_OP_GETK?i._arg2:i._arg1;Mask owners=s[receiver];
            Mask keys=i.op==_OP_GETK?literal_type(i._arg1):s[i._arg2];
            emit(_OP_MOVE,owner,receiver);
            if(i.op==_OP_GETK)load_literal(index,i._arg1);else emit(_OP_MOVE,index,i._arg2);
            std::vector<SQInteger> done;
            for(size_t a=0;a<graph.size();++a)if(owners&object_bit(a)){
                SQInteger next_owner=-1;if(!single(owners))next_owner=test(owner,64+a);
                const auto &g=graph[a];
                for(size_t e=0;e<g.keys.size();++e){
                    if(g.table && !(keys&string_bit(g.keys[e])))continue;
                    if(!g.table && fixed[ip] && indices[ip]!=(SQInteger)e)continue;
                    SQInteger next=-1;
                    if(!(g.table && single(keys)) && !(g.table?i.op==_OP_GETK:fixed[ip]))next=test(index,g.keys[e]);
                    if(i.op==_OP_SET){emit(_OP_MOVE,g.base+e,i._arg3);if(i._arg0!=255)emit(_OP_MOVE,i._arg0,i._arg3);}
                    else emit(_OP_MOVE,i._arg0,g.base+e);
                    done.push_back(code.size());emit(_OP_JMP);if(next>=0)patch(next);
                }
                fail();if(next_owner>=0)patch(next_owner);
            }
            fail();for(auto at:done)patch(at);
        }else if(i.op==_OP_PREPCALLK){
            if(s[i._arg2]&strings)temporary_writes.push_back(code.size());
            emit(_OP_MOVE,i._arg3,i._arg2);emit(_OP_LOADINT,i._arg0,0);
        }else if(i.op==_OP_CALL){
            // Closed, guarded len binding; only an encoded local receiver flows here.
            emit(_OP_MOVE,owner,i._arg2);std::vector<SQInteger> done;Mask receivers=s[i._arg2];
            auto length=[&](SQInteger id,SQInteger size){SQInteger next=single(receivers)?-1:test(owner,id);if(i._arg0!=255)emit(_OP_LOADINT,i._arg0,size);done.push_back(code.size());emit(_OP_JMP);if(next>=0)patch(next);};
            for(size_t n=0;n<representatives.size();++n)if(receivers&string_bit(n))length(n,_string(p->_literals[representatives[n]])->_len);
            for(size_t a=0;a<graph.size();++a)if(receivers&object_bit(a))length(64+a,graph[a].keys.size());
            fail();for(auto at:done)patch(at);
        }else{
            if(i.op==_OP_JCMP)temporary_writes.push_back(code.size());
            if(analysis.facts[ip].target>=0)branches.push_back({(SQInteger)code.size(),analysis.facts[ip].target});code.push_back(i);
        }
        if(code.size()>SQJitLeafPlan::MAX_SCALAR_INSTRUCTIONS)return false;
    }
    for(const auto &branch:branches)code[branch.at]._arg1=offsets[branch.target]-branch.at-1;
    for(auto ip:incoming){if(ip<0 || ip>=p->_ninstructions)return false;temporary_writes.push_back(offsets[ip]);}
    std::sort(temporary_writes.begin(),temporary_writes.end());temporary_writes.erase(std::unique(temporary_writes.begin(),temporary_writes.end()),temporary_writes.end());
    auto result=SQFunctionProto::Create(p->_sharedstate,code.size(),p->_nliterals+1,p->_nparameters,0,0,0,0,0);
    if(!result)return false;
    lowered=SQObjectPtr(result);result->_stacksize=slots;result->_bgenerator=false;result->_varparams=0;result->_name=p->_name;result->_sourcename=p->_sourcename;
    std::copy(code.begin(),code.end(),result->_instructions);std::copy(p->_literals,p->_literals+p->_nliterals,result->_literals);result->_literals[p->_nliterals]=(SQFloat)0.0;
    return true;
}
SQFunctionProto *SQJitLocalGraphPlan::Lowered() const {return sq_type(lowered)==OT_FUNCPROTO?_funcproto(lowered):nullptr;}
