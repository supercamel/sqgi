/* sqgi_subclass.c — GType subclassing from Squirrel.
 *
 * Exposes:
 *   sqgi.register_class({name, parent, overrides})
 *     → returns a new Squirrel class derived from `parent`'s class, whose
 *       `__gtype` resolves to a freshly-registered GType. Each entry in
 *       `overrides` patches the corresponding vfunc slot in the class
 *       vtable to call back into the supplied Squirrel closure.
 *
 * Implementation:
 *   - We use g_type_register_static_simple to register a new GType derived
 *     from the parent's GType, with sizes copied from g_type_query.
 *   - class_init walks the overrides table, looks up each vfunc on the
 *     parent's GIObjectInfo, allocates a libffi closure matching the
 *     vfunc's signature, and writes its executable pointer into the
 *     class struct at the vfunc's offset.
 *   - Trampolines are kept alive forever (GTypes can't be unregistered).
 *
 * Thread-safety: the trampoline calls into the Squirrel VM, which is
 * single-threaded. vfuncs invoked from non-main threads WILL crash. This
 * matches SQGI's existing constraint.
 */

#include "sqgi_subclass.h"
#include "sqgi_marshal.h"
#include "sqgi_gi.h"
#include "sqgi_gi_object.h"
#include "sqgi_gerror.h"

#include <string.h>
#include <stdio.h>
#include <ffi.h>

/* ── Per-override trampoline ─────────────────────────────────────────────── */

typedef struct {
    HSQUIRRELVM v;
    HSQOBJECT   handler;        /* Squirrel closure, ref'd for lifetime */
    GIVFuncInfo *vfunc_info;    /* ref'd */

    /* libffi machinery */
    ffi_closure *closure;
    void        *executable;
    ffi_cif      cif;
    ffi_type   **arg_types;     /* includes leading self slot */
    gint         n_args;        /* total ffi args (self + n_gi_args) */

    /* The parent class's implementation of this vfunc, captured before we
     * overwrote the slot. NULL if the parent slot was empty. Used by
     * sqgi.chain_up(). */
    gpointer     parent_func;
} SqgiVfuncTramp;

/* Stack of trampolines currently executing on this thread, with the
 * original C ABI argument array for each. sqgi.chain_up() reads the top
 * entry. The VM is single-threaded so a process-global stack is fine. */
typedef struct {
    SqgiVfuncTramp *tramp;
    void         **args;
} SqgiActiveCall;

static GArray *sqgi_active_calls = NULL;

static void sqgi_active_calls_push(SqgiVfuncTramp *t, void **args)
{
    if (!sqgi_active_calls)
        sqgi_active_calls = g_array_new(FALSE, FALSE, sizeof(SqgiActiveCall));
    SqgiActiveCall c = { t, args };
    g_array_append_val(sqgi_active_calls, c);
}

static void sqgi_active_calls_pop(void)
{
    if (sqgi_active_calls && sqgi_active_calls->len > 0)
        g_array_remove_index(sqgi_active_calls, sqgi_active_calls->len - 1);
}

/* libffi handler: invoked when GLib dispatches the vfunc on a subclass
 * instance. Recovers (self, gi_arg0, gi_arg1, ...) from the C ABI slot
 * array, marshals each into a Squirrel value, calls the handler, and
 * marshals the return value back into the libffi return slot. */
