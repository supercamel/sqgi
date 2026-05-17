/**
 * demo/gio/tcp_echo.nut
 *
 * TCP echo server using Gio.SocketService — accepts an inbound connection
 * on the chosen port, and pipes the input back to the output by splicing
 * the connection's input stream into its output stream.
 *
 * Usage (two terminals):
 *   sqgi demo/gio/tcp_echo.nut --port=9101 --timeout=20
 *   echo hello | nc 127.0.0.1 9101
 *
 * Exercises:
 *   - Gio.SocketService + Gio.InetSocketAddress + Gio.InetAddress.new_loopback
 *   - "incoming" signal callbacks holding live state across many fires
 *   - Gio.IOStream → splice (input → output)
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local port    = 9101
local timeout = 0
foreach (a in vargv) {
    if (a.find("--port=") == 0)    port    = a.slice(7).tointeger()
    if (a.find("--timeout=") == 0) timeout = a.slice(10).tointeger()
}

local loop     = GLib.MainLoop.new(null, false)
local service  = Gio.SocketService.new()
local addr     = sqgi.new_object(Gio.InetSocketAddress, {
    "address": Gio.InetAddress.new_loopback(Gio.SocketFamily.ipv4),
    "port":    port,
})

local effective = service.add_address(addr, Gio.SocketType.stream,
                                      Gio.SocketProtocol.tcp, null)
print(format("listening on 127.0.0.1:%d (timeout=%ds)\n", port, timeout))

local conns = 0
// GSocketService::incoming (connection: GSocketConnection, source_object: GObject) → bool
service.connect("incoming", function(connection, source) {
    conns = conns + 1
    local n = conns
    print(format("[%d] connection accepted\n", n))

    local input  = connection.get_input_stream()
    local output = connection.get_output_stream()

    // splice input → output asynchronously; close both when source EOFs.
    local flags = Gio.OutputStreamSpliceFlags.close_source |
                  Gio.OutputStreamSpliceFlags.close_target
    output.splice_async(input, flags, GLib.PRIORITY_DEFAULT, null,
        function(self, res) {
            try {
                local nbytes = output.splice_finish(res)
                print(format("[%d] echoed %d bytes\n", n, nbytes))
            } catch (e) {
                print(format("[%d] splice error: %s\n", n, e))
            }
        })
    return false  // continue, allow other "incoming" handlers
})

service.start()

if (timeout > 0) {
    sqgi.timeout_add(timeout * 1000, function() {
        print(format("\n%d connections served; stopping\n", conns))
        service.stop()
        loop.quit()
        return false
    })
}

loop.run()
