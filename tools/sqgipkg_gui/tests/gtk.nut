// C-EDIT acceptance drives GTK widgets and checks document/file/CLI outcomes.
local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local GLib = import("GLib")
local A = import("../src/application.nut")
local W = import("../src/widgets.nut")
local D = import("../src/document.nut")
local B = import("../src/backend.nut")
local directory = vargv[0]
function require(ok, message) { if (!ok) throw "FAIL: " + message }
local app = Gtk.Application.new("org.sqgi.ManifestStudio.Tests", Gio.ApplicationFlags.non_unique)
local editor = null, failure = 0, step = 0, checks = null, ticks = 0
app.connect("activate", function() {
    editor = A.Application(app)
    checks = [
        function() {
            if (editor.capabilities == null) throw "Capabilities unavailable: " + editor.status.get_text()
            editor.widgets.New.activate()
        },
        function() {
            editor.widgets["wizard.directory"].set_text(directory)
            editor.widgets["wizard.next"].activate()
        },
        function() {
            editor.widgets["wizard.name"].set_text("GUI café project")
            editor.widgets["wizard.entry"].set_text("main.nut")
            editor.widgets["wizard.next"].activate()
        },
        function() { editor.widgets["wizard.next"].activate() },
        function() { editor.widgets["wizard.next"].activate() },
        function() {
            require(editor.document.path == directory + "/sqgipkg.json", "wizard saved selected project: " + editor.widgets["wizard.error"].get_text() + " button: " + editor.widgets["wizard.next"].get_label())
            require(!editor.document.dirty && editor.document.get(["name"]) == "GUI café project", "wizard manifest")
            require(editor.document.get(["features"])[0] == "gtk4", "CLI template")
            print("PASS EDIT-guidance\n")
            editor.widgets["field.name"].activate()
        },
        function() {
            editor.fields.controls["manifest.name.value"].set_text("Changed from GTK")
            editor.fields.controls["manifest.name.apply"].activate()
        },
        function() {
            require(editor.document.get(["name"]) == "Changed from GTK", "typed GTK control writes document")
            editor.fields.dialogs.top().response(Gtk.ResponseType.close)
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
            editor.widgets.explain.activate()
        },
        function() {
            require(editor.last_result != null && editor.last_result.result.ok, "real sqgipkg inspection")
            require(editor.last_result.result.configurations[0].name == "Changed from GTK", "inspection uses current unsaved model")
            editor.document.set(["name"], "Later edit")
            editor.render_content()
            require(editor.last_result.text != editor.document.text, "inspection revision retained")
            print("PASS EDIT-navigation\nPASS EDIT-actions\nPASS EDIT-feedback\nPASS PKG-cli-boundary\n")
            editor.document.save(); editor.open_path(editor.document.path)
            require(editor.document.get(["name"]) == "Later edit", "open workflow")
            app.quit()
        }
    ]
    sqgi.timeout_add(400, function() {
        ticks++
        if (ticks > 100) { print("FAIL: GUI timeout\n"); failure = 1; app.quit(); return false }
        if (editor.inspection.busy) return true
        try {
            if (step < checks.len()) checks[step++]()
            return step < checks.len()
        } catch (e) { print(e + "\n"); failure = 1; app.quit(); return false }
    })
})
app.run(0, null)
return failure
