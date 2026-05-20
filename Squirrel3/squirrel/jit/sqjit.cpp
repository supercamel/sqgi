/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqjit.h"
#include <limits.h>
#include <math.h>
#include <stdint.h>
#include <string.h>
#if defined(__x86_64__) && !defined(_WIN32)
#include <sys/mman.h>
#include <unistd.h>
#define SQJIT_HAS_X64_NATIVE 1
#else
#define SQJIT_HAS_X64_NATIVE 0
#endif

static bool sqjit_env_checked = false;
static bool sqjit_env_enabled = false;
static bool sqjit_trace_enabled = false;
static SQInteger sqjit_threshold = 1000;

typedef SQInteger (*SQJitNativeUnaryIntFn)(SQInteger);

struct SQJitBaseline {
    SQInteger _ninstructions;
    bool _trace_executed;
    void *_native_entry;
    SQInteger _native_size;
    bool _native_trace_executed;
};

static bool sqjit_is_truthy_env(const char *value)
{
    return value && value[0] != '\0' && value[0] != '0';
}

static void sqjit_read_env_once()
{
    if(sqjit_env_checked) {
        return;
    }
    sqjit_env_checked = true;

    sqjit_env_enabled = sqjit_is_truthy_env(getenv("SQGI_JIT"));
    sqjit_trace_enabled = sqjit_is_truthy_env(getenv("SQGI_JIT_TRACE"));

    const char *threshold = getenv("SQGI_JIT_THRESHOLD");
    if(threshold && threshold[0] != '\0') {
        SQInteger parsed = (SQInteger)strtoll(threshold, NULL, 10);
        if(parsed >= 0) {
            sqjit_threshold = parsed;
        }
    }
}

static SQJitProto *sqjit_ensure_proto(SQFunctionProto *proto)
{
    if(!proto->_jit) {
        proto->_jit = (SQJitProto *)sq_vm_malloc(sizeof(SQJitProto));
        if(!proto->_jit) {
            return NULL;
        }
        proto->_jit->_entry = NULL;
        proto->_jit->_hot_count = 0;
        proto->_jit->_fail_count = 0;
        proto->_jit->_version = 0;
        proto->_jit->_eligibility = SQ_JIT_UNKNOWN;
    }
    return proto->_jit;
}

static const SQChar *sqjit_proto_name(SQFunctionProto *proto)
{
    return sq_type(proto->_name) == OT_STRING ? _stringval(proto->_name) : _SC("<anonymous>");
}

static SQInteger sqjit_integer_min()
{
#ifdef _SQ64
    return (SQInteger)LLONG_MIN;
#else
    return (SQInteger)INT_MIN;
#endif
}

static bool sqjit_is_supported_opcode(const SQInstruction &inst)
{
    switch(inst.op) {
        case _OP_LINE:
        case _OP_LOAD:
        case _OP_LOADINT:
        case _OP_LOADFLOAT:
        case _OP_DLOAD:
        case _OP_PREPCALL:
        case _OP_PREPCALLK:
        case _OP_GETK:
        case _OP_MOVE:
        case _OP_GET:
        case _OP_SET:
        case _OP_EQ:
        case _OP_NE:
        case _OP_LOADNULLS:
        case _OP_LOADBOOL:
        case _OP_DMOVE:
        case _OP_CALL:
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
        case _OP_INCL:
        case _OP_PINCL:
        case _OP_NEWOBJ:
        case _OP_APPENDARRAY:
        case _OP_NEG:
        case _OP_NOT:
        case _OP_CMP:
        case _OP_JCMP:
        case _OP_JZ:
        case _OP_JMP:
        case _OP_RETURN:
            return true;
        default:
            return false;
    }
}

static bool sqjit_is_scalar_literal(const SQObjectPtr &obj)
{
    switch(sq_type(obj)) {
        case OT_NULL:
        case OT_INTEGER:
        case OT_FLOAT:
        case OT_BOOL:
        case OT_STRING:
            return true;
        default:
            return false;
    }
}

