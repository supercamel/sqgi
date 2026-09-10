#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "sqclass.h"
#include <vector>
#include "jit/sqjit.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_diagnostics.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#if defined(SQJIT_CPU_AARCH64)
#include "jit/sqjit_backend_aarch64_emit.h"
#endif
#include <stdio.h>
#include <limits>
#include <type_traits>

#define CHECK(cond, msg) do { if(!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); ++rc; } } while(0)
static_assert(!std::is_copy_constructible<SQJitCode>::value, "code mappings have one owner");
static_assert(!std::is_copy_constructible<SQJitNative>::value, "native artifacts have one owner");
static_assert(!std::is_copy_constructible<SQJitProto>::value, "proto artifacts have one owner");

static bool run(SQVM *v, const SQChar *source)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("jit-contracts"), SQTrue));
    if(ok) {
        sq_pushroottable(v);
        ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue));
    }
    if(!ok) {
        sq_getlasterror(v);
        const SQChar *error = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &error))) scprintf(_SC("script failure: %s\n"), error);
    }
    sq_settop(v, top);
    return ok;
}

static SQFunctionProto *proto(SQVM *v, const SQChar *name)
{
    sq_pushroottable(v);
    sq_pushstring(v, name, -1);
    SQFunctionProto *p = NULL;
    if(SQ_SUCCEEDED(sq_get(v, -2))) {
        HSQOBJECT obj;
        sq_getstackobj(v, -1, &obj);
        if(sq_type(obj) == OT_CLOSURE) p = _closure(obj)->_function;
        sq_pop(v, 1);
    }
    sq_pop(v, 1);
    return p;
}

static SQInteger stub() { return 42; }
static void debug_hook(HSQUIRRELVM, SQInteger, const SQChar *, SQInteger, const SQChar *) {}

#if defined(SQJIT_CPU_AARCH64)
static SQVM *nested_loop_vm = NULL;
static bool nested_loop_active = false, nested_loop_ok = false;
// An injected mapped entry isolates executable-lifetime/reentry behavior. The
// nested alternate is compiled from real bytecode. This does not claim that
// ordinary compiled loops admit arbitrary callbacks.
static SQInteger nested_loop_entry(SQObjectPtr *stack,SQInteger *next,SQClosure *closure)
{
    if(nested_loop_active) return SQ_JIT_NATIVE_GUARD_FAILED;
    nested_loop_active = true;
    SQJitContext &ctx=sqjit_context(closure->_function->_sharedstate);
    SQVM *outer=ctx.active_vm;
    nested_loop_ok = run(nested_loop_vm,_SC("if(nested_mapping(7)!=17 || nested_root!=6) throw \"nested mapping\";")) &&
        ctx.active_vm==outer;
    nested_loop_active = false;
    // Model this fixture's completed outer loop before jumping to its exit.
    _table(outer->_roottable)->Set(SQObjectPtr(SQString::Create(outer->_sharedstate,_SC("nested_root"))),
        SQObjectPtr(_integer(stack[1])-1));
    *next=closure->_function->_jit->_loop_exit_ip;
    return SQ_JIT_NATIVE_RETURNED;
}

