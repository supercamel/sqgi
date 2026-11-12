local Gtk = import("Gtk", "4.0"), GLib = import("GLib"), Gio = import("Gio"), Worker = import("SqWorker", "1.0")
local Probe = import("probe.nut"), report = { passed = false }, label = null, child = null
local app = Gtk.Application.new("org.sqgi.android.gserialqualification", Gio.ApplicationFlags.non_unique)
function save() {
    local text = sqgi.json.stringify(report)
    GLib.file_set_contents(GLib.get_home_dir() + "/serial-result.json", text, text.len()); label.set_text(text)
}
function fail(error) {
    report.error <- error.tostring()
    if (child != null) try { child.force_exit() } catch (ignored) {}
    save()
}
app.connect("activate", function() {
    local window = Gtk.ApplicationWindow.new(app); window.set_title("Android USB serial qualification")
    window.set_default_size(1000, 700); label = Gtk.Label.new("Checking native GSerial and Android USB discovery...")
    label.set_wrap(true); window.set_child(label); window.present()
    sqgi.timeout_add(100, function() {
        try {
            report.direct <- Probe.check()
            local root = GLib.get_current_dir(), token = GLib.uuid_string_random()
            local launcher = Worker.Launcher.new(Gio.SubprocessFlags.stdout_pipe | Gio.SubprocessFlags.stderr_pipe)
            launcher.set_cwd(root); child = launcher.spawnv(["sqgi", root + "/worker.nut", token]); save()
            child.wait_async(null, function(process, result) {
                try {
                    process.wait_finish(result)
                    local output = process.get_stdout_pipe().read_bytes(16384, null).get_data()
                    local errors = process.get_stderr_pipe().read_bytes(16384, null).get_data()
                    if (!process.get_successful()) throw "Serial worker failed: " + errors
                    local value = sqgi.json.parse(output); assert(value.token == token)
                    report.worker <- value; report.passed = true; child = null; save()
                } catch (error) { fail(error) }
            })
        } catch (error) { fail(error) }
        return false
    })
})
app.run([])