static bool sqjit_analyze_proto(SQFunctionProto *proto)
{
    if(!proto || proto->_bgenerator || proto->_varparams || proto->_noutervalues != 0) {
        return false;
    }

    for(SQInteger n = 0; n < proto->_ninstructions; n++) {
        const SQInstruction &inst = proto->_instructions[n];
        if(!sqjit_is_supported_opcode(inst)) {
            if(sqjit_trace_enabled) {
                scprintf(_SC("[sqjit] proto '%s' is not baseline eligible: unsupported opcode %d at %d\n"),
                    sqjit_proto_name(proto), (SQInt32)inst.op, (SQInt32)n);
            }
            return false;
        }
        if(inst.op == _OP_LOAD && !sqjit_is_scalar_literal(proto->_literals[inst._arg1])) {
            if(sqjit_trace_enabled) {
                scprintf(_SC("[sqjit] proto '%s' is not baseline eligible: non-scalar literal at %d\n"),
                    sqjit_proto_name(proto), (SQInt32)n);
            }
            return false;
        }
        if(inst.op == _OP_DLOAD &&
            (!sqjit_is_scalar_literal(proto->_literals[inst._arg1]) ||
             !sqjit_is_scalar_literal(proto->_literals[inst._arg3]))) {
            if(sqjit_trace_enabled) {
                scprintf(_SC("[sqjit] proto '%s' is not baseline eligible: non-scalar dual literal at %d\n"),
                    sqjit_proto_name(proto), (SQInt32)n);
            }
            return false;
        }
        if(inst.op == _OP_NEWOBJ && inst._arg3 == NOT_CLASS) {
            if(sqjit_trace_enabled) {
                scprintf(_SC("[sqjit] proto '%s' is not baseline eligible: class creation at %d\n"),
                    sqjit_proto_name(proto), (SQInt32)n);
            }
            return false;
        }
    }
    return true;
}

#if SQJIT_HAS_X64_NATIVE
enum SQJitNativeExprKind {
    SQ_JIT_NATIVE_INVALID = 0,
    SQ_JIT_NATIVE_PARAM1,
    SQ_JIT_NATIVE_CONST,
    SQ_JIT_NATIVE_ADD_CONST,
    SQ_JIT_NATIVE_SUB_CONST,
    SQ_JIT_NATIVE_CONST_SUB,
    SQ_JIT_NATIVE_MUL_CONST,
    SQ_JIT_NATIVE_SQUARE
};

struct SQJitNativeExpr {
    SQJitNativeExprKind kind;
    SQInteger value;
};

struct SQJitNativeCodeBuffer {
    unsigned char bytes[64];
    SQInteger size;
};

static SQJitNativeExpr sqjit_native_invalid()
{
    SQJitNativeExpr expr;
    expr.kind = SQ_JIT_NATIVE_INVALID;
    expr.value = 0;
    return expr;
}

static SQJitNativeExpr sqjit_native_expr(SQJitNativeExprKind kind, SQInteger value)
{
    SQJitNativeExpr expr;
    expr.kind = kind;
    expr.value = value;
    return expr;
}

static bool sqjit_native_is_int32(SQInteger value)
{
    return value >= (SQInteger)INT_MIN && value <= (SQInteger)INT_MAX;
}

static bool sqjit_native_emit_u8(SQJitNativeCodeBuffer *buf, unsigned char value)
{
    if(buf->size >= (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    buf->bytes[buf->size++] = value;
    return true;
}

static bool sqjit_native_emit_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    if(!sqjit_native_is_int32(value) || buf->size + 4 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    SQInt32 v = (SQInt32)value;
    memcpy(&buf->bytes[buf->size], &v, sizeof(v));
    buf->size += 4;
    return true;
}

static bool sqjit_native_emit_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    if(buf->size + 8 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    SQInteger v = value;
    memcpy(&buf->bytes[buf->size], &v, sizeof(v));
    buf->size += 8;
    return true;
}

static bool sqjit_native_emit_mov_rax_rdi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xF8);
}

static bool sqjit_native_emit_mov_rax_imm64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xB8) &&
        sqjit_native_emit_i64(buf, value);
}

static bool sqjit_native_emit_ret(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0xC3);
}