static void sqgi_vfunc_handler(ffi_cif *cif, void *ret, void **args, void *ud)
{
    SqgiVfuncTramp *t = (SqgiVfuncTramp *)ud;
    HSQUIRRELVM v = t->v;
    GICallableInfo *ci = (GICallableInfo *)t->vfunc_info;
    gint n_gi_args = g_callable_info_get_n_args(ci);

    SQInteger top = sq_gettop(v);
    sq_pushobject(v, t->handler);
    sq_pushnull(v); /* `this` */

    /* First C arg slot is always self (GObject*). */
    GObject *self = *(GObject **)args[0];
    sqgi_push_gobject(v, self); /* refs and wraps; releases at sq_settop */

    /* Remaining GI args. */
    for (gint i = 0; i < n_gi_args; i++) {
        GIArgInfo *ai = g_callable_info_get_arg(ci, i);
        GITypeInfo *ti = g_arg_info_get_type(ai);
        GIArgument ga;
        sqgi_ffi_arg_to_gi(&ga, ti, args[i + 1]);
        sqgi_push_gi_argument(v, &ga, ti, GI_TRANSFER_NOTHING);
        g_base_info_unref(ti);
        g_base_info_unref(ai);
    }

    /* Squirrel call: nargs counts pushed args excluding the closure itself
     * but including `this`. We pushed: this + self + n_gi_args. */
    sqgi_active_calls_push(t, args);
    SQRESULT r = sq_call(v, 1 + 1 + n_gi_args, SQTrue, SQTrue);
    sqgi_active_calls_pop();

    /* Marshal return. */
    GITypeInfo *rt = g_callable_info_get_return_type(ci);
    GITypeTag   rtag = g_type_info_get_tag(rt);

    if (SQ_FAILED(r)) {
        /* Squirrel threw out of the override. We can't propagate the
         * exception through the libffi/C ABI boundary, so log it loudly
         * via g_critical (the Squirrel error handler also prints a
         * stack trace via sq_call's raiseerror=SQTrue) and zero-fill
         * the return slot. A silent NULL return is the worst possible
         * outcome — make sure embedders see the failure. */
        const SQChar *errstr = "<no error message>";
        sq_getlasterror(v);
        if (sq_gettype(v, -1) == OT_STRING) {
            sq_getstring(v, -1, &errstr);
        }
        g_critical("sqgi vfunc '%s' on %s threw: %s",
                   g_base_info_get_name((GIBaseInfo *)ci),
                   G_OBJECT_TYPE_NAME(self),
                   errstr);
        sq_pop(v, 1); /* error object */
        memset(ret, 0, cif->rtype->size);
    } else {
        switch (rtag) {
        case GI_TYPE_TAG_VOID:
            break;
        case GI_TYPE_TAG_BOOLEAN: {
            SQBool b = SQFalse;
            if (sq_gettype(v, -1) == OT_BOOL) sq_getbool(v, -1, &b);
            *(ffi_arg *)ret = b ? TRUE : FALSE;
            break;
        }
        case GI_TYPE_TAG_INT8: case GI_TYPE_TAG_UINT8:
        case GI_TYPE_TAG_INT16: case GI_TYPE_TAG_UINT16:
        case GI_TYPE_TAG_INT32: case GI_TYPE_TAG_UINT32: {
            SQInteger iv = 0;
            if (sq_gettype(v, -1) == OT_INTEGER) sq_getinteger(v, -1, &iv);
            *(ffi_arg *)ret = (ffi_arg)iv;
            break;
        }
        case GI_TYPE_TAG_INT64: case GI_TYPE_TAG_UINT64: {
            SQInteger iv = 0;
            if (sq_gettype(v, -1) == OT_INTEGER) sq_getinteger(v, -1, &iv);
            *(gint64 *)ret = (gint64)iv;
            break;
        }
        case GI_TYPE_TAG_FLOAT: case GI_TYPE_TAG_DOUBLE: {
            SQFloat fv = 0;
            if (sq_gettype(v, -1) == OT_FLOAT)   sq_getfloat(v, -1, &fv);
            if (sq_gettype(v, -1) == OT_INTEGER) {
                SQInteger iv = 0; sq_getinteger(v, -1, &iv); fv = (SQFloat)iv;
            }
            if (rtag == GI_TYPE_TAG_FLOAT) *(gfloat *)ret = (gfloat)fv;
            else                            *(gdouble *)ret = (gdouble)fv;
            break;
        }
        default:
            /* Pointer-shaped returns default to NULL. Richer returns
             * (e.g. transfer-full GObjects) would need explicit support. */
            *(gpointer *)ret = NULL;
            break;
        }
    }

    g_base_info_unref(rt);
    sq_settop(v, top);
}

/* Allocate a libffi closure matching the vfunc's signature, prepended with
 * a leading `pointer` slot for self. Returns the trampoline or NULL on
 * unsupported parameter type. */
