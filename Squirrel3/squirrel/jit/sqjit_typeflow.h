/* Conservative representation checks shared by the native backends. */
#ifndef SQJIT_TYPEFLOW_H
#define SQJIT_TYPEFLOW_H
#include "sqbytecode.h"
#include "sqjit_value.h"
#include "sqfuncproto.h"

// Each definition records the type chosen by lowering, including guarded
// loads and intrinsic calls. Propagate those definitions through the CFG.
// Merging different live scalar tags requires boxing, which these backends
// do not yet implement; reject such a region before installing native code.
class SQJitTypeFlow {
    typedef std::vector<unsigned char> Types;
    const SQBytecodeAnalysis &_analysis;
    SQInteger _first, _last, _slots;
    Types _definitions;
    static unsigned char Tag(SQObjectType t) {
        return t == OT_INTEGER ? 1 : t == OT_FLOAT ? 2 : t == OT_BOOL ? 4 : 8;
    }
public:
    SQJitTypeFlow(const SQBytecodeAnalysis &analysis, SQInteger first, SQInteger last, SQInteger slots)
        : _analysis(analysis), _first(first), _last(last), _slots(slots) {
        // Straight-line code has no joins. Avoid allocating one definition
        // vector per instruction on this common compilation path.
        for(SQInteger ip = first; ip <= last; ++ip) if(analysis.facts[ip].target >= 0) {
            _definitions.resize((last - first + 1) * slots, 0);
            break;
        }
    }

    template<class State> void Record(SQInteger ip, const State *state) {
        if(_definitions.empty()) return;
        for(SQInteger n = 0; n < _slots; ++n)
            if(_analysis.facts[ip].writes.test(n))
                _definitions[(ip - _first) * _slots + n] =
                    state[n].kind == SQ_JIT_SLOT_ARRAY_PTR ? 16 :
                    state[n].kind == SQ_JIT_SLOT_STRING_PTR ? 32 :
                    state[n].kind == SQ_JIT_SLOT_VIRTUAL_ARRAY ? 64 : Tag(sqjit_scalar_type(state[n].kind));
    }

    bool Validate(SQFunctionProto *proto, SQObjectPtr *entry) const {
        const SQInteger count = _last - _first + 1;
        if(_definitions.empty()) return true;
        std::vector<Types> incoming(count + 1, Types(_slots, 0));
        std::vector<bool> reached(count + 1, false), queued(count + 1, false);
        std::vector<SQInteger> work;
        for(SQInteger n = 0; n < _slots; ++n)
            incoming[0][n] = _first || n < proto->_nparameters ? Tag(sq_type(entry[n])) : 8;
        reached[0] = queued[0] = true;
        work.push_back(_first);
        auto merge = [&](SQInteger target, const Types &out) {
            if(target < _first || target > _last + 1) return;
            SQInteger index = target - _first;
            bool changed = !reached[index];
            reached[index] = true;
            for(SQInteger n = 0; n < _slots; ++n) {
                unsigned char value = incoming[index][n] | out[n];
                changed |= incoming[index][n] != value;
                incoming[index][n] = value;
            }
            if(changed && !queued[index] && target <= _last) {
                queued[index] = true; work.push_back(target);
            }
        };
        for(size_t next = 0; next < work.size(); ++next) {
            SQInteger ip = work[next], index = ip - _first;
            queued[index] = false;
            const SQBytecodeFacts &f = _analysis.facts[ip];
            const SQInstruction &i = proto->_instructions[ip];
            const Types &in = incoming[index];
            Types out = in;
            for(SQInteger n = 0; n < _slots; ++n) {
                unsigned char definition = _definitions[index * _slots + n];
                if(definition) out[n] = f.kills.test(n) ? definition : out[n] | definition;
            }
            // Copies preserve semantic identity even when lowering leaves a
            // deferred reference to the VM stack instead of loading it yet.
            if(i.op == _OP_MOVE || i.op == _OP_DMOVE) out[i._arg0] = in[i._arg1];
            if(i.op == _OP_DMOVE)
                out[i._arg2] = i._arg3 == i._arg0 ? out[i._arg0] : in[i._arg3];
            if(f.fallthrough) merge(ip + 1, out);
            if(f.target >= 0) merge(f.target, out);
        }
        for(SQInteger index = 0; index <= count; ++index) {
            if(!reached[index]) continue;
            for(SQInteger n = 0; n < _slots; ++n) {
                unsigned char t = incoming[index][n];
                if(_analysis.live_in[_first + index].test(n) && (t & (t - 1)) != 0) return false;
            }
        }
        return true;
    }
};
#endif
