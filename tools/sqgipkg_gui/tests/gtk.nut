// C-EDIT acceptance drives GTK widgets and checks document/file/CLI outcomes.
local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local GLib = import("GLib")
local A = import("../src/application.nut")
local W = import("../src/widgets.nut")
local D = import("../src/document.nut")
local B = import("../src/backend.nut")
local G = import("../src/guidance.nut")
local O = import("../src/outputs.nut")
local directory = vargv[0]
local capture_file = vargv.len() > 1 ? Gio.File.new_for_path(directory + "/capture-request") : null
function capture(name) { if (capture_file != null) capture_file.replace_contents(name, null, false, Gio.FileCreateFlags.none, null) }
function require(ok, message) { if (!ok) throw "FAIL: " + message }
function find_button(widget, label) {
    if (widget.get_name() == "GtkButton" && widget.get_label() == label) return widget
    local child = widget.get_first_child()
    while (child != null) {
        local found = find_button(child, label)
        if (found != null) return found
        child = child.get_next_sibling()
    }
    return null
}
local app = Gtk.Application.new("org.sqgi.ManifestStudio.Tests", Gio.ApplicationFlags.non_unique)
local editor = null, failure = 0, step = 0, checks = null, ticks = 0
local clipboard_text = null, clipboard_error = null, clipboard_pending = false
local original_build_command = null, paused_log = null
app.connect("activate", function() {
    editor = A.Application(app)
    checks = [
        function() { capture("welcome") },
        function() {
            if (editor.capabilities == null) throw "Capabilities unavailable: " + editor.status.get_text()
            require(editor.welcome && editor.widgets["welcome.new"].get_sensitive(), "empty launch guides setup")
            editor.widgets["welcome.new"].activate()
        },
        function() {
            editor.widgets["wizard.directory"].set_text(directory)
            require(editor.widgets["wizard.template"].get_selected() == 0, "simple template is the default")
            editor.widgets["wizard.next"].activate()
        },
        function() {
            editor.widgets["wizard.name"].set_text("GUI café project")
            editor.widgets["wizard.entry"].set_text("main.nut")
            editor.widgets["wizard.next"].activate()
        },
        function() {
            require(editor.widgets["wizard.output.windows"].get_active() && editor.widgets["wizard.output.format"].get_selected() == 0, "default Windows NSIS output")
            if (editor.capabilities.host != "windows") {
                require(editor.widgets["wizard.output.x86_64"].get_active() && editor.widgets["wizard.output.aarch64"].get_active(), "both AppImages selected by default")
            }
            capture("setup-outputs")
        },
        function() {
            foreach (key in ["x86_64", "aarch64", "windows"]) editor.widgets["wizard.output." + key].set_active(false)
            editor.widgets["wizard.next"].activate()
        },
        function() {
            require(editor.widgets["wizard.error"].get_text().find("at least one") != null, "empty setup selection is rejected")
            editor.widgets["wizard.output.windows"].set_active(true)
            if (editor.capabilities.host != "windows") {
                editor.widgets["wizard.output.x86_64"].set_active(true)
                editor.widgets["wizard.output.aarch64"].set_active(true)
            }
            editor.widgets["wizard.next"].activate()
        },
        function() {
            require("wizard.summary" in editor.widgets, "wizard reaches review: " + editor.widgets["wizard.error"].get_text() + " / " + editor.widgets["wizard.next"].get_label())
            require(editor.widgets["wizard.summary"].get_text().find("Starts: main.nut") != null, "human review explains launch")
            if (editor.capabilities.host != "windows") require(editor.widgets["wizard.summary"].get_text().find("aarch64") != null, "setup review distinguishes AppImage architecture")
            capture("setup-review")
        },
        function() { editor.widgets["wizard.next"].activate() },
        function() {
            require(editor.document.path == directory + "/sqgipkg.json", "wizard saved selected project: " + editor.widgets["wizard.error"].get_text() + " button: " + editor.widgets["wizard.next"].get_label())
            require(!editor.document.dirty && editor.document.get(["name"]) == "GUI café project", "wizard manifest")
            require(!editor.document.has(["features"]), "plain template does not declare GTK")
            if (editor.capabilities.host != "windows") {
                local saved = D.open_document(editor.document.path)
                require(saved.get(["target"]) == "all", "wizard saves all-target default")
                require(D.pretty(saved.get(["platforms", "linux", "architectures"])) == D.pretty(["x86_64", "aarch64"]), "wizard saves both Linux architectures")
                require(saved.get(["platforms", "windows", "format"]) == "installer", "wizard saves NSIS format")
            }
            require(editor.section == "Review" && editor.widgets["review.check.state"].get_text().find("Not checked") != null, "save hands off to checking")
            print("PASS EDIT-guidance\n")
            editor.navigate("Application")
            editor.widgets["common.feature.gtk4"].set_active(true)
            require(editor.document.get(["features"])[0] == "gtk4", "explicit GTK declaration")
            capture("application")
        },
        function() {
            editor.widgets["common.name.value"].set_text("Changed from GTK")
            editor.widgets["common.name.apply"].activate()
        },
        function() {
            require(editor.document.get(["name"]) == "Changed from GTK", "typed GTK control writes document")
            editor.widgets.Save.activate()
        },
        function() {
            require(!editor.document.dirty, "save button saves file")
            require(D.open_document(editor.document.path).get(["name"]) == "Changed from GTK", "reopen saved file")
            editor.widgets.Undo.activate()
        },
        function() {
            require(editor.document.get(["name"]) == "GUI café project" && editor.document.dirty, "undo saved edit")
            editor.widgets.Redo.activate()
        },
        function() {
            require(!editor.document.dirty, "redo restores saved state")
            editor.document.set(["files"], [{ from = "assets", to = "usr/share/data", optional = false }])
            editor.fields.edit(["files", 0, "optional"])
        },
        function() {
            editor.fields.controls["manifest.files[0].optional.value"].set_selected(1)
            editor.fields.controls["manifest.files[0].optional.apply"].activate()
        },
        function() {
            require(editor.document.get(["files", 0, "optional"]) == true, "nested boolean control")
            editor.fields.dialogs.top().response(Gtk.ResponseType.close)
            editor.document.unset(["files"])
            print("PASS EDIT-structured-values\n")
            editor.document.set(["gstreamer_plugins"], "plugins/custom.so")
            editor.fields.edit(["gstreamer_plugins"])
        },
        function() {
            local dialog = editor.fields.dialogs.top()
            require(find_button(dialog, "Choose file…") != null && find_button(dialog, "Choose folder…") == null, "plugin scalar offers only a file picker")
            dialog.response(Gtk.ResponseType.close)
            editor.document.set(["gstreamer_plugins"], ["plugins/custom.so"])
            editor.fields.edit(["gstreamer_plugins", 0])
        },
        function() {
            local dialog = editor.fields.dialogs.top()
            require(find_button(dialog, "Choose file…") != null && find_button(dialog, "Choose folder…") == null, "plugin list item offers only a file picker")
            dialog.response(Gtk.ResponseType.close)
            editor.document.unset(["gstreamer_plugins"])
            editor.navigate("Manifest")
            local buffer = editor.json_view.get_buffer()
            buffer.begin_user_action(); buffer.delete(buffer.get_start_iter(), buffer.get_end_iter()); buffer.insert(buffer.get_start_iter(), "{bad", -1); buffer.end_user_action()
        },
        function() {
            require(!editor.document.valid && !editor.widgets.Save.get_sensitive(), "invalid JSON disables save")
            editor.widgets.Undo.activate()
        },
        function() {
            require(editor.document.valid, "undo invalid JSON")
            editor.search.set_text("nsis")
            require("field.windows" in editor.widgets && editor.widgets["field.windows"].get_visible(), "nested key search")
            editor.navigate("Review")
        },
        function() {
            require(editor.widgets.explain.get_sensitive() && editor.widgets.explain.get_mapped(), "inspection button is available")
            editor.widgets.explain.activate()
        },
        function() {
            require(editor.last_result != null && editor.last_result.result.ok, "real sqgipkg inspection: " + editor.status.get_text() + "\n" + D.pretty(editor.results.explain) + "\n" + editor.document.text)
            require(editor.widgets["review.check.state"].get_text().find("Not checked") != null, "Explain cannot count as Check")
            require(editor.widgets["review.explain.state"].get_text().find("Plan resolved") != null, "Explain is resolution only")
            require(editor.last_result.result.configurations[0].name == "Changed from GTK", "inspection uses current unsaved model")
            if (editor.capabilities.host != "windows") {
                local plans = editor.last_result.result.configurations
                require(plans.len() == 3 && plans[0].architecture == "x86_64" && plans[1].architecture == "aarch64" && plans[2].target == "win-nsis", "real CLI resolves all three defaults")
                for (local i = 0; i < 3; i++) {
                    require(editor.widgets["review.output." + i].get_text().find(plans[i].architecture) != null, "compact output names its architecture")
                    require(!editor.widgets["review.output.details." + i].get_expanded(), "output evidence starts collapsed")
                }
                local sibling = editor.widgets["review.copy"].get_next_sibling(), found_output = false
                while (sibling != null) {
                    try { if (sibling.get_text() == editor.widgets["review.output.0"].get_text()) found_output = true } catch (_) {}
                    sibling = sibling.get_next_sibling()
                }
                require(found_output, "packaging action precedes resolved detail")
            }
            capture("compact-review")
        },
        function() {
            editor.document.set(["name"], "Later edit")
            editor.render_content()
            require(editor.last_result.text != editor.document.text, "inspection revision retained")
            print("PASS EDIT-navigation\nPASS EDIT-actions\nPASS EDIT-feedback\nPASS PKG-cli-boundary\n")
            editor.document.save(); editor.open_path(editor.document.path)
            require(editor.document.get(["name"]) == "Later edit", "open workflow")
            editor.navigate("Targets")
        },
        function() {
            if (editor.capabilities.host != "windows") {
                require(editor.widgets["common.output.x86_64"].get_active() && editor.widgets["common.output.aarch64"].get_active() && editor.widgets["common.output.windows"].get_active(), "reopened output set stays selected")
                editor.widgets["common.output.windows"].set_active(false)
                editor.widgets["common.target.apply"].activate()
            }
        },
        function() {
            if (editor.capabilities.host != "windows") {
                require(editor.document.get(["target"]) == "appimage-all", "both Linux outputs without Windows")
                editor.document.undo()
                require(editor.document.get(["target"]) == "all", "output-set edit is undoable")
                editor.document.redo()
            }
            editor.navigate("Review")
        },
        function() { editor.widgets.explain.activate() },
        function() {
            require(editor.results.explain.result.ok, "real CLI resolves selected outputs")
            if (editor.capabilities.host != "windows") {
                local plans = editor.results.explain.result.configurations
                require(plans.len() == 2 && plans[0].target == "appimage" && plans[0].architecture == "x86_64" && plans[1].target == "appimage" && plans[1].architecture == "aarch64", "both AppImages resolve without Windows")
            }
            editor.navigate("Files")
            editor.widgets["common.resources.value"].set_text("assets")
            editor.widgets["common.resources.add"].activate()
        },
        function() { capture("files") },
        function() {
            require(editor.document.get(["resources"])[0] == "assets", "add assets without type selection")
            editor.widgets["common.resources.remove.0"].activate()
        },
        function() {
            require(editor.document.get(["resources"]).len() == 0, "remove assets")
            require(!editor.document.has(["script_dirs"]), "new template does not scan entire project")
            editor.widgets["common.scripts.value"].set_text("scripts")
            editor.widgets["common.scripts.add"].activate()
        },
        function() {
            require(D.pretty(editor.document.get(["script_dirs"])) == D.pretty(["scripts"]), "add dynamic scripts without schema dialogs")
            require(editor.document.get(["resources"]).len() == 0, "script edits preserve assets")
            editor.widgets["common.scripts.remove.0"].activate()
        },
        function() {
            require(editor.document.get(["script_dirs"]).len() == 0, "remove dynamic script folder")
            editor.document.undo(); editor.refresh()
            require(editor.document.get(["script_dirs"])[0] == "scripts", "script folder removal is undoable")
            editor.document.set(["script_dirs"], "."); editor.refresh()
            require(editor.document.get(["script_dirs"]) == ".", "opening common folder controls preserves scalar dot")
            editor.widgets["common.scripts.remove.0"].activate()
        },
        function() {
            require(!editor.document.has(["script_dirs"]), "remove authored scalar script folder")
            print("PASS EDIT-script-folders\n")
            editor.document.set(["native"], { dir = "native", build_system = "meson" })
            editor.fields.edit(["native"])
        },
        function() {
            require("manifest.native.dir" in editor.fields.controls, "native task fields remain visible")
            require(!("manifest.native.commit" in editor.fields.controls), "unset nested advanced field starts hidden even in a union")
            editor.fields.controls["manifest.native.advanced"].set_active(true)
            require("manifest.native.commit" in editor.fields.controls, "full nested editor remains reachable")
            editor.fields.controls["manifest.native.name"].activate()
        },
        function() { find_button(editor.fields.dialogs.top(), "Use string").activate() },
        function() {
            editor.fields.controls["manifest.native.name.value"].set_text("Counter library")
            editor.fields.controls["manifest.native.name.apply"].activate()
        },
        function() { editor.fields.dialogs.top().response(Gtk.ResponseType.close) },
        function() {
            require(editor.fields.controls["manifest.native.name"].get_mapped() &&
                editor.fields.controls["manifest.native.name"].get_label() == "Edit", "parent reflects configured child immediately")
            // The closed child remains in the diagnostic list; close its mapped parent.
            editor.fields.dialogs[editor.fields.dialogs.len() - 2].response(Gtk.ResponseType.close)
            editor.document.unset(["native"])
            editor.document.set(["platforms"], { windows = { format = "directory" }, linux = { architectures = ["aarch64"] } })
            editor.navigate("Targets")
            editor.widgets["common.output.x86_64"].set_active(false)
            editor.widgets["common.output.aarch64"].set_active(false)
            editor.widgets["common.output.windows"].set_active(true)
            editor.widgets["common.output.format"].set_selected(0)
            editor.widgets["common.target.apply"].activate()
        },
        function() {
            capture("targets")
        },
        function() {
            editor.widgets["common.output.windows"].set_active(false)
            editor.widgets["common.target.apply"].activate()
        },
        function() {
            require(editor.status.get_text().find("at least one") != null, "empty editor selection is rejected")
            editor.widgets["common.output.windows"].set_active(true)
            require(editor.document.get(["target"]) == "win-nsis", "friendly installer selection writes correct target")
            require(editor.document.get(["platforms", "windows", "format"]) == "directory", "format overlay is preserved")
            require(editor.document.get(["platforms", "linux", "architectures"])[0] == "aarch64", "architecture overlay preserved")
            local windows = O.defaults({ targets = ["win-dir", "win-nsis", "win-sysroot"] })
            require(!windows.x86_64 && !windows.aarch64 && windows.windows && windows.format == "installer", "Windows host defaults to NSIS only")
            editor.document.set(["entry"], { type = "native", linux = "bin/app", windows = "bin/app.exe" })
            editor.document.set(["resources"], "assets")
            editor.document.set(["features"], ["gtk4", "future-feature"])
            editor.navigate("Application")
            editor.widgets["common.name.value"].set_text("Complex preserved")
            editor.widgets["common.name.apply"].activate()
        },
        function() {
            require(editor.document.get(["entry", "type"]) == "native", "simple name edit preserves complex entry")
            require(editor.document.get(["resources"]) == "assets", "unrelated edit preserves scalar resource form")
            require(editor.document.get(["features"])[1] == "future-feature", "unrelated edit preserves unknown feature")
            editor.widgets["common.feature.gstreamer"].set_active(true)
            require(editor.document.get(["features"])[1] == "future-feature", "feature edits preserve unknown declarations")
            editor.document.unset(["entry"]); editor.document.set(["script"], "main.nut")
            editor.navigate("Application")
            editor.widgets["common.script.value"].set_text("other.nut")
            editor.widgets["common.script.apply"].activate()
        },
        function() {
            require(editor.document.get(["script"]) == "other.nut" && !editor.document.has(["entry"]), "legacy script stays in its authored field")
            print("PASS EDIT-common-tasks\n")
            editor.navigate("Review"); editor.widgets["review.runtime"].activate()
        },
        function() {
            require(editor.section == "Runtime/native code", "Review links directly to runtime preparation")
            require(editor.widgets["common.runtime.mode"].get_selected() == 0, "absent runtime uses existing binaries")
            editor.widgets["common.runtime.mode"].set_selected(1)
            editor.widgets["common.runtime.apply"].activate()
        },
        function() {
            require(!editor.document.has(["runtime"]) && editor.status.get_text().find("source folder") != null, "empty runtime source rejected without mutation")
            editor.widgets["common.runtime.value"].set_text("runtime source café")
            editor.widgets["common.runtime.apply"].activate()
        },
        function() {
            require(editor.document.get(["runtime", "source"]) == "runtime source café", "local runtime source without nested dialogs")
            editor.document.undo(); require(!editor.document.has(["runtime"]), "runtime choice is undoable")
            editor.document.redo(); editor.document.set(["runtime", "jit"], false)
            editor.navigate("Runtime/native code")
            editor.widgets["common.runtime.mode"].set_selected(2)
            editor.widgets["common.runtime.value"].set_text("v0.1.7-alpha")
            editor.widgets["common.runtime.apply"].activate()
        },
        function() {
            require(editor.document.get(["runtime", "sqgi"]) == "v0.1.7-alpha" && !editor.document.has(["runtime", "source"]), "revision replaces local selector")
            require(editor.document.get(["runtime", "jit"]) == false, "runtime choice preserves explicit override")
            editor.document.unset(["runtime"])
            print("PASS EDIT-runtime-choice\n")
            // This fixture resolves but Check must reject its missing native directory.
            editor.document.edit_json(D.pretty({ schema_version = 2, entry = "main.nut", native = [{ dir = "missing-native", build_system = "meson" }], target = editor.capabilities.host == "windows" ? "win-dir" : "appimage" }))
            editor.navigate("Review")
            require(!editor.widgets["review.copy"].get_sensitive(), "dirty manifest cannot supply a saved command")
        },
        function() {
            editor.widgets.explain.activate()
        },
        function() {
            require(editor.results.explain.result.ok, "native plan resolves without source directory")
            require(editor.results.check == null, "no fabricated check result")
            editor.widgets.check.activate()
        },
        function() {
            require(!editor.results.check.result.ok, "Check catches missing native directory")
            require(editor.widgets["review.check.state"].get_text().find("Needs attention") != null, "failed check is actionable")
            require(editor.widgets["review.explain.state"].get_text().find("Plan resolved") != null, "Check and Explain remain independent")
            editor.document.set(["name"], "Changed after checks"); editor.render_content()
            require(editor.widgets["review.check.state"].get_text().find("Changed since inspection") != null, "Check becomes stale")
            require(editor.widgets["review.explain.state"].get_text().find("Changed since inspection") != null, "Explain becomes stale")
            editor.navigate("Manifest")
            editor.document.edit_json("{bad"); editor.navigate("Review")
            require(!editor.widgets.check.get_sensitive(), "invalid JSON disables checking")
            require(editor.results.check != null && editor.widgets["review.check.state"].get_text().find("Changed since inspection") != null, "invalid draft retains stale evidence")
            editor.document.undo(); editor.document.unset(["native"])
            editor.document.save(); editor.render_content()
            require(editor.widgets["review.copy"].get_sensitive(), "saved valid draft offers command")
            editor.widgets.check.activate()
        },
        function() {
            require(editor.results.check.result.ok, "corrected project passes Check: " + D.pretty(editor.results.check.result))
            local warnings = G.counts(editor.results.check.result).warnings
            require(editor.widgets["review.check.state"].get_text().find(warnings ? "Checks passed with warnings" : "Checks passed") != null, "warning-aware success")
            capture("review")
        },
        function() { editor.widgets["review.copy"].activate() },
        function() {
            require(editor.status.get_text().find("Copied the command") != null, "copy action publishes text")
            clipboard_pending = true
            editor.window.get_clipboard().read_text_async(null).then(function(text) {
                clipboard_text = text; clipboard_pending = false
            }).catch(function(error) { clipboard_error = error; clipboard_pending = false })
        },
        function() {
            require(clipboard_error == null, "clipboard read succeeded")
            require(clipboard_text == B.printable(B.command("build", editor.document.path)), "clipboard preserves exact command and Unicode path")
        },
        function() {
            editor.base_dir = directory + "/missing-directory"
            editor.widgets.explain.activate()
        },
        function() {
            require(editor.results.explain.error != null && !editor.results.explain.pending, "transport failure replaces previous success")
            require(editor.widgets["review.explain.state"].get_text().find("Inspection did not finish") != null, "failed attempt is visible")
            editor.base_dir = directory
            print("PASS EDIT-review-states\n")
            editor.new_project()
        },
        function() {
            editor.widgets["wizard.directory"].set_text(directory + "/native-app")
            foreach (i, template in G.templates) if (template.key == "native-application") editor.widgets["wizard.template"].set_selected(i)
            editor.widgets["wizard.next"].activate()
        },
        function() {
            require(!editor.widgets["wizard.entry"].get_mapped(), "native setup does not ask for Squirrel script")
            editor.widgets["wizard.name"].set_text("Native GTK test")
            editor.widgets["wizard.executable"].set_text("")
            editor.widgets["wizard.next"].activate()
        },
        function() {
            require(editor.widgets["wizard.error"].get_text().find("executable") != null, "empty native executable is actionable")
            editor.widgets["wizard.executable"].set_text("hello")
            editor.widgets["wizard.next"].activate()
        },
        function() {
            require(editor.widgets["wizard.output.windows"].get_active(), "native setup includes Windows")
            if (editor.capabilities.host != "windows") require(editor.widgets["wizard.output.x86_64"].get_active() && editor.widgets["wizard.output.aarch64"].get_active(), "native setup includes both Linux CPUs")
            editor.widgets["wizard.next"].activate()
        },
        function() {
            require(editor.widgets["wizard.summary"].get_text().find("hello (built native executable)") != null, "native launch summary")
            editor.widgets["wizard.next"].activate()
        },
        function() {
            require(editor.document.path == directory + "/native-app/sqgipkg.json", "native setup saved")
            local saved = D.open_document(editor.document.path)
            require(saved.get(["entry", "type"]) == "native" && saved.get(["entry", "project"]) == "app", "native entry refers to recipe")
            require(!saved.has(["runtime"]) && !saved.has(["script_dirs"]), "native app has no Squirrel runtime or script defaults")
            editor.navigate("Application")
            editor.widgets["common.native.executable"].set_text("src/hello")
            editor.widgets["common.native.build_system"].set_selected(1)
            editor.widgets["common.native.apply"].activate()
        },
        function() {
            require(editor.document.get(["entry", "executable"]) == "src/hello" && editor.document.get(["native", 0, "build_system"]) == "cmake", "native common controls edit executable and build system")
            editor.document.undo(); editor.refresh()
            require(editor.document.get(["entry", "executable"]) == "hello" && !editor.document.dirty, "native common edit undoes together")
            editor.navigate("Review")
            editor.widgets.explain.activate()
        },
        function() {
            require(editor.results.explain.result.ok, "GUI-saved native manifest resolves")
            local plans = editor.results.explain.result.configurations
            require(plans.len() == (editor.capabilities.host == "windows" ? 1 : 3), "native plan resolves all selected outputs")
            foreach (plan in plans) require(plan.entry.find("/app/hello") != null || plan.entry.find("\\app\\hello") != null, "native plan resolves build executable")
            print("PASS EDIT-native-application\n")
            editor.navigate("Runtime/native code")
            editor.widgets["common.library.add"].activate()
        },
        function() {
            require(editor.widgets["library.guide"].get_mapped(), "source example is visible in library form")
            editor.widgets["library.guide"].activate()
        },
        function() {
            require(editor.widgets["library.guide.body"].get_mapped(), "native example is displayed")
            require(!editor.document.dirty, "opening native guide preserves draft")
            capture("native-guide")
        },
        function() {
            local adjustment = editor.widgets["library.guide.scroll"].get_vadjustment()
            require(adjustment.get_upper() > adjustment.get_page_size(), "long guide can scroll")
            adjustment.set_value(adjustment.get_upper() - adjustment.get_page_size())
        },
        function() { capture("native-guide-fields") },
        function() { editor.widgets["library.guide.close"].activate() },
        function() {
            require(editor.widgets["library.apply"].get_mapped() && !editor.document.dirty, "closing guide returns to unchanged form")
            editor.widgets["library.apply"].activate()
        },
        function() {
            require(editor.widgets["library.error"].get_text().find("name") != null, "empty library input explained inline")
            require(editor.document.get(["native"]).len() == 1, "invalid library did not mutate document")
            editor.widgets["library.name"].set_text("serial")
            editor.widgets["library.directory"].set_text("native")
            editor.widgets["library.introspection"].set_active(true)
            editor.widgets["library.ns"].set_text("GSerial")
            editor.widgets["library.version"].set_text("1.0")
            editor.widgets["library.library"].set_text("gserial-1.0")
            editor.widgets["library.apply"].activate()
        },
        function() {
            require(editor.document.get(["native", 0, "name"]) == "serial" && editor.document.get(["native", 1, "name"]) == "app", "GUI dependency precedes application")
            require(editor.document.get(["native", 0, "gi", "namespace"]) == "GSerial", "GUI metadata saved")
            editor.document.undo(); editor.refresh()
            require(editor.document.get(["native"]).len() == 1 && !editor.document.dirty, "library add is one undoable edit")
            editor.document.redo(); editor.document.set(["native", 0, "options"], { custom = "keep" }); editor.refresh()
            editor.fix_setting(["native", 0, "options", "custom"])
        },
        function() {
            require(editor.fields.controls["manifest.native[0].options.custom.value"].get_mapped(), "custom recipe diagnostic retains editable Advanced control")
            editor.fields.dialogs.top().response(Gtk.ResponseType.close)
            editor.fix_setting(["native", 0, "dir"])
        },
        function() {
            editor.widgets["library.ns"].set_text("Discarded")
            editor.widgets["library.cancel"].activate()
        },
        function() {
            require(editor.document.get(["native", 0, "gi", "namespace"]) == "GSerial", "Cancel retains metadata")
            editor.widgets["common.library.edit.0"].activate()
        },
        function() {
            editor.widgets["library.ns"].set_text("Serial")
            editor.widgets["library.source"].set_selected(1)
            require(editor.widgets["library.repo"].get_visible() && !editor.widgets["library.directory"].get_mapped(), "Git source fields replace local folder")
            editor.widgets["library.repo"].set_text(directory + "/native-app")
            editor.widgets["library.revision"].set_text("0123456789012345678901234567890123456789")
            editor.widgets["library.linux_package"].set_text("gserial")
            capture("library-git")
        },
        function() {
            require(editor.widgets["library.repo"].get_mapped(), "Git repository input is actually mapped")
            editor.widgets["library.apply"].activate()
        },
        function() {
            editor.document.save()
            local saved = D.open_document(editor.document.path)
            require(saved.get(["native", 0, "repo"]) == directory + "/native-app" && !saved.has(["native", 0, "dir"]), "Git recipe saves managed checkout")
            local summary = editor.widgets["common.library.summary.0"].get_text()
            require(summary.find(".sqgipkg/native/") != null && summary.find("automatic checkout") != null,
                "Git library summary explains the automatic checkout without authoring dir")
            require(saved.get(["native", 0, "ref"]) == "0123456789012345678901234567890123456789", "Git commit survives save/reopen")
            require(saved.get(["native", 0, "gi", "namespace"]) == "Serial" && saved.get(["native", 0, "options", "custom"]) == "keep", "library edit preserves overrides across save/reopen")
            require(saved.get(["native", 0, "linux_package"]) == "gserial", "Linux alternative saves without losing Git or Windows choices")
            editor.widgets["common.library.remove.0"].activate()
        },
        function() {
            require(editor.document.get(["native"]).len() == 1 && editor.document.get(["native", 0, "name"]) == "app", "library removal preserves application")
            print("PASS EDIT-native-library\n")
            editor.navigate("Runtime/native code")
            editor.widgets["common.windows.provider"].set_selected(0)
            editor.widgets["common.windows.apply"].activate()
        },
        function() {
            require(editor.document.get(["windows", "package_source"]) == "ooblerg", "provider control writes the manifest")
            print("PASS EDIT-windows-provider\n")
            editor.widgets["common.windows.search"].activate()
        },
        function() {
            if (editor.widgets["packages.status"].get_text().find("Loading") != null) { step--; return }
            require(editor.widgets["packages.status"].get_text().find("cached") != null, "offline package catalog uses cache")
            editor.widgets["packages.search"].set_text("HARDWARE")
        },
        function() {
            require(editor.widgets["packages.status"].get_text().find("1 package") != null, "case-insensitive tag search")
            editor.widgets["packages.result.gserial"].activate()
        },
        function() {
            require(editor.widgets["packages.details"].get_text().find("GObject serial") != null, "selection explains package")
            editor.widgets["packages.add"].activate()
        },
        function() {
            require(editor.document.get(["windows", "packages"])[0] == "gserial", "picker adds actual package name")
            editor.document.save()
            require(D.open_document(editor.document.path).get(["windows", "packages"])[0] == "gserial", "package survives save and reopen")
            editor.widgets["common.windows.search"].activate()
        },
        function() {
            if (editor.widgets["packages.status"].get_text().find("Loading") != null) { step--; return }
            editor.widgets["packages.search"].set_text("nothing-matches-this-query")
        },
        function() {
            require(editor.widgets["packages.status"].get_text().find("No matching") != null && !editor.widgets["packages.add"].get_sensitive(), "empty search cannot add a stale selection")
            editor.widgets["packages.cancel"].activate()
        },
        function() {
            require(!editor.document.dirty && editor.document.get(["windows", "packages"]).len() == 1, "Cancel leaves draft unchanged")
            editor.document.undo(); editor.refresh()
            require(editor.document.get(["windows", "packages"]) == null, "package add is undoable")
            print("PASS EDIT-package-search\n")
            editor.navigate("Runtime/native code")
            editor.widgets["common.linux.cpu"].set_selected(1)
            editor.widgets["common.linux.search"].activate()
        },
        function() {
            if (editor.widgets["packages.status"].get_text().find("Loading") != null) { step--; return }
            require(editor.widgets["packages.status"].get_text().find("cached") != null, "Linux catalog loads separately from Windows")
            editor.widgets["packages.search"].set_text("serial")
        },
        function() { editor.widgets["packages.result.gserial"].activate() },
        function() {
            local details = editor.widgets["packages.details"].get_text()
            require(details.find("aarch64") != null && details.find("Ubuntu 24.04") != null, "Linux picker explains architecture and baseline")
            capture("linux-picker-aarch64")
        },
        function() { editor.widgets["packages.add"].activate() },
        function() {
            require(editor.document.get(["linux", "ooblerg_packages"])[0] == "gserial", "Linux picker writes independent seed")
            require(editor.document.get(["windows", "package_source"]) == "ooblerg" && editor.document.get(["windows", "packages"]) == null, "Linux selection preserves Windows")
            editor.document.save()
            require(D.open_document(editor.document.path).get(["linux", "ooblerg_packages"])[0] == "gserial", "Linux package survives reopen")
            editor.widgets["common.linux.cpu"].set_selected(0)
            editor.widgets["common.linux.search"].activate()
        },
        function() {
            if (editor.widgets["packages.status"].get_text().find("Loading") != null) { step--; return }
            editor.widgets["packages.result.gworldscene"].activate()
        },
        function() {
            require(editor.widgets["packages.details"].get_text().find("Linux x86_64") != null, "x86 catalog target changes")
            capture("linux-picker-x86_64")
        },
        function() { editor.widgets["packages.cancel"].activate() },
        function() {
            require(!editor.document.dirty && editor.document.get(["linux", "ooblerg_packages"]).len() == 1, "Linux picker cancel preserves document")
            editor.widgets["common.linux.remove.0"].activate()
        },
        function() {
            require(editor.document.get(["linux", "ooblerg_packages"]).len() == 0, "Linux seed is removable")
            print("PASS EDIT-linux-package-search\n")
            if (!editor.build_job.available()) { app.quit(); return }
            editor.document.set([], { schema_version = 2, name = "Build failure fixture", entry = "does-not-exist.nut", target = "appimage", appimage_arch = "aarch64" })
            editor.document.save(); editor.navigate("Review")
            require(editor.widgets["review.build"].get_sensitive(), "saved manifest offers Build")
            editor.widgets["review.build"].activate()
        },
        function() {
            if (editor.build_job.busy) { step--; return }
            require(editor.build_job.state.find("Build failed") != null, "real CLI failure is visible: " + editor.build_job.state)
            require(editor.build_job.tail.len() > 0 && Gio.File.new_for_path(editor.build_job.log_path).query_exists(null), "failed build retains diagnostics")
            require(editor.widgets["build.close"].get_sensitive(), "failed build can close")
            capture("build-failure")
        },
        function() {
            editor.widgets["build.close"].activate()
        },
        function() {
            // Deterministic process fixture tests GUI transport, not package correctness.
            original_build_command = editor.build_job.command_factory
            editor.build_job.command_factory = function(path) { return [GLib.find_program_in_path("python3"), "-u", "-c",
                "import sys,time,json,pathlib,hashlib; p=pathlib.Path(sys.argv[1]); r=pathlib.Path(sys.argv[3]); t=r.with_suffix('.tmp'); t.write_text(json.dumps(dict(protocol_version=1,status='running',manifest_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),expected_outputs=3,artifacts=[],progress=dict(target='appimage',architecture='aarch64',phase='packaging',completed=1)))); t.replace(r); time.sleep(3); print('build output line\\n'*10000);sys.stderr.write('READY\\n');time.sleep(2);print('AFTER-PAUSE');time.sleep(60)", path] }
            editor.widgets["review.build"].activate()
        },
        function() {
            if (editor.build_job.busy && editor.widgets["build.state"].get_text().find("Output 2 of 3") == null) { step--; return }
            require(editor.widgets["build.state"].get_text().find("aarch64 — Creating package") != null, "quiet build exposes architecture and stage")
            require(editor.build_job.tail == "", "progress arrives independently of stdout")
            capture("build-progress")
        },
        function() {
            if (editor.build_job.busy && editor.build_job.tail.find("READY") == null) { step--; return }
            require(editor.build_job.busy, "fixture remains live while GTK responds: " + editor.build_job.state + " / " + editor.build_job.tail)
            require(editor.build_job.tail.len() <= 65536, "visible log is bounded")
            local disk = Gio.File.new_for_path(editor.build_job.log_path).query_info("standard::size", Gio.FileQueryInfoFlags.none, null)
            require(disk.get_size() > 100000, "full log retains output beyond visible tail")
            require(!editor.widgets["build.close"].get_sensitive(), "running job cannot close silently")
            local refused = false
            try { editor.start_build() } catch (_) { refused = true }
            require(refused, "duplicate build is rejected")
            require(editor.widgets["build.follow"].get_active(), "live log follows by default")
            editor.widgets["build.follow"].set_active(false)
            paused_log = W.contents(editor.widgets["build.log"])
        },
        function() {
            if (editor.build_job.busy && editor.build_job.tail.find("AFTER-PAUSE") == null) { step--; return }
            require(editor.build_job.tail.find("AFTER-PAUSE") != null, "child output continues while log view is paused")
            require(W.contents(editor.widgets["build.log"]) == paused_log, "paused view retains text for reading")
            editor.widgets["build.follow"].set_active(true)
            require(W.contents(editor.widgets["build.log"]).find("AFTER-PAUSE") != null, "resume reveals latest output")
        },
        function() {
            local scroll = editor.widgets["build.scroll"].get_vadjustment()
            require(scroll.get_value() + scroll.get_page_size() >= scroll.get_upper() - 2.0, "following reveals the end of the log: " + scroll.get_value() + " + " + scroll.get_page_size() + " / " + scroll.get_upper())
            editor.widgets["build.cancel"].activate()
        },
        function() {
            if (editor.build_job.busy) { step--; return }
            require(editor.build_job.state == "Build cancelled", "cancel is not success: " + editor.build_job.state)
            editor.build_job.command_factory = original_build_command
            require(editor.widgets["build.state"].get_text() == "Build cancelled", "visible cancellation state agrees with job")
            require(editor.widgets["build.close"].get_sensitive(), "cancel completion enables Close")
        },
        function() {
            capture("build-cancelled")
        },
        function() {
            editor.widgets["build.close"].activate()
            print("PASS JOB-gui-failure-cancel\n")
        },
        function() {
            editor.build_job.command_factory = function(path) { return [GLib.find_program_in_path("python3"), "-c",
                "import sys,json,hashlib,pathlib; p=pathlib.Path(sys.argv[1]); r=pathlib.Path(sys.argv[3]); a=r.parent/'fixture.nsi'; a.write_text('fixture script'); r.write_text(json.dumps(dict(protocol_version=1,status='succeeded',manifest_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),expected_outputs=1,artifacts=[dict(target='win-nsis',architecture='x86_64',kind='nsis-script',path=str(a),size=a.stat().st_size)])))", path] }
            editor.widgets["review.build"].activate()
        },
        function() {
            if (editor.build_job.busy) { step--; return }
            require(editor.build_job.state.find("output(s) found") != null, "complete matching report verifies output presence: " + editor.build_job.state + " / " + editor.build_job.result_error)
            require(editor.widgets["build.output.0"].get_text().find("not an installer") != null, "GUI distinguishes script from installer")
            require(editor.widgets["build.reveal.0"].get_sensitive(), "verified output offers folder action")
            capture("build-output-script")
        },
        function() {
            local handler = Gio.AppInfo.create_from_commandline(
                GLib.shell_quote(GLib.find_program_in_path("python3")) + " " + GLib.shell_quote(directory + "/reveal.py") + " " +
                GLib.shell_quote(directory + "/revealed-uri") + " %u", "Private folder action fixture", Gio.AppInfoCreateFlags.supports_uris)
            require(handler.set_as_default_for_type("inode/directory"), "private test folder handler")
            editor.widgets["build.reveal.0"].activate()
        },
        function() {
            local file = Gio.File.new_for_path(directory + "/revealed-uri")
            if (!file.query_exists(null)) { step--; return }
            local received = file.load_contents(null)[0], folder = editor.build_job.outputs[0].folder
            require(received == Gio.File.new_for_path(folder).get_uri() || received == folder,
                "Open folder launches the verified directory (URI or native path): " + received)
            Gio.File.new_for_path(editor.build_job.outputs[0].path).delete(null)
            file.delete(null)
            editor.widgets["build.reveal.0"].activate()
        },
        function() {
            require(editor.widgets["build.action.error"].get_mapped(), "missing output error is visible in the Build window")
            require(editor.widgets["build.action.error"].get_text().find("Build again") != null, "missing output explains recovery")
            require(!editor.widgets["build.action.details"].get_expanded(), "raw error starts collapsed")
            require(!Gio.File.new_for_path(directory + "/revealed-uri").query_exists(null), "missing output never dispatches the folder handler")
            require(editor.widgets["build.close"].get_sensitive(), "artifact action failure does not trap the user")
            capture("build-output-missing")
        },
        function() {
            editor.build_job.command_factory = original_build_command
            editor.widgets["build.close"].activate()
        },
        function() {
            require(editor.build_dialog == null && editor.window.get_visible(), "finished Build closes back to editor")
            print("PASS JOB-gui-artifacts\n")
            editor.window.close()
        }
    ]
    sqgi.timeout_add(400, function() {
        ticks++
        if (ticks > 320) { print("FAIL: GUI timeout\n"); failure = 1; app.quit(); return false }
        if (capture_file != null && capture_file.query_exists(null)) return true
        if (editor.inspection.busy || clipboard_pending) return true
        try {
            if (step < checks.len()) checks[step++]()
            return step < checks.len()
        } catch (e) { print(e + "\n"); failure = 1; app.quit(); return false }
    })
})
app.run(0, null)
return failure