static bool sqjit_native_build_expr(SQOpcode op, const SQJitNativeExpr &left, const SQJitNativeExpr &right, SQJitNativeExpr *out)
{
    if(left.kind == SQ_JIT_NATIVE_INVALID || right.kind == SQ_JIT_NATIVE_INVALID) {
        return false;
    }

    if(op == _OP_ADD) {
        if(left.kind == SQ_JIT_NATIVE_PARAM1 && right.kind == SQ_JIT_NATIVE_CONST) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_ADD_CONST, right.value);
            return true;
        }
        if(left.kind == SQ_JIT_NATIVE_CONST && right.kind == SQ_JIT_NATIVE_PARAM1) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_ADD_CONST, left.value);
            return true;
        }
        if(left.kind == SQ_JIT_NATIVE_CONST && right.kind == SQ_JIT_NATIVE_CONST) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_CONST, left.value + right.value);
            return true;
        }
    }
    else if(op == _OP_SUB) {
        if(left.kind == SQ_JIT_NATIVE_PARAM1 && right.kind == SQ_JIT_NATIVE_CONST) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_SUB_CONST, right.value);
            return true;
        }
        if(left.kind == SQ_JIT_NATIVE_CONST && right.kind == SQ_JIT_NATIVE_PARAM1) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_CONST_SUB, left.value);
            return true;
        }
        if(left.kind == SQ_JIT_NATIVE_CONST && right.kind == SQ_JIT_NATIVE_CONST) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_CONST, left.value - right.value);
            return true;
        }
    }
    else if(op == _OP_MUL) {
        if(left.kind == SQ_JIT_NATIVE_PARAM1 && right.kind == SQ_JIT_NATIVE_PARAM1) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_SQUARE, 0);
            return true;
        }
        if(left.kind == SQ_JIT_NATIVE_PARAM1 && right.kind == SQ_JIT_NATIVE_CONST) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_MUL_CONST, right.value);
            return true;
        }
        if(left.kind == SQ_JIT_NATIVE_CONST && right.kind == SQ_JIT_NATIVE_PARAM1) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_MUL_CONST, left.value);
            return true;
        }
        if(left.kind == SQ_JIT_NATIVE_CONST && right.kind == SQ_JIT_NATIVE_CONST) {
            *out = sqjit_native_expr(SQ_JIT_NATIVE_CONST, left.value * right.value);
            return true;
        }
    }

    return false;
}

static bool sqjit_native_compile_expr(SQJitNativeExpr expr, SQJitNativeCodeBuffer *buf)
{
    buf->size = 0;

    switch(expr.kind) {
        case SQ_JIT_NATIVE_PARAM1:
            if(!sqjit_native_emit_mov_rax_rdi(buf)) return false;
            break;
        case SQ_JIT_NATIVE_CONST:
            if(!sqjit_native_emit_mov_rax_imm64(buf, expr.value)) return false;
            break;
        case SQ_JIT_NATIVE_ADD_CONST:
            if(!sqjit_native_is_int32(expr.value)) return false;
            if(!sqjit_native_emit_mov_rax_rdi(buf)) return false;
            if(expr.value != 0) {
                if(!sqjit_native_emit_u8(buf, 0x48) || !sqjit_native_emit_u8(buf, 0x05) ||
                    !sqjit_native_emit_i32(buf, expr.value)) return false;
            }
            break;
        case SQ_JIT_NATIVE_SUB_CONST:
            if(!sqjit_native_is_int32(expr.value)) return false;
            if(!sqjit_native_emit_mov_rax_rdi(buf)) return false;
            if(expr.value != 0) {
                if(!sqjit_native_emit_u8(buf, 0x48) || !sqjit_native_emit_u8(buf, 0x2D) ||
                    !sqjit_native_emit_i32(buf, expr.value)) return false;
            }
            break;
        case SQ_JIT_NATIVE_CONST_SUB:
            if(!sqjit_native_emit_mov_rax_imm64(buf, expr.value)) return false;
            if(!sqjit_native_emit_u8(buf, 0x48) || !sqjit_native_emit_u8(buf, 0x29) ||
                !sqjit_native_emit_u8(buf, 0xF8)) return false; // sub %rdi, %rax
            break;
        case SQ_JIT_NATIVE_MUL_CONST:
            if(!sqjit_native_is_int32(expr.value)) return false;
            if(!sqjit_native_emit_mov_rax_rdi(buf)) return false;
            if(!sqjit_native_emit_u8(buf, 0x48) || !sqjit_native_emit_u8(buf, 0x69) ||
                !sqjit_native_emit_u8(buf, 0xC0) || !sqjit_native_emit_i32(buf, expr.value)) return false;
            break;
        case SQ_JIT_NATIVE_SQUARE:
            if(!sqjit_native_emit_mov_rax_rdi(buf)) return false;
            if(!sqjit_native_emit_u8(buf, 0x48) || !sqjit_native_emit_u8(buf, 0x0F) ||
                !sqjit_native_emit_u8(buf, 0xAF) || !sqjit_native_emit_u8(buf, 0xC7)) return false; // imul %rdi, %rax
            break;
        default:
            return false;
    }

    return sqjit_native_emit_ret(buf);
}

static void *sqjit_native_alloc(const unsigned char *code, SQInteger size, SQInteger *mapped_size)
{
    long page_size = sysconf(_SC_PAGESIZE);
    if(page_size <= 0) {
        page_size = 4096;
    }

    SQInteger alloc_size = ((size + page_size - 1) / page_size) * page_size;
    void *mem = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if(mem == MAP_FAILED) {
        return NULL;
    }

    memcpy(mem, code, size);
    __builtin___clear_cache((char *)mem, (char *)mem + size);
    if(mprotect(mem, alloc_size, PROT_READ | PROT_EXEC) != 0) {
        munmap(mem, alloc_size);
        return NULL;
    }

    *mapped_size = alloc_size;
    return mem;
}