static SqgiVfuncTramp *sqgi_make_vfunc_trampoline(HSQUIRRELVM v,
                                                 GIVFuncInfo *vi,
                                                 HSQOBJECT *handler)
{
    GICallableInfo *ci = (GICallableInfo *)vi;
    gint n_gi_args = g_callable_info_get_n_args(ci);
    gint n_total   = n_gi_args + 1; /* +self */

    GITypeInfo *rt = g_callable_info_get_return_type(ci);
    ffi_type *ret_ft = sqgi_ffi_type_for_gi(rt, TRUE);
    g_base_info_unref(rt);
    if (!ret_ft) return NULL;

    ffi_type **arg_fts = g_new0(ffi_type *, n_total);
    arg_fts[0] = &ffi_type_pointer; /* self */
    for (gint i = 0; i < n_gi_args; i++) {
        GIArgInfo *ai = g_callable_info_get_arg(ci, i);
        GITypeInfo *ti = g_arg_info_get_type(ai);
        ffi_type *ft = sqgi_ffi_type_for_gi(ti, FALSE);
        g_base_info_unref(ti);
        g_base_info_unref(ai);
        if (!ft) { g_free(arg_fts); return NULL; }
        arg_fts[i + 1] = ft;
    }

    SqgiVfuncTramp *t = g_new0(SqgiVfuncTramp, 1);
    t->v = v;
    sq_resetobject(&t->handler);
    t->handler = *handler;
    sq_addref(v, &t->handler);
    t->vfunc_info = (GIVFuncInfo *)g_base_info_ref((GIBaseInfo *)vi);
    t->arg_types = arg_fts;
    t->n_args = n_total;

    void *exec = NULL;
    t->closure = ffi_closure_alloc(sizeof(ffi_closure), &exec);
    if (!t->closure) goto fail;
    if (ffi_prep_cif(&t->cif, FFI_DEFAULT_ABI, (unsigned int)n_total,
                     ret_ft, arg_fts) != FFI_OK) goto fail;
    if (ffi_prep_closure_loc(t->closure, &t->cif, sqgi_vfunc_handler, t,
                             exec) != FFI_OK) goto fail;
    t->executable = exec;
    return t;

fail:
    if (t->closure) ffi_closure_free(t->closure);
    g_free(arg_fts);
    sq_release(v, &t->handler);
    g_base_info_unref((GIBaseInfo *)t->vfunc_info);
    g_free(t);
    return NULL;
}

/* ── Per-GType subclass record ───────────────────────────────────────────── */

typedef struct {
    HSQUIRRELVM   v;
    GType         gtype;
    GType         parent_gtype;
    GIObjectInfo *parent_info;          /* ref'd; owned */
    /* List of (name, HSQOBJECT*) pairs captured before class_init runs. */
    GHashTable   *overrides;             /* char* → HSQOBJECT* (owned) */
    GPtrArray    *trampolines;           /* SqgiVfuncTramp* */
} SqgiSubclass;

/* Look up a vfunc on the parent GIObjectInfo, walking up through parent GI
 * info if not found directly. Returns NULL if no such vfunc. The caller
 * must g_base_info_unref the result. */
static GIVFuncInfo *find_vfunc_recursive(GIObjectInfo *info, const char *name)
{
    GIObjectInfo *cur = (GIObjectInfo *)g_base_info_ref((GIBaseInfo *)info);
    while (cur) {
        GIVFuncInfo *vi = g_object_info_find_vfunc(cur, name);
        if (vi) {
            g_base_info_unref((GIBaseInfo *)cur);
            return vi;
        }
        GIObjectInfo *parent = g_object_info_get_parent(cur);
        g_base_info_unref((GIBaseInfo *)cur);
        cur = parent;
    }
    return NULL;
}

/* Resolve the byte offset for a vfunc within its owning class struct.
 *
 * g_vfunc_info_get_offset is unreliable: many GI sources don't record the
 * offset (returns 0xFFFF). Fall back to walking the owning object's class
 * struct fields by name — that always works for normal GObject vtables.
 */
