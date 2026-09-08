#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqmemberslot.h"
#include "sqjit_member_plan.h"
#include "sqjit_write_log.h"
#include <deque>

bool SQJitKeyFlow::Build(SQFunctionProto *proto, const SQBytecodeAnalysis &analysis,
    SQInteger first, SQInteger last)
{
    _in.clear();
    if(!proto || first < 0 || last < first || last >= proto->_ninstructions ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        analysis.facts.size() != (size_t)proto->_ninstructions) return false;
    for(SQInteger ip = first; ip <= last; ++ip) if(!analysis.facts[ip].valid) return false;
    _proto = proto; _first = first; _last = last; _slots = proto->_stacksize;
    _in.assign(last - first + 1, std::vector<SQInteger>(_slots, UNREACHED));
    _in[0].assign(_slots, UNKNOWN);
    std::deque<SQInteger> queue(1, first);
    std::vector<bool> queued(last - first + 1, false); queued[0] = true;
    SQInteger visits = 0;
    while(!queue.empty()) {
        if(++visits > 65536) { _in.clear(); return false; }
        SQInteger ip = queue.front(); queue.pop_front(); queued[ip - first] = false;
        const SQInstruction &i = proto->_instructions[ip];
        const SQBytecodeFacts &f = analysis.facts[ip];
        const std::vector<SQInteger> &in = _in[ip - first];
        std::vector<SQInteger> out = in;
        for(SQInteger n = 0; n < _slots; ++n) if(f.writes.test(n)) out[n] = UNKNOWN;
        switch(i.op) {
        case _OP_LOAD: out[i._arg0] = i._arg1; break;
        case _OP_DLOAD: out[i._arg0] = i._arg1; out[i._arg2] = i._arg3; break;
        case _OP_MOVE: out[i._arg0] = in[i._arg1]; break;
        case _OP_DMOVE:
            out[i._arg0] = in[i._arg1];
            out[i._arg2] = i._arg3 == i._arg0 ? out[i._arg0] : in[i._arg3];
            break;
        case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
        case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD:
        case _OP_BITW: case _OP_NEG: case _OP_BWNOT:
            out[i._arg0] = SCALAR; break;
        default: break;
        }
        auto merge = [&](SQInteger successor) {
            if(successor < first || successor > last) return;
            bool changed = false;
            std::vector<SQInteger> &target = _in[successor - first];
            for(SQInteger n = 0; n < _slots; ++n) {
                SQInteger value = target[n] == UNREACHED ? out[n] :
                    target[n] == out[n] ? target[n] : UNKNOWN;
                if(value != target[n]) { target[n] = value; changed = true; }
            }
            if(changed && !queued[successor - first]) {
                queue.push_back(successor); queued[successor - first] = true;
            }
        };
        if(f.fallthrough) merge(ip + 1);
        if(f.target >= 0) merge(f.target);
    }
    return true;
}

SQInteger SQJitKeyFlow::Value(SQInteger ip, SQInteger slot) const
{
    if(_in.empty() || ip < _first || ip > _last || slot < 0 || slot >= _slots) return UNKNOWN;
    return _in[ip - _first][slot];
}
SQInteger SQJitKeyFlow::Literal(SQInteger ip, SQInteger slot) const
{
    SQInteger value = Value(ip, slot);
    return value >= 0 && value < _proto->_nliterals ? value : -1;
}
bool SQJitKeyFlow::MayEqual(SQInteger ip, SQInteger slot, const SQChar *name) const
{
    SQInteger value = Value(ip, slot);
    if(value == SCALAR) return false;
    if(value < 0 || value >= _proto->_nliterals) return true;
    const SQObjectPtr &key = _proto->_literals[value];
    return sq_type(key) == OT_STRING && scstrcmp(_stringval(key), name) == 0;
}

