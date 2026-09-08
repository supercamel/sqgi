#include "sqgi_gi_call_plan.h"

static gboolean is_input(GIDirection d) { return d == GI_DIRECTION_IN || d == GI_DIRECTION_INOUT; }
static gboolean is_output(GIDirection d) { return d == GI_DIRECTION_OUT || d == GI_DIRECTION_INOUT; }

SqgiCallPlan *sqgi_call_plan_new(GIFunctionInfo *info)
{
    GICallableInfo *callable = (GICallableInfo *)info;
    SqgiCallPlan *p = g_new0(SqgiCallPlan, 1);
    p->n_args = g_callable_info_get_n_args(callable);
    p->flags = g_function_info_get_flags(info);
    p->return_type = g_callable_info_get_return_type(callable);
    p->return_transfer = g_callable_info_get_caller_owns(callable);
    gint count = MAX(p->n_args, 1);
    p->args = g_new0(SqgiCallArg, count);
    p->visible = g_new0(gboolean, count);
    p->compact_slots = g_new(gint, count);
    p->legacy_slots = g_new(gint, count);
    p->skip_length = g_new0(gint, count);
    for(gint i=0; i<p->n_args; ++i) {
        SqgiCallArg *a = &p->args[i];
        a->info = g_callable_info_get_arg(callable, i);
        a->type = g_arg_info_get_type(a->info);
        a->direction = g_arg_info_get_direction(a->info);
        p->visible[i] = is_input(a->direction);
        p->n_in += is_input(a->direction);
        p->n_out += is_output(a->direction);
    }
    for(gint i=0; i<p->n_args; ++i) {
        SqgiCallArg *a = &p->args[i];
        GITypeTag tag = g_type_info_get_tag(a->type);
        if(tag == GI_TYPE_TAG_ARRAY) {
            gint length = g_type_info_get_array_length(a->type);
            if(length >= 0 && length < p->n_args) {
                p->visible[length] = FALSE;
                if(is_output(a->direction)) p->skip_length[length] = 1;
            }
        }
        if(tag == GI_TYPE_TAG_INTERFACE) {
            GIBaseInfo *iface = g_type_info_get_interface(a->type);
            if(g_base_info_get_type(iface) == GI_INFO_TYPE_CALLBACK) {
                gint closure = g_arg_info_get_closure(a->info);
                gint destroy = g_arg_info_get_destroy(a->info);
                if(closure >= 0 && closure < p->n_args) p->visible[closure] = FALSE;
                if(destroy >= 0 && destroy < p->n_args) p->visible[destroy] = FALSE;
            }
            g_base_info_unref(iface);
        }
    }
    gint compact = 2, legacy = 2; // Squirrel slot 1 is the receiver.
    for(gint i=0; i<p->n_args; ++i) {
        p->compact_slots[i] = p->visible[i] ? compact++ : -1;
        p->legacy_slots[i] = is_input(p->args[i].direction) ? legacy++ : -1;
        p->n_visible += p->visible[i];
    }
    gint length = g_type_info_get_array_length(p->return_type);
    if(length >= 0 && length < p->n_args) p->skip_length[length] = 1;
    GITypeTag tag = g_type_info_get_tag(p->return_type);
    gboolean bytes = FALSE;
    if(tag == GI_TYPE_TAG_ARRAY) {
        GITypeInfo *element = g_type_info_get_param_type(p->return_type, 0);
        GITypeTag e = g_type_info_get_tag(element);
        bytes = e == GI_TYPE_TAG_INT8 || e == GI_TYPE_TAG_UINT8;
        g_base_info_unref(element);
    }
    // Preserve the existing byte/string return-length convention.
    if(bytes || tag == GI_TYPE_TAG_UTF8 || tag == GI_TYPE_TAG_FILENAME) {
        gint integers = 0, index = -1;
        for(gint i=0; i<p->n_args; ++i) {
            if(p->skip_length[i] || !is_output(p->args[i].direction)) continue;
            GITypeTag t = g_type_info_get_tag(p->args[i].type);
            if(t >= GI_TYPE_TAG_INT8 && t <= GI_TYPE_TAG_UINT64) { ++integers; index = i; }
        }
        if(integers == 1) p->skip_length[index] = 1;
    }
    for(gint i=0; i<p->n_args; ++i)
        p->n_visible_out += is_output(p->args[i].direction) && !p->skip_length[i];
    return p;
}

void sqgi_call_plan_free(SqgiCallPlan *p)
{
    if(!p) return;
    for(gint i=0; i<p->n_args; ++i) {
        g_base_info_unref(p->args[i].type);
        g_base_info_unref(p->args[i].info);
    }
    g_base_info_unref(p->return_type);
    g_free(p->args); g_free(p->visible); g_free(p->compact_slots);
    g_free(p->legacy_slots); g_free(p->skip_length); g_free(p);
}
