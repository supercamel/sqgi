#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqjit_backend_x64_float_loops.h"

SQJitX64FloatLoops::SQJitX64FloatLoops(SQFunctionProto *proto, const SQBytecodeAnalysis &analysis,
    SQInteger first, SQInteger last, bool enabled) : _proto(proto), _analysis(analysis)
{
    if(!enabled) return;
    for(SQInteger ip=first; ip<=last; ++ip) {
        SQOpcode op = (SQOpcode)proto->_instructions[ip].op;
        SQInteger end = analysis.facts[ip].target;
        if((op != _OP_JCMP && op != _OP_JZ) || end <= ip || end > last + 1) continue;
        bool valid = true, backedge = false;
        for(SQInteger n=first; n<=last && valid; ++n) {
            const SQBytecodeFacts &f = analysis.facts[n];
            if(n < ip || n >= end) {
                // An external jump cannot bypass the initial register setup.
                if(f.target >= ip && f.target < end) valid = false;
                continue;
            }
            if(n == ip) continue;
            if(f.target == ip && proto->_instructions[n].op == _OP_JMP) backedge = true;
            else if(f.target >= 0 && (f.target <= n || f.target >= end)) valid = false;
            if(!f.fallthrough && f.target < 0) valid = false;
            if(n == end - 1 && f.fallthrough) valid = false;
        }
        if(valid && backedge) { Header header = {end, {}}; _headers.emplace(ip, header); }
    }
}

bool SQJitX64FloatLoops::Enter(SQInteger ip, SQJitNativeCodeBuffer &buf, const SQJitSlotState *state)
{
    // This successor has only the header's hot edge: side entries and other
    // backedges were excluded. Its register state already agrees.
    auto body = _headers.find(ip - 1);
    if(body != _headers.end() && !body->second.slots.empty()) return true;
    auto found = _headers.find(ip);
    if(found == _headers.end()) return sqjit_native_flush_float_cache(&buf);
    auto &slots = found->second.slots;
    for(SQInteger n=0; n<_proto->_stacksize && slots.size()<4; ++n)
        if(_analysis.live_in[ip].test(n) && state[n].kind == SQ_JIT_SLOT_FLOAT)
            slots.push_back(n);
    return sqjit_native_reconcile_float_registers(&buf, slots);
}

bool SQJitX64FloatLoops::Condition(SQInteger ip, SQJitNativeCodeBuffer &buf,
    SQJitNativeJcc condition, SQInteger *patch)
{
    auto found = _headers.find(ip);
    if(found == _headers.end() || found->second.slots.empty())
        return sqjit_native_emit_jcc_placeholder(&buf, condition, patch);
    SQInteger saved[4];
    std::vector<SQInteger> aliases[4];
    for(int n=0; n<4; ++n) { saved[n] = buf.float_slots[n]; aliases[n] = buf.float_aliases[n]; }
    // The hot body keeps the header registers. Only the exit edge spills them,
    // so the ordinary successor sees exactly the existing memory convention.
    if(!sqjit_native_emit_u8(&buf, 0x0f) ||
        !sqjit_native_emit_u8(&buf, (unsigned char)(condition ^ 1))) return false;
    SQInteger body = buf.size;
    if(!sqjit_native_emit_i32(&buf, 0) || !sqjit_native_emit_jmp_placeholder(&buf, patch)) return false;
    for(int n=0; n<4; ++n) { buf.float_slots[n] = saved[n]; buf.float_aliases[n] = aliases[n]; }
    return sqjit_native_patch_i32(&buf, body, buf.size - body - 4);
}

bool SQJitX64FloatLoops::Jump(SQInteger target, SQJitNativeCodeBuffer &buf, SQInteger *patch)
{
    auto found = _headers.find(target);
    if(found == _headers.end() || found->second.slots.empty())
        return sqjit_native_emit_jmp_placeholder(&buf, patch);
    if(!sqjit_native_reconcile_float_registers(&buf, found->second.slots) ||
        !sqjit_native_emit_u8(&buf, 0xe9)) return false;
    *patch = buf.size;
    return sqjit_native_emit_i32(&buf, 0);
}
