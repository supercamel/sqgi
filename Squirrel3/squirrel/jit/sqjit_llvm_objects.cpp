// LLVM lowering on canonical VM slots. A guard exits before one instruction's
// effects; prior effects remain committed and are never replayed.
#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqstring.h"
#include "sqmemberslot.h"
#include "sqbytecode.h"
#include "sqjit_context.h"
#include "sqjit_write_log.h"
#include "sqjit_llvm_objects.h"
#include <llvm-c/Analysis.h>
#include <llvm-c/Core.h>
#include <llvm-c/Error.h>
#include <llvm-c/LLJIT.h>
#include <llvm-c/Target.h>
#include <llvm-c/Transforms/PassBuilder.h>
#include <limits>
#include <memory>
#include <mutex>
#include <stdexcept>
extern bool sq_nativeclosure_is_default_len(SQNativeClosure *closure);
extern bool sq_nativeclosure_is_array_append(SQNativeClosure *closure);
namespace {
// Addresses, never owning SQObjectPtrs. Each activation starts empty. The
// accepted bytecodes cannot allocate Squirrel object identities or run callbacks.
// Append can relocate an array's backing storage, which is never cached here;
// table/instance slots stay fixed. A live matching owner therefore cannot reuse
// a freed owner's address during this activation.
// Extending that instruction set requires invalidating or revisiting this proof.
struct MemberCache {
    SQObjectType owner_type, key_type;
    SQRawObjectVal owner_bits, key_bits;
    SQObjectPtr *slot;
};

enum CacheProof {
    CACHE_FIXED_OWNER = 1,
    CACHE_FIXED_KEY = 2
};

static void boxed_init_caches(void *storage, SQInteger count)
{
    MemberCache *cache = (MemberCache *)storage;
    for(SQInteger n=0; n<count; ++n) new (&cache[n]) MemberCache{};
}

template<bool Literal>
static SQObjectPtr *boxed_member(const SQObjectPtr &base,
    const SQObjectPtr &key, MemberCache *cache)
{
    // Indexed arrays already need only a bounds check. Comparing a cache key
    // and receiver would cost more than resolving their backing-store address.
    if(sq_type(base) == OT_ARRAY && sq_type(key) == OT_INTEGER) {
        SQInteger index = _integer(key);
        return (SQUnsignedInteger)index < (SQUnsignedInteger)_array(base)->Size() ?
            &_array(base)->_values[index] : NULL;
    }
    // Literal groups belong to one immutable prototype literal. They never
    // share storage with dynamic-key sites, so only receiver identity can vary.
    if(cache && cache->slot && cache->owner_type == sq_type(base) &&
        cache->owner_bits == _rawval(base) && (Literal ||
        (cache->key_type == sq_type(key) && cache->key_bits == _rawval(key)))) return cache->slot;
    SQObjectPtr *slot = sq_member_raw_slot(base, key);
    if(cache) {
        cache->slot = slot;
        if(slot) {
            cache->owner_type = sq_type(base); cache->owner_bits = _rawval(base);
            if(!Literal) { cache->key_type = sq_type(key); cache->key_bits = _rawval(key); }
        }
    }
    // A cached address always reloads the current value. Root/delegate fallback
    // is not cached: it depends on original receiver provenance and precedence.
    return slot;
}

// Scalar values have no owner to release. Keep this check at the call site:
// the general journal predicate remains authoritative for every reference,
// including aliases, ancestor pins, weak observers and combined drops.
static inline bool boxed_can_release(SQJitContext *context,
    const SQObjectPtr &value, SQUnsignedInteger drops = 1)
{
    return !ISREFCOUNTED(sq_type(value)) || SQJitWriteLog::CanReleaseInContext(*context, value, drops);
}

static bool boxed_arith(SQVM *vm, unsigned op, const SQObjectPtr &a,
    const SQObjectPtr &b, SQObjectPtr &result)
{
    if(!sq_isnumeric(a) || !sq_isnumeric(b)) return false;
    if(sq_type(a) == OT_INTEGER && sq_type(b) == OT_INTEGER) {
        SQInteger x = _integer(a), y = _integer(b);
        // Match the machine-word integer arithmetic used by the native tier
        // without invoking signed-overflow undefined behavior in these helpers.
        switch(op) {
        case '+': result = (SQInteger)((SQUnsignedInteger)x + (SQUnsignedInteger)y); return true;
        case '-': result = (SQInteger)((SQUnsignedInteger)x - (SQUnsignedInteger)y); return true;
        case '*': result = (SQInteger)((SQUnsignedInteger)x * (SQUnsignedInteger)y); return true;
        case '/':
            if(y == 0 || (y == -1 && x == std::numeric_limits<SQInteger>::min())) return false;
            result = x / y; return true;
        case '%':
            if(y == 0) return false;
            result = y == -1 ? SQInteger(0) : x % y; return true;
        }
        return false;
    }
    // Numeric inputs select only the VM's floating arithmetic, with no strings,
    // allocation, metamethods or release callbacks (result is a fresh scalar).
    return vm->ARITH_OP(op, result, a, b);
}



static bool boxed_len_key(SQFunctionProto *proto, SQInteger literal)
{
    if(literal<0 || literal>=proto->_nliterals) return false;
    const SQObjectPtr &key=proto->_literals[literal];
    return sq_type(key)==OT_STRING && _string(key)->_len==3 &&
        !memcmp(_stringval(key),_SC("len"),3*sizeof(SQChar));
}
static bool boxed_append_key(SQFunctionProto *proto,SQInteger literal) {
    if(literal<0 || literal>=proto->_nliterals)return false;
    const auto &key=proto->_literals[literal];if(sq_type(key)!=OT_STRING)return false;
    return (_string(key)->_len==6 && !memcmp(_stringval(key),_SC("append"),6*sizeof(SQChar))) ||
        (_string(key)->_len==4 && !memcmp(_stringval(key),_SC("push"),4*sizeof(SQChar)));
}

static bool boxed_release_pair(SQJitContext *context,
    const SQObjectPtr &first, const SQObjectPtr &second)
{
    const SQUnsignedInteger drops=ISREFCOUNTED(sq_type(first)) &&
        sq_type(first)==sq_type(second) && _rawval(first)==_rawval(second) ? 2 : 1;
    return boxed_can_release(context,first) &&
        boxed_can_release(context,second,drops);
}

// Preserve PREPCALLK's publication order, including its distinct array len path.
// No lookup below invokes delegation, a metamethod, allocation or a callback.
static SQInteger boxed_prepare_len(SQJitContext *context,
    SQObjectPtr *stack, SQClosure *closure, const SQInstruction &i, SQVM *vm)
{
    SQSharedState *ss=closure->_function->_sharedstate;
    const SQObjectPtr &key=closure->_function->_literals[i._arg1];
    const SQObjectPtr &receiver=stack[i._arg2];
    const SQObjectPtr *delegate=NULL;
    if(sq_type(receiver)==OT_ARRAY) {
        if(sq_type(key)==OT_STRING && (_string(key)==_string(ss->_array_append_key) || _string(key)==_string(ss->_array_push_key))) {
            if(!boxed_release_pair(context,stack[i._arg3],stack[i._arg0]))return 0;
            stack[i._arg3]=receiver;stack[i._arg0]=ss->_array_append_closure;return 1;
        }
        if(sq_type(key)==OT_STRING && _string(key)==_string(ss->_array_len_key)) {
            if(!boxed_release_pair(context,stack[i._arg3],stack[i._arg0])) return 0;
            stack[i._arg3]=receiver;
            stack[i._arg0]=ss->_array_len_closure;
            return 1;
        }
        delegate=&ss->_array_default_delegate;
    }
    else if(sq_type(receiver)==OT_STRING) delegate=&ss->_string_default_delegate;
    else return 0;
    const SQObjectPtr *raw=_table(*delegate)->GetRawSlot(key);
    const SQObject *source=raw && sq_type(*raw)==OT_WEAKREF ? &_weakref(*raw)->_obj : raw;
    if(!source || !boxed_release_pair(context,vm->temp_reg,stack[i._arg3])) return 0;
    vm->temp_reg=*source;
    stack[i._arg3]=receiver;
    _Swap(stack[i._arg0],vm->temp_reg);
    return 1;
}

template<SQOpcode Op, bool ConstantKey = (Op == _OP_GETK)>
static SQInteger boxed_step(SQJitContext *context, SQObjectPtr *stack,
    SQClosure *closure, SQInteger ip, SQObjectPtr *out, SQVM *vm, MemberCache *cache)
{
    const SQInstruction &i = closure->_function->_instructions[ip];
    SQObjectPtr value;
    SQInteger dst = i._arg0;
    switch(Op) {
    case _OP_LOADINT: value = (SQInteger)(SQInt32)i._arg1; break;
    case _OP_LOADBOOL: value = (i._arg1 != 0); break;
    case _OP_LOAD:
        // Literal pins belong to the prototype and cannot be the last owner.
        value = closure->_function->_literals[i._arg1]; break;
    case _OP_MOVE:
        // Check before making a helper-local pin: such pins are not real owners.
        if(!boxed_can_release(context, stack[dst])) return 0;
        stack[dst] = stack[i._arg1]; return 1;
    case _OP_DMOVE: {
        if(!boxed_release_pair(context,stack[dst],stack[i._arg2]))return 0;
        stack[dst]=stack[i._arg1];stack[i._arg2]=stack[i._arg3];return 1;
    }
    case _OP_LOADNULLS:
        // Multiple drops can remove aliases of one another. Initially keep all
        // owning multi-destination writes on their ordinary interpreter path.
        for(SQInteger n=0; n<i._arg1; ++n)
            if(ISREFCOUNTED(sq_type(stack[dst+n]))) return 0;
        for(SQInteger n=0; n<i._arg1; ++n) stack[dst+n].Null();
        return 1;
    case _OP_DLOAD: {
        SQUnsignedInteger drops = dst != i._arg2 && ISREFCOUNTED(sq_type(stack[dst])) &&
            sq_type(stack[dst]) == sq_type(stack[i._arg2]) &&
            _rawval(stack[dst]) == _rawval(stack[i._arg2]) ? 2 : 1;
        if(!boxed_can_release(context, stack[dst]) || !boxed_can_release(context, stack[i._arg2], drops)) return 0;
        stack[dst] = closure->_function->_literals[i._arg1];
        stack[i._arg2] = closure->_function->_literals[i._arg3]; return 1;
    }
    case _OP_GET: case _OP_GETK: {
        const SQObjectPtr &base = stack[Op == _OP_GET ? i._arg1 : i._arg2];
        const SQObjectPtr &key = Op == _OP_GET ? stack[i._arg2] :
            closure->_function->_literals[i._arg1];
        SQObjectPtr *raw = boxed_member<ConstantKey>(base, key, cache);
        // Table/array/field reads dereference weak values; class methods do not.
        const SQObject *source = raw ? (sq_type(*raw) == OT_WEAKREF ? &_weakref(*raw)->_obj : raw) :
            NULL; // Delegation, root fallback and methods resume in the VM.
        if(!source || !boxed_can_release(context, vm->temp_reg)) return 0;
        // Read before the temporary drop, including raw weakref dereference.
        // No checked release below can run a callback or destroy an observed
        // graph. Destination/base/key aliases therefore remain valid here.
        // Assignment copies the source bits and adds its reference before
        // releasing the old temporary. A second helper-local pin is redundant.
        vm->temp_reg = *source;
        _Swap(stack[dst], vm->temp_reg);
        return 1;
    }
    case _OP_SET: {
        SQObjectPtr *target = boxed_member<ConstantKey>(stack[i._arg1], stack[i._arg2], cache);
        if(!target || !boxed_can_release(context, *target)) return 0;
        const bool result_write = dst != 255 && dst != i._arg3;
        if(result_write) {
            // The first write may discard another alias of the result's old
            // owner. Check the combined drop before either write, without pins.
            SQUnsignedInteger drops = ISREFCOUNTED(sq_type(*target)) &&
                sq_type(*target) == sq_type(stack[dst]) &&
                _rawval(*target) == _rawval(stack[dst]) ? 2 : 1;
            if(!boxed_can_release(context, stack[dst], drops)) return 0;
        }
        *target = stack[i._arg3];
        if(result_write) stack[dst] = stack[i._arg3];
        return 1;
    }
    case _OP_EQ: case _OP_NE: {
        const SQObjectPtr &right=i._arg3 ? closure->_function->_literals[i._arg1] : stack[i._arg1];
        bool equal=false;
        if(!sq_isnumeric(stack[i._arg2]) || !sq_isnumeric(right) ||
            !vm->IsEqual(stack[i._arg2],right,equal)) return 0;
        value=Op==_OP_EQ ? equal : !equal;
        break;
    }
    case _OP_PREPCALLK:
        return boxed_prepare_len(context,stack,closure,i,vm);
    case _OP_CALL: {
        const SQObjectPtr &callee=stack[i._arg1], &receiver=stack[i._arg2];
        if(i._arg3==2 && sq_type(callee)==OT_NATIVECLOSURE &&
           sq_nativeclosure_is_array_append(_nativeclosure(callee)) && sq_type(receiver)==OT_ARRAY){
            // Guard the only possible drop before mutating the array. Growth
            // moves raw backing storage; it does not create new object identities.
            if(dst!=255 && !boxed_can_release(context,stack[dst]))return 0;
            _array(receiver)->Append(stack[i._arg2+1]);
            if(dst!=255)stack[dst]=receiver;
            return 1;
        }
        if(i._arg3!=1 || sq_type(callee)!=OT_NATIVECLOSURE ||
            !sq_nativeclosure_is_default_len(_nativeclosure(callee))) return 0;
        // This is the VM's existing default-length shortcut: no native frame,
        // argument clearing, environment replacement or user callback occurs.
        switch(sq_type(receiver)) {
        case OT_ARRAY: value=_array(receiver)->Size(); break;
        case OT_TABLE: value=_table(receiver)->CountUsed(); break;
        case OT_STRING: value=_string(receiver)->_len; break;
        default: return 0;
        }
        if(dst==255) return 1;
        break;
    }
    case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD: {
        unsigned op = Op == _OP_ADD ? '+' : Op == _OP_SUB ? '-' :
            Op == _OP_MUL ? '*' : Op == _OP_DIV ? '/' : '%';
        if(!boxed_arith(vm, op, stack[i._arg2], stack[i._arg1], value)) return 0;
        break;
    }
    case _OP_NEG:
        if(sq_type(stack[i._arg1]) == OT_INTEGER)
            value = (SQInteger)(SQUnsignedInteger(0) - (SQUnsignedInteger)_integer(stack[i._arg1]));
        else if(sq_type(stack[i._arg1]) == OT_FLOAT) value = -_float(stack[i._arg1]);
        else return 0;
        break;
    case _OP_NOT: value = vm->IsFalse(stack[i._arg1]); break;
    case _OP_PINCL: {
        SQObjectPtr increment((SQInteger)(signed char)i._arg3);
        if(!boxed_arith(vm, '+', stack[i._arg1], increment, value) ||
            !boxed_can_release(context, stack[dst])) return 0;
        stack[dst] = stack[i._arg1];
        stack[i._arg1] = value;
        return 1;
    }
    case _OP_INCL: {
        dst = i._arg1;
        SQObjectPtr increment((SQInteger)(signed char)i._arg3);
        if(!boxed_arith(vm, '+', stack[dst], increment, value)) return 0;
        break;
    }
    case _OP_CMP: case _OP_JCMP: {
        const SQObjectPtr &left = stack[i._arg2];
        const SQObjectPtr &right = stack[Op == _OP_JCMP ? i._arg0 : i._arg1];
        if(!sq_isnumeric(left) || !sq_isnumeric(right)) return 0;
        if(!vm->CMP_OP((CmpOP)i._arg3, left, right, value)) return 0;
        if(Op != _OP_JCMP) break;
        if(!boxed_can_release(context, vm->temp_reg)) return 0;
        vm->temp_reg = value;
        return vm->IsFalse(value) ? 1 : 2;
    }
    case _OP_JZ: return vm->IsFalse(stack[i._arg0]) ? 1 : 2;
    case _OP_RETURN:
        // The shared frame-return adapter writes its result through slot zero.
        // Avoid moving observable receiver destruction ahead of frame cleanup.
        if(!(sq_type(stack[0])==OT_TABLE && sq_type(vm->_roottable)==OT_TABLE &&
             _table(stack[0])==_table(vm->_roottable)) &&
           !SQJitWriteLog::CanDeferRelease(stack[0]))return 0;
        if(i._arg0 == 255) out->Null();
        else *out = stack[i._arg1];
        return 1;
    default: return 0;
    }
    if(!boxed_can_release(context, stack[dst])) return 0;
    stack[dst] = value;
    return 1;
}

typedef SQInteger (*Step)(SQJitContext *, SQObjectPtr *,
    SQClosure *, SQInteger, SQObjectPtr *, SQVM *, MemberCache *);

// Select once during compilation. Each helper has a constant opcode, allowing
// the C++ compiler to remove dispatch and unrelated SQObjectPtr cleanup paths.
static Step boxed_step_for(unsigned op, bool constant_key)
{
    switch(op) {
    case _OP_LOADINT: return boxed_step<_OP_LOADINT>;
    case _OP_LOADBOOL: return boxed_step<_OP_LOADBOOL>;
    case _OP_LOAD: return boxed_step<_OP_LOAD>;
    case _OP_MOVE: return boxed_step<_OP_MOVE>;
    case _OP_DMOVE: return boxed_step<_OP_DMOVE>;
    case _OP_LOADNULLS: return boxed_step<_OP_LOADNULLS>;
    case _OP_DLOAD: return boxed_step<_OP_DLOAD>;
    case _OP_GET: return constant_key ? boxed_step<_OP_GET,true> : boxed_step<_OP_GET>;
    case _OP_GETK: return boxed_step<_OP_GETK>;
    case _OP_SET: return constant_key ? boxed_step<_OP_SET,true> : boxed_step<_OP_SET>;
    case _OP_EQ: return boxed_step<_OP_EQ>;
    case _OP_NE: return boxed_step<_OP_NE>;
    case _OP_PREPCALLK: return boxed_step<_OP_PREPCALLK>;
    case _OP_CALL: return boxed_step<_OP_CALL>;
    case _OP_ADD: return boxed_step<_OP_ADD>;
    case _OP_SUB: return boxed_step<_OP_SUB>;
    case _OP_MUL: return boxed_step<_OP_MUL>;
    case _OP_DIV: return boxed_step<_OP_DIV>;
    case _OP_MOD: return boxed_step<_OP_MOD>;
    case _OP_NEG: return boxed_step<_OP_NEG>;
    case _OP_NOT: return boxed_step<_OP_NOT>;
    case _OP_PINCL: return boxed_step<_OP_PINCL>;
    case _OP_INCL: return boxed_step<_OP_INCL>;
    case _OP_CMP: return boxed_step<_OP_CMP>;
    case _OP_JCMP: return boxed_step<_OP_JCMP>;
    case _OP_JZ: return boxed_step<_OP_JZ>;
    case _OP_RETURN: return boxed_step<_OP_RETURN>;
    default: return NULL;
    }
}


void checked(LLVMErrorRef e) {
    if(e){char *message=LLVMGetErrorMessage(e);LLVMDisposeErrorMessage(message);throw std::runtime_error("LLVM object compilation failed");}
}
struct Artifact {
    LLVMOrcLLJITRef jit=nullptr;
    ~Artifact(){if(jit)if(auto e=LLVMOrcDisposeLLJIT(jit))LLVMConsumeError(e);}
    static void release(void *p){delete static_cast<Artifact*>(p);}
};
struct IR {
    LLVMOrcThreadSafeContextRef thread=LLVMOrcCreateNewThreadSafeContext();
    LLVMContextRef c=LLVMOrcThreadSafeContextGetContext(thread);
    LLVMModuleRef module=LLVMModuleCreateWithNameInContext("squirrel_objects",c);
    LLVMBuilderRef b=LLVMCreateBuilderInContext(c);
    ~IR(){LLVMDisposeBuilder(b);if(module)LLVMDisposeModule(module);LLVMOrcDisposeThreadSafeContext(thread);}
};
SQInteger release_safe(SQJitContext *ctx,SQObjectPtr *slot){return boxed_can_release(ctx,*slot);}
void assign_scalar(SQObjectPtr *slot,SQInteger bits,SQInteger type){*slot=bits;slot->_type=(SQObjectType)type;}
void assign_object(SQObjectPtr *slot,SQInteger bits,SQInteger type){
    SQObject value;value._type=(SQObjectType)type;memcpy(&value._unVal,&bits,sizeof(bits));*slot=value;
}
SQObjectPtr *member_address(SQObjectPtr *owner,const SQObjectPtr *key,MemberCache *cache){return boxed_member<false>(*owner,*key,cache);}
SQObjectPtr *temporary(SQJitContext *ctx){return &ctx->active_vm->temp_reg;}
SQVM *active_vm(SQJitContext *ctx){return ctx->active_vm;}

bool eligible(SQFunctionProto *p,SQInteger first,SQInteger last,bool loop,SQBytecodeAnalysis &analysis) {
    if(!p || p->_bgenerator || p->_varparams || p->_noutervalues || p->_ndefaultparams ||
       first<0 || last<first || last>=p->_ninstructions || last-first>256 ||
       !analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize))return false;
    bool member=false;
    for(SQInteger ip=first;ip<=last;++ip){
        const auto &i=p->_instructions[ip];
        if(analysis.facts[ip].target>=p->_ninstructions)return false;
        if(i.op==_OP_LINE || i.op==_OP_JMP)continue;
        if(!boxed_step_for(i.op,false) || (loop && i.op==_OP_RETURN))return false;
        if((i.op==_OP_LOAD || i.op==_OP_DLOAD || i.op==_OP_GETK || i.op==_OP_PREPCALLK ||
            ((i.op==_OP_EQ || i.op==_OP_NE) && i._arg3)) && (i._arg1<0 || i._arg1>=p->_nliterals))return false;
        if(i.op==_OP_DLOAD && i._arg3>=p->_nliterals)return false;
        if(i.op==_OP_PREPCALLK && !boxed_len_key(p,i._arg1) && !boxed_append_key(p,i._arg1))return false;
        if(i.op==_OP_CALL && i._arg3!=1 && i._arg3!=2)return false;
        member=member || i.op==_OP_SET || i.op==_OP_GET || i.op==_OP_GETK ||
            (i.op==_OP_PREPCALLK && boxed_append_key(p,i._arg1));
    }
    // Do not replace established pure scalar/array paths or install an entry
    // that merely exits immediately on an unrelated unsupported workload.
    return member;
}

