#include <sqgi_android_entry.h>
#include <sqgi_vm.h>
#include <gtk/gtk.h>
#include <unistd.h>
#include <string.h>

static const SqgiAndroidEntryContext *context;
static HSQUIRRELVM vm;
static GtkApplication *application;
static GtkWidget *window, *label, *call_button, *quit_button;
static unsigned entries, activations, callbacks, ticks;
static gboolean vm_closed, shutdown_called;
static GThread *entry_thread;

static SQInteger value(void)
{
    SQInteger result = 0;
    if (!vm) return 42 + callbacks;
    sq_pushroottable(vm); sq_pushstring(vm, "entry_value", -1);
    if (SQ_SUCCEEDED(sq_get(vm, -2))) { sq_getinteger(vm, -1, &result); sq_pop(vm, 1); }
    sq_pop(vm, 1);
    return result;
}

static void report(void)
{
    graphene_rect_t call = GRAPHENE_RECT_INIT(0, 0, 0, 0), quit = call;
    double scale = 1.0;
    if (window) {
        if (!gtk_widget_compute_bounds(call_button, window, &call)) call = GRAPHENE_RECT_INIT(0, 0, 0, 0);
        if (!gtk_widget_compute_bounds(quit_button, window, &quit)) quit = GRAPHENE_RECT_INIT(0, 0, 0, 0);
        GdkSurface *surface = gtk_native_get_surface(GTK_NATIVE(window));
        if (surface) scale = gdk_surface_get_scale(surface);
    }
    g_autofree char *path = g_build_filename(context->data_directory, "native-entry.json", NULL);
    g_autofree char *json = g_strdup_printf(
        "{\"pid\":%d,\"entries\":%u,\"activations\":%u,\"callbacks\":%u,\"ticks\":%u,"
        "\"value\":%lld,\"vm_closed\":%s,\"shutdown_called\":%s,\"same_thread\":%s,"
        "\"call\":[%.1f,%.1f],\"quit\":[%.1f,%.1f]}\n",
        getpid(), entries, activations, callbacks, ticks, (long long)value(),
        vm_closed ? "true" : "false", shutdown_called ? "true" : "false",
        g_thread_self() == entry_thread ? "true" : "false",
        (call.origin.x + call.size.width / 2) * scale, (call.origin.y + call.size.height / 2) * scale,
        (quit.origin.x + quit.size.width / 2) * scale, (quit.origin.y + quit.size.height / 2) * scale);
    g_file_set_contents(path, json, -1, NULL);
}

static gboolean tick(gpointer unused) { (void)unused; ticks++; report(); return G_SOURCE_CONTINUE; }
static void call_sqgi(GtkButton *button, gpointer unused)
{
    (void)button; (void)unused;
    const char *script = "entry_value += 1";
    g_assert(SQ_SUCCEEDED(sqgi_vm_dobuffer(vm, script, strlen(script), "native-callback")));
    callbacks++;
    g_autofree char *text = g_strdup_printf("Embedded SQGI returned %lld", (long long)value());
    gtk_label_set_text(GTK_LABEL(label), text); report();
}
static void quit(GtkButton *button, gpointer unused)
{
    (void)button; (void)unused; g_application_quit(G_APPLICATION(application));
}
static void activate(GtkApplication *app, gpointer unused)
{
    (void)unused; activations++;
    if (window) { gtk_window_present(GTK_WINDOW(window)); return; }
    window = gtk_application_window_new(app); gtk_window_set_title(GTK_WINDOW(window), "Native entry + embedded SQGI");
    gtk_window_set_default_size(GTK_WINDOW(window), 420, 700);
    GtkWidget *box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 20);
    gtk_widget_set_margin_top(box, 32); gtk_widget_set_margin_bottom(box, 32);
    gtk_widget_set_margin_start(box, 24); gtk_widget_set_margin_end(box, 24);
    gtk_box_append(GTK_BOX(box), gtk_label_new("Native Android entry · GTK · SQGI C API"));
    label = gtk_label_new("Embedded SQGI returned 42"); gtk_widget_set_vexpand(label, TRUE);
    gtk_box_append(GTK_BOX(box), label);
    call_button = gtk_button_new_with_label("Call embedded SQGI"); gtk_widget_add_css_class(call_button, "suggested-action");
    quit_button = gtk_button_new_with_label("Quit and release the VM");
    g_signal_connect(call_button, "clicked", G_CALLBACK(call_sqgi), NULL);
    g_signal_connect(quit_button, "clicked", G_CALLBACK(quit), NULL);
    gtk_box_append(GTK_BOX(box), call_button); gtk_box_append(GTK_BOX(box), quit_button);
    gtk_window_set_child(GTK_WINDOW(window), box); gtk_window_present(GTK_WINDOW(window));
}

int sqgi_android_main(const SqgiAndroidEntryContext *supplied)
{
    g_assert(supplied->abi_version == SQGI_ANDROID_ENTRY_ABI_VERSION);
    g_assert(supplied->struct_size >= sizeof(SqgiAndroidEntryContext));
    context = supplied; entries++; entry_thread = g_thread_self();
    g_assert(context->entry_script != NULL);
    vm = sqgi_vm_new(); g_assert(vm != NULL);
    g_assert(SQ_SUCCEEDED(sqgi_vm_dofile(vm, context->entry_script))); g_assert(value() == 42);
    application = gtk_application_new(context->application_id, G_APPLICATION_NON_UNIQUE);
    g_signal_connect(application, "activate", G_CALLBACK(activate), NULL);
    guint timer = g_timeout_add(250, tick, NULL);
    int result = g_application_run(G_APPLICATION(application), 0, NULL);
    g_source_remove(timer); g_clear_object(&application); window = NULL;
    sqgi_vm_free(vm); vm = NULL; vm_closed = TRUE; report();
    return result;
}

void sqgi_android_shutdown(const SqgiAndroidEntryContext *supplied, int exit_code)
{
    g_assert(supplied == context && exit_code == 0); shutdown_called = TRUE; report();
}
