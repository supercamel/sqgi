#pragma once

#include <squirrel.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_import_register
 *
 * Register the `import` native function into the VM root table.
 */
void sqgi_import_register(HSQUIRRELVM v);

/*
 * Track the runtime path of the script currently being executed. This lets
 * import("module.nut") resolve relative to the importing module, even when
 * bytecode closures carry their original source path in debug metadata.
 */
int sqgi_import_push_file(HSQUIRRELVM v, const char *path);
void sqgi_import_pop_file(HSQUIRRELVM v);

#ifdef __cplusplus
}
#endif