static void sqjit_native_free(void *entry, SQInteger size)
{
    if(entry && size > 0) {
        munmap(entry, size);
    }
}

static bool sqjit_try_compile_native_unary_int(SQFunctionProto *proto, SQJitBaseline *baseline)
{
    if(!proto || proto->_nparameters != 2 || proto->_varparams || proto->_ndefaultparams != 0 ||
        proto->_stacksize > MAX_FUNC_STACKSIZE) {
        return false;
    }

    SQJitNativeExpr exprs[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        exprs[n] = sqjit_native_invalid();
    }
    exprs[1] = sqjit_native_expr(SQ_JIT_NATIVE_PARAM1, 0);

    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOADINT:
#ifndef _SQ64
                exprs[inst._arg0] = sqjit_native_expr(SQ_JIT_NATIVE_CONST, (SQInteger)inst._arg1);
#else
                exprs[inst._arg0] = sqjit_native_expr(SQ_JIT_NATIVE_CONST, (SQInteger)((SQInt32)inst._arg1));
#endif
                break;
            case _OP_LOAD:
                if(sq_type(proto->_literals[inst._arg1]) != OT_INTEGER) {
                    return false;
                }
                exprs[inst._arg0] = sqjit_native_expr(SQ_JIT_NATIVE_CONST, _integer(proto->_literals[inst._arg1]));
                break;
            case _OP_MOVE:
                exprs[inst._arg0] = exprs[inst._arg1];
                break;
            case _OP_ADD:
            case _OP_SUB:
            case _OP_MUL: {
                SQJitNativeExpr out = sqjit_native_invalid();
                if(!sqjit_native_build_expr((SQOpcode)inst.op, exprs[inst._arg2], exprs[inst._arg1], &out)) {
                    return false;
                }
                exprs[inst._arg0] = out;
                break;
            }
            case _OP_RETURN: {
                if(inst._arg0 == 0xFF) {
                    return false;
                }
                SQJitNativeCodeBuffer buf;
                if(!sqjit_native_compile_expr(exprs[inst._arg1], &buf)) {
                    return false;
                }
                SQInteger mapped_size = 0;
                void *entry = sqjit_native_alloc(buf.bytes, buf.size, &mapped_size);
                if(!entry) {
                    return false;
                }
                baseline->_native_entry = entry;
                baseline->_native_size = mapped_size;
                return true;
            }
            default:
                return false;
        }
    }

    return false;
}
#else
static void sqjit_native_free(void *SQ_UNUSED_ARG(entry), SQInteger SQ_UNUSED_ARG(size))
{
}

static bool sqjit_try_compile_native_unary_int(SQFunctionProto *SQ_UNUSED_ARG(proto), SQJitBaseline *SQ_UNUSED_ARG(baseline))
{
    return false;
}
#endif

static bool sqjit_compile_proto(SQFunctionProto *proto, SQJitProto *jit)
{
    if(jit->_entry || jit->_eligibility == SQ_JIT_NEVER) {
        return jit->_entry != NULL;
    }

    if(!sqjit_analyze_proto(proto)) {
        jit->_eligibility = SQ_JIT_NEVER;
        return false;
    }

    SQJitBaseline *baseline = (SQJitBaseline *)sq_vm_malloc(sizeof(SQJitBaseline));
    if(!baseline) {
        jit->_fail_count++;
        return false;
    }

    baseline->_ninstructions = proto->_ninstructions;
    baseline->_trace_executed = false;
    baseline->_native_entry = NULL;
    baseline->_native_size = 0;
    baseline->_native_trace_executed = false;
    bool native_compiled = sqjit_try_compile_native_unary_int(proto, baseline);
    jit->_entry = baseline;
    jit->_eligibility = SQ_JIT_BASELINE_CANDIDATE;
    jit->_version++;

    if(sqjit_trace_enabled) {
        scprintf(_SC("[sqjit] compiled baseline proto '%s' (%d bytecode ops)\n"),
            sqjit_proto_name(proto), (SQInt32)proto->_ninstructions);
        if(native_compiled) {
            scprintf(_SC("[sqjit] compiled native proto '%s'\n"), sqjit_proto_name(proto));
        }
    }
    return true;
}

