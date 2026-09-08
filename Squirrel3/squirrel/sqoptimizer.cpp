#include "sqpcheader.h"
#ifndef NO_COMPILER
#include "sqcompiler.h"
#include "sqfuncproto.h"
#include "sqfuncstate.h"
#include "sqtable.h"
#include "sqbytecode.h"
#include "sqoptimizer.h"
#include <limits>
#include <string.h>

namespace {
struct Scalar {
    Scalar() : known(false), type(OT_NULL), integer(0), floating(0) {}
    bool known;
    SQObjectType type;
    SQInteger integer;
    SQFloat floating;
    bool IsFalse() const { return type == OT_NULL || (type == OT_FLOAT ? floating == 0 : integer == 0); }
    bool Same(const Scalar &other) const {
        if(!known || !other.known || type != other.type) return false;
        // Signed zero and NaN payloads must not merge by numeric equality.
        return type == OT_FLOAT ? !memcmp(&floating, &other.floating, sizeof(floating)) : integer == other.integer;
    }
};

bool integer_binary(unsigned char op, SQInteger a, SQInteger b, SQInteger &out)
{
    const SQInteger hi = std::numeric_limits<SQInteger>::max();
    const SQInteger lo = std::numeric_limits<SQInteger>::min();
    switch(op) {
    case _OP_ADD:
        if((b > 0 && a > hi - b) || (b < 0 && a < lo - b)) return false;
        out = a + b; return true;
    case _OP_SUB:
        if((b < 0 && a > hi + b) || (b > 0 && a < lo + b)) return false;
        out = a - b; return true;
    case _OP_MUL:
        if(a > 0 ? (b > 0 ? a > hi / b : b < lo / a) :
            (a < 0 && (b > 0 ? a < lo / b : b < hi / a))) return false;
        out = a * b; return true;
    case _OP_DIV: case _OP_MOD:
        if(b == 0 || (a == lo && b == -1)) return false;
        out = op == _OP_DIV ? a / b : a % b; return true;
    default: return false;
    }
}

Scalar literal(const SQObjectPtr &v)
{
    Scalar c;
    c.type = sq_type(v);
    c.known = c.type == OT_INTEGER || c.type == OT_BOOL || c.type == OT_FLOAT || c.type == OT_NULL;
    if(c.type == OT_FLOAT) c.floating = _float(v);
    else if(c.type == OT_INTEGER || c.type == OT_BOOL) c.integer = _integer(v);
    return c;
}
}

