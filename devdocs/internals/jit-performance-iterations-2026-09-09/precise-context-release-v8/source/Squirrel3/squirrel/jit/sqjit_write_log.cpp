#include "sqjit_write_log.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqjit_context.h"
#include <stdint.h>
#include <initializer_list>
#include <string.h>

SQJitWriteLog::SQJitWriteLog(SQUnsignedInteger limit, Allocate allocate, SQJitContext *context)
    : _entries(InlineEntries()), _values(InlineValues()), _value_buckets(NULL),
      _value_size(0), _value_capacity(INLINE_SIZE), _value_epoch(0),
      _buckets(NULL), _owner_buckets(NULL), _size(0), _capacity(INLINE_SIZE),
      _epoch(0), _limit(limit < 65536 ? limit : 65536), _allocate(allocate),
      _last_array(NULL), _last_index(-1), _ordered(true), _small_array(NULL), _small_indices(0),
      _context(context), _previous_log(context ? context->active_logs : NULL),
      _pins(NULL), _pin_capacity(0), _pins_indexed(0), _value_pins_indexed(0), _pending_slot(NULL)
{
    if(_context) _context->active_logs = this;
}

SQJitWriteLog::~SQJitWriteLog()
{
    _pending_slot = NULL;
    _pending_value.Null();
    _temporary.Null();
    // Merge the two streams without changing the former journal's destruction
    // order (reverse for an inline-sized journal, forward after growth).
    if(Size() > INLINE_SIZE) {
        SQUnsignedInteger heap = 0;
        for(SQUnsignedInteger n = 0; n < _value_size; ++n) {
            while(heap < _values[n].heap_boundary) ReleaseEntry(_entries[heap++]);
            ReleaseValue(_values[n]);
        }
        while(heap < _size) ReleaseEntry(_entries[heap++]);
    }
    else {
        SQUnsignedInteger heap = _size;
        for(SQUnsignedInteger n = _value_size; n > 0; --n) {
            while(heap > _values[n - 1].heap_boundary) ReleaseEntry(_entries[--heap]);
            ReleaseValue(_values[n - 1]);
        }
        while(heap) ReleaseEntry(_entries[--heap]);
    }
    // All entries remain constructed and visible to reentrant pin accounting
    // until every possible callback above has returned.
    for(SQUnsignedInteger n = 0; n < _size; ++n) _entries[n].~Entry();
    for(SQUnsignedInteger n = 0; n < _value_size; ++n) _values[n].~ValueEntry();
    if(_entries != InlineEntries()) sq_vm_free(_entries, _capacity * sizeof(Entry));
    if(_values != InlineValues()) sq_vm_free(_values, _value_capacity * sizeof(ValueEntry));
    if(_context) {
        assert(_context->active_logs == this);
        _context->active_logs = _previous_log;
    }
    if(_buckets) sq_vm_free(_buckets, 2 * _capacity * sizeof(SQUnsignedInteger));
    if(_owner_buckets) sq_vm_free(_owner_buckets, 2 * _capacity * sizeof(SQUnsignedInteger));
    if(_value_buckets) sq_vm_free(_value_buckets, 2 * _value_capacity * sizeof(SQUnsignedInteger));
    if(_pins) sq_vm_free(_pins, _pin_capacity * sizeof(PinBucket));
}

void SQJitWriteLog::ReleaseEntry(Entry &entry)
{
    // Null publishes the absent pin before invoking a destructor/release hook.
    // Keep the journal registered while callbacks can re-enter another VM.
    _pins_indexed = _value_pins_indexed = 0; entry.old_value.Null();
    _pins_indexed = _value_pins_indexed = 0; entry.key.Null();
    _pins_indexed = _value_pins_indexed = 0; entry.target.Null();
    // Empty entries must stay constructed until every potential re-entry ends:
    // CountPins may still inspect the earlier, now-empty entries of this log.
}

