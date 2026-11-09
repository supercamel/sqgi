local Gtk = import("Gtk", "4.0")
local Gio = import("Gio", "2.0")
local GLib = import("GLib", "2.0")
local app = Gtk.Application.new(@APPLICATION_ID@, Gio.ApplicationFlags.non_unique)
local window = null
app.connect("activate", function() {
    if (window != null) { window.present(); return }
    window = Gtk.ApplicationWindow.new(app)
    window.set_title(@NAME@); window.set_default_size(380, 600)
    local content = Gtk.Box.new(Gtk.Orientation.vertical, 18)
    content.set_margin_top(24); content.set_margin_bottom(24)
    content.set_margin_start(24); content.set_margin_end(24)
    local title = Gtk.Label.new(@NAME@); title.add_css_class("title-1"); content.append(title)
    local message = Gtk.Label.new(GLib.file_get_contents("message.txt")); message.set_wrap(true); content.append(message)
    local button = Gtk.Button.new_with_label("Call GTK from SQGI")
    button.connect("clicked", function() {
        message.set_label("SQGI called GTK through GObject Introspection.")
        print("SQGI GTK callback completed\n")
    })
    content.append(button); window.set_child(content)
    window.connect("close-request", function() { window = null; return false })
    window.present(); print("SQGI application ready\n")
})
app.run(0, null)
