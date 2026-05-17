/**
 * demo/soup/cancel.nut
 *
 * Demonstrate cancelling an in-flight libsoup request via `task.cancel()`.
 * The auto-async wrapper that turns `send_and_read_async` into an
 * awaitable Task also wires its `GCancellable` to the Task — so cancelling
 * the Task aborts the underlying HTTP request.
 *
 * Usage: sqgi demo/soup/cancel.nut [URL] [delay-ms]
 *        (default: https://httpbin.org/delay/5  and 250 ms)
 */

local GLib = import("GLib")
local Soup = import("Soup")

local url      = (vargv.len() >= 1) ? vargv[0]            : "https://httpbin.org/delay/5"
local delay_ms = (vargv.len() >= 2) ? vargv[1].tointeger() : 250

local loop = GLib.MainLoop.new(null, false)

async function main() {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("GET", url)

    local task = session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)

    // Cancel after a short delay.
    sqgi.timeout_add(delay_ms, function() {
        print("→ cancelling after " + delay_ms + " ms\n")
        task.cancel("user requested abort")
        return false
    })

    try {
        local bytes = await task
        print("unexpectedly completed: status=" + msg.get_status() +
              " bytes=" + bytes.get_size() + "\n")
    } catch (e) {
        if (typeof e == "table" && ("__cancelled" in e)) {
            print("cancelled cleanly. reason: " + e.reason + "\n")
        } else {
            print("rejected: " + e + "\n")
        }
    }
    loop.quit()
}

main()
loop.run()
