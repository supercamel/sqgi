/**
 * demo/gio/http_head.nut
 *
 * Minimal HTTP/1.0 HEAD request over raw TCP, no libsoup. Demonstrates that
 * Gio is enough by itself for byte-oriented protocols — useful when libsoup
 * isn't desired or when probing exact protocol behaviour.
 *
 * Usage:
 *   sqgi demo/gio/http_head.nut [HOST] [PORT] [PATH]
 *   (defaults: example.com 80 /)
 *
 * Exercises:
 *   - Gio.SocketClient.connect_to_host_async  (awaitable wrapper)
 *   - Gio.DataOutputStream.put_string         (sync; small request)
 *   - Gio.DataInputStream.read_line_async     (awaitable wrapper)
 *
 * SQGI overrides every `<bn>_async` method on a GI class with an awaitable
 * wrapper: `await obj.foo_async(arg1, arg2)` runs the GI _async/_finish
 * pair as a Task and resolves to the finisher's return value. The raw GI
 * method is preserved as `<bn>_async_raw` for cases that need a custom
 * cancellable or callback.
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local host = (vargv.len() >= 1) ? vargv[0] : "example.com"
local port = (vargv.len() >= 2) ? vargv[1].tointeger() : 80
local path = (vargv.len() >= 3) ? vargv[2] : "/"

local loop = GLib.MainLoop.new(null, false)

async function head() {
    local client = Gio.SocketClient.new()

    local conn = await client.connect_to_host_async(host, port)
    print("connected to " + host + ":" + port + "\n")

    local req = "HEAD " + path + " HTTP/1.0\r\n" +
                "Host: " + host + "\r\n" +
                "Connection: close\r\n" +
                "User-Agent: sqgi-demo/1.0\r\n\r\n"

    local out = conn.get_output_stream()
    local n = await out.write_bytes_async(GLib.Bytes.new(req),
                                          GLib.PRIORITY_DEFAULT)
    if (n != req.len())
        throw "short write: " + n + "/" + req.len()

    // Wrap the raw input stream in a DataInputStream for newline framing.
    local din = sqgi.new_object(Gio.DataInputStream, {
        "base-stream": conn.get_input_stream(),
    })
    din.set_newline_type(Gio.DataStreamNewlineType.any)

    while (true) {
        // read_line_finish returns [string, length] (multi-out); unwrap.
        local res = await din.read_line_async(GLib.PRIORITY_DEFAULT)
        local line = (typeof(res) == "array") ? res[0] : res
        if (line == null) break
        if (line.len() == 0) {
            print("[end of headers]\n")
            break
        }
        print(line + "\n")
    }
    conn.close(null)
}

head().then(@(_) loop.quit(),
            function(e) { ::print("error: " + e + "\n"); loop.quit() })
loop.run()
