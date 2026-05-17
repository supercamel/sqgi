/**
 * demo/gio/cancel.nut
 *
 * Cancellation demo: start a long network read, then cancel via the Task's
 * attached GCancellable from a sqgi.timeout_add timer. Catches the resulting
 * rejection and reports cleanly.
 *
 * Usage:
 *   sqgi demo/gio/cancel.nut [HOST] [PATH] [--after=MS]
 *
 * Exercises:
 *   - Task.cancel() — fires the GCancellable propagated into the GIO call
 *   - g-io-error-quark cancelled mapping
 *   - Sleep race: sqgi.race between fetch + sqgi.sleep
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local host  = "example.com"
local path  = "/"
local after = 50      // ms before cancel
local positional = []
foreach (a in vargv) {
    if (a.find("--after=") == 0) after = a.slice(8).tointeger()
    else if (a.find("--") != 0) positional.append(a)
}
if (positional.len() >= 1) host = positional[0]
if (positional.len() >= 2) path = positional[1]

local loop = GLib.MainLoop.new(null, false)

async function slow_get(h, p) {
    local client = Gio.SocketClient.new()
    local conn = await client.connect_to_host_async(h, 80)
    local req = "GET " + p + " HTTP/1.0\r\nHost: " + h + "\r\n\r\n"
    await conn.get_output_stream().write_bytes_async(
        GLib.Bytes.new(req), GLib.PRIORITY_DEFAULT)
    local din = sqgi.new_object(Gio.DataInputStream, {
        "base-stream": conn.get_input_stream(),
    })
    din.set_newline_type(Gio.DataStreamNewlineType.any)
    local lines = 0
    while (true) {
        local res = await din.read_line_async(GLib.PRIORITY_DEFAULT)
        local line = (typeof(res) == "array") ? res[0] : res
        if (line == null) break
        lines = lines + 1
    }
    return lines
}

print(format("starting GET %s%s; cancelling in %d ms\n", host, path, after))

local task = slow_get(host, path)

sqgi.timeout_add(after, function() {
    print("→ cancelling task\n")
    task.cancel()
    return false
})

task.then(
    function(n) { print(format("completed: %d lines read\n", n)); loop.quit() },
    function(e) { print("cancelled/error: " + e + "\n"); loop.quit() })

sqgi.timeout_add(10000, function() { print("deadline\n"); loop.quit(); return false })
loop.run()
