// C-EDIT-09: preview desktop metadata before one undoable document change.
local Gtk = import("Gtk", "4.0"), Gdk = import("Gdk", "4.0")
local Gio = import("Gio"), GLib = import("GLib")
local W = import("widgets.nut"), D = import("document.nut")
local function absolute(directory, path) { return GLib.canonicalize_filename(path, directory) }
local function relative(directory, path) {
    local value = Gio.File.new_for_path(directory).get_relative_path(Gio.File.new_for_path(path))
    return value == null ? path : value
}
local function resolve_icon(name, folder) {
    if (name == "") return ""
    local path = absolute(folder, name)
    if (Gio.File.new_for_path(path).query_file_type(Gio.FileQueryInfoFlags.none, null) == Gio.FileType.regular) return path
    if (name.find("/") != null) return ""
    local theme = Gtk.IconTheme.get_for_display(Gdk.Display.get_default())
    if (!theme.has_icon(name)) return ""
    local icon = theme.lookup_icon(name, null, 128, 1, Gtk.TextDirection.none, Gtk.IconLookupFlags.force_regular)
    local file = icon.get_file()
    return file == null || file.get_path() == null ? "" : file.get_path()
}
local function read_file(path, directory) {
    local k = GLib.KeyFile.new(); k.load_from_file(path, GLib.KeyFileFlags.none)
    local group = "Desktop Entry"
    if (k.get_string(group, "Type") != "Application") throw "Choose a Type=Application desktop file."
    local keys = k.get_keys(group)
    if (keys.len() && typeof(keys[0]) == "array") keys = keys[0]
    local get = function(key, fallback) { return keys.find(key) != null ? k.get_string(group, key) : fallback }
    local filename = GLib.path_get_basename(path)
    if (filename.len() <= 8 || filename.slice(-8) != ".desktop") throw "Choose a file ending in .desktop."
    local icon = get("Icon", ""), resolved = resolve_icon(icon, GLib.path_get_dirname(path))
    return { name = k.get_string(group, "Name"), app_id = filename.slice(0, -8),
        desktop_comment = get("Comment", ""), desktop_categories = get("Categories", "Utility;"),
        desktop_terminal = keys.find("Terminal") != null ? k.get_boolean(group, "Terminal") : false,
        desktop_icon = resolved == "" ? "" : relative(directory, resolved), icon_required = icon != "", source_icon = icon }
}
local function write_value(value, proposed, directory) {
    foreach (key in ["name", "app_id"]) if (strip(proposed[key]) == "") throw "Enter an application name and desktop ID."
    foreach (c in proposed.app_id) if (c < 32 || c == 127 || c == 47 || c == 92) throw "Desktop ID cannot contain slashes or control characters."
    if (proposed.icon_required && proposed.desktop_icon == "") throw "The source icon was not found. Choose an icon image before applying."
    if (proposed.desktop_icon != "") {
        local file = Gio.File.new_for_path(absolute(directory, proposed.desktop_icon))
        if (file.query_file_type(Gio.FileQueryInfoFlags.none, null) != Gio.FileType.regular) throw "Choose an existing icon image."
        local valid = false, path = proposed.desktop_icon.tolower()
        foreach (ext in [".png", ".svg", ".svgz", ".xpm"]) if (path.len() >= ext.len() && path.slice(-ext.len()) == ext) valid = true
        if (!valid) throw "Choose a PNG, SVG, SVGZ or XPM icon."
    }
    local next = D.copy_value(value)
    foreach (key in ["name", "app_id", "desktop_comment", "desktop_categories", "desktop_terminal"]) next[key] <- proposed[key]
    if (proposed.desktop_icon != "") next.desktop_icon <- proposed.desktop_icon
    return next
}
local function open_dialog(e) {
    local dialog = Gtk.Dialog.new(); dialog.set_title("Reuse desktop metadata")
    dialog.set_transient_for(e.window); dialog.set_modal(true); dialog.set_default_size(680, 680)
    local body = W.padded(W.box()); dialog.get_content_area().append(W.scroll(body))
    body.append(W.label("Choose your app's .desktop file, review the values, then Apply. This replaces the matching root settings. Platform overrides and other settings stay intact. Save writes the manifest."))
    body.append(W.label("Only base metadata is imported. Localized entries, desktop actions and custom keys are not copied. Packaging generates the executable path; it never runs the source Exec command."))
    local path = W.entry(), row = W.box(false); path.set_placeholder_text("Path to an existing .desktop file")
    row.append(path); body.append(row)
    row.append(W.button("Choose desktop file…", function() { W.choose(dialog, Gtk.FileChooserAction.open, e.base_dir, function(file) { path.set_text(relative(e.base_dir, file)) }) }))
    local status = W.label("Load a desktop file to preview its metadata."), fields = {}, proposed = null
    local apply = dialog.add_button("Apply metadata", Gtk.ResponseType.apply); apply.set_sensitive(false)
    local load = W.button("Load preview", function() {
        try {
            local next = read_file(absolute(e.base_dir, path.get_text()), e.base_dir)
            proposed = next
            foreach (key, input in fields) if (key == "desktop_terminal") input.set_active(next[key]); else input.set_text(next[key])
            status.set_text(next.icon_required && next.desktop_icon == "" ? "Icon '" + next.source_icon + "' was not found. Choose a replacement image before applying." : "Review these values before applying. Icon source: " + (next.source_icon == "" ? "not specified; existing icon is preserved" : next.source_icon))
            apply.set_sensitive(true)
        } catch (error) { proposed = null; apply.set_sensitive(false); status.set_text(error.tostring()) }
    }); body.append(load); body.append(status)
    foreach (pair in [["name", "Application name"], ["app_id", "Desktop application ID"],
        ["desktop_comment", "Description"], ["desktop_categories", "Categories (separated by semicolons)"], ["desktop_icon", "Icon image file"]]) {
        local key = pair[0], input = W.entry(), title = W.heading(pair[1]); title.set_mnemonic_widget(input)
        fields[key] <- input; body.append(title); body.append(input)
    }
    fields.desktop_icon.connect("changed", function() {
        if (proposed != null) status.set_text("Icon path edited. Review the values; Apply checks that the image exists and uses a supported format.")
    })
    body.append(W.button("Choose icon image…", function() { W.choose(dialog, Gtk.FileChooserAction.open, e.base_dir, function(file) { fields.desktop_icon.set_text(relative(e.base_dir, file)) }) }))
    body.append(W.label("The icon file is copied when packaging. An absolute path outside the project depends on this machine; put the image in your project and choose that copy for portable builds."))
    fields.desktop_terminal <- Gtk.CheckButton.new_with_label("Open a terminal for this application"); body.append(fields.desktop_terminal)
    local cancel = dialog.add_button("Cancel", Gtk.ResponseType.cancel)
    dialog.connect("response", function(response) {
        if (response != Gtk.ResponseType.apply) { dialog.destroy(); return }
        try {
            if (proposed == null) throw "Load a desktop file first."
            local next = D.copy_value(proposed)
            foreach (key, input in fields) next[key] = key == "desktop_terminal" ? input.get_active() : input.get_text()
            e.document.set([], write_value(e.document.get([]), next, e.base_dir)); dialog.destroy(); e.refresh()
        } catch (error) { status.set_text(error.tostring()) }
    })
    foreach (key, input in fields) e.widgets["desktop." + key] <- input
    foreach (key, widget in {path=path, load=load, status=status, apply=apply, cancel=cancel}) e.widgets["desktop." + key] <- widget
    dialog.present()
}
local function render(e) {
    local button = W.button("Use an existing desktop file…", function() { open_dialog(e) })
    e.content.append(button); e.widgets["common.desktop"] <- button
    e.content.append(W.label("Reuse the name, desktop ID, description, categories and icon from your application's launcher."))
}
return {read=read_file, write=write_value, render=render}