static void nested_loop_mapping_test(int &rc)
{
    SQVM *v=sq_open(64);
    SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;
    ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
    CHECK(run(v,_SC("nested_root <- 0; function nested_mapping(n) { nested_root=0;"
        " for(local i=0;i<n;i++) nested_root=i; return 17; }")), "define nested mapping fixture");
    SQFunctionProto *p=proto(v,_SC("nested_mapping"));
    SQInteger start=-1,header=-1,end=-1,exit=-1;
    for(SQInteger ip=0;p && ip<p->_ninstructions;++ip)
        if(sqjit_backend_loop_find_region(p,ip,&start,&end,&exit)) { header=ip;break; }
    CHECK(p && !p->_jit && header>=0, "nested mapping fixture exposes an uncompiled loop region");
    if(!p || p->_jit || header<0) { sq_close(v);return; }
    void *storage=sq_vm_malloc(sizeof(SQJitProto));
    CHECK(storage, "allocate the nested mapping artifact");
    if(!storage) { sq_close(v);return; }
    SQJitProto *jit=p->_jit=new(storage) SQJitProto();
    jit->_eligibility=SQ_JIT_NEVER; // Force the real VM loop-entry ABI.
    jit->_loop_header_ip=header;jit->_loop_exit_ip=exit;jit->_loop_has_succeeded=true;
    SQJitA64Buffer code;code.size=0;
    // Preserve fp/lr across the callback; propagate its native status in x0.
    bool built=sqjit_a64_emit_u32(&code,0xA9BF7BFDu) && sqjit_a64_emit_u32(&code,0x910003FDu) &&
        sqjit_a64_emit_mov_imm_x(&code,16,(SQInteger)(intptr_t)nested_loop_entry) &&
        sqjit_a64_emit_blr_x16(&code) && sqjit_a64_emit_u32(&code,0xA8C17BFDu) &&
        sqjit_a64_emit_u32(&code,0xD65F03C0u) && jit->_loop_code.Install(code.bytes,code.size);
    CHECK(built, "install the primary executable mapping for the reentry witness");
    if(!built) { sq_close(v);return; }
    void *primary=jit->_loop_code.Entry();
    nested_loop_vm=sq_newthread(v,64);
    SQObjectPtr thread_owner=v->GetUp(-1);sq_pop(v,1);
    nested_loop_ok=false;
    CHECK(run(v,_SC("if(nested_mapping(5)!=17 || nested_root!=4) throw \"outer mapping\";")) && nested_loop_ok,
        "nested compilation returns through the still-live primary native mapping");
    CHECK(jit->_loop_code.Entry()==primary && jit->_loop_alternate_code.Entry() &&
        jit->_loop_alternate_attempted && !ctx.active_vm && !ctx.active_logs,
        "nested loop adaptation preserves both mappings and restores VM context");
    nested_loop_vm=NULL;thread_owner.Null();sq_close(v);
}
#endif

static void loop_variant_tests(int &rc)
{
#if defined(SQJIT_CPU_AARCH64)
    nested_loop_mapping_test(rc);
    for(bool reversed : {false,true}) {
        SQVM *v = sq_open(64);
        SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = ctx.precise_exits = true; ctx.threshold = 1;
        ctx.trace = ctx.trace_stats = false; sqjit_observe_enable(v);
        CHECK(run(v,_SC(
            "variant_root <- 0;"
            "class VariantLocal { value=0; function update(x) { value=x; return x; } }"
            "class VariantRoot { function update(x) { variant_root=x; return x; } }"
            "class VariantThird { value=0; function update(x) { value=x; return x+1; } }"
            "function variants(n,kind) { variant_root=0;"
            " local receiver=kind==0 ? VariantLocal() : (kind==1 ? VariantRoot() : VariantThird()),sum=0;"
            " for(local i=0;i<n;i++) sum=(sum+receiver.update((i*13+7)%997))%100003;"
            " return sum+(kind==1 ? variant_root : receiver.value); }")), "define independent receiver-history fixture");
        SQFunctionProto *p = proto(v,_SC("variants"));
        auto call_variant = [&](SQInteger kind, SQInteger extra) {
            SQInteger top=sq_gettop(v),actual=-1,expected=0,last=0;
            for(SQInteger i=0;i<37;++i) { last=(i*13+7)%997; expected=(expected+last+extra)%100003; }
            expected+=last;
            sq_pushroottable(v);sq_pushstring(v,_SC("variants"),-1);
            bool ok=SQ_SUCCEEDED(sq_get(v,-2));
            if(ok) {
                sq_pushroottable(v);sq_pushinteger(v,37);sq_pushinteger(v,kind);
                ok=SQ_SUCCEEDED(sq_call(v,3,SQTrue,SQFalse)) &&
                    SQ_SUCCEEDED(sq_getinteger(v,-1,&actual)) && actual==expected;
            }
            sq_settop(v,top);return ok;
        };
        for(int n=0;n<3;++n) CHECK(call_variant(reversed?1:0,0), "first receiver's loop result and stores");
        CHECK(p && p->_jit && p->_jit->_loop_code.Entry() && p->_jit->_loop_has_succeeded &&
            !p->_jit->_loop_alternate_code.Entry(), "first receiver executes one native loop mapping");
        if(!p || !p->_jit) { sq_close(v);continue; }
        SQJitProto *jit=p->_jit;void *primary=jit->_loop_code.Entry();
        for(int n=0;n<3;++n) CHECK(call_variant(reversed?0:1,0), "second receiver's loop result and stores");
        CHECK(jit->_loop_alternate_attempted && jit->_loop_alternate_code.Entry() &&
            jit->_loop_code.Entry()==primary, "second receiver installs an independent mapping without replacing the first");
        void *alternate=jit->_loop_alternate_code.Entry();
        SQJitObservation before={},after={};
        for(int n=0;n<12;++n) {
            sqjit_observe_proto(p,before);
            CHECK(call_variant(n%2,0), "alternating receiver results remain correct");
            CHECK(sqjit_observe_proto(p,after) && after.loop.successes>before.loop.successes,
                "each alternating receiver actually executes a native loop");
            CHECK(jit->_loop_code.Entry()==primary && jit->_loop_alternate_code.Entry()==alternate,
                "alternating histories retain both immutable mappings");
        }
        // Remove an inlined closure, then deliberately obtain a new closure at
        // its old allocator address. Pointer equality alone cannot identify a
        // method after its lifetime ends. ASan quarantine may prevent reuse.
        CHECK(run(v,_SC("variant_replacement <- function(x) { value=x; return x+1; };")),
            "prepare a replacement before releasing the guarded method");
        SQObjectPtr klass,key(SQString::Create(v->_sharedstate,_SC("update"))),old,replacement;
        _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("VariantLocal"))),klass);
        _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("variant_replacement"))),replacement);
        _class(klass)->Get(key,old);
        SQClosure *old_address=_closure(old);
        SQObjectPtr weak(old_address->GetWeakRef(OT_CLOSURE));
        old.Null();v->temp_reg.Null();
        std::vector<SQObjectPtr> copies;copies.reserve(64);
        CHECK(_class(klass)->NewSlot(v->_sharedstate,key,replacement,true), "replace the original inlined method");
        CHECK(sq_type(_weakref(weak)->_obj)==OT_NULL, "inlining does not keep a removed method alive");
        bool reused=false;
        for(int n=0;n<64;++n) {
            copies.push_back(SQObjectPtr(_closure(replacement)->Clone()));
            if(_closure(copies.back())==old_address) {
                reused=true;
                CHECK(_class(klass)->NewSlot(v->_sharedstate,key,copies.back(),true), "publish a closure reusing the old address");
                CHECK(call_variant(0,1), "reused closure address cannot authorize stale inlined code");
                break;
            }
        }
