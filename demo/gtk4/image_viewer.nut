/**
 * demo/gtk4/image_viewer.nut
 *
 * GTK 4 image-resource demo. Shows a bundled CC0 image with Gtk.Picture.
 *
 * Usage:
 *   sqgi demo/gtk4/image_viewer.nut
 *   sqgi demo/gtk4/image_viewer.nut --timeout=3
 *   sqgi demo/gtk4/image_viewer.nut --check
 *
 * Package:
 *   sqgipkg --manifest demo/gtk4/image_viewer.sqgipkg.json
 */

local GLib = import("GLib")
local Gio  = import("Gio")
local Gtk  = import("Gtk", "4.0")

local hard_timeout = 0
local check_only = false
foreach (a in vargv) {
    if (a.find("--timeout=") == 0) hard_timeout = a.slice(10).tointeger()
    else if (a == "--check") check_only = true
}

function path_exists(path) {
    return Gio.File.new_for_path(path).query_exists(null)
}

function first_existing(paths) {
    foreach (p in paths) {
        if (p != null && path_exists(p)) return p
    }
    return null
}

local resources = GLib.getenv("SQGI_APP_RESOURCES")
local image_path = first_existing([
    resources != null ? GLib.build_filenamev([resources, "assets", "blaue_blume_600.jpg"]) : null,
    GLib.build_filenamev(["demo", "gtk4", "assets", "blaue_blume_600.jpg"]),
    GLib.build_filenamev(["assets", "blaue_blume_600.jpg"])
])

if (image_path == null) {
    print("image_viewer: could not find blaue_blume_600.jpg\n")
    return 1
}

if (check_only) {
    print("image_viewer: loaded " + image_path + "\n")
    return 0
}

local app = Gtk.Application.new("org.sqgi.gtk4.image_viewer",
                                Gio.ApplicationFlags.flags_none)

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.set_title("SQGI - GTK 4 Image Resource Demo")
    win.set_default_size(720, 640)

    local box = Gtk.Box.new(Gtk.Orientation.vertical, 12)
    box.set_margin_top(16)
    box.set_margin_bottom(16)
    box.set_margin_start(16)
    box.set_margin_end(16)

    local title = Gtk.Label.new("Blaue Blume")
    title.add_css_class("title-1")
    box.append(title)

    local picture = Gtk.Picture.new_for_filename(image_path)
    picture.set_content_fit(Gtk.ContentFit.contain)
    picture.set_can_shrink(true)
    picture.set_alternative_text("A blue flower with water droplets")
    picture.set_vexpand(true)
    box.append(picture)

    local caption = Gtk.Label.new("CC0 image from Wikimedia Commons: File:Blaue Blume.jpg")
    caption.add_css_class("dim-label")
    box.append(caption)

    win.set_child(box)
    win.present()

    print("image_viewer: loaded " + image_path + "\n")

    if (hard_timeout > 0) {
        sqgi.timeout_add(hard_timeout * 1000, function() {
            print("[timeout " + hard_timeout + "s] closing image viewer\n")
            win.close()
            return false
        })
    }
})

local status = app.run(0, null)
print("Application exited with status " + status + "\n")
