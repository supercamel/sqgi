#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "jit/sqjit.h"
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include <vector>
#include <cstdio>
struct Result { int releases; SQInteger sum_seen; };
struct Witness { Result *result; SQObjectPtr *frame; };
static SQInteger released(SQUserPointer pointer,SQInteger) {
    Witness *w=(Witness *)pointer;
    ++w->result->releases;
    w->result->sum_seen=_integer(w->frame[3]);
    return 0;
}
static bool run(SQVM *v,const char *s) {
    SQInteger top=sq_gettop(v);
    bool ok=SQ_SUCCEEDED(sq_compilebuffer(v,s,scstrlen(s),_SC("receiver-release"),SQTrue));
    if(ok) { sq_pushroottable(v);ok=SQ_SUCCEEDED(sq_call(v,1,SQFalse,SQTrue)); }
    sq_settop(v,top);return ok;
}
int main() {
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;ctx.trace=ctx.trace_stats=false;sqjit_observe_enable(v);
    if(!run(v,"function mark(x){return x;} function leaf(x){return x+1;} function witness(n,fn){ mark(0); local sum=0; for(local i=0;i<n;i++)sum+=fn(i);return mark(sum);} for(local k=0;k<3;k++)if(witness(7,leaf)!=28)throw \"warmup\";")) return 2;
    int rc=0;
    {
        SQObjectPtr closure,leaf;
        _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("witness"))),closure);
        _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("leaf"))),leaf);
        SQFunctionProto *p=_closure(closure)->_function;SQJitObservation o={};sqjit_observe_proto(p,o);
        if(!p->_jit || !p->_jit->_loop_code.Entry()) return 3;
        printf("warm_native_successes=%lld\n",(long long)o.loop.successes);
        std::vector<SQObjectPtr> frame((size_t)p->_stacksize);
        frame[0]=v->_roottable;frame[1]=SQInteger(7);frame[2]=leaf;frame[3]=SQInteger(0);frame[4]=SQInteger(0);
        Result result={0,-1};Witness *w=(Witness *)sq_newuserdata(v,sizeof(Witness));w->result=&result;w->frame=frame.data();sq_setreleasehook(v,-1,released);
        frame[5]=v->GetUp(-1);sq_pop(v,1);
        SQInteger next=p->_jit->_loop_header_ip,status=-1;
        { SQJitExecutionScope scope(ctx,v);status=((SQJitNativeLoopFn)p->_jit->_loop_code.Entry())(frame.data(),&next,_closure(closure)); }
        printf("status=%lld releases=%d callback_sum=%lld frame_sum=%lld destination_type=%u next_ip=%lld\n",(long long)status,result.releases,(long long)result.sum_seen,(long long)_integer(frame[3]),(unsigned)sq_type(frame[5]),(long long)next);
        rc=!(status==SQ_JIT_NATIVE_GUARD_FAILED && result.releases==0 && sq_type(frame[5])==OT_USERDATA && _integer(frame[3])==0 && _integer(frame[4])==0);
        frame[5].Null();
    }
    sq_close(v);return rc;
}
