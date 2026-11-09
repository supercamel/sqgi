local Gtk = import("Gtk", "4.0")
local Gio = import("Gio", "2.0")
local GLib = import("GLib", "2.0")
local Suite = import("checks.nut")
local Cpp = import("SqMobileCpp", "1.0")
local app = Gtk.Application.new("org.sqgi.android.nativefixture", Gio.ApplicationFlags.non_unique)
app.connect("activate", function() {
    local window = Gtk.ApplicationWindow.new(app)
    window.set_title("Native modules"); window.set_default_size(411, 800)
    local column = Gtk.Box.new(Gtk.Orientation.vertical, 18)
    foreach (side in ["top", "bottom", "start", "end"]) column["set_margin_" + side](24)
    local heading = Gtk.Label.new("Native modules on Android")
    heading.add_css_class("title-1"); heading.set_wrap(true); column.append(heading)
    foreach (text in ["C · GObject properties and signals", "C++ · Shared NDK runtime", "Vala · Async calls and errors", "Rust · C ABI and native dependencies"]) {
        local label = Gtk.Label.new(text); label.set_wrap(true); label.set_xalign(0.0); column.append(label)
    }
    local status = Gtk.Label.new("Running native checks…"); status.set_wrap(true); status.set_vexpand(true); column.append(status)
    local calls = 0, button = Gtk.Button.new_with_label("Call the C++ module")
    button.add_css_class("suggested-action")
    button.connect("clicked", function() {
        calls++; local answer = Cpp.sum(19, 23)
        status.set_label("C++ returned " + answer + " · " + calls + " GTK callbacks")
        GLib.file_set_contents("native-clicks.txt", calls.tostring(), -1)
    })
    column.append(button); window.set_child(column); window.present()
    sqgi.timeout_add(300, function() {
        if (!window.get_mapped()) return true
        local point = button.translate_coordinates(window, button.get_width() / 2.0, button.get_height() / 2.0)
        local scale = window.get_surface().get_scale()
        GLib.file_set_contents("native-controls.json", sqgi.json.stringify({x=point[0]*scale,y=point[1]*scale}), -1)
        return true
    })
    Suite.run().then(function(result) {
        GLib.file_set_contents("native-result.json", sqgi.json.stringify(result), -1)
        status.set_label("All native checks passed\n" + result.abi + " · " + result.layout_size + " byte record")
        print("NATIVE_PASS " + sqgi.json.stringify(result) + "\n")
    }).catch(function(error) {
        GLib.file_set_contents("native-result.json", sqgi.json.stringify({passed=false,error=error.tostring()}), -1)
        status.set_label("Native check failed: " + error)
    })
})
app.run(0, null)
