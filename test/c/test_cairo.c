/* Cairo ownership and raster assertions independent of the Squirrel wrappers. */
#include "sqgi_vm.h"
#include "sqgi_cairo.h"
#include "sqgi_marshal.h"
#include <cairo-gobject.h>
#include <glib.h>
#include <stdint.h>
#include <string.h>

static void run(HSQUIRRELVM v, const char *source)
{
    SQInteger top = sq_gettop(v);
    g_assert_cmpint(sqgi_vm_dobuffer(v, source, (SQInteger)strlen(source),
                                   "cairo-native-test"), ==, SQ_OK);
    g_assert_cmpint(sq_gettop(v), ==, top);
}

static void put(HSQUIRRELVM v, const char *name, const char *type, void *p, int adopt)
{
    sq_pushroottable(v);
    sq_pushstring(v, name, -1);
    g_assert_cmpint(sqgi_cairo_try_push_foreign(v, type, p, adopt), ==, 1);
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);
}

static uint32_t pixel(cairo_surface_t *s, int x, int y)
{
    cairo_surface_flush(s);
    uint32_t value;
    memcpy(&value, cairo_image_surface_get_data(s) +
        y * cairo_image_surface_get_stride(s) + x * 4, sizeof(value));
    return value;
}

static void test_lifetime(HSQUIRRELVM v)
{
    cairo_surface_t *s = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 4, 4);
    cairo_t *cr = cairo_create(s);
    cairo_set_source_rgb(cr, 1, 0, 0);
    cairo_pattern_t *p = cairo_pattern_reference(cairo_get_source(cr));
    put(v, "c", "cairo.Context", cr, 0);
    g_assert_cmpuint(cairo_get_reference_count(cr), ==, 2);
    run(v, "for (local i = 0; i < 100; i++) {"
           " local a = c.get_source(); a.set_extend(3);"
           " local failures = 0;"
           " try { a.set_extend(4294967299); } catch(e) { failures++; }"
           " try { c.set_source(c.get_target()); } catch(e) { failures++; }"
           " assert(failures == 2 && a.get_extend() == 3);"
           " assert(a.status() == 0 && c.status() == 0); } collectgarbage();");
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 2);
    run(v, "::p <- c.get_source(); ::q <- c.get_source();");
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 4);
    run(v, "p = null; q = null; collectgarbage();"
           "for (local i = 0; i < 2000; i++) {"
           " local a = c.get_source(); a.set_extend(i % 4);"
           " if (i % 100 == 0) collectgarbage(); } collectgarbage();");
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 2);
    run(v, "::p = c.get_source(); c.set_source_rgb(0, 0, 1); c = null; collectgarbage();");
    g_assert_cmpuint(cairo_get_reference_count(cr), ==, 1);
    cairo_destroy(cr);
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 2);
    cr = cairo_create(s);
    put(v, "c", "cairo.Context", cr, 0);
    run(v, "c.set_source(p); p = null; collectgarbage(); c.paint();");
    g_assert_cmpuint(pixel(s, 0, 0), ==, 0xffff0000u);
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 2);
    run(v, "c = null; collectgarbage();");
    cairo_destroy(cr);
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 1);
    cairo_pattern_destroy(p);

    /* get_target has the same borrowed-pointer ownership contract. */
    cr = cairo_create(s);
    put(v, "c", "cairo.Context", cr, 1);
    run(v, "::target <- c.get_target(); c = null; collectgarbage();"
           "assert(target.get_width() == 4);");
    g_assert_cmpuint(cairo_surface_get_reference_count(s), ==, 2);
    run(v, "target = null; collectgarbage();");
    g_assert_cmpuint(cairo_surface_get_reference_count(s), ==, 1);
    cairo_surface_destroy(s);

    /* An adopted wrapper must release exactly the reference passed to it. */
    p = cairo_pattern_create_rgb(0, 1, 0);
    cairo_pattern_reference(p); /* observer */
    put(v, "p", "cairo.Pattern", p, 1);
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 2);
    run(v, "p = null; collectgarbage();");
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 1);
    cairo_pattern_destroy(p);
}

