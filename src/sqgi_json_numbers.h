#ifndef SQGI_JSON_NUMBERS_H
#define SQGI_JSON_NUMBERS_H
#include <stddef.h>
#ifdef __cplusplus
extern "C" {
#endif
/* Locale-independent, bounded conversions. Zero means use the legacy fallback. */
size_t sqgi_json_format_double(char *out, size_t capacity, double value);
int sqgi_json_parse_double(const char *begin, const char *end, double *value);
#ifdef __cplusplus
}
#endif
#endif
