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
#include <string>
int main(int argc,char **argv) {
    const bool fault=argc>1 && !strstr(argv[1],"reference");
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=false;ctx.precise_exits=true;ctx.threshold=1;ctx.trace=ctx.trace_stats=false;
    sqjit_observe_enable(v);int rc=0;
    {
    const bool compact=argc>1 && strstr(argv[1],"compact");
    const bool shared=compact || (argc>1 && strstr(argv[1],"shared"));
    const bool strict=argc>1 && strstr(argv[1],"strict");
    const bool cold=argc>1 && strstr(argv[1],"cold");
    const bool post=argc>1 && strstr(argv[1],"post");
    const SQChar *source=cold ? _SC("function work(r) { r.label=\"q\"; r.count=r.count+1; return 1+r.count; } record <- {count=0,label=\"q\"};") : post ? _SC("function work(r) { r.count=r.count+1; local n=1; local before=n++; return before+r.count; } record <- {count=0,label=\"q\"};") : strict ? _SC("function work(r) { r.count=r.count+1; return 1+r.count; } record <- {count=0,label=\"q\"};") : _SC("function work(r) { r.count=r.count+1; return r.label.len()+r.count; } record <- {count=0,label=\"q\"};");
    std::basic_string<SQChar> shared_source;
    if(shared) {
        shared_source=_SC("function work(r,x) { r.count=r.count+1; local s=0; local flag=!x; if(flag) s=s+1;");
        for(int n=0;n<(compact ? 56 : 24);++n) shared_source+=_SC("s=s+x;");
        shared_source+=_SC("return s+r.tail; } record <- {count=0,label=\"q\",tail=7};");
        source=shared_source.c_str();
    }
    if(SQ_FAILED(sq_compilebuffer(v,source,scstrlen(source),_SC("allocation-probe"),SQTrue))) return 2;
    sq_pushroottable(v);if(SQ_FAILED(sq_call(v,1,SQFalse,SQFalse))) return 3;sq_settop(v,0);
    SQObjectPtr fn,record;_table(v->_roottable)->Get(SQString::Create(v->_sharedstate,_SC("work")),fn);
    _table(v->_roottable)->Get(SQString::Create(v->_sharedstate,_SC("record")),record);
    SQObjectPtr key(SQString::Create(v->_sharedstate,_SC("count")));SQFunctionProto *p=_closure(fn)->_function;
    ctx.enabled=true;
    for(int attempt=0;attempt<2;++attempt) {
        *_table(record)->GetRawSlot(key)=SQInteger(0);v->temp_reg.Null();
        sq_pushobject(v,fn);sq_pushroottable(v);sq_pushobject(v,record);if(shared) sq_pushinteger(v,2);SQInteger value=-1;
        if(SQ_FAILED(sq_call(v,shared ? 3 : 2,SQTrue,SQFalse)) || SQ_FAILED(sq_getinteger(v,-1,&value)) || value!=(shared ? (compact ? 119 : 55) : 2) ||
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
        if(shared && o.compilation.compiled) {
            const SQJitCode &code=p->_jit->_entry->_code;bool calls=false,arithmetic=false,tail_valid=true;
            for(SQInteger off=0;off+4<=code.MappedSize();off+=4) {
                uint32_t word;memcpy(&word,(const unsigned char *)code.Entry()+off,4);
                calls=calls || (word&0xfc000000u)==0x94000000u;
                arithmetic=arithmetic || word==0x8b0a0129u;
                if((word&0xfc000000u)==0x94000000u) {
                    int32_t delta=(int32_t)(word&0x03ffffffu);
                    if(delta&0x02000000) delta-=0x04000000;
                    SQInteger target=off+(SQInteger)delta*4;
                    bool valid=target>=0 && target+24<=code.MappedSize();
                    uint32_t tail[6]={};
                    if(valid) memcpy(tail,(const unsigned char *)code.Entry()+target,sizeof(tail));
                    tail_valid=tail_valid && valid && (tail[0]&0xffc003ffu)==0xf94003e0u &&
                        tail[1]==0xaa1303e1u && tail[2]==0xaa1503e2u &&
                        tail[3]==0xaa1403e4u && tail[4]==0xaa1603e5u && tail[5]==0xd61f0200u;
                }
            }
            if(!calls || !tail_valid || (compact ? arithmetic : !arithmetic)) {rc=8;break;}
            printf(compact ? "SHARED_COMPACT_NATIVE=1\n" : "SHARED_RICH_NATIVE=1\n");
            printf("HELPER_TAIL_BRANCH=1\n");
        }
    }
    v->temp_reg.Null();
    }
    sq_close(v);printf("FAULT_PROBE_EXIT=%d\n",rc);return rc;
}
