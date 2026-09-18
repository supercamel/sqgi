#pragma once

#include <squirrel.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_json_register_helpers
 *
 * Installs the `sqgi.json` table on the root, with:
 *
 *   sqgi.json.parse(text)            → Squirrel value
 *   sqgi.json.stringify(value)       → string
 *   sqgi.json.stringify(value, indent) → pretty-printed (indent = int spaces)
 *
 * Type mapping:
 *   JSON null     ↔ null
 *   JSON bool     ↔ bool
 *   JSON number   → integer for in-range integer tokens, otherwise float;
 *                   stringify uses shortest round-trippable float spelling
 *                   and retains a decimal/exponent for floating values
 *   JSON string   ↔ string (UTF-8 bytes; \uXXXX decoded to UTF-8 on parse)
 *   JSON array    ↔ array
 *   JSON object   ↔ table  (table iteration order on stringify)
 *
 * Limits:
 *   Parse recursion is capped at 128 to defeat trivial DoS via deeply
 *   nested literals.
 *
 * Errors:
 *   parse — throws a Squirrel error with line/column on malformed input.
 *   stringify — throws on NaN/Inf, on cycles via the recursion cap, and on
 *     unsupported value types (instances/userdata) unless they define a
 *     `_tojson` metamethod returning a JSON-encodable value.
 */
void sqgi_json_register_helpers(HSQUIRRELVM v);

#ifdef __cplusplus
}
#endif
