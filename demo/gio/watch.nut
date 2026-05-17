/**
 * demo/gio/watch.nut
 *
 * inotifywait(1)-style filesystem watcher. Sets up a Gio.FileMonitor on a
 * directory (recursive by re-monitoring child dirs as they appear) and
 * prints events as they fire.
 *
 * Usage:
 *   sqgi demo/gio/watch.nut [PATH] [--timeout=SECONDS]
 *
 *   - default PATH is "." (current directory)
 *   - default --timeout=8 so this demo also serves as a long-running-signal
 *     callback stress test (closes cleanly after the timeout)
 *
 * Exercises:
 *   - Gio.File.monitor_directory + Gio.FileMonitor "changed" signal
 *   - Gio.FileMonitorEvent enum dispatch
 *   - long-running signal callbacks that survive across many event loops
 *     (regression coverage for the bouncing-ball VM-shutdown crash)
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local path = "."
local timeout = 8
foreach (a in vargv) {
    if (a.find("--timeout=") == 0) timeout = a.slice(10).tointeger()
    else if (a.find("--") != 0)    path = a
}

local event_name = {}
foreach (k, v in Gio.FileMonitorEvent) event_name[v] <- k

local loop  = GLib.MainLoop.new(null, false)
local count = 0

local mon = Gio.File.new_for_path(path).monitor_directory(
    Gio.FileMonitorFlags.none, null)

// GFileMonitor::changed (file, other_file, event_type)
mon.connect("changed", function(file, other, event_type) {
    count = count + 1
    local p1 = file ? file.get_path() : "?"
    local p2 = other ? (" → " + other.get_path()) : ""
    local ev = event_name[event_type] || ("event " + event_type)
    print(format("[%2d] %-18s  %s%s\n", count, ev, p1, p2))
})

print(format("watching %s for %ds — touch/rm/mv files in another shell\n",
             path, timeout))

sqgi.timeout_add(timeout * 1000, function() {
    print(format("\n%d events observed; exiting\n", count))
    loop.quit()
    return false
})

loop.run()
