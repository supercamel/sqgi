local Gtk = import("Gtk", "4.0"), Gio = import("Gio"), GLib = import("GLib")
local A = import("../src/application.nut"), D = import("../src/document.nut"), M = import("../src/desktop_metadata.nut")
local B = import("../../sqgipkg_lib/build.nut")
local dir = vargv[0], failure = 0, step = 0, editor = null
function require(ok, message) { if (!ok) throw message }
function capture(name) { if (vargv.len() > 1) Gio.File.new_for_path(dir + "/capture-request").replace_contents(name, null, false, Gio.FileCreateFlags.none, null) }
local app = Gtk.Application.new("org.sqgi.ManifestStudio.DesktopTest", Gio.ApplicationFlags.non_unique)
app.connect("activate", function() {
    editor = A.Application(app)
    local steps = [
        function() {
            local before = {name="Old", windows={packages=["gserial"]}, gtk_theme="Adwaita:dark"}
            editor.document = D.Document(D.pretty(before)); editor.base_dir = dir; editor.navigate("Application")
            local good = M.read(dir + "/org.example.Terminal.desktop", dir)
            require(good.desktop_icon == "icon.svg" && good.app_id == "org.example.Terminal", "local icon and file identity")
            local missing = M.read(dir + "/missing.desktop", dir), rejected = false
            try { M.write(before, missing, dir) } catch (_) { rejected = true }
            require(rejected && before.name == "Old", "unresolved icon rejects atomically")
            foreach (name in ["not-app.desktop", "malformed.desktop"]) {
                rejected = false; try { M.read(dir + "/" + name, dir) } catch (_) { rejected = true }
                require(rejected, "reject invalid desktop input")
            }
            editor.widgets["common.desktop"].activate()
        },
        function() { require(editor.widgets["desktop.path"].get_mapped(), "preview opens"); editor.widgets["desktop.path"].set_text("org.example.Terminal.desktop"); editor.widgets["desktop.load"].activate() },
        function() {
            require(editor.document.get(["name"]) == "Old", "loading preserves document")
            require(editor.widgets["desktop.name"].get_text() == "Terminal λ", "rendered name")
            require(editor.widgets["desktop.desktop_comment"].get_text() == "Serial terminal", "rendered description")
            editor.widgets["desktop.desktop_icon"].set_text("")
            editor.widgets["desktop.desktop_icon"].set_text("icon.svg")
            require(editor.widgets["desktop.status"].get_text().find("Icon path edited") != null, "icon edit clears stale source warning")
            capture("desktop-preview")
        },
        function() { editor.widgets["desktop.cancel"].activate() },
        function() { require(editor.document.get(["name"]) == "Old", "cancel preserves document"); editor.widgets["common.desktop"].activate() },
        function() { editor.widgets["desktop.path"].set_text("org.example.Terminal.desktop"); editor.widgets["desktop.load"].activate() },
        function() { editor.widgets["desktop.apply"].activate() },
        function() {
            local doc = editor.document.get([])
            require(doc.app_id == "org.example.Terminal" && doc.desktop_categories == "Development;Utility;", "identity/categories applied")
            require(doc.windows.packages[0] == "gserial" && doc.gtk_theme == "Adwaita:dark", "unrelated fields preserved")
            require(doc.desktop_comment == "Serial terminal" && !doc.desktop_terminal, "description and terminal applied")
            local pkg = B.SqgiPkgBuild(), opts = pkg.new_options()
            pkg.apply_manifest_data(opts, doc, dir)
            require(opts.desktop_comment == doc.desktop_comment, "manifest description reaches backend")
            opts.desktop_comment = "Serial\\terminal\nExec=unwanted"; opts.desktop_categories = doc.desktop_categories
            pkg.write_desktop_file(dir, doc.app_id, doc.name, opts)
            local k = GLib.KeyFile.new(); k.load_from_file(dir + "/org.example.Terminal.desktop", GLib.KeyFileFlags.none)
            require(k.get_string("Desktop Entry", "Comment") == opts.desktop_comment, "description roundtrips escaped newline/backslash")
            require(k.get_string("Desktop Entry", "Exec") == "AppRun", "description cannot inject Exec")
            require(k.get_string("Desktop Entry", "Name") == doc.name && k.get_string("Desktop Entry", "Categories") == doc.desktop_categories, "generated metadata preserved")
            editor.document.undo(); require(editor.document.get(["name"]) == "Old" && !editor.document.has(["app_id"]), "single undo reverts import")
            print("PASS EDIT-desktop-metadata\n"); app.quit()
        }
    ]
    sqgi.timeout_add(400, function() {
        if (Gio.File.new_for_path(dir + "/capture-request").query_exists(null)) return true
        try { steps[step++](); return step < steps.len() } catch (error) { print("FAIL " + error + "\n"); failure = 1; app.quit(); return false }
    })
})
app.run(0, null)
return failure
