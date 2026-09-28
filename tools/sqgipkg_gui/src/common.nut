// C-EDIT-06: task controls share Document operations with the expert editor.
local Gtk = import("Gtk", "4.0")
local GLib = import("GLib")
local Gio = import("Gio")
local W = import("widgets.nut")
local D = import("document.nut")
local G = import("guidance.nut")
local O = import("outputs.nut")
local R = import("runtime_choice.nut")
local N = import("native_application.nut")
local L = import("native_library.nut")
local P = import("package_picker.nut")
local Appearance = import("appearance.nut")
local NativeGuide = import("native_guide.nut")
local Desktop = import("desktop_metadata.nut")

function text_control(parent, title, help, value, path_kind = null, directory = null) {
    local body = W.box(), input = W.entry(value), label = W.heading(title)
    label.set_mnemonic_widget(input); body.append(label); body.append(W.label(help))
    local row = W.box(false); row.append(input); body.append(row)
    if (path_kind != null) row.append(W.button(path_kind == "folder" ? "Choose folder…" : "Choose file…", function() {
        local directory_path = typeof(directory) == "function" ? directory() : directory
        W.choose(parent, path_kind == "folder" ? Gtk.FileChooserAction.select_folder : Gtk.FileChooserAction.open, directory_path, function(filename) {
            local relative = Gio.File.new_for_path(directory_path).get_relative_path(Gio.File.new_for_path(filename))
            input.set_text(relative == null ? filename : relative)
        })
    }))
    return { body = body, input = input, row = row }
}
function target_control(capabilities, selected) {
    local body = W.box(), checks = {}, format = W.dropdown(["NSIS installer", "Portable folder"])
    body.append(W.heading("Which packages do you want to produce?"))
    body.append(W.label("Select one, both AppImages, or all three outputs. Each package is built for its selected operating system and CPU."))
    foreach (item in [["x86_64", "Linux AppImage — x86_64 (Intel / AMD 64-bit)"],
                      ["aarch64", "Linux AppImage — aarch64 (ARM 64-bit)"],
                      ["windows", "Windows — x86_64 (Intel / AMD 64-bit)"]]) {
        local key = item[0], check = Gtk.CheckButton.new_with_label(item[1])
        check.set_active(selected[key]); checks[key] <- check; body.append(check)
        if (key != "windows") check.set_sensitive(capabilities.targets.find("appimage") != null)
    }
    if (capabilities.targets.find("appimage") == null) body.append(W.label("Linux AppImages require a Linux build host. You can create Windows packages on this host."))
    local label = W.heading("Windows package format"); label.set_mnemonic_widget(format)
    body.append(label); body.append(format); format.set_selected(selected.format == "directory" ? 1 : 0)
    format.set_sensitive(checks.windows.get_active())
    checks.windows.connect("toggled", function() { format.set_sensitive(checks.windows.get_active()) })
    body.append(W.label("NSIS produces a Windows installer and needs makensis when building. AppImages for another CPU need a matching runtime and dependencies. Check project reports missing inputs before you package."))
    local selection = function() { return { x86_64 = checks.x86_64.get_active(), aarch64 = checks.aarch64.get_active(),
        windows = checks.windows.get_active(), format = format.get_selected() == 0 ? "installer" : "directory" } }
    return { body = body, checks = checks, format = format, selection = selection }
}

