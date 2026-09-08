#ifndef SQGI_GI_CALL_PLAN_H
#define SQGI_GI_CALL_PLAN_H
#include <girepository.h>

/* Immutable signature metadata owned by one GI function closure. Argument
 * values and partially marshalled ownership always remain per invocation. */
typedef struct {
    GIArgInfo *info;
    GITypeInfo *type;
    GIDirection direction;
} SqgiCallArg;

typedef struct {
    gint n_args, n_in, n_out, n_visible, n_visible_out;
    GIFunctionInfoFlags flags;
    SqgiCallArg *args;
    GITypeInfo *return_type;
    GITransfer return_transfer;
    gboolean *visible;
    gint *compact_slots, *legacy_slots, *skip_length;
} SqgiCallPlan;

SqgiCallPlan *sqgi_call_plan_new(GIFunctionInfo *info);
void sqgi_call_plan_free(SqgiCallPlan *plan);
#endif
