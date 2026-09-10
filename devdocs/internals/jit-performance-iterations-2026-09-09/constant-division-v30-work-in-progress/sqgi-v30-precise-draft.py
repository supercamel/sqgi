from pathlib import Path
import json, hashlib
R=Path('/home/sam/Programming/sqgi');D=Path('/tmp/sqgi-v30-constant-division-draft')
rel='Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc'
raw=(R/rel).read_bytes();s=raw.decode()
def replace(a,b):
    global s
    assert s.count(a)==1,(a[:100],s.count(a))
    s=s.replace(a,b)
replace('bool comparisons, bool owning_postincrement, SQInteger &done)',
    'bool comparisons, bool owning_postincrement, SQInteger positive_divisor, SQInteger &done)')
replace('''            !sqjit_a64_emit_ldr_x(buf,9,19,sqjit_a64_stack_value_disp(i._arg2)) ||
            !sqjit_a64_emit_ldr_x(buf,10,19,sqjit_a64_stack_value_disp(i._arg1))) return false;''','''            !sqjit_a64_emit_ldr_x(buf,9,19,sqjit_a64_stack_value_disp(i._arg2)) ||
            (!positive_divisor && !sqjit_a64_emit_ldr_x(buf,10,19,sqjit_a64_stack_value_disp(i._arg1)))) return false;''')
replace('''        case _OP_DIV: case _OP_MOD:
            if(!sqjit_a64_emit_cmp_imm(buf,10,0)''','''        case _OP_DIV: case _OP_MOD:
            if(positive_divisor>0) {
                if(!sqjit_a64_emit_divmod_constant(buf,positive_divisor,i.op==_OP_MOD)) return false;
                break;
            }
            if(!sqjit_a64_emit_cmp_imm(buf,10,0)''')
anchor='static bool sqjit_a64_compile_precise(SQFunctionProto *proto, SQObjectPtr *entry_stack, SQJitNative *native,'
replace(anchor,'''// Zero means no positive integer proof. Entry observations, boolean literals,
// branch joins and loop-carried definitions never supply a constant divisor.
static SQInteger sqjit_a64_precise_positive_divisor(SQFunctionProto *proto,
    const SQBytecodeAnalysis &analysis, SQInteger ip, SQInteger slot)
{
    while(ip>0 && !analysis.leaders[ip]) {
        const SQInstruction &i=proto->_instructions[--ip];
        if(!analysis.facts[ip].writes.test(slot)) continue;
        if(i.op==_OP_MOVE) { slot=i._arg1; continue; }
        if(i.op==_OP_LOADINT) {
            SQInteger value=sqjit_loadint_value(i);
            return value>0 ? value : 0;
        }
        SQInteger literal=-1;
        if(i.op==_OP_LOAD) literal=i._arg1;
        else if(i.op==_OP_DLOAD) literal=slot==i._arg2 ? i._arg3 : i._arg1;
        if(literal>=0 && literal<proto->_nliterals &&
            sq_type(proto->_literals[literal])==OT_INTEGER) {
            SQInteger value=_integer(proto->_literals[literal]);
            return value>0 ? value : 0;
        }
        return 0;
    }
    return 0;
}

'''+anchor)
replace('''    bool exhausted = false;
    auto emit = [&](unsigned tier, bool owning_postincrement, bool cold_lookups, bool shared_helpers) -> bool {''','''    SQInteger positive_divisors[SQ_JIT_A64_IP_TABLE_SIZE]={};
    bool has_positive_divisor=false;
    for(SQInteger ip=0;ip<proto->_ninstructions;++ip) {
        const SQInstruction &i=proto->_instructions[ip];
        if(i.op!=_OP_DIV && i.op!=_OP_MOD) continue;
        positive_divisors[ip]=sqjit_a64_precise_positive_divisor(proto,analysis,ip,i._arg1);
        has_positive_divisor=has_positive_divisor || positive_divisors[ip]>0;
    }
    bool exhausted = false;
    auto emit = [&](unsigned tier, bool owning_postincrement, bool cold_lookups, bool shared_helpers,
        bool constant_division) -> bool {''')
replace('''            tier >= 3,tier >= 4,tier >= 5,tier >= 6,owning_postincrement,fast_done)) return false;''','''            tier >= 3,tier >= 4,tier >= 5,tier >= 6,owning_postincrement,
            constant_division ? positive_divisors[ip] : 0,fast_done)) return false;''')
replace('''    // Optional code growth must not lose existing large-function coverage.''','''    auto emit_layout = [&](unsigned tier, bool postincrement, bool cold, bool shared) {
        if(has_positive_divisor && tier!=7) {
            if(emit(tier,postincrement,cold,shared,true)) return true;
            if(!exhausted) return false;
        }
        return emit(tier,postincrement,cold,shared,false);
    };
    // Optional code growth must not lose existing large-function coverage.''')
for call in ['emit((unsigned)tier,has_postincrement,true,shared!=0)',
             'emit((unsigned)tier,true,false,shared!=0)',
             'emit((unsigned)tier,false,false,shared!=0)',
             'emit(7,false,false,false)']:
    replace(call,call.replace('emit(','emit_layout('))
(D/rel).write_text(s)
m=json.loads((D/'input-manifest.json').read_text());m[rel]=hashlib.sha256(raw).hexdigest()
(D/'input-manifest.json').write_text(json.dumps(m,indent=2)+'\n')
print('Drafted precise constant proof and same-layout budget retry; not applied or compiled')