void SQJitMemberPlan::Build(SQFunctionProto *proto, SQObjectPtr *entry,
    const SQBytecodeAnalysis &analysis, SQInteger first, SQInteger last)
{
    fields.clear();
    _keys = SQJitKeyFlow();
    if(!proto || !entry || first < 0 || last < first || last >= proto->_ninstructions ||
        analysis.facts.size() != (size_t)proto->_ninstructions) return;
    SQSlotSet written;
    bool loop = false, members = false, writes = false;
    SQInteger accesses = 0;
    for(SQInteger ip = first; ip <= last; ++ip) {
        const SQInstruction &i = proto->_instructions[ip];
        const SQBytecodeFacts &f = analysis.facts[ip];
        // Accepted calls are audited intrinsics/scalar leaf bodies. Their
        // guards must not replace cache owners while field addresses are live.
        if(i.op == _OP_NEWOBJ || i.op == _OP_APPENDARRAY ||
            ((f.effects & SQ_BC_OUTER) && i.op != _OP_RETURN) ||
            ((f.effects & SQ_BC_MUTATE) && i.op != _OP_SET &&
                i.op != _OP_CALL && i.op != _OP_TAILCALL)) return;
        written |= f.writes;
        loop |= f.target >= first && f.target <= ip;
        members |= i.op == _OP_GETK || i.op == _OP_SET;
        writes |= i.op == _OP_SET;
        accesses += i.op == _OP_GETK || i.op == _OP_SET;
    }
    // Amortize locations across a loop or a group of reads and writes.
    if((!loop && (!writes || accesses < 3)) || !members || !_keys.Build(proto, analysis, first, last)) return;
    for(SQInteger ip = first; ip <= last; ++ip) {
        const SQInstruction &i = proto->_instructions[ip];
        if(i.op != _OP_GETK && i.op != _OP_GET && i.op != _OP_SET) continue;
        SQInteger base = i.op == _OP_GETK ? i._arg2 : i._arg1;
        SQInteger literal = i.op == _OP_GETK ? i._arg1 : _keys.Literal(ip, i._arg2);
        if(written.test(base) || literal < 0 || literal >= proto->_nliterals ||
            sq_type(proto->_literals[literal]) != OT_STRING || Find(base, literal) >= 0 ||
            !sq_member_raw_slot(entry[base], proto->_literals[literal])) continue;
        if(fields.size() == MAX_FIELDS) break;
        Field field = {base, literal}; fields.push_back(field);
    }
}
SQInteger SQJitMemberPlan::Find(SQInteger base, SQInteger literal) const
{
    for(SQUnsignedInteger n = 0; n < fields.size(); ++n)
        if(fields[n].base == base && fields[n].literal == literal) return n;
    return -1;
}

SQInteger sqjit_member_cell_init(SQObjectPtr *stack, SQInteger base,
    const SQObjectPtr *key, SQJitMemberCell *cell)
{
    static_assert(sizeof(SQJitMemberCell) % sizeof(SQInteger) == 0, "whole native frame words");
    SQObjectPtr *value = sq_member_raw_slot(stack[base], *key);
    if(!value) return 0;
    cell->value = value; cell->owner = &stack[base]; cell->key = key;
    cell->logged = 0; cell->retained_type = OT_NULL;
    cell->retained[0] = cell->retained[1] = NULL;
    return 1;
}

SQInteger sqjit_member_cell_store(SQInteger *slot, SQJitMemberCell *cell,
    SQInteger bits, SQInteger type)
{
    SQJitWriteLog *log = sqjit_write_log_ensure(slot);
    SQObjectPtr &old = *cell->value;
    if(!log || !log->RecordMember(*cell->owner, *cell->key, old)) return 0;
    cell->logged = 1;
    if(sq_type(old) == OT_ARRAY || sq_type(old) == OT_STRING) {
        if(cell->retained_type != sq_type(old)) {
            cell->retained_type = sq_type(old);
            cell->retained[0] = cell->retained[1] = NULL;
        }
        cell->retained[1] = cell->retained[0];
        cell->retained[0] = _refcounted(old);
    }
    // The cache is only a shortcut for objects already retained by the log.
    // A miss, type change or larger working set keeps the complete log path.
    SQObject value;
    value._type = (SQObjectType)type; value._unVal.raw = (SQRawObjectVal)bits;
    old = value;
    return 1;
}
