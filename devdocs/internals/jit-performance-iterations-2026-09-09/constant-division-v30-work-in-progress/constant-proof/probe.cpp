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
#include <limits>
#include <initializer_list>

int main(int argc,char **argv)
{
    const bool optimized=argc>1 && !strcmp(argv[1],"optimized");
    const SQInteger first=SQInteger(6892345678901234571LL),second=SQInteger(4294967297LL);
    for(const char *mode : {"move","move_source_rewrite","dload_first","dload_second","dload_alias","dload_boolean"}) {
        const bool load=!strncmp(mode,"dload",5),boolean=!strcmp(mode,"dload_boolean");
        for(bool enabled : {false,true}) {
            SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
            ctx.enabled=false;ctx.precise_exits=true;ctx.threshold=1;ctx.trace=ctx.trace_stats=false;
            sqjit_observe_enable(v);
            {
                const char *source=load ?
                    "function proof(r,x) { r.count=r.count+1; local m=6892345678901234571; local d=0; local filler=4294967297; return x/d; } record <- {count=0};" :
                    "function proof(r,x) { r.count=r.count+1; local m=7; local d=0; local filler=11; return x/d; } record <- {count=0};";
                if(SQ_FAILED(sq_compilebuffer(v,source,strlen(source),_SC("constant-proof"),SQTrue))) return 2;
                sq_pushroottable(v);if(SQ_FAILED(sq_call(v,1,SQFalse,SQFalse))) return 3;sq_settop(v,0);
                SQObjectPtr fn,record;_table(v->_roottable)->Get(SQString::Create(v->_sharedstate,_SC("proof")),fn);
                _table(v->_roottable)->Get(SQString::Create(v->_sharedstate,_SC("record")),record);
                SQFunctionProto *p=_closure(fn)->_function;
                int definition=-1,copy=-1,later=-1,division=-1,literal_first=-1,literal_second=-1;
                for(SQInteger j=0;j<p->_nliterals;++j) if(sq_type(p->_literals[j])==OT_INTEGER) {
                    if(_integer(p->_literals[j])==first) literal_first=j;
                    if(_integer(p->_literals[j])==second) literal_second=j;
                }
                for(SQInteger j=0;j<p->_ninstructions;++j) {
                    const SQInstruction &i=p->_instructions[j];
                    if((!load && i.op==_OP_LOADINT && i._arg1==7) ||
                        (load && i.op==_OP_LOAD && i._arg1==literal_first)) definition=j;
                    if(i.op==_OP_LOADINT && i._arg1==0) copy=j;
                    if((!load && i.op==_OP_LOADINT && i._arg1==11) ||
                        (load && i.op==_OP_LOAD && i._arg1==literal_second)) later=j;
                    if(i.op==_OP_DIV) division=j;
                }
                if(definition<0 || copy<=definition || later<=copy || division<=later) return 4;
                SQInstruction &def=p->_instructions[definition],&mov=p->_instructions[copy];
                unsigned m=def._arg0,d=mov._arg0;
                mov.op=_OP_MOVE;mov._arg1=load ? d : m;mov._arg2=mov._arg3=0;
                if(load) {
                    if(literal_first<0 || literal_second<0 || literal_second>255) return 5;
                    def.op=_OP_DLOAD;def._arg1=literal_first;def._arg2=d;def._arg3=literal_second;
                    if(!strcmp(mode,"dload_first")) p->_instructions[division]._arg1=m;
                    if(!strcmp(mode,"dload_alias")) def._arg0=d;
                    if(boolean) p->_literals[literal_second]=true;
                }
                else if(!strcmp(mode,"move_source_rewrite")) p->_instructions[later]._arg0=m;
                const SQInteger divisor=load ? (!strcmp(mode,"dload_first") ? first : second) : 7;
                ctx.enabled=enabled;
                SQObjectPtr key=SQString::Create(v->_sharedstate,_SC("count"));
                int calls=0;
                for(SQInteger x : {std::numeric_limits<SQInteger>::min(),SQInteger(-1001),SQInteger(-1),SQInteger(0),SQInteger(1),SQInteger(1001),std::numeric_limits<SQInteger>::max()}) {
                    SQInteger count=_integer(*_table(record)->GetRawSlot(key));
                    sq_pushobject(v,fn);sq_pushroottable(v);sq_pushobject(v,record);sq_pushinteger(v,x);
                    bool ok=SQ_SUCCEEDED(sq_call(v,3,SQTrue,SQFalse));SQInteger value=0;
                    if(ok==boolean || (!boolean && (SQ_FAILED(sq_getinteger(v,-1,&value)) || value!=x/divisor)) ||
                        _integer(*_table(record)->GetRawSlot(key))!=count+1) {
                        fprintf(stderr,"FAIL %s enabled=%d x=%lld\n",mode,enabled,(long long)x);return 6;
                    }
                    sq_settop(v,0);++calls;
                }
                if(enabled) {
                    SQJitObservation o={};
                    if(!sqjit_observe_proto(p,o) || !p->_jit || !p->_jit->_entry || !p->_jit->_entry->_requires_vm_frame ||
                        (boolean ? o.frame.side_exits!=calls : o.frame.successes!=calls)) return 7;
                    const SQJitCode &code=p->_jit->_entry->_code;bool divide=false,high=false;
                    for(SQInteger offset=0;offset<code.MappedSize();offset+=4) {
                        uint32_t word;memcpy(&word,(const unsigned char *)code.Entry()+offset,4);
                        divide=divide || (word&0xffe0fc00u)==0x9ac00c00u;
                        high=high || (word&0xffe0fc00u)==0x9b407c00u;
                    }
                    if(optimized && (boolean ? (!divide || high) : (divide || !high))) return 8;
                    printf("PROOF %s native=%d side_exits=%lld sdiv=%d smulh=%d\n",mode,calls,(long long)o.frame.side_exits,divide,high);
                }
                v->temp_reg.Null();
            }
            sq_close(v);
        }
    }
    puts("PROOF_CASES=6 ALL_PASS");return 0;
}
