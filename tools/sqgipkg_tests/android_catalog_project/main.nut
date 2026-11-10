// Exercise both native package families in one app, without native recipes.
local Gtk = import("Gtk", "4.0"), Gdk = import("Gdk", "4.0")
local GLib = import("GLib"), Gio = import("Gio")
local Gst = import("Gst", "1.0"), GstApp = import("GstApp", "1.0")
local World = import("GWorldSceneGtk4", "0.1")
Gst.init(null)
local app = Gtk.Application.new("org.sqgi.test.catalog", Gio.ApplicationFlags.non_unique)
local window = null, pipeline = null
local report = function(value) {
    local directory = GLib.get_user_data_dir()
    GLib.mkdir_with_parents(directory, 448)
    Gio.File.new_for_path(directory + "/catalog-result.json").replace_contents(sqgi.json.stringify(value), null, false, Gio.FileCreateFlags.none, null)
}
app.connect("activate", function() {
    if (window != null) { window.present(); return }
    report({ passed = false, state = "starting" })
    window = Gtk.ApplicationWindow.new(app)
    window.set_title("One Android catalog")
    local page = Gtk.Box.new(Gtk.Orientation.vertical, 12)
    local label = Gtk.Label.new("Checking GStreamer and GWorldScene…")
    page.append(label)
    local view = World.SceneView.new()
    view.set_allowed_apis(Gdk.GLAPI.gles)
    view.set_shadows_enabled(false); view.set_water_enabled(false); view.set_cache_enabled(false)
    view.set_camera(45.79, 6.81, 6800.0)
    view.set_hexpand(true); view.set_vexpand(true)
    page.append(view); window.set_child(page); window.present()
    pipeline = Gst.parse_launch("videotestsrc num-buffers=8 ! videoconvert ! video/x-raw,format=RGBA,width=64,height=64 ! appsink name=probe sync=false")
    if (pipeline.set_state(Gst.State.playing) == Gst.StateChangeReturn.failure) throw "GStreamer failed to start"
    local sink = pipeline.get_by_name("probe"), frames = 0, started = GLib.get_monotonic_time()
    GLib.timeout_add(GLib.PRIORITY_DEFAULT, 50, function() {
        try {
            local sample = sink.try_pull_sample(0)
            if (sample != null) {
                if (sample.get_buffer().get_size() != 64 * 64 * 4) throw "Unexpected GStreamer frame size"
                frames++
            }
            if (view.get_error() != null) throw "GWorldScene GL context failed"
            if (frames == 8 && view.get_realized()) {
                pipeline.set_state(Gst.State["null"])
                report({ passed = true, frames = frames, world_realized = true })
                label.set_label("GStreamer: 8 frames · GWorldScene: ready")
                print("PASS combined Android catalog\n")
                return false
            }
            if (GLib.get_monotonic_time() - started > 30000000) throw "Combined catalog runtime check timed out"
        } catch (error) {
            pipeline.set_state(Gst.State["null"])
            report({ passed = false, frames = frames, error = error.tostring() })
            label.set_label(error.tostring())
            return false
        }
        return true
    })
})
app.run(0, null)
