/* sqgi_cairo.c — see sqgi_cairo.h. */

#include "sqgi_cairo.h"
#include "sqgi_gi_object.h"
#include "sqgi_stack.h"

#include <limits.h>
#include <stdlib.h>
#include <string.h>

#define SQGI_CAIRO_REG_SLOT "sqgi_cairo_classes"

/* ── stack helpers ───────────────────────────────────────────────────────── */

static int sqc_tofloat(HSQUIRRELVM v, SQInteger idx, SQFloat *out)
{
    SQObjectType t = sq_gettype(v, idx);
    if (t == OT_FLOAT) {
        return sq_getfloat(v, idx, out);
    }
    if (t == OT_INTEGER) {
        SQInteger i;
        if (SQ_FAILED(sq_getinteger(v, idx, &i))) return SQ_ERROR;
        *out = (SQFloat)i;
        return SQ_OK;
    }
    return SQ_ERROR;
}

#define ARG_F(idx, name)                                                       \
    SQFloat name;                                                              \
    if (SQ_FAILED(sqc_tofloat(v, (idx), &name)))                               \
        return sq_throwerror(v, "cairo: expected numeric argument #" #idx)

#define ARG_I(idx, name)                                                       \
    SQInteger name;                                                            \
    if (SQ_FAILED(sq_getinteger(v, (idx), &name)))                             \
        return sq_throwerror(v, "cairo: expected integer argument #" #idx)

#define ARG_S(idx, name)                                                       \
    const SQChar *name;                                                        \
    if (SQ_FAILED(sq_getstring(v, (idx), &name)))                              \
        return sq_throwerror(v, "cairo: expected string argument #" #idx)

/* ── userdata extraction ─────────────────────────────────────────────────── */

static cairo_t *get_cr(HSQUIRRELVM v, SQInteger idx)
{
    SQUserPointer p = NULL;
    if (SQ_FAILED(sq_getinstanceup(v, idx, &p, NULL, SQFalse)) || !p) {
        sq_throwerror(v, "cairo: 'this' is not a cairo.Context");
        return NULL;
    }
    return (cairo_t *)p;
}

static cairo_surface_t *get_surface(HSQUIRRELVM v, SQInteger idx)
{
    SQUserPointer p = NULL;
    if (SQ_FAILED(sq_getinstanceup(v, idx, &p, NULL, SQFalse)) || !p) {
        sq_throwerror(v, "cairo: expected cairo.Surface");
        return NULL;
    }
    return (cairo_surface_t *)p;
}

static cairo_pattern_t *get_pattern(HSQUIRRELVM v, SQInteger idx)
{
    SQUserPointer p = NULL;
    if (SQ_FAILED(sq_getinstanceup(v, idx, &p, NULL, SQFalse)) || !p) {
        sq_throwerror(v, "cairo: expected cairo.Pattern");
        return NULL;
    }
    return (cairo_pattern_t *)p;
}

/* ── release hooks ───────────────────────────────────────────────────────── */

static SQInteger ctx_release(SQUserPointer p, SQInteger size)
{
    (void)size;
    if (p) cairo_destroy((cairo_t *)p);
    return 0;
}

static SQInteger surf_release(SQUserPointer p, SQInteger size)
{
    (void)size;
    if (p) cairo_surface_destroy((cairo_surface_t *)p);
    return 0;
}

static SQInteger patt_release(SQUserPointer p, SQInteger size)
{
    (void)size;
    if (p) cairo_pattern_destroy((cairo_pattern_t *)p);
    return 0;
}

/* ── instance push helpers (internal) ────────────────────────────────────── */

/* Pop class from top of stack; create instance with `ptr` as its userdata
 * and `release_hook` as its _gc. */
static void push_instance(HSQUIRRELVM v, void *ptr, SQRELEASEHOOK release_hook)
{
    sq_createinstance(v, -1);
    sq_remove(v, -2);                       /* drop class */
    sq_setinstanceup(v, -1, (SQUserPointer)ptr);
    sq_setreleasehook(v, -1, release_hook);
}

/* Push the cairo class registered under `full_key` (e.g. "cairo.Context") and
 * leave it on the top of the stack. Returns SQ_OK if found. */
static SQRESULT push_cairo_class(HSQUIRRELVM v, const char *full_key)
{
    sq_pushregistrytable(v);
    sq_pushstring(v, SQGI_CAIRO_REG_SLOT, -1);
    if (SQ_FAILED(sq_rawget(v, -2))) { sq_pop(v, 1); return SQ_ERROR; }
    /* stack: [registry, sqgi_cairo_classes] */
    sq_pushstring(v, full_key, -1);
    SQRESULT r = sq_rawget(v, -2);
    if (SQ_FAILED(r)) { sq_pop(v, 2); return SQ_ERROR; }
    /* stack: [registry, sqgi_cairo_classes, class] */
    sq_remove(v, -2); /* sqgi_cairo_classes */
    sq_remove(v, -2); /* registry */
    return SQ_OK;
}

void sqgi_cairo_push_context(HSQUIRRELVM v, cairo_t *cr, int adopt)
{
    if (!cr) { sq_pushnull(v); return; }
    if (!adopt) cairo_reference(cr);
    if (SQ_FAILED(push_cairo_class(v, "cairo.Context"))) {
        if (!adopt) cairo_destroy(cr);
        else        cairo_destroy(cr);
        sq_throwerror(v, "cairo: Context class not registered");
        sq_pushnull(v);
        return;
    }
    push_instance(v, cr, ctx_release);
}

void sqgi_cairo_push_surface(HSQUIRRELVM v, cairo_surface_t *s, int adopt)
{
    if (!s) { sq_pushnull(v); return; }
    if (!adopt) cairo_surface_reference(s);
    if (SQ_FAILED(push_cairo_class(v, "cairo.Surface"))) {
        cairo_surface_destroy(s);
        sq_throwerror(v, "cairo: Surface class not registered");
        sq_pushnull(v);
        return;
    }
    push_instance(v, s, surf_release);
}

void sqgi_cairo_push_pattern(HSQUIRRELVM v, cairo_pattern_t *p, int adopt)
{
    if (!p) { sq_pushnull(v); return; }
    if (!adopt) cairo_pattern_reference(p);
    if (SQ_FAILED(push_cairo_class(v, "cairo.Pattern"))) {
        cairo_pattern_destroy(p);
        sq_throwerror(v, "cairo: Pattern class not registered");
        sq_pushnull(v);
        return;
    }
    push_instance(v, p, patt_release);
}

/* ── public foreign-type push hook ───────────────────────────────────────── */

int sqgi_cairo_try_push_foreign(HSQUIRRELVM v, const char *full_key,
                                void *ptr, int transfer_full)
{
    if (!full_key) return 0;
    int adopt = (transfer_full ? 1 : 0);
    if (strcmp(full_key, "cairo.Context") == 0) {
        sqgi_cairo_push_context(v, (cairo_t *)ptr, adopt);
        return 1;
    }
    if (strcmp(full_key, "cairo.Surface") == 0) {
        sqgi_cairo_push_surface(v, (cairo_surface_t *)ptr, adopt);
        return 1;
    }
    if (strcmp(full_key, "cairo.Pattern") == 0) {
        sqgi_cairo_push_pattern(v, (cairo_pattern_t *)ptr, adopt);
        return 1;
    }
    return 0;
}

/* ── Context methods ─────────────────────────────────────────────────────── */

#define CTX_FN(name, body)                                                     \
    static SQInteger ctx_##name(HSQUIRRELVM v) {                               \
        cairo_t *cr = get_cr(v, 1); if (!cr) return SQ_ERROR;                  \
        body                                                                   \
    }

CTX_FN(save,            { cairo_save(cr); return 0; })
CTX_FN(restore,         { cairo_restore(cr); return 0; })
CTX_FN(new_path,        { cairo_new_path(cr); return 0; })
CTX_FN(new_sub_path,    { cairo_new_sub_path(cr); return 0; })
CTX_FN(close_path,      { cairo_close_path(cr); return 0; })
CTX_FN(fill,            { cairo_fill(cr); return 0; })
CTX_FN(fill_preserve,   { cairo_fill_preserve(cr); return 0; })
CTX_FN(stroke,          { cairo_stroke(cr); return 0; })
CTX_FN(stroke_preserve, { cairo_stroke_preserve(cr); return 0; })
CTX_FN(paint,           { cairo_paint(cr); return 0; })
CTX_FN(clip,            { cairo_clip(cr); return 0; })
CTX_FN(clip_preserve,   { cairo_clip_preserve(cr); return 0; })
CTX_FN(reset_clip,      { cairo_reset_clip(cr); return 0; })
CTX_FN(identity_matrix, { cairo_identity_matrix(cr); return 0; })

CTX_FN(set_source_rgb, {
    ARG_F(2, r); ARG_F(3, g); ARG_F(4, b);
    cairo_set_source_rgb(cr, r, g, b);
    return 0;
})

CTX_FN(set_source_rgba, {
    ARG_F(2, r); ARG_F(3, g); ARG_F(4, b); ARG_F(5, a);
    cairo_set_source_rgba(cr, r, g, b, a);
    return 0;
})

CTX_FN(set_source, {
    cairo_pattern_t *p = get_pattern(v, 2);
    if (!p) return SQ_ERROR;
    cairo_set_source(cr, p);
    return 0;
})

CTX_FN(set_source_surface, {
    cairo_surface_t *s = get_surface(v, 2);
    if (!s) return SQ_ERROR;
    ARG_F(3, x); ARG_F(4, y);
    cairo_set_source_surface(cr, s, x, y);
    return 0;
})

CTX_FN(set_line_width,  { ARG_F(2, w); cairo_set_line_width(cr, w); return 0; })
CTX_FN(get_line_width,  { sq_pushfloat(v, (SQFloat)cairo_get_line_width(cr)); return 1; })
CTX_FN(set_line_cap,    { ARG_I(2, c); cairo_set_line_cap(cr, (cairo_line_cap_t)c);   return 0; })
CTX_FN(set_line_join,   { ARG_I(2, j); cairo_set_line_join(cr, (cairo_line_join_t)j); return 0; })

CTX_FN(set_dash, {
    if (sq_gettype(v, 2) != OT_ARRAY)
        return sq_throwerror(v, "cairo.set_dash: expected array argument #2");

    SQInteger n = sq_getsize(v, 2);
    if (n < 0 || n > (SQInteger)INT_MAX)
        return sq_throwerror(v, "cairo.set_dash: invalid dash array size");

    SQFloat offset = 0.0;
    if (sq_gettop(v) >= 3 && SQ_FAILED(sqc_tofloat(v, 3, &offset)))
        return sq_throwerror(v, "cairo.set_dash: expected numeric argument #3");

    double *dashes = NULL;
    if (n > 0) {
        dashes = (double *)malloc(sizeof(double) * (size_t)n);
        if (!dashes) return sq_throwerror(v, "cairo.set_dash: out of memory");

        for (SQInteger i = 0; i < n; i++) {
            sq_pushinteger(v, i);
            if (SQ_FAILED(sq_get(v, 2))) {
                free(dashes);
                return SQ_ERROR;
            }

            SQFloat dash = 0.0;
            if (SQ_FAILED(sqc_tofloat(v, -1, &dash))) {
                sq_pop(v, 1);
                free(dashes);
                return sq_throwerror(v, "cairo.set_dash: dash elements must be numeric");
            }
            sq_pop(v, 1);
            dashes[i] = (double)dash;
        }
    }

    cairo_set_dash(cr, dashes, (int)n, (double)offset);
    free(dashes);
    return 0;
})

CTX_FN(get_dash_count, {
    sq_pushinteger(v, (SQInteger)cairo_get_dash_count(cr));
    return 1;
})

CTX_FN(get_dash, {
    int n = cairo_get_dash_count(cr);
    double *dashes = NULL;
    if (n > 0) {
        dashes = (double *)malloc(sizeof(double) * (size_t)n);
        if (!dashes) return sq_throwerror(v, "cairo.get_dash: out of memory");
    }

    double offset = 0.0;
    cairo_get_dash(cr, dashes, &offset);

    sq_newtable(v);
    sq_pushstring(v, "dashes", -1);
    sq_newarray(v, 0);
    for (int i = 0; i < n; i++) {
        sq_pushfloat(v, (SQFloat)dashes[i]);
        sq_arrayappend(v, -2);
    }
    sq_newslot(v, -3, SQFalse);

    sq_pushstring(v, "offset", -1);
    sq_pushfloat(v, (SQFloat)offset);
    sq_newslot(v, -3, SQFalse);

    free(dashes);
    return 1;
})

CTX_FN(set_fill_rule,   { ARG_I(2, r); cairo_set_fill_rule(cr, (cairo_fill_rule_t)r); return 0; })
CTX_FN(set_operator,    { ARG_I(2, o); cairo_set_operator(cr, (cairo_operator_t)o);   return 0; })

CTX_FN(move_to,     { ARG_F(2, x); ARG_F(3, y); cairo_move_to(cr, x, y);     return 0; })
CTX_FN(line_to,     { ARG_F(2, x); ARG_F(3, y); cairo_line_to(cr, x, y);     return 0; })
CTX_FN(rel_move_to, { ARG_F(2, x); ARG_F(3, y); cairo_rel_move_to(cr, x, y); return 0; })
CTX_FN(rel_line_to, { ARG_F(2, x); ARG_F(3, y); cairo_rel_line_to(cr, x, y); return 0; })

CTX_FN(arc, {
    ARG_F(2, cx); ARG_F(3, cy); ARG_F(4, r); ARG_F(5, a1); ARG_F(6, a2);
    cairo_arc(cr, cx, cy, r, a1, a2);
    return 0;
})

CTX_FN(arc_negative, {
    ARG_F(2, cx); ARG_F(3, cy); ARG_F(4, r); ARG_F(5, a1); ARG_F(6, a2);
    cairo_arc_negative(cr, cx, cy, r, a1, a2);
    return 0;
})

CTX_FN(curve_to, {
    ARG_F(2, x1); ARG_F(3, y1); ARG_F(4, x2); ARG_F(5, y2);
    ARG_F(6, x3); ARG_F(7, y3);
    cairo_curve_to(cr, x1, y1, x2, y2, x3, y3);
    return 0;
})

CTX_FN(rectangle, {
    ARG_F(2, x); ARG_F(3, y); ARG_F(4, w); ARG_F(5, h);
    cairo_rectangle(cr, x, y, w, h);
    return 0;
})

CTX_FN(translate,       { ARG_F(2, tx); ARG_F(3, ty); cairo_translate(cr, tx, ty); return 0; })
CTX_FN(scale,           { ARG_F(2, sx); ARG_F(3, sy); cairo_scale(cr, sx, sy);     return 0; })
CTX_FN(rotate,          { ARG_F(2, a); cairo_rotate(cr, a);                        return 0; })

CTX_FN(paint_with_alpha,{ ARG_F(2, a); cairo_paint_with_alpha(cr, a); return 0; })

CTX_FN(select_font_face, {
    ARG_S(2, family); ARG_I(3, slant); ARG_I(4, weight);
    cairo_select_font_face(cr, family,
        (cairo_font_slant_t)slant, (cairo_font_weight_t)weight);
    return 0;
})

CTX_FN(set_font_size,   { ARG_F(2, sz); cairo_set_font_size(cr, sz); return 0; })

CTX_FN(show_text, {
    ARG_S(2, s);
    cairo_show_text(cr, s);
    return 0;
})

CTX_FN(text_extents, {
    ARG_S(2, s);
    cairo_text_extents_t e;
    cairo_text_extents(cr, s, &e);
    sq_newtable(v);
    sq_pushstring(v, "x_bearing", -1); sq_pushfloat(v, (SQFloat)e.x_bearing); sq_newslot(v, -3, SQFalse);
    sq_pushstring(v, "y_bearing", -1); sq_pushfloat(v, (SQFloat)e.y_bearing); sq_newslot(v, -3, SQFalse);
    sq_pushstring(v, "width",     -1); sq_pushfloat(v, (SQFloat)e.width);     sq_newslot(v, -3, SQFalse);
    sq_pushstring(v, "height",    -1); sq_pushfloat(v, (SQFloat)e.height);    sq_newslot(v, -3, SQFalse);
    sq_pushstring(v, "x_advance", -1); sq_pushfloat(v, (SQFloat)e.x_advance); sq_newslot(v, -3, SQFalse);
    sq_pushstring(v, "y_advance", -1); sq_pushfloat(v, (SQFloat)e.y_advance); sq_newslot(v, -3, SQFalse);
    return 1;
})

CTX_FN(status, { sq_pushinteger(v, (SQInteger)cairo_status(cr)); return 1; })

CTX_FN(get_target, {
    cairo_surface_t *s = cairo_get_target(cr);
    sqgi_cairo_push_surface(v, s, /*adopt=*/0);
    return 1;
})

/* cairo.Context.create(surface) → cairo.Context. */
static SQInteger ctx_create_static(HSQUIRRELVM v)
{
    /* stack: [class, surface] (called as cairo.Context.create(surf)) */
    cairo_surface_t *s = get_surface(v, 2);
    if (!s) return SQ_ERROR;
    cairo_t *cr = cairo_create(s);
    if (!cr || cairo_status(cr) != CAIRO_STATUS_SUCCESS) {
        if (cr) cairo_destroy(cr);
        return sq_throwerror(v, "cairo_create() failed");
    }
    sqgi_cairo_push_context(v, cr, /*adopt=*/1);
    return 1;
}

/* ── Surface methods ─────────────────────────────────────────────────────── */

static SQInteger surf_write_to_png(HSQUIRRELVM v)
{
    cairo_surface_t *s = get_surface(v, 1); if (!s) return SQ_ERROR;
    ARG_S(2, path);
    cairo_status_t st = cairo_surface_write_to_png(s, path);
    if (st != CAIRO_STATUS_SUCCESS) {
        return sq_throwerror(v, cairo_status_to_string(st));
    }
    return 0;
}

static SQInteger surf_get_width(HSQUIRRELVM v)
{
    cairo_surface_t *s = get_surface(v, 1); if (!s) return SQ_ERROR;
    sq_pushinteger(v, (SQInteger)cairo_image_surface_get_width(s));
    return 1;
}

static SQInteger surf_get_height(HSQUIRRELVM v)
{
    cairo_surface_t *s = get_surface(v, 1); if (!s) return SQ_ERROR;
    sq_pushinteger(v, (SQInteger)cairo_image_surface_get_height(s));
    return 1;
}

static SQInteger surf_flush(HSQUIRRELVM v)
{
    cairo_surface_t *s = get_surface(v, 1); if (!s) return SQ_ERROR;
    cairo_surface_flush(s);
    return 0;
}

static SQInteger surf_status(HSQUIRRELVM v)
{
    cairo_surface_t *s = get_surface(v, 1); if (!s) return SQ_ERROR;
    sq_pushinteger(v, (SQInteger)cairo_surface_status(s));
    return 1;
}

/* ── Pattern methods + constructors ──────────────────────────────────────── */

static SQInteger patt_add_color_stop_rgb(HSQUIRRELVM v)
{
    cairo_pattern_t *p = get_pattern(v, 1); if (!p) return SQ_ERROR;
    ARG_F(2, off); ARG_F(3, r); ARG_F(4, g); ARG_F(5, b);
    cairo_pattern_add_color_stop_rgb(p, off, r, g, b);
    return 0;
}

static SQInteger patt_add_color_stop_rgba(HSQUIRRELVM v)
{
    cairo_pattern_t *p = get_pattern(v, 1); if (!p) return SQ_ERROR;
    ARG_F(2, off); ARG_F(3, r); ARG_F(4, g); ARG_F(5, bl); ARG_F(6, a);
    cairo_pattern_add_color_stop_rgba(p, off, r, g, bl, a);
    return 0;
}

static SQInteger patt_status(HSQUIRRELVM v)
{
    cairo_pattern_t *p = get_pattern(v, 1); if (!p) return SQ_ERROR;
    sq_pushinteger(v, (SQInteger)cairo_pattern_status(p));
    return 1;
}

/* Top-level cairo.Pattern.create_linear / create_radial */
static SQInteger patt_create_linear(HSQUIRRELVM v)
{
    ARG_F(2, x0); ARG_F(3, y0); ARG_F(4, x1); ARG_F(5, y1);
    cairo_pattern_t *p = cairo_pattern_create_linear(x0, y0, x1, y1);
    sqgi_cairo_push_pattern(v, p, /*adopt=*/1);
    return 1;
}

static SQInteger patt_create_radial(HSQUIRRELVM v)
{
    ARG_F(2, cx0); ARG_F(3, cy0); ARG_F(4, r0);
    ARG_F(5, cx1); ARG_F(6, cy1); ARG_F(7, r1);
    cairo_pattern_t *p = cairo_pattern_create_radial(cx0, cy0, r0, cx1, cy1, r1);
    sqgi_cairo_push_pattern(v, p, /*adopt=*/1);
    return 1;
}

static SQInteger patt_create_rgb(HSQUIRRELVM v)
{
    ARG_F(2, r); ARG_F(3, g); ARG_F(4, b);
    cairo_pattern_t *p = cairo_pattern_create_rgb(r, g, b);
    sqgi_cairo_push_pattern(v, p, /*adopt=*/1);
    return 1;
}

static SQInteger patt_create_rgba(HSQUIRRELVM v)
{
    ARG_F(2, r); ARG_F(3, g); ARG_F(4, b); ARG_F(5, a);
    cairo_pattern_t *p = cairo_pattern_create_rgba(r, g, b, a);
    sqgi_cairo_push_pattern(v, p, /*adopt=*/1);
    return 1;
}

/* ── Top-level cairo functions ───────────────────────────────────────────── */

/* cairo.image_surface_create(format, width, height) → cairo.Surface */
static SQInteger fn_image_surface_create(HSQUIRRELVM v)
{
    ARG_I(2, fmt); ARG_I(3, w); ARG_I(4, h);
    cairo_surface_t *s = cairo_image_surface_create((cairo_format_t)fmt,
                                                    (int)w, (int)h);
    if (!s || cairo_surface_status(s) != CAIRO_STATUS_SUCCESS) {
        const char *msg = s ? cairo_status_to_string(cairo_surface_status(s))
                            : "image_surface_create: alloc failed";
        if (s) cairo_surface_destroy(s);
        return sq_throwerror(v, msg);
    }
    sqgi_cairo_push_surface(v, s, /*adopt=*/1);
    return 1;
}

/* ── class registration ──────────────────────────────────────────────────── */

static void add_method(HSQUIRRELVM v, const char *name, SQFUNCTION fn)
{
    sq_pushstring(v, name, -1);
    sq_newclosure(v, fn, 0);
    sq_setnativeclosurename(v, -1, name);
    sq_newslot(v, -3, SQFalse);
}

/* Stash the class on top of stack into both the cairo registry slot (for
 * overlay) and the shared sqgi_classes registry (so the GI marshaller's
 * sqgi_gi_object_lookup_class() finds it for foreign records). */
static void register_class_under(HSQUIRRELVM v, const char *key)
{
    /* class is on top */
    sqgi_gi_object_register_class(v, key, -1);

    sq_pushregistrytable(v);
    sq_pushstring(v, SQGI_CAIRO_REG_SLOT, -1);
    if (SQ_FAILED(sq_rawget(v, -2))) {
        /* create sub-table */
        sq_pushstring(v, SQGI_CAIRO_REG_SLOT, -1);
        sq_newtable(v);
        sq_rawset(v, -3);
        sq_pushstring(v, SQGI_CAIRO_REG_SLOT, -1);
        sq_rawget(v, -2);
    }
    /* stack: [..., class, registry, classes_subtable] */
    sq_pushstring(v, key, -1);
    sq_push(v, -4);   /* class */
    sq_rawset(v, -3);
    sq_pop(v, 2);     /* registry + subtable */
}

void sqgi_cairo_register(HSQUIRRELVM v)
{
    SQGI_STACK_CHECK_BEGIN(v);

    /* ── cairo.Context ───────────────────────────────────────────────────── */
    sq_newclass(v, SQFalse);
    add_method(v, "save",             ctx_save);
    add_method(v, "restore",          ctx_restore);
    add_method(v, "new_path",         ctx_new_path);
    add_method(v, "new_sub_path",     ctx_new_sub_path);
    add_method(v, "close_path",       ctx_close_path);
    add_method(v, "fill",             ctx_fill);
    add_method(v, "fill_preserve",    ctx_fill_preserve);
    add_method(v, "stroke",           ctx_stroke);
    add_method(v, "stroke_preserve",  ctx_stroke_preserve);
    add_method(v, "paint",            ctx_paint);
    add_method(v, "paint_with_alpha", ctx_paint_with_alpha);
    add_method(v, "clip",             ctx_clip);
    add_method(v, "clip_preserve",    ctx_clip_preserve);
    add_method(v, "reset_clip",       ctx_reset_clip);
    add_method(v, "identity_matrix",  ctx_identity_matrix);
    add_method(v, "set_source_rgb",   ctx_set_source_rgb);
    add_method(v, "set_source_rgba",  ctx_set_source_rgba);
    add_method(v, "set_source",       ctx_set_source);
    add_method(v, "set_source_surface", ctx_set_source_surface);
    add_method(v, "set_line_width",   ctx_set_line_width);
    add_method(v, "get_line_width",   ctx_get_line_width);
    add_method(v, "set_line_cap",     ctx_set_line_cap);
    add_method(v, "set_line_join",    ctx_set_line_join);
    add_method(v, "set_dash",         ctx_set_dash);
    add_method(v, "set_dashes",       ctx_set_dash);
    add_method(v, "get_dash_count",   ctx_get_dash_count);
    add_method(v, "get_dash",         ctx_get_dash);
    add_method(v, "set_fill_rule",    ctx_set_fill_rule);
    add_method(v, "set_operator",     ctx_set_operator);
    add_method(v, "move_to",          ctx_move_to);
    add_method(v, "line_to",          ctx_line_to);
    add_method(v, "rel_move_to",      ctx_rel_move_to);
    add_method(v, "rel_line_to",      ctx_rel_line_to);
    add_method(v, "arc",              ctx_arc);
    add_method(v, "arc_negative",     ctx_arc_negative);
    add_method(v, "curve_to",         ctx_curve_to);
    add_method(v, "rectangle",        ctx_rectangle);
    add_method(v, "translate",        ctx_translate);
    add_method(v, "scale",            ctx_scale);
    add_method(v, "rotate",           ctx_rotate);
    add_method(v, "select_font_face", ctx_select_font_face);
    add_method(v, "set_font_size",    ctx_set_font_size);
    add_method(v, "show_text",        ctx_show_text);
    add_method(v, "text_extents",     ctx_text_extents);
    add_method(v, "status",           ctx_status);
    add_method(v, "get_target",       ctx_get_target);
    add_method(v, "create",           ctx_create_static); /* static-style factory */
    register_class_under(v, "cairo.Context");
    sq_poptop(v);   /* drop class */

    /* ── cairo.Surface ───────────────────────────────────────────────────── */
    sq_newclass(v, SQFalse);
    add_method(v, "write_to_png", surf_write_to_png);
    add_method(v, "get_width",    surf_get_width);
    add_method(v, "get_height",   surf_get_height);
    add_method(v, "flush",        surf_flush);
    add_method(v, "status",       surf_status);
    register_class_under(v, "cairo.Surface");
    sq_poptop(v);

    /* ── cairo.Pattern ───────────────────────────────────────────────────── */
    sq_newclass(v, SQFalse);
    add_method(v, "add_color_stop_rgb",  patt_add_color_stop_rgb);
    add_method(v, "add_color_stop_rgba", patt_add_color_stop_rgba);
    add_method(v, "status",              patt_status);
    add_method(v, "create_linear",       patt_create_linear);
    add_method(v, "create_radial",       patt_create_radial);
    add_method(v, "create_rgb",          patt_create_rgb);
    add_method(v, "create_rgba",         patt_create_rgba);
    register_class_under(v, "cairo.Pattern");
    sq_poptop(v);

    SQGI_STACK_CHECK_END(v, 0);
}

/* ── namespace overlay ───────────────────────────────────────────────────── */

/* Replace `name` in the table at top of stack with our class (looked up by
 * full_key, e.g. "cairo.Context"). */
static void overlay_class(HSQUIRRELVM v, const char *name, const char *full_key)
{
    if (SQ_FAILED(push_cairo_class(v, full_key))) return;
    /* stack: [..., ns_table, class] */
    sq_pushstring(v, name, -1);
    sq_push(v, -2);   /* class */
    sq_rawset(v, -4); /* ns_table[name] = class */
    sq_poptop(v);     /* drop class */
}

static void overlay_fn(HSQUIRRELVM v, const char *name, SQFUNCTION fn)
{
    sq_pushstring(v, name, -1);
    sq_newclosure(v, fn, 0);
    sq_setnativeclosurename(v, -1, name);
    sq_rawset(v, -3);
}

void sqgi_cairo_overlay_namespace(HSQUIRRELVM v)
{
    /* Top of stack is the cairo namespace table. */
    overlay_class(v, "Context", "cairo.Context");
    overlay_class(v, "Surface", "cairo.Surface");
    overlay_class(v, "Pattern", "cairo.Pattern");
    overlay_fn(v, "image_surface_create", fn_image_surface_create);
}