static void test_pixels(HSQUIRRELVM v)
{
    const uint32_t red = 0xffff0000u, blue = 0xff0000ffu;
    const uint32_t expected[4][6] = {
        {0, 0, red, blue, 0, 0},
        {red, blue, red, blue, red, blue},
        {blue, red, red, blue, blue, red},
        {red, red, red, blue, blue, blue}
    };
    cairo_surface_t *source = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 2, 1);
    cairo_t *draw = cairo_create(source);
    cairo_set_source_rgb(draw, 1, 0, 0);
    cairo_paint(draw);
    cairo_set_source_rgb(draw, 0, 0, 1);
    cairo_rectangle(draw, 1, 0, 1, 1);
    cairo_fill(draw);
    cairo_destroy(draw);
    put(v, "source", "cairo.Surface", source, 0);
    for (int mode = 0; mode < 4; ++mode) {
        cairo_surface_t *target = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 6, 1);
        cairo_t *cr = cairo_create(target);
        put(v, "c", "cairo.Context", cr, 0);
        char code[256];
        g_snprintf(code, sizeof(code),
            "c.set_source_surface(source, 2, 0);"
            "c.get_source().set_extend(%d); c.paint(); c = null; collectgarbage();", mode);
        run(v, code);
        for (int x = 0; x < 6; ++x)
            g_assert_cmphex(pixel(target, x, 0), ==, expected[mode][x]);
        g_assert_cmpint(cairo_status(cr), ==, CAIRO_STATUS_SUCCESS);
        cairo_destroy(cr);
        cairo_surface_destroy(target);
    }
    run(v, "source = null; collectgarbage();");
    g_assert_cmpuint(cairo_surface_get_reference_count(source), ==, 1);
    cairo_surface_destroy(source);
}

static void test_boxed(HSQUIRRELVM v)
{
    cairo_surface_t *s = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 4, 4);
    cairo_t *cr = cairo_create(s);
    cairo_pattern_t *p = cairo_pattern_create_rgb(1, 0, 0);
    const GType types[] = {CAIRO_GOBJECT_TYPE_CONTEXT, CAIRO_GOBJECT_TYPE_SURFACE,
                           CAIRO_GOBJECT_TYPE_PATTERN};
    void *objects[] = {cr, s, p};
    const char *scripts[] = {
        "boxed.get_source().set_extend(3); boxed.paint(); assert(boxed.status() == 0);",
        "assert(boxed.get_width() == 4);",
        "boxed.set_extend(2); assert(boxed.get_extend() == 2);"
    };
    for (size_t i = 0; i < G_N_ELEMENTS(types); ++i) {
        GValue value = G_VALUE_INIT;
        g_value_init(&value, types[i]);
        g_value_set_boxed(&value, objects[i]);
        sq_pushroottable(v);
        sq_pushstring(v, "boxed", -1);
        sqgi_push_gvalue(v, &value);
        sq_newslot(v, -3, SQFalse);
        sq_pop(v, 1);
        g_value_unset(&value); /* The wrapper outlives the signal's GValue. */
        run(v, scripts[i]);
        run(v, "boxed = null; collectgarbage();");
    }
    g_assert_cmpuint(cairo_get_reference_count(cr), ==, 1);
    g_assert_cmpuint(cairo_pattern_get_reference_count(p), ==, 1);
    cairo_destroy(cr);
    g_assert_cmpuint(cairo_surface_get_reference_count(s), ==, 1);
    cairo_surface_destroy(s);
    cairo_pattern_destroy(p);
}

int main(void)
{
    HSQUIRRELVM v = sqgi_vm_new();
    g_assert_nonnull(v);
    test_lifetime(v);
    test_pixels(v);
    test_boxed(v);
    sqgi_vm_free(v);
    g_print("Cairo native ownership and pixel tests passed\n");
    return 0;
}
