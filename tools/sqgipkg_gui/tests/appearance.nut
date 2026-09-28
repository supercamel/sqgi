local Gtk = import("Gtk", "4.0"), Gio = import("Gio")
local A = import("../src/application.nut"), P = import("../src/appearance.nut"), D = import("../src/document.nut")
local B = import("../../sqgipkg_lib/build.nut")
function scan() { throw "Host scan must not handle locale discovery" }
local directory = vargv[0], step = 0, failure = 0, editor = null
function require(ok, message) { if (!ok) throw message }
function capture(name) { if (vargv.len() > 1) Gio.File.new_for_path(directory + "/capture-request").replace_contents(name, null, false, Gio.FileCreateFlags.none, null) }
local app = Gtk.Application.new("org.sqgi.ManifestStudio.AppearanceTest", Gio.ApplicationFlags.non_unique)
app.connect("activate", function() {
    editor = A.Application(app)
    local steps = [
        function() {
            editor.document = D.open_document(directory + "/sqgipkg.json"); editor.base_dir = directory
            editor.navigate("Appearance/installer")
            require(!editor.document.dirty, "opening theme controls does not mutate")
            require(editor.widgets["common.theme"].get_selected() == 3 && editor.widgets["common.theme.custom"].get_text() == "MyTheme", "custom theme preserved")
            editor.widgets["common.theme"].set_selected(2); editor.widgets["common.theme.apply"].activate()
        },
        function() {
            require(editor.document.get(["gtk_theme"]) == "Adwaita:dark", "dark selection authored")
            require(editor.document.get(["windows", "gtk_theme"]) == "WindowsTheme", "Windows override preserved")
            editor.widgets["common.theme"].set_selected(3)
            require(editor.widgets["common.theme.custom"].get_visible(), "custom theme field revealed by selector")
            editor.widgets["common.theme"].set_selected(2)
            require(!editor.widgets["common.theme.custom"].get_visible(), "preset hides custom theme field")
            capture("appearance")
        },
        function() { editor.widgets["common.languages"].activate() },
        function() { editor.widgets["languages.find"].activate() },
        function() {
            require("languages.fr" in editor.widgets && "languages.de" in editor.widgets && !("languages.es" in editor.widgets), "only compiled catalogs detected")
            editor.widgets["languages.fr"].set_active(true); capture("languages")
        },
        function() { editor.widgets["languages.apply"].activate() },
        function() {
            local doc = editor.document.get([])
            require(doc.files.len() == 2 && doc.windows.files.len() == 2, "unrelated rules preserved")
            require(doc.files[1].include[0] == "fr/LC_MESSAGES/*.mo", "only French selected")
            local pkg = B.SqgiPkgBuild()
            foreach (pair in [[doc.files[1], "linux", "usr/share/locale/fr/LC_MESSAGES/app.mo"], [doc.windows.files[1], "windows", "share/locale/fr/LC_MESSAGES/app.mo"]]) {
                local rule = pkg.manifest_file_rule(directory, pair[0], "translations"), expanded = pkg.expand_file_rule(rule)
                require(expanded.len() == 1, "one selected catalog per target")
                local opts = pkg.new_options(); pkg.copy_file_spec(opts, rule, directory + "/" + pair[1])
                require(Gio.File.new_for_path(directory + "/" + pair[1] + "/" + pair[2]).query_exists(null), "catalog staged at target path")
            }
            require(P.resource_overlap({resources = ["locale", ".", "locale/fr", "other"]}, "locale", directory).len() == 3, "exact, parent and child resource overlap detected")
            local before = D.pretty(doc), rejected = false, custom = D.copy_value(doc); custom.windows.files = "custom"
            try { P.write_languages(custom, "locale", ["de"]) } catch (_) { rejected = true }
            require(rejected && custom.windows.files == "custom", "unsupported rules rejected atomically")
            editor.document.set(["resources"], "locale"); editor.widgets["common.languages"].activate()
        },
        function() {
            require(editor.widgets["languages.status"].get_text().find("Unchecked languages may still be bundled") != null, "resource overlap visibly explained")
            require(editor.widgets["languages.fr"].get_active() && !editor.widgets["languages.de"].get_active(), "saved selections reopen")
            capture("language-overlap")
        },
        function() {
            editor.widgets["languages.fr"].set_active(false); editor.widgets["languages.apply"].activate()
        },
        function() {
            require(editor.document.get(["files"]).len() == 1 && editor.document.get(["windows", "files"]).len() == 1, "remove only paired language rules")
            editor.document.undo(); require(editor.document.get(["files"]).len() == 2, "language apply is undoable")
            editor.navigate("Appearance/installer"); editor.widgets["common.theme"].set_selected(0); editor.widgets["common.theme.apply"].activate()
        },
        function() { require(!editor.document.has(["gtk_theme"]), "automatic removes only theme override"); print("PASS EDIT-appearance-languages\n"); app.quit() }
    ]
    sqgi.timeout_add(400, function() {
        if (editor.inspection.busy || Gio.File.new_for_path(directory + "/capture-request").query_exists(null)) return true
        try { steps[step++](); return step < steps.len() } catch (error) { print("FAIL " + error + "\n"); failure = 1; app.quit(); return false }
    })
})
app.run(0, null)
return failure
