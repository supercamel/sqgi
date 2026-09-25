// C-EDIT: author manifests; C-PKG-06: inspect exclusively through sqgipkg.
local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local GLib = import("GLib")
local W = import("widgets.nut")
local D = import("document.nut")
local C = import("catalog.nut")
local F = import("fields.nut")
local B = import("backend.nut")

class Application {
    app = null
    window = null
    document = null
    base_dir = null
    fields = null
    inspection = null
    capabilities = null
    widgets = null
    section = "Application"
    content = null
    status = null
    search = null
    advanced = null
    json_view = null
    rendering = false
    last_result = null
    closing = false
    constructor(application, filename = null) {
        app = application; widgets = {}; inspection = B.Inspection()
        document = filename == null ? D.Document() : D.open_document(filename)
        base_dir = filename == null ? GLib.get_current_dir() : GLib.path_get_dirname(document.path)
        this.build_window()
        this.attach_document()
        local self = this
        inspection.run("describe", "", base_dir).then(function(result) {
            self.capabilities = result
            self.update_status("Ready. Create a manifest or open an existing project.")
        }).catch(function(e) { self.update_status("Error: " + e) })
    }
    function build_window() {
        local self = this
        window = Gtk.ApplicationWindow.new(app); window.set_title("SQGI Manifest Studio")
        window.set_default_size(1050, 760)
        local root = W.padded(W.box()); window.set_child(root)
        local toolbar = W.box(false)
        local actions = [
            ["New", function() { self.guard(function() { self.new_project() }) }],
            ["Open…", function() { self.guard(function() { self.open_dialog() }) }],
            ["Save", function() { self.save() }],
            ["Save As…", function() { self.save(true) }],
            ["Undo", function() { self.document.undo(); self.refresh() }],
            ["Redo", function() { self.document.redo(); self.refresh() }]
        ]
        foreach (action in actions) {
            local name = action[0], callback = action[1]
            widgets[name] <- W.button(name, function() { self.safe(callback) }); toolbar.append(widgets[name])
        }
        root.append(toolbar)
        local headline = W.label("SQGI Manifest Studio"); headline.add_css_class("title-1"); root.append(headline)
        root.append(W.label("Create a useful sqgipkg.json, then package it with sqgipkg."))
        local searchbar = W.box(false)
        search = W.entry(); search.set_placeholder_text("Search fields by name or schema key…")
        advanced = Gtk.CheckButton.new_with_label("Show advanced fields")
        searchbar.append(search); searchbar.append(advanced); root.append(searchbar)
        search.connect("changed", function() { self.render_content() })
        advanced.connect("toggled", function() { self.render_content() })
        local layout = Gtk.Paned.new(Gtk.Orientation.horizontal)
        local navigation = W.box()
        foreach (name in C.sections) {
            local section_name = name
            navigation.append(W.button(name, function() { self.navigate(section_name) }))
        }
        layout.set_start_child(navigation); layout.set_resize_start_child(false)
        content = W.padded(W.box()); layout.set_end_child(W.scroll(content)); layout.set_vexpand(true)
        root.append(layout)
        status = W.label(""); status.set_selectable(true); root.append(status)
        window.connect("close-request", function() {
            if (self.closing) return false
            self.guard(function() { self.closing = true; self.window.close() })
            return true
        })
        window.present()
    }
    function safe(action) { try { action() } catch (e) { this.update_status("Error: " + e) } }
    function attach_document() {
        local self = this
        fields = F.FieldEditor(document, window, base_dir, function() { self.refresh() })
        last_result = null; this.refresh()
    }
    function update_status(message = null) {
        local name = document.path == null ? "Unsaved manifest" : document.path
        status.set_text((document.dirty ? "Modified • " : "Saved • ") + name + "\n" +
            (!document.valid ? "JSON error: " + document.error : message == null ? "Project paths are relative to " + base_dir : message))
        widgets.Save.set_sensitive(document.valid)
        widgets["Save As…"].set_sensitive(document.valid)
        widgets.Undo.set_sensitive(document.history.len() > 0)
        widgets.Redo.set_sensitive(document.future.len() > 0)
    }
    function refresh() { this.render_content(); this.update_status() }
    function navigate(name) { section = name; search.set_text(""); this.render_content() }
    function guard(action) {
        local self = this
        if (inspection.busy) {
            W.question(window, "Inspection in progress", "Cancel local inspection before continuing?", ["Stay", "Cancel inspection"], function(choice) {
                if (choice == 1) { self.inspection.cancel(); self.update_status("Cancelling inspection; retry after it finishes.") }
            }); return
        }
        if (!document.dirty || (document.path == null && document.history.len() == 0 && document.text == "{}")) { action(); return }
        W.question(window, "Unsaved manifest", "Save your changes before continuing?", ["Cancel", "Discard", "Save"], function(choice) {
            if (choice == 1) action()
            else if (choice == 2) self.save(false, action)
        })
    }
    function open_dialog() {
        local self = this
        W.choose(window, Gtk.FileChooserAction.open, base_dir, function(path) { self.safe(function() { self.open_path(path) }) })
    }
    function open_path(path) {
        local opened = D.open_document(path)
        document = opened; base_dir = GLib.path_get_dirname(document.path); section = "Application"
        this.attach_document()
    }
    function save(as_copy = false, after = null) {
        local self = this
        if (!document.valid) { this.update_status("Fix JSON syntax before saving."); return }
        if (!as_copy && document.path != null) {
            this.safe(function() { self.document.save(); self.refresh(); if (after != null) after() }); return
        }
        local suggested = document.path == null ? GLib.build_filenamev([base_dir, "sqgipkg.json"]) : document.path
        W.choose(window, Gtk.FileChooserAction.save, suggested, function(path) {
            local write = function(policy) { self.safe(function() {
                self.document.save(path, policy); self.base_dir = GLib.path_get_dirname(path); self.attach_document()
                if (after != null) after()
            }) }
            if (GLib.path_get_dirname(path) != self.base_dir) {
                local preview = null, explanation = ""
                try { preview = self.document.relocation_preview(path); explanation = "Proposed path changes:\n" + D.pretty(preview.changes) }
                catch (e) { explanation = e.tostring() }
                local choices = ["Cancel", "Save literal copy"]
                if (preview != null) choices.push("Rebase paths and save")
                W.question(self.window, "Save in another directory", "Relative paths will start at:\n" + GLib.path_get_dirname(path) +
                    "\nA literal copy keeps all authored values and may change their meaning.\n\n" + explanation, choices, function(choice) {
                    if (choice == 1) write("literal")
                    if (choice == 2) { self.document.edit_json(preview.text); write("literal") }
                })
            } else write(null)
        })
    }
    function render_content() {
        if (rendering) return
        rendering = true
        W.clear(content); json_view = null
        local self = this, query = search.get_text().tolower()
        if (section == "Manifest" && query == "") {
            content.append(W.label("Manifest JSON — invalid drafts remain editable and undoable. Unknown fields are preserved."))
            json_view = W.textview(document.text, true); json_view.set_vexpand(true)
            local view = json_view
            content.append(W.scroll(view))
            local edit_depth = 0
            local apply_draft = function() {
                if (!self.rendering) { self.document.edit_json(W.contents(view)); self.last_result = null; self.update_status() }
            }
            view.get_buffer().connect("begin-user-action", function() { edit_depth++ })
            view.get_buffer().connect("end-user-action", function() { edit_depth--; if (edit_depth == 0) apply_draft() })
            view.get_buffer().connect("changed", function() { if (edit_depth == 0) apply_draft() })
            content.append(W.label("Changes since last save"))
            local changes = ""
            try { changes = D.pretty(document.changes()) } catch (_) { changes = "The original file contains invalid JSON; save a corrected document to establish a baseline." }
            content.append(W.label(changes))
        } else if (section == "Review" && query == "") this.render_review()
        else {
            content.append(W.label(query == "" ? section : "Matching fields (including advanced)"))
            if (!document.valid) content.append(W.label("Fix the invalid draft in Manifest before editing fields."))
            local properties = C.schema["$defs"].manifest.properties
            local ordered = []
            foreach (key, _ in properties) ordered.push(key)
            ordered.sort()
            foreach (key in ordered) {
                local field = key, field_spec = properties[key], meta = C.info("manifest", field)
                local matches = query != "" && (field.tolower().find(query) != null || meta.label.tolower().find(query) != null)
                // Nested keys are searchable through their root object, without flattening authored paths.
                if (query != "" && !matches) matches = sqgi.json.stringify(C.resolve(field_spec)).tolower().find(query) != null
                if (query != "" ? !matches : meta.section != section || (!advanced.get_active() && !meta.common && !document.has([field]))) continue
                local preview = document.has([field]) ? sqgi.json.stringify(document.get([field])) : "Default / unset"
                if (GLib.utf8_strlen(preview, -1) > 100) preview = GLib.utf8_substring(preview, 0, 100) + "…"
                local row = W.box(false), title = W.label(meta.label + "  [" + field + "]\n" + preview)
                title.set_hexpand(true); title.set_tooltip_text(meta.help); row.append(title)
                local edit = W.button(document.has([field]) ? "Edit…" : "Set…", function() { self.safe(function() { self.fields.edit([field], field_spec) }) })
                edit.set_sensitive(document.valid); widgets["field." + field] <- edit; row.append(edit)
                local reset = W.button("Reset", function() { self.safe(function() { self.document.unset([field]); self.last_result = null; self.refresh() }) })
                reset.set_sensitive(document.valid && document.has([field])); row.append(reset)
                content.append(row)
            }
            if (section == "Runtime/native code") content.append(W.label("New runtime recipes use LLVM JIT and typed kernels. Existing explicit overrides remain available in advanced fields."))
        }
        rendering = false
    }
    function render_review() {
        local self = this, buttons = W.box(false)
        foreach (action in ["check", "explain"]) {
            local command = action
            local button = W.button(action == "check" ? "Check manifest" : "Explain effective settings", function() { self.inspect(command) })
            button.set_sensitive(document.valid && !inspection.busy); widgets[action] <- button; buttons.append(button)
        }
        local cancel = W.button("Cancel inspection", function() { self.inspection.cancel() }); cancel.set_sensitive(inspection.busy); buttons.append(cancel)
        content.append(buttons)
        content.append(W.label("Inspection uses sqgipkg locally. Your application and build hooks are not executed."))
        local command_path = document.path == null ? GLib.build_filenamev([base_dir, "sqgipkg.json"]) : document.path
        local command = B.printable(B.command("build", command_path))
        content.append(W.label("After saving, run from the project directory:\n" + command))
        content.append(W.button("Copy packaging command", function() { self.window.get_clipboard().set_text(command); self.update_status("Copied command for your terminal.") }))
        if (capabilities != null) content.append(W.label("Editor runtime: SQGI " + capabilities.runtime.sqgi_version +
            ", JIT " + (capabilities.runtime.jit ? "enabled" : "disabled") + ", kernels " + capabilities.runtime.kernel_backend +
            ". This describes the editor runtime, not an existing runtime selected for packaging."))
        if (last_result != null) {
            local stale = last_result.text != document.text || last_result.base_dir != base_dir
            content.append(W.label(stale ? "Results are out of date; inspect the current manifest again." : last_result.result.ok ? "Inspection passed" : "Inspection found errors"))
            if ("diagnostics" in last_result.result) foreach (diagnostic in last_result.result.diagnostics) {
                local item = diagnostic
                local row = W.box(false), label = W.label(item.severity.toupper() + ": " + item.message); label.set_hexpand(true); row.append(label)
                if (item.path.len()) row.append(W.button("Edit field…", function() { self.safe(function() { self.fields.edit(item.path) }) }))
                content.append(row)
            }
            if ("configurations" in last_result.result) foreach (plan in last_result.result.configurations) {
                content.append(W.label(plan.name + " → " + plan.target + " / " + plan.architecture + "\nEntry: " + plan.entry + "\nOutput: " + plan.output))
                foreach (feature in [["gtk4", "used_gtk"], ["gstreamer", "used_gst"], ["gdk-pixbuf", "used_gdk_pixbuf"], ["soup3", "used_soup"]]) {
                    local feature_name = feature[0]
                    if (plan.discovery[feature[1]]) {
                        local authored = document.get(["features"])
                        if (typeof(authored) != "array" || authored.find(feature_name) == null) {
                            content.append(W.button("Declare detected feature: " + feature_name, function() { self.safe(function() {
                                local values = self.document.get(["features"])
                                if (values == null) values = []
                                if (typeof(values) != "array") throw "Correct features to an array before adding a suggestion"
                                if (values.find(feature_name) == null) values.push(feature_name)
                                self.document.set(["features"], values); self.refresh()
                            }) }))
                        }
                    }
                }
                local details = Gtk.Expander.new("Effective plan and discovery evidence (read only)")
                details.set_child(W.label(D.pretty(plan))); content.append(details)
            }
        }
        local reference = Gtk.Expander.new("CLI options — use these in a terminal; they are not added to the manifest")
        local listing = W.box()
        local keys = []; foreach (key, _ in C.metadata.cli) keys.push(key); keys.sort()
        foreach (key in keys) listing.append(W.label("--" + key + " (" + C.metadata.cli[key].classification + ")\n" + C.metadata.cli[key].description))
        reference.set_child(listing); content.append(reference)
    }
    function inspect(action) {
        if (!document.valid || inspection.busy) return
        local self = this, snapshot = document.text, directory = base_dir
        inspection.run(action, snapshot, directory).then(function(result) {
            self.last_result = { text = snapshot, base_dir = directory, result = result }
            self.render_content(); self.update_status(result.ok ? "Inspection finished." : "Inspection found errors; see Review.")
        }).catch(function(e) { self.render_content(); self.update_status("Inspection: " + e) })
        this.render_content(); this.update_status("Inspecting with sqgipkg…")
    }
    function new_project() {
        if (capabilities == null) { this.update_status("Wait for sqgipkg capabilities, or fix the reported startup error."); return }
        local self = this, step = 0, candidate = null
        local dialog = Gtk.Dialog.new(); dialog.set_title("Create a sqgipkg manifest"); dialog.set_transient_for(window); dialog.set_modal(true); dialog.set_default_size(640, 540)
        dialog.add_button("Cancel", Gtk.ResponseType.cancel)
        local body = W.padded(W.box()), controls = W.box(false), error = W.label("")
        dialog.get_content_area().append(body); dialog.get_content_area().append(error); dialog.get_content_area().append(controls)
        local directory = W.entry(base_dir), names = ["simple", "gtk4", "gtk4-gstreamer", "native-gobject", "native-vala"], template = W.dropdown(names)
        template.set_selected(1)
        local name = W.entry("My application"), entry = W.entry("main.nut"), output = W.entry("dist")
        local targets = ["appimage", "win-dir", "win-nsis", "all"], target = W.dropdown(targets)
        if (capabilities.host == "windows") target.set_selected(1)
        local redraw = null
        local next = W.button("Next", function() {
            try {
                if (step == 0) {
                    if (!GLib.path_is_absolute(directory.get_text()) || !Gio.File.new_for_path(directory.get_text()).query_exists(null)) throw "Choose an existing absolute project directory"
                    candidate = D.Document(D.pretty(self.capabilities.templates[names[template.get_selected()]]))
                }
                if (step == 1) {
                    if (name.get_text() == "" || entry.get_text() == "") throw "Enter an application name and entry script"
                    candidate.set(["name"], name.get_text()); candidate.set(["entry"], entry.get_text())
                }
                if (step == 2) { candidate.set(["target"], targets[target.get_selected()]); candidate.set(["output"], output.get_text()) }
                if (step == 3) {
                    candidate.save(GLib.build_filenamev([directory.get_text(), "sqgipkg.json"]))
                    self.document = candidate; self.base_dir = directory.get_text(); self.section = "Application"; self.attach_document(); dialog.destroy(); return
                }
                step++; error.set_text(""); redraw()
            } catch (e) { error.set_text("Error: " + e) }
        })
        local back = W.button("Back", function() { if (step > 0) { step--; redraw() } })
        controls.append(back); controls.append(next)
        widgets["wizard.error"] <- error; widgets["wizard.next"] <- next; widgets["wizard.directory"] <- directory; widgets["wizard.name"] <- name; widgets["wizard.entry"] <- entry
        redraw = function() {
            W.clear(body); back.set_sensitive(step > 0); next.set_label(step == 3 ? "Create manifest" : "Next")
            body.append(W.label((step + 1) + " of 4 — " + ["Project", "Application", "Outputs", "Review and save"][step]))
            if (step == 0) {
                body.append(W.label("Project directory (contains your script and the new sqgipkg.json)")); body.append(directory)
                body.append(W.button("Choose folder…", function() { W.choose(dialog, Gtk.FileChooserAction.select_folder, directory.get_text(), function(path) { directory.set_text(path) }) }))
                body.append(W.label("Starting template")); body.append(template)
            } else if (step == 1) {
                body.append(W.label("Application name")); body.append(name)
                body.append(W.label("Main Squirrel script, relative to the project directory")); body.append(entry)
                body.append(W.button("Choose script…", function() { W.choose(dialog, Gtk.FileChooserAction.open, directory.get_text(), function(path) {
                    local relative = Gio.File.new_for_path(directory.get_text()).get_relative_path(Gio.File.new_for_path(path)); entry.set_text(relative == null ? path : relative)
                }) }))
            } else if (step == 2) {
                body.append(W.label("Default package target")); body.append(target)
                body.append(W.label("Output directory")); body.append(output)
                body.append(W.label("LLVM JIT and typed kernels are standard. Advanced target, runtime and native project settings can be edited after creation."))
            } else {
                body.append(W.label("Save to " + GLib.build_filenamev([directory.get_text(), "sqgipkg.json"]) + "\nAn existing file is never overwritten. You can validate and refine this draft in the editor."))
                body.append(W.label(candidate.text))
            }
        }
        dialog.connect("response", function(_) { dialog.destroy() })
        redraw(); dialog.present()
    }
}
return { Application = Application }
