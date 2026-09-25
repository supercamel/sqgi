local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local GLib = import("GLib")
function box(vertical = true, spacing = 8) { return Gtk.Box.new(vertical ? Gtk.Orientation.vertical : Gtk.Orientation.horizontal, spacing) }
function label(text) { local w = Gtk.Label.new(text); w.set_xalign(0.0); w.set_wrap(true); return w }
function button(text, action) { local w = Gtk.Button.new_with_label(text); w.connect("clicked", action); return w }
function entry(text = "") { local w = Gtk.Entry.new(); w.set_text(text); w.set_hexpand(true); return w }
function padded(w) { w.set_margin_top(12); w.set_margin_bottom(12); w.set_margin_start(12); w.set_margin_end(12); return w }
function scroll(child) { local w = Gtk.ScrolledWindow.new(); w.set_child(child); w.set_hexpand(true); w.set_vexpand(true); return w }
function clear(w) { local child = w.get_first_child(); while (child != null) { w.remove(child); child = w.get_first_child() } }
function dropdown(items) { return Gtk.DropDown.new(Gtk.StringList.new(items), null) }
function textview(text, editable = false) { local w = Gtk.TextView.new(); w.set_monospace(true); w.set_wrap_mode(Gtk.WrapMode.word_char); w.set_editable(editable); w.get_buffer().set_text(text, -1); return w }
function contents(view) { local b = view.get_buffer(); return b.get_text(b.get_start_iter(), b.get_end_iter(), true) }
function choose(parent, action, initial, done) {
    local dialog = Gtk.FileChooserNative.new(action == Gtk.FileChooserAction.save ? "Save manifest" : "Choose path", parent, action, "Select", "Cancel")
    if (initial != null) {
        local file = Gio.File.new_for_path(initial)
        if (action == Gtk.FileChooserAction.save) {
            dialog.set_current_folder(Gio.File.new_for_path(GLib.path_get_dirname(initial)))
            dialog.set_current_name(GLib.path_get_basename(initial))
        } else if (file.query_exists(null)) dialog.set_file(file)
    }
    dialog.connect("response", function(response) {
        if (response == Gtk.ResponseType.accept) { local file = dialog.get_file(); if (file != null) done(file.get_path()) }
        dialog.destroy()
    })
    dialog.show()
    return dialog
}
function question(parent, title, message, choices, done) {
    local dialog = Gtk.Dialog.new(); dialog.set_title(title); dialog.set_transient_for(parent); dialog.set_modal(true)
    dialog.get_content_area().append(padded(label(message)))
    foreach (i, choice in choices) dialog.add_button(choice, i + 1)
    dialog.connect("response", function(id) { dialog.destroy(); if (id > 0) done(id - 1) })
    dialog.present()
    return dialog
}
return { box = box, label = label, button = button, entry = entry, padded = padded, scroll = scroll,
    clear = clear, dropdown = dropdown, textview = textview, contents = contents, choose = choose, question = question }
