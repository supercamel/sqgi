#include "sqgi_gi.h"
#include "sqgi_gi_object.h"
#include "sqgi_marshal.h"
#include "sqgi_stack.h"
#include "sqgi_gerror.h"
#include "sqgi_cairo.h"
#include "sqgi_signal.h"

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <ffi.h>


static gboolean sqgi_trace_gi_import_enabled(void)
{
    const char *value = getenv("SQGI_TRACE_GI_IMPORT");
    return value && value[0] != '\0' && strcmp(value, "0") != 0;
}

static const char *sqgi_safe_str(const char *value)
{
    return value ? value : "<null>";
}

static void sqgi_trace_gi_import(const char *namespace_name, gint index,
                                 GIInfoType type, const char *name)
{
    if (!sqgi_trace_gi_import_enabled()) return;
    fprintf(stderr, "[sqgi] wrapping ns=%s i=%d type=%d name=%s\n",
            sqgi_safe_str(namespace_name), (int)index, (int)type,
            sqgi_safe_str(name));
    fflush(stderr);
}

typedef struct {
    HSQUIRRELVM v;
    HSQOBJECT fn;
    /* True when the trampoline is responsible for releasing this struct
     * after invocation (one-shot callback with no GI-declared destroy notify,
     * typically GI_SCOPE_TYPE_ASYNC). */
    gboolean free_after_call;
    /* libffi closure backing this callback; owned here. */
    void *ffi_executable;       /* code pointer passed to GLib */
    ffi_closure *ffi_closure;   /* writable closure object */
    ffi_cif ffi_cif;
    ffi_type **ffi_arg_types;
    gint ffi_arg_count;
    GICallableInfo *cb_info;    /* refed; describes the callback signature */
} SqgiCallbackData;

typedef struct {
    gint arg_index;
    gint closure_index;
    gint destroy_index;
    GIScopeType scope;
    SqgiCallbackData *cb_data;
} SqgiCallbackBinding;

static gssize sqgi_gi_argument_to_length(const GIArgument *arg, GITypeInfo *type_info)
{
    if (!arg || !type_info) return -1;

    switch (g_type_info_get_tag(type_info)) {
    case GI_TYPE_TAG_INT8:   return (gssize)arg->v_int8;
    case GI_TYPE_TAG_UINT8:  return (gssize)arg->v_uint8;
    case GI_TYPE_TAG_INT16:  return (gssize)arg->v_int16;
    case GI_TYPE_TAG_UINT16: return (gssize)arg->v_uint16;
    case GI_TYPE_TAG_INT32:  return (gssize)arg->v_int32;
    case GI_TYPE_TAG_UINT32: return (gssize)arg->v_uint32;
    case GI_TYPE_TAG_INT64:  return (gssize)arg->v_int64;
    case GI_TYPE_TAG_UINT64: return (gssize)arg->v_uint64;
    default:                 return -1;
    }
}

static void sqgi_callback_destroy_notify(gpointer user_data)
{
    SqgiCallbackData *d = (SqgiCallbackData *)user_data;
    if (!d) return;
    if (d->ffi_closure) {
        ffi_closure_free(d->ffi_closure);
        d->ffi_closure = NULL;
        d->ffi_executable = NULL;
    }
    if (d->ffi_arg_types) {
        g_free(d->ffi_arg_types);
        d->ffi_arg_types = NULL;
    }
    if (d->cb_info) {
        g_base_info_unref((GIBaseInfo *)d->cb_info);
        d->cb_info = NULL;
    }
    /* Long-lived callbacks (set_draw_func, add_tick_callback, …) may be
     * destroyed from inside GLib widget teardown, which can happen *after*
     * sqgi_vm_free has marked the VM as closing and begun tearing down the
     * reftable. Releasing into a partially-destroyed VM would trip the
     * RefTable::Release assertion. Skip the release in that case — the VM
     * is about to free the reftable wholesale anyway. */
    if (!sqgi_signal_vm_is_closing(d->v) &&
        sq_getrefcount(d->v, &d->fn) > 0) {
        sq_release(d->v, &d->fn);
    }
    sq_resetobject(&d->fn);
    g_free(d);
}

/* Map a GI type tag to a libffi type for use in callback CIFs. We only
 * advertise types whose value can fit in a single `void *` / `long`-sized
 * register slot (which is how libffi passes integer/pointer args). Anything
 * larger (float/double passed by value, structs) is rejected at preparation
 * time so we never silently truncate. */
ffi_type *sqgi_ffi_type_for_gi(GITypeInfo *ti, gboolean is_return)
{
    GITypeTag tag = g_type_info_get_tag(ti);
    switch (tag) {
    case GI_TYPE_TAG_VOID:    return is_return ? &ffi_type_void : &ffi_type_pointer;
    case GI_TYPE_TAG_BOOLEAN: return &ffi_type_sint;     /* gboolean = int */
    case GI_TYPE_TAG_INT8:    return &ffi_type_sint8;
    case GI_TYPE_TAG_UINT8:   return &ffi_type_uint8;
    case GI_TYPE_TAG_INT16:   return &ffi_type_sint16;
    case GI_TYPE_TAG_UINT16:  return &ffi_type_uint16;
    case GI_TYPE_TAG_INT32:   return &ffi_type_sint32;
    case GI_TYPE_TAG_UINT32:  return &ffi_type_uint32;
    case GI_TYPE_TAG_INT64:   return &ffi_type_sint64;
    case GI_TYPE_TAG_UINT64:  return &ffi_type_uint64;
    case GI_TYPE_TAG_FLOAT:   return &ffi_type_float;
    case GI_TYPE_TAG_DOUBLE:  return &ffi_type_double;
    case GI_TYPE_TAG_GTYPE:   return &ffi_type_pointer;  /* gsize-shaped */
    case GI_TYPE_TAG_UTF8:
    case GI_TYPE_TAG_FILENAME:
    case GI_TYPE_TAG_ARRAY:
    case GI_TYPE_TAG_GLIST:
    case GI_TYPE_TAG_GSLIST:
    case GI_TYPE_TAG_GHASH:
    case GI_TYPE_TAG_ERROR:
        return &ffi_type_pointer;
    case GI_TYPE_TAG_INTERFACE: {
        GIBaseInfo *iface = g_type_info_get_interface(ti);
        GIInfoType itype = g_base_info_get_type(iface);
        g_base_info_unref(iface);
        if (itype == GI_INFO_TYPE_ENUM || itype == GI_INFO_TYPE_FLAGS)
            return &ffi_type_sint;
        /* Objects, interfaces, structs, boxed, union — all by pointer. */
        return &ffi_type_pointer;
    }
    default:
        return NULL;
    }
}

/* Pull a GIArgument out of a void* libffi arg slot for a given type tag. */
void sqgi_ffi_arg_to_gi(GIArgument *out, GITypeInfo *ti, void *slot)
{
    GITypeTag tag = g_type_info_get_tag(ti);
    memset(out, 0, sizeof(*out));
    switch (tag) {
    case GI_TYPE_TAG_BOOLEAN: out->v_boolean = *(gint *)slot ? TRUE : FALSE; break;
    case GI_TYPE_TAG_INT8:    out->v_int8    = *(gint8 *)slot; break;
    case GI_TYPE_TAG_UINT8:   out->v_uint8   = *(guint8 *)slot; break;
    case GI_TYPE_TAG_INT16:   out->v_int16   = *(gint16 *)slot; break;
    case GI_TYPE_TAG_UINT16:  out->v_uint16  = *(guint16 *)slot; break;
    case GI_TYPE_TAG_INT32:   out->v_int32   = *(gint32 *)slot; break;
    case GI_TYPE_TAG_UINT32:  out->v_uint32  = *(guint32 *)slot; break;
    case GI_TYPE_TAG_INT64:   out->v_int64   = *(gint64 *)slot; break;
    case GI_TYPE_TAG_UINT64:  out->v_uint64  = *(guint64 *)slot; break;
    case GI_TYPE_TAG_FLOAT:   out->v_float   = *(gfloat *)slot; break;
    case GI_TYPE_TAG_DOUBLE:  out->v_double  = *(gdouble *)slot; break;
    case GI_TYPE_TAG_INTERFACE: {
        GIBaseInfo *iface = g_type_info_get_interface(ti);
        GIInfoType itype = g_base_info_get_type(iface);
        g_base_info_unref(iface);
        if (itype == GI_INFO_TYPE_ENUM || itype == GI_INFO_TYPE_FLAGS) {
            out->v_int32 = *(gint *)slot;
        } else {
            out->v_pointer = *(gpointer *)slot;
        }
        break;
    }
    default:
        out->v_pointer = *(gpointer *)slot;
        break;
    }
}

/* libffi handler: invoked for every callback the script registered. Unmarshal
 * each declared argument, push Squirrel closure + N values, call it, then
 * write the return value into `ret`. */
