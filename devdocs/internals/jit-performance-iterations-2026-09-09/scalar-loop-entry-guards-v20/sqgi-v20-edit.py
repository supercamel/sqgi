from pathlib import Path
p=Path('Squirrel3/squirrel/jit/sqjit_backend_aarch64_compile_loop.inc');s=p.read_text()
needle='    SQJitKeyFlow compound_keys;'
insert='''    // Only scalar loops can reuse an entry-time callee identity. Native state
    // stays private until writeback; unknown operations and heap reads/stores
    // are excluded. Every inlined callee must also pass the scalar leaf proof.
    // Audited math/conversion/length lowerings below cannot reenter the VM.
    bool scalar_guard_region = true;
    auto scalar_literal = [&](SQInteger index) -> bool {
        if(index < 0 || index >= proto->_nliterals) return false;
        SQObjectType type = sq_type(proto->_literals[index]);
        return type == OT_INTEGER || type == OT_FLOAT || type == OT_BOOL || type == OT_NULL;
    };
    for(SQInteger ip = start_ip; ip <= end_ip; ++ip) {
        const SQInstruction &i = proto->_instructions[ip];
        switch(i.op) {
        case _OP_LINE: case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
        case _OP_LOADNULLS: case _OP_MOVE: case _OP_DMOVE:
        case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD:
        case _OP_NEG: case _OP_NOT: case _OP_INCL: case _OP_PINCL:
        case _OP_EQ: case _OP_NE: case _OP_CMP: case _OP_JCMP:
        case _OP_JZ: case _OP_JMP: case _OP_PREPCALLK: case _OP_CALL:
            break;
        case _OP_LOAD: scalar_guard_region &= scalar_literal(i._arg1); break;
        case _OP_DLOAD:
            scalar_guard_region &= scalar_literal(i._arg1) && scalar_literal(i._arg3); break;
        default: scalar_guard_region = false; break;
        }
    }
    struct EntryClosureGuard {
        SQInteger begin, end, failure, reg, literal;
        SQWeakRef *witness;
        SQObjectType type;
    };
    std::vector<EntryClosureGuard> entry_closure_guards;
'''
s=s.replace(needle,insert+needle,1)
needle='    auto emit_closure_slot_guard = '
pos=s.index(needle)
s=s[:pos]+'''    auto remember_entry_guard = [&](SQInteger begin, SQInteger first_reloc,
        SQInteger reg, SQInteger literal, SQWeakRef *witness, SQObjectType type) -> bool {
        if(!scalar_guard_region || reg < 0 || reg >= proto->_nparameters) return true;
        for(SQInteger ip = start_ip; ip <= end_ip; ++ip)
            if(analysis.facts[ip].writes.test(reg)) return true;
        // These blocks contain absolute helper addresses and exactly one
        // conditional failure branch; copying them requires only that relocation.
        if(nguard_relocs != first_reloc + 1) return false;
        entry_closure_guards.push_back({begin, buf.size,
            guard_relocs[first_reloc].patch_offset, reg, literal, witness, type});
        return true;
    };

'''+s[pos:]
for name,typ,reg,lit in [('emit_closure_slot_guard','OT_CLOSURE','slots[closure_slot].stack_object_reg','-1'),('emit_member_closure_guard','OT_CLOSURE','slots[base_slot].stack_object_reg','literal_index'),('emit_member_native_closure_guard','OT_NATIVECLOSURE','slots[base_slot].stack_object_reg','literal_index')]:
 start=s.index('    auto '+name+' =');end=s.index('\n    };',start)+7;chunk=s[start:end]
 needle='        return '+('sqjit_a64_emit_mov_reg(&buf, 0, 19)' if name=='emit_closure_slot_guard' else 'slots[base_slot].stack_object_reg >= 0')
 assert chunk.count(needle)==1,name
 chunk=chunk.replace(needle,'        const SQInteger guard_begin = buf.size, first_reloc = nguard_relocs;\n        bool emitted = '+needle[len('        return '):])
 old='            emit_guard_on_x0_zero();\n    };'
 new='''            emit_guard_on_x0_zero();
        return emitted && remember_entry_guard(guard_begin, first_reloc,
            REG, LITERAL, witness, TYPE);
    };'''.replace('REG',reg).replace('LITERAL',lit).replace('TYPE',typ)
 assert old in chunk,name;chunk=chunk.replace(old,new)
 s=s[:start]+chunk+s[end:]
needle='        SQFunctionProto *callee = callee_closure->_function;'
s=s.replace(needle,needle+'\n        if(!SQJitLeafPlan::Eligible(callee)) scalar_guard_region = false;',1)
# Place the one-time check transfer after all entry captures and scalar preloads.
needle='    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {\n        if(analysis.leaders[ip])'
assert needle in s
s=s.replace(needle,'''    SQInteger entry_guard_jump = -1;
    if(scalar_guard_region && !sqjit_a64_emit_b_placeholder(&buf, &entry_guard_jump)) return false;
    const SQInteger loop_entry_offset = buf.size;

'''+needle,1)
needle='    if(!code->Install(buf.bytes, buf.size))'
insert='''    if(entry_guard_jump >= 0) {
        // Keep original sites available if a later callee defeats the proof or
        // optional entry guards would exhaust the emission buffer. Deduplicate
        // equal fixed receiver/key/lifetime guards across repeated call sites.
        std::vector<SQInteger> unique;
        SQInteger extra = 4;
        if(scalar_guard_region) for(SQInteger n = 0; n < (SQInteger)entry_closure_guards.size(); ++n) {
            const EntryClosureGuard &g = entry_closure_guards[n];
            bool found = false;
            for(SQInteger u : unique) {
                const EntryClosureGuard &p = entry_closure_guards[u];
                if(g.reg == p.reg && g.literal == p.literal &&
                    g.witness == p.witness && g.type == p.type) { found = true; break; }
            }
            if(!found) { unique.push_back(n); extra += g.end - g.begin; }
        }
        if(!unique.empty() && extra <= (SQInteger)sizeof(buf.bytes) - buf.size) {
            const SQInteger entry_checks = buf.size;
            for(SQInteger u : unique) {
                const EntryClosureGuard &g = entry_closure_guards[u];
                SQInteger copy = buf.size;
                memcpy(buf.bytes + copy, buf.bytes + g.begin, (size_t)(g.end - g.begin));
                buf.size += g.end - g.begin;
                if(!sqjit_a64_patch_branch(&buf, copy + g.failure - g.begin,
                    guard_fail_offset, true, SQ_JIT_A64_EQ)) return false;
            }
            SQInteger back;
            if(!sqjit_a64_emit_b_placeholder(&buf, &back) ||
                !sqjit_a64_patch_branch(&buf, back, loop_entry_offset, false, 0) ||
                !sqjit_a64_patch_branch(&buf, entry_guard_jump, entry_checks, false, 0)) return false;
            for(const EntryClosureGuard &g : entry_closure_guards)
                if(!sqjit_a64_patch_branch(&buf, g.begin, g.end, false, 0)) return false;
            if(sqjit_diag_trace_enabled(proto))
                scprintf(_SC("[sqjit:a64] loop entry closure guards proto '%s' sites=%d unique=%d\\n"),
                    sqjit_a64_proto_name(proto), (SQInt32)entry_closure_guards.size(), (SQInt32)unique.size());
        }
        else if(!sqjit_a64_patch_branch(&buf, entry_guard_jump, loop_entry_offset, false, 0)) return false;
    }

'''
assert s.count(needle)==1;s=s.replace(needle,insert+needle)
p.write_text(s)
print('Implemented conservative entry guard reuse for scalar loops')
