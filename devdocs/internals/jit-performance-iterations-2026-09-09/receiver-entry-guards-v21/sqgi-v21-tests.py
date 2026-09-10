from pathlib import Path
p=Path('test/cpp/test_sqjit_contracts.cpp');s=p.read_text().replace('#include "jit/sqjit_observe.h"','#include "jit/sqjit_observe.h"\n#include "jit/sqjit_write_log.h"')
s=s.replace('static bool entry_guard_tests_ran = false;','static bool entry_guard_tests_ran = false;\nstatic bool receiver_publication_tests_ran = false;',1)
needle='static void entry_guard_tests(int &rc)'
pos=s.index(needle)
s=s[:pos]+'''#if SQJIT_HAS_EXTERNAL_NATIVE
struct ReceiverPublicationResult { int releases; SQInteger sum_seen; };
struct ReceiverPublicationWitness { ReceiverPublicationResult *result; SQObjectPtr *frame; };
static SQInteger receiver_publication_release(SQUserPointer pointer, SQInteger)
{
    ReceiverPublicationWitness *w = (ReceiverPublicationWitness *)pointer;
    ++w->result->releases;
    w->result->sum_seen = _integer(w->frame[3]);
    return 0;
}
static void receiver_publication_tests(SQVM *v, SQFunctionProto *p, int &rc)
{
    receiver_publication_tests_ran = true;
    SQObjectPtr closure, leaf;
    _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("guard_parameter"))),closure);
    _table(v->_roottable)->Get(SQObjectPtr(SQString::Create(v->_sharedstate,_SC("guard_replacement"))),leaf);
    bool shape = p && p->_jit && p->_jit->_loop_code.Entry() && p->_stacksize>6 &&
        p->_instructions[6].op==_OP_DMOVE && p->_instructions[6]._arg0==5 &&
        p->_instructions[6]._arg1==0 && p->_instructions[6]._arg2==6 && p->_instructions[6]._arg3==4 &&
        p->_instructions[7].op==_OP_CALL && p->_instructions[7]._arg0==5 && p->_instructions[7]._arg1==2 &&
        p->_instructions[7]._arg2==5;
    CHECK(shape,"publication witness targets the actual receiver/result and argument registers");
    if(!shape) return;
    SQJitContext &ctx=sqjit_context(v->_sharedstate);
    SQJitWriteLog *previous=ctx.active_logs;
    for(int mode=0;mode<4;++mode) {
        std::vector<SQObjectPtr> frame((size_t)p->_stacksize);
        frame[0]=v->_roottable;frame[1]=SQInteger(7);frame[2]=leaf;
        frame[3]=SQInteger(0);frame[4]=SQInteger(0);frame[5]=SQInteger(99);
        ReceiverPublicationResult result={0,-1};SQObjectPtr owner,weak;
        if(mode) {
            ReceiverPublicationWitness *w=(ReceiverPublicationWitness *)sq_newuserdata(v,sizeof(ReceiverPublicationWitness));
            w->result=&result;w->frame=frame.data();sq_setreleasehook(v,-1,receiver_publication_release);
            frame[5]=v->GetUp(-1);sq_pop(v,1);
            weak=SQObjectPtr(_refcounted(frame[5])->GetWeakRef(OT_USERDATA));
            if(mode==2) owner=frame[5];
        }
        {
            SQJitWriteLog parent(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
            SQJitWriteLog ancestor(1000,sq_vm_malloc,mode==3 ? &ctx : NULL);
            if(mode==3) CHECK(parent.RetainValue(frame[5]) && ancestor.RetainValue(frame[5]),
                "two ancestor pins do not authorize deferred receiver releases");
            SQInteger next=p->_jit->_loop_header_ip,status;
            { SQJitExecutionScope scope(ctx,v);
              status=((SQJitNativeLoopFn)p->_jit->_loop_code.Entry())(frame.data(),&next,_closure(closure)); }
            if(!mode) {
                CHECK(status==SQ_JIT_NATIVE_RETURNED && _integer(frame[3])==35 && _integer(frame[4])==7 &&
                    next==p->_jit->_loop_exit_ip,"non-owning receiver temporary retains actual native execution");
            }
            else {
                CHECK(status==SQ_JIT_NATIVE_GUARD_FAILED && next==p->_jit->_loop_header_ip,
                    "owning receiver destination rejects at native entry");
                CHECK(result.releases==0 && sq_type(frame[5])==OT_USERDATA &&
                    _integer(frame[3])==0 && _integer(frame[4])==0,
                    "receiver guard leaves all publications and release hooks untouched");
                CHECK(sq_type(_weakref(weak)->_obj)==OT_USERDATA,
                    "rejected receiver stays alive until its caller executes the original move");
            }
            if(mode==3) CHECK(ctx.active_logs==&ancestor,"receiver guard restores ancestor journal context");
            frame[5].Null();owner.Null();
        }
        if(mode) CHECK(result.releases==1 && result.sum_seen==0 && sq_type(_weakref(weak)->_obj)==OT_NULL,
            "caller cleanup releases once before any loop result publication");
        CHECK(ctx.active_logs==previous,"receiver witness restores prior journal state");
    }
}
#endif

'''+s[pos:]
needle='        "fixed closure parameter executes with an entry check");';assert needle in s;s=s.replace(needle,needle+'\n    receiver_publication_tests(v,parameter,rc);',1)
needle='    CHECK(entry_guard_tests_ran,'
s=s.replace(needle,'    CHECK(receiver_publication_tests_ran,"AArch64 receiver publication contracts actually execute");\n    fprintf(stdout,"[coverage] executed AArch64 receiver publication contracts (scalar, final, nonfinal, ancestors)\\n");\n'+needle,1)
p.write_text(s)
print('Added permanent scalar/final/nonfinal/ancestor receiver publication contracts')
