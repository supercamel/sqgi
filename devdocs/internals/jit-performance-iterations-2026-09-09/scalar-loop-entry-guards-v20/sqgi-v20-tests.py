from pathlib import Path
p=Path('test/cpp/test_sqjit_contracts.cpp');s=p.read_text();pos=s.index('static bool loop_variant_tests_ran')
s=s[:pos]+'''static bool entry_guard_tests_ran = false;
#if SQJIT_HAS_EXTERNAL_NATIVE
// Entry guard copies follow the final epilogue and branch back to the loop.
// Count only that executed entry section, not unreachable original guard bytes.
static int entry_guard_calls(SQFunctionProto *p)
{
    if(!p || !p->_jit || !p->_jit->_loop_code.Entry()) return -1;
    const SQJitCode &code = p->_jit->_loop_code;
    const uint32_t *words = (const uint32_t *)code.Entry();
    SQInteger count = code.MappedSize()/4, end=0, last_return=-1;
    for(SQInteger n=0;n<count;++n) {
        if(words[n]) end=n+1;
        if(words[n]==0xd65f03c0u) last_return=n;
    }
    if(last_return<0 || end<=last_return+1) return 0;
    if((words[end-1]&0xfc000000u)!=0x14000000u) return -1;
    int calls=0;
    for(SQInteger n=last_return+1;n<end;++n) if(words[n]==0xd63f0200u) ++calls;
    return calls;
}
#endif

static void entry_guard_tests(int &rc)
{
#if SQJIT_HAS_EXTERNAL_NATIVE
    entry_guard_tests_ran = true;
    SQVM *v = sq_open(64);
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    ctx.enabled = ctx.precise_exits = true; ctx.threshold = 1;
    ctx.trace = ctx.trace_stats = false; sqjit_observe_enable(v);
    CHECK(run(v,_SC(
        "function guard_marker(x) { return x } "
        "function guard_leaf(x) { return x+1; } "
        "function guard_replacement(x) { return x+2; } "
        "function guard_pure(n) { guard_marker(0); local sum=0; "
        "for(local i=0;i<n;i++) { sum+=guard_leaf(i); sum+=guard_leaf(i); } return guard_marker(sum); } "
        "for(local k=0;k<3;k++) if(guard_pure(37)!=1406) throw \\"entry guard warmup\\";"
    )), "warm repeated pure root call sites");
    SQFunctionProto *pure = proto(v,_SC("guard_pure"));
    SQJitObservation before={},after={};
    CHECK(pure && sqjit_observe_proto(pure,before) && before.loop.successes>0,
        "pure root fixture executes a native loop");
    CHECK(entry_guard_calls(pure)==1, "two equal call sites use one entry identity check");
    {
        SQObjectPtr key(SQString::Create(v->_sharedstate,_SC("guard_leaf"))),old,replacement;
        _table(v->_roottable)->Get(key,old);
        _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("guard_replacement"))),replacement);
        SQClosure *old_address=_closure(old);
        SQObjectPtr weak(old_address->GetWeakRef(OT_CLOSURE));
        old.Null();v->temp_reg.Null();
        CHECK(_table(v->_roottable)->Set(key,replacement), "replace the entry-guarded pure callee");
        CHECK(sq_type(_weakref(weak)->_obj)==OT_NULL, "entry guard retains only a weak pure-callee witness");
        std::vector<SQObjectPtr> copies;copies.reserve(64);bool reused=false;
        for(int n=0;n<64;++n) {
            copies.push_back(SQObjectPtr(_closure(replacement)->Clone()));
            if(_closure(copies.back())==old_address) {
                reused=true;
                CHECK(_table(v->_roottable)->Set(key,copies.back()), "publish recycled pure-callee address");
                break;
            }
        }
#ifndef __SANITIZE_ADDRESS__
        CHECK(reused,"release build exercises entry-guarded pure closure address reuse");
#endif
        CHECK(run(v,_SC("if(guard_pure(37)!=1480) throw \\"entry lifetime replacement\\";")),
            "entry guard rejects dead lifetime despite recycled callee address");
        CHECK(pure && sqjit_observe_proto(pure,after) && after.loop.guard_failures>before.loop.guard_failures,
            "pure closure replacement actually fails native entry identity");
    }
    CHECK(run(v,_SC(
        "function guard_parameter(n,fn) { guard_marker(0); local sum=0; "
        "for(local i=0;i<n;i++) sum+=fn(i); return guard_marker(sum); } "
        "for(local k=0;k<3;k++) if(guard_parameter(37,guard_replacement)!=740) throw \\"parameter warmup\\"; "
        "if(guard_parameter(0,17)!=0) throw \\"empty invalid callee\\"; "
        "if(guard_parameter(3,function(x){return x+7;})!=24) throw \\"parameter rebound\\";"
    )), "invariant parameter guard handles empty loops and rebound closures");
    SQFunctionProto *parameter=proto(v,_SC("guard_parameter"));
    CHECK(parameter && sqjit_observe_proto(parameter,after) && after.loop.successes>0 && entry_guard_calls(parameter)==1,
        "fixed closure parameter executes with an entry check");
    CHECK(run(v,_SC(
        "guard_saved <- guard_leaf; "
        "function guard_mutation(n,t) { guard_marker(0); local sum=0; "
        "for(local i=0;i<n;i++) { sum+=guard_leaf(i); t.guard_leaf=0; sum+=guard_leaf(i); } return guard_marker(sum); } "
        "local dummy={guard_leaf=0}; for(local k=0;k<3;k++) if(guard_mutation(37,dummy)!=1480) throw \\"mutation warmup\\"; "
        "local caught=false; try { guard_mutation(1,this); } catch(e) { caught=true; } "
        "if(!caught || guard_leaf!=0) throw \\"guard crossed aliased root mutation\\"; guard_leaf=guard_saved; "
        "guard_counter <- 0; "
        "function guard_effectful(x) { guard_counter=x; return x+1; } "
        "function guard_effectful_parent(n) { guard_marker(0); local sum=0; "
        "for(local i=0;i<n;i++) sum+=guard_effectful(i); return guard_marker(sum); } "
        "for(local k=0;k<3;k++) if(guard_effectful_parent(37)!=703 || guard_counter!=36) throw \\"effectful callee\\";"
    )), "loop and inlined-callee effects preserve per-call identity and mutation order");
    for(const SQChar *name : {_SC("guard_mutation"),_SC("guard_effectful_parent")}) {
        SQFunctionProto *p=proto(v,name);
        CHECK(p && sqjit_observe_proto(p,after) && after.loop.successes>0,
            "effectful negative fixture actually executes native code");
        CHECK(entry_guard_calls(p)==0,"effectful region retains its in-loop guards");
    }
    sq_close(v);
#endif
}

'''+s[pos:]
s=s.replace('    loop_variant_tests(rc);','    entry_guard_tests(rc);\n    loop_variant_tests(rc);',1)
s=s.replace('    CHECK(loop_variant_tests_ran,','    CHECK(entry_guard_tests_ran,"AArch64 entry guard contracts actually execute");\n    fprintf(stdout,"[coverage] executed AArch64 scalar loop entry guard contracts\\n");\n    CHECK(loop_variant_tests_ran,',1)
p.write_text(s)
p=Path('test/cpp/test_sqjit_intrinsics.cpp');s=p.read_text().replace('#include "jit/sqjit_context.h"','#include "jit/sqjit_context.h"\n#include "jit/sqjit.h"')
needle='        CHECK(before.loop.successes > 0, "native closure lifetime fixture executes compiled loop");'
s=s.replace(needle,needle+'''
        SQObjectPtr fixture;
        _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("native_lifetime"))),fixture);
        SQJitProto *jit = _closure(fixture)->_function->_jit;
        bool entry_check = false;
        if(jit && jit->_loop_code.Entry()) {
            const uint32_t *words=(const uint32_t *)jit->_loop_code.Entry();
            SQInteger end=0,last_return=-1;
            for(SQInteger i=0;i<jit->_loop_code.MappedSize()/4;++i) {
                if(words[i]) end=i+1;
                if(words[i]==0xd65f03c0u) last_return=i;
            }
            entry_check=last_return>=0 && end>last_return+1 &&
                (words[end-1]&0xfc000000u)==0x14000000u;
        }
        CHECK(entry_check,"native closure address-reuse fixture exercises hoisted entry guard");''',1)
p.write_text(s)
print('Added positive/negative entry guard contracts and strengthened native lifetime route')
