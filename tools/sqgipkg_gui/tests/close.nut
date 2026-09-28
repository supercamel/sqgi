// A clean editor must exit after one close request, without app.quit assistance.
local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local A = import("../src/application.nut")
local app = Gtk.Application.new("org.sqgi.ManifestStudio.CloseTest", Gio.ApplicationFlags.non_unique)
local editor = null, failure = 0
app.connect("activate", function() {
    editor = A.Application(app)
    sqgi.timeout_add(100, function() {
        if (editor.inspection.busy) return true
        editor.window.close()
        sqgi.timeout_add(1200, function() {
            print("FAIL single close request did not exit the editor\n")
            failure = 1; app.quit(); return false
        })
        return false
    })
})
app.run(0, null)
if (!failure) print("PASS JOB-idle-close\n")
return failure
