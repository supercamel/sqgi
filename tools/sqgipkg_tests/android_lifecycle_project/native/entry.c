#include <gtk/gtk.h>
#include <sqgi_android_entry.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

static char *exit_path;
static GtkWidget *window, *area;
static gboolean gl_ready;

/* Android application termination must not run process-wide destructors:
 * framework threads may still use the objects those destructors release.
 * Record that boundary without deliberately crashing a framework thread. */
static void global_cleanup(void)
{
    int fd = open(exit_path, O_WRONLY | O_CREAT | O_TRUNC, 0600);
    if (fd >= 0) {
        const char marker[] = "global exit handlers ran\n";
        (void)write(fd, marker, sizeof marker - 1);
        close(fd);
    }
}

static gboolean finish(gpointer data)
{
    gl_ready = gtk_gl_area_get_context(GTK_GL_AREA(area)) != NULL &&
               gtk_gl_area_get_error(GTK_GL_AREA(area)) == NULL;
    gtk_window_close(GTK_WINDOW(window));
    g_application_quit(G_APPLICATION(data));
    return G_SOURCE_REMOVE;
}

static void activate(GtkApplication *app, gpointer unused)
{
    (void)unused;
    window = gtk_application_window_new(app);
    area = gtk_gl_area_new();
    gtk_gl_area_set_use_es(GTK_GL_AREA(area), TRUE);
    gtk_gl_area_set_required_version(GTK_GL_AREA(area), 3, 0);
    gtk_window_set_child(GTK_WINDOW(window), area);
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);
    gtk_window_present(GTK_WINDOW(window));
    g_timeout_add(2000, finish, app);
}

int sqgi_android_main(const SqgiAndroidEntryContext *context)
{
    exit_path = g_build_filename(context->data_directory, "global-exit.txt", NULL);
    if (atexit(global_cleanup) != 0) return 2;
    g_autoptr(GtkApplication) app = gtk_application_new(context->application_id,
                                                      G_APPLICATION_NON_UNIQUE);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    int result = g_application_run(G_APPLICATION(app), 0, NULL);
    return gl_ready ? result : 3;
}

/* This is the application's explicit cleanup hook. It must still run. */
void sqgi_android_shutdown(const SqgiAndroidEntryContext *context, int result)
{
    g_autofree char *path = g_build_filename(context->data_directory, "cleanup.json", NULL);
    g_autofree char *json = g_strdup_printf("{\"result\":%d,\"gl\":%s,\"cleanup\":true}\n",
                                            result, gl_ready ? "true" : "false");
    g_file_set_contents(path, json, -1, NULL);
}