static bool sqjit_arith(SQVM *v, SQUnsignedInteger op, SQObjectPtr &trg, const SQObjectPtr &o1, const SQObjectPtr &o2)
{
    SQInteger tmask = sq_type(o1) | sq_type(o2);
    switch(tmask) {
        case OT_INTEGER: {
            SQInteger i1 = _integer(o1);
            SQInteger i2 = _integer(o2);
            switch(op) {
                case '+': trg = i1 + i2; return true;
                case '-': trg = i1 - i2; return true;
                case '*': trg = i1 * i2; return true;
                case '/':
                    if(i2 == 0) {
                        v->Raise_Error(_SC("division by zero"));
                        return false;
                    }
                    if(i2 == -1 && i1 == sqjit_integer_min()) {
                        v->Raise_Error(_SC("integer overflow"));
                        return false;
                    }
                    trg = i1 / i2;
                    return true;
                case '%':
                    if(i2 == 0) {
                        v->Raise_Error(_SC("modulo by zero"));
                        return false;
                    }
                    if(i2 == -1 && i1 == sqjit_integer_min()) {
                        trg = (SQInteger)0;
                        return true;
                    }
                    trg = i1 % i2;
                    return true;
                default:
                    break;
            }
            break;
        }
        case (OT_FLOAT | OT_INTEGER):
        case OT_FLOAT: {
            SQFloat f1 = tofloat(o1);
            SQFloat f2 = tofloat(o2);
            switch(op) {
                case '+': trg = f1 + f2; return true;
                case '-': trg = f1 - f2; return true;
                case '*': trg = f1 * f2; return true;
                case '/': trg = f1 / f2; return true;
                case '%': trg = SQFloat(fmod((double)f1, (double)f2)); return true;
                default:
                    break;
            }
            break;
        }
    }

    return v->ARITH_OP(op, trg, o1, o2);
}

static bool sqjit_cmp(SQVM *v, CmpOP op, const SQObjectPtr &o1, const SQObjectPtr &o2, SQObjectPtr &res)
{
    SQInteger r = 0;
    SQObjectType t1 = sq_type(o1);
    SQObjectType t2 = sq_type(o2);

    if(t1 == OT_INTEGER && t2 == OT_INTEGER) {
        SQInteger i1 = _integer(o1);
        SQInteger i2 = _integer(o2);
        r = (i1 == i2) ? 0 : (i1 < i2 ? -1 : 1);
    }
    else if(sq_isnumeric(o1) && sq_isnumeric(o2)) {
        SQFloat f1 = tofloat(o1);
        SQFloat f2 = tofloat(o2);
        r = (f1 == f2) ? 0 : (f1 < f2 ? -1 : 1);
    }
    else {
        return v->CMP_OP(op, o1, o2, res);
    }

    switch(op) {
        case CMP_G: res = (r > 0); return true;
        case CMP_GE: res = (r >= 0); return true;
        case CMP_L: res = (r < 0); return true;
        case CMP_LE: res = (r <= 0); return true;
        case CMP_3W: res = r; return true;
    }
    v->Raise_Error(_SC("internal JIT compare op failed"));
    return false;
}

bool sqjit_runtime_enabled()
{
    sqjit_read_env_once();
    return sqjit_env_enabled;
}

SQInteger sqjit_hot_threshold()
{
    sqjit_read_env_once();
    return sqjit_threshold;
}

void sqjit_on_function_enter(SQVM *SQ_UNUSED_ARG(v), SQFunctionProto *proto)
{
    sqjit_read_env_once();
    if(!sqjit_env_enabled || !proto) {
        return;
    }

    SQJitProto *jit = sqjit_ensure_proto(proto);
    if(!jit) {
        return;
    }

    jit->_hot_count++;
    if(jit->_hot_count >= sqjit_threshold && !jit->_entry && jit->_eligibility != SQ_JIT_NEVER) {
        if(sqjit_trace_enabled) {
            scprintf(_SC("[sqjit] hot proto '%s' reached JIT threshold\n"),
                sqjit_proto_name(proto));
        }
        sqjit_compile_proto(proto, jit);
    }
}

SQJitExecResult sqjit_try_execute_current(SQVM *v, SQObjectPtr &outres)
{
    sqjit_read_env_once();
    if(!sqjit_env_enabled || !v || !v->ci || v->_debughook) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }

    SQClosure *closure = _closure(v->ci->_closure);
    SQFunctionProto *proto = closure->_function;
    if(!proto || !proto->_jit || !proto->_jit->_entry) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }

    SQJitBaseline *baseline = (SQJitBaseline *)proto->_jit->_entry;
    if(!baseline || baseline->_ninstructions != proto->_ninstructions) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }

    SQInteger ip = 0;
    SQObjectPtr *stack = &v->_stack._vals[v->_stackbase];

    if(baseline->_native_entry && proto->_nparameters == 2 && sq_type(stack[1]) == OT_INTEGER) {
        SQJitNativeUnaryIntFn fn = (SQJitNativeUnaryIntFn)baseline->_native_entry;
        stack[0] = fn(_integer(stack[1]));
        if(v->Return(1, 0, v->temp_reg)) {
            _Swap(outres, v->temp_reg);
            if(sqjit_trace_enabled && !baseline->_native_trace_executed) {
                baseline->_native_trace_executed = true;
                scprintf(_SC("[sqjit] executed native proto '%s' as root\n"), sqjit_proto_name(proto));
            }
            return SQ_JIT_EXEC_ROOT_RETURNED;
        }
        if(sqjit_trace_enabled && !baseline->_native_trace_executed) {
            baseline->_native_trace_executed = true;
            scprintf(_SC("[sqjit] executed native proto '%s'\n"), sqjit_proto_name(proto));
        }
        return SQ_JIT_EXEC_FRAME_RETURNED;
    }

