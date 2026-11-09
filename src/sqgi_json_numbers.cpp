#include "sqgi_json_numbers.h"
#include <charconv>
#include <system_error>

size_t sqgi_json_format_double(char *out, size_t capacity, double value)
{
    const auto result = std::to_chars(out, out + capacity, value, std::chars_format::general);
    return result.ec == std::errc() ? static_cast<size_t>(result.ptr - out) : 0;
}

int sqgi_json_parse_double(const char *begin, const char *end, double *value)
{
#ifdef __ANDROID__
    /* NDK r28 libc++ has no floating-point from_chars. Returning zero asks
     * sqgi_json.cpp to use its bounded g_ascii_strtod fallback. */
    (void)begin; (void)end; (void)value;
    return 0;
#else
    const auto result = std::from_chars(begin, end, *value, std::chars_format::general);
    return result.ec == std::errc() && result.ptr == end;
#endif
}