static void sqgi_ffi_callback_handler(ffi_cif *cif, void *ret, void **args,
                                     void *user_data)
{
    (void)cif;
    SqgiCallbackData *d = (SqgiCallbackData *)user_data;
    HSQUIRRELVM v = d->v;
    GICallableInfo *ci = d->cb_info;
    gint n_args = g_callable_info_get_n_args(ci);

    SQInteger top = sq_gettop(v);
    sq_pushobject(v, d->fn);
    sq_pushnull(v); /* `this` */

    /* Find which arg slot carries our user_data (if any) — skip it from the
     * Squirrel-visible argument list since we already have the closure. */
    gint user_data_slot = -1;
    for (gint i = 0; i < n_args; i++) {
        GIArgInfo *ai = g_callable_info_get_arg(ci, i);
        if (g_arg_info_get_closure(ai) == i) {
            user_data_slot = i;
            g_base_info_unref(ai);
            break;
        }
        g_base_info_unref(ai);
    }
    /* If GI did not annotate the closure slot but the trailing parameter is a
     * void* / pointer-shaped value, assume that's the user_data slot — this
     * matches GAsyncReadyCallback, GFunc, etc. Detect by checking whether
     * the last slot has a pointer type and is not annotated as anything
     * structured. */
    if (user_data_slot < 0 && n_args > 0) {
        GIArgInfo *ai = g_callable_info_get_arg(ci, n_args - 1);
        GITypeInfo *ti = g_arg_info_get_type(ai);
        GITypeTag tag = g_type_info_get_tag(ti);
        if (tag == GI_TYPE_TAG_VOID || tag == GI_TYPE_TAG_INTERFACE) {
            /* Treat trailing void/iface pointer as user_data */
            user_data_slot = n_args - 1;
        }
        g_base_info_unref(ti);
        g_base_info_unref(ai);
    }

    gint visible_args = 0;
    for (gint i = 0; i < n_args; i++) {
        if (i == user_data_slot) continue;
        GIArgInfo *ai = g_callable_info_get_arg(ci, i);
        GITypeInfo *ti = g_arg_info_get_type(ai);
        GIArgument ga;
        sqgi_ffi_arg_to_gi(&ga, ti, args[i]);
        sqgi_push_gi_argument(v, &ga, ti, GI_TRANSFER_NOTHING);
        visible_args++;
        g_base_info_unref(ti);
        g_base_info_unref(ai);
    }

    /* Squirrel call: nargs includes 'this' */
    SQRESULT res = sq_call(v, 1 + visible_args, SQTrue, SQTrue);

    /* Marshal return */
    GITypeInfo *ret_ti = g_callable_info_get_return_type(ci);
    GITypeTag ret_tag = g_type_info_get_tag(ret_ti);
    SQBool keep_bool = SQFalse;
    if (SQ_SUCCEEDED(res)) {
        switch (ret_tag) {
        case GI_TYPE_TAG_VOID:
            break;
        case GI_TYPE_TAG_BOOLEAN: {
            if (sq_gettype(v, -1) == OT_BOOL) sq_getbool(v, -1, &keep_bool);
            *(ffi_arg *)ret = keep_bool ? TRUE : FALSE;
            break;
        }
        case GI_TYPE_TAG_INT8: case GI_TYPE_TAG_UINT8:
        case GI_TYPE_TAG_INT16: case GI_TYPE_TAG_UINT16:
        case GI_TYPE_TAG_INT32: case GI_TYPE_TAG_UINT32:
        case GI_TYPE_TAG_INT64: case GI_TYPE_TAG_UINT64: {
            SQInteger iv = 0;
            if (sq_gettype(v, -1) == OT_INTEGER || sq_gettype(v, -1) == OT_BOOL) {
                sq_getinteger(v, -1, &iv);
            }
            if (ret_tag == GI_TYPE_TAG_INT64 || ret_tag == GI_TYPE_TAG_UINT64) {
                *(gint64 *)ret = (gint64)iv;
            } else {
                *(ffi_arg *)ret = (ffi_arg)iv;
            }
            break;
        }
        default:
            /* For everything else default to zero/null. Callers that need
             * richer return values should use scope-CALL synchronous APIs. */
            *(gpointer *)ret = NULL;
            break;
        }
    } else {
        /* Squirrel threw. Best-effort: leave return zeroed and surface an
         * error via stderr. The async runtime can't propagate this further
         * because libffi has no notion of exceptions. */
        memset(ret, 0, cif->rtype->size);
    }
    sq_settop(v, top);
    g_base_info_unref(ret_ti);

    if (d->free_after_call) {
        /* ASYNC scope with no destroy slot: caller-supplied script ran once,
         * now release. NOTE: for GI_TYPE_TAG_BOOLEAN return signatures this
         * matches GSourceFunc — we only free on G_SOURCE_REMOVE — but for
         * void-returning one-shots (GAsyncReadyCallback) we always free,
         * since they're guaranteed to be invoked exactly once. */
        gboolean drop = TRUE;
        if (ret_tag == GI_TYPE_TAG_BOOLEAN) {
            drop = !keep_bool;
        }
        if (drop) sqgi_callback_destroy_notify(d);
    }
}

/* Allocate and prepare a libffi closure that matches `cb_info`'s signature.
 * On success, fills d->ffi_* fields and returns TRUE. Returns FALSE if any
 * parameter has a type we cannot dispatch through libffi (caller should free
 * d and surface an error). */
static gboolean sqgi_prepare_ffi_callback(SqgiCallbackData *d, GICallbackInfo *cb_info)
{
    GICallableInfo *ci = (GICallableInfo *)cb_info;
    gint n = g_callable_info_get_n_args(ci);

    GITypeInfo *ret_ti = g_callable_info_get_return_type(ci);
    ffi_type *ret_ft = sqgi_ffi_type_for_gi(ret_ti, TRUE);
    g_base_info_unref(ret_ti);
    if (!ret_ft) return FALSE;

    ffi_type **arg_fts = NULL;
    if (n > 0) {
        arg_fts = g_new0(ffi_type *, n);
        for (gint i = 0; i < n; i++) {
            GIArgInfo *ai = g_callable_info_get_arg(ci, i);
            GITypeInfo *ti = g_arg_info_get_type(ai);
            ffi_type *ft = sqgi_ffi_type_for_gi(ti, FALSE);
            g_base_info_unref(ti);
            g_base_info_unref(ai);
            if (!ft) { g_free(arg_fts); return FALSE; }
            arg_fts[i] = ft;
        }
    }

    void *exec = NULL;
    ffi_closure *cl = ffi_closure_alloc(sizeof(ffi_closure), &exec);
    if (!cl) { g_free(arg_fts); return FALSE; }

    if (ffi_prep_cif(&d->ffi_cif, FFI_DEFAULT_ABI, (unsigned int)n, ret_ft,
                     arg_fts) != FFI_OK) {
        ffi_closure_free(cl);
        g_free(arg_fts);
        return FALSE;
    }
    if (ffi_prep_closure_loc(cl, &d->ffi_cif, sqgi_ffi_callback_handler,
                             d, exec) != FFI_OK) {
        ffi_closure_free(cl);
        g_free(arg_fts);
        return FALSE;
    }

    d->ffi_closure = cl;
    d->ffi_executable = exec;
    d->ffi_arg_types = arg_fts;
    d->ffi_arg_count = n;
    d->cb_info = (GICallableInfo *)g_base_info_ref((GIBaseInfo *)cb_info);
    return TRUE;
}

static void sqgi_push_registered_instance_for_info(HSQUIRRELVM v, GIBaseInfo *info, gpointer ptr)
{
    if (!ptr) {
        sq_pushnull(v);
        return;
    }

    const char *ns = g_base_info_get_namespace(info);
    const char *name = g_base_info_get_name(info);
    char full_key[256];
    snprintf(full_key, sizeof(full_key), "%s.%s", ns, name);

    if (SQ_SUCCEEDED(sqgi_gi_object_lookup_class(v, full_key))) {
        sq_createinstance(v, -1);
        sq_remove(v, -2);
        sq_setinstanceup(v, -1, ptr);
    } else {
        sq_pushuserpointer(v, ptr);
    }
}

/* Identical to sqgi_push_registered_instance_for_info but additionally
 * installs the boxed-ownership release hook so a transferred-everything
 * record (constructor return, etc.) is freed when the wrapper is GC'd. */
static void sqgi_push_owned_registered_instance(HSQUIRRELVM v, GIBaseInfo *info, gpointer ptr)
{
    sqgi_push_registered_instance_for_info(v, info, ptr);
    if (!ptr) return;
    if (sq_gettype(v, -1) != OT_INSTANCE) return;
    GIInfoType itype = g_base_info_get_type(info);
    if (itype != GI_INFO_TYPE_STRUCT && itype != GI_INFO_TYPE_BOXED &&
        itype != GI_INFO_TYPE_UNION) return;
    GType gtype = g_registered_type_info_get_g_type((GIRegisteredTypeInfo *)info);
    sqgi_boxed_track_ownership(v, -1, ptr, gtype);
}

/* Constructor-return version: handles GIR's floating-ref convention for
 * GVariant. Most GVariant.new_* are annotated transfer-none because they
 * return a *floating* reference. We sink the float and treat the result
 * as owned, so the wrapper's release hook frees it. For everything else,
 * mirror the explicit transfer annotation. */
static void sqgi_push_constructor_record(HSQUIRRELVM v, GIBaseInfo *info,
                                         gpointer ptr, GITransfer transfer)
{
    if (!ptr) { sq_pushnull(v); return; }
    GType gtype = g_registered_type_info_get_g_type((GIRegisteredTypeInfo *)info);

    gboolean own = (transfer == GI_TRANSFER_EVERYTHING);
    if (!own && gtype == G_TYPE_VARIANT && g_variant_is_floating((GVariant *)ptr)) {
        g_variant_ref_sink((GVariant *)ptr);
        own = TRUE;
    }
    if (own) {
        sqgi_push_owned_registered_instance(v, info, ptr);
    } else {
        sqgi_push_registered_instance_for_info(v, info, ptr);
    }
}

/* ── Function data userdata release hook ─────────────────────────────────── */

typedef struct {
    GIFunctionInfo *info;
} SqgiFuncData;

static SQInteger sqgi_func_data_release(SQUserPointer p, SQInteger size)
{
    (void)size;
    SqgiFuncData *d = (SqgiFuncData *)p;
    if (d->info) g_base_info_unref((GIBaseInfo *)d->info);
    return 0;
}