static gint resolve_vfunc_offset(GIObjectInfo *root_info, const char *name)
{
    /* Walk the parent chain. For each level, look at that level's
     * class-struct fields. The vfunc lives in the class struct of the
     * object that DECLARED it (which may be an ancestor of root_info). */
    GIObjectInfo *cur = (GIObjectInfo *)g_base_info_ref((GIBaseInfo *)root_info);
    while (cur) {
        GIStructInfo *cs = g_object_info_get_class_struct(cur);
        if (cs) {
            gint nf = g_struct_info_get_n_fields(cs);
            for (gint i = 0; i < nf; i++) {
                GIFieldInfo *f = g_struct_info_get_field(cs, i);
                const char *fname = g_base_info_get_name((GIBaseInfo *)f);
                if (fname && strcmp(fname, name) == 0) {
                    gint off = g_field_info_get_offset(f);
                    g_base_info_unref((GIBaseInfo *)f);
                    g_base_info_unref((GIBaseInfo *)cs);
                    g_base_info_unref((GIBaseInfo *)cur);
                    return off;
                }
                g_base_info_unref((GIBaseInfo *)f);
            }
            g_base_info_unref((GIBaseInfo *)cs);
        }
        GIObjectInfo *parent = g_object_info_get_parent(cur);
        g_base_info_unref((GIBaseInfo *)cur);
        cur = parent;
    }
    return -1;
}

/* class_init for the new GType. Walks pending overrides, builds trampolines,
 * and patches the class struct. */
static void sqgi_subclass_class_init(gpointer klass, gpointer user_data)
{
    SqgiSubclass *s = (SqgiSubclass *)user_data;

    GHashTableIter it;
    g_hash_table_iter_init(&it, s->overrides);
    gpointer key, val;
    while (g_hash_table_iter_next(&it, &key, &val)) {
        const char *name = (const char *)key;
        HSQOBJECT  *handler = (HSQOBJECT *)val;

        GIVFuncInfo *vi = find_vfunc_recursive(s->parent_info, name);
        if (!vi) {
            g_warning("sqgi.register_class: vfunc '%s' not found on parent %s",
                      name, g_type_name(s->parent_gtype));
            continue;
        }

        gint offset = g_vfunc_info_get_offset(vi);
        if (offset == 0xFFFF || offset < 0) {
            /* GI's introspection didn't record the offset (very common).
             * Fall back to walking the class struct fields by name. */
            offset = resolve_vfunc_offset(s->parent_info, name);
        }
        if (offset < 0) {
            g_warning("sqgi.register_class: vfunc '%s' has no usable offset",
                      name);
            g_base_info_unref((GIBaseInfo *)vi);
            continue;
        }

        SqgiVfuncTramp *t = sqgi_make_vfunc_trampoline(s->v, vi, handler);
        g_base_info_unref((GIBaseInfo *)vi);
        if (!t) {
            g_warning("sqgi.register_class: failed to build trampoline for "
                      "vfunc '%s' (unsupported signature)", name);
            continue;
        }

        /* Patch class struct: capture the parent's implementation (so
         * sqgi.chain_up() can call it) before writing our trampoline. */
        gpointer *slot = (gpointer *)((char *)klass + offset);
        t->parent_func = *slot;
        *slot = t->executable;

        g_ptr_array_add(s->trampolines, t);
    }
}

/* ── sqgi.register_class(table) ───────────────────────────────────────────── */

