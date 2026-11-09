// Optional real Android acceptance: installed Studio, cached catalogs and a real build.
local GLib = import("GLib"), Gio = import("Gio"), Gtk = import("Gtk", "4.0")
local root = GLib.getenv("SQGI_GUI_TEST_ROOT")
if (root == null) root = GLib.path_get_dirname(GLib.path_get_dirname(__FILE__))
local A = import(root + "/src/application.nut"), P = import(root + "/src/package_picker.nut")
local directory = vargv[0], capture = Gio.File.new_for_path(directory + "/capture-request.json")
local app = Gtk.Application.new("org.sqgi.ManifestStudio.AndroidTest", Gio.ApplicationFlags.non_unique)
local editor = null, stage = 0, failure = 0, selected = null, package_dialog = null, started = GLib.get_monotonic_time()
function require(ok, message) { if (!ok) throw message }
function shot(name, title) { capture.replace_contents(sqgi.json.stringify({name=name,title=title}), null, false, Gio.FileCreateFlags.none, null) }
app.connect("activate", function() {
    editor = A.Application(app, directory + "/sqgipkg.json")
    GLib.timeout_add(GLib.PRIORITY_DEFAULT, 500, function() {
        try {
            if (GLib.get_monotonic_time() - started > 300000000) throw "Android Studio acceptance timed out at stage " + stage
            if (capture.query_exists(null)) return true
            if (stage == 0) {
                if (editor.capabilities == null) return true
                editor.navigate("Targets")
                foreach (key in ["x86_64", "aarch64", "windows"]) editor.widgets["common.output." + key].set_active(false)
                foreach (key in ["android_arm64", "android_x86_64"]) editor.widgets["common.output." + key].set_active(true)
                editor.widgets["common.output.android_format"].set_selected(1)
                editor.widgets["common.target.apply"].activate(); stage++
            } else if (stage == 1) {
                require(editor.document.get(["target"]) == "android-aab", "Android output choice was not applied: " + editor.status.get_text())
                editor.widgets["android.module_set"].set_text("native-entry-r1")
                editor.widgets["android.version_name"].set_text("0.1.0-studio")
                editor.widgets["android.apply"].activate(); stage++
            } else if (stage == 2) {
                require(editor.document.get(["platforms", "android", "version_name"]) == "0.1.0-studio", "Android settings were not applied")
                shot("studio-android-targets", "SQGI Manifest Studio")
                stage++
            } else if (stage == 3) {
                if (package_dialog == null) { package_dialog = P.open(editor.window, directory, editor.widgets, function(name) { selected = name },
                    "Use the current unsaved manifest's Android module release.", "x86_64-linux-android", editor.document.text); return true }
                if (!("packages.result.sqentry-application" in editor.widgets)) {
                    require(editor.widgets["packages.status"].get_text().find("Could not") == null, editor.widgets["packages.status"].get_text())
                    return true
                }
                editor.widgets["packages.result.sqentry-application"].activate(); stage++
            } else if (stage == 4) {
                require(editor.widgets["packages.details"].get_text().find("Android x86_64") != null, "Android catalog was mislabeled")
                shot("studio-android-packages", "Find Ooblerg packages")
                stage++
            } else if (stage == 5) {
                if (selected == null) { editor.widgets["packages.add"].activate(); return true }
                require(selected == "sqentry-application", "Package picker did not return the module")
                editor.document.save(editor.document.path); editor.refresh(); editor.navigate("Review"); editor.inspect("explain"); stage++
            } else if (stage == 6) {
                if (editor.inspection.busy) return true
                local result = editor.results.explain
                require(result.error == null && result.result.ok, "Studio Android resolve failed: " + sqgi.json.stringify(result))
                require(result.result.configurations.len() == 1 && result.result.configurations[0].architecture == "multi", "Bundle resolution lost its ABI list")
                require(editor.widgets["review.build"].get_sensitive(), "Studio Android build action unavailable")
                editor.widgets["review.build"].activate(); stage++
            } else if (stage == 7) {
                if (editor.build_job.busy) return true
                require(editor.build_job.result_error == null && editor.build_job.outputs.len() == 1, "Studio build failed: " + editor.build_job.state + " / " + editor.build_job.result_error + " / " + editor.build_job.log_path)
                require(editor.build_job.outputs[0].kind == "android-aab" && editor.build_job.outputs[0].architecture == "multi", "Studio lost the Android artifact")
                require(editor.widgets["build.output.0"].get_text().find("Android App Bundle") != null, "Studio mislabeled the bundle")
                local report = { passed=true, manifest=editor.document.path, outputs=editor.build_job.outputs,
                    log=editor.build_job.log_path, result=editor.build_job.result_path, state=editor.build_job.state, package=selected }
                Gio.File.new_for_path(directory + "/studio-report.json").replace_contents(sqgi.json.stringify(report), null, false, Gio.FileCreateFlags.none, null)
                shot("studio-android-artifact", "Build selected packages"); stage++
            } else { print("PASS Android Studio settings, catalog, inspection and real bundle build\n"); app.quit(); return false }
            return true
        } catch (error) { failure = 1; print("FAIL stage " + stage + ": " + error + "\n"); app.quit(); return false }
    })
})
app.run(0, null)
return failure
