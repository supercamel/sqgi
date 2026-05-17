/**
 * demo/gtk4/counter.nut
 *
 * GTK4 interactive demo:
 * - shows a counter label
 * - increments when the button is clicked
 */

local Gtk = import("Gtk", "4.0")
local app = Gtk.Application.new("com.example.sqgi.counter", 0)

app.connect("activate", function() {
    local window = Gtk.ApplicationWindow.new(app)
    window.set_title("GTK4 Counter Demo")
    window.set_default_size(360, 180)

    local count = 0

    local box = Gtk.Box.new(Gtk.Orientation.vertical, 12)
    box.set_margin_top(16)
    box.set_margin_bottom(16)
    box.set_margin_start(16)
    box.set_margin_end(16)

    local label = Gtk.Label.new("Count: 0")
    local button = Gtk.Button.new_with_label("Increment")

    button.connect("clicked", function() {
        count = count + 1
        label.set_label("Count: " + count)
    })

    box.append(label)
    box.append(button)

    window.set_child(box)
    window.present()
})

local status = app.run(0, null)
print("Application exited with status " + status + "\n")