static SQInteger sq_fn_register_class(HSQUIRRELVM v)
{
    if (sq_gettop(v) < 2 || sq_gettype(v, 2) != OT_TABLE) {
        return sq_throwerror(v,
            "register_class: expected a table { name, parent, overrides }");
    }

    /* --- name --- */
    sq_pushstring(v, "name", -1);
    if (SQ_FAILED(sq_rawget(v, 2)))
        return sq_throwerror(v, "register_class: missing 'name'");
    const SQChar *name = NULL;
    if (SQ_FAILED(sq_getstring(v, -1, &name)) || !name) {
        sq_poptop(v);
        return sq_throwerror(v, "register_class: 'name' must be a string");
    }
    char *type_name = g_strdup(name);
    sq_poptop(v);

    if (g_type_from_name(type_name) != G_TYPE_INVALID) {
        SQRESULT r = sq_throwerror(v,
            "register_class: GType already registered with that name");
        g_free(type_name);
        return r;
    }

    /* --- parent --- */
    sq_pushstring(v, "parent", -1);
    if (SQ_FAILED(sq_rawget(v, 2))) {
        g_free(type_name);
        return sq_throwerror(v, "register_class: missing 'parent'");
    }
    if (sq_gettype(v, -1) != OT_CLASS) {
        g_free(type_name);
        return sq_throwerror(v, "register_class: 'parent' must be a class");
    }
    SQInteger parent_idx = sq_gettop(v);

    /* Read parent.__gtype */
    sq_pushstring(v, "__gtype", -1);
    if (SQ_FAILED(sq_get(v, parent_idx))) {
        g_free(type_name);
        return sq_throwerror(v,
            "register_class: parent has no __gtype (not a GObject class?)");
    }
    const SQChar *parent_gtype_name = NULL;
    if (SQ_FAILED(sq_getstring(v, -1, &parent_gtype_name))) {
        g_free(type_name);
        return sq_throwerror(v,
            "register_class: parent.__gtype must be a string");
    }
    GType parent_gtype = g_type_from_name(parent_gtype_name);
    sq_poptop(v); /* __gtype string */

    if (parent_gtype == G_TYPE_INVALID || !g_type_is_a(parent_gtype, G_TYPE_OBJECT)) {
        g_free(type_name);
        return sq_throwerror(v,
            "register_class: parent is not a GObject subtype");
    }

    /* Get parent's GIObjectInfo for vfunc resolution. */
    GIObjectInfo *parent_info = (GIObjectInfo *)g_irepository_find_by_gtype(
        g_irepository_get_default(), parent_gtype);
    if (!parent_info ||
        g_base_info_get_type((GIBaseInfo *)parent_info) != GI_INFO_TYPE_OBJECT)
    {
        if (parent_info) g_base_info_unref((GIBaseInfo *)parent_info);
        g_free(type_name);
        return sq_throwerror(v,
            "register_class: parent GType not introspectable as an object");
    }
    /* g_irepository_find_by_gtype returns transfer-full per GI docs. */

    /* --- overrides table --- */
    GHashTable *overrides = g_hash_table_new_full(
        g_str_hash, g_str_equal, g_free, NULL);

    sq_pushstring(v, "overrides", -1);
    if (SQ_SUCCEEDED(sq_rawget(v, 2)) && sq_gettype(v, -1) == OT_TABLE) {
        SQInteger ov_idx = sq_gettop(v);
        sq_pushnull(v); /* iterator */
        while (SQ_SUCCEEDED(sq_next(v, ov_idx))) {
            /* key at -2, value at -1 */
            const SQChar *key = NULL;
            if (sq_gettype(v, -2) == OT_STRING &&
                SQ_SUCCEEDED(sq_getstring(v, -2, &key)) &&
                (sq_gettype(v, -1) == OT_CLOSURE ||
                 sq_gettype(v, -1) == OT_NATIVECLOSURE))
            {
                HSQOBJECT *handler = g_new0(HSQOBJECT, 1);
                sq_resetobject(handler);
                sq_getstackobj(v, -1, handler);
                sq_addref(v, handler);
                g_hash_table_insert(overrides, g_strdup(key), handler);
            } else {
                /* skip non-string keys or non-closure values */
            }
            sq_pop(v, 2); /* pop key, value */
        }
        sq_poptop(v); /* iterator */
    }
    sq_poptop(v); /* overrides slot result (table or null) */

    /* --- register GType --- */
    GTypeQuery q;
    g_type_query(parent_gtype, &q);
    if (q.type == 0) {
        g_hash_table_destroy(overrides);
        g_base_info_unref((GIBaseInfo *)parent_info);
        g_free(type_name);
        return sq_throwerror(v,
            "register_class: g_type_query failed on parent");
    }

    SqgiSubclass *s = g_new0(SqgiSubclass, 1);
    s->v = v;
    s->parent_gtype = parent_gtype;
    s->parent_info = parent_info;
    s->overrides = overrides;
    s->trampolines = g_ptr_array_new();

    GTypeInfo type_info = {
        .class_size     = (guint16)q.class_size,
        .base_init      = NULL,
        .base_finalize  = NULL,
        .class_init     = sqgi_subclass_class_init,
        .class_finalize = NULL,
        .class_data     = s,
        .instance_size  = (guint16)q.instance_size,
        .n_preallocs    = 0,
        .instance_init  = NULL,
        .value_table    = NULL,
    };
    GType new_type = g_type_register_static(parent_gtype, type_name,
                                            &type_info, 0);
    if (new_type == G_TYPE_INVALID) {
        /* `s` and overrides leak — but registration failure is rare and
         * non-recoverable. */
        g_free(type_name);
        return sq_throwerror(v, "register_class: g_type_register_static failed");
    }
    s->gtype = new_type;

    /* Force class_init to run now so vfunc overrides take effect even before
     * the first instance is constructed. (g_type_class_ref returns the class
     * pointer; we leak the ref intentionally — class lives forever.) */
    g_type_class_ref(new_type);

    /* --- build the Squirrel class derived from parent --- */
    sq_push(v, parent_idx);                  /* base class */
    sq_newclass(v, SQTrue);                  /* derives from base */
    SQInteger new_class = sq_gettop(v);

    /* Set __gtype on the new class. */
    sq_pushstring(v, "__gtype", -1);
    sq_pushstring(v, type_name, -1);
    sq_newslot(v, new_class, SQTrue);

    /* Register the new class in the GType registry so future
     * sqgi_gi_object_push_instance(obj) finds it. */
    sqgi_gi_object_register_class(v, type_name, new_class);

    /* Leave the class as the return value. */
    sq_remove(v, parent_idx); /* drop the parent reference */
    g_free(type_name);
    return 1;
}

