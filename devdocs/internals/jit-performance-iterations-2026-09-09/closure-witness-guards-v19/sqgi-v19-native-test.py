from pathlib import Path
p=Path('test/cpp/test_sqjit_intrinsics.cpp');s=p.read_text().replace('#include "sqclosure.h"','#include "sqclosure.h"\n#include "sqtable.h"\n#include <vector>')
pos=s.index('static int floating_contracts')
s=s[:pos]+'''static int native_closure_lifetime_contracts()
{
    int rc = 0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    SQVM *v = sq_open(64);
    sq_pushroottable(v); sqstd_register_mathlib(v); sq_pop(v, 1);
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    ctx.enabled = true; ctx.threshold = 1; ctx.trace = ctx.trace_stats = false;
    sqjit_observe_enable(v);
    {
        SQObjectPtr key(SQString::Create(v->_sharedstate, _SC("sqrt"))), original;
        CHECK(_table(v->_roottable)->Get(key, original), "obtain original math closure");
        SQObjectPtr clone(_nativeclosure(original)->Clone());
        SQNativeClosure *old_address = _nativeclosure(clone);
        SQObjectPtr witness(old_address->GetWeakRef(OT_NATIVECLOSURE));
        CHECK(_table(v->_roottable)->Set(key, clone), "install independently owned math closure");
        CHECK(run(v, _SC(
            "function marker(x) { return x } "
            "function native_lifetime(n) { marker(0); local sum=0.0; "
            "for(local i=0;i<n;i++) sum+=sqrt(4.0); return marker(sum); } "
            "for(local j=0;j<3;j++) if(native_lifetime(37)!=74.0) throw \\"math lifetime warmup\\";"
        )), "warm native math lifetime fixture");
        SQJitObservation before = observe(v, _SC("native_lifetime"));
        CHECK(before.loop.successes > 0, "native closure lifetime fixture executes compiled loop");
        SQObjectPtr replacement(_nativeclosure(original)->Clone());
        _nativeclosure(replacement)->_function = fake_sqrt;
        clone.Null(); v->temp_reg.Null();
        CHECK(_table(v->_roottable)->Set(key, replacement), "release guarded native closure");
        CHECK(sq_type(_weakref(witness)->_obj) == OT_NULL,
            "generated code does not keep native closure alive");
        std::vector<SQObjectPtr> copies; copies.reserve(64);
        bool reused = false;
        for(int i=0;i<64;++i) {
            copies.push_back(SQObjectPtr(_nativeclosure(replacement)->Clone()));
            if(_nativeclosure(copies.back()) == old_address) {
                reused = true;
                CHECK(_table(v->_roottable)->Set(key, copies.back()), "publish reused native closure address");
                break;
            }
        }
#ifndef __SANITIZE_ADDRESS__
        CHECK(reused, "release build exercises native closure address reuse");
#endif
        CHECK(run(v, _SC("if(native_lifetime(37)!=4551.0) throw \\"stale native closure\\";")),
            "dead native closure witness rejects stale intrinsic even at reused address");
        SQJitObservation after = observe(v, _SC("native_lifetime"));
        CHECK(after.loop.guard_failures > before.loop.guard_failures,
            "native closure replacement actually fails compiled loop guard");
        printf("[coverage] executed AArch64 native closure lifetime contract (address reuse=%d)\\n", reused);
    }
    sq_close(v);
#endif
    return rc;
}

'''+s[pos:]
# Raw input above contains the required C++ escaped double quotes.
s=s.replace('int main()\n{','int main()\n{')
pos=s.index('int main('); idx=s.index('int rc = 0;',pos) if 'int rc = 0;' in s[pos:] else s.index('int rc=0;',pos)
end=s.index(';',idx)+1;s=s[:end]+'\n    rc += native_closure_lifetime_contracts();'+s[end:]
p.write_text(s)
