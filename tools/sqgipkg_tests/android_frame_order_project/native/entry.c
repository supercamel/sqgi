/* GPU and CPU frame counters expose stale presentation of GTK surfaces. */
#include <sqgi_android_entry.h>
#include <gtk/gtk.h>
#include <epoxy/gl.h>

static GtkWidget *window, *area, *picture, *label;
static unsigned gpu_frame, cpu_frame;
static const SqgiAndroidEntryContext *entry;

static gboolean
render(GtkGLArea *self, GdkGLContext *context, gpointer data)
{
    (void)self; (void)context; (void)data;
    GLint viewport[4];
    glGetIntegerv(GL_VIEWPORT, viewport);
    int width = viewport[2], height = viewport[3];
    gpu_frame++;
    glDisable(GL_SCISSOR_TEST);
    glDisable(GL_DEPTH_TEST);
    glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
    glClearColor(0.1f, 0.3f, 0.6f, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_SCISSOR_TEST);
    for (int bit = 0; bit < 16; bit++) {
        int left = width * (10 + bit * 5) / 100;
        int right = width * (15 + bit * 5) / 100;
        glScissor(left, height / 4, right - left, 32);
        float value = (gpu_frame & (1u << bit)) ? 1 : 0;
        glClearColor(value, value, value, 1);
        glClear(GL_COLOR_BUFFER_BIT);
    }
    glDisable(GL_SCISSOR_TEST);
    return TRUE;
}

static gboolean
tick(gpointer unused)
{
    (void)unused;
    cpu_frame++;
    gtk_gl_area_queue_render(GTK_GL_AREA(area));
    /* New immutable pixels on every update, like a decoded video frame. */
    GdkPixbuf *pixels = gdk_pixbuf_new(GDK_COLORSPACE_RGB, TRUE, 8, 1280, 360);
    gdk_pixbuf_fill(pixels, 0x259949ff);
    for (int bit = 0; bit < 16; bit++) {
        GdkPixbuf *block = gdk_pixbuf_new_subpixbuf(pixels, 128 + bit * 64, 270, 64, 24);
        gdk_pixbuf_fill(block, (cpu_frame & (1u << bit)) ? 0xffffffff : 0x000000ff);
        g_object_unref(block);
    }
    GdkTexture *texture = gdk_texture_new_for_pixbuf(pixels);
    gtk_picture_set_paintable(GTK_PICTURE(picture), GDK_PAINTABLE(texture));
    g_object_unref(texture);
    g_object_unref(pixels);
    return G_SOURCE_CONTINUE;
}

static gboolean
report(gpointer unused)
{
    (void)unused;
    char text[128];
    g_snprintf(text, sizeof text, "GPU frame %u · camera pixels %u", gpu_frame, cpu_frame);
    gtk_label_set_text(GTK_LABEL(label), text);
    graphene_rect_t a, p;
    if (!gtk_widget_compute_bounds(area, window, &a) ||
        !gtk_widget_compute_bounds(picture, window, &p))
        return G_SOURCE_CONTINUE;
    GdkSurface *surface = gtk_native_get_surface(GTK_NATIVE(window));
    g_autofree char *path = g_build_filename(entry->data_directory, "frame-order.json", NULL);
    g_autofree char *json = g_strdup_printf(
        "{\"gpu\":%u,\"cpu\":%u,\"renderer\":\"%s\",\"scale\":%g,"
        "\"gl\":[%g,%g,%g,%g],\"picture\":[%g,%g,%g,%g]}\n",
        gpu_frame, cpu_frame, G_OBJECT_TYPE_NAME(gtk_native_get_renderer(GTK_NATIVE(window))),
        gdk_surface_get_scale(surface),
        a.origin.x, a.origin.y, a.size.width, a.size.height,
        p.origin.x, p.origin.y, p.size.width, p.size.height);
    g_file_set_contents(path, json, -1, NULL);
    return G_SOURCE_CONTINUE;
}

static void
activate(GtkApplication *app, gpointer unused)
{
    (void)unused;
    window = gtk_application_window_new(app);
    gtk_window_set_default_size(GTK_WINDOW(window), 1280, 800);
    GtkWidget *box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);
    label = gtk_label_new("Frame order");
    area = gtk_gl_area_new();
    picture = gtk_picture_new();
    gtk_gl_area_set_use_es(GTK_GL_AREA(area), TRUE);
    gtk_gl_area_set_required_version(GTK_GL_AREA(area), 3, 0);
    gtk_picture_set_content_fit(GTK_PICTURE(picture), GTK_CONTENT_FIT_FILL);
    gtk_widget_set_vexpand(area, TRUE);
    gtk_widget_set_vexpand(picture, TRUE);
    gtk_widget_set_size_request(area, 320, 180);
    gtk_widget_set_size_request(picture, 320, 180);
    gtk_box_append(GTK_BOX(box), label);
    gtk_box_append(GTK_BOX(box), area);
    gtk_box_append(GTK_BOX(box), picture);
    g_signal_connect(area, "render", G_CALLBACK(render), NULL);
    g_timeout_add(40, tick, NULL);
    /* Independent label updates also exercise partial window damage. */
    g_timeout_add(70, report, NULL);
    gtk_window_present(GTK_WINDOW(window));
}

int
sqgi_android_main(const SqgiAndroidEntryContext *context)
{
    entry = context;
    g_autoptr(GtkApplication) app = gtk_application_new(context->application_id,
                                                       G_APPLICATION_NON_UNIQUE);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    return g_application_run(G_APPLICATION(app), 0, NULL);
}
