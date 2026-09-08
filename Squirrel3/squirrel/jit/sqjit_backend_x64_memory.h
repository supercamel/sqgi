/* Checked memory reads shared by the x86 function and loop compilers. */
#ifndef SQJIT_BACKEND_X64_MEMORY_H
#define SQJIT_BACKEND_X64_MEMORY_H
#include "sqjit_backend_x64_emit.h"
#include "sqjit_virtual_array.h"
#include "sqjit_member_plan.h"
#include <functional>

struct SQFunctionProto;
struct SQArray;
class SQBytecodeAnalysis;

class SQJitX64Memory {
public:
    typedef std::function<bool(SQInteger)> Ensure;
    typedef std::function<bool(SQJitNativeJcc)> Guard;
    SQJitX64Memory(SQFunctionProto *proto, SQObjectPtr *entry,
        SQJitNativeCodeBuffer &buf, SQJitSlotState *slots,
        const SQBytecodeAnalysis &analysis, SQInteger last, bool loop,
        Ensure ensure_int, Guard guard, const SQJitVirtualArrayPlan *virtual_arrays = NULL,
        SQInteger virtual_base = 0, Ensure ensure_float = Ensure(),
        const SQJitMemberPlan *members = NULL, SQInteger member_base = 0);
    bool ArrayGet(SQInteger ip, SQInteger dst, SQInteger base, SQInteger key,
        bool constant = false, SQInteger index = 0);
    bool ArraySet(SQInteger dst, SQInteger base, SQInteger key, SQInteger value,
        SQInteger log, bool floating, bool constant = false, SQInteger index = 0);
    bool HoistArrayGuards(SQInteger first);
    bool HoistMembers();
    bool HasMember(SQInteger base, SQInteger literal) const;
    bool MemberSetLiteral(SQInteger dst, SQInteger base, SQInteger literal, SQInteger value, SQInteger log);
    bool MemberGet(SQInteger dst, SQInteger base, SQInteger literal);
    bool MemberSet(SQInteger dst, SQInteger base, SQInteger key, SQInteger value, SQInteger log);
    bool CopyObject(SQInteger dst, SQInteger src);
    bool VirtualNew(SQInteger ip);
    bool VirtualAppend(SQInteger ip);
    bool TableGet(SQInteger dst, SQInteger base, SQInteger key);
    bool TableSet(SQInteger target, SQInteger base, SQInteger key, SQInteger value,
        SQInteger write_log_slot);
private:
    SQFunctionProto *_proto;
    SQObjectPtr *_entry;
    SQJitNativeCodeBuffer &_buf;
    SQJitSlotState *_slots;
    const SQBytecodeAnalysis &_analysis;
    SQInteger _last;
    bool _loop;
    Ensure _ensure_int;
    Guard _guard;
    SQArray *_observed_arrays[MAX_FUNC_STACKSIZE]; // Compilation hints; every load is guarded.
    SQObjectType _checked_array_types[MAX_FUNC_STACKSIZE];
    SQInteger _checked_array_lengths[MAX_FUNC_STACKSIZE];
    const SQJitVirtualArrayPlan *_virtual_arrays;
    SQInteger _virtual_base, _virtual_counts[MAX_FUNC_STACKSIZE];
    SQJitSlotKind _virtual_types[SQJitVirtualArrayPlan::MAX_ARRAYS * SQJitVirtualArrayPlan::MAX_ELEMENTS];
    Ensure _ensure_float;
    const SQJitMemberPlan *_members;
    SQInteger _member_base;
    SQInteger MemberCell(SQInteger base, SQInteger literal) const;
    bool TemporaryStringKey(SQInteger ip, SQInteger slot) const;
    bool BorrowedReadsSafe() const;
    bool HelperResult(SQInteger dst);
};
#endif