void SQJitWriteLog::ReleaseValue(ValueEntry &entry)
{
    _pins_indexed = _value_pins_indexed = 0;
    entry.value.Null();
}

static SQUnsignedInteger sqjit_pin_bucket(SQRefCounted *owner, SQUnsignedInteger capacity)
{
    uint64_t bits = (uint64_t)(uintptr_t)owner;
    bits ^= bits >> 30; bits *= UINT64_C(0xbf58476d1ce4e5b9);
    bits ^= bits >> 27; bits *= UINT64_C(0x94d049bb133111eb);
    bits ^= bits >> 31;
    return (SQUnsignedInteger)bits & (capacity - 1);
}

void SQJitWriteLog::IndexPin(const SQObjectPtr &value)
{
    if(!ISREFCOUNTED(sq_type(value))) return;
    SQRefCounted *owner = _refcounted(value);
    SQUnsignedInteger bucket = sqjit_pin_bucket(owner, _pin_capacity);
    while(_pins[bucket].owner && _pins[bucket].owner != owner)
        bucket = (bucket + 1) & (_pin_capacity - 1);
    _pins[bucket].owner = owner;
    ++_pins[bucket].count;
}

bool SQJitWriteLog::BuildPins()
{
    // Up to three references per entry; keep this pointer/count-only index
    // below half occupancy. It neither retains owners nor changes their ABI.
    SQUnsignedInteger capacity = 64;
    while(capacity < 2 * (3 * _size + _value_size)) capacity *= 2;
    if(capacity > _pin_capacity) {
        PinBucket *pins = (PinBucket *)_allocate(capacity * sizeof(PinBucket));
        if(!pins) return false;
        if(_pins) sq_vm_free(_pins, _pin_capacity * sizeof(PinBucket));
        _pins = pins; _pin_capacity = capacity; _pins_indexed = _value_pins_indexed = 0;
    }
    if(!_pins_indexed && !_value_pins_indexed) memset(_pins, 0, _pin_capacity * sizeof(PinBucket));
    for(; _pins_indexed < _size; ++_pins_indexed) {
        const Entry &e = _entries[_pins_indexed];
        IndexPin(e.target); IndexPin(e.key); IndexPin(e.old_value);
    }
    for(; _value_pins_indexed < _value_size; ++_value_pins_indexed)
        IndexPin(_values[_value_pins_indexed].value);
    return true;
}

bool SQJitWriteLog::CountPins(SQRefCounted *owner, SQUnsignedInteger &count)
{
    if(ISREFCOUNTED(sq_type(_pending_value)) && _refcounted(_pending_value) == owner) ++count;
    // Keep the same bounded number of reference-field inspections as the old
    // inline journal, but compact records have only one field rather than three.
    if(3 * _size + _value_size <= 3 * INLINE_SIZE) {
        for(SQUnsignedInteger n = 0; n < _size; ++n) {
            const Entry &e = _entries[n];
            for(const SQObjectPtr *value : {&e.target, &e.key, &e.old_value})
                if(ISREFCOUNTED(sq_type(*value)) && _refcounted(*value) == owner) ++count;
        }
        for(SQUnsignedInteger n = 0; n < _value_size; ++n) {
            const SQObjectPtr &value = _values[n].value;
            if(ISREFCOUNTED(sq_type(value)) && _refcounted(value) == owner) ++count;
        }
        return true;
    }
    if(!BuildPins()) return false;
    SQUnsignedInteger bucket = sqjit_pin_bucket(owner, _pin_capacity);
    while(_pins[bucket].owner) {
        if(_pins[bucket].owner == owner) { count += _pins[bucket].count; break; }
        bucket = (bucket + 1) & (_pin_capacity - 1);
    }
    return true;
}

