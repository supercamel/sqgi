from pathlib import Path
p=Path('Squirrel3/squirrel/jit/sqjit_backend_aarch64_compile_loop.inc');s=p.read_text();needle='    auto emit_guard_on_x0_zero = [&]() -> bool {'
insert='''    // A direct scalar leaf may ignore its `this` argument. MOVE/DMOVE used
    // to demand an integer even when merely preparing an unused table receiver.
    // Keep that receiver as a private alias only when the very next CALL
    // overwrites it with a proven scalar result. No live reference writeback is
    // omitted, and the callee identity/type guards still precede execution.
    auto copy_unused_leaf_receiver = [&](SQInteger dst, SQInteger src, SQInteger ip) -> bool {
        if(!scalar_guard_region || src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slots[src].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[src].stack_object_reg < 0)
            return false;
        SQInteger next = ip + 1;
        while(next <= end_ip && proto->_instructions[next].op == _OP_LINE) ++next;
        if(next > end_ip) return false;
        const SQInstruction &call = proto->_instructions[next];
        if(call.op != _OP_CALL || call._arg2 != dst || call._arg0 != dst ||
            call._arg1 < 0 || call._arg1 >= MAX_FUNC_STACKSIZE ||
            slots[call._arg1].kind != SQ_JIT_SLOT_STACK_OBJECT) return false;
        SQInteger reg = slots[call._arg1].stack_object_reg;
        if(reg < 0 || sq_type(entry_stack[reg]) != OT_CLOSURE) return false;
        SQFunctionProto *callee = _closure(entry_stack[reg])->_function;
        if(!SQJitLeafPlan::Eligible(callee) || callee->_nparameters != call._arg3) return false;
        std::vector<SQJitSlotKind> kinds(callee->_nparameters, SQ_JIT_SLOT_UNKNOWN);
        const SQInstruction &move = proto->_instructions[ip];
        for(SQInteger n = 1; n < callee->_nparameters; ++n) {
            SQInteger from = call._arg2 + n;
            if(move.op == _OP_DMOVE && move._arg2 == from) {
                from = move._arg3;
                // The second move sees the first assignment, not its old slot.
                if(from == move._arg0) from = move._arg1;
            }
            if(from < 0 || from >= MAX_FUNC_STACKSIZE) return false;
            SQJitSlotKind kind = slots[from].kind;
            if(kind == SQ_JIT_SLOT_STACK_OBJECT) {
                SQInteger r = slots[from].stack_object_reg;
                if(r < 0) return false;
                SQObjectType type = sq_type(entry_stack[r]);
                kind = type == OT_INTEGER ? SQ_JIT_SLOT_INT : type == OT_FLOAT ?
                    SQ_JIT_SLOT_FLOAT : type == OT_BOOL ? SQ_JIT_SLOT_BOOL : SQ_JIT_SLOT_UNKNOWN;
            }
            if(kind != SQ_JIT_SLOT_INT && kind != SQ_JIT_SLOT_FLOAT && kind != SQ_JIT_SLOT_BOOL)
                return false;
            kinds[n] = kind;
        }
        SQJitLeafPlan plan;
        if(!plan.Build(callee, kinds) || (plan.return_kind != SQ_JIT_SLOT_INT &&
            plan.return_kind != SQ_JIT_SLOT_FLOAT && plan.return_kind != SQ_JIT_SLOT_BOOL)) return false;
        return copy_stack_object_alias(dst, src);
    };

'''
assert s.count(needle)==1;s=s.replace(needle,insert+needle)
# Modify only parent-loop MOVE/DMOVE, not inlined callee copies.
start=s.index('    const SQInteger loop_entry_offset = buf.size;');end=s.index('            case _OP_GETK:',start)
chunk=s[start:end]
for dst,src in [('inst._arg0','inst._arg1'),('inst._arg2','inst._arg3')]:
 needle=f'if({src} >= 0 && {src} < MAX_FUNC_STACKSIZE &&\n                    slots[{src}].kind == SQ_JIT_SLOT_ARRAY_PTR)'
 replacement=f'if(copy_unused_leaf_receiver({dst}, {src}, ip)) {{\n                    // Unused call receiver remains private until its scalar overwrite.\n                }}\n                else '+needle
 assert needle in chunk,(dst,src);chunk=chunk.replace(needle,replacement)
s=s[:start]+chunk+s[end:];p.write_text(s)
print('Fixed scalar direct-call receiver preparation without general reference MOVE publication')
