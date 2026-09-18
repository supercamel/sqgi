// Independent execution oracle linked into tests only.
#include "kernel/kernel.h"
#include "kernel/math.h"
#include <cstring>
#include <vector>
#include <limits>
namespace sqkernel {
static double real(uint64_t bits) { double v; memcpy(&v,&bits,8); return v; }
static uint64_t bits(double v) { uint64_t b; memcpy(&b,&v,8); return b; }
static int64_t integer(uint64_t v) { int64_t n; memcpy(&n,&v,8); return n; }
Status interpret(const Module &m,size_t index,Call &call) {
    const auto &f=m.functions.at(index);
    std::vector<std::vector<uint64_t>> storage;
    for(const auto &r:f.local_storage) storage.emplace_back(r.cells,0);
    std::vector<uint64_t> slots(f.slots,0);
    for(size_t n=0;n<f.argument_slots();++n) slots[n]=call.arguments[n];
    auto fail=[&](Status s,int line) {call.error_line=line;call.error_function=index;return s;};
    for(size_t pc=0;pc<f.code.size();) {
        auto &i=f.code[pc++];
        uint64_t a=i.a>=0?slots[i.a]:0,b=i.b>=0?slots[i.b]:0;
        uint64_t out=0; bool writes=true;
        switch(i.op) {
        case Op::Constant:out=i.immediate;break;
        case Op::Copy:out=a;break;
        case Op::LocalAddress:out=(uint64_t)(uintptr_t)storage.at(i.immediate).data();break;
        case Op::LocalZero:std::fill(storage.at(i.immediate).begin(),storage.at(i.immediate).end(),0);writes=false;break;
        case Op::Call: {
            const auto &site=f.calls.at(i.immediate);
            std::vector<uint64_t> args; for(int s:site.arguments) args.push_back(slots.at(s));
            Call child{args.data(),0,call.fuel,0,0};
            auto status=interpret(m,site.function,child); call.fuel=child.fuel;
            if(status!=Success) {call.error_line=child.error_line;call.error_function=child.error_function;return status;}
            out=child.result; writes=i.dst>=0; break;
        }
        case Op::Add:out=i.type==Type::F64?bits(real(a)+real(b)):a+b;break;
        case Op::Sub:out=i.type==Type::F64?bits(real(a)-real(b)):a-b;break;
        case Op::Mul:out=i.type==Type::F64?bits(real(a)*real(b)):a*b;break;
        case Op::Div:
            if(i.type==Type::F64) out=bits(real(a)/real(b));
            else { if(!b || (integer(a)==INT64_MIN && integer(b)==-1)) return fail(ArithmeticError,i.line); out=(uint64_t)(integer(a)/integer(b)); } break;
        case Op::Rem:
            if(!b) return fail(ArithmeticError,i.line);
            out=integer(b)==-1?0:(uint64_t)(integer(a)%integer(b)); break;
        case Op::Math: {
            const auto &spec=math_builtin(i.immediate);
            out=spec.predicate?uint64_t(spec.predicate(real(a))):
                bits(spec.binary?spec.binary(real(a),real(b)):spec.unary(real(a)));
            break;
        }
        case Op::Neg:out=i.type==Type::F64?a^(uint64_t(1)<<63):uint64_t(0)-a;break;
        case Op::Eq:out=i.type==Type::F64?real(a)==real(b):a==b;break;
        case Op::Ne:out=i.type==Type::F64?real(a)!=real(b):a!=b;break;
        case Op::Lt:out=i.type==Type::F64?real(a)<real(b):integer(a)<integer(b);break;
        case Op::Le:out=i.type==Type::F64?real(a)<=real(b):integer(a)<=integer(b);break;
        case Op::Gt:out=i.type==Type::F64?real(a)>real(b):integer(a)>integer(b);break;
        case Op::Ge:out=i.type==Type::F64?real(a)>=real(b):integer(a)>=integer(b);break;
        case Op::Load:out=((const uint64_t*)(uintptr_t)a)[b];break;
        case Op::Store:((uint64_t*)(uintptr_t)a)[b]=slots[i.dst]; writes=false;break;
        case Op::Bounds:if(a>=(i.b>=0?b:i.immediate)) return fail(BoundsError,i.line);writes=false;break;
        case Op::Require:if(!a) return fail(RequirementError,i.line);writes=false;break;
        case Op::Tick:if(!call.fuel) return fail(BudgetError,i.line);--call.fuel;writes=false;break;
        case Op::Jump:pc=i.immediate;writes=false;break;
        case Op::JumpFalse:if(!a) pc=i.immediate;writes=false;break;
        case Op::Return:if(i.type!=Type::Void) call.result=a;return Success;
        }
        if(writes) slots[i.dst]=out;
    }
    return fail(RequirementError,0);
}
}
