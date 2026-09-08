#include "sqpcheader.h"
#include "sqvm.h"
#ifdef SQ_ENABLE_JIT
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#endif
#include <stdio.h>

int main()
{
    int failures = 0;
    for(int enabled = 0; enabled < 2; ++enabled) {
        SQVM *v = sq_open(64);
#ifdef SQ_ENABLE_JIT
        sqjit_context(v->_sharedstate).enabled = enabled != 0;
        sqjit_context(v->_sharedstate).threshold = 1;
        sqjit_observe_enable(v);
#endif
        const SQChar *source = _SC(R"SQ(
            function check(c, message) { if(!c) throw message }
            function remainder(a,b) { return a%b }
            function compound(a,b) { a%=b; return a }
            foreach(f in [remainder,compound]) {
                check(f(17,5)==2 && f(-17,5)==-2 && f(17,-5)==2, "signed remainder");
                local caught=false;
                try { f(19,0) } catch(e) { caught=true }
                check(caught, "integer remainder must propagate division-by-zero errors");
                caught=false; try { f(19,"bad") } catch(e) { caught=true }
                check(caught, "remainder must propagate invalid operand errors");
                local minimum=-9223372036854775807-1;
                check(f(minimum,-1)==0 && f(minimum,3)==-2, "full-width minimum remainder");
                check(f(9223372036854775807,17)==8, "full-width maximum remainder");
                check(f(17.5,5)==2.5 && f(-17,5.5)==-0.5, "mixed floating remainder");
            }
            function loop_remainder(a,b,n) { local s=0; for(local i=0;i<n;i++) s+=a%b; return s }
            check(loop_remainder(17,5,20)==40 && loop_remainder(-17,5,20)==-40,
                "dynamic divisor in a native loop");
            class Modular {
                function _modulo(other) { return other+100 }
            }
            check(remainder(Modular(),7)==107, "overloaded remainder fallback");
            function read(a,k) { return a[k] }
            function write(a,k,v) { return a[k]=v }
            local a=[11,22,33];
            for(local j=0;j<8;j++) {
                check(read(a,1)==22 && read(a,1.9)==22, "integer and float array indices");
                check(write(a,0,41)==41 && a[0]==41, "array write result");
            }
            foreach(k in [-1,3,9223372036854775807]) {
                local caught=false; try { read(a,k) } catch(e) { caught=true }
                check(caught, "read bounds fallback");
                caught=false; try { write(a,k,99) } catch(e) { caught=true }
                check(caught && a[2]==33, "write bounds fallback");
            }
            local owner=[7]; a[0]=owner.weakref();
            check(read(a,0)==owner, "array reads dereference weakrefs");
            function dead_reference() { local value=[7]; return value.weakref() }
            a[0]=dead_reference(); check(read(a,0)==null, "dead array weakref");
            a[0]=a; check(read(a,0)==a, "array receiver aliases its value"); a[0]=null;
            local delegate={field=7}, t={}; t.setdelegate(delegate);
            check(write(t,"field",13)==13 && delegate.field==13, "delegated setter");
            local calls=0;
            local proxy={}; proxy.setdelegate({
                _get=function(k) { calls++; return k.len() },
                _set=function(k,v) { calls+=v }
            });
            check(read(proxy,"abc")==3, "get metamethod");
            check(write(proxy,"abc",4)==4 && calls==5, "set metamethod");
            class Record {
                count=0; writes=0;
                function _set(k,v) { this.writes+=v }
            }
            local record=Record();
            check(write(record,"count",9)==9 && record.count==9 && record.writes==0,
                "existing instance fields bypass _set");
            write(record,"missing",3); check(record.writes==3, "missing instance fields use _set");
        )SQ");
        bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("vm-hotpaths"), SQTrue));
        if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)); }
        if(!ok) {
            sq_getlasterror(v); const SQChar *error = NULL;
            if(SQ_SUCCEEDED(sq_getstring(v, -1, &error))) scprintf(_SC("FAIL: %s\n"), error);
            ++failures;
        }
#if defined(SQ_ENABLE_JIT) && SQJIT_HAS_X64_NATIVE
        if(enabled && ok) {
            SQObjectPtr callee;
            if(_table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate, _SC("remainder"))), callee)) {
                SQJitObservation observation = {};
                sqjit_observe_proto(_closure(callee)->_function, observation);
                if(!observation.frame.successes || !observation.direct.successes) {
                    puts("FAIL: dynamic remainder must exercise frame and direct native entries");
                    ++failures;
                }
            }
            else ++failures;
        }
#endif
        sq_close(v);
    }
    return failures ? 1 : 0;
}