/* ── Function call trampoline ────────────────────────────────────────────── */

/*
 * Each GI function closure has one free variable: a userdata containing a
 * SqgiFuncData*.  Free variables are pushed onto the stack after args by the
 * Squirrel VM, so we read it from the top of the current call frame.
 *
 * Stack layout inside call: [this, arg1, ..., argN, freevar1]
 * We retrieve freevar1 with sq_gettop(v) (it is the last item pushed).
 */
/* Free any in-arg side allocations that sqgi_get_gi_argument made (e.g. the
 * char** strv we built for UTF-8/FILENAME C-arrays sourced from a Squirrel
 * array/table). Safe to call on both error and success paths. */
static void sqgi_gi_free_in_arg_allocs(GICallableInfo *callable, GIArgument *in_args,
                                      const gint *arg_to_in, gint n_args)
{
    for (gint i = 0; i < n_args; i++) {
        if (arg_to_in[i] < 0) continue;
        GIArgInfo  *ai = g_callable_info_get_arg(callable, i);
        GITypeInfo *ti = g_arg_info_get_type(ai);
        if (g_type_info_get_tag(ti) == GI_TYPE_TAG_ARRAY &&
            g_type_info_get_array_type(ti) == GI_ARRAY_TYPE_C) {
            GITypeInfo *param = g_type_info_get_param_type(ti, 0);
            GITypeTag ptag = g_type_info_get_tag(param);
            if ((ptag == GI_TYPE_TAG_UTF8 || ptag == GI_TYPE_TAG_FILENAME) &&
                in_args[arg_to_in[i]].v_pointer) {
                g_strfreev((char **)in_args[arg_to_in[i]].v_pointer);
                in_args[arg_to_in[i]].v_pointer = NULL;
            } else if (ptag == GI_TYPE_TAG_INTERFACE &&
                       in_args[arg_to_in[i]].v_pointer) {
                /* We only own the spine (gpointer[]); element refs/lifetime
                 * are managed by their Squirrel wrappers. */
                g_free(in_args[arg_to_in[i]].v_pointer);
                in_args[arg_to_in[i]].v_pointer = NULL;
            }
            g_base_info_unref(param);
        }
        g_base_info_unref(ti);
        g_base_info_unref(ai);
    }
}

static void sqgi_gi_ref_transfer_full_object_inputs(GICallableInfo *callable,
                                                    GIArgument *in_args,
                                                    const gint *arg_to_in,
                                                    gint n_args)
{
    for (gint i = 0; i < n_args; i++) {
        if (arg_to_in[i] < 0) continue;

        GIArgInfo  *ai = g_callable_info_get_arg(callable, i);
        GIDirection dir = g_arg_info_get_direction(ai);
        GITransfer transfer = g_arg_info_get_ownership_transfer(ai);
        GITypeInfo *ti = g_arg_info_get_type(ai);

        if ((dir == GI_DIRECTION_IN || dir == GI_DIRECTION_INOUT) &&
            transfer == GI_TRANSFER_EVERYTHING &&
            g_type_info_get_tag(ti) == GI_TYPE_TAG_INTERFACE &&
            in_args[arg_to_in[i]].v_pointer) {
            GIBaseInfo *iface = g_type_info_get_interface(ti);
            GIInfoType itype = g_base_info_get_type(iface);
            if ((itype == GI_INFO_TYPE_OBJECT || itype == GI_INFO_TYPE_INTERFACE) &&
                G_IS_OBJECT(in_args[arg_to_in[i]].v_pointer)) {
                /* The callee consumes this ref. The Squirrel wrapper keeps
                 * owning its original ref, so temporary objects passed to
                 * transfer-full constructors remain valid for the callee. */
                g_object_ref(in_args[arg_to_in[i]].v_pointer);
            }
            g_base_info_unref(iface);
        }

        g_base_info_unref(ti);
        g_base_info_unref(ai);
    }
}

/* Push a single OUT arg `i` onto the Squirrel stack, applying the
 * uint8[]→string special case if `ati` is a byte array whose length-arg has
 * a known value in `out_storage`. Falls back to sqgi_push_gi_argument for
 * everything else. Used by the single-out and multi-out result paths so they
 * stay consistent (otherwise e.g. g_file_load_contents_finish returns a raw
 * int array for `contents` only when combined with another visible out-arg
 * like `etag`). */
static void sqgi_push_out_arg(HSQUIRRELVM v, GICallableInfo *callable,
                              gint i, GITypeInfo *ati, GITransfer atransfer,
                              GIArgument *out_storage, const gint *arg_to_out,
                              gint n_args, const GType *owned_out_gtypes)
{
    if (g_type_info_get_tag(ati) == GI_TYPE_TAG_ARRAY) {
        GITypeInfo *elem = g_type_info_get_param_type(ati, 0);
        GITypeTag et = g_type_info_get_tag(elem);
        if (et == GI_TYPE_TAG_UINT8 || et == GI_TYPE_TAG_INT8) {
            gssize blen = -1;
            gint la = g_type_info_get_array_length(ati);
            if (la >= 0 && la < n_args) {
                gint lp = arg_to_out[la];
                if (lp >= 0) {
                    GIArgInfo  *lai = g_callable_info_get_arg(callable, la);
                    GITypeInfo *lti = g_arg_info_get_type(lai);
                    blen = sqgi_gi_argument_to_length(&out_storage[lp], lti);
                    g_base_info_unref(lti);
                    g_base_info_unref(lai);
                }
            }
            if (blen >= 0 && out_storage[arg_to_out[i]].v_pointer) {
                sq_pushstring(v, (const SQChar *)out_storage[arg_to_out[i]].v_pointer,
                              (SQInteger)blen);
                if (atransfer == GI_TRANSFER_EVERYTHING) {
                    g_free(out_storage[arg_to_out[i]].v_pointer);
                    out_storage[arg_to_out[i]].v_pointer = NULL;
                }
                g_base_info_unref(elem);
                return;
            }
            /* Zero-terminated guint8* OUT arg (e.g.
             * g_spawn_command_line_sync's standard_output / standard_error):
             * no length companion, so walk until NUL. */
            if (blen < 0 && g_type_info_is_zero_terminated(ati) &&
                out_storage[arg_to_out[i]].v_pointer) {
                const char *bp = (const char *)out_storage[arg_to_out[i]].v_pointer;
                sq_pushstring(v, (const SQChar *)bp, (SQInteger)strlen(bp));
                if (atransfer == GI_TRANSFER_EVERYTHING) {
                    g_free(out_storage[arg_to_out[i]].v_pointer);
                    out_storage[arg_to_out[i]].v_pointer = NULL;
                }
                g_base_info_unref(elem);
                return;
            }
        }
        g_base_info_unref(elem);
    }
    if (owned_out_gtypes && arg_to_out[i] >= 0) {
        GType owned_gtype = owned_out_gtypes[arg_to_out[i]];
        if (owned_gtype != G_TYPE_INVALID && owned_gtype != G_TYPE_NONE &&
            g_type_info_get_tag(ati) == GI_TYPE_TAG_INTERFACE &&
            out_storage[arg_to_out[i]].v_pointer) {
            GIBaseInfo *iface = g_type_info_get_interface(ati);
            sqgi_push_owned_registered_instance(v, iface,
                                                out_storage[arg_to_out[i]].v_pointer);
            g_base_info_unref(iface);
            return;
        }
    }
    sqgi_push_gi_argument(v, &out_storage[arg_to_out[i]], ati, atransfer);
}

static gsize sqgi_caller_allocated_size(GIBaseInfo *info)
{
    GIInfoType itype = g_base_info_get_type(info);
    if (itype == GI_INFO_TYPE_STRUCT || itype == GI_INFO_TYPE_BOXED) {
        return (gsize)g_struct_info_get_size((GIStructInfo *)info);
    }
    if (itype == GI_INFO_TYPE_UNION) {
        return (gsize)g_union_info_get_size((GIUnionInfo *)info);
    }
    return 0;
}

static void sqgi_free_caller_allocated_out(gpointer *caller_allocated_out, gint n_out_args)
{
    if (!caller_allocated_out) return;
    for (gint i = 0; i < n_out_args; i++) {
        g_free(caller_allocated_out[i]);
        caller_allocated_out[i] = NULL;
    }
}

