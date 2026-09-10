from pathlib import Path
p=Path('Squirrel3/squirrel/jit/sqjit_backend_aarch64_compile_loop.inc');s=p.read_text()
s=s.replace('    bool copied_unused_receiver = false;', '    bool copied_unused_receiver = false;\n    SQSlotSet unused_receiver_destinations;',1)
needle='''            return false;
        SQInteger next = ip + 1;'''
replacement='''            return false;
        // The omitted receiver copy can only acquire/release an owner that
        // survives the entire region through this unchanged canonical parameter.
        SQInteger source_reg = slots[src].stack_object_reg;
        if(source_reg >= proto->_nparameters) return false;
        for(SQInteger at = start_ip; at <= end_ip; ++at)
            if(analysis.facts[at].writes.test(source_reg)) return false;
        SQInteger next = ip + 1;'''
assert s.count(needle)==1;s=s.replace(needle,replacement,1)
s=s.replace('        copied_unused_receiver = true;','        copied_unused_receiver = true;\n        unused_receiver_destinations.set(dst);',1)
s=s.replace('        SQInteger extra = 4;', '        SQInteger extra = 4 + (SQInteger)unused_receiver_destinations.count() * 8;',1)
s=s.replace('        if(!unique.empty() && extra <= (SQInteger)sizeof(buf.bytes) - buf.size) {', '        if((!unique.empty() || copied_unused_receiver) && extra <= (SQInteger)sizeof(buf.bytes) - buf.size) {',1)
needle='''            const SQInteger entry_checks = buf.size;
            for(SQInteger u : unique) {'''
replacement='''            const SQInteger entry_checks = buf.size;
            // Eliding an unused receiver must not defer a final release until
            // scalar writeback. Reject every owning old destination before any
            // loop effect, including physical owners supplied by ancestor logs.
            for(SQInteger slot = 0; slot < proto->_stacksize; ++slot) {
                if(!unused_receiver_destinations.test(slot)) continue;
                SQInteger owning;
                if(!sqjit_a64_emit_ldr_w(&buf, 9, 19, sqjit_a64_stack_type_disp(slot)) ||
                    !sqjit_a64_emit_test_branch(&buf, 9, SQ_JIT_A64_REF_COUNTED_BIT, true, &owning) ||
                    !sqjit_a64_patch_test_branch(&buf, owning, guard_fail_offset)) return false;
            }
            for(SQInteger u : unique) {'''
assert needle in s;s=s.replace(needle,replacement,1)
needle='''        else if(!sqjit_a64_patch_branch(&buf, entry_guard_jump, loop_entry_offset, false, 0)) return false;'''
replacement='''        else if(copied_unused_receiver) {
            // Unlike optional identity hoisting, destination-release guards are
            // mandatory for this lowering. No space means the prior fallback.
            return compile_loop(proto, entry_stack, closure, start_ip, header_ip,
                end_ip, exit_ip, code, attempt, false);
        }
        else if(!sqjit_a64_patch_branch(&buf, entry_guard_jump, loop_entry_offset, false, 0)) return false;'''
assert needle in s;s=s.replace(needle,replacement,1)
p.write_text(s)
print('Added mandatory entry release guards and a surviving-source proof')
