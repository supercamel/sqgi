#include "sqjit_write_log.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclass.h"
#include <stdint.h>
#include <string.h>

SQJitWriteLog::SQJitWriteLog(SQUnsignedInteger limit, Allocate allocate)
    : _entries(InlineEntries()), _buckets(NULL), _size(0), _capacity(INLINE_SIZE),
      _epoch(0), _limit(limit < 65536 ? limit : 65536), _allocate(allocate),
      _last_array(NULL), _last_index(-1), _ordered(true), _small_array(NULL), _small_indices(0)
{
}

SQJitWriteLog::~SQJitWriteLog()
{
    if(_entries != InlineEntries()) {
        for(SQUnsignedInteger n = 0; n < _size; ++n) _entries[n].~Entry();
        sq_vm_free(_entries, _capacity * sizeof(Entry));
    }
    else {
        // Preserve the reverse destruction order of the former inline array.
        for(SQUnsignedInteger n = _size; n > 0; --n) _entries[n - 1].~Entry();
    }
    if(_buckets) sq_vm_free(_buckets, 2 * _capacity * sizeof(SQUnsignedInteger));
}

SQUnsignedInteger SQJitWriteLog::Bucket(const SQObjectPtr &target, SQInteger index) const
{
    // Mix both identity and index, including on platforms with 32-bit SQInteger.
    uint64_t hash = (uint64_t)(uintptr_t)_refcounted(target) ^
        ((uint64_t)index * UINT64_C(0x9e3779b97f4a7c15));
    hash ^= hash >> 30;
    hash *= UINT64_C(0xbf58476d1ce4e5b9);
    hash ^= hash >> 27;
    return (SQUnsignedInteger)hash & (2 * _capacity - 1);
}

bool SQJitWriteLog::Contains(const SQObjectPtr &target, SQInteger index) const
{
    if(!_buckets) {
        for(SQUnsignedInteger n = _epoch; n < _size; ++n) {
            const Entry &e = _entries[n];
            if(e.kind == ARRAY_INDEX && _array(e.target) == _array(target) && e.index == index) return true;
        }
        return false;
    }
    SQUnsignedInteger bucket = Bucket(target, index);
    while(_buckets[bucket]) {
        const Entry &e = _entries[_buckets[bucket] - 1];
        if(e.kind == ARRAY_INDEX && _array(e.target) == _array(target) && e.index == index) return true;
        bucket = (bucket + 1) & (2 * _capacity - 1);
    }
    return false;
}

void SQJitWriteLog::Index(SQUnsignedInteger entry)
{
    if(!_buckets || _entries[entry].kind == ARRAY_SIZE) return;
    const Entry &e = _entries[entry];
    SQUnsignedInteger bucket = Bucket(e.target, e.kind == MEMBER ? (SQInteger)_rawval(e.key) : e.index);
    while(_buckets[bucket]) bucket = (bucket + 1) & (2 * _capacity - 1);
    _buckets[bucket] = entry + 1;
}

bool SQJitWriteLog::Grow()
{
    SQUnsignedInteger capacity = _capacity * 2;
    Entry *entries = (Entry *)_allocate(capacity * sizeof(Entry));
    if(!entries) return false;
    SQUnsignedInteger *buckets = _buckets ? (SQUnsignedInteger *)_allocate(2 * capacity * sizeof(SQUnsignedInteger)) : NULL;
    if(_buckets && !buckets) {
        sq_vm_free(entries, capacity * sizeof(Entry));
        return false;
    }
    if(buckets) memset(buckets, 0, 2 * capacity * sizeof(SQUnsignedInteger));
    for(SQUnsignedInteger n = 0; n < _size; ++n) new (&entries[n]) Entry(_entries[n]);
    for(SQUnsignedInteger n = 0; n < _size; ++n) _entries[n].~Entry();
    if(_entries != InlineEntries()) sq_vm_free(_entries, _capacity * sizeof(Entry));
    if(_buckets) sq_vm_free(_buckets, 2 * _capacity * sizeof(SQUnsignedInteger));
    _entries = entries;
    _buckets = buckets;
    _capacity = capacity;
    for(SQUnsignedInteger n = _epoch; n < _size; ++n) Index(n);
    return true;
}

bool SQJitWriteLog::EnsureIndex()
{
    if(_buckets || _size <= INLINE_SIZE) return true;
    _buckets = (SQUnsignedInteger *)_allocate(2 * _capacity * sizeof(SQUnsignedInteger));
    if(!_buckets) return false;
    memset(_buckets, 0, 2 * _capacity * sizeof(SQUnsignedInteger));
    for(SQUnsignedInteger n = _epoch; n < _size; ++n) Index(n);
    return true;
}

SQJitWriteLog::Entry *SQJitWriteLog::Append(Kind kind, const SQObjectPtr &target, SQInteger index)
{
    if(_size >= _limit || (_size == _capacity && !Grow())) return NULL;
    Entry *e = &_entries[_size++];
    new (e) Entry;
    e->kind = kind;
    e->target = target;
    e->index = index;
    return e;
}

