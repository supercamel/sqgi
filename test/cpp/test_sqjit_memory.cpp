#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclass.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include "jit/sqjit_backend.h"
#include "jit/sqjit_backend_aarch64_emit.h"
#include <stdio.h>
#include <initializer_list>

static bool run(SQVM *v, const SQChar *source)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("jit-memory"), SQTrue));
    if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)); }
    if(!ok) {
        sq_getlasterror(v);
        const SQChar *error = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &error))) scprintf(_SC("FAIL: %s\n"), error);
    }
    sq_settop(v, top);
    return ok;
}

static SQJitObservation observe(SQVM *v, const SQChar *name)
{
    SQJitObservation result = {};
    sq_pushroottable(v); sq_pushstring(v, name, -1);
    if(SQ_SUCCEEDED(sq_get(v, -2))) {
        HSQOBJECT object; sq_getstackobj(v, -1, &object);
        if(sq_type(object) == OT_CLOSURE) sqjit_observe_proto(_closure(object)->_function, result);
        sq_pop(v, 1);
    }
    sq_pop(v, 1);
    return result;
}

#if SQJIT_HAS_EXTERNAL_NATIVE && defined(__aarch64__)
static int scalar_get_predicate()
{
    int rc = 0;
#define CHECK(c, msg) do { if(!(c)) { puts("FAIL: " msg); ++rc; } } while(0)
    // Execute the predicate itself for every real tag pair, independent of
    // compiler route selection. Raw SQObject fixtures have no destructors:
    // reference-tag payloads are deliberately never dereferenced by the test.
    static_assert(sizeof(SQObject) == sizeof(SQObjectPtr), "predicate fixture uses VM slot stride");
    SQObject raw_slots[2] = {}, first_vm[2] = {}, second_vm[2] = {};
    SQObject *active_vm = first_vm;
    SQJitA64Buffer predicate = {};
    SQInteger skip_predicate = -1;
    CHECK(sqjit_a64_emit_prologue(&predicate, 16) &&
        sqjit_a64_emit_scalar_get_skip(&predicate, 1, (SQInteger)(intptr_t)&active_vm,
            sizeof(SQObject) + offsetof(SQObject, _type), &skip_predicate) &&
        sqjit_a64_emit_epilogue(&predicate, 16, 0) &&
        sqjit_a64_patch_test_branch(&predicate, skip_predicate, predicate.size) &&
        sqjit_a64_emit_epilogue(&predicate, 16, 1), "emit standalone scalar GET ownership predicate");
    SQJitCode predicate_code;
    CHECK(predicate_code.Install(predicate.bytes, predicate.size), "install ownership predicate");
    if(predicate_code.Entry()) {
        typedef SQInteger (*Predicate)(SQObject *);
        Predicate check = (Predicate)predicate_code.Entry();
        const SQObjectType types[] = {OT_NULL, OT_INTEGER, OT_FLOAT, OT_BOOL, OT_STRING,
            OT_TABLE, OT_ARRAY, OT_USERDATA, OT_CLOSURE, OT_NATIVECLOSURE,
            OT_GENERATOR, OT_USERPOINTER, OT_THREAD, OT_FUNCPROTO, OT_CLASS,
            OT_INSTANCE, OT_WEAKREF, OT_OUTER};
        for(SQObjectType destination : types) for(SQObjectType temporary : types) {
            raw_slots[1]._type = destination;
            first_vm[1]._type = temporary;
            active_vm = first_vm;
            SQInteger expected = !ISREFCOUNTED(destination) && !ISREFCOUNTED(temporary);
            CHECK(check(raw_slots) == expected, "inline predicate matches C++ ownership tags");
            active_vm = NULL;
            CHECK(check(raw_slots) == 0, "raw native calls cannot elide the journal temporary");
            second_vm[1]._type = OT_NULL;
            active_vm = second_vm;
            CHECK(check(raw_slots) == !ISREFCOUNTED(destination), "predicate reloads the active VM each call");
        }
        active_vm = NULL;
        CHECK(check(NULL) == 0, "no-active-VM branch does not read VM or stack memory");
    }
#undef CHECK
    return rc;
}
#endif