void sq_optimize_bytecode(SQFuncState &fs)
{
    SQInteger count = (SQInteger)fs._instructions.size();
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(fs._instructions._vals, count, fs._stacksize)) return;
    // Escaped locals can change without an explicit write in this prototype.
    // Keep this first pass within functions without captures or suspension.
    for(SQInteger ip = 0; ip < count; ++ip) {
        unsigned char op = fs._instructions[ip].op;
        if(op == _OP_CLOSURE || op == _OP_GETOUTER || op == _OP_SETOUTER || op == _OP_CLOSE || op == _OP_YIELD) return;
    }
    std::vector<SQObjectPtr> literals(fs._nliterals);
    SQObjectPtr cursor, key, value;
    SQInteger next;
    while((next = _table(fs._literals)->Next(false, cursor, key, value)) != -1) {
        literals[_integer(value)] = key;
        cursor = next;
    }
    Scalar values[MAX_FUNC_STACKSIZE];
    SQSlotSet nonowning;
    for(SQInteger n = (SQInteger)fs._parameters.size(); n < fs._stacksize; ++n) nonowning.set(n);
    std::vector<bool> erase(count, false), pure_store(count, false);
    // Forward joins retain only facts shared by every predecessor. Invalidate
    // all loop-written locals at the header before examining its first body:
    // the first iteration's constants must never become backedge assumptions.
    // Bound compilation memory; large functions retain the local-only pass.
    const bool propagate = count <= 4096 && (uint64_t)count * fs._stacksize <= 262144;
    std::vector<std::vector<Scalar> > incoming(propagate ? count : 0);
    auto merge = [&](SQInteger from, SQInteger target, bool exceptional) {
        if(!propagate || target <= from || target >= count || !analysis.leaders[target]) return;
        std::vector<Scalar> &state = incoming[target];
        if(state.empty()) state.assign(values, values + fs._stacksize);
        else for(SQInteger n=0; n<fs._stacksize; ++n)
            if(!state[n].Same(values[n])) state[n] = Scalar();
        if(exceptional) for(Scalar &v : state) v = Scalar();
    };

    for(SQInteger ip = 0; ip < count; ++ip) {
        if(ip && analysis.leaders[ip]) {
            for(Scalar &v : values) v = Scalar();
            if(propagate && !incoming[ip].empty())
                for(SQInteger n=0; n<fs._stacksize; ++n) values[n] = incoming[ip][n];
            nonowning.reset();
        }
        if(propagate) for(SQInteger n=0; n<fs._stacksize; ++n)
            if(analysis.loop_written[ip].test(n)) values[n] = Scalar();
        SQInstruction &i = fs._instructions[ip];
        const SQBytecodeFacts &facts = analysis.facts[ip];
        Scalar result;
        switch(i.op) {
        case _OP_LOADINT: result.known = true; result.type = OT_INTEGER; result.integer = i._arg1; break;
        case _OP_LOADBOOL: result.known = true; result.type = OT_BOOL; result.integer = i._arg1 != 0; break;
        case _OP_LOADFLOAT:
            if(sizeof(SQFloat) == sizeof(i._arg1)) {
                result.known = true; result.type = OT_FLOAT;
                memcpy(&result.floating, &i._arg1, sizeof(i._arg1));
            }
            break;
        case _OP_LOAD:
            if(i._arg1 >= 0 && i._arg1 < (SQInteger)literals.size()) result = literal(literals[i._arg1]);
            break;
        case _OP_MOVE: result = values[i._arg1]; break;
        case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD:
            if(values[i._arg1].known && values[i._arg2].known &&
                values[i._arg1].type == OT_INTEGER && values[i._arg2].type == OT_INTEGER &&
                integer_binary(i.op, values[i._arg2].integer, values[i._arg1].integer, result.integer)) {
                result.known = true; result.type = OT_INTEGER;
                if(result.integer >= std::numeric_limits<SQInt32>::min() && result.integer <= std::numeric_limits<SQInt32>::max())
                    i = SQInstruction(_OP_LOADINT, i._arg0, result.integer);
                else i = SQInstruction(_OP_LOAD, i._arg0, fs.GetNumericConstant(result.integer));
            }
            break;
        case _OP_JZ:
            if(values[i._arg0].known) {
                if(values[i._arg0].IsFalse()) i = SQInstruction(_OP_JMP, 0, i._arg1);
                else erase[ip] = true;
            }
            break;
        default: break;
        }
        if(i.op == _OP_DMOVE) {
            values[i._arg0] = values[i._arg1];
            values[i._arg2] = values[i._arg3];
            nonowning.set(i._arg0, values[i._arg0].known);
            nonowning.set(i._arg2, values[i._arg2].known);
        }
        else if(i.op == _OP_DLOAD) {
            values[i._arg0] = i._arg1 >= 0 && i._arg1 < (SQInteger)literals.size() ? literal(literals[i._arg1]) : Scalar();
            values[i._arg2] = i._arg3 < literals.size() ? literal(literals[i._arg3]) : Scalar();
            nonowning.set(i._arg0, values[i._arg0].known);
            nonowning.set(i._arg2, values[i._arg2].known);
        }
        else if(facts.writes.count() == 1 && i._arg0 < fs._stacksize && facts.writes.test(i._arg0)) {
            bool named = false;
            for(SQUnsignedInteger n = 0; n < fs._localvarinfos.size(); ++n) {
                const SQLocalVarInfo &local = fs._localvarinfos[n];
                if(local._pos == i._arg0 && (SQUnsignedInteger)(ip + 1) >= local._start_op &&
                    (SQUnsignedInteger)ip <= local._end_op) named = true;
            }
            pure_store[ip] = result.known && nonowning.test(i._arg0) && !named &&
                (i.op == _OP_LOADINT || i.op == _OP_LOADBOOL || i.op == _OP_LOADFLOAT || i.op == _OP_LOAD || i.op == _OP_MOVE);
            values[i._arg0] = result;
            nonowning.set(i._arg0, result.known);
        }
        else {
            for(SQInteger n = 0; n < fs._stacksize; ++n) if(facts.writes.test(n)) {
                values[n] = Scalar(); nonowning.reset(n);
            }
        }
        if(!result.known && (facts.effects & (SQ_BC_CALL | SQ_BC_OUTER | SQ_BC_MUTATE | SQ_BC_THROW))) {
            for(Scalar &v : values) v = Scalar();
        }
        // Original edges conservatively include both sides of a pruned branch.
        if(facts.fallthrough) merge(ip, ip + 1, false);
        merge(ip, facts.target, i.op == _OP_PUSHTRAP);
    }

    // Removing a known-false fallthrough branch is represented as fallthrough
    // for reachability and liveness until instructions are compacted below.
    std::vector<SQInstruction> flow(fs._instructions._vals, fs._instructions._vals + count);
    for(SQInteger ip = 0; ip < count; ++ip) if(erase[ip]) flow[ip] = SQInstruction(_OP_LINE);
    if(!analysis.Build(flow.data(), count, fs._stacksize)) return;
    std::vector<bool> reached(count + 1, false);
    std::vector<SQInteger> work(1, 0);
    reached[0] = true;
    while(!work.empty()) {
        SQInteger ip = work.back(); work.pop_back();
        if(ip == count) continue;
        const SQBytecodeFacts &f = analysis.facts[ip];
        SQInteger successors[2] = {f.fallthrough ? ip + 1 : -1, f.target};
        for(SQInteger target : successors) if(target >= 0 && !reached[target]) {
            reached[target] = true; work.push_back(target);
        }
    }
    for(SQInteger ip = 0; ip < count; ++ip) {
        if(!reached[ip]) erase[ip] = true;
        if(pure_store[ip] && !analysis.live_in[ip + 1].test(fs._instructions[ip]._arg0)) erase[ip] = true;
    }
    std::vector<SQInteger> map(count + 1);
    SQInteger size = 0;
    for(SQInteger ip = 0; ip < count; ++ip) { map[ip] = size; if(!erase[ip]) ++size; }
    map[count] = size;
    for(SQInteger ip = 0; ip < count; ++ip) {
        SQInteger target;
        if(!erase[ip] && fs._instructions[ip].op == _OP_JMP &&
            sq_bytecode_branch_target(fs._instructions[ip], ip, target) && target > ip && map[target] == map[ip] + 1)
            erase[ip] = true;
    }
    size = 0;
    for(SQInteger ip = 0; ip < count; ++ip) { map[ip] = size; if(!erase[ip]) ++size; }
    map[count] = size;
    if(!size || size == count) return;
    SQInstructionVec output;
    for(SQInteger ip = 0; ip < count; ++ip) if(!erase[ip]) {
        SQInstruction i = fs._instructions[ip];
        SQInteger target;
        if(sq_bytecode_branch_target(i, ip, target))
            i._arg1 = (SQInt32)(map[target] - map[ip] - (i.op == _OP_POSTFOREACH ? 0 : 1));
        output.push_back(i);
    }
    // Reconstruct line boundaries from surviving instructions. A removed line
    // must not steal the source location of the next surviving instruction.
    SQLineInfoVec lines;
    SQUnsignedInteger line_index = 0;
    for(SQInteger ip = 0; ip < count && fs._lineinfos.size(); ++ip) {
        while(line_index + 1 < fs._lineinfos.size() && fs._lineinfos[line_index + 1]._op <= ip) ++line_index;
        if(!erase[ip] && (lines.empty() || lines.top()._line != fs._lineinfos[line_index]._line)) {
            SQLineInfo line = {fs._lineinfos[line_index]._line, map[ip]};
            lines.push_back(line);
        }
    }
    SQLocalVarInfoVec locals;
    for(SQUnsignedInteger n = 0; n < fs._localvarinfos.size(); ++n) {
        SQLocalVarInfo local = fs._localvarinfos[n];
        if(local._start_op >= (SQUnsignedInteger)count) continue;
        SQUnsignedInteger end = local._end_op < (SQUnsignedInteger)count ? local._end_op : count - 1;
        SQInteger new_end = map[end] + (!erase[end] ? 1 : 0) - 1;
        if(new_end < map[local._start_op]) continue;
        local._start_op = (SQUnsignedInteger)map[local._start_op];
        local._end_op = (SQUnsignedInteger)new_end;
        locals.push_back(local);
    }
    fs._instructions.copy(output);
    fs._lineinfos.copy(lines);
    fs._localvarinfos.copy(locals);
}

#endif // NO_COMPILER
