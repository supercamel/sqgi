#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqvm.h"
#include "jit/sqjit.h"
#include "jit/sqjit_backend.h"

#include <stdio.h>
#include <string.h>

#define CHECK(cond, msg) \
    do { if (!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); rc = 1; } } while (0)

static SQFunctionProto *make_invalid_slot_proto(SQVM *v)
{
    SQFunctionProto *proto = SQFunctionProto::Create(_ss(v), 2, 0, 1, 0, 0, 0, 0, 0);
    if(!proto) {
        return NULL;
    }
    proto->_name = SQString::Create(_ss(v), _SC("invalid_slot_proto"));
    proto->_sourcename = SQString::Create(_ss(v), _SC("test_sqjit_aarch64_backend_invalid"));
    proto->_stacksize = 2;
    proto->_varparams = false;
    proto->_bgenerator = false;
    proto->_instructions[0] = SQInstruction(_OP_LOADINT, MAX_FUNC_STACKSIZE, 1, 0, 0);
    proto->_instructions[1] = SQInstruction(_OP_RETURN, 1, 0, 0, 0);
    return proto;
}

int main(void)
{
    int rc = 0;
    HSQUIRRELVM raw_vm = sq_open(32);
    CHECK(raw_vm != NULL, "open squirrel vm");
    if(!raw_vm) {
        return rc ? rc : 1;
    }

    SQVM *v = (SQVM *)raw_vm;
    SQFunctionProto *proto = make_invalid_slot_proto(v);
    CHECK(proto != NULL, "make invalid slot proto");
    if(proto) {
        SQObjectPtr entry_stack[MAX_FUNC_STACKSIZE];
        memset(entry_stack, 0, sizeof(entry_stack));

        SQJitNative native = {};
        CHECK(!sqjit_backend_compile_proto(proto, entry_stack, NULL, &native),
            "whole-proto compiler rejects invalid stack slot operand");
        CHECK(native._native_entry == NULL && native._native_size == 0,
            "whole-proto invalid reject does not install native code");

        SQJitProto jit = {};
        CHECK(!sqjit_backend_compile_loop(proto, entry_stack, NULL, 0, 0, 0, 1, &jit),
            "loop compiler rejects invalid stack slot operand");
        CHECK(jit._loop_entry == NULL && jit._loop_native_size == 0,
            "loop invalid reject does not install native code");

        proto->Release();
    }

    sq_close(raw_vm);
    if(rc == 0) {
        printf("[OK] test_sqjit_aarch64_backend_invalid\n");
    }
    return rc;
}
