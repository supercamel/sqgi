from pathlib import Path
import json, hashlib
R=Path('/home/sam/Programming/sqgi')
D=Path('/tmp/sqgi-v30-constant-division-draft')
manifest=json.loads((D/'input-manifest.json').read_text())

def replace(s,a,b):
    assert s.count(a)==1,(a[:100],s.count(a))
    return s.replace(a,b)

for kind in ['proto','loop']:
    rel=f'Squirrel3/squirrel/jit/sqjit_backend_aarch64_compile_{kind}.inc'
    raw=(R/rel).read_bytes(); manifest[rel]=hashlib.sha256(raw).hexdigest()
    s=raw.decode()
    if kind=='proto':
        s=replace(s,'static bool sqjit_a64_compile_integer_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,\n    SQClosure *closure, SQJitNative *native, SQJitCompileAttempt &attempt)',
            'static bool sqjit_a64_compile_integer_proto_impl(SQFunctionProto *proto, SQObjectPtr *entry_stack,\n    SQClosure *closure, SQJitNative *native, SQJitCompileAttempt &attempt,\n    bool constant_division, bool &constant_budget_failure)')
    else:
        s=replace(s,'static bool compile_loop(SQFunctionProto *proto, SQObjectPtr *entry_stack,',
            'static bool compile_loop_impl(SQFunctionProto *proto, SQObjectPtr *entry_stack,')
        s=replace(s,'    bool allow_scalar_entry = true)',
            '    bool allow_scalar_entry, bool constant_division, bool &constant_budget_failure)')
        # Discard the outer buffer before recursive emission: its size cannot
        # classify an inner install failure as a retryable budget failure.
        s=replace(s,'''    if(copied_unused_receiver && !scalar_guard_region)
        return compile_loop(proto, entry_stack, closure, start_ip, header_ip,
            end_ip, exit_ip, code, attempt, false);''','''    if(copied_unused_receiver && !scalar_guard_region) {
        emission_finished=true;
        return compile_loop_impl(proto, entry_stack, closure, start_ip, header_ip,
            end_ip, exit_ip, code, attempt, false, constant_division, constant_budget_failure);
    }''')
        s=replace(s,'''            return compile_loop(proto, entry_stack, closure, start_ip, header_ip,
                end_ip, exit_ip, code, attempt, false);''','''            emission_finished=true;
            return compile_loop_impl(proto, entry_stack, closure, start_ip, header_ip,
                end_ip, exit_ip, code, attempt, false, constant_division, constant_budget_failure);''')
    s=replace(s,'''    SQJitA64Buffer buf;
    buf.size = 0;''','''    SQJitA64Buffer buf;
    buf.size = 0;
    bool lowered_divisor=false, emission_finished=false;
    struct ConstantBudget {
        SQJitA64Buffer &buf; bool &lowered, &finished, &failed;
        ~ConstantBudget() {
            if(lowered && !finished && buf.size==(SQInteger)sizeof(buf.bytes)) failed=true;
        }
    } constant_budget={buf,lowered_divisor,emission_finished,constant_budget_failure};''')
    begin=s.index('        // Preserve hardware division, but omit a guard only when lowering has')
    end=s.index('\n        }',s.index('            default:\n                return false;',begin))+len('\n        }')
    old=s[begin:end]
    s=s[:begin]+'''        if(constant_division && (op==_OP_DIV || op==_OP_MOD) &&
            slots[right].known_const && slots[right].const_value>0) {
            lowered_divisor=true;
            if(!sqjit_a64_emit_divmod_constant(&buf,slots[right].const_value,op==_OP_MOD)) return false;
        }
        else {
'''+''.join('    '+line+'\n' for line in old.splitlines()).rstrip()+'''
        }'''+s[end:]
    install='    if(!native->_code.Install(buf.bytes, buf.size)) {' if kind=='proto' else '    if(!code->Install(buf.bytes, buf.size))'
    s=replace(s,install,'    emission_finished=true; // Installation failures never retry emission.\n'+install)
    if kind=='proto':
        anchor='SQJitCompileResult sqjit_backend_compile_proto('
        wrapper='''static bool sqjit_a64_compile_integer_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native, SQJitCompileAttempt &attempt)
{
    bool exhausted=false;
    if(sqjit_a64_compile_integer_proto_impl(proto,entry_stack,closure,native,attempt,true,exhausted)) return true;
    if(!exhausted) return false;
    return sqjit_a64_compile_integer_proto_impl(proto,entry_stack,closure,native,attempt,false,exhausted);
}

'''
    else:
        anchor='SQJitCompileResult sqjit_backend_compile_loop('
        wrapper='''static bool compile_loop(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQInteger start_ip, SQInteger header_ip,
    SQInteger end_ip, SQInteger exit_ip, SQJitCode *code, SQJitCompileAttempt &attempt)
{
    bool exhausted=false;
    if(compile_loop_impl(proto,entry_stack,closure,start_ip,header_ip,end_ip,exit_ip,
        code,attempt,true,true,exhausted)) return true;
    if(!exhausted) return false;
    return compile_loop_impl(proto,entry_stack,closure,start_ip,header_ip,end_ip,exit_ip,
        code,attempt,true,false,exhausted);
}

'''
    s=replace(s,anchor,wrapper+anchor)
    (D/rel).write_text(s)
(D/'input-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('Drafted private prototype/loop integration; production unchanged, not compiled')
