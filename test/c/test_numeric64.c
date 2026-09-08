/* Public ABI, decimal literals, serialization and native double round trips. */
#include <sqgi_vm.h>
#include <sqgi_marshal.h>
#include <float.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

_Static_assert(sizeof(SQInteger) == 8 && (SQInteger)-1 < 0, "SQGI requires int64");
_Static_assert(sizeof(SQFloat) == 8 && DBL_MANT_DIG == 53, "SQGI requires binary64");
#define CHECK(c, msg) do { if (!(c)) { fprintf(stderr, "FAIL: %s\n", msg); rc = 1; } } while (0)

typedef struct { GByteArray *bytes; size_t pos; } Stream;
static SQInteger write_bytes(SQUserPointer ctx, SQUserPointer data, SQInteger n)
{
    if (n < 0 || (SQUnsignedInteger)n > G_MAXUINT) return -1;
    g_byte_array_append(((Stream *)ctx)->bytes, data, (guint)n);
    return n;
}
static SQInteger read_bytes(SQUserPointer ctx, SQUserPointer data, SQInteger n)
{
    Stream *s = ctx;
    if (n < 0 || (size_t)n > s->bytes->len - s->pos) return -1;
    memcpy(data, s->bytes->data + s->pos, (size_t)n);
    s->pos += (size_t)n;
    return n;
}
int main(void)
{
    int rc = 0;
    HSQUIRRELVM v = sqgi_vm_new();
    if (!v) return 1;
    const SQFloat precise = 0x1.0000000001p0; /* 1 + 2^-40 */
    const SQInteger large = 9007199254740993LL; /* above binary64's exact range */
    SQFloat f = 0;
    SQInteger i = 0;
    sq_pushfloat(v, precise);
    CHECK(SQ_SUCCEEDED(sq_getfloat(v, -1, &f)) && f == precise, "C double ABI round trip");
    sq_pop(v, 1);
    sq_pushinteger(v, large);
    CHECK(SQ_SUCCEEDED(sq_getinteger(v, -1, &i)) && i == large, "C int64 ABI round trip");
    sq_pop(v, 1);

    GValue source = G_VALUE_INIT, result = G_VALUE_INIT;
    g_value_init(&source, G_TYPE_DOUBLE); g_value_set_double(&source, precise);
    g_value_init(&result, G_TYPE_DOUBLE);
    sqgi_push_gvalue(v, &source);
    CHECK(SQ_SUCCEEDED(sq_getfloat(v, -1, &f)) && f == precise, "GValue double input precision");
    CHECK(SQ_SUCCEEDED(sqgi_get_gvalue(v, -1, &result)) && g_value_get_double(&result) == precise,
        "GValue double output precision");
    sq_pop(v, 1); g_value_unset(&source); g_value_unset(&result);

    const char *script =
        "if (_intsize_ != 8 || _floatsize_ != 8) throw \"numeric widths\";\n"
        "local precise = 1.0000000000009094947017729282379150390625;\n"
        "if (precise - 1.0 != 0.0000000000009094947017729282379150390625) throw \"decimal precision\";\n"
        "if (16777217.0 - 16777216.0 != 1.0) throw \"float arithmetic precision\";\n"
        "if (9007199254740993 - 9007199254740992 != 1) throw \"int64 arithmetic\";\n"
        "if (1.0e200 <= 1.0e100 || 1.0e-200 == 0.0) throw \"double range\";\n"
        "if (sqgi.json.parse(sqgi.json.stringify(precise)) != precise) throw \"JSON double precision\";\n"
        "if (sqgi.json.parse(sqgi.json.stringify(9007199254740993)) != 9007199254740993) throw \"JSON int64 precision\";\n"
        "local GLib = import(\"GLib\");\n"
        "if (GLib.Variant.new_double(precise).get_double() != precise) throw \"GI double precision\";\n"
        "function precise_step(x) { return x + 0.0000000000009094947017729282379150390625 }\n"
        "function precise_loop(n) { local x = 1.0; for(local j=0;j<n;j++) x=precise_step(x); return x }\n"
        "for(local k=0;k<3;k++) if(precise_loop(1000)-1.0 != 0.0000000009094947017729282379150390625) throw \"JIT double precision\";\n";
    CHECK(SQ_SUCCEEDED(sqgi_vm_dobuffer(v, script, strlen(script), "numeric64")), "script numeric64 contracts");

    Stream stream = { g_byte_array_new(), 0 };
    const char *literal = "return 1.0000000000009094947017729282379150390625";
    CHECK(SQ_SUCCEEDED(sq_compilebuffer(v, literal, strlen(literal), "numeric64-stream", SQTrue)), "compile double literal");
    CHECK(SQ_SUCCEEDED(sq_writeclosure(v, write_bytes, &stream)), "serialize double literal");
    sq_settop(v, 0);
    CHECK(SQ_SUCCEEDED(sq_readclosure(v, read_bytes, &stream)), "deserialize double literal");
    sq_pushroottable(v);
    CHECK(SQ_SUCCEEDED(sq_call(v, 1, SQTrue, SQTrue)) &&
        SQ_SUCCEEDED(sq_getfloat(v, -1, &f)) && f == precise, "serialized double retains precision");
    sq_settop(v, 0);
    /* Bytecode records numeric widths. Old single-precision streams must be
     * rejected before interpreting their four-byte literal payloads. */
    const size_t float_size_offset = sizeof(unsigned short) + 3 * sizeof(SQUnsignedInteger32);
    if (stream.bytes->len >= float_size_offset + sizeof(SQUnsignedInteger32)) {
        SQUnsignedInteger32 old_size = 4;
        memcpy(stream.bytes->data + float_size_offset, &old_size, sizeof(old_size));
        stream.pos = 0;
        CHECK(SQ_FAILED(sq_readclosure(v, read_bytes, &stream)), "reject float32 bytecode ABI");
    } else CHECK(0, "serialized header exists");
    g_byte_array_unref(stream.bytes);
    sqgi_vm_free(v);
    return rc;
}
