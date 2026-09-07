#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "jit/sqjit.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_diagnostics.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
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

int main()
{
    int rc = 0;
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
    CHECK(guard.direct.guard_failures > 0 && guard.frame.guard_failures > 0,
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