bool compile(SQFunctionProto *p,SQInteger first,SQInteger last,SQInteger entry_ip,SQJitCode *output,bool loop) {
    static_assert(sizeof(SQUnsignedInteger)==8 && sizeof(SQObjectValue)==8,"LLVM boxed ABI requires 64-bit words");
    SQBytecodeAnalysis analysis;
    if(!output || !eligible(p,first,last,loop,analysis) || entry_ip<first || entry_ip>last)return false;
    static std::once_flag initialized;
    std::call_once(initialized,[]{if(LLVMInitializeNativeTarget() || LLVMInitializeNativeAsmPrinter())throw std::runtime_error("LLVM unavailable");});
    std::unique_ptr<Artifact> artifact(new Artifact);checked(LLVMOrcCreateLLJIT(&artifact->jit,nullptr));
    IR ir;auto c=ir.c;auto b=ir.b;auto word=LLVMInt64TypeInContext(c);auto byte=LLVMInt8TypeInContext(c);auto ptr=LLVMPointerTypeInContext(c,0);
    auto tagtype=LLVMIntTypeInContext(c,sizeof(SQObjectType)*8);
    LLVMSetTarget(ir.module,LLVMOrcLLJITGetTripleString(artifact->jit));
    LLVMSetDataLayout(ir.module,LLVMOrcLLJITGetDataLayoutStr(artifact->jit));
    LLVMTypeRef params[]={ptr,ptr,ptr};auto fn=LLVMAddFunction(ir.module,"object_entry",LLVMFunctionType(word,params,3,false));
    auto entry=LLVMAppendBasicBlockInContext(c,fn,"entry");
    std::vector<LLVMBasicBlockRef> blocks(p->_ninstructions);
    for(SQInteger ip=first;ip<=last;++ip)blocks[ip]=LLVMAppendBasicBlockInContext(c,fn,"instruction");
    auto number=[&](SQInteger v){return LLVMConstInt(word,(uint64_t)v,true);};
    auto pointer=[&](const void *v){return LLVMConstIntToPtr(number((uintptr_t)v),ptr);};
    auto call=[&](uintptr_t address,LLVMTypeRef result,std::vector<LLVMValueRef> args){
        std::vector<LLVMTypeRef> types;for(auto a:args)types.push_back(LLVMTypeOf(a));
        auto type=LLVMFunctionType(result,types.data(),types.size(),false);
        return LLVMBuildCall2(b,type,LLVMConstIntToPtr(number(address),ptr),args.data(),args.size(),result==LLVMVoidTypeInContext(c)?"":"helper");
    };
    auto gep=[&](LLVMValueRef base,SQInteger offset){auto n=number(offset);return LLVMBuildGEP2(b,byte,base,&n,1,"address");};
    auto slot=[&](SQInteger n){return gep(LLVMGetParam(fn,0),n*sizeof(SQObjectPtr));};
    auto ctx=pointer(&sqjit_context(p->_sharedstate));
    LLVMPositionBuilderAtEnd(b,entry);
    auto vm=call((uintptr_t)&active_vm,ptr,{ctx});auto temp=call((uintptr_t)&temporary,ptr,{ctx});
    auto caches=LLVMBuildArrayAlloca(b,byte,number((last-first+1)*sizeof(MemberCache)),"member_caches");
    LLVMSetAlignment(caches,alignof(MemberCache));
    call((uintptr_t)&boxed_init_caches,LLVMVoidTypeInContext(c),{caches,number(last-first+1)});
    LLVMBuildBr(b,blocks[entry_ip]);
    auto exit_at=[&](SQInteger ip,bool side=false){
        if(loop){LLVMBuildStore(b,number(ip),LLVMGetParam(fn,1));LLVMBuildRet(b,number(side?SQ_JIT_NATIVE_SIDE_EXIT:SQ_JIT_NATIVE_RETURNED));}
        else {call((uintptr_t)&assign_scalar,LLVMVoidTypeInContext(c),{LLVMGetParam(fn,1),number(ip),number(OT_INTEGER)});LLVMBuildRet(b,number(SQ_JIT_NATIVE_SIDE_EXIT));}
    };
    auto destination=[&](SQInteger ip){
        if(ip>=first && ip<=last)return blocks[ip];
        auto old=LLVMGetInsertBlock(b);auto block=LLVMAppendBasicBlockInContext(c,fn,"leave_region");
        LLVMPositionBuilderAtEnd(b,block);exit_at(ip);LLVMPositionBuilderAtEnd(b,old);return block;
    };
    for(SQInteger ip=first;ip<=last;++ip){
        LLVMPositionBuilderAtEnd(b,blocks[ip]);const auto &i=p->_instructions[ip];
        auto fail=LLVMAppendBasicBlockInContext(c,fn,"side_exit");LLVMPositionBuilderAtEnd(b,fail);exit_at(ip,true);LLVMPositionBuilderAtEnd(b,blocks[ip]);
        auto guard=[&](LLVMValueRef ok){auto next=LLVMAppendBasicBlockInContext(c,fn,"guard_ok");LLVMBuildCondBr(b,ok,next,fail);LLVMPositionBuilderAtEnd(b,next);};
        auto tag=[&](LLVMValueRef address){return LLVMBuildLoad2(b,tagtype,gep(address,offsetof(SQObject,_type)),"tag");};
        auto bits=[&](LLVMValueRef address){return LLVMBuildLoad2(b,word,gep(address,offsetof(SQObject,_unVal)),"bits");};
        auto intvalue=[&](SQInteger n){auto a=slot(n);guard(LLVMBuildICmp(b,LLVMIntEQ,tag(a),LLVMConstInt(tagtype,OT_INTEGER,false),"integer"));return bits(a);};
        auto scalar_store=[&](LLVMValueRef address,LLVMValueRef value,SQObjectType type){
            auto ref=LLVMBuildICmp(b,LLVMIntNE,LLVMBuildAnd(b,tag(address),LLVMConstInt(tagtype,SQOBJECT_REF_COUNTED,false),"refbit"),LLVMConstInt(tagtype,0,false),"owning");
            auto managed=LLVMAppendBasicBlockInContext(c,fn,"release_old"),plain=LLVMAppendBasicBlockInContext(c,fn,"scalar_store"),done=LLVMAppendBasicBlockInContext(c,fn,"stored");
            LLVMBuildCondBr(b,ref,managed,plain);LLVMPositionBuilderAtEnd(b,managed);
            guard(LLVMBuildICmp(b,LLVMIntNE,call((uintptr_t)&release_safe,word,{ctx,address}),number(0),"release_safe"));
            call((uintptr_t)&assign_scalar,LLVMVoidTypeInContext(c),{address,value,number(type)});LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,plain);LLVMBuildStore(b,value,gep(address,offsetof(SQObject,_unVal)));LLVMBuildStore(b,LLVMConstInt(tagtype,type,false),gep(address,offsetof(SQObject,_type)));LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,done);
        };
        auto lookup=[&](LLVMValueRef owner,LLVMValueRef key){
            auto ot=tag(owner),ob=bits(owner),kt=tag(key),kb=bits(key);
            auto array_test=LLVMBuildAnd(b,LLVMBuildICmp(b,LLVMIntEQ,ot,LLVMConstInt(tagtype,OT_ARRAY,false),"array"),LLVMBuildICmp(b,LLVMIntEQ,kt,LLVMConstInt(tagtype,OT_INTEGER,false),"index"),"array_index");
            auto array_block=LLVMAppendBasicBlockInContext(c,fn,"array_slot"),cached=LLVMAppendBasicBlockInContext(c,fn,"cached_member"),hit=LLVMAppendBasicBlockInContext(c,fn,"cache_hit"),miss=LLVMAppendBasicBlockInContext(c,fn,"cache_miss"),join=LLVMAppendBasicBlockInContext(c,fn,"resolved_slot");
            LLVMBuildCondBr(b,array_test,array_block,cached);LLVMPositionBuilderAtEnd(b,array_block);
            auto array=LLVMBuildIntToPtr(b,ob,ptr,"array_owner");
            auto size=LLVMBuildLoad2(b,word,gep(array,SQArray::RawSizeOffset()),"size");
            guard(LLVMBuildICmp(b,LLVMIntULT,kb,size,"in_bounds"));
            auto values=LLVMBuildLoad2(b,ptr,gep(array,SQArray::RawValuesOffset()),"elements");
            auto offset=LLVMBuildMul(b,kb,number(sizeof(SQObjectPtr)),"element_offset");
            auto element=LLVMBuildGEP2(b,byte,values,&offset,1,"element");auto array_from=LLVMGetInsertBlock(b);LLVMBuildBr(b,join);
            LLVMPositionBuilderAtEnd(b,cached);auto cache=gep(caches,(ip-first)*sizeof(MemberCache));
            auto saved=LLVMBuildLoad2(b,ptr,gep(cache,offsetof(MemberCache,slot)),"cached_slot");
            auto match=LLVMBuildICmp(b,LLVMIntNE,saved,LLVMConstNull(ptr),"cached");
            auto eq=[&](LLVMValueRef a,LLVMValueRef d){return LLVMBuildICmp(b,LLVMIntEQ,a,d,"same");};
            match=LLVMBuildAnd(b,match,eq(ot,LLVMBuildLoad2(b,tagtype,gep(cache,offsetof(MemberCache,owner_type)),"owner_type")),"match_owner_type");
            match=LLVMBuildAnd(b,match,eq(ob,LLVMBuildLoad2(b,word,gep(cache,offsetof(MemberCache,owner_bits)),"owner_bits")),"match_owner");
            match=LLVMBuildAnd(b,match,eq(kt,LLVMBuildLoad2(b,tagtype,gep(cache,offsetof(MemberCache,key_type)),"key_type")),"match_key_type");
            match=LLVMBuildAnd(b,match,eq(kb,LLVMBuildLoad2(b,word,gep(cache,offsetof(MemberCache,key_bits)),"key_bits")),"match_key");
            LLVMBuildCondBr(b,match,hit,miss);LLVMPositionBuilderAtEnd(b,hit);LLVMBuildBr(b,join);
            LLVMPositionBuilderAtEnd(b,miss);auto found=call((uintptr_t)&member_address,ptr,{owner,key,cache});
            guard(LLVMBuildICmp(b,LLVMIntNE,found,LLVMConstNull(ptr),"found"));auto miss_from=LLVMGetInsertBlock(b);LLVMBuildBr(b,join);
            LLVMPositionBuilderAtEnd(b,join);auto result=LLVMBuildPhi(b,ptr,"slot");
            LLVMValueRef vals[]={element,saved,found};LLVMBasicBlockRef from[]={array_from,hit,miss_from};LLVMAddIncoming(result,vals,from,3);return result;
        };
        // Common reference transfers add/drop a non-final owner directly.
        // Final drops still use the shared ownership proof before any new pin.
        auto copy_object=[&](LLVMValueRef dest,LLVMValueRef source){
            auto st=tag(source),sv=bits(source),dt=tag(dest),dv=bits(dest);
            auto refbit=[&](LLVMValueRef t){return LLVMBuildICmp(b,LLVMIntNE,LLVMBuildAnd(b,t,LLVMConstInt(tagtype,SQOBJECT_REF_COUNTED,false),"ref"),LLVMConstInt(tagtype,0,false),"managed");};
            auto rc=[&](LLVMValueRef value){return gep(LLVMBuildIntToPtr(b,value,ptr,"owner"),offsetof(SQRefCounted,_uiRef));};
            auto oldref=refbit(dt);
            auto inspect=LLVMAppendBasicBlockInContext(c,fn,"old_reference"),fast=LLVMAppendBasicBlockInContext(c,fn,"copy_fast"),slow=LLVMAppendBasicBlockInContext(c,fn,"copy_final"),done=LLVMAppendBasicBlockInContext(c,fn,"copied");
            LLVMBuildCondBr(b,oldref,inspect,fast);LLVMPositionBuilderAtEnd(b,inspect);
            auto count=LLVMBuildLoad2(b,word,rc(dv),"references");
#ifndef NO_GARBAGE_COLLECTOR
            count=LLVMBuildAnd(b,count,number(~(SQUnsignedInteger)MARK_FLAG),"unmarked_count");
#endif
            auto logs=LLVMBuildLoad2(b,ptr,gep(ctx,offsetof(SQJitContext,active_logs)),"ancestor_logs");
            auto unpinned=LLVMBuildICmp(b,LLVMIntEQ,logs,LLVMConstNull(ptr),"no_journal_pins");
            LLVMBuildCondBr(b,LLVMBuildAnd(b,unpinned,LLVMBuildICmp(b,LLVMIntUGT,count,number(1),"surviving_owner"),"safe_nonfinal"),fast,slow);
            LLVMPositionBuilderAtEnd(b,slow);
            guard(LLVMBuildICmp(b,LLVMIntNE,call((uintptr_t)&release_safe,word,{ctx,dest}),number(0),"can_drop"));
            call((uintptr_t)&assign_object,LLVMVoidTypeInContext(c),{dest,sv,LLVMBuildZExtOrBitCast(b,st,word,"source_type")});LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,fast);
            auto retain=LLVMAppendBasicBlockInContext(c,fn,"retain"),write=LLVMAppendBasicBlockInContext(c,fn,"write_object"),release=LLVMAppendBasicBlockInContext(c,fn,"drop_reference");
            LLVMBuildCondBr(b,refbit(st),retain,write);LLVMPositionBuilderAtEnd(b,retain);
            auto src_count=LLVMBuildLoad2(b,word,rc(sv),"source_refs");LLVMBuildStore(b,LLVMBuildAdd(b,src_count,number(1),"retained"),rc(sv));LLVMBuildBr(b,write);
            LLVMPositionBuilderAtEnd(b,write);LLVMBuildStore(b,sv,gep(dest,offsetof(SQObject,_unVal)));LLVMBuildStore(b,st,gep(dest,offsetof(SQObject,_type)));
            LLVMBuildCondBr(b,oldref,release,done);LLVMPositionBuilderAtEnd(b,release);
            auto old_count=LLVMBuildLoad2(b,word,rc(dv),"old_refs");LLVMBuildStore(b,LLVMBuildSub(b,old_count,number(1),"released"),rc(dv));LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,done);
        };
        auto comparison=[&](LLVMValueRef x,LLVMValueRef y,unsigned op){return LLVMBuildICmp(b,op==CMP_G?LLVMIntSGT:op==CMP_GE?LLVMIntSGE:op==CMP_L?LLVMIntSLT:LLVMIntSLE,x,y,"comparison");};
        bool terminal=false;
        switch(i.op){
        case _OP_LINE:break;
        // Keep common transfers visible to LLVM. Opaque bytecode helpers hide
        // both the values and their memory effects from the optimizer.
        case _OP_LOAD:copy_object(slot(i._arg0),pointer(&p->_literals[i._arg1]));break;
        case _OP_MOVE:copy_object(slot(i._arg0),slot(i._arg1));break;
        case _OP_EQ:case _OP_NE:{
            auto left=slot(i._arg2);
            auto right=i._arg3?pointer(&p->_literals[i._arg1]):slot(i._arg1);
            auto integers=LLVMBuildAnd(b,
                LLVMBuildICmp(b,LLVMIntEQ,tag(left),LLVMConstInt(tagtype,OT_INTEGER,false),"integer_left"),
                LLVMBuildICmp(b,LLVMIntEQ,tag(right),LLVMConstInt(tagtype,OT_INTEGER,false),"integer_right"),"integers");
            auto fast=LLVMAppendBasicBlockInContext(c,fn,"integer_equality"),slow=LLVMAppendBasicBlockInContext(c,fn,"numeric_equality"),done=LLVMAppendBasicBlockInContext(c,fn,"compared");
            LLVMBuildCondBr(b,integers,fast,slow);LLVMPositionBuilderAtEnd(b,slow);
            auto result=call((uintptr_t)boxed_step_for(i.op,false),word,{ctx,LLVMGetParam(fn,0),LLVMGetParam(fn,2),number(ip),LLVMGetParam(fn,1),vm,gep(caches,(ip-first)*sizeof(MemberCache))});
            guard(LLVMBuildICmp(b,LLVMIntNE,result,number(0),"completed"));LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,fast);
            auto equal=LLVMBuildICmp(b,i.op==_OP_EQ?LLVMIntEQ:LLVMIntNE,bits(left),bits(right),"equal");
            scalar_store(slot(i._arg0),LLVMBuildZExt(b,equal,word,"boolean"),OT_BOOL);LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,done);break;
        }
        case _OP_JZ:{
            auto value=slot(i._arg0),type=tag(value);
            // Match the 64-bit VM's IsFalse, including negative floating zero.
            auto raw=bits(value);
            auto magnitude=LLVMBuildAnd(b,raw,number(sizeof(SQFloat)==8?INT64_MAX:INT32_MAX),"float_magnitude");
            auto floating_zero=LLVMBuildAnd(b,
                LLVMBuildICmp(b,LLVMIntEQ,type,LLVMConstInt(tagtype,OT_FLOAT,false),"float"),
                LLVMBuildICmp(b,LLVMIntEQ,magnitude,number(0),"float_zero"),"floating_zero");
            auto isfalse=LLVMBuildOr(b,floating_zero,LLVMBuildICmp(b,LLVMIntEQ,raw,number(0),"zero"),"false_value");
            LLVMBuildCondBr(b,isfalse,destination(analysis.facts[ip].target),destination(ip+1));terminal=true;break;
        }
        case _OP_JMP:LLVMBuildBr(b,destination(analysis.facts[ip].target));terminal=true;break;
        case _OP_GET:case _OP_GETK:{
            auto raw=lookup(slot(i.op==_OP_GET?i._arg1:i._arg2),i.op==_OP_GET?slot(i._arg2):pointer(&p->_literals[i._arg1]));
            auto weak=LLVMBuildICmp(b,LLVMIntEQ,tag(raw),LLVMConstInt(tagtype,OT_WEAKREF,false),"weak_slot");
            auto weak_target=gep(LLVMBuildIntToPtr(b,bits(raw),ptr,"weak_owner"),offsetof(SQWeakRef,_obj));
            auto source=LLVMBuildSelect(b,weak,weak_target,raw,"read_value");copy_object(temp,source);
            auto dest=slot(i._arg0),old_type=tag(dest),old_bits=bits(dest),new_type=tag(temp),new_bits=bits(temp);
            LLVMBuildStore(b,new_type,gep(dest,offsetof(SQObject,_type)));LLVMBuildStore(b,new_bits,gep(dest,offsetof(SQObject,_unVal)));
            LLVMBuildStore(b,old_type,gep(temp,offsetof(SQObject,_type)));LLVMBuildStore(b,old_bits,gep(temp,offsetof(SQObject,_unVal)));break;
        }
        case _OP_LOADINT:scalar_store(slot(i._arg0),number((SQInt32)i._arg1),OT_INTEGER);break;
        case _OP_LOADBOOL:scalar_store(slot(i._arg0),number(i._arg1!=0),OT_BOOL);break;
        case _OP_PINCL:{
            auto old=intvalue(i._arg1);
            // Check the result's old owner before publishing the first write.
            // The incremented slot is already integer (also when aliased with
            // the result), so the second store cannot release or side exit.
            scalar_store(slot(i._arg0),old,OT_INTEGER);
            scalar_store(slot(i._arg1),LLVMBuildAdd(b,old,number((signed char)i._arg3),"post_increment"),OT_INTEGER);break;
        }
        case _OP_ADD:case _OP_SUB:case _OP_MUL:case _OP_DIV:case _OP_MOD:{
            auto x=intvalue(i._arg2),y=intvalue(i._arg1);LLVMValueRef value;
            if(i.op==_OP_ADD)value=LLVMBuildAdd(b,x,y,"add");
            else if(i.op==_OP_SUB)value=LLVMBuildSub(b,x,y,"subtract");
            else if(i.op==_OP_MUL)value=LLVMBuildMul(b,x,y,"multiply");
            else {guard(LLVMBuildICmp(b,LLVMIntNE,y,number(0),"nonzero"));
                guard(LLVMBuildNot(b,LLVMBuildAnd(b,LLVMBuildICmp(b,LLVMIntEQ,x,number(INT64_MIN),"min"),LLVMBuildICmp(b,LLVMIntEQ,y,number(-1),"minus_one"),"overflow"),"safe"));
                value=i.op==_OP_DIV?LLVMBuildSDiv(b,x,y,"divide"):LLVMBuildSRem(b,x,y,"remainder");}
            scalar_store(slot(i._arg0),value,OT_INTEGER);break;}
        case _OP_INCL:{auto x=intvalue(i._arg1);scalar_store(slot(i._arg1),LLVMBuildAdd(b,x,number((signed char)i._arg3),"increment"),OT_INTEGER);break;}
        case _OP_JCMP:case _OP_CMP:{
            if(i._arg3!=CMP_G && i._arg3!=CMP_GE && i._arg3!=CMP_L && i._arg3!=CMP_LE)return false;
            auto x=intvalue(i._arg2),y=intvalue(i.op==_OP_JCMP?i._arg0:i._arg1),test=comparison(x,y,i._arg3);
            scalar_store(i.op==_OP_JCMP?temp:slot(i._arg0),LLVMBuildZExt(b,test,word,"bool"),OT_BOOL);
            if(i.op==_OP_JCMP){LLVMBuildCondBr(b,test,destination(ip+1),destination(analysis.facts[ip].target));terminal=true;}break;}
        default:{
            if(i.op==_OP_SET && i._arg0==255){
                auto raw=lookup(slot(i._arg1),slot(i._arg2));copy_object(raw,slot(i._arg3));break;
            }
            auto helper=boxed_step_for(i.op,false);if(!helper)return false;
            auto result=call((uintptr_t)helper,word,{ctx,LLVMGetParam(fn,0),LLVMGetParam(fn,2),number(ip),LLVMGetParam(fn,1),vm,gep(caches,(ip-first)*sizeof(MemberCache))});
            guard(LLVMBuildICmp(b,LLVMIntNE,result,number(0),"completed"));
            if(i.op==_OP_JZ){LLVMBuildCondBr(b,LLVMBuildICmp(b,LLVMIntEQ,result,number(2),"truth"),destination(ip+1),destination(analysis.facts[ip].target));terminal=true;}
            if(i.op==_OP_RETURN){LLVMBuildRet(b,number(SQ_JIT_NATIVE_RETURNED));terminal=true;}
            break;}
        }
        if(!terminal)LLVMBuildBr(b,destination(ip+1));
    }
    char *error=nullptr;bool invalid=LLVMVerifyModule(ir.module,LLVMReturnStatusAction,&error);LLVMDisposeMessage(error);if(invalid)return false;
    auto options=LLVMCreatePassBuilderOptions();auto e=LLVMRunPasses(ir.module,"default<O2>",nullptr,options);LLVMDisposePassBuilderOptions(options);checked(e);
    auto module=LLVMOrcCreateNewThreadSafeModule(ir.module,ir.thread);ir.module=nullptr;
    checked(LLVMOrcLLJITAddLLVMIRModule(artifact->jit,LLVMOrcLLJITGetMainJITDylib(artifact->jit),module));
    LLVMOrcExecutorAddress address;checked(LLVMOrcLLJITLookup(artifact->jit,&address,"object_entry"));
    output->SetExternal((void*)(uintptr_t)address,artifact.release(),Artifact::release);return true;
}
} // namespace