class Common {
    editor = null
    constructor(application) { editor = application }
    function mutate(action) { local self = this; editor.safe(function() { action(); self.editor.refresh() }) }
    function expert(key, message) {
        local e = editor, box = W.box(); box.append(W.label(message))
        box.append(W.button("Edit full configuration…", function() { e.safe(function() { e.fields.edit([key]) }) }))
        editor.content.append(box)
    }
    function scalar(key, title, help, path_kind = null) {
        local e = editor, value = e.document.get([key]), self = this
        if (e.document.has([key]) && typeof(value) != "string") { this.expert(key, title + " uses a custom value. It is preserved in the full editor."); return }
        local control = text_control(e.window, title, help, value == null ? "" : value, path_kind, e.base_dir)
        control.input.set_placeholder_text("Not set — sqgipkg will resolve this")
        local apply = W.button("Apply", function() { self.mutate(function() { e.document.set([key], control.input.get_text()) }) })
        control.row.append(apply)
        local reset = W.button("Use automatic value", function() { self.mutate(function() { e.document.unset([key]) }) })
        reset.set_sensitive(e.document.has([key])); control.row.append(reset)
        control.body.append(W.label(e.document.has([key]) ? "Set in this manifest. Apply records edits; Save writes the file." : "Not set. Review shows the effective value after resolving the plan."))
        e.widgets["common." + key + ".value"] <- control.input; e.widgets["common." + key + ".apply"] <- apply
        e.widgets["common." + key + ".reset"] <- reset
        e.content.append(control.body)
    }
    function application() {
        Desktop.render(editor)
        this.scalar("name", "Application name", "The name people see for your application. If omitted, sqgipkg uses the project directory name.")
        local doc = editor.document
        if (N.read(doc.get([])) != null) this.native_application()
        else if (typeof(doc.get(["entry"])) == "table" && doc.get(["entry", "type"]) == "native")
            this.expert("entry", "This native application uses custom executable paths or build recipes. They are preserved in Advanced. Review shows the executable for each output.")
        else if (doc.has(["entry"]) && doc.has(["script"])) this.expert("entry", "This manifest defines both entry and script. Use the full editor to preserve their relationship; Review shows what launches.")
        else this.scalar(doc.has(["script"]) ? "script" : "entry", "Main script", "The Squirrel script that starts your app. Paths start at the project directory. When omitted, sqgipkg looks for main.nut.", "file")
        this.features()
    }
    function native_application() {
        local e = editor, self = this, choice = N.read(e.document.get([]))
        local executable = text_control(e.window, "Built executable", "Name inside the build directory, such as verminal or src/verminal. sqgipkg finds it for every selected CPU and adds .exe on Windows.", choice.executable)
        local directory = text_control(e.window, "Application source directory", "Folder containing meson.build or CMakeLists.txt. A dot (.) means this project directory.", choice.dir, "folder", e.base_dir)
        local build_system = W.dropdown(["Meson", "CMake"]), label = W.heading("Application build system")
        build_system.set_selected(choice.build_system == "meson" ? 0 : 1); label.set_mnemonic_widget(build_system)
        e.content.append(executable.body); e.content.append(directory.body); e.content.append(label); e.content.append(build_system)
        e.content.append(W.label("The application builds separately for each selected output. Add library dependencies in Runtime/native code. Existing options and hooks are preserved in Advanced."))
        local apply = W.button("Apply application build", function() { self.mutate(function() {
            e.document.set([], N.write(e.document.get([]), executable.input.get_text(), directory.input.get_text(), build_system.get_selected() == 0 ? "meson" : "cmake"))
        }) })
        e.content.append(apply)
        e.widgets["common.native.executable"] <- executable.input; e.widgets["common.native.directory"] <- directory.input
        e.widgets["common.native.build_system"] <- build_system; e.widgets["common.native.apply"] <- apply
    }
    function features() {
        local e = editor, self = this, values = e.document.get(["features"])
        if (e.document.has(["features"]) && typeof(values) != "array") { this.expert("features", "Feature declarations use a custom value. Review can check it."); return }
        if (values == null) values = []
        e.content.append(W.heading("What does the application use?"))
        e.content.append(W.label("Select dependencies to include explicitly. Review also checks imports in your scripts. Include dynamically loaded features here when inspection cannot find them."))
        local known = [
            ["gtk4", "GTK 4 — desktop windows and controls"], ["gstreamer", "GStreamer — audio and video"],
            ["gdk-pixbuf", "GdkPixbuf — image loading"], ["soup3", "Soup 3 — HTTP networking"]
        ], keys = []
        foreach (item in known) {
            local key = item[0], check = Gtk.CheckButton.new_with_label(item[1]); keys.push(key)
            check.set_active(values.find(key) != null)
            check.connect("toggled", function() { self.mutate(function() {
                local next = e.document.get(["features"]); if (next == null) next = []
                local index = next.find(key)
                if (check.get_active() && index == null) next.push(key)
                else if (!check.get_active()) while ((index = next.find(key)) != null) next.remove(index)
                e.document.set(["features"], next)
            }) })
            e.widgets["common.feature." + key] <- check; e.content.append(check)
        }
        foreach (value in values) if (keys.find(value) == null) e.content.append(W.label("Other declaration preserved: " + D.pretty(value)))
    }
    function targets() {
        local e = editor, self = this, existing = O.read(e.document.get([]))
        if (e.capabilities == null) e.content.append(W.label("Output choices are waiting for sqgipkg capabilities."))
        else if (existing.selection == null) this.expert("target", existing.reason)
        else {
            local control = target_control(e.capabilities, existing.selection)
            local apply = W.button("Apply output choices", function() { self.mutate(function() {
                e.document.set([], O.write(e.document.get([]), control.selection(), e.capabilities))
            }) })
            control.body.append(apply); e.content.append(control.body)
            foreach (key, check in control.checks) e.widgets["common.output." + key] <- check
            e.widgets["common.output.format"] <- control.format; e.widgets["common.target.apply"] <- apply
        }
        e.content.append(W.label("Review lists the exact outputs and package folders. Advanced retains custom build recipes and platform settings."))
        this.scalar("output", "Save packages in", "Base folder for your packages. Multiple outputs get separate platform and architecture folders.", "folder")
    }
    function files() {
        this.assets()
        this.script_folders()
    }
    function script_folders() {
        local e = editor, self = this, raw = e.document.get(["script_dirs"]), values = []
        local entry = e.document.get(["entry"])
        if (typeof(entry) == "table" && "type" in entry && entry.type == "native" && !e.document.has(["script_dirs"])) return
        e.content.append(W.heading("Scripts selected dynamically"))
        e.content.append(W.label("Your entry script and literal imports are included automatically. Add a folder only when your app chooses script names at runtime. All scripts in that folder and its subfolders are included."))
        if (typeof(raw) == "string") values.push(raw)
        else if (typeof(raw) == "array") {
            foreach (value in raw) if (typeof(value) != "string") { this.expert("script_dirs", "Custom script folders are preserved in Advanced."); return }
            values = raw
        } else if (e.document.has(["script_dirs"])) { this.expert("script_dirs", "Custom script folders are preserved in Advanced."); return }
        if (values.len() == 0) e.content.append(W.label("No extra script folders."))
        foreach (i, value in values) {
            local index = i, row = W.box(false), label = W.label(value == "." ? ". — whole project, including examples and tests" : value)
            label.set_hexpand(true); row.append(label)
            local remove = W.button("Remove script folder", function() { self.mutate(function() {
                if (typeof(raw) == "string") e.document.unset(["script_dirs"])
                else { local next = clone values; next.remove(index); e.document.set(["script_dirs"], next) }
            }) }); row.append(remove); e.content.append(row); e.widgets["common.scripts.remove." + i] <- remove
        }
        local control = text_control(e.window, "Add a script folder", "Relative to your project, for example scripts/. A dot (.) includes the whole project and can pull in unrelated examples or tests.", "", "folder", e.base_dir)
        local add = W.button("Add script folder", function() { self.mutate(function() {
            local value = control.input.get_text()
            if (strip(value) == "") throw "Choose a script folder or enter its path"
            if (values.find(value) != null) throw "That script folder is already included"
            local next = clone values; next.push(value); e.document.set(["script_dirs"], next)
        }) }); control.body.append(add); e.content.append(control.body)
        e.widgets["common.scripts.value"] <- control.input; e.widgets["common.scripts.add"] <- add
    }
    function assets() {
        local e = editor, self = this, raw = e.document.get(["resources"]), values = []
        e.content.append(W.heading("Extra files and folders"))
        e.content.append(W.label("Add images, UI definitions and other assets your app loads. Script imports are handled separately below."))
        e.content.append(W.label("Resources go inside the application's resources folder, using the source filename. Use advanced file rules for a custom destination. Generated files may only be available after building."))
        if (typeof(raw) == "string") values.push(raw)
        else if (typeof(raw) == "array") {
            foreach (v in raw) if (typeof(v) != "string") { this.expert("resources", "Custom resources are preserved; use the full editor."); return }
            values = raw
        } else if (e.document.has(["resources"])) { this.expert("resources", "Custom resources are preserved; use the full editor."); return }
        foreach (i, value in values) {
            local index = i, row = W.box(false)
            local label = W.label(value + " → resources/" + GLib.path_get_basename(value)); label.set_hexpand(true); row.append(label)
            local remove = W.button("Remove", function() { self.mutate(function() {
                if (typeof(raw) == "string") e.document.unset(["resources"])
                else { local next = e.document.get(["resources"]); next.remove(index); e.document.set(["resources"], next) }
            }) }); row.append(remove); e.widgets["common.resources.remove." + i] <- remove; e.content.append(row)
        }
        local control = text_control(e.window, "Add an asset path", "Relative paths start at " + e.base_dir, "", "file", e.base_dir)
        control.row.append(W.button("Choose folder…", function() { W.choose(e.window, Gtk.FileChooserAction.select_folder, e.base_dir, function(path) {
            local relative = Gio.File.new_for_path(e.base_dir).get_relative_path(Gio.File.new_for_path(path))
            control.input.set_text(relative == null ? path : relative)
        }) }))
        local add = W.button("Add asset", function() { self.mutate(function() {
            local value = control.input.get_text(); if (value == "") throw "Choose a file or folder, or enter an asset path"
            local next = clone values; if (next.find(value) != null) throw "That asset is already included"
            next.push(value); e.document.set(["resources"], next)
        }) }); control.body.append(add); e.content.append(control.body)
        e.widgets["common.resources.value"] <- control.input; e.widgets["common.resources.add"] <- add
        if (e.document.has(["files"])) this.expert("files", "Custom file rules are also configured. They are preserved alongside these assets.")
    }
    function library_dialog(index = null) {
        local e = editor, self = this
        local choice = index == null ? { name = "", dir = "native", source = "local", repo = "", ref = "", build_system = "meson", introspection = false, ns = "", version = "1.0", library = "", windows_package = "", linux_package = "" }
            : L.read(e.document.get(["native", index]))
        local dialog = Gtk.Dialog.new(); dialog.set_title(index == null ? "Add native library" : "Edit native library")
        dialog.set_transient_for(e.window); dialog.set_modal(true); dialog.set_default_size(680, 700)
        local body = W.padded(W.box()); dialog.get_content_area().append(W.scroll(body))
        body.append(W.label("Build this library from source for each selected platform and CPU. Each target needs a matching compiler and the library's development dependencies."))
        local guide = W.button("New to native modules? See an example…", function() { NativeGuide.open(dialog, e.widgets) })
        body.append(guide); e.widgets["library.guide"] <- guide
        local name = text_control(dialog, "Library name", "A unique name for this build, such as gserial. Existing unnamed recipes can keep this blank.", choice.name)
        local directory = text_control(dialog, "Library source folder", "Contains meson.build or CMakeLists.txt. Relative paths start at the project directory.", choice.dir, "folder", e.base_dir)
        body.append(name.body)
        local source = W.dropdown(["Local folder", "Git repository — fixed commit"]), source_label = W.heading("Where is the library source?")
        source_label.set_mnemonic_widget(source); source.set_selected(choice.source == "git" ? 1 : 0)
        body.append(source_label); body.append(source); body.append(directory.body)
        local git_fields = W.box()
        local repo = text_control(dialog, "Git repository", "Repository URL or local Git repository path. Nothing is downloaded until you build.", choice.repo)
        local revision = text_control(dialog, "Commit to package", "Paste the full commit hash to reproduce the same library revision on every target. Branch names and moving tags remain in Advanced.", choice.ref)
        local checkout = text_control(dialog, "Checkout folder (optional)", "Leave blank for .sqgipkg/native/<library name>. Use a dedicated checkout, not an existing source tree: Build may fetch and check out the selected commit there.", choice.source == "git" ? choice.dir : "")
        git_fields.append(repo.body); git_fields.append(revision.body); git_fields.append(checkout.body); body.append(git_fields)
        local source_visibility = function() { local remote = source.get_selected() == 1; directory.body.set_visible(!remote); git_fields.set_visible(remote) }
        source.connect("notify::selected", function(_property, ...) { source_visibility() }); source_visibility()
        local system = W.dropdown(["Meson", "CMake"]), title = W.heading("Build system")
        system.set_selected(choice.build_system == "meson" ? 0 : 1); title.set_mnemonic_widget(system)
        body.append(title); body.append(system)
        local package = text_control(dialog, "Prebuilt Windows library (optional)",
            "Choose an Ooblerg package to replace this library's Windows source build. Linux has its own choice below. Leave blank to cross-compile it for Windows too.", choice.windows_package)
        local browse = W.button("Find Ooblerg package…", function() { P.open(dialog, e.base_dir, e.widgets,
            function(name) { package.input.set_text(name) }, "Choose the prebuilt Windows version of this library. The Linux choice is independent; the source recipe is preserved.") })
        package.body.append(browse); body.append(package.body)
        e.widgets["library.package_search"] <- browse; e.widgets["library.windows_package"] <- package.input
        local linux_package = text_control(dialog, "Prebuilt Linux library (optional)",
            "Leave blank to build the source above. An Ooblerg package replaces only this library's Linux build and requires Ubuntu 24.04 (noble). The source recipe is kept.", choice.linux_package)
        local linux_cpu = W.dropdown(["Browse Linux x86_64", "Browse Linux aarch64"])
        local library_outputs = O.read(e.document.get([])).selection
        if (library_outputs != null && library_outputs.aarch64 && !library_outputs.x86_64) linux_cpu.set_selected(1)
        linux_package.body.append(linux_cpu)
        local linux_browse = W.button("Find Linux Ooblerg package…", function() { P.open(dialog, e.base_dir, e.widgets,
            function(name) { linux_package.input.set_text(name) }, "Select a prebuilt replacement for Linux. Windows and local/Git settings are preserved.",
            linux_cpu.get_selected() == 0 ? "x86_64-linux-gnu" : "aarch64-linux-gnu") })
        linux_package.body.append(linux_browse); body.append(linux_package.body)
        e.widgets["library.linux_package"] <- linux_package.input; e.widgets["library.linux_search"] <- linux_browse; e.widgets["library.linux_cpu"] <- linux_cpu
        local gi = Gtk.CheckButton.new_with_label("Generate GObject metadata when building from source")
        gi.set_active(choice.introspection); body.append(gi)
        body.append(W.label("Used by Squirrel imports such as import(\"GSerial\", \"1.0\"). Some libraries also generate Vala bindings from this metadata. Ordinary C/C++ dependencies do not need it. Prebuilt bundles supply their own published metadata."))
        local details = W.box()
        local ns = text_control(dialog, "GObject namespace", "The import name, for example GSerial or StudyNative.", choice.ns)
        local version = text_control(dialog, "API version", "The introspection version, for example 1.0. This can differ from the release version.", choice.version)
        local library = text_control(dialog, "Meson library target", "The target Meson builds, for example gserial-1.0 or study-native; omit lib and .so/.dll.", choice.library)
        details.append(ns.body); details.append(version.body); details.append(library.body)
        details.append(W.label("Cross builds generate metadata using a separate host build, then pair it with the target library. This needs Meson, host development dependencies and the same API on both platforms. Test the packaged imports on every target; metadata conversion does not verify compatibility."))
        details.set_visible(gi.get_active()); gi.connect("toggled", function() { details.set_visible(gi.get_active()) })
        body.append(details)
        body.append(W.label("Options, custom outputs and development dependency installation remain in Advanced. Existing overrides are preserved."))
        local error = W.label(""); error.add_css_class("error"); body.append(error)
        local cancel = dialog.add_button("Cancel", Gtk.ResponseType.cancel)
        local apply = dialog.add_button(index == null ? "Add library" : "Apply library", Gtk.ResponseType.apply)
        dialog.connect("response", function(response) {
            if (response != Gtk.ResponseType.apply) { dialog.destroy(); return }
            try {
                local value = L.write(e.document.get([]), index, { name = name.input.get_text(), source = source.get_selected() == 1 ? "git" : "local",
                    repo = repo.input.get_text(), ref = revision.input.get_text(), dir = source.get_selected() == 1 ? checkout.input.get_text() : directory.input.get_text(),
                    build_system = system.get_selected() == 0 ? "meson" : "cmake", introspection = gi.get_active(),
                    ns = ns.input.get_text(), version = version.input.get_text(), library = library.input.get_text(), windows_package = strip(package.input.get_text()), linux_package = strip(linux_package.input.get_text()) })
                e.document.set([], value); dialog.destroy(); e.refresh()
            } catch (problem) { error.set_text(problem.tostring()); error.set_focusable(true); error.grab_focus() }
        })
        foreach (key, widget in { name = name.input, directory = directory.input, source = source, repo = repo.input, revision = revision.input, checkout = checkout.input, build_system = system,
            introspection = gi, ns = ns.input, version = version.input, library = library.input,
            error = error, apply = apply, cancel = cancel }) e.widgets["library." + key] <- widget
        dialog.present()
    }
    function libraries() {
        local e = editor, self = this, value = e.document.get([])
        e.content.append(W.heading("Native libraries"))
        e.content.append(W.label("Add a C, C++, GObject or Vala library your app needs. Source recipes build a separate library for each selected output."))
        if ("native" in value && typeof(value.native) != "array") {
            this.expert("native", "These library recipes use a custom form. Their configuration is preserved in Advanced."); return
        }
        local recipes = "native" in value ? value.native : []
        if (recipes.len() == 0) e.content.append(W.label("No native libraries added."))
        foreach (i, recipe in recipes) {
            local index = i
            if (typeof(recipe) == "table" && L.application_recipe(value, recipe)) {
                e.content.append(W.label("Application build: " + L.effective_name(recipe)))
                e.content.append(W.button("Edit application build…", function() { e.navigate("Application") })); continue
            }
            local choice = L.read(recipe)
            if (choice == null) { this.expert("native", "Library " + (i + 1) + " uses custom source or metadata settings. Edit it in Advanced."); continue }
            local source_path = choice.dir
            if (choice.source == "git" && source_path == "")
                source_path = ".sqgipkg/native/" + L.effective_name(recipe) + " (automatic checkout)"
            local row = W.box(false), text = L.effective_name(recipe) + " — " + source_path + " (" + choice.build_system + ")"
            if (choice.linux_package != "") text += "\nLinux: Ooblerg package " + choice.linux_package + " (Ubuntu 24.04)"
            if (choice.windows_package != "") text += "\nWindows: Ooblerg package " + choice.windows_package
            if (choice.introspection) text += "\nSource metadata: " + choice.ns + " " + choice.version + "; target " + choice.library
            else if (choice.linux_package != "" || choice.windows_package != "") text += "\nPrebuilt bundles supply their published metadata."
            else text += "\nNo GObject import configured"
            if (choice.source == "git") text += "\nGit: " + choice.repo + " @ " + choice.ref
            local label = W.label(text); label.set_hexpand(true); row.append(label)
            e.widgets["common.library.summary." + i] <- label
            local edit = W.button("Edit library…", function() { self.library_dialog(index) })
            local remove = W.button("Remove library", function() { self.mutate(function() { e.document.set([], L.remove(e.document.get([]), index)) }) })
            row.append(edit); row.append(remove); e.content.append(row)
            e.widgets["common.library.edit." + i] <- edit; e.widgets["common.library.remove." + i] <- remove
        }
        local add = W.button("Add native library…", function() { self.library_dialog() }); e.content.append(add)
        e.widgets["common.library.add"] <- add
        foreach (key in ["native_projects", "windows", "linux"]) if (key in value)
            e.content.append(W.label("Other platform settings are preserved. Review shows the recipes selected for each output; Advanced contains their overrides."))
    }
    function linux_packages() {
        local e = editor, self = this, value = e.document.get([])
        local outputs = O.read(value).selection
        if (outputs != null && !outputs.x86_64 && !outputs.aarch64) { e.content.append(W.label("Linux packages are inactive. Add a Linux output in Targets to configure them.")); return }
        e.content.append(W.heading("Linux packages"))
        e.content.append(W.label("Ubuntu supplies ordinary libraries. Add optional Ooblerg bundles for Git projects such as gserial or gworldscene. These bundles use Ubuntu 24.04 (noble), aligned with the Windows stack."))
        if ("linux" in value && typeof(value.linux) != "table") { this.expert("linux", "Custom Linux settings are preserved in Advanced."); return }
        local settings = "linux" in value ? value.linux : {}
        local packages = "ooblerg_packages" in settings ? settings.ooblerg_packages : []
        if (typeof(packages) != "array") { this.expert("linux", "Custom package selections are preserved in Advanced."); return }
        foreach (name in packages) if (typeof(name) != "string") { this.expert("linux", "Custom package selections are preserved in Advanced."); return }
        foreach (i, name in packages) {
            local index = i, row = W.box(false), label = W.label(name); label.set_hexpand(true); row.append(label)
            local remove = W.button("Remove Linux package", function() { self.mutate(function() {
                local next = clone packages; next.remove(index); e.document.set(["linux", "ooblerg_packages"], next)
            }) }); row.append(remove); e.content.append(row); e.widgets["common.linux.remove." + i] <- remove
        }
        local cpu = W.dropdown(["Browse Linux x86_64", "Browse Linux aarch64"])
        if (outputs != null && outputs.aarch64 && !outputs.x86_64) cpu.set_selected(1)
        e.content.append(cpu)
        local browse = W.button("Search Linux Ooblerg packages…", function() { P.open(e.window, e.base_dir, e.widgets, function(name) {
            self.mutate(function() { local next = clone packages; if (next.find(name) == null) next.push(name); e.document.set(["linux", "ooblerg_packages"], next) })
        }, "Add a Linux dependency for every selected Linux CPU. Availability is checked per CPU when building.",
            cpu.get_selected() == 0 ? "x86_64-linux-gnu" : "aarch64-linux-gnu") })
        e.content.append(browse); e.widgets["common.linux.search"] <- browse; e.widgets["common.linux.cpu"] <- cpu
        e.content.append(W.label("Local and Git libraries still build from source. To replace one explicitly, edit its native-library recipe below. Removing its prebuilt choice restores the source build."))
    }
    function windows_packages() {
        local e = editor, self = this, value = e.document.get([])
        local outputs = O.read(value).selection
        if (outputs != null && !outputs.windows) { e.content.append(W.label("Windows packages are inactive. Add Windows in Targets to configure them.")); return }
        e.content.append(W.heading("Windows packages"))
        if ("windows" in value && typeof(value.windows) != "table") { this.expert("windows", "Custom Windows settings are preserved in Advanced."); return }
        local settings = "windows" in value ? value.windows : {}
        local source = "package_source" in settings ? settings.package_source : "msys2"
        if (["msys2", "ooblerg"].find(source) == null) { this.expert("windows", "Choose a supported package source in Advanced."); return }
        local provider = W.dropdown(["Ooblerg — prebuilt libraries for Windows x86_64", "MSYS2 — existing package workflow"])
        provider.set_selected(source == "ooblerg" ? 0 : 1); e.content.append(provider)
        e.content.append(W.label("The package source supplies Windows libraries and their development files. Linux uses its own packages. Existing package names are preserved when changing providers; Check reports conflicts."))
        local native = "entry" in value && typeof(value.entry) == "table" && "type" in value.entry && value.entry.type == "native"
        local runtime = W.dropdown(["Use the SQGI runtime choice below", "Use prebuilt SQGI from Ooblerg for Windows"])
        runtime.set_selected("runtime" in settings && settings.runtime == "package" ? 1 : 0)
        if (!native) e.content.append(runtime)
        local apply = W.button("Apply Windows choices", function() { self.mutate(function() {
            local next = e.document.get([])
            if (!("windows" in next)) next.windows <- {}
            next.windows.package_source <- provider.get_selected() == 0 ? "ooblerg" : "msys2"
            if (!native) next.windows.runtime <- runtime.get_selected() == 1 ? "package" : "inherit"
            e.document.set([], next)
        }) }); e.content.append(apply)
        e.widgets["common.windows.provider"] <- provider; e.widgets["common.windows.runtime"] <- runtime; e.widgets["common.windows.apply"] <- apply
        if (source != "ooblerg") return
        local packages = "packages" in settings ? settings.packages : []
        if (typeof(packages) == "string") packages = [packages]
        if (typeof(packages) != "array") { this.expert("windows", "Custom Windows package selections are preserved in Advanced."); return }
        foreach (i, name in packages) {
            if (typeof(name) != "string") { this.expert("windows", "Custom Windows package selections are preserved in Advanced."); return }
            local index = i, row = W.box(false), label = W.label(name); label.set_hexpand(true); row.append(label)
            local remove = W.button("Remove package", function() { self.mutate(function() {
                local next = clone packages; next.remove(index); e.document.set(["windows", "packages"], next)
            }) }); row.append(remove); e.content.append(row); e.widgets["common.windows.remove." + i] <- remove
        }
        local browse = W.button("Search Ooblerg packages…", function() { P.open(e.window, e.base_dir, e.widgets, function(name) {
            self.mutate(function() { local next = clone packages; if (next.find(name) == null) next.push(name); e.document.set(["windows", "packages"], next) })
        }) }); e.content.append(browse); e.widgets["common.windows.search"] <- browse
        e.content.append(W.label("Add prebuilt dependencies such as gserial or gworldscene. Their required libraries are included automatically. For a source recipe with a Windows alternative, use the native library's package picker below."))
    }
    function runtime() {
        local e = editor, self = this, value = e.document.get([]), choice = R.read(value)
        if (choice.mode == "native") {
            e.content.append(W.label("This application starts a native executable, so it does not need a SQGI runtime. Its native build recipes and dependencies are configured below."))
            return
        }
        local windows_package = "windows" in value && typeof(value.windows) == "table" && "runtime" in value.windows && value.windows.runtime == "package"
        e.content.append(W.heading(windows_package ? "SQGI for Linux" : "How should SQGI be prepared?"))
        e.content.append(W.label(windows_package ? "Windows uses the prebuilt SQGI package selected above. This choice prepares SQGI for the selected Linux CPUs." :
            "SQGI runs your Squirrel scripts. Every selected platform and CPU needs a matching runtime. A source recipe builds it for each output using that target's compiler and dependencies."))
        if (choice.mode == null) { this.expert(choice.key, choice.reason); return }
        local modes = ["existing", "local", "revision"]
        local mode = W.dropdown(["Use existing runtime binaries", "Build from a local source checkout", "Build a version, tag or commit"])
        mode.set_selected(modes.find(choice.mode)); e.content.append(mode)
        local details = W.box(), input = null
        local local_value = choice.mode == "local" ? choice.value : ""
        local revision_value = choice.mode == "revision" ? choice.value : ""
        local previous_mode = choice.mode
        local redraw = function() {
            if (input != null) {
                if (previous_mode == "local") local_value = input.get_text()
                else if (previous_mode == "revision") revision_value = input.get_text()
            }
            W.clear(details); input = null
            local selected = modes[mode.get_selected()]; previous_mode = selected
            if (selected == "existing") details.append(W.label("Use runtime binaries you have already built or installed. Advanced has per-platform build folders. Check project reports missing inputs; an installed runtime for this computer does not supply binaries for other CPUs or Windows."))
            else {
                local local_source = selected == "local"
                local control = text_control(e.window,
                    local_source ? "SQGI source folder" : "SQGI version, tag or commit",
                    local_source ? "Choose the SQGI source checkout containing CMakeLists.txt. Relative paths start at the project directory. Packaging builds these local sources without fetching a revision."
                        : "Packaging fetches this revision of the SQGI repository and builds it. Enter a known release tag or commit; Check and Resolve do not fetch it.",
                    local_source ? local_value : revision_value, local_source ? "folder" : null, e.base_dir)
                input = control.input; details.append(control.body)
                e.widgets["common.runtime.value"] <- input
                details.append(W.label("New runtime recipes enable LLVM JIT and typed kernels. Building requires the selected target's development dependencies and compiler."))
            }
        }
        redraw(); mode.connect("notify::selected", function(_, ...) { redraw() }); e.content.append(details)
        if ("runtime" in value && "jit" in value.runtime)
            e.content.append(W.label("This manifest has an explicit JIT override. It is preserved when changing the source; edit it in Advanced if needed."))
        local apply = W.button("Apply runtime choice", function() { self.mutate(function() {
            e.document.set([], R.write(e.document.get([]), modes[mode.get_selected()], input == null ? "" : input.get_text()))
        }) })
        e.content.append(apply); e.widgets["common.runtime.mode"] <- mode; e.widgets["common.runtime.apply"] <- apply
        e.content.append(W.label("Apply records this choice in the manifest; Save writes it. Review resolves the build plan without compiling or downloading anything."))
    }
    function render(section) {
        if (section == "Application") this.application()
        else if (section == "Targets") this.targets()
        else if (section == "Files") this.files()
        else if (section == "Appearance/installer") {
            Appearance.render(editor)
            this.scalar("desktop_icon", "Application icon", "An image used for the application's desktop icon. Installer images and shortcuts are in Advanced.", "file")
        } else if (section == "Runtime/native code") {
            this.linux_packages()
            this.windows_packages()
            this.runtime()
            this.libraries()
        }
    }
}
return { Common = Common, text_control = text_control, target_control = target_control }
