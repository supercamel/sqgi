#include "sqgi_vm.h"
#include "sqgi_signal.h"
#include <glib.h>
#include <gio/gio.h>
#include <string.h>

static void run(HSQUIRRELVM v, const char *source)
{
    g_assert_cmpint(sqgi_vm_dobuffer(v, source, (SQInteger)strlen(source),
                                   "vm-lifecycle-test"), ==, SQ_OK);
}

int main(int argc, char **argv)
{
    g_assert_cmpint(argc, ==, 2);
    HSQUIRRELVM v = sqgi_vm_new();
    g_assert_nonnull(v);
    if (strcmp(argv[1], "pending") == 0) {
        run(v, "sqgi.sleep(0); sqgi.timeout_add(0, function() { return false });"
               "local t = sqgi.Task(); t.then(function(x) {}); t.resolve(1);"
               "async function f() { await 0; } f();"
               "async function g() { await sqgi.sleep(0); } g();"
               "local GLib = import(\"GLib\");"
               "GLib.idle_add(0, function() { throw \"callback after close\"; });");
        sqgi_vm_free(v);
        while (g_main_context_iteration(NULL, FALSE)) {}
    } else if (strcmp(argv[1], "subclass") == 0) {
        run(v, "local Gio = import(\"Gio\");"
               "async function install() {"
               "  sqgi.register_class({name = \"SqgiLifetimeApplication\","
               "    parent = Gio.Application, overrides = {"
               "      handle_local_options = function(self, options) { return 19; }"
               "    }});"
               "} install(); collectgarbage(); collectgarbage();");
        GType type = g_type_from_name("SqgiLifetimeApplication");
        g_assert_cmpuint(type, !=, G_TYPE_INVALID);
        GApplication *app = g_object_new(type, NULL);
        GVariantDict options;
        g_variant_dict_init(&options, NULL);
        GApplicationClass *klass = G_APPLICATION_GET_CLASS(app);
        g_assert_cmpint(klass->handle_local_options(app, &options), ==, 19);
        sqgi_vm_free(v);
        /* The permanent GType and native instances outlive the VM. The
         * override must fall back to its native parent after shutdown. */
        GApplicationClass *parent = g_type_class_peek_parent(klass);
        gint expected = parent->handle_local_options(app, &options);
        g_assert_cmpint(klass->handle_local_options(app, &options), ==, expected);
        g_variant_dict_clear(&options);
        g_object_unref(app);
    } else {
        GCancellable *survivor = g_cancellable_new();
        const char *callback = "return function() { throw \"old VM callback\"; }";
        g_assert_cmpint(sq_compilebuffer(v, callback, (SQInteger)strlen(callback),
                                       "old-callback", SQTrue), ==, SQ_OK);
        sq_pushroottable(v);
        g_assert_cmpint(sq_call(v, 1, SQTrue, SQTrue), ==, SQ_OK);
        sqgi_signal_connect(v, G_OBJECT(survivor), "cancelled", -1);
        sq_pop(v, 2);
        run(v, "local t = sqgi.Task(); t.resolve(42);");
        sqgi_vm_free(v);
        for (int i = 0; i < 3; i++) {
            v = sqgi_vm_new();
            g_cancellable_cancel(survivor);
            run(v, "local t = sqgi.Task(); t.resolve(42);"
                   "if (t.__result != 42) throw \"wrong task result\";"
                   "local Gio = import(\"Gio\"); local c = Gio.Cancellable.new();"
                   "local fired = 0; c.connect(\"cancelled\", function() { fired++ });"
                   "c.cancel(); if (fired != 1) throw \"new VM signal dropped\";");
            sqgi_vm_free(v);
        }
        g_object_unref(survivor);
    }
    return 0;
}
