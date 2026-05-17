/**
 * demo/glib/idle_drain.nut
 *
 * Demonstrates manually pumping a GLib.MainContext without a MainLoop —
 * useful for embedding GLib's source dispatch inside another loop, or
 * for tests that need to drain pending work synchronously.
 *
 * Usage: sqgi demo/glib/idle_drain.nut
 *
 * Exercises:
 *   - GLib.MainContext.default
 *   - sqgi.timeout_add
 *   - ctx.iteration(may_block) as an alternative to loop.run()
 */

local GLib = import("GLib")

local ctx = GLib.MainContext.default()

local events = []
sqgi.timeout_add(20, function() {
    events.push("fast")
    return events.len() < 3
})
sqgi.timeout_add(50, function() {
    events.push("slow")
    return events.len() < 6
})

print("draining context manually...\n")
local started = GLib.get_monotonic_time()
while (events.len() < 6) {
    ctx.iteration(true)               // block until at least one source ready
    if (GLib.get_monotonic_time() - started > 2 * 1000 * 1000) {
        print("timed out\n")
        break
    }
}

print("events: " + events.len() + "\n")
foreach (i, e in events) print("  " + i + ": " + e + "\n")
