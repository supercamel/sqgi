/**
 * demo/glib/mainloop_timer.nut
 *
 * Minimal GLib main loop with a periodic timeout. Demonstrates:
 *   - GLib.MainLoop.new / run / quit
 *   - sqgi.timeout_add (returns false to stop, true to keep firing)
 *
 * Usage: sqgi demo/glib/mainloop_timer.nut
 */

local GLib = import("GLib")

local loop = GLib.MainLoop.new(null, false)
local ticks = 0

sqgi.timeout_add(200, function() {
    ticks++
    print("tick " + ticks + "\n")
    if (ticks >= 5) {
        loop.quit()
        return false   // stop the timer
    }
    return true        // keep firing
})

print("starting main loop; will tick 5 times then quit\n")
loop.run()
print("done\n")
