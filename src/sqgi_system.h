#pragma once

#include <squirrel.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Pushes the built-in `system` module table for import("system").
 *
 * The module is read-mostly and intentionally small: OS/runtime/cpu/path
 * snapshots plus environment variable readers.
 */
SQRESULT sqgi_system_push_module(HSQUIRRELVM v);

#ifdef __cplusplus
}
#endif