// SQArray has no release hook or delegate. With no weak observer and no owned
// children, postponing its destruction exposes no callback or weak death.
// Bound scanning and retained backing storage; larger arrays use owner accounting.
static bool sqjit_unobservable_scalar_array(const SQObjectPtr &value)
{
    if(sq_type(value) != OT_ARRAY || _array(value)->_weakref) return false;
    SQArray *array = _array(value);
    if(array->_values.capacity() > 64) return false;
    for(SQUnsignedInteger n = 0; n < array->_values.size(); ++n)
        if(ISREFCOUNTED(sq_type(array->_values[n]))) return false;
    return true;
}

bool SQJitWriteLog::CanRelease(const SQObjectPtr &value, SQUnsignedInteger drops)
{
    if(!ISREFCOUNTED(sq_type(value))) return true;
    SQRefCounted *owner = _refcounted(value);
    // These leaf types release no owned graph or callback. If weakly observed,
    // however, delaying even their destruction can change a subsequent read.
    if((sq_type(value) == OT_STRING || sq_type(value) == OT_WEAKREF) && !owner->_weakref) return true;
    // This proof is independent of the physical refcount, so these leaf graphs
    // need neither a journal-pin census nor a final-release rejection.
    if(sqjit_unobservable_scalar_array(value)) return true;
    SQUnsignedInteger pins = 0;
    for(SQJitWriteLog *log = _context ? _context->active_logs : this; log;
        log = log->_previous_log) {
        if(!log->CountPins(owner, pins)) return false;
    }
    SQUnsignedInteger references = owner->_uiRef;
#ifndef NO_GARBAGE_COLLECTOR
    references &= ~MARK_FLAG;
#endif
    if(references > pins && references - pins > drops) return true;
    if(_context && _context->trace) scprintf(_SC("[sqjit] release guard: tag=%u refs=%llu journal_pins=%llu\n"),
        (unsigned)sq_type(value), (unsigned long long)references, (unsigned long long)pins);
    return false;
}