static SQInteger gi_function_call(HSQUIRRELVM v)
{
    SQUserPointer p;
    /* Free variable is the topmost item on the stack */
    sq_getuserdata(v, sq_gettop(v), &p, NULL);
    SqgiFuncData *fdata = (SqgiFuncData *)p;
    GIFunctionInfo *info = fdata->info;
    GICallableInfo *callable = (GICallableInfo *)info;

    gint n_args = g_callable_info_get_n_args(callable);
    GIFunctionInfoFlags flags = g_function_info_get_flags(info);
    gboolean is_method = (flags & GI_FUNCTION_IS_METHOD) != 0;
    gboolean is_constructor = (flags & GI_FUNCTION_IS_CONSTRUCTOR) != 0;
    gboolean throws = (flags & GI_FUNCTION_THROWS) != 0;

    /* Squirrel stack: [this, arg0, arg1, ...] — index 1 is 'this' */
    SQInteger sq_nargs = sq_gettop(v); /* includes 'this' */
    SQInteger sq_arg_start = 2;        /* first real arg, since index 1 = this */

    /* Count in/out args for correct invocation */
    gint n_in_args = 0;
    gint n_out_args = 0;
    for (gint i = 0; i < n_args; i++) {
        GIArgInfo  *ai  = g_callable_info_get_arg(callable, i);
        GIDirection dir = g_arg_info_get_direction(ai);
        g_base_info_unref(ai);
        if (dir == GI_DIRECTION_IN || dir == GI_DIRECTION_INOUT) n_in_args++;
        if (dir == GI_DIRECTION_OUT || dir == GI_DIRECTION_INOUT) n_out_args++;
    }

    /* ── Validate user-facing argument count ─────────────────────────────
     * Mark args that the user is NOT expected to supply directly:
     *   • OUT args (we allocate storage)
     *   • Array length args (we compute from array length)
     *   • Callback closure / destroy args (we wire user_data + free hook)
     */
    gboolean *user_visible = g_new0(gboolean, n_args > 0 ? n_args : 1);
    for (gint i = 0; i < n_args; i++) {
        GIArgInfo *ai = g_callable_info_get_arg(callable, i);
        GIDirection dir = g_arg_info_get_direction(ai);
        user_visible[i] = (dir == GI_DIRECTION_IN || dir == GI_DIRECTION_INOUT);
        g_base_info_unref(ai);
    }
    for (gint i = 0; i < n_args; i++) {
        GIArgInfo *ai = g_callable_info_get_arg(callable, i);
        GITypeInfo *ti = g_arg_info_get_type(ai);
        if (g_type_info_get_tag(ti) == GI_TYPE_TAG_ARRAY) {
            gint la = g_type_info_get_array_length(ti);
            if (la >= 0 && la < n_args) user_visible[la] = FALSE;
        }
        if (g_type_info_get_tag(ti) == GI_TYPE_TAG_INTERFACE) {
            GIBaseInfo *iface = g_type_info_get_interface(ti);
            if (g_base_info_get_type(iface) == GI_INFO_TYPE_CALLBACK) {
                gint ci = g_arg_info_get_closure(ai);
                gint di = g_arg_info_get_destroy(ai);
                if (ci >= 0 && ci < n_args) user_visible[ci] = FALSE;
                if (di >= 0 && di < n_args) user_visible[di] = FALSE;
            }
            g_base_info_unref(iface);
        }
        g_base_info_unref(ti);
        g_base_info_unref(ai);
    }
    gint required_user_args = 0;
    for (gint i = 0; i < n_args; i++) if (user_visible[i]) required_user_args++;
    /* user_visible[] outlives this block — freed at function exit. The
     * per-arg marshalling loop reads it to skip nullability checks on
     * hidden length/closure/destroy slots. */

    SQInteger user_args_passed = sq_nargs - 2; /* subtract 'this' and free var */
    /* Accept either the user-visible count (preferred, with array lengths
     * computed automatically) or the total IN-arg count (back-compat for
     * callers that explicitly pass length arguments). */
    if (user_args_passed != (SQInteger)required_user_args &&
        user_args_passed != (SQInteger)n_in_args) {
        char msg[256];
        snprintf(msg, sizeof(msg),
                 "%s: wrong number of arguments (got %d, expected %d or %d)",
                 g_base_info_get_name((GIBaseInfo *)info),
                 (int)user_args_passed,
                 (int)required_user_args, (int)n_in_args);
        g_free(user_visible);
        return sq_throwerror(v, msg);
    }

    /* Map each GI arg index → Squirrel stack slot the user supplied for it
     * (or -1 for hidden args we synthesise: length, closure, destroy). The
     * marshal/auto-fill loops below index Squirrel through this table so a
     * hidden length arg between two user-visible args doesn't consume a
     * stack slot. */
    gboolean compact_args = (user_args_passed == (SQInteger)required_user_args);
    gint *arg_sq_idx = g_new(gint, n_args > 0 ? n_args : 1);
    {
        SQInteger cursor = sq_arg_start;
        for (gint i = 0; i < n_args; i++) {
            gboolean take_slot;
            if (compact_args) {
                take_slot = user_visible[i];
            } else {
                /* Legacy: caller passed every IN/INOUT arg explicitly. */
                GIArgInfo *ai = g_callable_info_get_arg(callable, i);
                GIDirection dir = g_arg_info_get_direction(ai);
                take_slot = (dir == GI_DIRECTION_IN || dir == GI_DIRECTION_INOUT);
                g_base_info_unref(ai);
            }
            arg_sq_idx[i] = take_slot ? (gint)cursor++ : -1;
        }
    }

    /* Build in/out arrays */
    gint total_in = n_in_args + (is_method ? 1 : 0);
    GIArgument *in_args  = g_new0(GIArgument, total_in > 0 ? total_in : 1);
    GIArgument *out_args = g_new0(GIArgument, n_out_args > 0 ? n_out_args : 1);

    /* Storage for out-arg destinations: GI requires out-args be pointers to
     * memory we own.  We allocate one slot per out-arg and place its address
     * in out_args[].v_pointer. */
    GIArgument *out_storage = g_new0(GIArgument, n_out_args > 0 ? n_out_args : 1);
    gpointer *caller_allocated_out = g_new0(gpointer, n_out_args > 0 ? n_out_args : 1);
    GType *owned_out_gtypes = g_new0(GType, n_out_args > 0 ? n_out_args : 1);
    for (gint i = 0; i < n_out_args; i++) {
        owned_out_gtypes[i] = G_TYPE_INVALID;
    }

    gint *arg_to_in = g_new0(gint, n_args > 0 ? n_args : 1);
    gint *arg_to_out = g_new0(gint, n_args > 0 ? n_args : 1);
    for (gint i = 0; i < n_args; i++) {
        arg_to_in[i] = -1;
        arg_to_out[i] = -1;
    }
    GPtrArray *callback_bindings = g_ptr_array_new();
    GIArgument  return_arg;
    memset(&return_arg, 0, sizeof(return_arg));

    gint in_idx = 0;
    gint out_idx = 0;

    /* If method: first in_arg is the instance */
    if (is_method) {
        SQUserPointer instance_ptr = NULL;
        if (SQ_FAILED(sq_getinstanceup(v, 1, &instance_ptr, NULL, SQFalse)) || !instance_ptr) {
            g_free(in_args);
            g_free(out_args);
            g_free(out_storage);
            g_free(caller_allocated_out);
            g_free(owned_out_gtypes);
            g_free(arg_to_in);
            g_free(arg_to_out);
            g_free(user_visible);
            g_free(arg_sq_idx);
            g_ptr_array_free(callback_bindings, TRUE);
            return sq_throwerror(v, "sqgi: method called on non-instance");
        }
        in_args[in_idx++].v_pointer = instance_ptr;
    }

    /* Marshal input arguments from Squirrel stack */
    for (gint i = 0; i < n_args; i++) {
        GIArgInfo *arg_info = g_callable_info_get_arg(callable, i);
        GIDirection dir = g_arg_info_get_direction(arg_info);
        GITypeInfo *type_info = g_arg_info_get_type(arg_info);

        if (dir == GI_DIRECTION_OUT || dir == GI_DIRECTION_INOUT) {
            /* Provide caller-allocated storage and pass its address. For
             * caller-allocated records (GtkTextIter, etc.), the destination
             * must be large enough for the full struct, not just GIArgument. */
            gboolean allocated_record = FALSE;
            if (g_type_info_get_tag(type_info) == GI_TYPE_TAG_INTERFACE) {
                GIBaseInfo *iface = g_type_info_get_interface(type_info);
                GIInfoType itype = g_base_info_get_type(iface);
                if (g_arg_info_is_caller_allocates(arg_info) &&
                    (itype == GI_INFO_TYPE_STRUCT || itype == GI_INFO_TYPE_BOXED ||
                     itype == GI_INFO_TYPE_UNION)) {
                    gsize size = sqgi_caller_allocated_size(iface);
                    if (size > 0) {
                        caller_allocated_out[out_idx] = g_malloc0(size);
                        out_storage[out_idx].v_pointer = caller_allocated_out[out_idx];
                        out_args[out_idx].v_pointer = caller_allocated_out[out_idx];
                        allocated_record = TRUE;
                    }
                }
                g_base_info_unref(iface);
            }
            if (!allocated_record) {
                out_args[out_idx].v_pointer = &out_storage[out_idx];
            }
            arg_to_out[i] = out_idx;
            out_idx++;
        }

        if (dir == GI_DIRECTION_IN || dir == GI_DIRECTION_INOUT) {
            SQInteger sq_idx = (arg_sq_idx[i] >= 0)
                ? (SQInteger)arg_sq_idx[i]
                : (sq_nargs + 1); /* synthesised: triggers "missing arg" path */
            arg_to_in[i] = in_idx;

            gboolean handled = FALSE;
            GITypeTag ttag = g_type_info_get_tag(type_info);
            if (ttag == GI_TYPE_TAG_INTERFACE && sq_idx <= sq_nargs) {
                GIBaseInfo *iface = g_type_info_get_interface(type_info);
                if (g_base_info_get_type(iface) == GI_INFO_TYPE_CALLBACK) {
                    SQObjectType st = sq_gettype(v, sq_idx);
                    if (st == OT_CLOSURE || st == OT_NATIVECLOSURE) {
                        SqgiCallbackData *cb = g_new0(SqgiCallbackData, 1);
                        cb->v = v;
                        sq_resetobject(&cb->fn);
                        sq_getstackobj(v, sq_idx, &cb->fn);
                        sq_addref(v, &cb->fn);

                        if (!sqgi_prepare_ffi_callback(cb, (GICallbackInfo *)iface)) {
                            sq_release(v, &cb->fn);
                            g_free(cb);
                            g_base_info_unref(iface);
                            g_base_info_unref(type_info);
                            g_base_info_unref(arg_info);
                            sqgi_gi_free_in_arg_allocs(callable, in_args, arg_to_in, n_args);
                            g_free(in_args);
                            g_free(out_args);
                            sqgi_free_caller_allocated_out(caller_allocated_out, n_out_args);
                            g_free(out_storage);
                            g_free(caller_allocated_out);
                            g_free(owned_out_gtypes);
                            g_free(arg_to_in);
                            g_free(arg_to_out);
                            g_free(user_visible);
                            g_free(arg_sq_idx);
                            for (guint bi = 0; bi < callback_bindings->len; bi++) {
                                SqgiCallbackBinding *b = g_ptr_array_index(callback_bindings, bi);
                                sqgi_callback_destroy_notify(b->cb_data);
                                g_free(b);
                            }
                            g_ptr_array_free(callback_bindings, TRUE);
                            return sq_throwerror(v,
                                "sqgi: failed to prepare FFI closure for "
                                "callback (unsupported parameter type)");
                        }

                        in_args[in_idx].v_pointer = cb->ffi_executable;

                        SqgiCallbackBinding *binding = g_new0(SqgiCallbackBinding, 1);
                        binding->arg_index = i;
                        binding->closure_index = g_arg_info_get_closure(arg_info);
                        binding->destroy_index = g_arg_info_get_destroy(arg_info);
                        binding->scope = g_arg_info_get_scope(arg_info);
                        binding->cb_data = cb;
                        /* ASYNC scope = one-shot callback, no destroy slot
                         * declared → trampoline must release itself after
                         * dispatch. NOTIFIED scope = destroy slot will be
                         * invoked by callee. CALL scope = freed at end of
                         * function invocation below. */
                        if (binding->scope == GI_SCOPE_TYPE_ASYNC &&
                            binding->destroy_index < 0) {
                            cb->free_after_call = TRUE;
                        }
                        g_ptr_array_add(callback_bindings, binding);
                        handled = TRUE;
                    } else if (st == OT_NULL && g_arg_info_may_be_null(arg_info)) {
                        /* Nullable callback slot: leave NULL pointer. */
                        in_args[in_idx].v_pointer = NULL;
                        handled = TRUE;
                    } else {
                        /* Wrong type in a callback slot would otherwise be
                         * silently passed through as an opaque pointer and
                         * later invoked by the callee as a function pointer
                         * — guaranteed segfault. Reject loudly. */
                        char msg[256];
                        const char *tname;
                        switch (st) {
                            case OT_NULL: tname = "null"; break;
                            case OT_INTEGER: tname = "integer"; break;
                            case OT_FLOAT: tname = "float"; break;
                            case OT_BOOL: tname = "bool"; break;
                            case OT_STRING: tname = "string"; break;
                            case OT_TABLE: tname = "table"; break;
                            case OT_ARRAY: tname = "array"; break;
                            case OT_INSTANCE: tname = "instance"; break;
                            case OT_CLASS: tname = "class"; break;
                            default: tname = "value"; break;
                        }
                        g_snprintf(msg, sizeof(msg),
                            "sqgi: argument '%s' expects a callback "
                            "(closure), got %s",
                            g_base_info_get_name((GIBaseInfo *)arg_info),
                            tname);
                        g_base_info_unref(iface);
                        g_base_info_unref(type_info);
                        g_base_info_unref(arg_info);
                        sqgi_gi_free_in_arg_allocs(callable, in_args, arg_to_in, n_args);
                        g_free(in_args);
                        g_free(out_args);
                        sqgi_free_caller_allocated_out(caller_allocated_out, n_out_args);
                        g_free(out_storage);
                        g_free(caller_allocated_out);
                        g_free(owned_out_gtypes);
                        g_free(arg_to_in);
                        g_free(arg_to_out);
                        g_free(user_visible);
                        g_free(arg_sq_idx);
                        for (guint bi = 0; bi < callback_bindings->len; bi++) {
                            SqgiCallbackBinding *b = g_ptr_array_index(callback_bindings, bi);
                            sqgi_callback_destroy_notify(b->cb_data);
                            g_free(b);
                        }
                        g_ptr_array_free(callback_bindings, TRUE);
                        return sq_throwerror(v, msg);
                    }
                }
                g_base_info_unref(iface);
            }

            if (!handled) {
                if (sq_idx > sq_nargs) {
                    /* Missing arg: for some boxed/struct APIs metadata omits
                     * GI_FUNCTION_IS_METHOD but still expects receiver as first arg. */
                    if (!is_method && i == 0 && sq_gettype(v, 1) == OT_INSTANCE) {
                        SQUserPointer receiver_ptr = NULL;
                        if (SQ_SUCCEEDED(sq_getinstanceup(v, 1, &receiver_ptr, NULL, SQFalse)) && receiver_ptr) {
                            in_args[in_idx].v_pointer = receiver_ptr;
                        } else {
                            memset(&in_args[in_idx], 0, sizeof(GIArgument));
                        }
                    } else {
                        memset(&in_args[in_idx], 0, sizeof(GIArgument));
                    }
                } else {
                    /* Nullability: GI marks args that are nullable with
                     * (allow-none)/(nullable). Passing Squirrel null to a
                     * non-nullable slot would let NULL leak into GLib and
                     * trip an assertion (e.g. g_markup_escape_text). Reject
                     * loudly at the boundary instead. */
                    if (sq_gettype(v, sq_idx) == OT_NULL &&
                        !g_arg_info_may_be_null(arg_info) &&
                        g_type_info_get_tag(type_info) != GI_TYPE_TAG_ARRAY &&
                        user_visible[i])
                    {
                        /* Arrays are exempt: a NULL + length=0 is a
                         * conventional "empty argv" pattern that the
                         * marshaller handles below. */
                        char msg[256];
                        g_snprintf(msg, sizeof(msg),
                            "sqgi: argument '%s' is not nullable",
                            g_base_info_get_name((GIBaseInfo *)arg_info));
                        g_base_info_unref(type_info);
                        g_base_info_unref(arg_info);
                        sqgi_gi_free_in_arg_allocs(callable, in_args, arg_to_in, n_args);
                        g_free(in_args);
                        g_free(out_args);
                        sqgi_free_caller_allocated_out(caller_allocated_out, n_out_args);
                        g_free(out_storage);
                        g_free(caller_allocated_out);
                        g_free(owned_out_gtypes);
                        g_free(arg_to_in);
                        g_free(arg_to_out);
                        g_free(user_visible);
                        g_free(arg_sq_idx);
                        for (guint bi = 0; bi < callback_bindings->len; bi++) {
                            SqgiCallbackBinding *b = g_ptr_array_index(callback_bindings, bi);
                            sqgi_callback_destroy_notify(b->cb_data);
                            g_free(b);
                        }
                        g_ptr_array_free(callback_bindings, TRUE);
                        return sq_throwerror(v, msg);
                    }
                    if (SQ_FAILED(sqgi_get_gi_argument(v, sq_idx, &in_args[in_idx], type_info))) {
                        g_base_info_unref(type_info);
                        g_base_info_unref(arg_info);
                        sqgi_gi_free_in_arg_allocs(callable, in_args, arg_to_in, n_args);
                        g_free(in_args);
                        g_free(out_args);
                        sqgi_free_caller_allocated_out(caller_allocated_out, n_out_args);
                        g_free(out_storage);
                        g_free(caller_allocated_out);
                        g_free(owned_out_gtypes);
                        g_free(arg_to_in);
                        g_free(arg_to_out);
                        g_free(user_visible);
                        g_free(arg_sq_idx);
                        for (guint bi = 0; bi < callback_bindings->len; bi++) {
                            SqgiCallbackBinding *b = g_ptr_array_index(callback_bindings, bi);
                            sqgi_callback_destroy_notify(b->cb_data);
                            g_free(b);
                        }
                        g_ptr_array_free(callback_bindings, TRUE);
                        return SQ_ERROR;
                    }
                }
            }
            in_idx++;
        }

        g_base_info_unref(type_info);
        g_base_info_unref(arg_info);
    }

    /* Auto-fill array length in-args from the actual array size when the
     * caller passed a Squirrel string/array/GBytes for the corresponding
     * array param. This mirrors PyGObject convention so callers can write
     *   stream.write_all("hello", null)
     * without manually computing the length. */
    for (gint i = 0; i < n_args; i++) {
        GIArgInfo  *ai  = g_callable_info_get_arg(callable, i);
        GITypeInfo *ati = g_arg_info_get_type(ai);
        if (g_type_info_get_tag(ati) == GI_TYPE_TAG_ARRAY &&
            g_type_info_get_array_type(ati) == GI_ARRAY_TYPE_C) {
            gint len_arg_idx = g_type_info_get_array_length(ati);
            if (len_arg_idx >= 0 && len_arg_idx < n_args &&
                arg_to_in[i] >= 0 && arg_to_in[len_arg_idx] >= 0 &&
                arg_sq_idx[i] >= 0) {
                SQInteger sq_idx = arg_sq_idx[i];
                SQInteger slen = -1;
                if (sq_idx <= sq_nargs) {
                    SQObjectType st = sq_gettype(v, sq_idx);
                    if (st == OT_STRING || st == OT_ARRAY) {
                        slen = sq_getsize(v, sq_idx);
                    } else if (st == OT_INSTANCE) {
                        /* GBytes-like instance: use g_bytes_get_size if it
                         * happens to be a GBytes; otherwise leave the
                         * explicit length the caller provided alone. */
                        SQUserPointer p = NULL;
                        if (SQ_SUCCEEDED(sq_getinstanceup(v, sq_idx, &p, NULL, SQFalse)) && p) {
                            /* Best-effort: only treat as GBytes when the
                             * element type is byte-sized; safer than poking
                             * arbitrary boxed instances. */
                            GITypeInfo *elem = g_type_info_get_param_type(ati, 0);
                            GITypeTag et = g_type_info_get_tag(elem);
                            if (et == GI_TYPE_TAG_UINT8 || et == GI_TYPE_TAG_INT8) {
                                gsize n = 0;
                                (void)g_bytes_get_data((GBytes *)p, &n);
                                slen = (SQInteger)n;
                            }
                            g_base_info_unref(elem);
                        }
                    }
                }
                if (slen >= 0) {
                    gint lp = arg_to_in[len_arg_idx];
                    GIArgInfo  *lai = g_callable_info_get_arg(callable, len_arg_idx);
                    GITypeInfo *lti = g_arg_info_get_type(lai);
                    GITypeTag ltag = g_type_info_get_tag(lti);
                    switch (ltag) {
                    case GI_TYPE_TAG_INT8:   in_args[lp].v_int8   = (gint8)slen;   break;
                    case GI_TYPE_TAG_UINT8:  in_args[lp].v_uint8  = (guint8)slen;  break;
                    case GI_TYPE_TAG_INT16:  in_args[lp].v_int16  = (gint16)slen;  break;
                    case GI_TYPE_TAG_UINT16: in_args[lp].v_uint16 = (guint16)slen; break;
                    case GI_TYPE_TAG_INT32:  in_args[lp].v_int32  = (gint32)slen;  break;
                    case GI_TYPE_TAG_UINT32: in_args[lp].v_uint32 = (guint32)slen; break;
                    case GI_TYPE_TAG_INT64:  in_args[lp].v_int64  = (gint64)slen;  break;
                    case GI_TYPE_TAG_UINT64: in_args[lp].v_uint64 = (guint64)slen; break;
                    default: break;
                    }
                    g_base_info_unref(lti);
                    g_base_info_unref(lai);
                }
            }
        }
        g_base_info_unref(ati);
        g_base_info_unref(ai);
    }

    for (guint bi = 0; bi < callback_bindings->len; bi++) {
        SqgiCallbackBinding *b = g_ptr_array_index(callback_bindings, bi);
        if (b->closure_index >= 0 && b->closure_index < n_args) {
            gint pos = arg_to_in[b->closure_index];
            if (pos >= 0) in_args[pos].v_pointer = b->cb_data;
        }
        if (b->destroy_index >= 0 && b->destroy_index < n_args) {
            gint pos = arg_to_in[b->destroy_index];
            if (pos >= 0) in_args[pos].v_pointer = (gpointer)sqgi_callback_destroy_notify;
        }
    }

    sqgi_gi_ref_transfer_full_object_inputs(callable, in_args, arg_to_in, n_args);

    /* Invoke */
    GError *error = NULL;
    gboolean ok = g_function_info_invoke(info, in_args, total_in,
                                         out_args, n_out_args,
                                         &return_arg, &error);
    (void)throws;

    if (!ok) {
        sqgi_gi_free_in_arg_allocs(callable, in_args, arg_to_in, n_args);
        for (guint bi = 0; bi < callback_bindings->len; bi++) {
            SqgiCallbackBinding *b = g_ptr_array_index(callback_bindings, bi);
            sqgi_callback_destroy_notify(b->cb_data);
            g_free(b);
        }
        g_ptr_array_free(callback_bindings, TRUE);
        g_free(in_args);
        g_free(out_args);
        sqgi_free_caller_allocated_out(caller_allocated_out, n_out_args);
        g_free(out_storage);
        g_free(caller_allocated_out);
        g_free(owned_out_gtypes);
        g_free(arg_to_in);
        g_free(arg_to_out);
        g_free(user_visible);
        g_free(arg_sq_idx);
        SQRESULT res = sqgi_gerror_throw(v, error, "unknown GI invocation error");
        return res;
    }

    for (gint i = 0; i < n_args; i++) {
        gint out_pos = arg_to_out[i];
        if (out_pos < 0 || !caller_allocated_out[out_pos]) continue;

        GIArgInfo *ai = g_callable_info_get_arg(callable, i);
        GITypeInfo *ti = g_arg_info_get_type(ai);
        if (g_type_info_get_tag(ti) == GI_TYPE_TAG_INTERFACE) {
            GIBaseInfo *iface = g_type_info_get_interface(ti);
            GType gtype = g_registered_type_info_get_g_type((GIRegisteredTypeInfo *)iface);
            if (gtype != G_TYPE_INVALID && gtype != G_TYPE_NONE &&
                g_type_is_a(gtype, G_TYPE_BOXED)) {
                gpointer boxed = g_boxed_copy(gtype, caller_allocated_out[out_pos]);
                g_free(caller_allocated_out[out_pos]);
                caller_allocated_out[out_pos] = NULL;
                out_storage[out_pos].v_pointer = boxed;
                owned_out_gtypes[out_pos] = gtype;
            } else {
                /* Keep the caller-allocated record alive for the wrapper.
                 * Plain non-boxed records have no generic destroy hook. */
                caller_allocated_out[out_pos] = NULL;
            }
            g_base_info_unref(iface);
        }
        g_base_info_unref(ti);
        g_base_info_unref(ai);
    }

    /* Marshal return value */
    GITypeInfo *ret_type = g_callable_info_get_return_type(callable);
    GITransfer  ret_transfer = g_callable_info_get_caller_owns(callable);

    gboolean pushed_return = FALSE;
    GITypeTag ret_tag = g_type_info_get_tag(ret_type);

    /* NULL byte-array return (e.g. read_line_finish at EOF) → Squirrel null,
     * not an empty array. The default ARRAY push path would call
     * sq_newarray(v, 0) which masquerades EOF as an empty result. */
    if (ret_tag == GI_TYPE_TAG_ARRAY && !return_arg.v_pointer) {
        GITypeInfo *elem_type = g_type_info_get_param_type(ret_type, 0);
        GITypeTag elem_tag = g_type_info_get_tag(elem_type);
        if (elem_tag == GI_TYPE_TAG_UINT8 || elem_tag == GI_TYPE_TAG_INT8) {
            sq_pushnull(v);
            pushed_return = TRUE;
        }
        g_base_info_unref(elem_type);
    }

    /* Special-case: byte arrays returned with an out-length argument (e.g. GBytes.get_data).
     * Convert them into Squirrel strings so scripts can write/download binary payloads. */
    if (!pushed_return && ret_tag == GI_TYPE_TAG_ARRAY && return_arg.v_pointer) {
        GITypeInfo *elem_type = g_type_info_get_param_type(ret_type, 0);
        GITypeTag elem_tag = g_type_info_get_tag(elem_type);
        gint len_arg_idx = g_type_info_get_array_length(ret_type);
        gssize len = -1;

        if (len_arg_idx >= 0 && len_arg_idx < n_args) {
            gint out_pos = arg_to_out[len_arg_idx];
            if (out_pos >= 0 && out_pos < n_out_args) {
                GIArgInfo *len_arg_info = g_callable_info_get_arg(callable, len_arg_idx);
                GITypeInfo *len_arg_type = g_arg_info_get_type(len_arg_info);
                len = sqgi_gi_argument_to_length(&out_storage[out_pos], len_arg_type);
                g_base_info_unref(len_arg_type);
                g_base_info_unref(len_arg_info);
            }
        }

        if (len <= 0) {
            const char *fn_name = g_base_info_get_name((GIBaseInfo *)info);
            GIBaseInfo *container = g_base_info_get_container((GIBaseInfo *)info);
            const char *container_name = container ? g_base_info_get_name(container) : NULL;
            const char *container_ns = container ? g_base_info_get_namespace(container) : NULL;
            if (fn_name && container_name && container_ns &&
                strcmp(fn_name, "get_data") == 0 &&
                strcmp(container_name, "Bytes") == 0 &&
                strcmp(container_ns, "GLib") == 0) {
                SQUserPointer receiver_ptr = NULL;
                if (SQ_SUCCEEDED(sq_getinstanceup(v, 1, &receiver_ptr, NULL, SQFalse)) && receiver_ptr) {
                    len = (gssize)g_bytes_get_size((GBytes *)receiver_ptr);
                }
            }
        }

        /* Zero-terminated guint8* return (e.g. read_line_finish): no length
         * arg, just walk until NUL. The default array-push path treats this
         * as a pointer array, which corrupts the data. */
        if (len < 0 && g_type_info_is_zero_terminated(ret_type) &&
            (elem_tag == GI_TYPE_TAG_UINT8 || elem_tag == GI_TYPE_TAG_INT8)) {
            len = (gssize)strlen((const char *)return_arg.v_pointer);
        }

        if (len >= 0 && (elem_tag == GI_TYPE_TAG_UINT8 || elem_tag == GI_TYPE_TAG_INT8)) {
            sq_pushstring(v, (const SQChar *)return_arg.v_pointer, (SQInteger)len);
            pushed_return = TRUE;
            /* Release the GLib-allocated buffer if the callee transferred it
             * (e.g. g_base64_decode returns a guint8* with transfer-full). */
            if (ret_transfer == GI_TRANSFER_EVERYTHING) {
                g_free(return_arg.v_pointer);
                return_arg.v_pointer = NULL;
            }
        }

        g_base_info_unref(elem_type);
    }

    if (!pushed_return) {
        if (is_constructor && return_arg.v_pointer) {
            GITypeTag rtag = g_type_info_get_tag(ret_type);
            if (rtag == GI_TYPE_TAG_INTERFACE) {
                GIBaseInfo *iface = g_type_info_get_interface(ret_type);
                GIInfoType itype = g_base_info_get_type(iface);
                if (itype == GI_INFO_TYPE_OBJECT || itype == GI_INFO_TYPE_INTERFACE) {
                    /* Route through the shared marshaller so floating refs
                     * are sunk and the transferred ref is consumed exactly
                     * once. The previous bespoke path here ref-sank the
                     * float but never released the constructor's own ref,
                     * leaking 1 strong ref per construction. */
                    sqgi_push_gi_argument(v, &return_arg, ret_type, ret_transfer);
                } else {
                    /* Boxed/struct/union constructor: install a release
                     * hook based on the GType so refcounted records
                     * (GVariant / GBytes / generic G_TYPE_BOXED) are
                     * freed when their Squirrel wrapper is GC'd. */
                    sqgi_push_constructor_record(v, iface, return_arg.v_pointer, ret_transfer);
                }
                g_base_info_unref(iface);
            } else {
                sqgi_push_gi_argument(v, &return_arg, ret_type, ret_transfer);
            }
        } else {
            sqgi_push_gi_argument(v, &return_arg, ret_type, ret_transfer);
        }
    }

    /* Squirrel native calls only surface the topmost stack value as the
     * return. So we adapt multi-value semantics into a single result:
     *  - If return is void/bool AND there is at least one user-visible
     *    out-arg, we drop the return value and push the out-arg(s) instead.
     *  - If exactly one user-visible out-arg results, return it directly.
     *  - If multiple, pack them into an array (with the original return
     *    value prepended unless it was void/bool).
     * Array-length args (for the return value or any out-arg array) are
     * skipped — they are only metadata. */
    gint ret_array_len_arg = g_type_info_get_array_length(ret_type);
    gint *skip_as_length = g_new0(gint, n_args > 0 ? n_args : 1);
    for (gint i = 0; i < n_args; i++) skip_as_length[i] = 0;
    if (ret_array_len_arg >= 0 && ret_array_len_arg < n_args)
        skip_as_length[ret_array_len_arg] = 1;
    for (gint i = 0; i < n_args; i++) {
        GIArgInfo  *ai  = g_callable_info_get_arg(callable, i);
        GIDirection dir = g_arg_info_get_direction(ai);
        if (dir == GI_DIRECTION_OUT || dir == GI_DIRECTION_INOUT) {
            GITypeInfo *ati = g_arg_info_get_type(ai);
            if (g_type_info_get_tag(ati) == GI_TYPE_TAG_ARRAY) {
                gint la = g_type_info_get_array_length(ati);
                if (la >= 0 && la < n_args) skip_as_length[la] = 1;
            }
            g_base_info_unref(ati);
        }
        g_base_info_unref(ai);
    }

    /* Heuristic: for utf8/filename return types with a single integer out-arg
     * named "length" or "len" (or any int-typed out-arg if there is exactly
     * one), treat that out-arg as length metadata and hide it from callers. */
    gboolean ret_is_byte_array = FALSE;
    if (ret_tag == GI_TYPE_TAG_ARRAY) {
        GITypeInfo *ret_elem = g_type_info_get_param_type(ret_type, 0);
        GITypeTag ret_elem_tag = g_type_info_get_tag(ret_elem);
        ret_is_byte_array = (ret_elem_tag == GI_TYPE_TAG_UINT8 ||
                             ret_elem_tag == GI_TYPE_TAG_INT8);
        g_base_info_unref(ret_elem);
    }
    if (ret_tag == GI_TYPE_TAG_UTF8 || ret_tag == GI_TYPE_TAG_FILENAME ||
        ret_is_byte_array) {
        gint int_out_count = 0;
        gint int_out_idx = -1;
        for (gint i = 0; i < n_args; i++) {
            if (skip_as_length[i]) continue;
            GIArgInfo  *ai  = g_callable_info_get_arg(callable, i);
            GIDirection dir = g_arg_info_get_direction(ai);
            if (dir == GI_DIRECTION_OUT || dir == GI_DIRECTION_INOUT) {
                GITypeInfo *ati = g_arg_info_get_type(ai);
                GITypeTag at = g_type_info_get_tag(ati);
                gboolean is_int =
                    at == GI_TYPE_TAG_INT8  || at == GI_TYPE_TAG_UINT8 ||
                    at == GI_TYPE_TAG_INT16 || at == GI_TYPE_TAG_UINT16 ||
                    at == GI_TYPE_TAG_INT32 || at == GI_TYPE_TAG_UINT32 ||
                    at == GI_TYPE_TAG_INT64 || at == GI_TYPE_TAG_UINT64;
                if (is_int) {
                    int_out_count++;
                    int_out_idx = i;
                }
                g_base_info_unref(ati);
            }
            g_base_info_unref(ai);
        }
        if (int_out_count == 1 && int_out_idx >= 0)
            skip_as_length[int_out_idx] = 1;
    }

    /* Count user-visible out-args */
    gint visible_out_args = 0;
    for (gint i = 0; i < n_args; i++) {
        GIArgInfo  *ai  = g_callable_info_get_arg(callable, i);
        GIDirection dir = g_arg_info_get_direction(ai);
        if ((dir == GI_DIRECTION_OUT || dir == GI_DIRECTION_INOUT) && !skip_as_length[i])
            visible_out_args++;
        g_base_info_unref(ai);
    }

    gboolean drop_return =
        visible_out_args > 0 &&
        (ret_tag == GI_TYPE_TAG_VOID || ret_tag == GI_TYPE_TAG_BOOLEAN);

    SQInteger n_returned;
    if (drop_return) {
        /* Replace the pushed return with the first out-arg, then push the rest;
         * if 1 out-arg → single value, else build an array. */
        sq_poptop(v); /* discard return value we previously pushed */
        if (visible_out_args == 1) {
            for (gint i = 0; i < n_args; i++) {
                GIArgInfo  *ai  = g_callable_info_get_arg(callable, i);
                GIDirection dir = g_arg_info_get_direction(ai);
                if ((dir == GI_DIRECTION_OUT || dir == GI_DIRECTION_INOUT) && !skip_as_length[i]) {
                    GITypeInfo *ati = g_arg_info_get_type(ai);
                    GITransfer  atransfer = g_arg_info_get_ownership_transfer(ai);
                    sqgi_push_out_arg(v, callable, i, ati, atransfer,
                                      out_storage, arg_to_out, n_args,
                                      owned_out_gtypes);
                    g_base_info_unref(ati);
                    g_base_info_unref(ai);
                    break;
                }
                g_base_info_unref(ai);
            }
            n_returned = 1;
        } else {
            sq_newarray(v, 0);
            for (gint i = 0; i < n_args; i++) {
                GIArgInfo  *ai  = g_callable_info_get_arg(callable, i);
                GIDirection dir = g_arg_info_get_direction(ai);
                if ((dir == GI_DIRECTION_OUT || dir == GI_DIRECTION_INOUT) && !skip_as_length[i]) {
                    GITypeInfo *ati = g_arg_info_get_type(ai);
                    GITransfer  atransfer = g_arg_info_get_ownership_transfer(ai);
                    sqgi_push_out_arg(v, callable, i, ati, atransfer,
                                      out_storage, arg_to_out, n_args,
                                      owned_out_gtypes);
                    sq_arrayappend(v, -2);
                    g_base_info_unref(ati);
                }
                g_base_info_unref(ai);
            }
            n_returned = 1;
        }
    } else if (visible_out_args > 0) {
        /* Keep return value and prepend it to an array of out-args */
        /* Take the return value already on top, build an array containing it
         * plus all out-args, replace top with array. */
        sq_newarray(v, 0);
        sq_push(v, -2);       /* push the return value */
        sq_arrayappend(v, -2);
        for (gint i = 0; i < n_args; i++) {
            GIArgInfo  *ai  = g_callable_info_get_arg(callable, i);
            GIDirection dir = g_arg_info_get_direction(ai);
            if ((dir == GI_DIRECTION_OUT || dir == GI_DIRECTION_INOUT) && !skip_as_length[i]) {
                GITypeInfo *ati = g_arg_info_get_type(ai);
                GITransfer  atransfer = g_arg_info_get_ownership_transfer(ai);
                sqgi_push_out_arg(v, callable, i, ati, atransfer,
                                  out_storage, arg_to_out, n_args,
                                  owned_out_gtypes);
                sq_arrayappend(v, -2);
                g_base_info_unref(ati);
            }
            g_base_info_unref(ai);
        }
        sq_remove(v, -2); /* remove original return value */
        n_returned = 1;
    } else {
        n_returned = 1;
    }
    g_free(skip_as_length);
    g_free(user_visible);
    g_free(arg_sq_idx);

    for (guint bi = 0; bi < callback_bindings->len; bi++) {
        SqgiCallbackBinding *b = g_ptr_array_index(callback_bindings, bi);
        if (b->scope == GI_SCOPE_TYPE_CALL) {
            sqgi_callback_destroy_notify(b->cb_data);
        }
        g_free(b);
    }
    g_ptr_array_free(callback_bindings, TRUE);

    sqgi_gi_free_in_arg_allocs(callable, in_args, arg_to_in, n_args);
    g_free(in_args);
    g_free(out_args);
    sqgi_free_caller_allocated_out(caller_allocated_out, n_out_args);
    g_free(out_storage);
    g_free(caller_allocated_out);
    g_free(owned_out_gtypes);
    g_free(arg_to_in);
    g_free(arg_to_out);

    g_base_info_unref(ret_type);
    return n_returned;
}