static const SQChar *constructed_arrays = _SC(
    "function local_ints(n) { local a=[3,5,7,11]; local s=0; for(local i=0;i<n;i++) s+=a[i%4]; return s }\n"
    "function local_floats(n) { local a=[0.25,1.25,2.25]; local s=0.0; for(local i=0;i<n;i++) s+=a[i%3]; return s }\n"
    "function local_alias(n) { local a=[2,7,13]; local b=a; local s=0; for(local i=0;i<n;i++) s+=b[i%3]; return s }\n");

int main()
{
    int failures = 0;
#if SQJIT_HAS_EXTERNAL_NATIVE && defined(__aarch64__)
    failures += scalar_get_predicate();
#endif
    for(int enabled = 0; enabled < 2; ++enabled) {
        SQVM *v = sq_open(64);
        SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = enabled != 0; ctx.threshold = 1;
        ctx.trace = ctx.trace_stats = false;
        sqjit_observe_enable(v);
        if(!run(v, _SC(
            "function marker(x) { return x }\n"
            "function weak_store(t,a) { t.value=1; return a[0]+1 }\n"
            "function indexed(a,i) { return a[i]+0 }\n"
            "function ints(a,n) { local s=0; for(local i=0;i<n;i++) s+=a[i%4]; return s }\n"
            "function floats(a,n) { local s=0.0; for(local i=0;i<n;i++) s+=a[i%4]; return s }\n"
            "function float_region(a,n) { marker(0); local s=0.0; for(local i=0;i<n;i++) s+=a[i%4]; return marker(s) }\n"
            "function nested(a,n) { marker(0); local s=0.0; for(local i=0;i<n;i++) s+=a[i%2][0]; return marker(s) }\n"
            "function keys(a,t,n) { marker(0); local s=0; for(local i=0;i<n;i++) { local k=a[i%4]; local v=t[k]+1; t[k]=v; s+=t[k]; } return marker(s) }\n"
            "function escaping(a,n) { marker(0); local k=\"\"; for(local i=0;i<n;i++) k=a[i%4]; return marker(k) }\n"
            "function owned(a,t,n) { marker(0); local s=0; for(local i=0;i<n;i++) { local k=a[i]; a[i]=0; t[k]=t[k]+1; s+=t[k]; } return marker(s) }\n"
            "for(local j=0;j<3;j++) {\n"
            " if(indexed([1,2,3,4],j)!=j+1) throw \"dynamic index\";\n"
            " if(ints([1,2,3,4],20)!=50 || ints([1,2,3,4],0)!=0) throw \"integer reads\";\n"
            " foreach(f in [floats,float_region]) if(f([0.5,1.5,2.5,3.5],20)!=40.0) throw \"float reads\";\n"
            " if(nested([[0.5],[1.5]],20)!=20.0) throw \"nested float reads\";\n"
            " local t={a=0,b=0,c=0,d=0}; if(keys([\"a\",\"b\",\"c\",\"d\"],t,20)!=60 || t.a!=5 || t.d!=5) throw \"dynamic keys\";\n"
            "}\n"
            "local long_table={a=0,b=0,c=0,d=0};\n"
            "if(keys([\"a\",\"b\",\"c\",\"d\"],long_table,100000)!=1250050000 || long_table.a!=25000) throw \"long member loop\";\n"))) ++failures;
        if(!run(v, constructed_arrays)) ++failures;
        if(!run(v, _SC(
            "function local_mixed(i) { local a=[3,1.5,7]; return a[i] }\n"
            "function local_unknown(x,i) { local a=[x,3,5]; return a[i] }\n"
            "function local_changed(t,change,i) { local a=[3,5,7]; local b=a; t.count=t.count+1; if(change) b[1]=1.5; return a[i] }\n"
            "function local_replaced(t,change,i) { local a=[3,5,7]; t.count=t.count+1; if(change) a[1]=\"changed\"; return a[i] }\n"
            "function local_branch(flag,i) { local a=null; if(flag) a=[3,5,7]; else a=[0.5,1.5,2.5]; return a[i] }\n"
            "function local_empty(t,i) { local a=[]; t.count=t.count+1; return a[i] }\n"
            "for(local j=0;j<4;j++) {\n"
            " if(local_ints(28)!=182 || local_ints(0)!=0) throw \"constructed integer array\";\n"
            " if(local_floats(21)!=26.25 || local_floats(0)!=0.0) throw \"constructed float array\";\n"
            " if(local_alias(21)!=154 || local_alias(0)!=0) throw \"constructed array alias\";\n"
            " if(local_mixed(0)!=3 || local_mixed(1)!=1.5 || local_mixed(2)!=7) throw \"mixed construction\";\n"
            " local t={count=0}; if(local_changed(t,false,1)!=5 || t.count!=1) throw \"warm aliased construction\";\n"
            " if(local_replaced(t,false,1)!=5 || t.count!=2) throw \"warm object replacement\";\n"
            " if(local_branch(true,1)!=5 || local_branch(false,1)!=1.5) throw \"branch construction hint is not proof\";\n"
            "}\n"))) ++failures;
#if SQJIT_HAS_EXTERNAL_NATIVE && defined(__aarch64__)
        if(enabled) {
            for(const SQChar *name : {_SC("local_ints"), _SC("local_floats"), _SC("local_alias")}) {
                // Separately prove the new whole-function routes with clean
                // entry slots. The mixed-caller checks above also exercise
                // the existing conservative destruction/replay guards.
                SQVM *route_vm = sq_open(64);
                SQJitContext &route_ctx = sqjit_context(route_vm->_sharedstate);
                route_ctx.enabled = true; route_ctx.threshold = 1;
                route_ctx.trace = route_ctx.trace_stats = false;
                sqjit_observe_enable(route_vm);
                if(!run(route_vm, constructed_arrays)) ++failures;
                SQChar call[80]; scsprintf(call, sizeof(call) / sizeof(SQChar), _SC("%s(21);"), name);
                if(!run(route_vm, call)) ++failures;
                SQJitObservation o = observe(route_vm, name);
                if(!o.compilation.compiled || !o.frame.successes) {
                    scprintf(_SC("FAIL: native constructed array reads: %s (successes=%d guards=%d)\n"),
                        name, (SQInt32)o.frame.successes, (SQInt32)o.frame.guard_failures); ++failures;
                }
                sq_close(route_vm);
            }
        }
#endif
        if(!run(v, _SC(
            "local t={count=0};\n"
            "if(local_changed(t,true,1)!=1.5 || t.count!=1) throw \"aliased element tag must guard and replay once\";\n"
            "if(local_changed(t,false,1)!=5 || t.count!=2) throw \"construction after tag fallback\";\n"
            "if(local_replaced(t,true,1)!=\"changed\" || t.count!=3) throw \"replacement object must guard and replay once\";\n"
            "foreach(i in [-1,3,2147483647]) { local caught=false; local before=t.count;\n"
            " try { local_changed(t,false,i) } catch(e) { caught=true }\n"
            " if(!caught || t.count!=before+1) throw \"constructed bounds partial replay\"; }\n"
            "local caught=false, before=t.count; try { local_empty(t,0) } catch(e) { caught=true }\n"
            "if(!caught || t.count!=before+1) throw \"empty construction must not infer a scalar\";\n"
            "foreach(x in [19,2.5,true,null,\"value\",[17]]) {\n"
            " local result=local_unknown(x,0); if(result!=x || typeof result!=typeof x) throw \"unknown constructed element tag\"; }\n"
            "local owner=[29]; if(local_unknown(owner.weakref(),0)!=owner) throw \"constructed weakref dereference\";\n"))) ++failures;
        {
            SQObjectPtr owner(SQArray::Create(v->_sharedstate, 0));
            SQObjectPtr dead(_refcounted(owner)->GetWeakRef(OT_ARRAY));
            owner.Null();
            // Pass the raw weakref through the host API; fetching it from a
            // root-table slot would already dereference it before the array.
            SQInteger top = sq_gettop(v);
            sq_pushroottable(v); sq_pushstring(v, _SC("local_unknown"), -1);
            if(SQ_FAILED(sq_get(v, -2))) ++failures;
            else {
                sq_remove(v, -2); sq_pushroottable(v); sq_pushobject(v, dead); sq_pushinteger(v, 0);
                if(SQ_FAILED(sq_call(v, 3, SQTrue, SQTrue)) || sq_gettype(v, -1) != OT_NULL) {
                    puts("FAIL: constructed dead weakref reads null"); ++failures;
                }
            }
            sq_settop(v, top);
        }
#if SQJIT_HAS_X64_NATIVE
        if(enabled) {
            for(const SQChar *name : {_SC("ints"), _SC("floats")}) {
                SQJitObservation o = observe(v, name);
                if(o.compilation.backend != SQ_JIT_BACKEND_X64 || !o.compilation.compiled ||
                    !o.frame.successes || !o.direct.successes) {
                    scprintf(_SC("FAIL: native frame/direct memory reads: %s\n"), name); ++failures;
                }
            }
            for(const SQChar *name : {_SC("float_region"), _SC("keys"), _SC("nested")}) {
                SQJitObservation o = observe(v, name);
                if(!o.loop_compilation.compiled || !o.loop.successes || o.loop.guard_failures) {
                    scprintf(_SC("FAIL: native loop memory reads: %s\n"), name); ++failures;
                }
            }
        }
#endif
        if(!run(v, _SC(
            "if(floats([],0)!=0.0 || float_region([],0)!=0.0) throw \"zero trip shape fallback\";\n"
            "local t={a=0,b=0,d=0}; t[0]<-0;\n"
            "if(keys([\"a\",\"b\",0,\"d\"],t,4)!=4 || t.a!=1 || t.b!=1 || t[0]!=1 || t.d!=1) throw \"mixed key rollback\";\n"
            "t={a=0,b=0,d=0}; local caught=false; try { keys([\"a\",\"b\",\"missing\",\"d\"],t,4) } catch(e) { caught=true }\n"
            "if(!caught || t.a!=1 || t.b!=1 || t.d!=0) throw \"missing key partial replay\";\n"
            "t={a=0,b=0,c=0,d=0}; if(keys([],t,0)!=0 || t.a!=0) throw \"zero trip\";\n"
            "foreach(a in [[],[1],[1,2,3]]) { caught=false; try { ints(a,4) } catch(e) { caught=true } if(!caught) throw \"bounds\"; }\n"
            "foreach(i in [-1,-2147483648,4,2147483647]) { caught=false; try { indexed([1,2,3,4],i) } catch(e) { caught=true } if(!caught) throw \"signed bounds\"; }\n"
            "if(floats([1,2,3,4],20)!=50.0 || float_region([1,2,3,4],20)!=50.0) throw \"element type fallback\";\n"
            "local inner=[1.5]; if(nested([[0.5],inner.weakref()],20)!=20.0) throw \"nested weak fallback\";\n"
            "if(escaping([\"a\",\"b\",\"c\",\"d\"],4)!=\"d\") throw \"string live-out fallback\";\n"
            "local k=\"own\"+\"ed\", a=[k]; t={}; t[k]<-0; k=null;\n"
            "if(owned(a,t,1)!=1 || a[0]!=0 || t.owned!=1) throw \"borrowed key survives source overwrite\";\n"))) ++failures;
#if SQJIT_HAS_X64_NATIVE
        if(enabled) {
            if(!observe(v, _SC("keys")).loop.guard_failures) { puts("FAIL: late key guard fallback"); ++failures; }
            if(!observe(v, _SC("owned")).loop.successes || observe(v, _SC("owned")).loop.guard_failures) {
                puts("FAIL: native borrowed key ownership"); ++failures;
            }
            if(observe(v, _SC("escaping")).loop.successes) { puts("FAIL: escaping string must fall back"); ++failures; }
        }
#endif
        {
            // A reused loop must release references in dead VM temporaries,
            // even if those slots held null/scalars when it was compiled.
            SQObjectPtr owner(SQString::Create(v->_sharedstate,
                _SC("entry-tag-owner-not-a-bytecode-literal")));
            sq_pushroottable(v);
            sq_pushstring(v, _SC("entry_tag_owner"), -1);
            sq_pushobject(v, owner);
            if(SQ_FAILED(sq_newslot(v, -3, SQFalse))) ++failures;
            sq_pop(v, 1);
            const SQUnsignedInteger references = _string(owner)->_uiRef;
            if(!run(v, _SC(
                "function entry_tag_step(x,i) { if(i%2==0) return x+i; return x-i }\n"
                "function changing_entry_temporaries(n,old) { local sum=0;\n"
                " if(old!=null) { local a=old,b=old,c=old,d=old,e=old,f=old;\n"
                "  if(a!=b || c!=d || e!=f) throw \"temporary references\"; }\n"
                " for(local i=0;i<n;i++) sum=entry_tag_step(sum,i); return sum }\n"
                "for(local j=0;j<3;j++) if(changing_entry_temporaries(41,null)!=20) throw \"warmup\";\n"
                "for(local j=0;j<3;j++) if(changing_entry_temporaries(41,entry_tag_owner)!=20) throw \"changed tags\";\n"))) ++failures;
            if(_string(owner)->_uiRef != references) {
                puts("FAIL: scalar loop writeback leaked overwritten temporary references");
                ++failures;
            }
#if SQJIT_HAS_EXTERNAL_NATIVE
            if(enabled && !observe(v, _SC("changing_entry_temporaries")).loop.successes) {
                puts("FAIL: temporary ownership regression must execute a native loop");
                ++failures;
            }
#endif
        }
#if SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE
        for(int instance = 0; enabled && instance < (SQJIT_HAS_EXTERNAL_NATIVE ? 2 : 1); ++instance) {
            // Execute the artifact directly so interpreter replay cannot hide
            // an incorrectly restored weakref tag or object lifetime.
            SQObjectPtr stack[MAX_FUNC_STACKSIZE];
            stack[2] = SQArray::Create(v->_sharedstate, 1);
            SQObjectPtr value(SQArray::Create(v->_sharedstate, 0));
            SQObjectPtr weak(_array(value)->GetWeakRef(OT_ARRAY));
            SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("value")));
            if(instance) {
                SQObjectPtr klass(SQClass::Create(v->_sharedstate, NULL));
                _class(klass)->NewSlot(v->_sharedstate, key, weak, false);
                stack[1] = _class(klass)->CreateInstance();
            }
            else {
                stack[1] = SQTable::Create(v->_sharedstate, 0);
                _table(stack[1])->NewSlot(key, weak);
            }
            _array(stack[2])->Set(0, SQObjectPtr((SQInteger)2));
            sq_pushroottable(v); sq_pushstring(v, _SC("weak_store"), -1); sq_get(v, -2);
            HSQOBJECT object; sq_getstackobj(v, -1, &object);
            SQClosure *closure = _closure(object);
            SQJitNative native;
            SQJitCompileResult compiled = sqjit_backend_compile_proto(closure->_function, stack, closure, &native);
            if(!compiled) { puts("FAIL: compile weak member rollback kernel"); ++failures; }
            else {
                _array(stack[2])->Set(0, SQObjectPtr(SQString::Create(v->_sharedstate, _SC("late"))));
                for(int dead = 0; dead < 2; ++dead) {
                    if(dead) value.Null();
                    SQObjectPtr out, restored;
                    SQInteger status = ((SQJitNativeObjectFn)native._code.Entry())(stack, &out, closure);
                    bool found = true;
                    if(instance) restored = _instance(stack[1])->_values[0];
                    else found = _table(stack[1])->GetRaw(key, restored);
                    if(status != SQ_JIT_NATIVE_GUARD_FAILED || !found ||
                        sq_type(restored) != OT_WEAKREF || _weakref(restored) != _weakref(weak)) {
                        puts("FAIL: native rollback restores live/dead weak member identity"); ++failures;
                    }
                }
            }
            sq_pop(v, 2);
        }
#endif
        sq_close(v);
    }
    return failures ? 1 : 0;
}
