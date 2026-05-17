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

#ifdef __cplusplus
}
#endif
