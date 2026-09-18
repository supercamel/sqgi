local GLib = import("GLib")
local GtkSource = import("GtkSource", "5")
local Formatter = import("editors/gtksourceview/format.nut")
local command = ["node", GLib.build_filenamev([GLib.get_current_dir(), "tools", "sqgifmt"])]
local loop = GLib.MainLoop.new(null, false)
local failed = false
async function checks() {
    local b = GtkSource.Buffer.new(null)
    b.set_text("local x=1\n", -1)
    local pending = Formatter.format_buffer(b, command)
    b.set_text("local newer = 2\n", -1)
    local caught = false
    try { await pending } catch (e) { caught = e.find("changed while formatting") != null }
    if (!caught || b.get_text(b.get_start_iter(), b.get_end_iter(), true) != "local newer = 2\n")
        throw "stale formatter result was not discarded"
    b.set_text("f(", -1)
    caught = false
    try { await Formatter.format_buffer(b, command) } catch (e) { caught = true }
    if (!caught || b.get_text(b.get_start_iter(), b.get_end_iter(), true) != "f(")
        throw "formatter error changed the buffer"
    b.set_text("local x = 1\n", -1)
    if (await Formatter.format_buffer(b, command)) throw "unchanged buffer reported an edit"
    print("GtkSource formatter: stale results, errors, and no-op passed\n")
}
checks().then(function(_) { loop.quit() }).catch(function(e) { print(e + "\n"); failed = true; loop.quit() })
loop.run()
if (failed) throw "GtkSource adapter checks failed"