/* ── sqgi.chain_up() ──────────────────────────────────────────────────────── */

/* Invokes the parent class's implementation of the currently-executing
 * vfunc with the original C ABI arguments, and returns its return value
 * as a Squirrel value. Must be called from inside a vfunc override. */
static SQInteger sq_fn_chain_up(HSQUIRRELVM v)
{
    if (!sqgi_active_calls || sqgi_active_calls->len == 0)
        return sq_throwerror(v,
            "chain_up: not inside a vfunc override");

    SqgiActiveCall *c = &g_array_index(sqgi_active_calls, SqgiActiveCall,
                                       sqgi_active_calls->len - 1);
    SqgiVfuncTramp *t = c->tramp;
    if (!t->parent_func) {
        /* No parent implementation — silently succeed with null. This
         * matches the GObject convention where unset vfunc slots are
         * tolerated. */
        sq_pushnull(v);
        return 1;
    }

    /* Allocate a return buffer big enough for libffi's ABI rules. */
    ffi_type *rt_ft = t->cif.rtype;
    size_t ret_sz = rt_ft->size;
    if (ret_sz < sizeof(ffi_arg)) ret_sz = sizeof(ffi_arg);
    void *ret_buf = g_alloca(ret_sz);
    memset(ret_buf, 0, ret_sz);

    ffi_call(&t->cif, FFI_FN(t->parent_func), ret_buf, c->args);

    /* Marshal return value back to Squirrel. */
    GICallableInfo *ci = (GICallableInfo *)t->vfunc_info;
    GITypeInfo *rt = g_callable_info_get_return_type(ci);
    GITypeTag tag = g_type_info_get_tag(rt);

    if (tag == GI_TYPE_TAG_VOID) {
        sq_pushnull(v);
    } else {
        GIArgument ga;
        sqgi_ffi_arg_to_gi(&ga, rt, ret_buf);
        sqgi_push_gi_argument(v, &ga, rt, GI_TRANSFER_NOTHING);
    }
    g_base_info_unref((GIBaseInfo *)rt);
    return 1;
}

/* ── Registration ────────────────────────────────────────────────────────── */

void sqgi_subclass_register_helpers(HSQUIRRELVM v)
{
    sq_pushroottable(v);
    sq_pushstring(v, "sqgi", -1);
    if (SQ_FAILED(sq_rawget(v, -2))) {
        sq_poptop(v);
        return;
    }

    sq_pushstring(v, "register_class", -1);
    sq_newclosure(v, sq_fn_register_class, 0);
    sq_setnativeclosurename(v, -1, "register_class");
    sq_newslot(v, -3, SQFalse);

    sq_pushstring(v, "chain_up", -1);
    sq_newclosure(v, sq_fn_chain_up, 0);
    sq_setnativeclosurename(v, -1, "chain_up");
    sq_newslot(v, -3, SQFalse);

    sq_pop(v, 2); /* sqgi, root */
}
