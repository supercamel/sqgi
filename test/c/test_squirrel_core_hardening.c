#include <sqgi_vm.h>

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TEST_CLOSURESTREAM_HEAD \
    (((SQUnsignedInteger32)'S' << 24) | ((SQUnsignedInteger32)'Q' << 16) | \
     ((SQUnsignedInteger32)'I' << 8) | (SQUnsignedInteger32)'R')
#define TEST_CLOSURESTREAM_PART \
    (((SQUnsignedInteger32)'P' << 24) | ((SQUnsignedInteger32)'A' << 16) | \
     ((SQUnsignedInteger32)'R' << 8) | (SQUnsignedInteger32)'T')
#define CHECK(cond, msg) \
    do { if (!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); rc = 1; } } while (0)

typedef struct {
    unsigned char *data;
    size_t len;
    size_t cap;
    size_t pos;
} Buffer;

static void buffer_free(Buffer *b)
{
    free(b->data);
    b->data = NULL;
    b->len = b->cap = b->pos = 0;
}

static int buffer_append(Buffer *b, const void *src, size_t size)
{
    if (size > SIZE_MAX - b->len) return 0;
    size_t need = b->len + size;
    if (need > b->cap) {
        size_t cap = b->cap ? b->cap * 2 : 128;
        while (cap < need) {
            if (cap > SIZE_MAX / 2) {
                cap = need;
                break;
            }
            cap *= 2;
        }
        unsigned char *data = (unsigned char *)realloc(b->data, cap);
        if (!data) return 0;
        b->data = data;
        b->cap = cap;
    }
    memcpy(b->data + b->len, src, size);
    b->len += size;
    return 1;
}

static SQInteger buffer_write(SQUserPointer up, SQUserPointer data, SQInteger size)
{
    Buffer *b = (Buffer *)up;
    if (size < 0) return 0;
    return buffer_append(b, data, (size_t)size) ? size : 0;
}

static SQInteger buffer_read(SQUserPointer up, SQUserPointer data, SQInteger size)
{
    Buffer *b = (Buffer *)up;
    if (size < 0 || (size_t)size > b->len - b->pos) return 0;
    memcpy(data, b->data + b->pos, (size_t)size);
    b->pos += (size_t)size;
    return size;
}

static void put_u16(Buffer *b, unsigned short value)
{
    buffer_append(b, &value, sizeof(value));
}

static void put_u32(Buffer *b, SQUnsignedInteger32 value)
{
    buffer_append(b, &value, sizeof(value));
}

static void put_sqinteger(Buffer *b, SQInteger value)
{
    buffer_append(b, &value, sizeof(value));
}

static void put_object_null(Buffer *b)
{
    put_u32(b, (SQUnsignedInteger32)OT_NULL);
}

static void put_closure_header(Buffer *b)
{
    put_u16(b, SQ_BYTECODE_STREAM_TAG);
    put_u32(b, TEST_CLOSURESTREAM_HEAD);
    put_u32(b, (SQUnsignedInteger32)sizeof(SQChar));
    put_u32(b, (SQUnsignedInteger32)sizeof(SQInteger));
    put_u32(b, (SQUnsignedInteger32)sizeof(SQFloat));
}

static int expect_readclosure_failure(HSQUIRRELVM v, Buffer *b, const char *name)
{
    int rc = 0;
    b->pos = 0;
    SQRESULT res = sq_readclosure(v, buffer_read, b);
    CHECK(SQ_FAILED(res), name);
    return rc;
}

static int test_rejects_negative_string_length(HSQUIRRELVM v)
{
    int rc = 0;
    Buffer b = {0};

    put_closure_header(&b);
    put_u32(&b, TEST_CLOSURESTREAM_PART);
    put_u32(&b, (SQUnsignedInteger32)OT_STRING);
    put_sqinteger(&b, (SQInteger)-1);

    rc |= expect_readclosure_failure(v, &b, "reject negative serialized string length");
    buffer_free(&b);
    return rc;
}

static int test_rejects_invalid_function_counts(HSQUIRRELVM v)
{
    int rc = 0;
    Buffer b = {0};

    put_closure_header(&b);
    put_u32(&b, TEST_CLOSURESTREAM_PART);
    put_object_null(&b);
    put_object_null(&b);
    put_u32(&b, TEST_CLOSURESTREAM_PART);
    put_sqinteger(&b, (SQInteger)-1); /* nliterals */
    put_sqinteger(&b, (SQInteger)0);  /* nparameters */
    put_sqinteger(&b, (SQInteger)0);  /* noutervalues */
    put_sqinteger(&b, (SQInteger)0);  /* nlocalvarinfos */
    put_sqinteger(&b, (SQInteger)0);  /* nlineinfos */
    put_sqinteger(&b, (SQInteger)0);  /* ndefaultparams */
    put_sqinteger(&b, (SQInteger)1);  /* ninstructions */
    put_sqinteger(&b, (SQInteger)0);  /* nfunctions */

    rc |= expect_readclosure_failure(v, &b, "reject negative function proto count");
    buffer_free(&b);
    return rc;
}

static int test_nested_closure_roundtrip(HSQUIRRELVM v)
{
    int rc = 0;
    Buffer b = {0};
    const char *script =
        "function outer() {\n"
        "  function inner() { return 42 }\n"
        "  return inner()\n"
        "}\n"
        "return outer()\n";

    CHECK(SQ_SUCCEEDED(sq_compilebuffer(v, script, (SQInteger)strlen(script),
                                        "nested-roundtrip", SQTrue)),
          "compile nested closure script");
    if (rc) return rc;

    CHECK(SQ_SUCCEEDED(sq_writeclosure(v, buffer_write, &b)),
          "write nested closure");
    sq_pop(v, 1);
    if (rc) {
        buffer_free(&b);
        return rc;
    }

    b.pos = 0;
    CHECK(SQ_SUCCEEDED(sq_readclosure(v, buffer_read, &b)),
          "read nested closure");
    if (!rc) {
        sq_pushroottable(v);
        CHECK(SQ_SUCCEEDED(sq_call(v, 1, SQTrue, SQTrue)),
              "call nested closure");
        if (!rc) {
            SQInteger value = 0;
            CHECK(SQ_SUCCEEDED(sq_getinteger(v, -1, &value)) && value == 42,
                  "nested closure result");
            sq_pop(v, 1);
        }
        sq_pop(v, 1);
    }

    buffer_free(&b);
    return rc;
}

static int test_rejects_oversized_userdata(HSQUIRRELVM v)
{
    int rc = 0;
    SQInteger top = sq_gettop(v);
    SQUserPointer bad = sq_newuserdata(v, (SQUnsignedInteger)-1);
    CHECK(bad == NULL, "oversized userdata returns NULL");
    CHECK(sq_gettop(v) == top, "oversized userdata leaves stack unchanged");

    SQUserPointer good = sq_newuserdata(v, 16);
    CHECK(good != NULL, "normal userdata still allocates");
    CHECK(sq_gettop(v) == top + 1, "normal userdata is pushed");
    sq_pop(v, 1);
    return rc;
}

int main(void)
{
    int rc = 0;
    HSQUIRRELVM v = sqgi_vm_new();
    if (!v) {
        fprintf(stderr, "FAIL: sqgi_vm_new failed\n");
        return 1;
    }

    rc |= test_rejects_negative_string_length(v);
    rc |= test_rejects_invalid_function_counts(v);
    rc |= test_nested_closure_roundtrip(v);
    rc |= test_rejects_oversized_userdata(v);

    sqgi_vm_free(v);

    if (rc == 0) printf("[OK] test_squirrel_core_hardening\n");
    return rc;
}
