/* Checked, bounded undo storage shared by native backends. */
#ifndef SQJIT_WRITE_LOG_H
#define SQJIT_WRITE_LOG_H
#include "sqpcheader.h"
#include <stdint.h>
struct SQJitContext;

class SQJitWriteLog {
public:
    typedef void *(*Allocate)(SQUnsignedInteger);
    explicit SQJitWriteLog(SQUnsignedInteger limit = 65536, Allocate allocate = sq_vm_malloc,
        SQJitContext *context = NULL);
    ~SQJitWriteLog();
    SQJitWriteLog(const SQJitWriteLog &) = delete;
    SQJitWriteLog &operator=(const SQJitWriteLog &) = delete;

    bool RecordArray(const SQObjectPtr &target, SQInteger index);
    bool RecordArraySize(const SQObjectPtr &target, SQInteger size);
    // old_value is the raw slot value, including an undereferenced weakref.
    bool RecordMember(const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value);
    // Pin a captured native value independently of its original heap/VM slot.
    // Unlike an undo entry this never writes anything during rollback.
    bool RetainValue(const SQObjectPtr &value);
    // The VM stack address must remain stable until this log is released.
    // Capture entry inputs before native helpers can overwrite their slots.
    bool RecordStackSlot(SQObjectPtr *slot);
    // Stage one bytecode destination before helpers may materialize into it.
    // Finish restores the old destination before applying the language's
    // assignment or GET temporary-swap semantics. All failures are replayable.
    bool BeginStackWrite(SQObjectPtr *slot);
    bool FinishStackWrite(const SQObject &value, bool getter);
    // A result computed without changing the destination needs no pending
    // owner or restore step. Snapshot and publish it with identical semantics.
    bool PublishStackWrite(SQObjectPtr *slot, const SQObject &value, bool getter);
    // Test a real reference drop, excluding pins in this and enclosing logs.
    // drops includes other aliases discarded by the same atomic instruction.
    // False means replay in the VM before observable destruction/weak death.
    bool CanRelease(const SQObjectPtr &value, SQUnsignedInteger drops = 1);
    // A canonical-slot activation has no journal of its own. Count any enclosing
    // journals without registering an empty child. Call before adding local pins.
    static bool CanReleaseInContext(SQJitContext &context, const SQObjectPtr &value,
        SQUnsignedInteger drops = 1);
    void Rollback();
    SQUnsignedInteger Size() const { return _size + _value_size; }

private:
    enum Kind { ARRAY_INDEX, ARRAY_SIZE, MEMBER };
    struct Entry {
        Kind kind;
        SQObjectPtr target, key, old_value;
        // MEMBER: nonzero only for the first destination entry in its epoch.
        // Other kinds keep their array index or size.
        SQInteger index;
    };
    struct ValueEntry {
        SQObjectPtr value;
        // Non-null is a saved stack address; null is a lifetime-only pin.
        SQObjectPtr *slot;
        // Heap-entry count at insertion preserves the original mixed order.
        SQUnsignedInteger heap_boundary;
    };
    enum { INLINE_SIZE = 8 };
    alignas(Entry) unsigned char _inline[INLINE_SIZE * sizeof(Entry)];
    Entry *InlineEntries() { return reinterpret_cast<Entry *>(_inline); }
    Entry *_entries;
    alignas(ValueEntry) unsigned char _value_inline[INLINE_SIZE * sizeof(ValueEntry)];
    ValueEntry *InlineValues() { return reinterpret_cast<ValueEntry *>(_value_inline); }
    ValueEntry *_values;
    SQUnsignedInteger *_value_buckets;
    SQUnsignedInteger _value_size, _value_capacity, _value_epoch;
    SQUnsignedInteger *_buckets;
    SQUnsignedInteger *_owner_buckets;
    SQUnsignedInteger _size, _capacity, _epoch, _limit;
    Allocate _allocate;
    const void *_last_array;
    SQInteger _last_index;
    bool _ordered;
    const void *_small_array;
    uint64_t _small_indices;
    SQJitContext *_context;
    SQJitWriteLog *_previous_log;
    struct PinBucket { SQRefCounted *owner; SQUnsignedInteger count; };
    PinBucket *_pins;
    SQUnsignedInteger _pin_capacity, _pins_indexed, _value_pins_indexed;
    SQObjectPtr *_pending_slot;
    SQObjectPtr _pending_value, _temporary;

    bool CountPins(SQRefCounted *owner, SQUnsignedInteger &count);
    bool BuildPins();
    void IndexPin(const SQObjectPtr &value);
    void ReleaseEntry(Entry &entry);
    void ReleaseValue(ValueEntry &entry);
    void ReplayEntry(Entry &entry);
    bool GrowValues();
    bool EnsureValueIndex() { return _value_buckets || _value_size <= INLINE_SIZE || BuildValueIndex(); }
    bool BuildValueIndex();
    SQUnsignedInteger ValueBucket(SQObjectPtr *slot, const SQObjectPtr &value) const;
    template<bool Stack> ValueEntry *FindValue(SQObjectPtr *slot, const SQObjectPtr &value);
    ValueEntry *AppendValue(SQObjectPtr *slot, const SQObjectPtr &value);
    void IndexValue(SQUnsignedInteger entry);
    bool Grow();
    bool EnsureIndex() { return _buckets || _size <= INLINE_SIZE || BuildIndex(); }
    bool EnsureOwnerIndex() { return _owner_buckets || _size <= INLINE_SIZE || BuildOwnerIndex(); }
    bool BuildIndex();
    bool BuildOwnerIndex();
    SQUnsignedInteger Bucket(const SQObjectPtr &target, SQInteger index) const;
    SQUnsignedInteger OwnerBucket(const SQObjectPtr &target, const SQObjectPtr &key,
        const SQObjectPtr &old_value) const;
    bool Contains(const SQObjectPtr &target, SQInteger index) const;
    template<bool Retain> bool ContainsMember(const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value) const;
    void Index(SQUnsignedInteger entry);
    Entry *Append(Kind kind, const SQObjectPtr &target, SQInteger index);
};

SQJitWriteLog *sqjit_write_log_ensure(SQInteger *slot);
// Caller provides aligned storage that outlives release(..., false).
// Native x64/AArch64 frames use this; other callers keep lazy heap allocation.
void sqjit_write_log_init_frame(SQInteger *slot, void *storage, SQJitContext *context = NULL);
void sqjit_write_log_release(SQInteger *slot, bool rollback, bool free_storage = true);
#endif
