/**
 * demo/gio/tls_get.nut
 *
 * Async TLS GET over Gio.SocketClient + GIO's transparent TLS layer.
 * Connects to a host:443, performs an HTTPS HEAD, prints the response.
 *
 * Usage:
 *   sqgi demo/gio/tls_get.nut [HOST] [PATH]
 *   sqgi demo/gio/tls_get.nut example.com /
 *
 * Exercises:
 *   - Gio.SocketClient.set_tls(true)
 *   - connect_to_host_async over TLS (transparent wrap)
 *   - DataInputStream.read_line_async newline framing
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local host = (vargv.len() >= 1) ? vargv[0] : "example.com"
local path = (vargv.len() >= 2) ? vargv[1] : "/"

local loop = GLib.MainLoop.new(null, false)

async function head() {
    local client = Gio.SocketClient.new()
    client.set_tls(true)
    print(format("TLS connecting to %s:443...\n", host))
    local conn = await client.connect_to_host_async(host, 443)
    print("connected\n")

    local req = "HEAD " + path + " HTTP/1.0\r\n" +
                "Host: " + host + "\r\n" +
                "Connection: close\r\n" +
                "User-Agent: sqgi-demo/1.0\r\n\r\n"
    await conn.get_output_stream().write_bytes_async(
        GLib.Bytes.new(req), GLib.PRIORITY_DEFAULT)

    local din = sqgi.new_object(Gio.DataInputStream, {
        "base-stream": conn.get_input_stream(),
    })
    din.set_newline_type(Gio.DataStreamNewlineType.any)
    while (true) {
        local res = await din.read_line_async(GLib.PRIORITY_DEFAULT)
        local line = (typeof(res) == "array") ? res[0] : res
        if (line == null) break
        if (line.len() == 0) { print("[end of headers]\n"); break }
        print(line + "\n")
    }
    conn.close(null)
}

head().then(@(_) loop.quit(),
            function(e) { ::print("error: " + e + "\n"); loop.quit() })
sqgi.timeout_add(15000, function() { print("deadline\n"); loop.quit(); return false })
loop.run()
