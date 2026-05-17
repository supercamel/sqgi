/* test/c/test_gvalue_branches.c
 *
 * Drives every G_TYPE_* branch in sqgi_push_gvalue / sqgi_get_gvalue that
 * is unreachable from Squirrel because no GI-introspected property uses
 * those fundamental types (INT64, UINT64, LONG, ULONG, DOUBLE-as-property,
 * BOXED, POINTER, VARIANT-as-GValue).
 *
 * We test the marshal helpers directly by calling them with hand-built
 * GValues, then asserting on the Squirrel-side result.
 */

#include <sqgi_vm.h>
#include <sqgi_marshal.h>

#include <glib-object.h>
#include <stdio.h>
#include <string.h>

#define CHECK(cond, msg) \
    do { if (!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); rc = 1; } } while (0)

static int test_push_branch(HSQUIRRELVM v, const char *name,
                            GValue *gv, SQObjectType want_type,
                            SQInteger want_int, double want_float)
{
    int rc = 0;
    sqgi_push_gvalue(v, gv);
    SQObjectType got_type = sq_gettype(v, -1);
    CHECK(got_type == want_type, name);
    if (want_type == OT_INTEGER) {
        SQInteger n = 0;
        sq_getinteger(v, -1, &n);
        if (n != want_int) {
            fprintf(stderr, "FAIL: %s value: got %lld want %lld\n",
                    name, (long long)n, (long long)want_int);
            rc = 1;
        }
    } else if (want_type == OT_FLOAT) {
        SQFloat f = 0;
        sq_getfloat(v, -1, &f);
        if ((double)f < want_float - 0.001 || (double)f > want_float + 0.001) {
            fprintf(stderr, "FAIL: %s value: got %f want %f\n",
                    name, (double)f, want_float);
            rc = 1;
        }
    }
    sq_pop(v, 1);
    g_value_unset(gv);
    return rc;
}

