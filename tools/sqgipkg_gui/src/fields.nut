// C-EDIT-01/03: recursive typed edits write only through the document contract.
local Gtk = import("Gtk", "4.0")
local GLib = import("GLib")
local Gio = import("Gio")
local W = import("widgets.nut")
local D = import("document.nut")
local C = import("catalog.nut")

class FieldEditor {
    document = null
    parent = null
    on_change = null
    base_dir = null
    dialogs = null
    controls = null
    constructor(doc, window, directory, changed) {
        document = doc; parent = window; base_dir = directory; on_change = changed
        dialogs = []; controls = {}
    }
    function edit(path, spec = null) {
        if (!document.valid) throw "Fix JSON syntax before editing fields"
        if (spec == null) spec = C.path_schema(path)
        local self = this
        local path_base = base_dir, ancestor = []
        foreach (part in path) {
            ancestor.push(part)
            if (typeof(part) == "integer" && ancestor.len() >= 2 && ["native", "native_projects", "native_dependencies", "build_dependencies"].find(ancestor[ancestor.len() - 2]) != null) {
                local project = document.get(ancestor)
                if (typeof(project) == "table" && "dir" in project) path_base = GLib.canonicalize_filename(project.dir, base_dir)
            }
        }
        // A native project's dir is itself manifest-relative.
        if (path.len() && path.top() == "dir") path_base = base_dir
        local dialog = Gtk.Dialog.new(); dialog.set_title(D.path_label(path))
        dialog.set_transient_for(parent); dialog.set_modal(true); dialog.set_default_size(640, 520)
        dialog.add_button("Done", Gtk.ResponseType.close)
        local body = W.padded(W.box()), error = W.label("")
        dialog.get_content_area().append(W.scroll(body)); dialog.get_content_area().append(error)
        dialogs.push(dialog)
        local redraw = null
        local mutate = function(action) {
            try { action(); self.on_change(); error.set_text(""); redraw() } catch (e) { error.set_text("Error: " + e) }
        }
        redraw = function() {
            W.clear(body)
            local present = self.document.has(path), value = self.document.get(path)
            body.append(W.label(D.path_label(path) + (present ? " — configured" : " — unset (sqgipkg default)")))
            local variants = C.variants(spec), typebar = W.box(false)
            foreach (variant in variants) {
                local part = variant
                typebar.append(W.button("Use " + ("type" in part ? part.type : "string"), function() {
                    mutate(function() { self.document.set(path, C.initial(part)) })
                }))
            }
            typebar.append(W.button("Null", function() { mutate(function() { self.document.set(path, null) }) }))
            typebar.append(W.button("Unset", function() { mutate(function() { self.document.unset(path) }) }))
            body.append(typebar)
            if (!present || value == null) { body.append(W.label("Choose a value type above to configure this setting. Null is retained literally; Check reports whether sqgipkg accepts it here.")); return }
            local selected = C.select(spec, value), kind = C.kind(value)
            if (kind == "object") {
                local properties = "properties" in selected ? selected.properties : {}
                local keys = []
                foreach (key, _ in properties) keys.push(key)
                foreach (key, _ in value) if (!(key in properties)) keys.push(key)
                keys.sort()
                local def = C.definition(spec)
                // Limit rendered rows while keeping every field/item reachable.
                foreach (key in keys) {
                    local field = key, child = clone path; child.push(field)
                    local child_spec = field in properties ? properties[field] : ("additionalProperties" in selected && typeof(selected.additionalProperties) == "table" ? selected.additionalProperties : {})
                    local meta = C.info(def == null ? "" : def, field)
                    local row = W.box(false), title = W.label(meta.label + "  [" + field + "]" + (field in value ? " • configured" : " • default"))
                    title.set_hexpand(true); title.set_tooltip_text(meta.help); row.append(title)
                    local edit_button = W.button(field in value ? "Edit" : "Set…", function() { self.edit(child, child_spec) })
                    controls[D.path_label(child)] <- edit_button
                    row.append(edit_button)
                    row.append(W.button("Reset", function() { mutate(function() { self.document.unset(child) }) }))
                    body.append(row)
                }
                if (!("additionalProperties" in selected) || selected.additionalProperties != false) {
                    local row = W.box(false), keyentry = W.entry(); keyentry.set_placeholder_text("New map key")
                    row.append(keyentry)
                    row.append(W.button("Add key", function() {
                        local key = keyentry.get_text()
                        if (key == "") { error.set_text("Enter a key name"); return }
                        local child = clone path; child.push(key)
                        if (self.document.has(child)) { error.set_text("That key already exists"); return }
                        local child_spec = "additionalProperties" in selected && typeof(selected.additionalProperties) == "table" ? selected.additionalProperties : { type = "string" }
                        mutate(function() { self.document.set(child, C.initial(child_spec)) })
                        self.edit(child, child_spec)
                    }))
                    body.append(row)
                }
            } else if (kind == "array") {
                local item_spec = "items" in selected ? selected.items : { type = "string" }
                local start = W.entry("0"), range = W.box(false)
                range.append(W.label("First item (100 per page)")); range.append(start)
                local rows = W.box()
                local draw_items = null
                draw_items = function() {
                    W.clear(rows)
                    local offset = 0
                    try { offset = start.get_text().tointeger() } catch (_) {}
                    if (offset < 0) offset = 0
                    for (local i = offset; i < value.len() && i < offset + 100; i++) {
                        local index = i, child = clone path; child.push(index)
                        local row = W.box(false), preview = D.pretty(value[index])
                        if (GLib.utf8_strlen(preview, -1) > 100) preview = GLib.utf8_substring(preview, 0, 100) + "…"
                        local title = W.label(index + ": " + preview); title.set_hexpand(true); row.append(title)
                        row.append(W.button("Edit", function() { self.edit(child, item_spec) }))
                        row.append(W.button("↑", function() { if (index > 0) mutate(function() { local items = self.document.get(path); local item = items.remove(index); items.insert(index - 1, item); self.document.set(path, items) }) }))
                        row.append(W.button("↓", function() { mutate(function() { local items = self.document.get(path); if (index + 1 < items.len()) { local item = items.remove(index); items.insert(index + 1, item); self.document.set(path, items) } }) }))
                        row.append(W.button("Remove", function() { mutate(function() { self.document.unset(child) }) }))
                        rows.append(row)
                    }
                }
                range.append(W.button("Go", function() { draw_items() })); body.append(range); body.append(rows); draw_items()
                local add = W.button("Add item", function() {
                    local child = clone path; child.push(self.document.get(path).len())
                    mutate(function() { self.document.set(child, C.initial(item_spec)) })
                    self.edit(child, item_spec)
                }); body.append(add); controls[D.path_label(path) + ".add"] <- add
            } else {
                local input = kind == "boolean" ? W.dropdown(["False", "True"]) : W.entry(value.tostring())
                if (kind == "boolean") input.set_selected(value ? 1 : 0)
                controls[D.path_label(path) + ".value"] <- input
                local title = W.label("Value (" + kind + ")"); title.set_mnemonic_widget(input); body.append(title); body.append(input)
                local apply = W.button("Apply value", function() {
                    mutate(function() {
                        local setting = kind == "boolean" ? input.get_selected() == 1 : input.get_text()
                        if (kind == "integer" || kind == "number") {
                            setting = sqgi.json.parse(setting)
                            if (typeof(setting) != "integer" && typeof(setting) != "float") throw "Enter a JSON number"
                            if (kind == "integer" && typeof(setting) != "integer") throw "Enter an integer"
                        }
                        self.document.set(path, setting)
                    })
                }); body.append(apply); controls[D.path_label(path) + ".apply"] <- apply
                if (kind == "string") {
                    local browse = W.box(false)
                    foreach (directory in [false, true]) {
                        local is_dir = directory
                        browse.append(W.button(is_dir ? "Choose folder…" : "Choose file…", function() {
                            W.choose(dialog, is_dir ? Gtk.FileChooserAction.select_folder : Gtk.FileChooserAction.open, path_base, function(filename) {
                                local relative = Gio.File.new_for_path(path_base).get_relative_path(Gio.File.new_for_path(filename))
                                input.set_text(relative == null ? filename : relative)
                            })
                        }))
                    }
                    body.append(browse)
                    body.append(W.label("Host input paths are relative to the manifest directory unless this field belongs to a native project. Package destinations and commands are literal values."))
                }
            }
        }
        dialog.connect("response", function(_) { dialog.destroy(); self.on_change() })
        redraw(); dialog.present()
        return dialog
    }
}
return { FieldEditor = FieldEditor }
