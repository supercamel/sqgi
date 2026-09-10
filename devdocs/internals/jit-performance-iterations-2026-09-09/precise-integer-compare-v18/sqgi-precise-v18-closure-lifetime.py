from pathlib import Path
import shutil
r=Path('/home/sam/Programming/sqgi');b=Path('/tmp/sqgi-precise-before-v18')
for name,first,methods,install in [
 ('sqjit_backend_aarch64_compile_loop.inc','    auto emit_closure_slot_guard =', ['emit_closure_slot_guard','emit_member_closure_guard','emit_member_native_closure_guard'],'    if(root_object) code->RetainWeakReference(closure->_root);'),
 ('sqjit_backend_aarch64_compile_proto.inc','    auto emit_member_closure_guard =',['emit_member_closure_guard','emit_member_native_closure_guard_key','emit_direct_native_closure_call'],'    if(root_object) native->_code.RetainWeakReference(closure->_root);')]:
 rel=Path('Squirrel3/squirrel/jit')/name;p=r/rel;shutil.copy2(p,b/rel);s=p.read_text();assert s.count(first)==1
 helper='''    // A removed closure can be reallocated at the same address. Retain its
    // weak identity, not the closure: death permanently clears this witness.
    // Temporary owners cover failed compilation; the installed code takes its
    // own weak references only after executable installation succeeds.
    std::vector<SQObjectPtr> closure_witnesses;
    auto emit_closure_lifetime_guard = [&](SQRefCounted *expected,SQObjectType type) -> bool {
        if(!expected) return false;
        SQWeakRef *weak=expected->GetWeakRef(type);
        if(!weak) return false;
        closure_witnesses.push_back(SQObjectPtr(weak));
        const SQInteger tag=(SQInteger)(size_t)&(((SQWeakRef *)0)->_obj._type);
        return sqjit_a64_emit_mov_imm_x(&buf,9,(SQInteger)(intptr_t)weak) &&
            sqjit_a64_emit_ldr_w(&buf,9,9,tag) &&
            sqjit_a64_emit_mov_imm_w(&buf,10,(uint32_t)type) &&
            sqjit_a64_emit_cmp_reg(&buf,9,10) &&
            emit_guard_fail_branch(SQ_JIT_A64_NE);
    };

'''
 s=s.replace(first,helper+first)
 for method in methods:
  start=s.index('    auto '+method+' =');end=s.index('\n    };',start)
  block=s[start:end]
  if method=='emit_direct_native_closure_call':
   needle='        for(SQInteger n = 0; n < nargs; n++) {'
   insert='        if(!emit_closure_lifetime_guard(callee,OT_CLOSURE)) return false;\n'
  else:
   needle='        if(slots[base_slot].kind == SQ_JIT_SLOT_OBJECT_PTR) {' if method!='emit_closure_slot_guard' else '        return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&'
   typ='OT_NATIVECLOSURE' if 'native_closure_guard' in method else 'OT_CLOSURE'
   insert=f'        if(!emit_closure_lifetime_guard(expected,{typ})) return false;\n'
  assert needle in block,method;block=block.replace(needle,insert+needle,1);s=s[:start]+block+s[end:]
 assert install in s
 dest='code' if 'loop' in name else '(&native->_code)'
 s=s.replace(install,install+f'\n    for(const SQObjectPtr &witness : closure_witnesses) {dest}->RetainWeakReference(_weakref(witness));')
 p.write_text(s)
