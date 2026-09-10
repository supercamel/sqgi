static int generated_literal_addresses()
{
    int failures=0;
#if SQJIT_HAS_EXTERNAL_NATIVE
    ++native_test_groups;
    SQVM *v=sq_open(64);SQJitContext &ctx=sqjit_context(v->_sharedstate);
    ctx.enabled=ctx.precise_exits=true;ctx.threshold=1;sqjit_observe_enable(v);
    {
    CHECK(run(v,_SC(
        "function literal_store(r,o,input) { r.count=r.count+1; o.slot=input; return o.slot; }\n"
        "function literal_read(r,o,input) { r.count=r.count+1; return o.slot; }\n"
        "function literal_integer(r,o,input) { r.count=r.count+1; o.slot=input; return o.slot; }\n"
        "function literal_boolean(r,o,input) { r.count=r.count+1; o.slot=input; return o.slot; }\n"
        "literal_record <- {count=0}; literal_table <- {slot=7};\n"
        "class LiteralOne { slot=3; } class LiteralTwo { padding=41; slot=5; }\n"
        "literal_one <- LiteralOne(); literal_two <- LiteralTwo();\n"
        "class LiteralMethod { function slot() { return 19; } } literal_method <- LiteralMethod();\n"
    )),"define cold literal lookup witnesses");
    SQObjectPtr record=named(v,_SC("literal_record")),store=named(v,_SC("literal_store")),read=named(v,_SC("literal_read"));
    SQObjectPtr key(SQString::Create(v->_sharedstate,_SC("slot")));
    SQObjectPtr count_key(SQString::Create(v->_sharedstate,_SC("count")));
    // Legal prototype fixtures exercise non-string literal entries directly;
    // the frontend normally represents these keys with LOADINT/LOADBOOL instead.
    for(const SQChar *name:{_SC("literal_integer"),_SC("literal_boolean")}) {
        SQObjectPtr fn=named(v,name);SQFunctionProto *p=_closure(fn)->_function;bool replaced=false;
        for(SQInteger n=0;n<p->_nliterals;++n) {
            if(sq_type(p->_literals[n])==OT_STRING && !scstrcmp(_stringval(p->_literals[n]),_SC("slot"))) {
                p->_literals[n]=!scstrcmp(name,_SC("literal_integer")) ? SQObjectPtr(SQInteger(0)) : SQObjectPtr(false);
                replaced=true;
            }
        }
        CHECK(replaced,"construct an immutable integer/boolean literal-key prototype");
    }
    CHECK(run(v,_SC(
        "if(literal_store(literal_record,literal_table,11)!=11 || literal_read(literal_record,literal_table,0)!=11) throw \"literal warmup\";\n"
        "local a=[0]; if(literal_integer(literal_record,a,13)!=13) throw \"literal array\";"
        "local b={};b[false]<-3;if(literal_boolean(literal_record,b,29)!=29) throw \"literal boolean direct bucket\";"
        "local t={};t[0]<-3;t[false]<-5;"
        "if(literal_integer(literal_record,t,17)!=17 || literal_boolean(literal_record,t,23)!=23 || t[0]!=17) throw \"literal key tags\";\n"
    )),"warm string, integer and boolean literal keys including array fallback");
    auto invoke=[&](const SQObjectPtr &fn,const SQObjectPtr &owner,const SQObjectPtr &input,SQObjectPtr &result)->bool {
        v->temp_reg.Null();SQInteger top=sq_gettop(v);
        sq_pushobject(v,fn);sq_pushroottable(v);sq_pushobject(v,record);sq_pushobject(v,owner);sq_pushobject(v,input);
        bool ok=SQ_SUCCEEDED(sq_call(v,4,SQTrue,SQFalse));
        if(ok) result=v->GetUp(-1);sq_settop(v,top);return ok;
    };
    // Force a collision without depending on a particular string hash. The
    // current node count is part of the runtime layout exposed to native code.
    SQObjectPtr collision(SQTable::Create(v->_sharedstate,4));SQInteger node_count;
    memcpy(&node_count,(const char *)_table(collision)+SQTable::RawNodeCountOffset(),sizeof(node_count));
    SQObjectPtr other;
    for(SQInteger n=0;n<10000;++n) {
        std::basic_string<SQChar> name=_SC("different-slot-");
        std::string digits=std::to_string(n);for(char c:digits) name+=(SQChar)c;
        SQObjectPtr candidate(SQString::Create(v->_sharedstate,name.c_str()));
        if((HashObj(candidate)&(node_count-1))==(HashObj(key)&(node_count-1))) { other=candidate;break; }
    }
    CHECK(sq_type(other)==OT_STRING,"find a distinct colliding key");
    _table(collision)->NewSlot(other,SQObjectPtr(SQInteger(29)));
    _table(collision)->NewSlot(key,SQObjectPtr(SQInteger(31)));
    void *nodes=NULL;memcpy(&nodes,(const char *)_table(collision)+SQTable::RawNodesOffset(),sizeof(nodes));
    SQObjectPtr *bucket=(SQObjectPtr *)((char *)nodes+(HashObj(key)&(node_count-1))*SQTable::RawNodeSize()+SQTable::RawNodeValueOffset());
    CHECK(_table(collision)->GetRawSlot(key)!=bucket,"target lies beyond the first hash bucket");
    // The runtime's unique-string append can produce equal noninterned keys.
    SQObjectPtr distinct(SQString::Create(v->_sharedstate,_SC("slo")));
    SQString *appended=v->_sharedstate->_stringtable->Append(_string(distinct),_SC("t"),1);
    CHECK(appended!=NULL,"construct a unique appended key");
    if(appended) distinct._unVal.pString=appended;
    CHECK(_rawval(distinct)!=_rawval(key) && !scstrcmp(_stringval(distinct),_stringval(key)),
        "equal string fixture has distinct identity");
    SQObjectPtr equal(SQTable::Create(v->_sharedstate,4));_table(equal)->NewSlot(distinct,SQObjectPtr(SQInteger(37)));
    SQObjectPtr owners[]={named(v,_SC("literal_table")),named(v,_SC("literal_one")),named(v,_SC("literal_two")),collision,equal};
    for(int round=0;round<4;++round) for(const SQObjectPtr &owner:owners) {
        SQObjectPtr result;SQInteger input=43+round;
        *_table(record)->GetRawSlot(count_key)=SQInteger(0);
        CHECK(invoke(store,owner,SQObjectPtr(input),result) && sq_type(result)==OT_INTEGER && _integer(result)==input,
            "cold writes resolve current table and class layouts, collision chains and equal strings");
        CHECK(invoke(read,owner,SQObjectPtr(SQInteger(0)),result) && sq_type(result)==OT_INTEGER && _integer(result)==input &&
            _integer(*_table(record)->GetRawSlot(count_key))==2,"cold reads reload current values and commit each prefix once");
    }
    // Rehash between activations; no borrowed node address may survive a call.
    for(SQInteger n=0;n<100;++n) _table(collision)->NewSlot(SQObjectPtr(n),SQObjectPtr(n+1));
    SQObjectPtr result;
    CHECK(invoke(store,collision,SQObjectPtr(SQInteger(59)),result) && sq_type(result)==OT_INTEGER && _integer(result)==59,
        "cold lookup reloads backing storage after structural mutation");
    CHECK(invoke(read,named(v,_SC("literal_method")),SQObjectPtr(SQInteger(0)),result) && sq_type(result)==OT_CLOSURE,
        "a class method uses the ordinary read fallback, not an instance field address");
    CHECK(run(v,_SC(
        "local a=[61],r={slot=a.weakref()};"
        "if(literal_read(literal_record,r,0)!=a) throw \"cold live weak\";"
        "r.slot=[67].weakref(); local cleared=literal_record.count;"
        "if(literal_read(literal_record,r,0)!=null) throw \"cold dead weak\";\n"
    )),"cold weak slot reads retain VM dereference semantics");
    for(const SQChar *name:{_SC("literal_store"),_SC("literal_read"),_SC("literal_integer"),_SC("literal_boolean")}) {
        SQObjectPtr fn=named(v,name);SQFunctionProto *p=_closure(fn)->_function;SQJitObservation observation={};
        CHECK(p->_jit && p->_jit->_entry && p->_jit->_entry->_requires_vm_frame &&
            sqjit_observe_proto(p,observation) && observation.frame.successes>0,
            "literal lookup witnesses execute actual canonical native code");
    }
    // A failed cold lookup must leave the target untouched and resume after the
    // already committed prefix. Test both missing storage and an integer whose
    // bits equal a live table pointer, without asking the VM to dereference it.
    for(const SQObjectPtr &fn:{store,read}) {
        SQFunctionProto *p=_closure(fn)->_function;SQInteger target=-1;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            const SQInstruction &i=p->_instructions[ip];
            if((i.op==_OP_SET && i._arg1==2) || (i.op==_OP_GETK && i._arg2==2)) { target=ip;break; }
        }
        CHECK(target>=0,"find the lookup's exact continuation IP");
        if(target<0 || !p->_jit || !p->_jit->_entry || !p->_jit->_entry->_requires_vm_frame) continue;
        for(int mode=0;mode<2;++mode) {
            std::vector<SQObjectPtr> stack((size_t)p->_stacksize);
            stack[0]=v->_roottable;stack[1]=record;stack[2]=mode==0 ? SQObjectPtr(SQTable::Create(v->_sharedstate,4)) : SQObjectPtr((SQInteger)_rawval(collision));
            stack[3]=SQInteger(71);SQObjectPtr out;
            *_table(record)->GetRawSlot(count_key)=SQInteger(0);v->temp_reg.Null();
            SQInteger status;
            { SQJitExecutionScope scope(ctx,v);
              status=((SQJitNativeObjectFn)p->_jit->_entry->_code.Entry())(stack.data(),&out,_closure(fn)); }
            CHECK(status==SQ_JIT_NATIVE_SIDE_EXIT && sq_type(out)==OT_INTEGER && _integer(out)==target &&
                _integer(*_table(record)->GetRawSlot(count_key))==1 && _integer(stack[3])==71,
                "cold miss guards preserve operands and the exact committed continuation");
            if(mode==0) CHECK(_table(stack[2])->CountUsed()==0,"missing SET never creates a slot during native failure");
        }
    }
    }
    sq_close(v);
    fprintf(stdout,"[coverage] executed AArch64 cold literal lookup contracts\n");
#endif
    return failures;
}
