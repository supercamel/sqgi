// C-EDIT: author manifests; C-PKG-06: inspect exclusively through sqgipkg.
local Gtk = import("Gtk", "4.0")
local Gdk = import("Gdk", "4.0")
local Gio = import("Gio")
local GLib = import("GLib")
local W = import("widgets.nut")
local D = import("document.nut")
local C = import("catalog.nut")
local F = import("fields.nut")
local B = import("backend.nut")
local J = import("jobs.nut")
local Artifacts = import("artifacts.nut")
local G = import("guidance.nut")
local O = import("outputs.nut")
local N = import("native_application.nut")
local L = import("native_library.nut")
local Common = import("common.nut")

class Application {
    app = null
    window = null
    document = null
    base_dir = null
    fields = null
    inspection = null
    build_job = null
    build_dialog = null
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
    results = null
    welcome = false
    closing = false
    constructor(application, filename = null) {
        app = application; widgets = {}; inspection = B.Inspection(); build_job = J.Build()
        document = filename == null ? D.Document() : D.open_document(filename)
        welcome = filename == null
        base_dir = filename == null ? GLib.get_current_dir() : GLib.path_get_dirname(document.path)
        this.build_window()
        this.attach_document()
        local self = this
        inspection.run("describe", "", base_dir).then(function(result) {
            self.capabilities = result
            self.render_content()
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
        widgets.toolbar <- toolbar
        local headline = W.label("SQGI Manifest Studio"); headline.add_css_class("title-1"); root.append(headline)
        root.append(W.label("Describe your application, check the choices, and save a packaging manifest."))
        local searchbar = W.box(false)
        search = W.entry(); search.set_placeholder_text("Find a setting — for example installer, runtime, or a schema key…")
        searchbar.append(search); root.append(searchbar)
        widgets.searchbar <- searchbar
        search.connect("changed", function() { self.render_content() })
        local layout = Gtk.Paned.new(Gtk.Orientation.horizontal)
        local navigation = W.box()
        foreach (name in C.sections) {
            local section_name = name
            navigation.append(W.button(name == "Appearance/installer" ? "Appearance / languages" : name, function() { self.navigate(section_name) }))
        }
        layout.set_start_child(navigation); layout.set_resize_start_child(false)
        widgets.navigation <- navigation
        content = W.padded(W.box()); layout.set_end_child(W.scroll(content)); layout.set_vexpand(true)
        root.append(layout)
        status = W.label(""); status.set_selectable(true); root.append(status)
        window.connect("close-request", function() {
            if (self.closing) return false
            self.guard(function() {
                self.closing = true
                // Let the original close-request finish before issuing the guarded close.
                GLib.idle_add(GLib.PRIORITY_DEFAULT_IDLE, function() { self.window.close(); return false })
            })
            return true
        })
        window.present()
    }
    function safe(action) { try { action() } catch (e) { this.update_status("Error: " + e) } }
    function attach_document() {
        local self = this
        fields = F.FieldEditor(document, window, base_dir, function() { self.refresh() })
        last_result = null; results = { check = null, explain = null }; this.refresh()
    }
    function update_status(message = null) {
        local name = document.path == null ? "Unsaved manifest" : document.path
        status.set_text((document.dirty ? "Modified • " : "Saved • ") + name + "\n" +
            (!document.valid ? "JSON error: " + document.error : message == null ? "Project paths are relative to " + base_dir : message))
        if (welcome) status.set_text(message == null ? "Choose a project to begin." : message)
        widgets.Save.set_sensitive(document.valid)
        widgets["Save As…"].set_sensitive(document.valid)
        widgets.Undo.set_sensitive(document.history.len() > 0)
        widgets.Redo.set_sensitive(document.future.len() > 0)
    }
    function refresh() { this.render_content(); this.update_status() }
    function navigate(name) { welcome = false; section = name; search.set_text(""); this.render_content() }
    function fix_setting(path) {
        if (path.len() >= 2 && path[0] == "native" && typeof(path[1]) == "integer") {
            local value = document.get([]), recipes = document.get(["native"]), index = path[1]
            local common_field = path.len() == 2 ||
                (path.len() == 3 && ["name", "dir", "repo", "ref", "build_system", "windows_package", "gi"].find(path[2]) != null) ||
                (path.len() == 4 && path[2] == "gi" && ["namespace", "version", "library"].find(path[3]) != null)
            if (common_field && typeof(recipes) == "array" && index >= 0 && index < recipes.len() &&
                    L.read(recipes[index]) != null && !L.application_recipe(value, recipes[index])) {
                this.navigate("Runtime/native code")
                Common.Common(this).library_dialog(index)
                return
            }
        }
        fields.edit(path)
    }
    function guard(action) {
        if (build_job.busy) {
            this.update_status("A build is running. Cancel it in the build window before continuing.")
            if (build_dialog != null) build_dialog.present()
            return
        }
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
        document = opened; base_dir = GLib.path_get_dirname(document.path); section = "Application"; welcome = false
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
        foreach (key in ["toolbar", "searchbar", "navigation"]) widgets[key].set_visible(!welcome)
        if (welcome && query == "") {
            content.append(W.heading("Make your project ready to package"))
            content.append(W.label("Choose your script or native application, where it should run, and any extra files it needs. We will save these choices in sqgipkg.json. Review lets you check your choices and build packages with sqgipkg."))
            local start = W.button("Set up a project", function() { self.safe(function() { self.new_project() }) })
            start.add_css_class("suggested-action")
            start.set_sensitive(capabilities != null); content.append(start); widgets["welcome.new"] <- start
            content.append(W.button("Open a manifest…", function() { self.safe(function() { self.open_dialog() }) }))
        } else if (section == "Manifest" && query == "") {
            content.append(W.label("Manifest JSON — invalid drafts remain editable and undoable. Unknown fields are preserved."))
            json_view = W.textview(document.text, true); json_view.set_vexpand(true)
            local view = json_view
            content.append(W.scroll(view))
            local edit_depth = 0
            local apply_draft = function() {
                if (!self.rendering) { self.document.edit_json(W.contents(view)); self.update_status() }
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
            content.append(W.heading(query == "" ? (section == "Appearance/installer" ? "Appearance / languages" : section) : "Matching settings — Edit opens the field or its containing object"))
            if (!document.valid) content.append(W.label("Fix or undo the invalid JSON in Manifest before editing settings."))
            if (query == "" && document.valid) Common.Common(this).render(section)
            local rows = W.box(), count = 0, configured = 0
            local properties = C.schema["$defs"].manifest.properties
            local ordered = []
            foreach (key, _ in properties) ordered.push(key)
            ordered.sort()
            foreach (key in ordered) {
                local field = key, field_spec = properties[key], meta = C.info("manifest", field)
                local matches = query != "" && (field.tolower().find(query) != null || meta.label.tolower().find(query) != null || meta.help.tolower().find(query) != null)
                // Nested keys are searchable through their root object, without flattening authored paths.
                if (query != "" && !matches) matches = sqgi.json.stringify(C.resolve(field_spec)).tolower().find(query) != null
                if (query != "" && !matches) foreach (id, nested in C.metadata.fields) {
                    if ((id.tolower().find(query) != null || nested.label.tolower().find(query) != null || nested.help.tolower().find(query) != null) &&
                        C.contains_definition(field_spec, id.slice(0, id.find(".")))) matches = true
                }
                if (query != "" ? !matches : meta.section != section) continue
                count++; if (document.has([field])) configured++
                local preview = document.has([field]) ? sqgi.json.stringify(document.get([field])) : "Default / unset"
                if (GLib.utf8_strlen(preview, -1) > 100) preview = GLib.utf8_substring(preview, 0, 100) + "…"
                local row = W.box(false), title = W.label(meta.label + "  [" + field + "]\n" + preview)
                title.set_hexpand(true); title.set_tooltip_text(meta.help); row.append(title)
                local edit = W.button(document.has([field]) ? "Edit…" : "Set…", function() { self.safe(function() { self.fields.edit([field], field_spec) }) })
                edit.set_sensitive(document.valid); widgets["field." + field] <- edit; row.append(edit)
                local reset = W.button("Reset", function() { self.safe(function() { self.document.unset([field]); self.refresh() }) })
                reset.set_sensitive(document.valid && document.has([field])); row.append(reset)
                rows.append(row)
            }
            if (query != "") { content.append(rows); if (!count) content.append(W.label("No matching settings. Try a task name such as installer, files, or runtime.")) }
            else {
                local details = Gtk.Expander.new("Advanced configuration — " + configured + " configured, " + count + " available")
                local body = W.box(); body.append(W.label("Full manifest controls, including aliases and custom values. Reset removes an override; resolve the plan to see what sqgipkg uses afterwards.")); body.append(rows)
                details.set_child(body); content.append(details); widgets["advanced"] <- details
            }
        }
        rendering = false
    }
    function render_review() {
        local self = this, buttons = W.box(false)
        local native_app = document.get(["entry", "type"]) == "native"
        content.append(W.heading("Review your packaging manifest"))
        content.append(W.label("Check validates local inputs; Resolve plan explains the selected outputs. Neither builds a package. You can save a draft with unresolved issues."))
        foreach (action in ["check", "explain"]) {
            local command = action
            local button = W.button(action == "check" ? "Check project" : "Resolve plan", function() { self.inspect(command) })
            if (action == "check") button.add_css_class("suggested-action")
            button.set_sensitive(document.valid && !inspection.busy); widgets[action] <- button; buttons.append(button)
        }
        local cancel = W.button("Cancel inspection", function() { self.inspection.cancel() }); cancel.set_sensitive(inspection.busy); buttons.append(cancel)
        widgets["inspection.cancel"] <- cancel; content.append(buttons)
        local runtime = W.button(native_app ? "Configure native build…" : "Configure runtime…", function() { self.navigate("Runtime/native code") })
        runtime.set_sensitive(document.valid); widgets["review.runtime"] <- runtime; content.append(runtime)
        local ready = document.valid && document.path != null && !document.dirty
        content.append(W.label(ready ? "Manifest saved. Building may download dependencies and run your project’s build commands. Checks do not prove the finished package runs on another machine." :
            "Save this draft before copying a packaging command. Unsaved changes have not been written to disk."))
        local save = W.button("Save manifest", function() { self.save() }); save.set_sensitive(document.valid); content.append(save)
        if (ready) content.append(W.label("From the project directory:\n" + B.printable(B.command("build", document.path))))
        local build = W.button("Build selected packages…", function() { self.safe(function() { self.start_build() }) })
        build.add_css_class("suggested-action")
        build.set_sensitive(ready && !inspection.busy && !build_job.busy && build_job.available())
        widgets["review.build"] <- build; content.append(build)
        if (build_job.revision != null) {
            content.append(W.label("Last build: " + build_job.state + "\nManifest: " + build_job.revision.path))
            content.append(W.button("Show last build log…", function() { self.show_build(self.build_job.revision, false) }))
        }
        if (!build_job.available()) content.append(W.label("Build supervision is unavailable in this installation. Copy the command below to build in a terminal."))
        local copy = W.button("Copy packaging command", function() { self.safe(function() {
            local revision = self.document.build_revision()
            local command = B.printable(B.command("build", revision.path))
            local provider = Gdk.ContentProvider.new_for_bytes("text/plain;charset=utf-8", GLib.Bytes.new(command))
            if (!self.window.get_clipboard().set_content(provider)) throw "The clipboard could not accept the packaging command"
            self.update_status("Copied the command for the saved manifest. Run it from the project directory.")
        }) }); copy.set_sensitive(ready); widgets["review.copy"] <- copy; content.append(copy)
        local plan_record = null
        foreach (action in ["check", "explain"]) {
            local record = results[action], state = G.state(action, record, document, base_dir)
            local label = W.label((action == "check" ? "Validation: " : "Plan: ") + state)
            widgets["review." + action + ".state"] <- label; content.append(label)
            if (record == null || record.pending || record.error != null) continue
            local current = G.current(record, document, base_dir)
            local info = W.box(), info_count = 0
            if ("diagnostics" in record.result) foreach (diagnostic in record.result.diagnostics) {
                local item = diagnostic
                local row = W.box(false), message = W.label(item.severity.toupper() + ": " + item.message)
                message.set_hexpand(true); row.append(message)
                if (item.path.len()) {
                    local edit = W.button("Fix setting…", function() { self.safe(function() { self.fix_setting(item.path) }) })
                    edit.set_sensitive(document.valid && current); row.append(edit)
                }
                if (item.severity == "info") { info.append(row); info_count++ } else content.append(row)
            }
            if (info_count) { local details = Gtk.Expander.new("Checks performed — " + info_count); details.set_child(info); content.append(details) }
            if (current && "configurations" in record.result && record.result.configurations.len()) plan_record = record
        }
        local suggested_features = {}, output_index = 0
        if (plan_record != null) foreach (plan in plan_record.result.configurations) {
            local summary = W.label(G.target_label(plan.target) + " · " + plan.architecture + "\nPackages go in: " + plan.output)
            content.append(summary)
            widgets["review.output." + output_index] <- summary
            local output_details = W.box()
            output_details.append(W.label(plan.name + "\nStarts: " + plan.entry))
            output_details.append(W.label(native_app ? "Starts a native executable; no SQGI runtime is needed." :
                (plan.runtime.recipe ? "Runtime: build SQGI from the selected source/revision. Revision: " + plan.runtime.revision :
                ("package" in plan.runtime && plan.runtime.package != null ? "Runtime: prebuilt SQGI from Ooblerg. Binary capabilities have not been verified." :
                "Runtime: existing build or installed SQGI. Binary capabilities have not been verified."))))
            if ("ooblerg_packages" in plan && plan.ooblerg_packages.len())
                output_details.append(W.label("Linux dependencies: Ubuntu " + plan.linux_suite + " plus Ooblerg: " + G.list_text(plan.ooblerg_packages)))
            foreach (project in plan.native) if ("package" in project && project.package != "")
                output_details.append(W.label(project.name + ": use Ooblerg " + project.package + " for this output; source recipe kept."))
            output_details.append(W.label("Declared features: " + G.list_text(plan.features) + "\nExtra assets: " + G.list_text(plan.resources) +
                "\nScript directories: " + G.list_text(plan.script_dirs)))
            if ("import_evidence" in plan.discovery) foreach (item in plan.discovery.import_evidence) {
                output_details.append(W.label("Import found: " + item.namespace + " in " + item.file))
                local names = { Gtk = "gtk4", Gst = "gstreamer", GdkPixbuf = "gdk-pixbuf", Soup = "soup3" }
                if (!(item.namespace in names)) continue
                local feature = names[item.namespace], declared = document.get(["features"])
                if ((declared == null || typeof(declared) == "array" && declared.find(feature) == null) && !(feature in suggested_features)) {
                    suggested_features[feature] <- true
                    output_details.append(W.button("Also declare " + feature + " explicitly", function() { self.safe(function() {
                        local values = self.document.get(["features"]); if (values == null) values = []
                        if (typeof(values) != "array") throw "Correct features in the advanced editor first"
                        if (values.find(feature) == null) values.push(feature)
                        self.document.set(["features"], values); self.refresh()
                    }) }))
                }
            }
            local evidence = Gtk.Expander.new("Package details and complete plan")
            local details = W.box()
            details.append(W.label("Static inspection cannot prove all dynamically loaded files are included. " + plan.generated_outputs))
            details.append(W.label("Resolved plan, including native commands and dependencies:\n" + D.pretty(plan)))
            evidence.set_child(details); output_details.append(evidence)
            local expanded = Gtk.Expander.new("Launch, files and dependency details")
            expanded.set_child(output_details); content.append(expanded)
            widgets["review.output.details." + output_index] <- expanded
            output_index++
        } else content.append(W.label("Run Check project or Resolve plan to see what starts, output architectures, runtime and file evidence."))
        local reference = Gtk.Expander.new("Technical details and CLI reference"), listing = W.box()
        if (capabilities != null) listing.append(W.label("Editor runtime: SQGI " + capabilities.runtime.sqgi_version +
            ", JIT " + (capabilities.runtime.jit ? "enabled" : "disabled") + ", kernels " + capabilities.runtime.kernel_backend +
            ". This is the editor runtime, not proof of the packaged runtime's capabilities."))
        local keys = []; foreach (key, _ in C.metadata.cli) keys.push(key); keys.sort()
        foreach (key in keys) listing.append(W.label("--" + key + " (" + C.metadata.cli[key].classification + ")\n" + C.metadata.cli[key].description))
        reference.set_child(listing); content.append(reference)
    }
    function start_build() {
        if (inspection.busy || build_job.busy) throw "Wait for the current operation to finish"
        this.show_build(document.build_revision(), true)
    }
    function show_build(revision, launch) {
        local self = this
        if (build_dialog != null) { build_dialog.present(); return }
        local dialog = Gtk.Window.new()
        build_dialog = dialog
        dialog.set_title("Build selected packages"); dialog.set_transient_for(window); dialog.set_modal(true)
        dialog.set_default_size(850, 600)
        local body = W.padded(W.box()), label = W.label("Starting build…")
        local details = W.label("Manifest: " + revision.path + "\nBuild output is not a target runtime test.")
        local view = W.textview(""), location = W.label("")
        local output_list = W.box(), action_error = W.label("")
        local error_details = Gtk.Expander.new("Technical details"), raw_error = W.label("")
        error_details.set_child(raw_error); error_details.set_visible(false); action_error.set_visible(false)
        local show_error = function(message, error) {
            action_error.set_text(message); action_error.set_visible(true)
            raw_error.set_text(error.tostring()); error_details.set_expanded(false); error_details.set_visible(true)
        }
        local follow = Gtk.CheckButton.new_with_label("Follow new output")
        follow.set_active(true)
        local log_scroll = W.scroll(view)
        local adjustment = log_scroll.get_vadjustment()
        local follow_end = function() {
            if (follow.get_active()) adjustment.set_value(adjustment.get_upper() - adjustment.get_page_size())
        }
        adjustment.connect("changed", follow_end)
        local cancel = W.button("Cancel build", function() { self.safe(function() { self.build_job.cancel() }) })
        local close = W.button("Close", function() { if (!self.build_job.busy) dialog.close() })
        local actions = W.box(false); actions.append(cancel); actions.append(close)
        body.append(label); body.append(details); body.append(output_list); body.append(action_error); body.append(error_details); body.append(follow); body.append(log_scroll); body.append(location); body.append(actions)
        dialog.set_child(body)
        widgets["build.state"] <- label; widgets["build.log"] <- view
        widgets["build.action.error"] <- action_error; widgets["build.action.details"] <- error_details
        widgets["build.follow"] <- follow; widgets["build.scroll"] <- log_scroll
        widgets["build.cancel"] <- cancel; widgets["build.close"] <- close
        local close_after = false
        dialog.connect("close-request", function() {
            if (!self.build_job.busy) { self.build_dialog = null; self.render_content(); return false }
            W.question(dialog, "Build in progress", "Stop the build and all its child processes before closing?", ["Stay", "Cancel build and close"], function(choice) {
                if (choice == 1) { close_after = true; self.safe(function() { self.build_job.cancel() }) }
            })
            return true
        })
        local update = function() {
            label.set_text(self.build_job.state)
            local text = self.build_job.tail
            if (follow.get_active()) {
                local buffer = view.get_buffer()
                buffer.set_text(GLib.utf8_make_valid(text, text.len()), -1)
                follow_end()
            }
            location.set_text(self.build_job.log_path == null ? "" : "Complete log: " + self.build_job.log_path)
            cancel.set_sensitive(self.build_job.busy && !self.build_job.cancelled)
            close.set_sensitive(!self.build_job.busy)
            W.clear(output_list)
            if (!self.build_job.busy) {
                if (self.build_job.result_error != null) output_list.append(W.label(self.build_job.result_error))
                if (self.build_job.outputs != null) foreach (index, item in self.build_job.outputs) {
                    local output = item, row = W.box(false), name = W.label(item.label + "\n" + item.path)
                    name.set_hexpand(true); name.set_selectable(true); row.append(name)
                    local reveal = W.button("Open folder", function() {
                        action_error.set_visible(false); error_details.set_visible(false)
                        local checked = null
                        try { checked = Artifacts.inspect_output(output) }
                        catch (error) {
                            show_error("This output is no longer available as built. It may have been moved, deleted or changed. Build again to recreate it.", error)
                            return
                        }
                        try {
                            if (!Gio.AppInfo.launch_default_for_uri(Gio.File.new_for_path(checked.folder).get_uri(), null))
                                throw "No application accepted the folder"
                        } catch (error) { show_error("Could not open the folder. Copy the path above and open it in your file manager.", error) }
                    })
                    row.append(reveal)
                    self.widgets["build.output." + index] <- name; self.widgets["build.reveal." + index] <- reveal
                    output_list.append(row)
                }
            }
            if (close_after && !self.build_job.busy) dialog.close()
        }
        follow.connect("toggled", function() { if (follow.get_active()) update() })
        dialog.present()
        if (launch) build_job.run(revision, base_dir, update).then(function(_) { self.update_status(self.build_job.state) })
            .catch(function(error) { self.update_status("Build failed: " + error) })
        else update()
    }
    function inspect(action) {
        if (!document.valid || inspection.busy) return
        local self = this, snapshot = document.text, directory = base_dir
        local record = { action = action, text = snapshot, base_dir = directory, pending = true, error = null, result = null }
        results[action] = record
        inspection.run(action, snapshot, directory).then(function(result) {
            record.pending = false; record.result = result; self.last_result = record
            self.render_content(); self.update_status(G.state(action, record, self.document, self.base_dir))
        }).catch(function(e) {
            record.pending = false; record.error = e.tostring()
            self.render_content(); self.update_status("Inspection did not finish: " + e)
        })
        this.render_content(); this.update_status("Inspecting locally with sqgipkg. No application or build hooks are executed.")
    }
    function new_project() {
        if (capabilities == null) { this.update_status("Wait for sqgipkg capabilities, or fix the reported startup error."); return }
        local self = this, step = 0, candidate = null
        local dialog = Gtk.Dialog.new(); dialog.set_title("Set up your application"); dialog.set_transient_for(window); dialog.set_modal(true); dialog.set_default_size(720, 660)
        dialog.add_button("Cancel", Gtk.ResponseType.cancel)
        local body = W.padded(W.box()), controls = W.box(false), error = W.label("")
        dialog.get_content_area().append(W.scroll(body)); dialog.get_content_area().append(error); dialog.get_content_area().append(controls)
        local directory = W.entry(base_dir), names = [], labels = []
        foreach (item in G.templates) { names.push(item.key); labels.push(item.label) }
        local template = W.dropdown(labels), template_help = W.label(G.templates[0].help)
        template.connect("notify::selected", function(_, ...) { template_help.set_text(G.templates[template.get_selected()].help) })
        local name_control = Common.text_control(dialog, "Application name", "The name people will see for your application.", "My application")
        local entry_control = Common.text_control(dialog, "Main script", "The Squirrel script that starts your app. Paths start at your project directory.", "main.nut", "file", function() { return directory.get_text() })
        local executable_control = Common.text_control(dialog, "Built executable", "Name relative to the build directory, such as verminal or src/verminal. sqgipkg resolves each selected CPU and adds .exe for Windows.", "my-app")
        local build_system = W.dropdown(["Meson", "CMake"])
        local native_app = function() { return names[template.get_selected()] == "native-application" }
        local output_control = Common.text_control(dialog, "Save packages in", "This folder receives packages when you build from Review or run sqgipkg. It does not contain the manifest.", "dist", "folder", function() { return directory.get_text() })
        local name = name_control.input, entry = entry_control.input, output = output_control.input
        local target_control = Common.target_control(capabilities, O.defaults(capabilities))
        local redraw = null
        local next = W.button("Next", function() {
            try {
                if (step == 0) {
                    if (!GLib.path_is_absolute(directory.get_text()) || Gio.File.new_for_path(directory.get_text()).query_file_type(Gio.FileQueryInfoFlags.none, null) != Gio.FileType.directory)
                        throw "Choose an existing absolute project directory"
                    candidate = D.Document(D.pretty(self.capabilities.templates[names[template.get_selected()]]))
                }
                if (step == 1) {
                    if (name.get_text() == "") throw "Enter an application name"
                    candidate.set(["name"], name.get_text())
                    if (native_app()) candidate.set([], N.write(candidate.get([]), executable_control.input.get_text(), ".", build_system.get_selected() == 0 ? "meson" : "cmake"))
                    else {
                        if (entry.get_text() == "") throw "Enter a main script"
                        candidate.set(["entry"], entry.get_text())
                    }
                }
                if (step == 2) {
                    if (output.get_text() == "") throw "Choose an output folder or enter its path"
                    candidate.set([], O.write(candidate.get([]), target_control.selection(), self.capabilities))
                    candidate.set(["output"], output.get_text())
                    if (target_control.selection().windows) {
                        candidate.set(["windows", "package_source"], "ooblerg")
                        if (!native_app()) candidate.set(["windows", "runtime"], "package")
                    }
                }
                if (step == 3) {
                    candidate.save(GLib.build_filenamev([directory.get_text(), "sqgipkg.json"]))
                    self.document = candidate; self.base_dir = directory.get_text(); self.section = "Review"; self.welcome = false
                    self.search.set_text(""); self.attach_document(); dialog.destroy(); return
                }
                step++; error.set_text(""); redraw()
            } catch (e) { error.set_text("Error: " + e) }
        })
        local back = W.button("Back", function() { if (step > 0) { step--; redraw() } })
        next.add_css_class("suggested-action"); controls.append(back); controls.append(next)
        widgets["wizard.error"] <- error; widgets["wizard.next"] <- next; widgets["wizard.back"] <- back
        widgets["wizard.directory"] <- directory; widgets["wizard.name"] <- name; widgets["wizard.entry"] <- entry
        widgets["wizard.template"] <- template
        widgets["wizard.executable"] <- executable_control.input; widgets["wizard.build_system"] <- build_system
        foreach (key, check in target_control.checks) widgets["wizard.output." + key] <- check
        widgets["wizard.output.format"] <- target_control.format
        redraw = function() {
            W.clear(body); back.set_sensitive(step > 0); next.set_label(step == 3 ? "Save manifest" : "Next")
            body.append(W.heading((step + 1) + " of 4 — " + ["Choose your project", "Describe your app", "Choose your outputs", "Review your choices"][step]))
            if (step == 0) {
                local label = W.label("Project directory — contains your source and the new sqgipkg.json"); label.set_mnemonic_widget(directory)
                body.append(label); body.append(directory)
                body.append(W.button("Choose project folder…", function() { W.choose(dialog, Gtk.FileChooserAction.select_folder, directory.get_text(), function(path) { directory.set_text(path) }) }))
                local template_label = W.label("What kind of application is this?"); template_label.set_mnemonic_widget(template)
                body.append(template_label); body.append(template); body.append(template_help)
            } else if (step == 1) {
                body.append(name_control.body)
                if (native_app()) {
                    body.append(executable_control.body)
                    local label = W.heading("Application build system"); label.set_mnemonic_widget(build_system)
                    body.append(label); body.append(build_system)
                    body.append(W.label("The project directory must contain meson.build or CMakeLists.txt. Library dependencies and extra build options can be configured after saving."))
                } else body.append(entry_control.body)
            } else if (step == 2) {
                body.append(target_control.body); body.append(output_control.body)
                body.append(W.label("You can change this selection later in Targets. Review shows every selected output before you package."))
            } else {
                local summary = W.label(name.get_text() + "\nStarts: " + (native_app() ? executable_control.input.get_text() + " (built native executable)" : entry.get_text()) + "\nProject: " + directory.get_text() +
                    "\nApplication type: " + G.templates[template.get_selected()].label + "\nOutputs:\n" + O.summary(target_control.selection()) +
                    "\nPackages go in: " + output.get_text())
                body.append(summary); self.widgets["wizard.summary"] <- summary
                body.append(W.label((native_app() ? "Builds the application with " + (build_system.get_selected() == 0 ? "Meson" : "CMake") + " for each output. No SQGI runtime is needed. " : "The entry script and its literal imports are included. Add folders in Files for scripts selected dynamically. ") + "Extra assets can be added in Files. No package has been built and inputs have not been checked yet."))
                body.append(W.label("Save to " + GLib.build_filenamev([directory.get_text(), "sqgipkg.json"]) +
                    "\nNext: Check project in Review to find missing inputs and inspect the actual outputs. You can save this draft before resolving issues. Existing files are never overwritten."))
                local details = Gtk.Expander.new("Manifest JSON (optional)"); details.set_child(W.label(candidate.text)); body.append(details)
            }
        }
        dialog.connect("response", function(_) { dialog.destroy() })
        redraw(); dialog.present()
    }
}
return { Application = Application }
