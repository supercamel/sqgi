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
#include <cstdlib>
#include <cstring>
#include <string>
#include <fstream>

int main(int argc,char **argv)
{
    if(argc!=5) return 2;
    const std::string kind=argv[1]; const int blocks=atoi(argv[2]),pad=atoi(argv[3]);
    if((kind!="proto" && kind!="precise" && kind!="loop" && kind!="loop_store" && kind!="loop_store_flat") || blocks<1 || blocks>120 || pad<0 || pad>100) return 2;
    const bool precise=kind=="precise",store=kind=="loop_store" || kind=="loop_store_flat",loop=kind=="loop" || store;
    const std::string name="budget_"+kind+"_"+std::to_string(blocks)+"_"+std::to_string(pad);
    std::string source="function "+name+"(r,x,n) { ";
    if(precise) source+="r.count=r.count+1;";
    if(loop) source+="local marker=typeof n;";
    source+="local s=x;";
    if(loop) source+="for(local i=0;i<n;i++) {";
    if(store) source+="r.count=r.count+1;";
    source+="local padding=1515847680;";
    for(int k=0;k<pad;++k) source+="padding="+std::to_string(1515847681+k)+";";
    for(int k=0;k<blocks;++k)
        source+=precise ? "s=(s%6892345678901234571)+3;" : "s=s/7+3;";
    if(loop) source+="} return marker==\"integer\" ? s : 0;";
    else source+="return s;";
    source+="} record <- {count=0};";
    SQVM *v=sq_open(128);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=false;ctx.precise_exits=true;ctx.threshold=1;ctx.trace=ctx.trace_stats=false;
    sqjit_observe_enable(v);int rc=0;
    {
        if(SQ_FAILED(sq_compilebuffer(v,source.c_str(),source.size(),_SC("constant-budget"),SQTrue))) return 3;
        sq_pushroottable(v);if(SQ_FAILED(sq_call(v,1,SQFalse,SQFalse))) return 4;sq_settop(v,0);
        SQObjectPtr fn,record;_table(v->_roottable)->Get(SQString::Create(v->_sharedstate,name.c_str()),fn);
        _table(v->_roottable)->Get(SQString::Create(v->_sharedstate,_SC("record")),record);
        SQFunctionProto *p=_closure(fn)->_function;int mutated=0;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            SQInstruction &i=p->_instructions[ip];
            if(i.op==_OP_LOADINT && i._arg1>=1515847680 && i._arg1<=1515847780) {
                if(loop) i._arg1=mutated || kind=="loop_store_flat" ? 1 : 65536;
                else { i.op=_OP_JMP;i._arg0=i._arg1=i._arg2=i._arg3=0; }
                ++mutated;
            }
        }
        if(mutated!=pad+1) return 5;
        ctx.enabled=true;
        for(int call=1;call<=3;++call) {
        sq_pushobject(v,fn);sq_pushroottable(v);sq_pushobject(v,record);sq_pushinteger(v,1001);sq_pushinteger(v,3);
        SQInteger got=0,want=1001;
        for(int k=0;k<blocks*(loop ? 3 : 1);++k) want=precise ? want%SQInteger(6892345678901234571LL)+3 : want/7+3;
        if(SQ_FAILED(sq_call(v,4,SQTrue,SQFalse)) || SQ_FAILED(sq_getinteger(v,-1,&got)) || got!=want) {
            fprintf(stderr,"FAIL result %s got=%lld want=%lld\n",name.c_str(),(long long)got,(long long)want);return 6;
        }
        sq_settop(v,0);SQObjectPtr key=SQString::Create(v->_sharedstate,_SC("count"));
        if(_integer(*_table(record)->GetRawSlot(key))!=call*(precise ? 1 : store ? 3 : 0)) return 7;
        SQJitObservation o={};if(!sqjit_observe_proto(p,o)) return 8;
        SQJitCode *code=p->_jit ? (loop ? &p->_jit->_loop_code : p->_jit->_entry ? &p->_jit->_entry->_code : NULL) : NULL;
        int high=0,divide=0;SQInteger bytes=0;
        if(code && code->Entry()) {
            for(SQInteger offset=0;offset<code->MappedSize();offset+=4) {
                uint32_t word;memcpy(&word,(const unsigned char *)code->Entry()+offset,4);
                if(word) bytes=offset+4;
                high+=(word&0xffe0fc00u)==0x9b407c00u;
                divide+=(word&0xffe0fc00u)==0x9ac00c00u;
            }
            const std::string path=std::string(argv[4])+"/"+name+".bin";
            std::ofstream file(path,std::ios::binary);file.write((const char *)code->Entry(),bytes);
            if(!file) return 9;
        }
        printf("CASE %s instructions=%lld bytes=%lld high=%d divide=%d native=%lld result=%lld prefix=%d\n",
            name.c_str(),(long long)p->_ninstructions,(long long)bytes,high,divide,
            (long long)(loop ? o.loop.successes : o.frame.successes),(long long)got,precise ? 1 : store ? 3 : 0);
        printf("RETRY call=%d proto_attempts=%lld loop_attempts=%lld retryable=%d\n",call,(long long)o.compile_attempts,(long long)o.loop_compile_attempts,(int)(loop ? o.loop_compilation.retryable : o.compilation.retryable));
        v->temp_reg.Null();
        }
    }
    sq_close(v);return rc;
}