#ifndef __SANITIZE_ADDRESS__
        CHECK(reused, "release build exercises actual closure-address reuse");
#endif
        copies.clear();klass.Null();old.Null();replacement.Null();weak.Null();key.Null();
        SQInteger attempts=after.loop_compile_attempts;
        CHECK(call_variant(2,1), "third receiver falls back with its distinct method result");
        CHECK(run(v,_SC("VariantLocal.update=function(x) { value=x; return x+1; };")), "replace a warmed receiver method");
        CHECK(call_variant(0,1), "method replacement cannot run the stale inlined method");
        CHECK(sqjit_observe_proto(p,after) && after.loop_compile_attempts==attempts &&
            jit->_loop_code.Entry()==primary && jit->_loop_alternate_code.Entry()==alternate,
            "unsupported third shapes and replacement do not cause unbounded compilation or mapping replacement");
        sq_close(v);
    }
#else
    (void)rc;
#endif
}

int main()
{
    int rc = 0;
    loop_variant_tests(rc);
    SQVM *v = sq_open(64);
    SQVM *other = sq_open(64);
    CHECK(v && other, "two live VMs open");
    if(!v || !other) return 1;
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    SQJitContext &other_ctx = sqjit_context(other->_sharedstate);
    ctx.enabled = true;
    ctx.threshold = 1;
    ctx.trace = ctx.trace_stats = false;
    other_ctx.enabled = false;
    other_ctx.threshold = 999;
    other_ctx.trace = other_ctx.trace_stats = false;
    sqjit_observe_enable(v);
    sqjit_observe_enable(other);

    CHECK(run(v, _SC("function add(x) { return x + 7 }\n"
        "function guarded(a) { a[0] = a[0] + 1; a[0] = a[0] + 2; a[2] = a[2] + 3; return a[1] + 1 }\n"
        "function unsupported(x) { return typeof x }\n"
        "function accessor(x) { return x.value }\n"
        "function marker(x) { return x }\n"
        "function region(a,n) { marker(0); for(local i=0; i<n; i++) { a[0]=a[0]+1; local late=a[1]+1; } return marker(a[0]) }\n")), "define kernels");
    CHECK(run(v, _SC("if(add(4)!=11 || add(5)!=12) throw \"add\";"
        "if(unsupported(4)!=\"integer\") throw \"typeof\";"
        "if(accessor({value=7})!=7 || accessor({value=8})!=8) throw \"accessor\";"
        "local a=[0,10,0]; if(guarded(a)!=11 || a[0]!=3 || a[2]!=3) throw \"warmup\";"
        "a=[0,10,0]; if(guarded(a)!=11) throw \"direct warmup\";"
        "a=[0,\"x\",0]; if(guarded(a)!=\"x1\" || a[0]!=3 || a[2]!=3) throw \"rollback\";"
        "a=[0,10]; if(region(a,4)!=4 || a[0]!=4) throw \"loop warmup\";"
        "a=[0,\"x\"]; if(region(a,4)!=4 || a[0]!=4) throw \"loop rollback\";")), "native and fallback values/side effects");
    SQJitObservation add = {}, guard = {}, loop = {}, rejected = {}, specialized = {};
    CHECK(sqjit_observe_proto(proto(v, _SC("add")), add), "observe numeric kernel");
    CHECK(sqjit_observe_proto(proto(v, _SC("guarded")), guard), "observe write kernel");
    CHECK(sqjit_observe_proto(proto(v, _SC("region")), loop), "observe loop kernel");
    CHECK(sqjit_observe_proto(proto(v, _SC("unsupported")), rejected), "observe intentional rejection");
    CHECK(sqjit_observe_proto(proto(v, _SC("accessor")), specialized), "observe C++ specialization");
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
    const SQJitBackendKind backend = SQJIT_HAS_X64_NATIVE ? SQ_JIT_BACKEND_X64 : SQ_JIT_BACKEND_AARCH64;
    CHECK(add.compilation.compiled && add.compilation.backend == backend, "numeric kernel installs native code");
    CHECK(add.frame.successes > 0, "frame entry really executes native code");
    CHECK(add.direct.successes > 0, "direct call really executes native code");
    CHECK(guard.compilation.compiled && guard.compilation.backend == backend, "write kernel installs native code");
    CHECK(guard.frame.successes + guard.direct.successes > 0, "write kernel native success");
    if(proto(v,_SC("guarded"))->_jit->_entry->_requires_vm_frame) {
        CHECK(guard.frame.side_exits > 0 && guard.frame.guard_failures == 0 &&
            guard.direct.successes == 0,
            "late guard uses a real frame continuation without whole-function replay");
    }
    else CHECK(guard.direct.guard_failures > 0 && guard.frame.guard_failures > 0,
        "late guard fails on direct route and frame replay");
    CHECK(loop.loop_compilation.compiled && loop.loop_compilation.backend == backend, "loop region installs native code");
    CHECK(loop.loop.successes > 0 && loop.loop.guard_failures > 0, "loop executes and guard falls back");
    CHECK(rejected.compile_attempts > 0 && !rejected.compilation.compiled &&
        rejected.compilation.category == SQ_JIT_REJECT_OPCODE && rejected.compilation.ip >= 0 &&
        rejected.compilation.reason && !rejected.compilation.retryable, "unsupported opcode has structured permanent rejection");
    CHECK(!proto(v, _SC("unsupported"))->_jit->_entry, "rejection installs no artifact");
    SQObjectPtr entry_stack[MAX_FUNC_STACKSIZE];
    SQFunctionProto *add_proto = proto(v, _SC("add"));
    SQJitCompileResult invalid = sqjit_backend_compile_proto(add_proto, entry_stack, NULL, NULL);
    CHECK(!invalid && invalid.category == SQ_JIT_REJECT_INVALID_BYTECODE,
        "missing artifact rejected before native compilation");
    SQJitProto invalid_loop;
    invalid = sqjit_backend_compile_loop(add_proto, entry_stack, NULL, 0, 0,
        add_proto->_ninstructions, add_proto->_ninstructions, &invalid_loop);
    CHECK(!invalid && invalid.category == SQ_JIT_REJECT_INVALID_BYTECODE && !invalid_loop._loop_code,
        "loop end outside bytecode rejected without an artifact");

    SQJitCode occupied;
    occupied.SetStub((void *)stub);
    invalid = sqjit_backend_compile_loop(add_proto,entry_stack,NULL,0,0,
        add_proto->_ninstructions,add_proto->_ninstructions,&invalid_loop,&occupied);
    CHECK(!invalid && invalid.category==SQ_JIT_REJECT_INVALID_BYTECODE &&
        occupied.Entry()==(void *)stub, "explicit nonempty loop destination preserves its existing code");

    sq_setnativedebughook(v, debug_hook);
    CHECK(run(v, _SC("if(add(6)!=13) throw \"debugger\";")), "debugger preserves interpreter behavior");
    SQJitObservation debug = {};
    CHECK(sqjit_observe_proto(add_proto, debug) && debug.frame.successes == add.frame.successes &&
        debug.direct.successes == add.direct.successes, "debug hook suspends native execution");
    sq_setnativedebughook(v, NULL);
    CHECK(run(v, _SC("for(local i=0;i<40;i++) { local a=[0,\"x\",0];"
        "if(guarded(a)!=\"x1\" || a[0]!=3 || a[2]!=3) throw \"backoff rollback\"; }")),
        "guard backoff preserves rollback and replay");
    CHECK(ctx.Diagnostics().total.proto_backoffs > 0 && ctx.Diagnostics().total.proto_backoff_skips > 0,
        "repeated guard failure really enters and exercises backoff");
#else
    CHECK(!add.compilation.compiled && add.compilation.backend == SQ_JIT_BACKEND_NONE, "unsupported host falls back");
#endif
    CHECK(specialized.compilation.compiled && specialized.compilation.backend == SQ_JIT_BACKEND_CPP,
        "C++ specialization is distinct from generated code");
    CHECK(specialized.frame.successes + specialized.direct.successes > 0, "C++ specialization executes");
    CHECK(ctx.proto_tick > 0 && other_ctx.proto_tick == 0 && other_ctx.loop_tick == 0,
        "hotness/backoff clocks are isolated");
    CHECK(other_ctx.enabled == false && other_ctx.threshold == 999, "runtime options are isolated");
    CHECK(other_ctx.Diagnostics().total.proto_compile_attempts == 0, "diagnostics are isolated");
    CHECK(other_ctx.Diagnostics().total.proto_backoffs == 0, "backoff state is isolated");
    CHECK(run(other, _SC("function add(x) { return x+7 } if(add(4)!=11) throw \"other\";")), "disabled second VM interprets");
    CHECK(!proto(other, _SC("add"))->_jit, "disabled VM installs no JIT state");
    SQVM *thread = sq_newthread(v, 64);
    CHECK(thread && &sqjit_context(thread->_sharedstate) == &ctx, "coroutines share their owning context");
    sq_pop(v, 1);
    sq_close(v);
    CHECK(run(other, _SC("if(add(5)!=12) throw \"survivor\";")), "second VM survives first VM shutdown");
    sq_close(other);

    SQVM *fresh = sq_open(64);
    SQJitContext &fresh_ctx = sqjit_context(fresh->_sharedstate);
    fresh_ctx.trace_stats = false;
    CHECK(fresh_ctx.proto_tick == 0 && fresh_ctx.loop_tick == 0 && !fresh_ctx.ExistingDiagnostics(),
        "new shared state has no stale runtime state");
    sq_close(fresh);

    SQJitCode code;
    CHECK(!code && code.MappedSize() == 0, "empty code owns nothing");
    code.SetStub((void *)stub);
    CHECK(code.Entry() == (void *)stub && code.MappedSize() == 0, "stub is borrowed");
    const unsigned char bytes[] = {0xc3};
    CHECK(!code.Install(NULL, 1) && !code.Install(bytes, 0) && !code.Install(bytes, -1), "invalid mappings rejected");
    CHECK(!code.Install(bytes, std::numeric_limits<SQInteger>::max()), "mapping size overflow rejected");
    CHECK(code.Entry() == (void *)stub, "failed install preserves previous artifact");
    CHECK(code.Install(bytes, sizeof(bytes)) && code.MappedSize() >= sizeof(bytes), "code installs into owned mapping");
    code.SetStub((void *)stub); // Releases mapping; destructor must not unmap stub.
    code.Reset();
    CHECK(!code && code.MappedSize() == 0, "reset releases ownership");
    if(!rc) puts("[OK] JIT compilation, execution, fallback and ownership contracts");
    return rc ? 1 : 0;
}
