local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local GLib = import("GLib")
local GdkPixbuf = import("GdkPixbuf")
local Gst = import("Gst")
local system = import("system")
local support = import("scripts/checks.nut")
local catalogs = import("scripts/catalog.nut")
local extension = "dynamic"
local dynamic_module = import("scripts/" + extension + ".nut")
local resources = system.paths.app_resources
if (resources == null) resources = GLib.get_current_dir() + "/resources"
local results = [], failures = 0
function check(name, ok, detail) {
    results.push({ name = name, ok = ok, detail = detail })
    if (!ok) failures++
    print((ok ? "PASS " : "FAIL ") + name + ": " + detail + "\n")
}
function attempt(name, fn) {
    try { fn() } catch (e) { check(name, false, e.tostring()) }
}
print("STUDY_ENV " + sqgi.json.stringify({ architecture = system.cpu.arch,
    packaged = system.package.packaged, resources = resources,
    runtime = system.runtime, kernel_backend = sqgi.kernel.backend }) + "\n")
check("dynamic import", dynamic_module.answer() == 42, "dynamic script returned 42")

attempt("images", function() {
    foreach (item in [["images/checker.png", 192, 128], ["images/café photo/landscape.jpg", 320, 180]]) {
        local path = resources + "/" + item[0]
        local pixbuf = GdkPixbuf.Pixbuf.new_from_file(path)
        check(item[0], pixbuf.get_width() == item[1] && pixbuf.get_height() == item[2], path)
    }
})
attempt("icons", function() {
    local icon = GdkPixbuf.Pixbuf.new_from_file(resources + "/icons/playground.png")
    check("icon PNG", icon.get_width() == 128, resources + "/icons/playground.png")
    check("icon SVG", Gio.File.new_for_path(resources + "/icons/playground.svg").query_exists(null), "SVG asset present")
})
attempt("kernels", function() {
    check("kernel backend", sqgi.kernel.available, sqgi.kernel.backend)
    local scalar = sqgi.kernel.load("kernels/answer.sqk")
    check("scalar kernel", scalar.answer() == 42, "answer() = 42")
    check("buffer kernel", support.kernel_sum() == 30.0, "sum of squares = 30")
})
attempt("locales", function() {
    foreach (item in [["fr", "Bonjour du paquet"], ["de", "Hallo aus dem Paket"], ["en", "Hello from the package"]]) {
        local translated = catalogs.translate(resources + "/locale", item[0], "Hello from the package")
        check("locale " + item[0], translated == item[1], translated)
    }
})
attempt("GStreamer", function() {
    Gst.init(null)
    foreach (name in ["audiotestsrc", "audioconvert", "fakesink"]) {
        local factory = Gst.ElementFactory.find(name)
        if (factory == null) throw "Missing GStreamer element " + name
        local plugin = factory.get_plugin()
        check("plugin " + name, plugin != null, plugin == null ? "missing" : plugin.get_filename())
    }
    local pipeline = Gst.parse_launch("audiotestsrc num-buffers=4 ! audioconvert ! fakesink sync=false")
    pipeline.set_state(Gst.State.playing)
    local message = pipeline.get_bus().timed_pop_filtered(10000000000, Gst.MessageType.eos + Gst.MessageType.error)
    pipeline.set_state(Gst.State["null"])
    check("GStreamer EOS", message != null && message.type == Gst.MessageType.eos, "finite audio pipeline")
})
print("STUDY_RESULT " + sqgi.json.stringify({ failures = failures, checks = results }) + "\n")

if (GLib.getenv("SQGI_STUDY_NO_WINDOW") != "1") {
    local app = Gtk.Application.new("org.sqgi.study.Playground", Gio.ApplicationFlags.non_unique)
    app.connect("activate", function() {
        local window = Gtk.ApplicationWindow.new(app)
        window.set_title("Packaging Playground")
        window.set_default_size(820, 680)
        local box = Gtk.Box.new(Gtk.Orientation.vertical, 12)
        foreach (edge in ["top", "bottom", "start", "end"]) box["set_margin_" + edge](20)
        local title = Gtk.Label.new("Packaging Playground"); title.add_css_class("title-1"); box.append(title)
        local language = Gtk.DropDown.new(Gtk.StringList.new(["English", "Français", "Deutsch"]), null)
        local greeting = Gtk.Label.new("Hello from the package")
        language.connect("notify::selected", function(_property, ...) {
            greeting.set_text(catalogs.translate(resources + "/locale", ["en", "fr", "de"][language.get_selected()], "Hello from the package"))
        })
        box.append(language); box.append(greeting)
        local images = Gtk.Box.new(Gtk.Orientation.horizontal, 16)
        foreach (path in ["icons/playground.png", "images/checker.png", "images/café photo/landscape.jpg"]) {
            local image = Gtk.Picture.new_for_filename(resources + "/" + path)
            image.set_size_request(160, 120); image.set_can_shrink(true); images.append(image)
        }
        box.append(images)
        local summary = Gtk.Label.new(failures == 0 ? "All package checks passed" : failures + " checks failed")
        summary.add_css_class("title-2"); box.append(summary)
        local details = ""
        foreach (row in results) details += (row.ok ? "✓ " : "✗ ") + row.name + " — " + row.detail + "\n"
        local label = Gtk.Label.new(details); label.set_xalign(0.0); label.set_wrap(true); label.set_selectable(true)
        local scroll = Gtk.ScrolledWindow.new(); scroll.set_child(label); scroll.set_vexpand(true); box.append(scroll)
        window.set_child(box); window.present()
        if (GLib.getenv("SQGI_STUDY_UI_CHECKS") == "1") {
            local changes = [[1, "Bonjour du paquet"], [2, "Hallo aus dem Paket"], [0, "Hello from the package"]]
            local step = 0, ui_failures = 0
            GLib.timeout_add(GLib.PRIORITY_DEFAULT, 500, function() {
                local expected = changes[step]
                language.set_selected(expected[0])
                local actual = greeting.get_label(), ok = actual == expected[1]
                print((ok ? "PASS" : "FAIL") + " UI language " + expected[0] + ": " + actual + "\n")
                if (!ok) { failures++; ui_failures++ }
                step++
                if (step == changes.len()) {
                    print("STUDY_UI_RESULT " + sqgi.json.stringify({ checks = step, failures = ui_failures }) + "\n")
                    app.quit(); return false
                }
                return true
            })
        }
        local timeout = GLib.getenv("SQGI_STUDY_AUTOCLOSE_MS")
        if (timeout != null) GLib.timeout_add(GLib.PRIORITY_DEFAULT, timeout.tointeger(), function() { app.quit(); return false })
    })
    app.run(0, null)
}
if (failures) throw "Packaging Playground failed " + failures + " checks"
