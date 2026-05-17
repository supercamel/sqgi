/* sqgi_json.c — first-class JSON parse/stringify for Squirrel.
 *
 * Hand-written to avoid any new build dependency. Uses GLib for strings
 * and dtostr (locale-safe). All values land on the Squirrel stack
 * directly; we never build intermediate trees.
 */

#include "sqgi_json.h"

#include <glib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <errno.h>

#define SQGI_JSON_MAX_DEPTH 128

/* ─── Parser ───────────────────────────────────────────────────────────── */

typedef struct {
    HSQUIRRELVM v;
    const char *src;
    gsize       len;
    gsize       pos;
    int         depth;
    /* Set by failure paths; sq_throwerror is called by the outer entry. */
    char        err[256];
} JsonParser;

static void set_err(JsonParser *p, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
static void set_err(JsonParser *p, const char *fmt, ...)
{
    if (p->err[0]) return; /* keep first error */
    va_list ap;
    va_start(ap, fmt);
    g_vsnprintf(p->err, sizeof(p->err), fmt, ap);
    va_end(ap);
}

static void compute_line_col(const char *src, gsize pos, int *line, int *col)
{
    *line = 1; *col = 1;
    for (gsize i = 0; i < pos; i++) {
        if (src[i] == '\n') { (*line)++; *col = 1; }
        else (*col)++;
    }
}

static void skip_ws(JsonParser *p)
{
    while (p->pos < p->len) {
        char c = p->src[p->pos];
        if (c == ' ' || c == '\t' || c == '\n' || c == '\r') p->pos++;
        else break;
    }
}

static int peek(JsonParser *p) {
    return (p->pos < p->len) ? (unsigned char)p->src[p->pos] : -1;
}

static int parse_value(JsonParser *p); /* fwd; pushes one value on success */

/* Decode a \uXXXX escape into the codepoint cp. Advances p->pos past the
 * 4 hex digits. Returns FALSE on bad input. */
static gboolean parse_hex4(JsonParser *p, guint32 *cp)
{
    if (p->pos + 4 > p->len) return FALSE;
    guint32 r = 0;
    for (int i = 0; i < 4; i++) {
        char c = p->src[p->pos + i];
        r <<= 4;
        if      (c >= '0' && c <= '9') r |= (guint32)(c - '0');
        else if (c >= 'a' && c <= 'f') r |= (guint32)(c - 'a' + 10);
        else if (c >= 'A' && c <= 'F') r |= (guint32)(c - 'A' + 10);
        else return FALSE;
    }
    p->pos += 4;
    *cp = r;
    return TRUE;
}

static void emit_utf8(GString *out, guint32 cp)
{
    if (cp < 0x80) {
        g_string_append_c(out, (char)cp);
    } else if (cp < 0x800) {
        g_string_append_c(out, (char)(0xC0 | (cp >> 6)));
        g_string_append_c(out, (char)(0x80 | (cp & 0x3F)));
    } else if (cp < 0x10000) {
        g_string_append_c(out, (char)(0xE0 | (cp >> 12)));
        g_string_append_c(out, (char)(0x80 | ((cp >> 6) & 0x3F)));
        g_string_append_c(out, (char)(0x80 | (cp & 0x3F)));
    } else {
        g_string_append_c(out, (char)(0xF0 | (cp >> 18)));
        g_string_append_c(out, (char)(0x80 | ((cp >> 12) & 0x3F)));
        g_string_append_c(out, (char)(0x80 | ((cp >> 6) & 0x3F)));
        g_string_append_c(out, (char)(0x80 | (cp & 0x3F)));
    }
}

/* Parses a JSON string literal. On success pushes a Squirrel string and
 * returns 0; on failure sets p->err and returns -1. */
static int parse_string(JsonParser *p)
{
    if (peek(p) != '"') { set_err(p, "expected string"); return -1; }
    p->pos++;
    GString *out = g_string_new(NULL);
    while (p->pos < p->len) {
        unsigned char c = (unsigned char)p->src[p->pos++];
        if (c == '"') {
            sq_pushstring(p->v, out->str, (SQInteger)out->len);
            g_string_free(out, TRUE);
            return 0;
        }
        if (c == '\\') {
            if (p->pos >= p->len) break;
            char esc = p->src[p->pos++];
            switch (esc) {
            case '"':  g_string_append_c(out, '"'); break;
            case '\\': g_string_append_c(out, '\\'); break;
            case '/':  g_string_append_c(out, '/'); break;
            case 'b':  g_string_append_c(out, '\b'); break;
            case 'f':  g_string_append_c(out, '\f'); break;
            case 'n':  g_string_append_c(out, '\n'); break;
            case 'r':  g_string_append_c(out, '\r'); break;
            case 't':  g_string_append_c(out, '\t'); break;
            case 'u': {
                guint32 cp;
                if (!parse_hex4(p, &cp)) {
                    set_err(p, "bad \\u escape");
                    g_string_free(out, TRUE);
                    return -1;
                }
                /* Surrogate pair handling. */
                if (cp >= 0xD800 && cp <= 0xDBFF) {
                    if (p->pos + 2 <= p->len &&
                        p->src[p->pos] == '\\' && p->src[p->pos+1] == 'u')
                    {
                        p->pos += 2;
                        guint32 low;
                        if (!parse_hex4(p, &low) ||
                            low < 0xDC00 || low > 0xDFFF)
                        {
                            set_err(p, "bad surrogate pair");
                            g_string_free(out, TRUE);
                            return -1;
                        }
                        cp = 0x10000 + (((cp - 0xD800) << 10) | (low - 0xDC00));
                    } else {
                        set_err(p, "lone high surrogate");
                        g_string_free(out, TRUE);
                        return -1;
                    }
                } else if (cp >= 0xDC00 && cp <= 0xDFFF) {
                    set_err(p, "lone low surrogate");
                    g_string_free(out, TRUE);
                    return -1;
                }
                emit_utf8(out, cp);
                break;
            }
            default:
                set_err(p, "bad escape \\%c", esc);
                g_string_free(out, TRUE);
                return -1;
            }
        } else if (c < 0x20) {
            set_err(p, "control char in string");
            g_string_free(out, TRUE);
            return -1;
        } else {
            g_string_append_c(out, (char)c);
        }
    }
    set_err(p, "unterminated string");
    g_string_free(out, TRUE);
    return -1;
}

static int parse_number(JsonParser *p)
{
    gsize start = p->pos;
    gboolean is_float = FALSE;
    if (peek(p) == '-') p->pos++;
    if (peek(p) == '0') p->pos++;
    else if (peek(p) >= '1' && peek(p) <= '9') {
        while (peek(p) >= '0' && peek(p) <= '9') p->pos++;
    } else {
        set_err(p, "invalid number"); return -1;
    }
    if (peek(p) == '.') {
        is_float = TRUE;
        p->pos++;
        if (!(peek(p) >= '0' && peek(p) <= '9')) {
            set_err(p, "digit expected after '.'"); return -1;
        }
        while (peek(p) >= '0' && peek(p) <= '9') p->pos++;
    }
    if (peek(p) == 'e' || peek(p) == 'E') {
        is_float = TRUE;
        p->pos++;
        if (peek(p) == '+' || peek(p) == '-') p->pos++;
        if (!(peek(p) >= '0' && peek(p) <= '9')) {
            set_err(p, "digit expected after exponent"); return -1;
        }
        while (peek(p) >= '0' && peek(p) <= '9') p->pos++;
    }
    /* Copy the slice to a NUL-terminated buffer for strtoll/strtod. */
    gsize n = p->pos - start;
    char buf[64];
    if (n >= sizeof(buf)) {
        /* Very long literal — promote to float via g_ascii_strtod which
         * takes a pointer to non-NUL-terminated input. */
        gchar *tmp = g_strndup(p->src + start, n);
        double d = g_ascii_strtod(tmp, NULL);
        g_free(tmp);
        sq_pushfloat(p->v, (SQFloat)d);
        return 0;
    }
    memcpy(buf, p->src + start, n);
    buf[n] = '\0';
    if (!is_float) {
        errno = 0;
        char *end = NULL;
        long long ll = strtoll(buf, &end, 10);
        if (errno != ERANGE && end == buf + n) {
            sq_pushinteger(p->v, (SQInteger)ll);
            return 0;
        }
        /* overflow — fall through to float */
    }
    double d = g_ascii_strtod(buf, NULL);
    sq_pushfloat(p->v, (SQFloat)d);
    return 0;
}

static int match_literal(JsonParser *p, const char *lit)
{
    gsize n = strlen(lit);
    if (p->pos + n > p->len) return -1;
    if (memcmp(p->src + p->pos, lit, n) != 0) return -1;
    p->pos += n;
    return 0;
}

static int parse_array(JsonParser *p)
{
    p->pos++; /* '[' */
    p->depth++;
    if (p->depth > SQGI_JSON_MAX_DEPTH) {
        set_err(p, "nesting too deep"); return -1;
    }
    sq_newarray(p->v, 0);
    skip_ws(p);
    if (peek(p) == ']') { p->pos++; p->depth--; return 0; }
    for (;;) {
        if (parse_value(p) < 0) return -1;
        sq_arrayappend(p->v, -2);
        skip_ws(p);
        int c = peek(p);
        if (c == ',') { p->pos++; skip_ws(p); continue; }
        if (c == ']') { p->pos++; p->depth--; return 0; }
        set_err(p, "expected ',' or ']' in array"); return -1;
    }
}

static int parse_object(JsonParser *p)
{
    p->pos++; /* '{' */
    p->depth++;
    if (p->depth > SQGI_JSON_MAX_DEPTH) {
        set_err(p, "nesting too deep"); return -1;
    }
    sq_newtable(p->v);
    skip_ws(p);
    if (peek(p) == '}') { p->pos++; p->depth--; return 0; }
    for (;;) {
        skip_ws(p);
        if (peek(p) != '"') { set_err(p, "expected string key"); return -1; }
        if (parse_string(p) < 0) return -1; /* key on stack */
        skip_ws(p);
        if (peek(p) != ':') { set_err(p, "expected ':'"); return -1; }
        p->pos++;
        skip_ws(p);
        if (parse_value(p) < 0) return -1; /* value on stack */
        sq_newslot(p->v, -3, SQFalse);
        skip_ws(p);
        int c = peek(p);
        if (c == ',') { p->pos++; continue; }
        if (c == '}') { p->pos++; p->depth--; return 0; }
        set_err(p, "expected ',' or '}' in object"); return -1;
    }
}

static int parse_value(JsonParser *p)
{
    skip_ws(p);
    int c = peek(p);
    if (c < 0) { set_err(p, "unexpected end of input"); return -1; }
    if (c == '"') return parse_string(p);
    if (c == '{') return parse_object(p);
    if (c == '[') return parse_array(p);
    if (c == '-' || (c >= '0' && c <= '9')) return parse_number(p);
    if (c == 't') {
        if (match_literal(p, "true") < 0) { set_err(p, "bad literal"); return -1; }
        sq_pushbool(p->v, SQTrue); return 0;
    }
    if (c == 'f') {
        if (match_literal(p, "false") < 0) { set_err(p, "bad literal"); return -1; }
        sq_pushbool(p->v, SQFalse); return 0;
    }
    if (c == 'n') {
        if (match_literal(p, "null") < 0) { set_err(p, "bad literal"); return -1; }
        sq_pushnull(p->v); return 0;
    }
    set_err(p, "unexpected character '%c'", (char)c);
    return -1;
}

static SQInteger sq_fn_json_parse(HSQUIRRELVM v)
{
    const SQChar *text = NULL;
    if (SQ_FAILED(sq_getstring(v, 2, &text)) || !text)
        return sq_throwerror(v, "json.parse: expected a string");
    SQInteger len = sq_getsize(v, 2);

    JsonParser p = { 0 };
    p.v = v;
    p.src = text;
    p.len = (gsize)len;

    SQInteger before = sq_gettop(v);
    if (parse_value(&p) < 0) {
        sq_settop(v, before);
        int line, col;
        compute_line_col(p.src, p.pos, &line, &col);
        char msg[320];
        g_snprintf(msg, sizeof(msg), "json.parse: %s at line %d, col %d",
                   p.err[0] ? p.err : "parse error", line, col);
        return sq_throwerror(v, msg);
    }
    skip_ws(&p);
    if (p.pos != p.len) {
        sq_settop(v, before);
        int line, col;
        compute_line_col(p.src, p.pos, &line, &col);
        char msg[160];
        g_snprintf(msg, sizeof(msg),
            "json.parse: trailing garbage at line %d, col %d", line, col);
        return sq_throwerror(v, msg);
    }
    return 1;
}

/* ─── Stringify ───────────────────────────────────────────────────────── */

typedef struct {
    GString *out;
    int      indent;   /* 0 = compact */
    int      depth;
    char     err[160];
} JsonWriter;

static int write_value(HSQUIRRELVM v, SQInteger idx, JsonWriter *w);

static void write_newline_indent(JsonWriter *w)
{
    if (w->indent <= 0) return;
    g_string_append_c(w->out, '\n');
    for (int i = 0; i < w->depth * w->indent; i++)
        g_string_append_c(w->out, ' ');
}

static void write_escaped_string(JsonWriter *w, const char *s, gsize n)
{
    g_string_append_c(w->out, '"');
    for (gsize i = 0; i < n; i++) {
        unsigned char c = (unsigned char)s[i];
        switch (c) {
        case '"':  g_string_append(w->out, "\\\""); break;
        case '\\': g_string_append(w->out, "\\\\"); break;
        case '\b': g_string_append(w->out, "\\b"); break;
        case '\f': g_string_append(w->out, "\\f"); break;
        case '\n': g_string_append(w->out, "\\n"); break;
        case '\r': g_string_append(w->out, "\\r"); break;
        case '\t': g_string_append(w->out, "\\t"); break;
        default:
            if (c < 0x20) {
                char buf[8];
                g_snprintf(buf, sizeof(buf), "\\u%04x", c);
                g_string_append(w->out, buf);
            } else {
                /* Emit raw bytes; assume already valid UTF-8. */
                g_string_append_c(w->out, (char)c);
            }
        }
    }
    g_string_append_c(w->out, '"');
}

static int write_array(HSQUIRRELVM v, SQInteger idx, JsonWriter *w)
{
    SQInteger aidx = (idx < 0) ? sq_gettop(v) + idx + 1 : idx;
    SQInteger len = sq_getsize(v, aidx);
    if (len == 0) { g_string_append(w->out, "[]"); return 0; }
    g_string_append_c(w->out, '[');
    w->depth++;
    for (SQInteger i = 0; i < len; i++) {
        if (i > 0) g_string_append_c(w->out, ',');
        write_newline_indent(w);
        sq_pushinteger(v, i);
        if (SQ_FAILED(sq_get(v, aidx))) {
            g_snprintf(w->err, sizeof(w->err),
                "json.stringify: failed to read array element %d", (int)i);
            return -1;
        }
        if (write_value(v, -1, w) < 0) { sq_poptop(v); return -1; }
        sq_poptop(v);
    }
    w->depth--;
    write_newline_indent(w);
    g_string_append_c(w->out, ']');
    return 0;
}

static int write_table(HSQUIRRELVM v, SQInteger idx, JsonWriter *w)
{
    SQInteger tidx = (idx < 0) ? sq_gettop(v) + idx + 1 : idx;
    g_string_append_c(w->out, '{');
    w->depth++;
    SQBool first = SQTrue;
    sq_pushnull(v); /* iterator */
    while (SQ_SUCCEEDED(sq_next(v, tidx))) {
        /* key at -2, value at -1 */
        if (sq_gettype(v, -2) != OT_STRING) {
            sq_pop(v, 2);
            g_snprintf(w->err, sizeof(w->err),
                "json.stringify: table key must be a string");
            sq_poptop(v); /* iterator */
            return -1;
        }
        if (!first) g_string_append_c(w->out, ',');
        first = SQFalse;
        write_newline_indent(w);
        const SQChar *k = NULL;
        sq_getstring(v, -2, &k);
        SQInteger klen = sq_getsize(v, -2);
        write_escaped_string(w, k, (gsize)klen);
        g_string_append_c(w->out, ':');
        if (w->indent > 0) g_string_append_c(w->out, ' ');
        if (write_value(v, -1, w) < 0) {
            sq_pop(v, 3); /* k, val, iter */
            return -1;
        }
        sq_pop(v, 2); /* k, val */
    }
    sq_poptop(v); /* iterator */
    w->depth--;
    if (!first) write_newline_indent(w);
    g_string_append_c(w->out, '}');
    return 0;
}

static int write_value(HSQUIRRELVM v, SQInteger idx, JsonWriter *w)
{
    if (w->depth > SQGI_JSON_MAX_DEPTH) {
        g_snprintf(w->err, sizeof(w->err),
            "json.stringify: nesting too deep (cycle?)");
        return -1;
    }
    SQObjectType t = sq_gettype(v, idx);
    switch (t) {
    case OT_NULL:
        g_string_append(w->out, "null");
        return 0;
    case OT_BOOL: {
        SQBool b; sq_getbool(v, idx, &b);
        g_string_append(w->out, b ? "true" : "false");
        return 0;
    }
    case OT_INTEGER: {
        SQInteger n; sq_getinteger(v, idx, &n);
        char buf[32];
        g_snprintf(buf, sizeof(buf), "%lld", (long long)n);
        g_string_append(w->out, buf);
        return 0;
    }
    case OT_FLOAT: {
        SQFloat f; sq_getfloat(v, idx, &f);
        double d = (double)f;
        if (isnan(d) || isinf(d)) {
            g_snprintf(w->err, sizeof(w->err),
                "json.stringify: %s is not representable in JSON",
                isnan(d) ? "NaN" : "Infinity");
            return -1;
        }
        char buf[G_ASCII_DTOSTR_BUF_SIZE];
        g_ascii_dtostr(buf, sizeof(buf), d);
        g_string_append(w->out, buf);
        /* Floats that happen to print without a '.' or exponent would
         * round-trip as integers. Append ".0" to preserve the JSON
         * number-is-fractional convention and the Squirrel type. */
        gboolean fractional = FALSE;
        for (const char *q = buf; *q; q++) {
            if (*q == '.' || *q == 'e' || *q == 'E' || *q == 'n' /* nan */ ||
                *q == 'i' /* inf */)
            {
                fractional = TRUE; break;
            }
        }
        if (!fractional) g_string_append(w->out, ".0");
        return 0;
    }
    case OT_STRING: {
        const SQChar *s; sq_getstring(v, idx, &s);
        SQInteger slen = sq_getsize(v, idx);
        write_escaped_string(w, s, (gsize)slen);
        return 0;
    }
    case OT_ARRAY:  return write_array(v, idx, w);
    case OT_TABLE:  return write_table(v, idx, w);
    case OT_INSTANCE: {
        /* Try _tojson metamethod. */
        SQInteger aidx = (idx < 0) ? sq_gettop(v) + idx + 1 : idx;
        sq_pushstring(v, "_tojson", -1);
        if (SQ_SUCCEEDED(sq_get(v, aidx)) &&
            (sq_gettype(v, -1) == OT_CLOSURE ||
             sq_gettype(v, -1) == OT_NATIVECLOSURE))
        {
            sq_push(v, aidx); /* this */
            if (SQ_FAILED(sq_call(v, 1, SQTrue, SQTrue))) {
                sq_poptop(v); /* closure */
                g_snprintf(w->err, sizeof(w->err),
                    "json.stringify: _tojson threw");
                return -1;
            }
            int r = write_value(v, -1, w);
            sq_pop(v, 2); /* result, closure */
            return r;
        }
        sq_poptop(v); /* whatever _tojson resolved to */
        g_snprintf(w->err, sizeof(w->err),
            "json.stringify: instance has no _tojson metamethod");
        return -1;
    }
    default:
        g_snprintf(w->err, sizeof(w->err),
            "json.stringify: unsupported value type");
        return -1;
    }
}

static SQInteger sq_fn_json_stringify(HSQUIRRELVM v)
{
    SQInteger top = sq_gettop(v);
    if (top < 2)
        return sq_throwerror(v, "json.stringify: missing value");
    int indent = 0;
    if (top >= 3 && sq_gettype(v, 3) == OT_INTEGER) {
        SQInteger n; sq_getinteger(v, 3, &n);
        if (n < 0) n = 0;
        if (n > 16) n = 16;
        indent = (int)n;
    }

    JsonWriter w = { 0 };
    w.out = g_string_new(NULL);
    w.indent = indent;

    if (write_value(v, 2, &w) < 0) {
        char msg[200];
        g_strlcpy(msg, w.err[0] ? w.err : "json.stringify: error",
                  sizeof(msg));
        g_string_free(w.out, TRUE);
        return sq_throwerror(v, msg);
    }

    sq_pushstring(v, w.out->str, (SQInteger)w.out->len);
    g_string_free(w.out, TRUE);
    return 1;
}

/* ─── Registration ────────────────────────────────────────────────────── */

void sqgi_json_register_helpers(HSQUIRRELVM v)
{
    sq_pushroottable(v);
    sq_pushstring(v, "sqgi", -1);
    if (SQ_FAILED(sq_rawget(v, -2))) {
        sq_poptop(v);
        return;
    }

    /* sqgi.json = { parse = ..., stringify = ... } */
    sq_pushstring(v, "json", -1);
    sq_newtable(v);

    sq_pushstring(v, "parse", -1);
    sq_newclosure(v, sq_fn_json_parse, 0);
    sq_setnativeclosurename(v, -1, "json.parse");
    sq_newslot(v, -3, SQFalse);

    sq_pushstring(v, "stringify", -1);
    sq_newclosure(v, sq_fn_json_stringify, 0);
    sq_setnativeclosurename(v, -1, "json.stringify");
    sq_newslot(v, -3, SQFalse);

    sq_newslot(v, -3, SQFalse); /* sqgi.json */
    sq_pop(v, 2); /* sqgi, root */
}
