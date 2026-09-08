/* Shared function/loop lowering for pure, identity-guarded calls. */
#ifndef SQJIT_BACKEND_X64_CALLS_H
#define SQJIT_BACKEND_X64_CALLS_H
#include "sqjit_backend_x64_emit.h"
#include "sqjit_intrinsics.h"
#include <functional>
#include <vector>
class SQBytecodeAnalysis;
struct SQFunctionProto;
class SQJitCode;

class SQJitX64Calls {
public:
    typedef std::function<bool(SQInteger)> Ensure;
    SQJitX64Calls(SQFunctionProto *proto, SQObjectPtr *entry, SQJitNativeCodeBuffer &buf,
        SQJitSlotState *slots, SQInteger closure_slot, bool loop,
        Ensure ensure_int, Ensure ensure_float, std::function<bool()> guard, SQInteger leaf_scratch_slots);
    static SQInteger LeafScratchSlots(SQFunctionProto *proto, SQObjectPtr *entry, SQInteger first, SQInteger last);
    void RetainDependencies(SQJitCode &code) const;
    bool HoistGuards(const SQBytecodeAnalysis &analysis, SQInteger first, SQInteger last);
    void Begin(const SQInstruction &inst);
    void RequireStableHeap() { _stable_heap = true; }
    bool Prepare(const SQInstruction &inst);
    bool Call(const SQInstruction &inst);
    bool CopyScalar(SQInteger target, SQInteger source);
private:
    struct Prepared {
        Prepared() : math(NULL), leaf(NULL), conversion(false), string_length(false), receiver(-1) {}
        const SQNativeMathSpec *math;
        SQFunctionProto *leaf;
        bool conversion;
        bool string_length;
        SQInteger receiver;
    };
    struct HoistedMath { SQInteger literal; const SQNativeMathSpec *spec; };
    std::vector<HoistedMath> _hoisted_math;
    struct HoistedLeaf { SQInteger literal; SQWeakRef *prototype; };
    std::vector<HoistedLeaf> _hoisted_leaf;
    std::vector<SQObjectPtr> _leaf_references;
    SQInteger _leaf_scratch_slots, _inlined_instructions;
    bool _hoisted_conversion, _hoisted_string_length, _stable_heap;
    Prepared _prepared[MAX_FUNC_STACKSIZE];
    SQFunctionProto *_proto;
    SQObjectPtr *_entry;
    SQJitNativeCodeBuffer &_buf;
    SQJitSlotState *_slots;
    SQInteger _closure_slot;
    bool _loop;
    const SQBytecodeAnalysis *_analysis;
    Ensure _ensure_int, _ensure_float;
    std::function<bool()> _guard;
    bool GuardResult();
    bool MathGuard(SQInteger base, SQInteger literal, const SQNativeMathSpec *spec, SQInteger ip);
    bool ConversionGuard(const SQObjectPtr &key);
    SQWeakRef *LeafReference(SQFunctionProto *proto);
    bool LeafGuard(SQInteger base, SQInteger literal, SQWeakRef *prototype);
    bool InlineLeaf(SQFunctionProto *callee, const SQInstruction &call);
    bool ConvertInteger(SQInteger from, SQInteger to);
    SQInteger FloatArgument(SQInteger slot, SQInteger scratch);
};
#endif
