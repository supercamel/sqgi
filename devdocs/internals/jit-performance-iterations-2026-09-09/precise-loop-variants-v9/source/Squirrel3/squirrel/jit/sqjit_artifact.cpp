/* Compiled-artifact lifetime is independent of execution policy. */
#include "sqpcheader.h"
#include "sqjit.h"
#include "sqjit_backend.h"
#include "sqjit_object_plan.h"

SQJitProto::SQJitProto()
{
    _entry = NULL;
    _loop_alternate_attempted = _loop_has_succeeded = _loop_prefer_alternate = false;
    _loop_header_ip = -1;
    _loop_exit_ip = -1;
    _loop_hot_count = 0;
    _loop_fail_count = 0;
    _loop_guard_fail_count = 0;
    _loop_guard_backoff_until = 0;
    _loop_guard_backoff_delay = 0;
    _loop_reject_count = 0;
    _loop_reject_next = 0;
    for(SQInteger n = 0; n < SQ_JIT_LOOP_REJECT_CACHE_SIZE; n++) {
        _loop_reject_headers[n] = -1;
    }
    _loop_trace_executed = false;
    _hot_count = 0;
    _fail_count = 0;
    _guard_fail_count = 0;
    _guard_backoff_until = 0;
    _guard_backoff_delay = 0;
    _version = 0;
    _eligibility = SQ_JIT_UNKNOWN;
}

SQJitNative::SQJitNative()
{
    _object_plan = NULL;
    _scalarized = false;
    _requires_vm_frame = false;
    _ninstructions = 0;
    _stack_live_slots = -1;
    _stack_storage_slots = -1;
    _native_kind = SQ_JIT_NATIVE_RAW_CODE;
    _base_slot = -1;
    _field_literal_index = -1;
    _array_index = -1;
    _index_slot = -1;
    _setter_count = 0;
    for(SQInteger n = 0; n < SQ_JIT_NATIVE_MAX_SETTERS; n++) {
        _setter_base_slots[n] = -1;
        _setter_field_literal_indices[n] = -1;
        _setter_array_indices[n] = -1;
        _setter_index_slots[n] = -1;
        _setter_value_slots[n] = -1;
    }
    _return_slot = -1;
    _return_shape = SQ_JIT_NATIVE_RETURN_UNKNOWN;
    _return_shape_class = NULL;
    _return_shape_field_index = -1;
    _native_trace_executed = false;

}

SQJitNative::~SQJitNative() { delete _object_plan; }

SQJitProto::~SQJitProto()
{
    if(_entry) {
        _entry->~SQJitNative();
        sq_vm_free(_entry, sizeof(SQJitNative));
    }
}