bool SQJitWriteLog::CanReleaseInContext(SQJitContext &context,
    const SQObjectPtr &value, SQUnsignedInteger drops)
{
    // An ancestor may retain heap, stack or pending-value pins. Keep its exact
    // census, allocation-failure and observable-final-drop behavior.
    if(context.active_logs) return context.active_logs->CanRelease(value, drops);
    if(!ISREFCOUNTED(sq_type(value))) return true;
    SQRefCounted *owner = _refcounted(value);
    SQUnsignedInteger references = owner->_uiRef;
#ifndef NO_GARBAGE_COLLECTOR
    references &= ~MARK_FLAG;
#endif
    // No journal or helper-local pin exists here. A surviving program owner
    // makes the drop non-final without inspecting the container's children.
    if(references > drops) return true;
    if((sq_type(value) == OT_STRING || sq_type(value) == OT_WEAKREF) && !owner->_weakref) return true;
    if(sqjit_unobservable_scalar_array(value)) return true;
    if(context.trace) scprintf(_SC("[sqjit] release guard: tag=%u refs=%llu journal_pins=0\n"),
        (unsigned)sq_type(value), (unsigned long long)references);
    return false;
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

SQUnsignedInteger SQJitWriteLog::OwnerBucket(const SQObjectPtr &target,
    const SQObjectPtr &key, const SQObjectPtr &old_value) const
{
    // Destination-only hashing makes all displaced owners of one field collide.
    // Include the retained value's identity and tag without truncating pointers.
    uint64_t hash = (uint64_t)(uintptr_t)_refcounted(target) ^
        ((uint64_t)_rawval(key) * UINT64_C(0x9e3779b97f4a7c15)) ^
        ((uint64_t)_rawval(old_value) * UINT64_C(0xd6e8feb86659fd93)) ^
        ((uint64_t)sq_type(key) << 32) ^ (uint64_t)sq_type(old_value);
    hash ^= hash >> 30;
    hash *= UINT64_C(0xbf58476d1ce4e5b9);
    hash ^= hash >> 27;
    return (SQUnsignedInteger)hash & (2 * _capacity - 1);
}

void SQJitWriteLog::Index(SQUnsignedInteger entry)
{
    const Entry &e = _entries[entry];
    if(e.kind == ARRAY_SIZE) return;
    // Only the first member record belongs in the destination index; later
    // retained owners must not form a probe cluster there either.
    if(_buckets && (e.kind != MEMBER || e.index)) {
        SQUnsignedInteger bucket = Bucket(e.target, e.kind == MEMBER ? (SQInteger)_rawval(e.key) : e.index);
        while(_buckets[bucket]) bucket = (bucket + 1) & (2 * _capacity - 1);
        _buckets[bucket] = entry + 1;
    }
    if(_owner_buckets && e.kind == MEMBER && ISREFCOUNTED(sq_type(e.old_value))) {
        SQUnsignedInteger bucket = OwnerBucket(e.target, e.key, e.old_value);
        while(_owner_buckets[bucket]) bucket = (bucket + 1) & (2 * _capacity - 1);
        _owner_buckets[bucket] = entry + 1;
    }
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
    SQUnsignedInteger *owners = _owner_buckets ? (SQUnsignedInteger *)_allocate(2 * capacity * sizeof(SQUnsignedInteger)) : NULL;
    if(_owner_buckets && !owners) {
        if(buckets) sq_vm_free(buckets, 2 * capacity * sizeof(SQUnsignedInteger));
        sq_vm_free(entries, capacity * sizeof(Entry));
        return false;
    }
    if(buckets) memset(buckets, 0, 2 * capacity * sizeof(SQUnsignedInteger));
    if(owners) memset(owners, 0, 2 * capacity * sizeof(SQUnsignedInteger));
    for(SQUnsignedInteger n = 0; n < _size; ++n) new (&entries[n]) Entry(_entries[n]);
    for(SQUnsignedInteger n = 0; n < _size; ++n) _entries[n].~Entry();
    if(_entries != InlineEntries()) sq_vm_free(_entries, _capacity * sizeof(Entry));
    if(_buckets) sq_vm_free(_buckets, 2 * _capacity * sizeof(SQUnsignedInteger));
    if(_owner_buckets) sq_vm_free(_owner_buckets, 2 * _capacity * sizeof(SQUnsignedInteger));
    _entries = entries;
    _buckets = buckets;
    _owner_buckets = owners;
    _capacity = capacity;
    for(SQUnsignedInteger n = _epoch; n < _size; ++n) Index(n);
    return true;
}

bool SQJitWriteLog::BuildIndex()
{
    if(_buckets || _size <= INLINE_SIZE) return true;
    _buckets = (SQUnsignedInteger *)_allocate(2 * _capacity * sizeof(SQUnsignedInteger));
    if(!_buckets) return false;
    memset(_buckets, 0, 2 * _capacity * sizeof(SQUnsignedInteger));
    // The owner index, if present, is already populated. Rebuild both from
    // empty storage so Index never inserts an entry twice into either table.
    if(_owner_buckets) memset(_owner_buckets, 0, 2 * _capacity * sizeof(SQUnsignedInteger));
    for(SQUnsignedInteger n = _epoch; n < _size; ++n) Index(n);
    return true;
}

bool SQJitWriteLog::BuildOwnerIndex()
{
    if(_owner_buckets || _size <= INLINE_SIZE) return true;
    _owner_buckets = (SQUnsignedInteger *)_allocate(2 * _capacity * sizeof(SQUnsignedInteger));
    if(!_owner_buckets) return false;
    memset(_owner_buckets, 0, 2 * _capacity * sizeof(SQUnsignedInteger));
    if(_buckets) memset(_buckets, 0, 2 * _capacity * sizeof(SQUnsignedInteger));
    for(SQUnsignedInteger n = _epoch; n < _size; ++n) Index(n);
    return true;
}

SQJitWriteLog::Entry *SQJitWriteLog::Append(Kind kind, const SQObjectPtr &target, SQInteger index)
{
    if(Size() >= _limit || (_size == _capacity && !Grow())) return NULL;
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
    if(!CanRelease(old_value)) return false;
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
    _value_epoch = _value_size;
    _last_array = NULL;
    _last_index = -1;
    _ordered = true;
    _small_array = NULL;
    _small_indices = 0;
    if(_buckets) memset(_buckets, 0, 2 * _capacity * sizeof(SQUnsignedInteger));
    if(_owner_buckets) memset(_owner_buckets, 0, 2 * _capacity * sizeof(SQUnsignedInteger));
    if(_value_buckets) memset(_value_buckets, 0, 2 * _value_capacity * sizeof(SQUnsignedInteger));
    return true;
}

bool SQJitWriteLog::RecordMember(const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value)
{
    if(sq_type(target) != OT_TABLE && sq_type(target) != OT_INSTANCE) return false;
    if(!CanRelease(old_value)) return false;
    // Keep every distinct displaced owner until commit/rollback. Repeated
    // occurrences of an already retained owner add no lifetime protection;
    // collapsing those prevents swapping a few objects from growing the log
    // on every iteration. Raw tags/identity also preserve weak references.
    if(!EnsureIndex()) return false;
    bool owns = ISREFCOUNTED(sq_type(old_value));
    if(owns && !EnsureOwnerIndex()) return false;
    bool first = true;
    if(owns && !_owner_buckets) {
        // Small transactions already use bounded linear lookup. Discover both
        // owner retention and destination identity in that one pass instead
        // of repeating the search when a new owner needs an entry.
        for(SQUnsignedInteger n = _epoch; n < _size; ++n) {
            const Entry &e = _entries[n];
            if(e.kind != MEMBER || _refcounted(e.target) != _refcounted(target) ||
                sq_type(e.key) != sq_type(key) || _rawval(e.key) != _rawval(key)) continue;
            first = false;
            if(sq_type(e.old_value) == sq_type(old_value) && _rawval(e.old_value) == _rawval(old_value)) return true;
        }
    }
    else {
        if(owns ? ContainsMember<true>(target,key,old_value) :
            ContainsMember<false>(target,key,old_value)) return true;
        if(owns) first = !ContainsMember<false>(target,key,old_value);
    }
    Entry *e = Append(MEMBER, target, first ? 1 : 0);
    if(!e) return false;
    e->key = key;
    e->old_value = old_value;
    Index(_size - 1);
    return true;
}

bool SQJitWriteLog::RetainValue(const SQObjectPtr &value)
{
    if(!ISREFCOUNTED(sq_type(value))) return true;
    if(!EnsureValueIndex()) return false;
    return FindValue<false>(NULL, value) || AppendValue(NULL, value);
}

bool SQJitWriteLog::RecordStackSlot(SQObjectPtr *slot)
{
    if(!slot) return false;
    if(!EnsureValueIndex()) return false;
    const ValueEntry *saved = FindValue<true>(slot, *slot);
    if(saved) {
        // The first snapshot restores the slot. Additional displaced owners
        // only need lifetime pins, not another copy of its rollback address.
        if(sq_type(saved->value) == sq_type(*slot) &&
            _rawval(saved->value) == _rawval(*slot)) return true;
        return RetainValue(*slot);
    }
    return AppendValue(slot, *slot) != NULL;
}

inline SQUnsignedInteger SQJitWriteLog::ValueBucket(SQObjectPtr *slot, const SQObjectPtr &value) const
{
    uint64_t hash = slot ? (uint64_t)(uintptr_t)slot :
        (uint64_t)_rawval(value) ^ ((uint64_t)sq_type(value) * UINT64_C(0x9e3779b97f4a7c15));
    hash ^= hash >> 30;
    hash *= UINT64_C(0xbf58476d1ce4e5b9);
    hash ^= hash >> 27;
    return (SQUnsignedInteger)hash & (2 * _value_capacity - 1);
}

void SQJitWriteLog::IndexValue(SQUnsignedInteger entry)
{
    if(!_value_buckets) return;
    const ValueEntry &e = _values[entry];
    SQUnsignedInteger bucket = ValueBucket(e.slot, e.value);
    while(_value_buckets[bucket]) bucket = (bucket + 1) & (2 * _value_capacity - 1);
    _value_buckets[bucket] = entry + 1;
}

bool SQJitWriteLog::BuildValueIndex()
{
    if(_value_buckets || _value_size <= INLINE_SIZE) return true;
    _value_buckets = (SQUnsignedInteger *)_allocate(2 * _value_capacity * sizeof(SQUnsignedInteger));
    if(!_value_buckets) return false;
    memset(_value_buckets, 0, 2 * _value_capacity * sizeof(SQUnsignedInteger));
    for(SQUnsignedInteger n = _value_epoch; n < _value_size; ++n) IndexValue(n);
    return true;
}

template<bool Stack>
inline SQJitWriteLog::ValueEntry *SQJitWriteLog::FindValue(SQObjectPtr *slot, const SQObjectPtr &value)
{
    auto matches = [&](const ValueEntry &e) {
        return Stack ? e.slot == slot : (!e.slot &&
            sq_type(e.value) == sq_type(value) && _rawval(e.value) == _rawval(value));
    };
    if(_value_buckets) {
        SQUnsignedInteger bucket = ValueBucket(slot, value);
        while(_value_buckets[bucket]) {
            ValueEntry &e = _values[_value_buckets[bucket] - 1];
            if(matches(e)) return &e;
            bucket = (bucket + 1) & (2 * _value_capacity - 1);
        }
    }
    else for(SQUnsignedInteger n = _value_epoch; n < _value_size; ++n)
        if(matches(_values[n])) return &_values[n];
    return NULL;
}

bool SQJitWriteLog::GrowValues()
{
    SQUnsignedInteger capacity = 2 * _value_capacity;
    ValueEntry *values = (ValueEntry *)_allocate(capacity * sizeof(ValueEntry));
    if(!values) return false;
    SQUnsignedInteger *buckets = _value_buckets ?
        (SQUnsignedInteger *)_allocate(2 * capacity * sizeof(SQUnsignedInteger)) : NULL;
    if(_value_buckets && !buckets) {
        sq_vm_free(values, capacity * sizeof(ValueEntry));
        return false;
    }
    if(buckets) memset(buckets, 0, 2 * capacity * sizeof(SQUnsignedInteger));
    for(SQUnsignedInteger n = 0; n < _value_size; ++n) new (&values[n]) ValueEntry(_values[n]);
    for(SQUnsignedInteger n = 0; n < _value_size; ++n) _values[n].~ValueEntry();
    if(_values != InlineValues()) sq_vm_free(_values, _value_capacity * sizeof(ValueEntry));
    if(_value_buckets) sq_vm_free(_value_buckets, 2 * _value_capacity * sizeof(SQUnsignedInteger));
    _values = values; _value_buckets = buckets; _value_capacity = capacity;
    for(SQUnsignedInteger n = _value_epoch; n < _value_size; ++n) IndexValue(n);
    return true;
}

SQJitWriteLog::ValueEntry *SQJitWriteLog::AppendValue(SQObjectPtr *slot, const SQObjectPtr &value)
{
    if(Size() >= _limit || (_value_size == _value_capacity && !GrowValues())) return NULL;
    ValueEntry *entry = &_values[_value_size++];
    new (entry) ValueEntry;
    entry->value = value;
    entry->slot = slot;
    entry->heap_boundary = _size;
    IndexValue(_value_size - 1);
    return entry;
}

bool SQJitWriteLog::BeginStackWrite(SQObjectPtr *slot)
{
    if(_pending_slot || !RecordStackSlot(slot)) return false;
    _pending_value = *slot;
    _pending_slot = slot;
    return true;
}

bool SQJitWriteLog::FinishStackWrite(const SQObject &value, bool getter)
{
    if(!_pending_slot) return false;
    // value may alias a destination already published by a boxed helper.
    SQObjectPtr replacement(value);
    SQObjectPtr *slot = _pending_slot;
    *slot = _pending_value;
    _pending_slot = NULL;
    _pending_value.Null();
    if(getter) {
        SQObjectPtr *temporary = _context && _context->active_vm ?
            &_context->active_vm->temp_reg : &_temporary;
        if(!CanRelease(*temporary) || !RecordStackSlot(temporary)) return false;
        *temporary = replacement;
        _Swap(*slot, *temporary);
    }
    else {
        if(!CanRelease(*slot)) return false;
        *slot = replacement;
    }
    return true;
}

bool SQJitWriteLog::PublishStackWrite(SQObjectPtr *slot, const SQObject &value, bool getter)
{
    if(_pending_slot || !RecordStackSlot(slot)) return false;
    // Preserve source/destination/temporary aliases while checking the drop.
    // Unlike staged writes, the destination still holds its original owner.
    SQObjectPtr replacement(value);
    if(getter) {
        SQObjectPtr *temporary = _context && _context->active_vm ?
            &_context->active_vm->temp_reg : &_temporary;
        if(!CanRelease(*temporary) || !RecordStackSlot(temporary)) return false;
        *temporary = replacement;
        _Swap(*slot, *temporary);
    }
    else {
        if(!CanRelease(*slot)) return false;
        *slot = replacement;
    }
    return true;
}

template<bool Retain>
inline bool SQJitWriteLog::ContainsMember(const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value) const
{
    auto matches = [&](const Entry &e) {
        return e.kind == MEMBER && _refcounted(e.target) == _refcounted(target) &&
            sq_type(e.key) == sq_type(key) && _rawval(e.key) == _rawval(key) &&
            (!Retain || (sq_type(e.old_value) == sq_type(old_value) && _rawval(e.old_value) == _rawval(old_value)));
    };
    const SQUnsignedInteger *buckets = Retain ? _owner_buckets : _buckets;
    if(!buckets) {
        for(SQUnsignedInteger n = _epoch; n < _size; ++n) if(matches(_entries[n])) return true;
        return false;
    }
    SQUnsignedInteger bucket = Retain ? OwnerBucket(target, key, old_value) :
        Bucket(target, (SQInteger)_rawval(key));
    while(buckets[bucket]) {
        if(matches(_entries[buckets[bucket] - 1])) return true;
        bucket = (bucket + 1) & (2 * _capacity - 1);
    }
    return false;
}

void SQJitWriteLog::ReplayEntry(Entry &e)
{
    if(e.kind == ARRAY_INDEX) _array(e.target)->Set(e.index, e.old_value);
    else if(e.kind == ARRAY_SIZE) _array(e.target)->Resize(e.index);
    else if(sq_type(e.target) == OT_TABLE) _table(e.target)->Set(e.key, e.old_value);
    else _instance(e.target)->Set(e.key, e.old_value);
}

void SQJitWriteLog::Rollback()
{
    SQUnsignedInteger heap = _size;
    for(SQUnsignedInteger n = _value_size; n > 0; --n) {
        ValueEntry &e = _values[n - 1];
        while(heap > e.heap_boundary) ReplayEntry(_entries[--heap]);
        if(e.slot) *e.slot = e.value;
    }
    while(heap) ReplayEntry(_entries[--heap]);
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

void sqjit_write_log_init_frame(SQInteger *slot, void *storage, SQJitContext *context)
{
    *slot = (SQInteger)(intptr_t)new (storage) SQJitWriteLog(65536, sq_vm_malloc, context);
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
