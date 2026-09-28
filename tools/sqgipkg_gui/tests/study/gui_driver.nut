// Field-study bridge: operates rendered GTK controls, never the document model.
// The controller writes request.json atomically and reads response.json.
local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local GLib = import("GLib")
local A = import("../../src/application.nut")
local folder = vargv[0]
local request = Gio.File.new_for_path(folder + "/request.json")
local response = Gio.File.new_for_path(folder + "/response.json")
local app = Gtk.Application.new("org.sqgi.ManifestStudio.FieldStudy", Gio.ApplicationFlags.non_unique)
local editor = null, items = [], inventory = [], pending = null

local function environment() {
    local settings = Gtk.Settings.get_default(), values = {}
    foreach (key in ["gtk-font-name", "gtk-theme-name", "gtk-icon-theme-name",
                     "gtk-application-prefer-dark-theme", "gtk-xft-dpi"])
        values[key] <- settings[key]
    return { gtk_settings = values, window_scale = editor.window.get_scale_factor(),
        gtk_version = [Gtk.get_major_version(), Gtk.get_minor_version(), Gtk.get_micro_version()],
        display = GLib.getenv("DISPLAY"), requested_renderer = GLib.getenv("GSK_RENDERER"),
        requested_backend = GLib.getenv("GDK_BACKEND") }
}

function walk(widget, depth) {
    if (!widget.get_mapped()) return
    local id = items.len(); items.push(widget)
    local row = { id = id, depth = depth, kind = widget.get_name(),
        sensitive = widget.get_sensitive(), focused = widget.has_focus(),
        width = widget.get_width(), height = widget.get_height() }
    try { row.label <- widget.get_label() } catch (_) {}
    try { row.text <- widget.get_text() } catch (_) {}
    try { row.title <- widget.get_title() } catch (_) {}
    try { row.selected <- widget.get_selected() } catch (_) {}
    try { row.active <- widget.get_active() } catch (_) {}
    inventory.push(row)
    local child = widget.get_first_child()
    while (child != null) { walk(child, depth + 1); child = child.get_next_sibling() }
}
function scan() {
    items = []; inventory = []
    local windows = Gtk.Window.get_toplevels()
    for (local i = 0; i < windows.get_n_items(); i++) walk(windows.get_item(i), 0)
    return inventory
}
function control(command) {
    local widget = null
    if ("key" in command) {
        if (command.key in editor.widgets) widget = editor.widgets[command.key]
        else if (command.key in editor.fields.controls) widget = editor.fields.controls[command.key]
        else throw "No mapped control key: " + command.key
    } else if ("id" in command) {
        if (command.id < 0 || command.id >= items.len()) throw "Unknown inventory id"
        widget = items[command.id]
    } else if ("label" in command) {
        foreach (i, row in inventory) if ("label" in row && row.label == command.label &&
            (row.kind == "GtkButton" || row.kind == "GtkCheckButton" || row.kind == "GtkExpander")) {
            if (widget != null) throw "Ambiguous label; select an inventory id"
            widget = items[i]
        }
    }
    if (widget == null || !widget.get_mapped() || !widget.get_sensitive()) throw "Control is not available"
    return widget
}
function perform(command) {
    if (command.op == "inspect") return
    if (command.op == "quit") { app.quit(); return }
    local widget = control(command)
    widget.grab_focus() // GTK scrolls focus into view; no hidden fields are exposed.
    if (command.op == "click") { if (!widget.activate()) throw "Control did not activate" }
    else if (command.op == "text") widget.set_text(command.text)
    else if (command.op == "select") widget.set_selected(command.index)
    else if (command.op == "toggle") widget.set_active(command.active)
    else if (command.op == "focus") {}
    else if (command.op == "expand") widget.set_expanded(command.expanded)
    else if (command.op == "raw-text") {
        // Explicit expert-editor action, recorded as such by the controller.
        local buffer = widget.get_buffer()
        buffer.begin_user_action(); buffer.set_text(command.text, -1); buffer.end_user_action()
    } else throw "Unsupported control operation: " + command.op
}
app.connect("activate", function() {
    editor = A.Application(app)
    GLib.timeout_add(GLib.PRIORITY_DEFAULT, 200, function() {
        try {
            if (pending != null) {
                local result = { ok = true, widgets = scan(), status = editor.status.get_text(),
                    environment = environment() }
                response.replace_contents(sqgi.json.stringify(result), null, false, Gio.FileCreateFlags.none, null)
                pending = null
            } else if (request.query_exists(null)) {
                local command = sqgi.json.parse(request.load_contents(null)[0])
                request.delete(null)
                perform(command); pending = command
            }
        } catch (e) {
            response.replace_contents(sqgi.json.stringify({ ok = false, error = e.tostring(), widgets = scan() }),
                null, false, Gio.FileCreateFlags.none, null)
            pending = null
        }
        return true
    })
})
app.run(0, null)