#define JIT_TARGET stack[inst._arg0]
#define JIT_STK(a) stack[(a)]
#define JIT_SARG0 ((SQInteger)((signed char)inst._arg0))
#define JIT_SARG1 ((SQInteger)((SQInt32)inst._arg1))
#define JIT_SARG3 ((SQInteger)((signed char)inst._arg3))

    for(;;) {
        if(ip < 0 || ip >= proto->_ninstructions) {
            v->Raise_Error(_SC("internal JIT instruction pointer escaped function"));
            return SQ_JIT_EXEC_ERROR;
        }

        const SQInstruction &inst = proto->_instructions[ip++];
        v->ci->_ip = &proto->_instructions[ip];

        switch(inst.op) {
            case _OP_LINE:
                continue;
            case _OP_LOAD:
                JIT_TARGET = proto->_literals[inst._arg1];
                continue;
            case _OP_LOADINT:
#ifndef _SQ64
                JIT_TARGET = (SQInteger)inst._arg1;
#else
                JIT_TARGET = (SQInteger)((SQInt32)inst._arg1);
#endif
                continue;
            case _OP_LOADFLOAT:
                JIT_TARGET = *((const SQFloat *)&inst._arg1);
                continue;
            case _OP_DLOAD:
                JIT_TARGET = proto->_literals[inst._arg1];
                JIT_STK(inst._arg2) = proto->_literals[inst._arg3];
                continue;
            case _OP_PREPCALL:
            case _OP_PREPCALLK: {
                SQObjectPtr &key = inst.op == _OP_PREPCALLK ? proto->_literals[inst._arg1] : JIT_STK(inst._arg1);
                SQObjectPtr &self = JIT_STK(inst._arg2);
                if(!v->Get(self, key, v->temp_reg, 0, inst._arg2)) {
                    return SQ_JIT_EXEC_ERROR;
                }
                JIT_STK(inst._arg3) = self;
                _Swap(JIT_TARGET, v->temp_reg);
                continue;
            }
            case _OP_GETK:
                if(!v->Get(JIT_STK(inst._arg2), proto->_literals[inst._arg1], v->temp_reg, 0, inst._arg2)) {
                    return SQ_JIT_EXEC_ERROR;
                }
                _Swap(JIT_TARGET, v->temp_reg);
                continue;
            case _OP_MOVE:
                JIT_TARGET = JIT_STK(inst._arg1);
                continue;
            case _OP_GET:
                if(sq_type(JIT_STK(inst._arg1)) == OT_ARRAY && sq_isnumeric(JIT_STK(inst._arg2))) {
                    if(!_array(JIT_STK(inst._arg1))->Get(tointeger(JIT_STK(inst._arg2)), JIT_TARGET)) {
                        v->Raise_IdxError(JIT_STK(inst._arg2));
                        return SQ_JIT_EXEC_ERROR;
                    }
                }
                else if(!v->Get(JIT_STK(inst._arg1), JIT_STK(inst._arg2), v->temp_reg, 0, inst._arg1)) {
                    return SQ_JIT_EXEC_ERROR;
                }
                else {
                    _Swap(JIT_TARGET, v->temp_reg);
                }
                continue;
            case _OP_SET:
                if(sq_type(JIT_STK(inst._arg1)) == OT_ARRAY && sq_isnumeric(JIT_STK(inst._arg2))) {
                    if(!_array(JIT_STK(inst._arg1))->Set(tointeger(JIT_STK(inst._arg2)), JIT_STK(inst._arg3))) {
                        v->Raise_IdxError(JIT_STK(inst._arg2));
                        return SQ_JIT_EXEC_ERROR;
                    }
                }
                else if(!v->Set(JIT_STK(inst._arg1), JIT_STK(inst._arg2), JIT_STK(inst._arg3), inst._arg1)) {
                    return SQ_JIT_EXEC_ERROR;
                }
                if(inst._arg0 != 0xFF) {
                    JIT_TARGET = JIT_STK(inst._arg3);
                }
                continue;
            case _OP_EQ:
            case _OP_NE: {
                bool res;
                SQObjectPtr &rhs = inst._arg3 != 0 ? proto->_literals[inst._arg1] : JIT_STK(inst._arg1);
                if(!SQVM::IsEqual(JIT_STK(inst._arg2), rhs, res)) {
                    return SQ_JIT_EXEC_ERROR;
                }
                JIT_TARGET = (inst.op == _OP_EQ ? res : !res) ? true : false;
                continue;
            }
            case _OP_LOADNULLS:
                for(SQInteger n = 0; n < inst._arg1; n++) {
                    JIT_STK(inst._arg0 + n).Null();
                }
                continue;
            case _OP_LOADBOOL:
                JIT_TARGET = inst._arg1 ? true : false;
                continue;
            case _OP_DMOVE:
                JIT_STK(inst._arg0) = JIT_STK(inst._arg1);
                JIT_STK(inst._arg2) = JIT_STK(inst._arg3);
                continue;
            case _OP_CALL: {
                SQObjectPtr clo = JIT_STK(inst._arg1);
                if(sq_type(clo) == OT_CLOSURE) {
                    SQFunctionProto *callee = _closure(clo)->_function;
                    if(callee->_jit && callee->_jit->_entry && !callee->_bgenerator) {
                        if(!v->StartCall(_closure(clo), JIT_SARG0, inst._arg3, v->_stackbase + inst._arg2, false)) {
                            return SQ_JIT_EXEC_ERROR;
                        }
                        switch(sqjit_try_execute_current(v, outres)) {
                            case SQ_JIT_EXEC_FRAME_RETURNED:
                                stack = &v->_stack._vals[v->_stackbase];
                                continue;
                            case SQ_JIT_EXEC_ROOT_RETURNED:
                                return SQ_JIT_EXEC_ROOT_RETURNED;
                            case SQ_JIT_EXEC_ERROR:
                                return SQ_JIT_EXEC_ERROR;
                            case SQ_JIT_EXEC_NOT_EXECUTED:
                                v->Raise_Error(_SC("internal JIT call target did not execute"));
                                return SQ_JIT_EXEC_ERROR;
                        }
                    }
                }

                SQObjectPtr callres;
                if(!v->Call(clo, inst._arg3, v->_stackbase + inst._arg2, callres, SQFalse)) {
                    return SQ_JIT_EXEC_ERROR;
                }
                stack = &v->_stack._vals[v->_stackbase];
                if(JIT_SARG0 != -1) {
                    JIT_TARGET = callres;
                }
                continue;
            }
            case _OP_ADD:
                if(!sqjit_arith(v, '+', JIT_TARGET, JIT_STK(inst._arg2), JIT_STK(inst._arg1))) return SQ_JIT_EXEC_ERROR;
                continue;
            case _OP_SUB:
                if(!sqjit_arith(v, '-', JIT_TARGET, JIT_STK(inst._arg2), JIT_STK(inst._arg1))) return SQ_JIT_EXEC_ERROR;
                continue;
            case _OP_MUL:
                if(!sqjit_arith(v, '*', JIT_TARGET, JIT_STK(inst._arg2), JIT_STK(inst._arg1))) return SQ_JIT_EXEC_ERROR;
                continue;
            case _OP_DIV:
                if(!sqjit_arith(v, '/', JIT_TARGET, JIT_STK(inst._arg2), JIT_STK(inst._arg1))) return SQ_JIT_EXEC_ERROR;
                continue;
            case _OP_MOD:
                if(!sqjit_arith(v, '%', JIT_TARGET, JIT_STK(inst._arg2), JIT_STK(inst._arg1))) return SQ_JIT_EXEC_ERROR;
                continue;
            case _OP_INCL: {
                SQObjectPtr incr(JIT_SARG3);
                if(!sqjit_arith(v, '+', JIT_STK(inst._arg1), JIT_STK(inst._arg1), incr)) return SQ_JIT_EXEC_ERROR;
                continue;
            }
            case _OP_PINCL: {
                SQObjectPtr incr(JIT_SARG3);
                JIT_TARGET = JIT_STK(inst._arg1);
                if(!sqjit_arith(v, '+', JIT_STK(inst._arg1), JIT_STK(inst._arg1), incr)) return SQ_JIT_EXEC_ERROR;
                continue;
            }
            case _OP_NEWOBJ:
                switch(inst._arg3) {
                    case NOT_TABLE:
                        JIT_TARGET = SQTable::Create(v->_sharedstate, inst._arg1);
                        continue;
                    case NOT_ARRAY:
                        JIT_TARGET = SQArray::Create(v->_sharedstate, 0);
                        _array(JIT_TARGET)->Reserve(inst._arg1);
                        continue;
                    default:
                        return SQ_JIT_EXEC_NOT_EXECUTED;
                }
            case _OP_APPENDARRAY: {
                SQObject val;
                val._unVal.raw = 0;
                switch(inst._arg2) {
                    case AAT_STACK:
                        val = JIT_STK(inst._arg1);
                        break;
                    case AAT_LITERAL:
                        val = proto->_literals[inst._arg1];
                        break;
                    case AAT_INT:
                        val._type = OT_INTEGER;
#ifndef _SQ64
                        val._unVal.nInteger = (SQInteger)inst._arg1;
#else
                        val._unVal.nInteger = (SQInteger)((SQInt32)inst._arg1);
#endif
                        break;
                    case AAT_FLOAT:
                        val._type = OT_FLOAT;
                        val._unVal.fFloat = *((const SQFloat *)&inst._arg1);
                        break;
                    case AAT_BOOL:
                        val._type = OT_BOOL;
                        val._unVal.nInteger = inst._arg1;
                        break;
                    default:
                        return SQ_JIT_EXEC_NOT_EXECUTED;
                }
                _array(JIT_STK(inst._arg0))->Append(val);
                continue;
            }
            case _OP_NEG:
                if(sq_type(JIT_STK(inst._arg1)) == OT_INTEGER) {
                    JIT_TARGET = -_integer(JIT_STK(inst._arg1));
                }
                else if(sq_type(JIT_STK(inst._arg1)) == OT_FLOAT) {
                    JIT_TARGET = -_float(JIT_STK(inst._arg1));
                }
                else {
                    v->Raise_Error(_SC("JIT numeric guard failed for negate op"));
                    return SQ_JIT_EXEC_ERROR;
                }
                continue;
            case _OP_NOT:
                JIT_TARGET = SQVM::IsFalse(JIT_STK(inst._arg1));
                continue;
            case _OP_CMP:
                if(!sqjit_cmp(v, (CmpOP)inst._arg3, JIT_STK(inst._arg2), JIT_STK(inst._arg1), JIT_TARGET)) return SQ_JIT_EXEC_ERROR;
                continue;
            case _OP_JCMP:
                if(!sqjit_cmp(v, (CmpOP)inst._arg3, JIT_STK(inst._arg2), JIT_STK(inst._arg0), v->temp_reg)) return SQ_JIT_EXEC_ERROR;
                if(SQVM::IsFalse(v->temp_reg)) {
                    ip += JIT_SARG1;
                }
                continue;
            case _OP_JZ:
                if(SQVM::IsFalse(JIT_STK(inst._arg0))) {
                    ip += JIT_SARG1;
                }
                continue;
            case _OP_JMP:
                ip += JIT_SARG1;
                continue;
            case _OP_RETURN:
                if(v->Return(inst._arg0, inst._arg1, v->temp_reg)) {
                    _Swap(outres, v->temp_reg);
                    if(sqjit_trace_enabled && !baseline->_trace_executed) {
                        baseline->_trace_executed = true;
                        scprintf(_SC("[sqjit] executed baseline proto '%s' as root\n"), sqjit_proto_name(proto));
                    }
                    return SQ_JIT_EXEC_ROOT_RETURNED;
                }
                if(sqjit_trace_enabled && !baseline->_trace_executed) {
                    baseline->_trace_executed = true;
                    scprintf(_SC("[sqjit] executed baseline proto '%s'\n"), sqjit_proto_name(proto));
                }
                return SQ_JIT_EXEC_FRAME_RETURNED;
            default:
                return SQ_JIT_EXEC_NOT_EXECUTED;
        }
    }

#undef JIT_TARGET
#undef JIT_STK
#undef JIT_SARG0
#undef JIT_SARG1
#undef JIT_SARG3
}

void sqjit_release_proto(SQFunctionProto *proto)
{
    if(!proto || !proto->_jit) {
        return;
    }
    if(proto->_jit->_entry) {
        SQJitBaseline *baseline = (SQJitBaseline *)proto->_jit->_entry;
        sqjit_native_free(baseline->_native_entry, baseline->_native_size);
        baseline->_native_entry = NULL;
        baseline->_native_size = 0;
        sq_vm_free(baseline, sizeof(SQJitBaseline));
        proto->_jit->_entry = NULL;
    }
    sq_vm_free(proto->_jit, sizeof(SQJitProto));
    proto->_jit = NULL;
}
