/* Bounded scans: no padding, alignment, or readable sentinel is required. */
#ifndef SQGI_JSON_SCAN_H
#define SQGI_JSON_SCAN_H
#include <stddef.h>
#if !defined(SQGI_JSON_SCALAR) && (defined(__SSE2__) || defined(_M_X64))
#include <emmintrin.h>
#define SQGI_JSON_SSE2 1
#elif !defined(SQGI_JSON_SCALAR) && (defined(__ARM_NEON) || defined(__ARM_NEON__))
#include <arm_neon.h>
#define SQGI_JSON_NEON 1
#endif

/* Return the prefix containing no quote, backslash, or control byte. */
static inline size_t sqgi_json_plain_span(const char *s, size_t n)
{
    size_t i = 0;
    for (; n - i >= 16; i += 16) {
#if defined(SQGI_JSON_SSE2)
        __m128i x = _mm_loadu_si128((const __m128i *)(s + i));
        __m128i special = _mm_or_si128(_mm_cmpeq_epi8(x, _mm_set1_epi8('"')),
                                     _mm_cmpeq_epi8(x, _mm_set1_epi8('\\')));
        special = _mm_or_si128(special, _mm_cmpeq_epi8(_mm_min_epu8(x, _mm_set1_epi8(31)), x));
        if (_mm_movemask_epi8(special)) break;
#elif defined(SQGI_JSON_NEON)
        uint8x16_t x = vld1q_u8((const unsigned char *)s + i);
        uint8x16_t special = vorrq_u8(vorrq_u8(vceqq_u8(x, vdupq_n_u8('"')),
                                               vceqq_u8(x, vdupq_n_u8('\\'))),
                                      vcltq_u8(x, vdupq_n_u8(32)));
        uint64x2_t bits = vreinterpretq_u64_u8(special);
        if (vgetq_lane_u64(bits, 0) | vgetq_lane_u64(bits, 1)) break;
#else
        break;
#endif
    }
    while (i < n && (unsigned char)s[i] >= 32 && s[i] != '"' && s[i] != '\\') ++i;
    return i;
}

static inline size_t sqgi_json_space_span(const char *s, size_t n)
{
    size_t i = 0;
    for (; n - i >= 16; i += 16) {
#if defined(SQGI_JSON_SSE2)
        __m128i x = _mm_loadu_si128((const __m128i *)(s + i));
        __m128i ws = _mm_or_si128(_mm_or_si128(_mm_cmpeq_epi8(x, _mm_set1_epi8(' ')),
                                              _mm_cmpeq_epi8(x, _mm_set1_epi8('\t'))),
                                  _mm_or_si128(_mm_cmpeq_epi8(x, _mm_set1_epi8('\n')),
                                               _mm_cmpeq_epi8(x, _mm_set1_epi8('\r'))));
        if (_mm_movemask_epi8(ws) != 65535) break;
#elif defined(SQGI_JSON_NEON)
        uint8x16_t x = vld1q_u8((const unsigned char *)s + i);
        uint8x16_t ws = vorrq_u8(vorrq_u8(vceqq_u8(x, vdupq_n_u8(' ')), vceqq_u8(x, vdupq_n_u8('\t'))),
                                vorrq_u8(vceqq_u8(x, vdupq_n_u8('\n')), vceqq_u8(x, vdupq_n_u8('\r'))));
        uint64x2_t bits = vreinterpretq_u64_u8(vmvnq_u8(ws));
        if (vgetq_lane_u64(bits, 0) | vgetq_lane_u64(bits, 1)) break;
#else
        break;
#endif
    }
    while (i < n && (s[i] == ' ' || s[i] == '\t' || s[i] == '\n' || s[i] == '\r')) ++i;
    return i;
}
#endif
