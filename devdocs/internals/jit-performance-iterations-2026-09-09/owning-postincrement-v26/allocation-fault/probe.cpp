#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "jit/sqjit.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include <cstdio>
#include <cstring>
int main(int argc,char **argv) {
    const bool fault=argc>1 && !strstr(argv[1],"reference");
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=false;ctx.precise_exits=true;ctx.threshold=1;ctx.trace=ctx.trace_stats=false;
    sqjit_observe_enable(v);int rc=0;
    {
    const bool strict=argc>1 && strstr(argv[1],"strict");
    const bool post=argc>1 && strstr(argv[1],"post");
    const SQChar *source=post ? _SC("function work(r) { r.count=r.count+1; local n=1; local before=n++; return before+r.count; } record <- {count=0,label=\"q\"};") : strict ? _SC("function work(r) { r.count=r.count+1; return 1+r.count; } record <- {count=0,label=\"q\"};") : _SC("function work(r) { r.count=r.count+1; return r.label.len()+r.count; } record <- {count=0,label=\"q\"};");
    if(SQ_FAILED(sq_compilebuffer(v,source,scstrlen(source),_SC("allocation-probe"),SQTrue))) return 2;
    sq_pushroottable(v);if(SQ_FAILED(sq_call(v,1,SQFalse,SQFalse))) return 3;sq_settop(v,0);
    SQObjectPtr fn,record;_table(v->_roottable)->Get(SQString::Create(v->_sharedstate,_SC("work")),fn);
    _table(v->_roottable)->Get(SQString::Create(v->_sharedstate,_SC("record")),record);
    SQObjectPtr key(SQString::Create(v->_sharedstate,_SC("count")));SQFunctionProto *p=_closure(fn)->_function;
    ctx.enabled=true;
    for(int attempt=0;attempt<2;++attempt) {
        *_table(record)->GetRawSlot(key)=SQInteger(0);v->temp_reg.Null();
        sq_pushobject(v,fn);sq_pushroottable(v);sq_pushobject(v,record);SQInteger value=-1;
        if(SQ_FAILED(sq_call(v,2,SQTrue,SQFalse)) || SQ_FAILED(sq_getinteger(v,-1,&value)) || value!=2 ||
            _integer(*_table(record)->GetRawSlot(key))!=1) { rc=4;break; }
        sq_settop(v,0);SQJitObservation o={};if(!sqjit_observe_proto(p,o)) {rc=5;break;}
        printf("ATTEMPT %d compiled=%d retryable=%d category=%d count=%lld native=%lld reason=%s\n",attempt,
            o.compilation.compiled,o.compilation.retryable,o.compilation.category,(long long)o.compile_attempts,
            (long long)o.frame.successes,o.compilation.reason ? o.compilation.reason : "none");
        if(fault && !attempt) {
            if(o.compilation.compiled || !o.compilation.retryable || o.compilation.category!=SQ_JIT_REJECT_RESOURCE ||
                !p->_jit || p->_jit->_entry || o.compile_attempts!=1) {rc=6;break;}
        } else if(!o.compilation.compiled || !p->_jit || !p->_jit->_entry ||
            !p->_jit->_entry->_requires_vm_frame || !o.frame.successes || o.compile_attempts!=(fault ? 2 : 1)) {rc=7;break;}
    }
    v->temp_reg.Null();
    }
    sq_close(v);printf("FAULT_PROBE_EXIT=%d\n",rc);return rc;
}
