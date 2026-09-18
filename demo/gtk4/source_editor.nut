// Run from the repository root. Requires GtkSourceView 5 and Node.js.
// --check tests highlighting, async formatting, and undo without a window.
local Gtk = import("Gtk", "4.0")
local GtkSource = import("GtkSource", "5")
local Gio = import("Gio")
local GLib = import("GLib")
local Formatter = import("editors/gtksourceview/format.nut")
local check = false, timeout = 0, kernel = false
foreach (arg in vargv) {
    if (arg == "--check") check = true
    if (arg == "--kernel") kernel = true
    if (arg.find("--timeout=") == 0) timeout = arg.slice(10).tointeger()
}
local manager = GtkSource.LanguageManager.new()
local paths = [GLib.build_filenamev([GLib.get_current_dir(), "editors", "gtksourceview"])]
foreach (p in manager.get_search_path()) paths.append(p)
manager.set_search_path(paths)
local language = manager.get_language(kernel ? "sqgi-kernel" : "sqgi-squirrel")
if (language == null) throw "SQGI language definition not found"
local buffer = GtkSource.Buffer.new_with_language(language)
local original = "async function greet( name ){\nlocal message=\"Hello, \"+name\nprint(message)\n}\n"
if (kernel) original = "export f64 length(f64 x){\nreturn sqrt(x*x);\n}\n"
buffer.set_text(original, -1)
local command = ["node", GLib.build_filenamev([GLib.get_current_dir(), "tools", "sqgifmt"])]

if (check) {
    local loop = GLib.MainLoop.new(null, false), failed = false
    Formatter.format_buffer(buffer, command).then(function(changed) {
        try {
            if (!changed) throw "formatter made no edit"
            local text = buffer.get_text(buffer.get_start_iter(), buffer.get_end_iter(), true)
            if (text.find(kernel ? "    return sqrt(x * x);" : "    local message = \"Hello, \" + name") == null) throw "unexpected formatting"
            if (!buffer.get_can_undo()) throw "format edit cannot be undone"
            buffer.undo()
            if (buffer.get_text(buffer.get_start_iter(), buffer.get_end_iter(), true) != original) throw "undo did not restore source"
            buffer.ensure_highlight(buffer.get_start_iter(), buffer.get_end_iter())
            print("source_editor: language, async formatter, and undo passed\n")
        } catch (e) { print(e + "\n"); failed = true }
        loop.quit()
    }).catch(function(e) { print(e + "\n"); failed = true; loop.quit() })
    loop.run()
    if (failed) throw "source_editor checks failed"
    return
}

local app = Gtk.Application.new("org.sqgi.SourceEditor", Gio.ApplicationFlags.flags_none)
app.connect("activate", function() {
    local window = Gtk.ApplicationWindow.new(app)
    window.set_title("SQGI Source Editor")
    window.set_default_size(800, 540)
    local box = Gtk.Box.new(Gtk.Orientation.vertical, 6)
    local view = GtkSource.View.new_with_buffer(buffer)
    view.set_monospace(true)
    view.set_show_line_numbers(true)
    view.set_auto_indent(true)
    view.set_tab_width(4)
    view.set_insert_spaces_instead_of_tabs(true)
    local scroll = Gtk.ScrolledWindow.new()
    scroll.set_vexpand(true)
    scroll.set_child(view)
    local status = Gtk.Label.new(kernel ? "Typed kernel (.sqk)" : "Squirrel (.nut)")
    local format_button = Gtk.Button.new_with_label("Format Document")
    format_button.connect("clicked", function() {
        format_button.set_sensitive(false)
        Formatter.format_buffer(buffer, command, view.get_tab_width(), view.get_insert_spaces_instead_of_tabs())
            .then(function(changed) {
                status.set_text(changed ? "Formatted — Ctrl+Z to undo" : "Already formatted")
                format_button.set_sensitive(true)
            }).catch(function(e) { status.set_text(e); format_button.set_sensitive(true) })
    })
    box.append(format_button)
    box.append(status)
    box.append(scroll)
    window.set_child(box)
    window.present()
    if (timeout > 0) sqgi.timeout_add(timeout * 1000, function() { window.close(); return false })
})
app.run(0, null)