bool sqjit_llvm_object_region(SQFunctionProto *p,SQInteger header,SQInteger *first,SQInteger *last,SQInteger *exit){
    if(!p || header<0 || header>=p->_ninstructions)return false;
    const auto &i=p->_instructions[header];if(i.op!=_OP_JCMP && i.op!=_OP_JZ)return false;
    SQInteger end=header+1+(SQInt32)i._arg1;
    if(end<=header || end>=p->_ninstructions || end-header>256)return false;
    for(SQInteger ip=header+1;ip<end;++ip){const auto &back=p->_instructions[ip];SQInteger start=ip+1+(SQInt32)back._arg1;
        if(back.op==_OP_JMP && start>=0 && start<=header){SQBytecodeAnalysis a;
            if(!eligible(p,start,ip,true,a))return false;
            *first=start;*last=ip;*exit=end;return true;}}
    return false;
}
SQJitCompileResult sqjit_llvm_object_compile(SQFunctionProto *p,SQInteger first,SQInteger last,SQInteger entry,SQJitCode *code,bool loop){
    try{if(compile(p,first,last,entry,code,loop))return SQJitCompileResult::Success(SQ_JIT_BACKEND_LLVM);}
    catch(const std::exception &){}
    return {false,false,SQ_JIT_BACKEND_LLVM,SQ_JIT_REJECT_OPCODE,-1,"LLVM boxed region unsupported"};
}