bool SQJitWriteLog::RecordArray(const SQObjectPtr &target, SQInteger index)
{
    if(sq_type(target) != OT_ARRAY || index < 0 || index >= _array(target)->Size()) return false;
    // Preserve the raw value, including weak references, rather than Get's
    // dereferenced value. Only elide intermediate non-owning scalar values.
    const SQObjectPtr &old_value = _array(target)->_values[index];
    // Numeric kernels repeatedly update a few elements. An exact bitset for
    // one retained array avoids searching the undo entries on every write.
    // Owning values still need a new record to preserve displaced lifetimes.
    const uint64_t bit = index < 64 ? UINT64_C(1) << index : 0;
    if(bit && _small_array == _array(target) && (_small_indices & bit) &&
        !ISREFCOUNTED(sq_type(old_value))) return true;
    // Ascending writes to one array are provably distinct. Delay building the
    // index until that pattern breaks; streaming writes pay only undo storage.
    bool distinct = _ordered && (!_last_array || (_last_array == _array(target) && index > _last_index));
    if(!distinct) {
        _ordered = false;
        if(!EnsureIndex()) return false;
        if(!ISREFCOUNTED(sq_type(old_value)) && Contains(target, index)) return true;
    }
    Entry *e = Append(ARRAY_INDEX, target, index);
    if(!e) return false;
    e->old_value = old_value;
    Index(_size - 1);
    _last_array = _array(target);
    _last_index = index;
    if(bit) {
        if(_small_array != _array(target)) { _small_array = _array(target); _small_indices = 0; }
        _small_indices |= bit;
    }
    return true;
}

bool SQJitWriteLog::RecordArraySize(const SQObjectPtr &target, SQInteger size)
{
    if(sq_type(target) != OT_ARRAY || size != _array(target)->Size()) return false;
    if(!Append(ARRAY_SIZE, target, size)) return false;
    // Keep reverse replay valid across a structural change. Deduplication is
    // restricted to the interval since the last resize record.
    _epoch = _size;
    _last_array = NULL;
    _last_index = -1;
    _ordered = true;
    _small_array = NULL;
    _small_indices = 0;
    if(_buckets) memset(_buckets, 0, 2 * _capacity * sizeof(SQUnsignedInteger));
    return true;
}

bool SQJitWriteLog::RecordMember(const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value)
{
    if(sq_type(target) != OT_TABLE && sq_type(target) != OT_INSTANCE) return false;
    // Keep every distinct displaced owner until commit/rollback. Repeated
    // occurrences of an already retained owner add no lifetime protection;
    // collapsing those prevents swapping a few objects from growing the log
    // on every iteration. Raw tags/identity also preserve weak references.
    if(!EnsureIndex()) return false;
    if(ISREFCOUNTED(sq_type(old_value)) ? ContainsMember<true>(target,key,old_value) :
        ContainsMember<false>(target,key,old_value)) return true;
    Entry *e = Append(MEMBER, target, 0);
    if(!e) return false;
    e->key = key;
    e->old_value = old_value;
    Index(_size - 1);
    return true;
}

template<bool Retain>
bool SQJitWriteLog::ContainsMember(const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value) const
{
    auto matches = [&](const Entry &e) {
        return e.kind == MEMBER && _refcounted(e.target) == _refcounted(target) &&
            sq_type(e.key) == sq_type(key) && _rawval(e.key) == _rawval(key) &&
            (!Retain || (sq_type(e.old_value) == sq_type(old_value) && _rawval(e.old_value) == _rawval(old_value)));
    };
    if(!_buckets) {
        for(SQUnsignedInteger n = _epoch; n < _size; ++n) if(matches(_entries[n])) return true;
        return false;
    }
    SQUnsignedInteger bucket = Bucket(target, (SQInteger)_rawval(key));
    while(_buckets[bucket]) {
        if(matches(_entries[_buckets[bucket] - 1])) return true;
        bucket = (bucket + 1) & (2 * _capacity - 1);
    }
    return false;
}

void SQJitWriteLog::Rollback()
{
    for(SQUnsignedInteger n = _size; n > 0; --n) {
        Entry &e = _entries[n - 1];
        if(e.kind == ARRAY_INDEX) _array(e.target)->Set(e.index, e.old_value);
        else if(e.kind == ARRAY_SIZE) _array(e.target)->Resize(e.index);
        else if(sq_type(e.target) == OT_TABLE) _table(e.target)->Set(e.key, e.old_value);
        else _instance(e.target)->Set(e.key, e.old_value);
    }
}

SQJitWriteLog *sqjit_write_log_ensure(SQInteger *slot)
{
    if(!slot) return NULL;
    if(*slot) return (SQJitWriteLog *)(intptr_t)*slot;
    void *mem = sq_vm_malloc(sizeof(SQJitWriteLog));
    if(!mem) return NULL;
    SQJitWriteLog *log = new (mem) SQJitWriteLog;
    *slot = (SQInteger)(intptr_t)log;
    return log;
}

void sqjit_write_log_init_frame(SQInteger *slot, void *storage)
{
    *slot = (SQInteger)(intptr_t)new (storage) SQJitWriteLog;
}

void sqjit_write_log_release(SQInteger *slot, bool rollback, bool free_storage)
{
    if(!slot || !*slot) return;
    SQJitWriteLog *log = (SQJitWriteLog *)(intptr_t)*slot;
    if(rollback) log->Rollback();
    *slot = 0;
    log->~SQJitWriteLog();
    if(free_storage) sq_vm_free(log, sizeof(SQJitWriteLog));
}
