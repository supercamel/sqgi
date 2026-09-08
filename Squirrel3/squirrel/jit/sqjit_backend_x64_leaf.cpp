#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqbytecode.h"
#include "sqjit_backend_x64_leaf.h"
#include <string.h>

bool sqjit_x64_inline_leaf(SQJitNativeCodeBuffer &buf, SQFunctionProto *callee,
    const SQJitLeafPlan &plan, SQInteger scratch, SQInteger target,
    const std::function<bool()> &guard)
{
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(callee->_instructions, callee->_ninstructions, callee->_stacksize)) return false;
    std::vector<SQInteger> offsets(callee->_ninstructions + 1, -1);
    std::vector<SQJitNativeReloc> branches;
    const SQInteger temporary = scratch + SQJitLeafPlan::MAX_SLOTS;
    auto local = [&](SQInteger slot) { return scratch + slot; };
    auto copy = [&](SQInteger dst, SQInteger src, SQJitSlotKind kind) {
        if(kind == SQ_JIT_SLOT_FLOAT)
            return sqjit_native_emit_copy_float(&buf, dst, src);
        return sqjit_native_emit_mov_rax_mem(&buf, src) && sqjit_native_emit_mov_mem_rax(&buf, dst);
    };
    auto load_literal = [&](SQInteger dst, SQInteger index) {
        const SQObjectPtr &v = callee->_literals[index];
        if(sq_type(v) == OT_FLOAT) return sqjit_native_emit_mov_local_float_const(&buf, dst, _float(v));
        return sqjit_native_emit_mov_rax_imm64(&buf, _integer(v)) && sqjit_native_emit_mov_mem_rax(&buf, dst);
    };
    auto branch = [&](SQInteger patch, SQInteger ip) {
        SQJitNativeReloc r = {patch, ip}; branches.push_back(r);
    };
    std::vector<bool> labels(callee->_ninstructions + 1, false);
    for(SQInteger ip = 0; ip < callee->_ninstructions; ++ip) {
        const SQInstruction &i = callee->_instructions[ip];
        if(i.op == _OP_JMP || i.op == _OP_JZ || i.op == _OP_JCMP)
            labels[ip + 1 + i._arg1] = true; // validated by SQJitLeafPlan
    }
    for(SQInteger ip = 0; ip < callee->_ninstructions; ++ip) {
        for(SQInteger n=0; n<callee->_stacksize; ++n)
            if(!analysis.live_in[ip].test(n)) sqjit_native_discard_float_slot(&buf, local(n));
        sqjit_native_discard_float_slot(&buf, temporary);
        sqjit_native_discard_float_slot(&buf, temporary + 1);
        if(labels[ip] && !sqjit_native_flush_float_cache(&buf)) return false;
        offsets[ip] = buf.size;
        const SQJitLeafPlan::Instruction &node = plan.instructions[ip];
        if(!node.reachable) continue;
        const SQInstruction &i = callee->_instructions[ip];
        const auto &in = node.incoming;
        SQInteger dst = local(i._arg0), left = local(i._arg2), right = local(i._arg1);
        switch(i.op) {
        case _OP_LINE: break;
        case _OP_LOADINT: case _OP_LOADBOOL:
            if(!sqjit_native_emit_mov_mem_imm32(&buf, dst,
                i.op == _OP_LOADBOOL ? i._arg1 != 0 : (SQInt32)i._arg1)) return false;
            break;
        case _OP_LOADFLOAT: {
            if(sizeof(SQFloat) != sizeof(i._arg1)) return false;
            SQFloat value; memcpy(&value, &i._arg1, sizeof(SQFloat));
            if(!sqjit_native_emit_mov_local_float_const(&buf, dst, value)) return false;
            break;
        }
        case _OP_LOAD: if(!load_literal(dst, i._arg1)) return false; break;
        case _OP_DLOAD:
            if(!load_literal(dst, i._arg1) || !load_literal(local(i._arg2), i._arg3)) return false;
            break;
        case _OP_MOVE: case _OP_DMOVE:
            if(!copy(dst, right, in[i._arg1].kind)) return false;
            if(i.op == _OP_DMOVE && !copy(local(i._arg2), local(i._arg3),
                i._arg3 == i._arg0 ? in[i._arg1].kind : in[i._arg3].kind)) return false;
            break;
        case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD:
            if(node.result == SQ_JIT_SLOT_FLOAT) {
                auto float_operand = [&](SQInteger slot, SQInteger temp) {
                    if(in[slot].kind == SQ_JIT_SLOT_FLOAT) return local(slot);
                    if(!sqjit_native_emit_mov_rax_mem(&buf, local(slot)) ||
                        !sqjit_native_emit_convert_rax_float(&buf) ||
                        !sqjit_native_emit_mov_local_float_xmm0(&buf, temp)) return (SQInteger)-1;
                    return temp;
                };
                left = float_operand(i._arg2, temporary);
                right = float_operand(i._arg1, temporary + 1);
                bool consumed = left == temporary || !analysis.live_in[ip + 1].test(i._arg2);
                if(left < 0 || right < 0 || !sqjit_native_emit_float_binary(&buf,
                    (SQOpcode)i.op, dst, left, right, consumed)) return false;
            }
            else if(i.op == _OP_MOD || i.op == _OP_DIV) {
                if(in[i._arg1].constant && in[i._arg1].integer > 0) {
                    if(!sqjit_native_emit_mov_rax_mem(&buf, left) ||
                        !sqjit_native_emit_divmod_constant(&buf, in[i._arg1].integer, i.op == _OP_MOD) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, dst)) return false;
                    break;
                }
                if(!sqjit_native_emit_mov_rcx_mem(&buf, right)) return false;
                // The existing x86 remainder path admits positive divisors.
                // Keep the same guard, avoiding zero and signed IDIV overflow.
                if(!(in[i._arg1].constant && in[i._arg1].integer > 0) &&
                    (!sqjit_native_emit_cmp_rcx_i32(&buf, 0) ||
                     !sqjit_native_emit_setcc_rax(&buf, 0x9f) ||
                     !sqjit_native_emit_cmp_rax_i32(&buf, 1) || !guard())) return false;
                if(!sqjit_native_emit_mov_rax_mem(&buf, left) || !sqjit_native_emit_idiv_rcx(&buf) ||
                    (i.op == _OP_MOD && !sqjit_native_emit_mov_rax_rdx(&buf)) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, dst)) return false;
            }
            else {
                bool immediate = in[i._arg1].constant && sqjit_native_is_int32(in[i._arg1].integer);
                SQInteger value = in[i._arg1].integer;
                if(!sqjit_native_emit_mov_rax_mem(&buf, left)) return false;
                bool ok = i.op == _OP_ADD ? (immediate ? sqjit_native_emit_add_rax_i32(&buf, value) : sqjit_native_emit_add_rax_mem(&buf, right)) :
                    i.op == _OP_SUB ? (immediate ? sqjit_native_emit_sub_rax_i32(&buf, value) : sqjit_native_emit_sub_rax_mem(&buf, right)) :
                    (immediate ? sqjit_native_emit_imul_rax_i32(&buf, value) : sqjit_native_emit_imul_rax_mem(&buf, right));
                if(!ok || !sqjit_native_emit_mov_mem_rax(&buf, dst)) return false;
            }
            break;
        case _OP_NEG:
            if(!sqjit_native_emit_mov_rax_imm64(&buf, 0) || !sqjit_native_emit_sub_rax_mem(&buf, right) ||
                !sqjit_native_emit_mov_mem_rax(&buf, dst)) return false;
            break;
        case _OP_EQ: case _OP_NE:
            if(i._arg3) { if(!load_literal(temporary, i._arg1)) return false; right = temporary; }
            if(!sqjit_native_emit_mov_rax_mem(&buf, left) || !sqjit_native_emit_cmp_rax_mem(&buf, right) ||
                !sqjit_native_emit_setcc_rax(&buf, i.op == _OP_EQ ? 0x94 : 0x95) ||
                !sqjit_native_emit_mov_mem_rax(&buf, dst)) return false;
            break;
        case _OP_CMP: case _OP_JCMP: {
            SQJitNativeJcc condition;
            right = i.op == _OP_CMP ? right : dst;
            if(!sqjit_native_cmp_false_jcc((CmpOP)i._arg3, &condition) ||
                !sqjit_native_emit_mov_rax_mem(&buf, left) || !sqjit_native_emit_cmp_rax_mem(&buf, right)) return false;
            if(i.op == _OP_CMP) {
                if(!sqjit_native_emit_setcc_rax(&buf, (unsigned char)((condition ^ 1) + 0x10)) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, dst)) return false;
            }
            else {
                SQInteger patch;
                if(!sqjit_native_emit_jcc_placeholder(&buf, condition, &patch)) return false;
                branch(patch, ip + 1 + (SQInt32)i._arg1);
            }
            break;
        }
        case _OP_JZ: {
            SQInteger patch;
            if(!sqjit_native_emit_mov_rax_mem(&buf, dst) || !sqjit_native_emit_cmp_rax_i32(&buf, 0) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch)) return false;
            branch(patch, ip + 1 + (SQInt32)i._arg1); break;
        }
        case _OP_JMP: case _OP_RETURN: {
            if(i.op == _OP_RETURN) {
                if(!copy(target, right, plan.return_kind)) return false;
                // Only the copied result escapes this inlined invocation.
                for(SQInteger n=0; n<SQJitLeafPlan::MAX_SLOTS + 2; ++n)
                    sqjit_native_discard_float_slot(&buf, local(n));
                bool later = false;
                for(SQInteger n=ip+1; n<callee->_ninstructions; ++n) later |= plan.instructions[n].reachable;
                if(!later) break; // The final return falls directly into the caller.
            }
            SQInteger patch;
            if(!sqjit_native_emit_jmp_placeholder(&buf, &patch)) return false;
            branch(patch, i.op == _OP_RETURN ? callee->_ninstructions : ip + 1 + (SQInt32)i._arg1);
            break;
        }
        default: return false;
        }
    }
    bool joins_return = false;
    for(const SQJitNativeReloc &r : branches) joins_return |= r.target_ip == callee->_ninstructions;
    if(joins_return && !sqjit_native_flush_float_cache(&buf)) return false;
    offsets[callee->_ninstructions] = buf.size;
    for(const SQJitNativeReloc &r : branches)
        if(!sqjit_native_patch_i32(&buf, r.patch_offset, offsets[r.target_ip] - r.patch_offset - 4)) return false;
    return true;
}