int main(void)
{
    HSQUIRRELVM v = sqgi_vm_new();
    if (!v) return 1;
    int rc = 0;
    GValue gv = G_VALUE_INIT;

    /* INT64 push */
    g_value_init(&gv, G_TYPE_INT64);
    g_value_set_int64(&gv, (gint64)123456789012LL);
    rc |= test_push_branch(v, "push INT64", &gv, OT_INTEGER,
                           123456789012LL, 0);

    /* UINT64 */
    g_value_init(&gv, G_TYPE_UINT64);
    g_value_set_uint64(&gv, (guint64)987654321098ULL);
    rc |= test_push_branch(v, "push UINT64", &gv, OT_INTEGER,
                           987654321098LL, 0);

    /* LONG */
    g_value_init(&gv, G_TYPE_LONG);
    g_value_set_long(&gv, (glong)-77777);
    rc |= test_push_branch(v, "push LONG", &gv, OT_INTEGER, -77777, 0);

    /* ULONG */
    g_value_init(&gv, G_TYPE_ULONG);
    g_value_set_ulong(&gv, (gulong)888888);
    rc |= test_push_branch(v, "push ULONG", &gv, OT_INTEGER, 888888, 0);

    /* FLOAT */
    g_value_init(&gv, G_TYPE_FLOAT);
    g_value_set_float(&gv, 1.5f);
    rc |= test_push_branch(v, "push FLOAT", &gv, OT_FLOAT, 0, 1.5);

    /* DOUBLE */
    g_value_init(&gv, G_TYPE_DOUBLE);
    g_value_set_double(&gv, 2.75);
    rc |= test_push_branch(v, "push DOUBLE", &gv, OT_FLOAT, 0, 2.75);

    /* STRING (null) */
    g_value_init(&gv, G_TYPE_STRING);
    g_value_set_string(&gv, NULL);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_NULL, "push STRING NULL → null");
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* BOXED (we pass a dummy pointer — handler should wrap as userpointer) */
    g_value_init(&gv, G_TYPE_HASH_TABLE);  /* G_TYPE_HASH_TABLE is BOXED */
    GHashTable *ht = g_hash_table_new(g_str_hash, g_str_equal);
    g_value_set_boxed(&gv, ht);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_USERPOINTER, "push BOXED → userpointer");
    sq_pop(v, 1);
    g_value_unset(&gv);
    g_hash_table_unref(ht);

    /* POINTER */
    g_value_init(&gv, G_TYPE_POINTER);
    g_value_set_pointer(&gv, (gpointer)0x1234);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_USERPOINTER, "push POINTER → userpointer");
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* POINTER (NULL) */
    g_value_init(&gv, G_TYPE_POINTER);
    g_value_set_pointer(&gv, NULL);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_NULL, "push POINTER NULL → null");
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* OBJECT NULL */
    g_value_init(&gv, G_TYPE_OBJECT);
    g_value_set_object(&gv, NULL);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_NULL, "push OBJECT NULL → null");
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* VARIANT (via G_TYPE_VARIANT) — unwrap to Squirrel string */
    g_value_init(&gv, G_TYPE_VARIANT);
    GVariant *gvar = g_variant_new_string("hello-variant");
    g_value_set_variant(&gv, gvar);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_STRING, "push VARIANT(string) → string");
    if (sq_gettype(v, -1) == OT_STRING) {
        const SQChar *s = NULL;
        sq_getstring(v, -1, &s);
        CHECK(s && strcmp(s, "hello-variant") == 0,
              "VARIANT(string) value matches");
    }
    sq_pop(v, 1);
    g_value_unset(&gv);
    /* g_value_unset on G_TYPE_VARIANT unrefs the variant */

    /* VARIANT (NULL) */
    g_value_init(&gv, G_TYPE_VARIANT);
    g_value_set_variant(&gv, NULL);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_NULL, "push VARIANT NULL → null");
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* PARAM (GParamSpec) */
    GParamSpec *pspec = g_param_spec_string("p-name", "p-nick", "p-blurb",
                                             "default", G_PARAM_READWRITE);
    g_value_init(&gv, G_TYPE_PARAM);
    g_value_set_param(&gv, pspec);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_TABLE, "push PARAM → table");
    sq_pop(v, 1);
    g_value_unset(&gv);
    g_param_spec_unref(pspec);

    /* PARAM (NULL pspec) — code returns null */
    g_value_init(&gv, G_TYPE_PARAM);
    g_value_set_param(&gv, NULL);
    sqgi_push_gvalue(v, &gv);
    CHECK(sq_gettype(v, -1) == OT_NULL, "push PARAM NULL → null");
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* ── sqgi_get_gvalue (Squirrel → GValue) for the underused branches ── */

    /* INT64 get */
    g_value_init(&gv, G_TYPE_INT64);
    sq_pushinteger(v, 11111111111LL);
    if (sqgi_get_gvalue(v, -1, &gv) != SQ_OK) {
        fprintf(stderr, "FAIL: get_gvalue INT64\n"); rc = 1;
    } else {
        CHECK(g_value_get_int64(&gv) == 11111111111LL, "get INT64");
    }
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* UINT64 get */
    g_value_init(&gv, G_TYPE_UINT64);
    sq_pushinteger(v, 22222222222LL);
    if (sqgi_get_gvalue(v, -1, &gv) != SQ_OK) {
        fprintf(stderr, "FAIL: get_gvalue UINT64\n"); rc = 1;
    } else {
        CHECK(g_value_get_uint64(&gv) == 22222222222ULL, "get UINT64");
    }
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* FLOAT get */
    g_value_init(&gv, G_TYPE_FLOAT);
    sq_pushfloat(v, 3.5);
    if (sqgi_get_gvalue(v, -1, &gv) != SQ_OK) {
        fprintf(stderr, "FAIL: get_gvalue FLOAT\n"); rc = 1;
    } else {
        float got = g_value_get_float(&gv);
        CHECK(got > 3.49f && got < 3.51f, "get FLOAT");
    }
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* DOUBLE get */
    g_value_init(&gv, G_TYPE_DOUBLE);
    sq_pushfloat(v, 7.25);
    if (sqgi_get_gvalue(v, -1, &gv) != SQ_OK) {
        fprintf(stderr, "FAIL: get_gvalue DOUBLE\n"); rc = 1;
    } else {
        double got = g_value_get_double(&gv);
        CHECK(got > 7.24 && got < 7.26, "get DOUBLE");
    }
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* OBJECT get from null */
    g_value_init(&gv, G_TYPE_OBJECT);
    sq_pushnull(v);
    if (sqgi_get_gvalue(v, -1, &gv) != SQ_OK) {
        fprintf(stderr, "FAIL: get_gvalue OBJECT null\n"); rc = 1;
    } else {
        CHECK(g_value_get_object(&gv) == NULL, "get OBJECT null");
    }
    sq_pop(v, 1);
    g_value_unset(&gv);

    /* Unsupported type → error */
    g_value_init(&gv, G_TYPE_GTYPE);
    sq_pushinteger(v, 0);
    if (sqgi_get_gvalue(v, -1, &gv) == SQ_OK) {
        fprintf(stderr, "FAIL: unsupported GValue type did not error\n");
        rc = 1;
    }
    sq_pop(v, 1);
    /* Reset the squirrel error state */
    sq_reseterror(v);
    g_value_unset(&gv);

    sqgi_vm_free(v);
    if (rc == 0) printf("[OK] test_gvalue_branches\n");
    return rc;
}