/* ── Public: wrap a GI function as a closure ─────────────────────────────── */

void sqgi_gi_wrap_function(HSQUIRRELVM v, GIFunctionInfo *info)
{
    /* Allocate userdata to hold the GIFunctionInfo* with a release hook */
    SqgiFuncData *d = (SqgiFuncData *)sq_newuserdata(v, sizeof(SqgiFuncData));
    d->info = (GIFunctionInfo *)g_base_info_ref((GIBaseInfo *)info);
    sq_setreleasehook(v, -1, sqgi_func_data_release);

    /* Create closure capturing the userdata as its one free variable */
    sq_newclosure(v, gi_function_call, 1);

    const char *sym = g_base_info_get_name((GIBaseInfo *)info);
    if (sym) sq_setnativeclosurename(v, -1, sym);
}

/* ── Public: build enum/flags table ─────────────────────────────────────────*/

void sqgi_gi_push_enum_table(HSQUIRRELVM v, GIEnumInfo *info)
{
    sq_newtable(v);
    gint n = g_enum_info_get_n_values(info);
    for (gint i = 0; i < n; i++) {
        GIValueInfo *vinfo = g_enum_info_get_value(info, i);
        const char *name = g_base_info_get_name((GIBaseInfo *)vinfo);
        gint64 val = g_value_info_get_value(vinfo);

        sq_pushstring(v, name, -1);
        sq_pushinteger(v, (SQInteger)val);
        sq_rawset(v, -3);

        g_base_info_unref(vinfo);
    }
}

