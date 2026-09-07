#include "sqgi_vm.h"
#include "sqgi_gi.h"
#include "sqgi_marshal.h"
#include <gio/gio.h>

static void finalized(gpointer data, GObject *object)
{
    (void)object;
    (*(guint *)data)++;
}

int main(void)
{
    HSQUIRRELVM v = sqgi_vm_new();
    g_assert_cmpint(sqgi_gi_load_namespace(v, "Gio", "2.0"), ==, SQ_OK);
    sq_pop(v, 1);
    GIBaseInfo *info = g_irepository_find_by_name(g_irepository_get_default(),
                                                "Gio", "FileEnumerator");
    g_assert_nonnull(info);
    GIFunctionInfo *method = g_object_info_find_method((GIObjectInfo *)info,
                                                      "next_files_finish");
    g_assert_nonnull(method);
    GITypeInfo *type = g_callable_info_get_return_type((GICallableInfo *)method);
    g_assert_cmpint(g_type_info_get_tag(type), ==, GI_TYPE_TAG_GLIST);

    for (GITransfer transfer = GI_TRANSFER_NOTHING;
         transfer <= GI_TRANSFER_EVERYTHING; transfer++) {
        guint destroyed = 0;
        GFileInfo *first = g_file_info_new();
        GFileInfo *second = g_file_info_new();
        g_object_weak_ref(G_OBJECT(first), finalized, &destroyed);
        g_object_weak_ref(G_OBJECT(second), finalized, &destroyed);
        GList *list = g_list_append(NULL, first);
        list = g_list_append(list, second);
        GIArgument arg = { .v_pointer = list };
        sqgi_push_gi_argument(v, &arg, type, transfer);
        g_assert_cmpint(sq_getsize(v, -1), ==, 2);
        g_assert_cmpuint(destroyed, ==, 0);
        sq_pop(v, 1);
        sq_collectgarbage(v);
        if (transfer == GI_TRANSFER_EVERYTHING) {
            g_assert_cmpuint(destroyed, ==, 2);
        } else {
            g_assert_cmpuint(destroyed, ==, 0);
            g_object_unref(first);
            g_object_unref(second);
            g_assert_cmpuint(destroyed, ==, 2);
            if (transfer == GI_TRANSFER_NOTHING) g_list_free(list);
        }
    }
    g_base_info_unref(type);
    g_base_info_unref(method);
    g_base_info_unref(info);
    sqgi_vm_free(v);
    return 0;
}
