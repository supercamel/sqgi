/**
 * demo/gtk4/hello_world.nut
 *
 * Basic GTK4 Hello World demo in Squirrel.
 */

local Gtk = import("Gtk", "4.0")
local app = Gtk.Application.new("com.example.sqgi.helloworld", 0)

app.connect("activate", function() {
    local main_window = Gtk.ApplicationWindow.new(app)
    main_window.set_title("GTK4 Hello from Squirrel")
    main_window.set_default_size(460, 180)

    local main_label = Gtk.Label.new("Hello World from Squirrel + GTK4")
    main_window.set_child(main_label)

    main_window.present()
})

local status = app.run(0, null)
print("Application exited with status " + status + "\n")
