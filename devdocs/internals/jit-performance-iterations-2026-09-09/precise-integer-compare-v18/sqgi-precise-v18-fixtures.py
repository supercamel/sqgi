from pathlib import Path
r=Path('/home/sam/Programming/sqgi');p=r/'test/cpp/test_sqjit_side_exit.cpp';s=p.read_text()
s=s.replace('''            if(i.op==_OP_GET && i._arg1==3 && ip+1<p->_ninstructions) {
                SQInstruction &next''','''            if(i.op==_OP_GET && i._arg1==3 && i._arg0==1) fused=true;
            if(i.op==_OP_GET && i._arg1==3 && ip+1<p->_ninstructions) {
                SQInstruction &next''')
for text in ['''            CHECK(sq_type(v->temp_reg)==OT_BOOL && (_integer(v->temp_reg)!=0)==truth(pair[0],pair[1]),
                "integer JCMP publishes its actual boolean VM temporary");
''','''                CHECK(sq_type(v->temp_reg)==OT_BOOL && (_integer(v->temp_reg)!=0)==truth(a,0),
                    "owning temporary is replaced by the exact comparison boolean");
''']:
 assert text in s;s=s.replace(text,'')
s=s.replace('''        for(const auto &pair : pairs) {''','''        // The VM return path reuses temp_reg. Its boolean is observed at the
        // RETURN helper entry by the native debugger probe, before that reuse.
        for(const auto &pair : pairs) {''')
anchor='static int generated_integer_comparisons()'
helper='''// These fixtures intentionally construct a valid DLOAD. The frontend emits
// separate LOADs for parameter assignments, so do not depend on peephole fusion.
static bool fixture_double_load(SQFunctionProto *p,SQInteger first,SQInteger second)
{
    for(SQInteger ip=0;ip+1<p->_ninstructions;++ip) {
        SQInstruction &a=p->_instructions[ip],&b=p->_instructions[ip+1];
        if(a.op==_OP_LOAD && a._arg0==first && b.op==_OP_LOAD && b._arg0==second) {
            a.op=_OP_DLOAD;a._arg2=b._arg0;a._arg3=(unsigned char)b._arg1;
            b.op=_OP_LINE;return true;
        }
    }
    return false;
}

'''
assert anchor in s;s=s.replace(anchor,helper+anchor)
s=s.replace('''    bool dload=false;
    for(SQInteger ip''','''    CHECK(fixture_double_load(p,2,3),"construct the receiver-replacing DLOAD before compilation");
    bool dload=false;
    for(SQInteger ip''')
s=s.replace('''        CHECK(!p->_jit || !p->_jit->_entry, "construct the DLOAD fixture before native compilation");''','''        CHECK(!p->_jit || !p->_jit->_entry, "construct the DLOAD fixture before native compilation");
        CHECK(fixture_double_load(p,1,2),"construct the repeated-destination DLOAD before compilation");''')
s=s.replace('''const SQOpcode opcode[]={_OP_MOVE,_OP_LOAD,_OP_LOADINT,_OP_LOADFLOAT,_OP_LOADBOOL};''','''const SQOpcode opcode[]={_OP_MOVE,_OP_LOAD,_OP_LOADINT,
            sizeof(SQFloat)==sizeof(SQInt32) ? _OP_LOADFLOAT : _OP_LOAD,_OP_LOADBOOL};''')
p.write_text(s)
p=r/'test/cpp/test_sqjit_contracts.cpp';s=p.read_text();assert 'VariantLocal.update=function' in s;s=s.replace('VariantLocal.update=function','VariantLocal.update<-function');p.write_text(s)
