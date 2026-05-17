#pragma once

#include <squirrel.h>
#include <sqstdaux.h>
#include <sqstdio.h>
#include <sqstdmath.h>
#include <sqstdstring.h>
#include <sqstdblob.h>
#include <sqstdsystem.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_vm_new  — Create and configure a new Squirrel VM.
 *
 * Registers all sqstdlibs and the `import` native function into the root table.
 * Returns NULL on failure.
 */
HSQUIRRELVM sqgi_vm_new(void);

/*
 * sqgi_vm_free — Destroy the VM and release all resources.
 */
void sqgi_vm_free(HSQUIRRELVM v);

/*
 * sqgi_vm_dofile — Compile and execute a .nut file.
 *
 * On script error the Squirrel error handler is invoked; returns SQ_ERROR.
 */
SQRESULT sqgi_vm_dofile(HSQUIRRELVM v, const SQChar *filename);

/*
 * sqgi_vm_dobuffer — Compile and execute a string buffer.
 *
 * `name` is used as the chunk name for error messages.
 */
SQRESULT sqgi_vm_dobuffer(HSQUIRRELVM v, const SQChar *buf, SQInteger len, const SQChar *name);

/*
 * sqgi_root_vm — Return the long-lived root VM for v's shared state.
 *
 * Any HSQUIRRELVM passed in (root or coroutine thread) returns the same
 * root VM, which is guaranteed to outlive every coroutine thread spawned
 * from it. Use this VM pointer when stashing into long-lived async/timeout
 * callback contexts so subsequent sq_release calls cannot UAF after a
 * caller coroutine is freed.
 */
HSQUIRRELVM sqgi_root_vm(HSQUIRRELVM v);

#ifdef __cplusplus
}
#endif
