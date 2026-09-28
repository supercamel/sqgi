local Gtk = import("Gtk", "4.0"), Gio = import("Gio"), GLib = import("GLib")
local W = import("widgets.nut"), D = import("document.nut")
local function scan(path) {
    local root = Gio.File.new_for_path(path), result = []
    local children = root.enumerate_children("standard::name,standard::type", Gio.FileQueryInfoFlags.nofollow_symlinks, null)
    try {
        local info
        while ((info = children.next_file(null)) != null) {
            if (info.get_file_type() != Gio.FileType.directory) continue
            local code = info.get_name(), messages = root.get_child(code + "/LC_MESSAGES")
            if (!messages.query_exists(null)) continue
            local catalogs = messages.enumerate_children("standard::name,standard::type", Gio.FileQueryInfoFlags.nofollow_symlinks, null), found = false, catalog
            while ((catalog = catalogs.next_file(null)) != null)
                if (catalog.get_file_type() == Gio.FileType.regular && catalog.get_name().len() > 3 && catalog.get_name().slice(-3) == ".mo") found = true
            catalogs.close(null)
            if (found) result.push(code)
        }
    } catch (error) { children.close(null); throw error }
    children.close(null); result.sort(); return result
}
local function simple(rule, folder, destination) {
    if (typeof(rule) != "table" || rule.len() != 3 || !("from" in rule) || !("to" in rule) || !("include" in rule) ||
        rule.from != folder || rule.to != destination || typeof(rule.include) != "array") return false
    foreach (pattern in rule.include)
        if (typeof(pattern) != "string" || pattern.len() < 18 || pattern.slice(-17) != "/LC_MESSAGES/*.mo") return false
    return true
}
local function selected(value, folder) {
    local result = [], files = "files" in value ? value.files : []
    if (typeof(files) == "array") foreach (rule in files) if (simple(rule, folder, "usr/share/locale"))
        foreach (pattern in rule.include) result.push(pattern.slice(0, pattern.len() - 17))
    return result
}
local function write_languages(value, folder, codes) {
    local next = D.copy_value(value), patterns = []
    foreach (code in codes) patterns.push(code + "/LC_MESSAGES/*.mo")
    if (!("windows" in next)) next.windows <- {}
    if (typeof(next.windows) != "table") throw "Windows settings use a custom form. Edit their file rules in Advanced."
    foreach (pair in [[next, "usr/share/locale"], [next.windows, "share/locale"]]) {
        local parent = pair[0], dest = pair[1], files = "files" in parent ? parent.files : [], remaining = []
        if (typeof(files) != "array") throw "File rules use a custom form. Edit them in Advanced before adding languages."
        foreach (rule in files) if (!simple(rule, folder, dest)) remaining.push(rule)
        if (patterns.len()) remaining.push({ from = folder, to = dest, include = clone patterns })
        if (remaining.len()) parent.files <- remaining
        else if ("files" in parent) delete parent.files
    }
    if (!next.windows.len()) delete next.windows
    return next
}
local function resource_overlap(value, folder, base_dir) {
    local raw = "resources" in value ? value.resources : [], result = []
    if (typeof(raw) == "string") raw = [raw]
    if (typeof(raw) != "array") return result
    local target = GLib.canonicalize_filename(folder, base_dir)
    foreach (path in raw) if (typeof(path) == "string") {
        local resource = GLib.canonicalize_filename(path, base_dir)
        if (resource == target || target.find(resource + "/") == 0 || resource.find(target + "/") == 0) result.push(path)
    }
    return result
}
local function languages(e) {
    local dialog = Gtk.Dialog.new(); dialog.set_title("Choose application languages"); dialog.set_transient_for(e.window); dialog.set_modal(true); dialog.set_default_size(620, 540)
    local body = W.padded(W.box()); dialog.get_content_area().append(W.scroll(body))
    body.append(W.heading("Bundle existing translations"))
    body.append(W.label("Choose a locale folder containing compiled translations, such as fr/LC_MESSAGES/app.mo. The app must load gettext catalogs from share/locale in its package. This does not translate the app or change the English NSIS installer."))
    local initial = "locale", rules = e.document.get(["files"])
    if (typeof(rules) == "array") foreach (rule in rules)
        if (typeof(rule) == "table" && "from" in rule && simple(rule, rule.from, "usr/share/locale")) { initial = rule.from; break }
    local folder = W.entry(initial), row = W.box(false); row.append(folder)
    local list = W.box(), status = W.label("Choose a folder, then Find languages."), checks = {}, scanned = null
    local scan_folder = function() {
        try {
            local path = strip(folder.get_text()); if (path == "") throw "Choose a locale folder first."
            local codes = scan(GLib.canonicalize_filename(path, e.base_dir)), active = selected(e.document.get([]), path)
            W.clear(list); checks = {}; scanned = path
            local names = { en = "English", fr = "French", de = "German", es = "Spanish", it = "Italian", pt = "Portuguese", ja = "Japanese", zh_CN = "Chinese (Simplified)", ru = "Russian" }
            foreach (code in codes) {
                local check = Gtk.CheckButton.new_with_label((code in names ? names[code] + " — " : "") + code)
                check.set_active(active.find(code) != null); checks[code] <- check; list.append(check); e.widgets["languages." + code] <- check
            }
            status.set_text(codes.len() ? "Select languages to bundle. Linux: usr/share/locale; Windows: share/locale. Existing custom file rules stay in place." : "No compiled translations found. Compile your .po files to .mo catalogs first, or choose another locale folder.")
            local overlap = resource_overlap(e.document.get([]), path, e.base_dir)
            if (overlap.len()) {
                local message = status.get_text() + "\n\nAlready included as resources: "
                foreach (i, resource in overlap) message += (i ? ", " : "") + resource
                status.set_text(message + ". Unchecked languages may still be bundled there. These choices only control the additional gettext copies; manage existing resource folders in Files.")
            }

        } catch (error) { scanned = null; status.set_text("Could not read translations: " + error.tostring()) }
    }
    row.append(W.button("Choose folder…", function() { W.choose(dialog, Gtk.FileChooserAction.select_folder, e.base_dir, function(path) {
        local relative = Gio.File.new_for_path(e.base_dir).get_relative_path(Gio.File.new_for_path(path)); folder.set_text(relative == null ? path : relative); scan_folder()
    }) }))
    body.append(row); local find = W.button("Find languages", scan_folder); body.append(find); body.append(status); body.append(list)
    dialog.add_button("Cancel", Gtk.ResponseType.cancel); local apply = dialog.add_button("Apply languages", Gtk.ResponseType.apply)
    dialog.connect("response", function(response) {
        if (response != Gtk.ResponseType.apply) { dialog.destroy(); return }
        try {
            if (scanned == null || strip(folder.get_text()) != scanned) throw "Find languages in the selected folder before applying."
            local codes = []; foreach (code, check in checks) if (check.get_active()) codes.push(code); codes.sort()
            e.document.set([], write_languages(e.document.get([]), scanned, codes)); dialog.destroy(); e.refresh()
        } catch (error) { status.set_text(error.tostring()) }
    })
    foreach (key, widget in {folder=folder, find=find, apply=apply, status=status}) e.widgets["languages." + key] <- widget
    dialog.present()
    if (Gio.File.new_for_path(GLib.canonicalize_filename(initial, e.base_dir)).query_exists(null)) scan_folder()
}
local function render(e) {
    e.content.append(W.heading("Application theme"))
    e.content.append(W.label("Choose the GTK theme requested by the packaged app. Adwaita is built into GTK. Custom themes must be bundled separately; apps using their own styling may ignore this setting."))
    local value = e.document.get(["gtk_theme"]), choices = [null, "Adwaita", "Adwaita:dark"], selection = 0
    if (value != null) { selection = choices.find(value); if (selection == null) selection = 3 }
    local picker = W.dropdown(["Automatic — let GTK choose", "Adwaita — light", "Adwaita — dark", "Custom theme"]), custom = W.entry(typeof(value) == "string" ? value : "")
    picker.set_selected(selection); custom.set_placeholder_text("Installed GTK theme name"); custom.set_visible(selection == 3)
    picker.connect("notify::selected", function(_property, ...) { custom.set_visible(picker.get_selected() == 3) })
    e.content.append(picker); e.content.append(custom)
    local apply = W.button("Apply theme", function() { e.safe(function() {
        local index = picker.get_selected()
        if (index == 0) e.document.unset(["gtk_theme"])
        else { local theme = index == 3 ? strip(custom.get_text()) : choices[index]; if (theme == "") throw "Enter a custom theme name."; e.document.set(["gtk_theme"], theme) }
        e.refresh()
    }) }); e.content.append(apply)
    e.content.append(W.label("Windows and platform overrides in Advanced take precedence. Existing dark preference, icon theme and font settings are preserved there."))
    e.content.append(W.heading("Application languages"))
    e.content.append(W.label("Select which existing gettext translations to include in your packages. The application chooses the language at runtime."))
    local rules = e.document.get(["files"])
    if (typeof(rules) == "array") foreach (rule in rules)
        if (typeof(rule) == "table" && "from" in rule && simple(rule, rule.from, "usr/share/locale")) {
            local summary = "Bundled from " + rule.from + ": "
            foreach (i, code in selected(e.document.get([]), rule.from)) summary += (i ? ", " : "") + code
            e.content.append(W.label(summary))
        }
    local button = W.button("Choose languages…", function() { languages(e) }); e.content.append(button)
    e.widgets["common.theme"] <- picker; e.widgets["common.theme.custom"] <- custom; e.widgets["common.theme.apply"] <- apply; e.widgets["common.languages"] <- button
}
return { render = render, scan = scan, selected = selected, write_languages = write_languages, resource_overlap = resource_overlap }