/* ── Namespace loader ────────────────────────────────────────────────────── */

SQRESULT sqgi_gi_load_namespace(HSQUIRRELVM v, const char *namespace_name,
                                const char *version)
{
    SQGI_STACK_CHECK_BEGIN(v);
    GError *error = NULL;
    GIRepository *repo = g_irepository_get_default();

    /* Check if already loaded — if root table already has this key, return.
     * sq_get pops the key on both success and failure; on success it pushes
     * the value, on failure it pushes nothing. */
    sq_pushroottable(v);
    sq_pushstring(v, namespace_name, -1);
    if (SQ_SUCCEEDED(sq_get(v, -2))) {
        /* Already loaded; leave it on stack as return value */
        sq_remove(v, -2); /* remove root table */
        SQGI_STACK_CHECK_END(v, 1);
        return SQ_OK;
    }
    sq_pop(v, 1); /* pop root table */

    GITypelib *typelib = g_irepository_require(repo, namespace_name, version,
                                               (GIRepositoryLoadFlags)0, &error);
    if (!typelib) {
        SQRESULT res = sqgi_gerror_throw(v, error,
                                        "unknown error loading namespace");
        SQGI_STACK_CHECK_END(v, 0);
        return res;
    }

    /* Preload immediate dependencies first so parent classes across
     * namespaces (e.g. Gtk.Application -> Gio.Application) are registered
     * before class construction in this namespace. */
    gchar **deps = g_irepository_get_immediate_dependencies(repo, namespace_name);
    if (deps) {
        for (gint di = 0; deps[di] != NULL; di++) {
            const char *dep = deps[di];
            const char *dash = strrchr(dep, '-');
            char dep_ns[128] = {0};
            const char *dep_ver = NULL;

            if (dash && dash > dep) {
                gsize ns_len = (gsize)(dash - dep);
                if (ns_len >= sizeof(dep_ns)) ns_len = sizeof(dep_ns) - 1;
                memcpy(dep_ns, dep, ns_len);
                dep_ns[ns_len] = '\0';
                dep_ver = dash + 1;
            } else {
                snprintf(dep_ns, sizeof(dep_ns), "%s", dep);
            }

            if (dep_ns[0] != '\0') {
                SQInteger top_before = sq_gettop(v);
                SQRESULT dep_res = sqgi_gi_load_namespace(v, dep_ns, dep_ver);
                sq_settop(v, top_before);
                if (SQ_FAILED(dep_res)) {
                    g_strfreev(deps);
                    SQGI_STACK_CHECK_END(v, 0);
                    return dep_res;
                }
            }
        }
        g_strfreev(deps);
    }

    /* Build namespace table */
    sq_newtable(v); /* ns_table */

    gint n = g_irepository_get_n_infos(repo, namespace_name);
    for (gint i = 0; i < n; i++) {
        GIBaseInfo *info = g_irepository_get_info(repo, namespace_name, i);
        if (!info) {
            if (sqgi_trace_gi_import_enabled()) {
                fprintf(stderr, "[sqgi] skipping null GI info ns=%s i=%d\n",
                        sqgi_safe_str(namespace_name), (int)i);
                fflush(stderr);
            }
            continue;
        }

        GIInfoType type = g_base_info_get_type(info);
        const char *name = g_base_info_get_name(info);

        sqgi_trace_gi_import(namespace_name, i, type, name);

        if (!name || name[0] == '\0') {
            if (sqgi_trace_gi_import_enabled()) {
                fprintf(stderr, "[sqgi] skipping unnamed GI info ns=%s i=%d type=%d\n",
                        sqgi_safe_str(namespace_name), (int)i, (int)type);
                fflush(stderr);
            }
            g_base_info_unref(info);
            continue;
        }

        switch (type) {
        case GI_INFO_TYPE_FUNCTION:
            sq_pushstring(v, name, -1);
            sqgi_gi_wrap_function(v, (GIFunctionInfo *)info);
            sq_rawset(v, -3);
            break;

        case GI_INFO_TYPE_OBJECT:
            if (sqgi_trace_gi_import_enabled()) {
                const char *type_name =
                    g_registered_type_info_get_type_name((GIRegisteredTypeInfo *)info);
                fprintf(stderr, "[sqgi] build object class ns=%s name=%s gtype=%s\n",
                        sqgi_safe_str(namespace_name), sqgi_safe_str(name),
                        sqgi_safe_str(type_name));
                fflush(stderr);
            }
            sq_pushstring(v, name, -1);
            sqgi_gi_object_build_class(v, (GIObjectInfo *)info);
            sq_rawset(v, -3);
            break;

        case GI_INFO_TYPE_INTERFACE:
            if (sqgi_trace_gi_import_enabled()) {
                const char *type_name =
                    g_registered_type_info_get_type_name((GIRegisteredTypeInfo *)info);
                fprintf(stderr, "[sqgi] build interface class ns=%s name=%s gtype=%s\n",
                        sqgi_safe_str(namespace_name), sqgi_safe_str(name),
                        sqgi_safe_str(type_name));
                fflush(stderr);
            }
            sq_pushstring(v, name, -1);
            sqgi_gi_object_build_interface_class(v, (GIInterfaceInfo *)info);
            sq_rawset(v, -3);
            break;

        case GI_INFO_TYPE_ENUM:
        case GI_INFO_TYPE_FLAGS:
            sq_pushstring(v, name, -1);
            sqgi_gi_push_enum_table(v, (GIEnumInfo *)info);
            sq_rawset(v, -3);
            break;

        case GI_INFO_TYPE_CONSTANT: {
            GIArgument cval;
            GITypeInfo *ctype = g_constant_info_get_type((GIConstantInfo *)info);
            g_constant_info_get_value((GIConstantInfo *)info, &cval);
            sq_pushstring(v, name, -1);
            sqgi_push_gi_argument(v, &cval, ctype, GI_TRANSFER_NOTHING);
            sq_rawset(v, -3);
            /* The constant value memory (typically a heap-duped string) is
             * owned by GLib's GI machinery via g_memdup2 — release it here
             * since sqgi_push_gi_argument copied/converted whatever it
             * needed. */
            g_constant_info_free_value((GIConstantInfo *)info, &cval);
            g_base_info_unref(ctype);
            break;
        }

        case GI_INFO_TYPE_STRUCT:
            sq_pushstring(v, name, -1);
            /* Foreign records (e.g. cairo_t, cairo_surface_t) have no
             * GI-marshallable layout; build the class through their native
             * binding when one is registered. */
            if (g_struct_info_is_foreign((GIStructInfo *)info)) {
                char fkey[256];
                snprintf(fkey, sizeof(fkey), "%s.%s",
                         sqgi_safe_str(g_base_info_get_namespace(info)), name);
                if (SQ_SUCCEEDED(sqgi_gi_object_lookup_class(v, fkey))) {
                    sq_rawset(v, -3);
                    break;
                }
            }
            sqgi_gi_object_build_struct_class(v, (GIStructInfo *)info);
            sq_rawset(v, -3);
            break;

        case GI_INFO_TYPE_UNION:
            /* Do not feed GIUnionInfo into the struct builder. Some GLib
             * records, notably GLib.Mutex on Windows/MSYS2, are exposed as
             * unions. Treating them as GIStructInfo corrupts the GI access
             * path and can crash during import. Proper union wrapping can be
             * added later; for now, skip these low-level C ABI records. */
            if (sqgi_trace_gi_import_enabled()) {
                fprintf(stderr, "[sqgi] skipping union ns=%s name=%s\n",
                        sqgi_safe_str(namespace_name), sqgi_safe_str(name));
                fflush(stderr);
            }
            break;

        default:
            break;
        }

        g_base_info_unref(info);
    }

    /* Per-namespace overlays: splice native bindings into the GI table for
     * libraries whose GIR declares its records as `foreign` (cairo). */
    if (strcmp(namespace_name, "cairo") == 0) {
        sqgi_cairo_overlay_namespace(v);
    }

    /* Register namespace table in root table */
    sq_pushroottable(v);
    sq_pushstring(v, namespace_name, -1);
    sq_push(v, -3);     /* push ns_table again */
    sq_rawset(v, -3);   /* root[namespace_name] = ns_table */
    sq_pop(v, 1);       /* pop root table */

    /* ns_table is still on top as return value */
    SQGI_STACK_CHECK_END(v, 1);
    return SQ_OK;
}
