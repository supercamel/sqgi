/* Checked, bounded undo storage shared by native backends. */
#ifndef SQJIT_WRITE_LOG_H
#define SQJIT_WRITE_LOG_H
#include "sqpcheader.h"
#include <stdint.h>

class SQJitWriteLog {
public:
    typedef void *(*Allocate)(SQUnsignedInteger);
    explicit SQJitWriteLog(SQUnsignedInteger limit = 65536, Allocate allocate = sq_vm_malloc);
    ~SQJitWriteLog();
    SQJitWriteLog(const SQJitWriteLog &) = delete;
    SQJitWriteLog &operator=(const SQJitWriteLog &) = delete;

    bool RecordArray(const SQObjectPtr &target, SQInteger index);
    bool RecordArraySize(const SQObjectPtr &target, SQInteger size);
    // old_value is the raw slot value, including an undereferenced weakref.
    bool RecordMember(const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value);
    void Rollback();
    SQUnsignedInteger Size() const { return _size; }

private:
    enum Kind { ARRAY_INDEX, ARRAY_SIZE, MEMBER };
    struct Entry {
        Kind kind;
        SQObjectPtr target, key, old_value;
        SQInteger index;
    };
    enum { INLINE_SIZE = 8 };
    alignas(Entry) unsigned char _inline[INLINE_SIZE * sizeof(Entry)];
    Entry *InlineEntries() { return reinterpret_cast<Entry *>(_inline); }
    Entry *_entries;
    SQUnsignedInteger *_buckets;
    SQUnsignedInteger _size, _capacity, _epoch, _limit;
    Allocate _allocate;
    const void *_last_array;
    SQInteger _last_index;
    bool _ordered;
    const void *_small_array;
    uint64_t _small_indices;

    bool Grow();
    bool EnsureIndex();
    SQUnsignedInteger Bucket(const SQObjectPtr &target, SQInteger index) const;
    bool Contains(const SQObjectPtr &target, SQInteger index) const;
    template<bool Retain> bool ContainsMember(const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value) const;
    void Index(SQUnsignedInteger entry);
    Entry *Append(Kind kind, const SQObjectPtr &target, SQInteger index);
};

SQJitWriteLog *sqjit_write_log_ensure(SQInteger *slot);
// Caller provides aligned storage that outlives release(..., false).
// Native x64 frames use this; other callers keep lazy heap allocation.
void sqjit_write_log_init_frame(SQInteger *slot, void *storage);
void sqjit_write_log_release(SQInteger *slot, bool rollback, bool free_storage = true);
#endif
