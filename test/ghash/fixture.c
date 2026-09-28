#include <glib.h>
#include <gmodule.h>

G_MODULE_EXPORT guint hash_fixture_borrow(GHashTable *table) {
    return table ? g_hash_table_size(table) : 999;
}
G_MODULE_EXPORT guint hash_fixture_take(GHashTable *table) {
    guint size = hash_fixture_borrow(table);
    if (table) g_hash_table_unref(table);
    return size;
}
G_MODULE_EXPORT gboolean hash_fixture_enum_zero(GHashTable *table) {
    gpointer value = (gpointer)1;
    return g_hash_table_lookup_extended(table, "zero", NULL, &value) && value == NULL;
}
G_MODULE_EXPORT gboolean hash_fixture_strings(GHashTable *table) {
    return g_strcmp0(g_hash_table_lookup(table, "name"), "café") == 0;
}
G_MODULE_EXPORT void hash_fixture_error(GHashTable *table, GError **error) {
    g_hash_table_unref(table);
    g_set_error_literal(error, g_quark_from_static_string("hash-fixture-error"), 1, "Consumed input");
}
G_MODULE_EXPORT void hash_fixture_later(GHashTable *table, gint number) {
    (void)number;
    g_hash_table_unref(table);
}

static GHashTable *retained;
G_MODULE_EXPORT void hash_fixture_hold(GHashTable *table) {
    g_assert_null(retained);
    retained = table;
}
G_MODULE_EXPORT gboolean hash_fixture_finish(void) {
    gboolean ok = hash_fixture_strings(retained);
    g_clear_pointer(&retained, g_hash_table_unref);
    return ok;
}
