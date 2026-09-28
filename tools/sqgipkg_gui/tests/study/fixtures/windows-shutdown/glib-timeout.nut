// Minimal GI timeout acceptance, independent of GTK and the Playground UI.
local GLib = import("GLib", "2.0")
local loop = GLib.MainLoop.new(null, false)
local fired = false
GLib.timeout_add(GLib.PRIORITY_DEFAULT, 10, function() {
    fired = true
    print("GLIB TIMEOUT FIRED\n")
    loop.quit()
    return false
})
loop.run()
if (!fired) throw "GLib timeout callback did not run"
