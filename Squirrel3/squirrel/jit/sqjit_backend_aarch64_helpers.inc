static SQInteger sqjit_a64_helper_array_get_integer(SQObjectPtr *stack, SQInteger array_reg,
    SQInteger index, SQInteger *out)
{
    if(!stack || !out || array_reg < 0 || index < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_get_float(SQObjectPtr *stack, SQInteger array_reg,
    SQInteger index, SQFloat *out)
{
    if(!stack || !out || array_reg < 0 || index < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_get_array_ptr(SQObjectPtr *stack, SQInteger array_reg,
    SQInteger index, SQInteger *out)
{
    if(!stack || !out || array_reg < 0 || index < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_get_object(SQObjectPtr *stack, SQInteger array_reg,
    SQInteger index, SQInteger out_reg)
{
    if(!stack || array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE || index < 0 ||
        sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_get_integer_raw(SQInteger array_ptr,
    SQInteger index, SQInteger *out)
{
    if(!array_ptr || !out || index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(index >= (SQInteger)array->_values.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr &value = array->_values[index];
    if(sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_get_float_raw(SQInteger array_ptr,
    SQInteger index, SQFloat *out)
{
    if(!array_ptr || !out || index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(index >= (SQInteger)array->_values.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr &value = array->_values[index];
    if(sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_get_array_ptr_raw(SQInteger array_ptr,
    SQInteger index, SQInteger *out)
{
    if(!array_ptr || !out || index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(index >= (SQInteger)array->_values.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr &value = array->_values[index];
    if(sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_get_object_raw(SQInteger array_ptr,
    SQInteger index, SQObjectPtr *stack, SQInteger out_reg)
{
    if(!array_ptr || !stack || out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE ||
        index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(index >= (SQInteger)array->_values.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = array->_values[index];
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_math_unary(SQInteger op, const SQFloat *arg,
    SQFloat *out)
{
    if(!arg || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    switch((SQJitA64MathIntrinsic)op) {
        case SQ_JIT_A64_MATH_SQRT: *out = (SQFloat)sqrt(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_SIN: *out = (SQFloat)sin(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_COS: *out = (SQFloat)cos(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_ASIN: *out = (SQFloat)asin(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_ACOS: *out = (SQFloat)acos(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_LOG: *out = (SQFloat)log(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_LOG10: *out = (SQFloat)log10(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_TAN: *out = (SQFloat)tan(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_ATAN: *out = (SQFloat)atan(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_FLOOR: *out = (SQFloat)floor(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_CEIL: *out = (SQFloat)ceil(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_EXP: *out = (SQFloat)exp(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_FABS: *out = (SQFloat)fabs(*arg); return SQ_JIT_NATIVE_RETURNED;
        default: return SQ_JIT_NATIVE_GUARD_FAILED;
    }
}

static SQInteger sqjit_a64_helper_math_binary(SQInteger op, const SQFloat *left,
    const SQFloat *right, SQFloat *out)
{
    if(!left || !right || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    switch((SQJitA64MathIntrinsic)op) {
        case SQ_JIT_A64_MATH_ATAN2: *out = (SQFloat)atan2(*left, *right); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_POW: *out = (SQFloat)pow(*left, *right); return SQ_JIT_NATIVE_RETURNED;
        default: return SQ_JIT_NATIVE_GUARD_FAILED;
    }
}

static SQInteger sqjit_a64_helper_integer_to_float(SQInteger value, SQFloat *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQFloat)value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_float_to_integer(const SQFloat *value, SQInteger *out)
{
    if(!value || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    long double widened = (long double)*value;
#if defined(_SQ64)
    const long double min_integer = (long double)LLONG_MIN;
    const long double max_integer = (long double)LLONG_MAX;
#else
    const long double min_integer = (long double)INT_MIN;
    const long double max_integer = (long double)INT_MAX;
#endif
    if(!isfinite((double)*value) || widened < min_integer ||
        widened > max_integer) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)*value;
    return SQ_JIT_NATIVE_RETURNED;
}

static void sqjit_a64_helper_store_stack_integer(SQObjectPtr *stack, SQInteger slot,
    SQInteger value)
{
    if(stack && slot >= 0) {
        stack[slot] = value;
    }
}

static void sqjit_a64_helper_store_stack_bool(SQObjectPtr *stack, SQInteger slot,
    SQInteger value)
{
    if(stack && slot >= 0) {
        stack[slot] = value != 0;
    }
}

static void sqjit_a64_helper_store_stack_float(SQObjectPtr *stack, SQInteger slot,
    const SQFloat *value)
{
    if(stack && slot >= 0 && value) {
        stack[slot] = *value;
    }
}

static bool sqjit_a64_get_member_value(const SQObjectPtr &target,
    const SQObjectPtr *key, SQObjectPtr &value);
static bool sqjit_a64_set_member_value(const SQObjectPtr &target,
    const SQObjectPtr *key, const SQObjectPtr &value);
static bool sqjit_a64_object_ptr_to_value(SQInteger target_ptr,
    SQObjectType target_type, SQObjectPtr &value);
static bool sqjit_a64_value_to_object_ptr(const SQObjectPtr &value,
    SQObjectType expected, SQInteger *out);
static bool sqjit_a64_get_member_target_with_root(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQObjectPtr &target, SQObjectPtr &value);

static SQObjectPtr *sqjit_a64_outer_value_ptr(SQClosure *closure,
    SQInteger outer_index)
{
    if(!closure || !closure->_function || outer_index < 0 ||
        outer_index >= closure->_function->_noutervalues ||
        sq_type(closure->_outervalues[outer_index]) != OT_OUTER) {
        return NULL;
    }

    SQOuter *outer = _outer(closure->_outervalues[outer_index]);
    return outer ? outer->_valptr : NULL;
}

static SQInteger sqjit_a64_helper_outer_get_integer(SQClosure *closure,
    SQInteger outer_index, SQInteger *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_outer_get_float(SQClosure *closure,
    SQInteger outer_index, SQFloat *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_outer_get_array_ptr(SQClosure *closure,
    SQInteger outer_index, SQInteger expected_ptr, SQInteger *out)
{
    if(!expected_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_ARRAY ||
        (SQInteger)(intptr_t)_array(*value) != expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = expected_ptr;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_outer_get_object_ptr(SQClosure *closure,
    SQInteger outer_index, SQInteger expected_type, SQInteger expected_ptr,
    SQInteger *out)
{
    if(!expected_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    SQInteger object_ptr = 0;
    if(!value || !sqjit_a64_value_to_object_ptr(*value,
        (SQObjectType)expected_type, &object_ptr) ||
        object_ptr != expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = expected_ptr;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_load_nulls(SQObjectPtr *stack, SQInteger start,
    SQInteger count)
{
    if(!stack || !sqjit_a64_slot_range_valid(start, count)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    for(SQInteger n = 0; n < count; n++) {
        stack[start + n].Null();
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_new_array(SQObjectPtr *stack, SQClosure *closure,
    SQInteger target, SQInteger reserve, SQInteger *out)
{
    if(!stack || !closure || !out || target < 0 || target >= MAX_FUNC_STACKSIZE ||
        reserve < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = SQArray::Create(_opt_ss(closure), 0);
    if(!array) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    array->Reserve(reserve);
    stack[target] = array;
    *out = (SQInteger)(intptr_t)array;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_new_table(SQObjectPtr *stack, SQClosure *closure,
    SQInteger target, SQInteger reserve, SQInteger *out)
{
    if(!stack || !closure || !out || target < 0 || target >= MAX_FUNC_STACKSIZE ||
        reserve < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQTable *table = SQTable::Create(_opt_ss(closure), reserve);
    if(!table) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[target] = table;
    *out = (SQInteger)(intptr_t)table;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_store_stack_array_ptr(SQObjectPtr *stack,
    SQInteger slot, SQInteger array_ptr)
{
    if(!stack || slot < 0 || slot >= MAX_FUNC_STACKSIZE || !array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    stack[slot] = (SQArray *)(intptr_t)array_ptr;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_store_stack_object_ptr(SQObjectPtr *stack,
    SQInteger slot, SQInteger object_ptr, SQInteger object_type)
{
    if(!stack || slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(object_ptr, (SQObjectType)object_type, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[slot] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_ptr_new_slot_stack(SQInteger table_ptr,
    SQObjectPtr *stack, SQInteger key_reg, SQInteger value_reg)
{
    if(!table_ptr || !stack || key_reg < 0 || key_reg >= MAX_FUNC_STACKSIZE ||
        value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE ||
        sq_type(stack[key_reg]) == OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    ((SQTable *)(intptr_t)table_ptr)->NewSlot(stack[key_reg], stack[value_reg]);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_copy_stack_object(SQObjectPtr *stack,
    SQInteger dst, SQInteger src)
{
    if(!stack || dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
        src < 0 || src >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[dst] = stack[src];
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_integer(SQInteger array_ptr,
    SQInteger value)
{
    if(!array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_bool(SQInteger array_ptr,
    SQInteger value)
{
    if(!array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_float(SQInteger array_ptr,
    const SQFloat *value)
{
    if(!array_ptr || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_float_bits(SQInteger array_ptr,
    SQInteger bits)
{
    if(!array_ptr || sizeof(SQFloat) != sizeof(SQInt32)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInt32 raw_bits = (SQInt32)bits;
    SQFloat value;
    memcpy(&value, &raw_bits, sizeof(raw_bits));
    SQObjectPtr new_value(value);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_stack(SQInteger array_ptr,
    SQObjectPtr *stack, SQInteger value_reg)
{
    if(!array_ptr || !stack || value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    ((SQArray *)(intptr_t)array_ptr)->Append(stack[value_reg]);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_array_ptr(SQInteger array_ptr,
    SQInteger value_ptr)
{
    if(!array_ptr || !value_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value((SQArray *)(intptr_t)value_ptr);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_object_ptr(SQInteger array_ptr,
    SQInteger value_ptr, SQInteger value_type)
{
    if(!array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value;
    if(!sqjit_a64_object_ptr_to_value(value_ptr, (SQObjectType)value_type, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_literal(SQInteger array_ptr,
    const SQObjectPtr *value)
{
    if(!array_ptr || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    ((SQArray *)(intptr_t)array_ptr)->Append(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_call_native_closure(SQClosure *callee,
    SQObjectPtr *stack, SQInteger arg_base, SQInteger nargs, SQInteger out_slot)
{
    if(!callee || !stack || !sqjit_a64_call_args_valid(arg_base, nargs) ||
        out_slot < 0 || out_slot >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQFunctionProto *proto = callee->_function;
    if(!proto || proto->_bgenerator || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_nparameters != nargs ||
        !proto->_jit || !proto->_jit->_entry) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNative *native = (SQJitNative *)proto->_jit->_entry;
    if(!native || native->_ninstructions != proto->_ninstructions ||
        !native->_native_entry || native->_native_kind == SQ_JIT_NATIVE_SETTER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native->_native_entry;
    return fn(&stack[arg_base], &stack[out_slot], callee);
}

static SQInteger sqjit_a64_helper_store_out_array_ptr(SQInteger array_ptr,
    SQObjectPtr *out)
{
    if(!array_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = (SQArray *)(intptr_t)array_ptr;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_store_out_object_ptr(SQInteger object_ptr,
    SQInteger object_type, SQObjectPtr *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(object_ptr, (SQObjectType)object_type, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_store_out_stack_object(SQObjectPtr *stack,
    SQInteger reg, SQObjectPtr *out)
{
    if(!stack || !out || reg < 0 || reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = stack[reg];
    return SQ_JIT_NATIVE_RETURNED;
}

static SQJitA64WriteLog *sqjit_a64_write_log_from_slot(SQInteger *slot)
{
    if(!slot || !*slot) {
        return NULL;
    }
    return (SQJitA64WriteLog *)(intptr_t)*slot;
}

static SQJitA64WriteLog *sqjit_a64_write_log_ensure(SQInteger *slot)
{
    if(!slot) {
        return NULL;
    }
    SQJitA64WriteLog *log = sqjit_a64_write_log_from_slot(slot);
    if(log) {
        return log;
    }

    void *mem = sq_vm_malloc(sizeof(SQJitA64WriteLog));
    if(!mem) {
        return NULL;
    }
    log = new (mem) SQJitA64WriteLog;
    *slot = (SQInteger)(intptr_t)log;
    return log;
}

static SQInteger sqjit_a64_write_log_target_index(SQJitA64WriteLog *log,
    const SQObjectPtr &target)
{
    if(!log) {
        return -1;
    }
    SQObjectType target_type = sq_type(target);
    SQRawObjectVal target_raw = _rawval(target);
    if(log->last_target_index >= 0 &&
        log->last_target_index < (SQInteger)log->targets.size() &&
        log->last_target_type == target_type &&
        log->last_target_raw == target_raw) {
        return log->last_target_index;
    }
    for(SQUnsignedInteger n = 0; n < log->targets.size(); n++) {
        if(sq_type(log->targets[n]) == target_type &&
            _rawval(log->targets[n]) == target_raw) {
            log->last_target_type = target_type;
            log->last_target_raw = target_raw;
            log->last_target_index = (SQInteger)n;
            return (SQInteger)n;
        }
    }
    SQInteger index = (SQInteger)log->targets.size();
    log->targets.push_back(target);
    log->last_target_type = target_type;
    log->last_target_raw = target_raw;
    log->last_target_index = index;
    return index;
}

static void sqjit_a64_write_log_free(SQInteger *slot)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_from_slot(slot);
    if(!log) {
        return;
    }

    log->~SQJitA64WriteLog();
    sq_vm_free(log, sizeof(SQJitA64WriteLog));
    *slot = 0;
}

static bool sqjit_a64_write_log_has_array_index(SQJitA64WriteLog *log,
    SQInteger target_index, SQInteger index)
{
    if(!log || target_index < 0) {
        return false;
    }
    for(SQUnsignedInteger n = 0; n < log->entries.size(); n++) {
        const SQJitA64WriteLogEntry &entry = log->entries[n];
        if(entry.kind == SQ_JIT_A64_WRITE_ARRAY_INDEX &&
            entry.target_index == target_index &&
            entry.index == index) {
            return true;
        }
    }
    return false;
}

static SQInteger sqjit_a64_write_log_record_array_current(SQInteger *slot,
    const SQObjectPtr &target, SQArray *array, SQInteger index)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_ensure(slot);
    if(!log || !array) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQInteger target_index = sqjit_a64_write_log_target_index(log, target);
    if(target_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    // Rollback needs the entry value once; repeated writes to the same slot
    // must not grow the log or replace the original value.
    if(sqjit_a64_write_log_has_array_index(log, target_index, index)) {
        return SQ_JIT_NATIVE_RETURNED;
    }

    SQObjectPtr old_value;
    if(!array->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitA64WriteLogEntry entry;
    entry.kind = SQ_JIT_A64_WRITE_ARRAY_INDEX;
    entry.target_index = target_index;
    entry.key.Null();
    entry.old_value = old_value;
    entry.index = index;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_write_log_record_array_size(SQInteger *slot,
    const SQObjectPtr &target, SQInteger old_size)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQInteger target_index = sqjit_a64_write_log_target_index(log, target);
    if(target_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitA64WriteLogEntry entry;
    entry.kind = SQ_JIT_A64_WRITE_ARRAY_SIZE;
    entry.target_index = target_index;
    entry.key.Null();
    entry.old_value.Null();
    entry.index = old_size;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_write_log_record_member(SQInteger *slot,
    const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQInteger target_index = sqjit_a64_write_log_target_index(log, target);
    if(target_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitA64WriteLogEntry entry;
    entry.kind = SQ_JIT_A64_WRITE_MEMBER_VALUE;
    entry.target_index = target_index;
    entry.key = key;
    entry.old_value = old_value;
    entry.index = 0;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static void sqjit_a64_helper_write_log_commit(SQInteger *slot)
{
    sqjit_a64_write_log_free(slot);
}

static void sqjit_a64_helper_write_log_rollback(SQInteger *slot)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_from_slot(slot);
    if(!log) {
        return;
    }

    SQUnsignedInteger count = log->entries.size();
    while(count > 0) {
        SQJitA64WriteLogEntry &entry = log->entries[--count];
        if(entry.target_index < 0 ||
            entry.target_index >= (SQInteger)log->targets.size()) {
            continue;
        }
        SQObjectPtr &target = log->targets[entry.target_index];
        if(entry.kind == SQ_JIT_A64_WRITE_ARRAY_INDEX && sq_type(target) == OT_ARRAY) {
            _array(target)->Set(entry.index, entry.old_value);
        }
        else if(entry.kind == SQ_JIT_A64_WRITE_ARRAY_SIZE && sq_type(target) == OT_ARRAY) {
            _array(target)->Resize(entry.index);
        }
        else if(entry.kind == SQ_JIT_A64_WRITE_MEMBER_VALUE) {
            sqjit_a64_set_member_value(target, &entry.key, entry.old_value);
        }
    }

    sqjit_a64_write_log_free(slot);
}

static SQInteger sqjit_a64_helper_array_set_integer_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger value)
{
    if(!log_slot || !stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = _array(stack[array_reg]);
    if(sqjit_a64_write_log_record_array_current(log_slot, stack[array_reg],
        array, index) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_set_bool_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger value)
{
    if(!log_slot || !stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = _array(stack[array_reg]);
    if(sqjit_a64_write_log_record_array_current(log_slot, stack[array_reg],
        array, index) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_set_float_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger array_reg, SQInteger index, const SQFloat *value)
{
    if(!log_slot || !stack || !value || array_reg < 0 ||
        sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = _array(stack[array_reg]);
    if(sqjit_a64_write_log_record_array_current(log_slot, stack[array_reg],
        array, index) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_set_integer_logged(SQInteger *log_slot,
    SQInteger array_ptr, SQInteger index, SQInteger value)
{
    if(!log_slot || !array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    if(sqjit_a64_write_log_record_array_current(log_slot, target, array,
        index) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_set_bool_logged(SQInteger *log_slot,
    SQInteger array_ptr, SQInteger index, SQInteger value)
{
    if(!log_slot || !array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    if(sqjit_a64_write_log_record_array_current(log_slot, target, array,
        index) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_set_float_logged(SQInteger *log_slot,
    SQInteger array_ptr, SQInteger index, const SQFloat *value)
{
    if(!log_slot || !array_ptr || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    if(sqjit_a64_write_log_record_array_current(log_slot, target, array,
        index) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_set_integer_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger base_reg, const SQObjectPtr *key,
    SQInteger value, const SQObjectPtr *root)
{
    if(!log_slot || !stack || !key || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_get_member_target_with_root(stack, base_reg, key, root,
        target, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_set_bool_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger base_reg, const SQObjectPtr *key,
    SQInteger value, const SQObjectPtr *root)
{
    if(!log_slot || !stack || !key || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_get_member_target_with_root(stack, base_reg, key, root,
        target, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_set_float_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger base_reg, const SQObjectPtr *key,
    const SQFloat *value, const SQObjectPtr *root)
{
    if(!log_slot || !stack || !key || !value || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_get_member_target_with_root(stack, base_reg, key, root,
        target, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_set_integer_logged(
    SQInteger *log_slot, SQInteger base_ptr, SQInteger base_type,
    const SQObjectPtr *key, SQInteger value)
{
    if(!log_slot || !key) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_object_ptr_to_value(base_ptr, (SQObjectType)base_type,
        target) ||
        !sqjit_a64_get_member_value(target, key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_set_bool_logged(
    SQInteger *log_slot, SQInteger base_ptr, SQInteger base_type,
    const SQObjectPtr *key, SQInteger value)
{
    if(!log_slot || !key) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_object_ptr_to_value(base_ptr, (SQObjectType)base_type,
        target) ||
        !sqjit_a64_get_member_value(target, key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_set_float_logged(
    SQInteger *log_slot, SQInteger base_ptr, SQInteger base_type,
    const SQObjectPtr *key, const SQFloat *value)
{
    if(!log_slot || !key || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_object_ptr_to_value(base_ptr, (SQObjectType)base_type,
        target) ||
        !sqjit_a64_get_member_value(target, key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_instance_field_set_integer_logged(
    SQInteger *log_slot, SQInteger instance_ptr, SQClass *expected_class,
    const SQObjectPtr *key, SQInteger field_index, SQInteger value)
{
    if(!log_slot || !instance_ptr || !expected_class || !key ||
        field_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInstance *inst = (SQInstance *)(intptr_t)instance_ptr;
    if(inst->_class != expected_class ||
        field_index >= (SQInteger)expected_class->_defaultvalues.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target(inst);
    SQObjectPtr old_value(_realval(inst->_values[field_index]));
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    inst->_values[field_index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_instance_field_set_bool_logged(
    SQInteger *log_slot, SQInteger instance_ptr, SQClass *expected_class,
    const SQObjectPtr *key, SQInteger field_index, SQInteger value)
{
    if(!log_slot || !instance_ptr || !expected_class || !key ||
        field_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInstance *inst = (SQInstance *)(intptr_t)instance_ptr;
    if(inst->_class != expected_class ||
        field_index >= (SQInteger)expected_class->_defaultvalues.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target(inst);
    SQObjectPtr old_value(_realval(inst->_values[field_index]));
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    inst->_values[field_index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_instance_field_set_float_logged(
    SQInteger *log_slot, SQInteger instance_ptr, SQClass *expected_class,
    const SQObjectPtr *key, SQInteger field_index, const SQFloat *value)
{
    if(!log_slot || !instance_ptr || !expected_class || !key ||
        field_index < 0 || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInstance *inst = (SQInstance *)(intptr_t)instance_ptr;
    if(inst->_class != expected_class ||
        field_index >= (SQInteger)expected_class->_defaultvalues.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target(inst);
    SQObjectPtr old_value(_realval(inst->_values[field_index]));
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    inst->_values[field_index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQObjectType sqjit_a64_observed_array_value_type(SQObjectPtr *entry_stack,
    SQInteger array_reg, SQInteger index, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }
    if(!entry_stack || array_reg < 0 || index < 0 || sq_type(entry_stack[array_reg]) != OT_ARRAY) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!_array(entry_stack[array_reg])->Get(index, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), object_ptr_out);
    }
    return sq_type(value);
}

static SQObjectType sqjit_a64_observed_array_ptr_value_type(SQArray *array,
    SQInteger index, SQArray **array_out, SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }
    if(!array || index < 0) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!array->Get(index, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), object_ptr_out);
    }
    return sq_type(value);
}

static bool sqjit_a64_get_member_value(const SQObjectPtr &target,
    const SQObjectPtr *key, SQObjectPtr &value)
{
    if(!key) {
        return false;
    }
    if(sq_type(target) == OT_TABLE) {
        return _table(target)->Get(*key, value);
    }
    if(sq_type(target) == OT_INSTANCE) {
        return _instance(target)->Get(*key, value);
    }
    if(sq_type(target) == OT_CLASS) {
        return _class(target)->Get(*key, value);
    }
    return false;
}

static bool sqjit_a64_get_member_ptr_value(SQInteger target_ptr, SQObjectType target_type,
    const SQObjectPtr *key, SQObjectPtr &value)
{
    if(!target_ptr || !key) {
        return false;
    }
    if(target_type == OT_TABLE) {
        return ((SQTable *)(intptr_t)target_ptr)->Get(*key, value);
    }
    if(target_type == OT_INSTANCE) {
        return ((SQInstance *)(intptr_t)target_ptr)->Get(*key, value);
    }
    if(target_type == OT_CLASS) {
        return ((SQClass *)(intptr_t)target_ptr)->Get(*key, value);
    }
    return false;
}

static bool sqjit_a64_set_member_value(const SQObjectPtr &target,
    const SQObjectPtr *key, const SQObjectPtr &value)
{
    if(!key) {
        return false;
    }
    if(sq_type(target) == OT_TABLE) {
        return _table(target)->Set(*key, value);
    }
    if(sq_type(target) == OT_INSTANCE) {
        return _instance(target)->Set(*key, value);
    }
    return false;
}

static bool sqjit_a64_object_ptr_to_value(SQInteger target_ptr,
    SQObjectType target_type, SQObjectPtr &value)
{
    if(!target_ptr) {
        return false;
    }
    switch(target_type) {
        case OT_TABLE:
            value = SQObjectPtr((SQTable *)(intptr_t)target_ptr);
            return true;
        case OT_INSTANCE:
            value = SQObjectPtr((SQInstance *)(intptr_t)target_ptr);
            return true;
        case OT_CLASS:
            value = SQObjectPtr((SQClass *)(intptr_t)target_ptr);
            return true;
        case OT_CLOSURE:
            value = SQObjectPtr((SQClosure *)(intptr_t)target_ptr);
            return true;
        case OT_STRING:
            value = SQObjectPtr((SQString *)(intptr_t)target_ptr);
            return true;
        default:
            return false;
    }
}

static bool sqjit_a64_get_member_value_with_root(SQObjectPtr *stack, SQInteger base_reg,
    const SQObjectPtr *key, const SQObjectPtr *root, SQObjectPtr &value)
{
    if(!stack || base_reg < 0 || !key) {
        return false;
    }
    if(sqjit_a64_get_member_value(stack[base_reg], key, value)) {
        return true;
    }
    if(base_reg == 0 && root && sq_type(*root) != OT_NULL) {
        return sqjit_a64_get_member_value(*root, key, value);
    }
    return false;
}

static bool sqjit_a64_get_member_target_with_root(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQObjectPtr &target, SQObjectPtr &value)
{
    if(!stack || base_reg < 0 || !key) {
        return false;
    }
    if(sqjit_a64_get_member_value(stack[base_reg], key, value)) {
        target = stack[base_reg];
        return true;
    }
    if(base_reg == 0 && root && sq_type(*root) != OT_NULL &&
        sqjit_a64_get_member_value(*root, key, value)) {
        target = *root;
        return true;
    }
    return false;
}

static bool sqjit_a64_value_to_object_ptr(const SQObjectPtr &value, SQObjectType expected,
    SQInteger *out)
{
    if(!out || sq_type(value) != expected) {
        return false;
    }
    switch(expected) {
        case OT_TABLE:
            *out = (SQInteger)(intptr_t)_table(value);
            return true;
        case OT_INSTANCE:
            *out = (SQInteger)(intptr_t)_instance(value);
            return true;
        case OT_CLASS:
            *out = (SQInteger)(intptr_t)_class(value);
            return true;
        case OT_CLOSURE:
            *out = (SQInteger)(intptr_t)_closure(value);
            return true;
        case OT_STRING:
            *out = (SQInteger)(intptr_t)_string(value);
            return true;
        default:
            return false;
    }
}

static bool sqjit_a64_class_field_index(SQClass *klass, const SQObjectPtr *key,
    SQInteger *field_index)
{
    if(!klass || !key || !field_index) {
        return false;
    }
    SQObjectPtr member;
    if(!klass->_members || !klass->_members->Get(*key, member) || !_isfield(member)) {
        return false;
    }
    SQInteger index = _member_idx(member);
    if(index < 0 || index >= (SQInteger)klass->_defaultvalues.size()) {
        return false;
    }
    *field_index = index;
    return true;
}

static bool sqjit_a64_observed_instance_field(SQInstance *inst,
    const SQObjectPtr *key, SQJitA64InstanceFieldObservation *out)
{
    if(!inst || !inst->_class || !key || !out) {
        return false;
    }

    SQInteger field_index = -1;
    if(!sqjit_a64_class_field_index(inst->_class, key, &field_index)) {
        return false;
    }

    SQObjectPtr value(_realval(inst->_values[field_index]));
    out->klass = inst->_class;
    out->field_index = field_index;
    out->class_disp = (SQInteger)((char *)&inst->_class - (char *)inst);
    out->value_disp = (SQInteger)((char *)&inst->_values[field_index] - (char *)inst);
    out->value_type = sq_type(value);
    out->array_value = sq_type(value) == OT_ARRAY ? _array(value) : NULL;
    out->object_ptr_value = 0;
    if(sqjit_a64_type_is_object_ptr(sq_type(value))) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), &out->object_ptr_value);
    }
    return true;
}

static bool sqjit_a64_observed_stack_instance_field(SQObjectPtr *entry_stack,
    SQInteger stack_reg, const SQObjectPtr *key,
    SQJitA64InstanceFieldObservation *out)
{
    if(!entry_stack || stack_reg < 0 || sq_type(entry_stack[stack_reg]) != OT_INSTANCE) {
        return false;
    }
    return sqjit_a64_observed_instance_field(_instance(entry_stack[stack_reg]),
        key, out);
}

static bool sqjit_a64_observed_object_ptr_instance_field(SQInteger object_ptr,
    SQObjectType object_type, const SQObjectPtr *key,
    SQJitA64InstanceFieldObservation *out)
{
    if(!object_ptr || object_type != OT_INSTANCE) {
        return false;
    }
    return sqjit_a64_observed_instance_field((SQInstance *)(intptr_t)object_ptr,
        key, out);
}

static SQObjectType sqjit_a64_observed_outer_value_type(SQClosure *closure,
    SQInteger outer_index, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    if(!value) {
        return OT_NULL;
    }
    if(sq_type(*value) == OT_ARRAY && array_out) {
        *array_out = _array(*value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(*value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(*value, sq_type(*value), object_ptr_out);
    }
    return sq_type(*value);
}

static bool sqjit_a64_math_intrinsic_from_name(const SQChar *name,
    SQJitA64MathIntrinsic *intrinsic, SQInteger *nargs)
{
    if(!name || !intrinsic || !nargs) {
        return false;
    }

    struct MathName {
        const SQChar *name;
        SQJitA64MathIntrinsic intrinsic;
        SQInteger nargs;
    };
    static const MathName math_names[] = {
        { _SC("sqrt"), SQ_JIT_A64_MATH_SQRT, 1 },
        { _SC("sin"), SQ_JIT_A64_MATH_SIN, 1 },
        { _SC("cos"), SQ_JIT_A64_MATH_COS, 1 },
        { _SC("asin"), SQ_JIT_A64_MATH_ASIN, 1 },
        { _SC("acos"), SQ_JIT_A64_MATH_ACOS, 1 },
        { _SC("log"), SQ_JIT_A64_MATH_LOG, 1 },
        { _SC("log10"), SQ_JIT_A64_MATH_LOG10, 1 },
        { _SC("tan"), SQ_JIT_A64_MATH_TAN, 1 },
        { _SC("atan"), SQ_JIT_A64_MATH_ATAN, 1 },
        { _SC("floor"), SQ_JIT_A64_MATH_FLOOR, 1 },
        { _SC("ceil"), SQ_JIT_A64_MATH_CEIL, 1 },
        { _SC("exp"), SQ_JIT_A64_MATH_EXP, 1 },
        { _SC("fabs"), SQ_JIT_A64_MATH_FABS, 1 },
        { _SC("atan2"), SQ_JIT_A64_MATH_ATAN2, 2 },
        { _SC("pow"), SQ_JIT_A64_MATH_POW, 2 },
        { NULL, SQ_JIT_A64_MATH_NONE, 0 }
    };

    for(SQInteger i = 0; math_names[i].name; i++) {
        if(scstrcmp(name, math_names[i].name) == 0) {
            *intrinsic = math_names[i].intrinsic;
            *nargs = math_names[i].nargs;
            return true;
        }
    }
    return false;
}

static bool sqjit_a64_math_intrinsic_from_native(SQNativeClosure *closure,
    SQJitA64MathIntrinsic *intrinsic, SQInteger *nargs)
{
    if(!closure || sq_type(closure->_name) != OT_STRING) {
        return false;
    }
    return sqjit_a64_math_intrinsic_from_name(_stringval(closure->_name),
        intrinsic, nargs);
}

static SQInteger sqjit_a64_helper_closure_slot_guard(SQObjectPtr *stack,
    SQInteger closure_reg, SQClosure *expected)
{
    if(!stack || closure_reg < 0 || !expected ||
        sq_type(stack[closure_reg]) != OT_CLOSURE ||
        _closure(stack[closure_reg]) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_closure_guard(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQClosure *expected,
    const SQObjectPtr *root)
{
    if(!stack || base_reg < 0 || !key || !expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value) ||
        sq_type(value) != OT_CLOSURE ||
        _closure(value) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_member_closure_guard(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQClosure *expected)
{
    if(!key || !expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_CLOSURE ||
        _closure(value) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_native_closure_guard(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQNativeClosure *expected,
    const SQObjectPtr *root)
{
    if(!stack || base_reg < 0 || !key || !expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value) ||
        sq_type(value) != OT_NATIVECLOSURE ||
        _nativeclosure(value) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_member_native_closure_guard(
    SQInteger base_ptr, SQInteger base_type, const SQObjectPtr *key,
    SQNativeClosure *expected)
{
    if(!key || !expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_NATIVECLOSURE ||
        _nativeclosure(value) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_object_ptr_guard(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQInteger expected_type,
    SQInteger expected_ptr, const SQObjectPtr *root)
{
    if(!stack || base_reg < 0 || !key || !expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    SQInteger actual_ptr = 0;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type,
        &actual_ptr) ||
        actual_ptr != expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_member_object_ptr_guard(
    SQInteger base_ptr, SQInteger base_type, const SQObjectPtr *key,
    SQInteger expected_type, SQInteger expected_ptr)
{
    if(!key || !expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    SQInteger actual_ptr = 0;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type,
        &actual_ptr) ||
        actual_ptr != expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_exists_guard(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQInteger expected,
    const SQObjectPtr *root)
{
    if(!stack || base_reg < 0 || !key) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    bool exists = sqjit_a64_get_member_value_with_root(stack, base_reg, key,
        root, value);
    return exists == (expected != 0) ? SQ_JIT_NATIVE_RETURNED :
        SQ_JIT_NATIVE_GUARD_FAILED;
}

static SQInteger sqjit_a64_helper_object_ptr_member_exists_guard(
    SQInteger base_ptr, SQInteger base_type, const SQObjectPtr *key,
    SQInteger expected)
{
    if(!key) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    bool exists = sqjit_a64_get_member_ptr_value(base_ptr,
        (SQObjectType)base_type, key, value);
    return exists == (expected != 0) ? SQ_JIT_NATIVE_RETURNED :
        SQ_JIT_NATIVE_GUARD_FAILED;
}

static bool sqjit_a64_constructor_looks_like_array_field_pack(SQClosure *closure)
{
    SQFunctionProto *proto = closure ? closure->_function : NULL;
    if(!proto || proto->_bgenerator || proto->_varparams ||
        proto->_nparameters != 5 || proto->_ndefaultparams != 4) {
        return false;
    }

    bool has_typeof = false;
    bool has_new_array = false;
    bool has_append_array = false;
    bool has_set = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        switch(inst.op) {
        case _OP_TYPEOF:
            has_typeof = true;
            break;
        case _OP_NEWOBJ:
            if(inst._arg3 == NOT_ARRAY) {
                has_new_array = true;
            }
            break;
        case _OP_APPENDARRAY:
            has_append_array = true;
            break;
        case _OP_SET:
            has_set = true;
            break;
        default:
            break;
        }
    }
    return has_typeof && has_new_array && has_append_array && has_set;
}

static SQInteger sqjit_a64_next_effective_ip(SQFunctionProto *proto,
    SQInteger ip)
{
    if(!proto) {
        return -1;
    }
    for(SQInteger n = ip; n < proto->_ninstructions; n++) {
        if(proto->_instructions[n].op != _OP_LINE) {
            return n;
        }
    }
    return -1;
}

static bool sqjit_a64_constructor_looks_like_simple_array_field_pack(
    SQClass *klass, SQClosure *closure, SQInteger *field_index_out,
    SQInteger *pack_count_out)
{
    SQFunctionProto *proto = closure ? closure->_function : NULL;
    if(!klass || !proto || !field_index_out || !pack_count_out ||
        proto->_bgenerator || proto->_varparams || proto->_nparameters < 2 ||
        proto->_nparameters > 5) {
        return false;
    }

    SQInteger pack_count = proto->_nparameters - 1;
    SQInteger ip = sqjit_a64_next_effective_ip(proto, 0);
    if(ip < 0 || proto->_instructions[ip].op != _OP_LOAD) {
        return false;
    }
    const SQInstruction &load = proto->_instructions[ip];
    if(load._arg0 < 0 || load._arg0 >= MAX_FUNC_STACKSIZE ||
        load._arg1 < 0 || load._arg1 >= proto->_nliterals ||
        sq_type(proto->_literals[load._arg1]) != OT_STRING) {
        return false;
    }

    SQInteger field_index = -1;
    if(!sqjit_a64_class_field_index(klass, &proto->_literals[load._arg1],
        &field_index)) {
        return false;
    }

    ip = sqjit_a64_next_effective_ip(proto, ip + 1);
    if(ip < 0 || proto->_instructions[ip].op != _OP_NEWOBJ) {
        return false;
    }
    const SQInstruction &new_array = proto->_instructions[ip];
    SQInteger array_slot = new_array._arg0;
    if(array_slot < 0 || array_slot >= MAX_FUNC_STACKSIZE ||
        new_array._arg1 != pack_count || new_array._arg3 != NOT_ARRAY) {
        return false;
    }

    for(SQInteger n = 0; n < pack_count; n++) {
        ip = sqjit_a64_next_effective_ip(proto, ip + 1);
        if(ip < 0 || proto->_instructions[ip].op != _OP_APPENDARRAY) {
            return false;
        }
        const SQInstruction &append = proto->_instructions[ip];
        if(append._arg0 != array_slot || append._arg1 != n + 1 ||
            append._arg2 != AAT_STACK) {
            return false;
        }
    }

    ip = sqjit_a64_next_effective_ip(proto, ip + 1);
    if(ip < 0 || proto->_instructions[ip].op != _OP_SET) {
        return false;
    }
    const SQInstruction &set = proto->_instructions[ip];
    if(set._arg0 != SQ_JIT_A64_NO_RESULT_SLOT || set._arg1 != 0 ||
        set._arg2 != load._arg0 || set._arg3 != array_slot) {
        return false;
    }

    ip = sqjit_a64_next_effective_ip(proto, ip + 1);
    if(ip < 0 || proto->_instructions[ip].op != _OP_RETURN) {
        return false;
    }
    ip = sqjit_a64_next_effective_ip(proto, ip + 1);
    if(ip >= 0) {
        return false;
    }

    *field_index_out = field_index;
    *pack_count_out = pack_count;
    return true;
}

static bool sqjit_a64_ctor_pack_mode_valid(SQObjectPtr *stack, SQInteger arg_base,
    SQInteger nargs, SQInteger mode, SQInteger *pack_count)
{
    if(!stack || !pack_count || !sqjit_a64_call_args_valid(arg_base, nargs)) {
        return false;
    }
    *pack_count = 0;
    switch(mode) {
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_DEFAULT3:
        *pack_count = 3;
        return nargs == 1;
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY:
        return nargs == 2 && sq_type(stack[arg_base + 1]) == OT_ARRAY;
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1:
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK2:
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK3:
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK4:
        *pack_count = mode - SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1 + 1;
        if(nargs != *pack_count + 1 || sq_type(stack[arg_base + 1]) == OT_ARRAY) {
            return false;
        }
        for(SQInteger n = 0; n < *pack_count; n++) {
            if(sq_type(stack[arg_base + 1 + n]) == OT_NULL) {
                return false;
            }
        }
        return true;
    default:
        return false;
    }
}

static SQInteger sqjit_a64_helper_call_array_field_constructor(SQClass *klass,
    SQClosure *expected_ctor, SQObjectPtr *stack, SQInteger arg_base,
    SQInteger nargs, SQInteger out_slot, SQInteger field_index, SQInteger mode)
{
    if(!klass || !expected_ctor || !stack ||
        !sqjit_a64_call_args_valid(arg_base, nargs) || out_slot < 0 ||
        out_slot >= MAX_FUNC_STACKSIZE || field_index < 0 ||
        field_index >= (SQInteger)klass->_defaultvalues.size() ||
        klass->_defaultvalues.size() != 1 ||
        sq_type(klass->_defaultvalues[0].val) != OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr constructor;
    if(!klass->GetConstructor(constructor) || sq_type(constructor) != OT_CLOSURE ||
        _closure(constructor) != expected_ctor) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInteger pack_count = 0;
    if(!sqjit_a64_ctor_pack_mode_valid(stack, arg_base, nargs, mode, &pack_count)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = NULL;
    if(mode == SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY) {
        array = _array(stack[arg_base + 1])->Clone();
    }
    else {
        array = SQArray::Create(_opt_ss(klass), 0);
        if(array) {
            array->Reserve(pack_count);
        }
    }
    if(!array) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    if(mode == SQ_JIT_A64_CTOR_ARRAY_FIELD_DEFAULT3) {
        SQObjectPtr zero((SQFloat)0);
        array->Append(zero);
        array->Append(zero);
        array->Append(zero);
    }
    else if(mode != SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY) {
        for(SQInteger n = 0; n < pack_count; n++) {
            array->Append(stack[arg_base + 1 + n]);
        }
    }

    SQInstance *raw_instance = klass->CreateInstance();
    if(!raw_instance) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr instance(raw_instance);
    SQObjectPtr values(array);
    raw_instance->_values[field_index] = values;
    stack[arg_base] = instance;
    stack[out_slot] = instance;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_prev_effective_ip(SQFunctionProto *proto,
    SQInteger ip)
{
    if(!proto) {
        return -1;
    }
    for(SQInteger n = ip - 1; n >= 0; n--) {
        if(proto->_instructions[n].op != _OP_LINE) {
            return n;
        }
    }
    return -1;
}

static bool sqjit_a64_constructor_tail_is_scalar_field_pack(SQClass *klass,
    SQClosure **ctor_out, SQInteger nargs, SQInteger *field_count_out)
{
    if(!klass || !ctor_out || !field_count_out || nargs < 2 ||
        nargs > MAX_FUNC_STACKSIZE) {
        return false;
    }
    *ctor_out = NULL;
    *field_count_out = 0;

    SQInteger field_count = (SQInteger)klass->_defaultvalues.size();
    if(field_count <= 0 || field_count > 16 || field_count != nargs - 1) {
        return false;
    }
    SQObjectPtr constructor;
    if(!klass->GetConstructor(constructor) || sq_type(constructor) != OT_CLOSURE) {
        return false;
    }
    SQClosure *ctor = _closure(constructor);
    SQFunctionProto *proto = ctor ? ctor->_function : NULL;
    if(!proto || proto->_bgenerator || proto->_varparams ||
        proto->_nparameters != nargs || proto->_ninstructions <= 0) {
        return false;
    }

    bool branch_target[SQ_JIT_A64_IP_TABLE_SIZE];
    for(SQInteger n = 0; n < SQ_JIT_A64_IP_TABLE_SIZE; n++) {
        branch_target[n] = false;
    }
    for(SQInteger ip = 0; ip < proto->_ninstructions && ip < SQ_JIT_A64_IP_TABLE_SIZE; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op == _OP_JMP || inst.op == _OP_JZ || inst.op == _OP_JCMP) {
            SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
            if(target_ip >= 0 && target_ip < SQ_JIT_A64_IP_TABLE_SIZE) {
                branch_target[target_ip] = true;
            }
        }
    }

    SQInteger return_ip = sqjit_a64_prev_effective_ip(proto,
        proto->_ninstructions);
    if(return_ip < 0 || proto->_instructions[return_ip].op != _OP_RETURN) {
        return false;
    }

    bool seen[16];
    for(SQInteger n = 0; n < 16; n++) {
        seen[n] = false;
    }

    SQInteger ip = sqjit_a64_prev_effective_ip(proto, return_ip);
    SQInteger tail_start = -1;
    for(SQInteger n = 0; n < field_count; n++) {
        if(ip < 0 || proto->_instructions[ip].op != _OP_SET) {
            return false;
        }
        const SQInstruction &set = proto->_instructions[ip];
        if(set._arg0 != SQ_JIT_A64_NO_RESULT_SLOT || set._arg1 != 0 ||
            set._arg2 < 0 || set._arg2 >= MAX_FUNC_STACKSIZE ||
            set._arg3 < 1 || set._arg3 > field_count) {
            return false;
        }

        SQInteger load_ip = sqjit_a64_prev_effective_ip(proto, ip);
        if(load_ip < 0 || proto->_instructions[load_ip].op != _OP_LOAD) {
            return false;
        }
        const SQInstruction &load = proto->_instructions[load_ip];
        if(load._arg0 != set._arg2 || load._arg1 < 0 ||
            load._arg1 >= proto->_nliterals ||
            sq_type(proto->_literals[load._arg1]) != OT_STRING) {
            return false;
        }

        SQInteger field_index = -1;
        if(!sqjit_a64_class_field_index(klass, &proto->_literals[load._arg1],
            &field_index) ||
            field_index < 0 || field_index >= field_count ||
            field_index + 1 != set._arg3 || seen[field_index]) {
            return false;
        }
        seen[field_index] = true;
        tail_start = load_ip;
        ip = sqjit_a64_prev_effective_ip(proto, load_ip);
    }

    if(tail_start < 0) {
        return false;
    }
    SQInteger first_ip = -1;
    for(SQInteger n = 0; n < proto->_ninstructions; n++) {
        if(proto->_instructions[n].op != _OP_LINE) {
            first_ip = n;
            break;
        }
    }
    if(tail_start != first_ip &&
        (tail_start >= SQ_JIT_A64_IP_TABLE_SIZE || !branch_target[tail_start])) {
        return false;
    }

    for(SQInteger n = 0; n < field_count; n++) {
        if(!seen[n]) {
            return false;
        }
    }

    *ctor_out = ctor;
    *field_count_out = field_count;
    return true;
}

static SQInteger sqjit_a64_helper_call_scalar_field_constructor(SQClass *klass,
    SQClosure *expected_ctor, SQObjectPtr *stack, SQInteger arg_base,
    SQInteger nargs, SQInteger out_slot, SQInteger field_count)
{
    if(!klass || !expected_ctor || !stack ||
        !sqjit_a64_call_args_valid(arg_base, nargs) || out_slot < 0 ||
        out_slot >= MAX_FUNC_STACKSIZE || field_count <= 0 ||
        field_count != nargs - 1 ||
        field_count != (SQInteger)klass->_defaultvalues.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr constructor;
    if(!klass->GetConstructor(constructor) || sq_type(constructor) != OT_CLOSURE ||
        _closure(constructor) != expected_ctor) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInstance *raw_instance = klass->CreateInstance();
    if(!raw_instance) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr instance(raw_instance);
    for(SQInteger n = 0; n < field_count; n++) {
        raw_instance->_values[n] = stack[arg_base + 1 + n];
    }
    stack[arg_base] = instance;
    stack[out_slot] = instance;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_call_class(SQClass *klass, SQObjectPtr *stack,
    SQInteger arg_base, SQInteger nargs, SQInteger out_slot)
{
    if(!klass || !stack || !sqjit_a64_call_args_valid(arg_base, nargs) ||
        out_slot < 0 ||
        out_slot >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr constructor;
    if(!klass->GetConstructor(constructor)) {
        stack[out_slot] = klass->CreateInstance();
        return SQ_JIT_NATIVE_RETURNED;
    }
    if(sq_type(constructor) != OT_CLOSURE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQClosure *callee = _closure(constructor);
    SQFunctionProto *proto = callee ? callee->_function : NULL;
    if(!proto || proto->_bgenerator || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_nparameters != nargs ||
        !proto->_jit || !proto->_jit->_entry) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNative *native = (SQJitNative *)proto->_jit->_entry;
    if(!native || native->_ninstructions != proto->_ninstructions ||
        !native->_native_entry || native->_native_kind == SQ_JIT_NATIVE_SETTER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr original_self = stack[arg_base];
    SQObjectPtr instance = klass->CreateInstance();
    stack[arg_base] = instance;

    SQObjectPtr ignored;
    SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native->_native_entry;
    SQInteger status = fn(&stack[arg_base], &ignored, callee);
    if(status != SQ_JIT_NATIVE_RETURNED) {
        stack[arg_base] = original_self;
        return status;
    }

    stack[out_slot] = instance;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_integer(SQObjectPtr *stack, SQInteger table_reg,
    const SQObjectPtr *key, SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[table_reg], key, value) ||
        sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_float(SQObjectPtr *stack, SQInteger table_reg,
    const SQObjectPtr *key, SQFloat *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[table_reg], key, value) ||
        sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_array_ptr(SQObjectPtr *stack, SQInteger table_reg,
    const SQObjectPtr *key, SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[table_reg], key, value) ||
        sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_ptr(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQInteger expected_type, SQInteger *out)
{
    if(!stack || !key || !out || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[base_reg], key, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type, out)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_ptr_root(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQInteger expected_type,
    const SQObjectPtr *root, SQInteger *out)
{
    if(!stack || !key || !out || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type, out)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_integer_root(SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, table_reg, key, root, value) ||
        sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_float_root(SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQFloat *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, table_reg, key, root, value) ||
        sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_array_ptr_root(SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, table_reg, key, root, value) ||
        sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_integer(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQInteger *out)
{
    if(!key || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_float(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQFloat *out)
{
    if(!key || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_array_ptr(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQInteger *out)
{
    if(!key || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_object_ptr(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQInteger expected_type, SQInteger *out)
{
    if(!key || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type, out)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_dynamic_key(SQObjectPtr *stack,
    SQInteger base_reg, SQInteger key_ptr, SQInteger key_type, SQInteger out_reg)
{
    if(!stack || base_reg < 0 || base_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr key;
    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(key_ptr, (SQObjectType)key_type, key) ||
        !sqjit_a64_get_member_value(stack[base_reg], &key, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_dynamic_key_root(SQObjectPtr *stack,
    SQInteger base_reg, SQInteger key_ptr, SQInteger key_type, const SQObjectPtr *root,
    SQInteger out_reg)
{
    if(!stack || base_reg < 0 || base_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr key;
    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(key_ptr, (SQObjectType)key_type, key) ||
        !sqjit_a64_get_member_value_with_root(stack, base_reg, &key, root, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_stack_key(SQObjectPtr *stack,
    SQInteger base_reg, SQInteger key_reg, SQInteger out_reg)
{
    if(!stack || base_reg < 0 || base_reg >= MAX_FUNC_STACKSIZE ||
        key_reg < 0 || key_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE ||
        sq_type(stack[key_reg]) == OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[base_reg], &stack[key_reg], value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_stack_key_root(
    SQObjectPtr *stack, SQInteger base_reg, SQInteger key_reg,
    const SQObjectPtr *root, SQInteger out_reg)
{
    if(!stack || base_reg < 0 || base_reg >= MAX_FUNC_STACKSIZE ||
        key_reg < 0 || key_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE ||
        sq_type(stack[key_reg]) == OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, &stack[key_reg],
        root, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_integer_stack_key(SQObjectPtr *stack,
    SQInteger base_reg, SQInteger key_reg, SQInteger *out)
{
    if(!stack || !out || base_reg < 0 || base_reg >= MAX_FUNC_STACKSIZE ||
        key_reg < 0 || key_reg >= MAX_FUNC_STACKSIZE ||
        sq_type(stack[key_reg]) == OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[base_reg], &stack[key_reg], value) ||
        sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_integer_stack_key_root(
    SQObjectPtr *stack, SQInteger base_reg, SQInteger key_reg,
    const SQObjectPtr *root, SQInteger *out)
{
    if(!stack || !out || base_reg < 0 || base_reg >= MAX_FUNC_STACKSIZE ||
        key_reg < 0 || key_reg >= MAX_FUNC_STACKSIZE ||
        sq_type(stack[key_reg]) == OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, &stack[key_reg],
        root, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_integer_stack_key(
    SQInteger base_ptr, SQInteger base_type, SQObjectPtr *stack,
    SQInteger key_reg, SQInteger *out)
{
    if(!stack || !out || key_reg < 0 || key_reg >= MAX_FUNC_STACKSIZE ||
        sq_type(stack[key_reg]) == OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type,
        &stack[key_reg], value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_key(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQInteger out_reg)
{
    if(!stack || !key || base_reg < 0 ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_object_dynamic_key(SQInteger base_ptr,
    SQInteger base_type, SQInteger key_ptr, SQInteger key_type, SQObjectPtr *stack,
    SQInteger out_reg)
{
    if(!stack || out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr key;
    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(key_ptr, (SQObjectType)key_type, key) ||
        !sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, &key, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_object_key(
    SQInteger base_ptr, SQInteger base_type, const SQObjectPtr *key,
    SQObjectPtr *stack, SQInteger out_reg)
{
    if(!key || !stack || out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type,
        key, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_object_stack_key(
    SQInteger base_ptr, SQInteger base_type, SQObjectPtr *stack,
    SQInteger key_reg, SQInteger out_reg)
{
    if(!stack || key_reg < 0 || key_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE ||
        sq_type(stack[key_reg]) == OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type,
        &stack[key_reg], value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQObjectType sqjit_a64_observed_table_value_type(SQObjectPtr *entry_stack,
    SQInteger table_reg, const SQObjectPtr *key, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }
    if(!entry_stack || !key || table_reg < 0) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(entry_stack[table_reg], key, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), object_ptr_out);
    }
    return sq_type(value);
}

static SQObjectType sqjit_a64_observed_object_ptr_value_type(SQInteger base_ptr,
    SQObjectType base_type, const SQObjectPtr *key, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }
    if(!key) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, base_type, key, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), object_ptr_out);
    }
    return sq_type(value);
}

static SQObjectType sqjit_a64_observed_root_value_type(const SQObjectPtr *root,
    const SQObjectPtr *key, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }
    if(!root || !key || sq_type(*root) == OT_NULL) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(*root, key, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), object_ptr_out);
    }
    return sq_type(value);
}
