/**
 * demo/gio/tcp_client.nut
 *
 * Async TCP client using Gio.SocketClient. Connects to host:port, sends a
 * payload, reads the reply, prints it. With --self, also stands up an
 * in-process Gio.SocketService echo server and round-trips against itself.
 *
 * Usage:
 *   sqgi demo/gio/tcp_client.nut --self
 *   sqgi demo/gio/tcp_client.nut --host=127.0.0.1 --port=9101 --payload='hi'
 *
 * Exercises:
 *   - async function + await over connect_to_host_async / write_bytes_async
 *     / read_bytes_async
 *   - Gio.SocketService.add_inet_port + "incoming" signal
 *   - OutputStream/InputStream paired round trip
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local host      = "127.0.0.1"
local port      = 0
local payload   = "hello tcp\n"
local self_test = false

foreach (a in vargv) {
    if      (a == "--self")             self_test = true
    else if (a.find("--host=")    == 0) host    = a.slice(7)
    else if (a.find("--port=")    == 0) port    = a.slice(7).tointeger()
    else if (a.find("--payload=") == 0) payload = a.slice(10)
}

local loop = GLib.MainLoop.new(null, false)

local function start_echo_server() {
    local svc = Gio.SocketService.new()
    local p   = svc.add_any_inet_port(null)
    svc.connect("incoming", function(conn, src) {
        local input  = conn.get_input_stream()
        local output = conn.get_output_stream()
        local flags = Gio.OutputStreamSpliceFlags.close_source |
                      Gio.OutputStreamSpliceFlags.close_target
        output.splice_async(input, flags, GLib.PRIORITY_DEFAULT, null,
            function(self, res) { try { output.splice_finish(res) } catch (e) {} })
        return false
    })
    svc.start()
    return [svc, p]
}

async function run_client(h, p) {
    local client = Gio.SocketClient.new()
    print(format("connecting to %s:%d...\n", h, p))
    local conn = await client.connect_to_host_async(h, p)
    print("connected\n")
    local out = conn.get_output_stream()
    local inp = conn.get_input_stream()

    local n = await out.write_bytes_async(GLib.Bytes.new(payload),
                                          GLib.PRIORITY_DEFAULT)
    print(format("sent %d B\n", n))

    local need = payload.len()
    local buf  = ""
    while (buf.len() < need) {
        local got = await inp.read_bytes_async(need - buf.len(),
                                               GLib.PRIORITY_DEFAULT)
        local data = got.get_data()
        if (data.len() == 0) break  // EOF
        buf = buf + data.tostring()
    }
    print("recv: " + buf)
    if (buf.len() == 0 || buf.slice(buf.len()-1) != "\n") print("\n")
    conn.close(null)
}

if (self_test) {
    local pair = start_echo_server()
    local p    = pair[1]
    print(format("self-test: echo server on 127.0.0.1:%d\n", p))
    run_client("127.0.0.1", p)
        .then(function(_) { print("ok\n"); loop.quit() })
        .catch(function(e) { print("FAIL: "+e+"\n"); loop.quit() })
} else {
    if (port == 0) { print("--port=N required (or use --self)\n"); return }
    run_client(host, port)
        .then(function(_) { loop.quit() })
        .catch(function(e) { print("FAIL: "+e+"\n"); loop.quit() })
}

sqgi.timeout_add(5000, function() { print("deadline\n"); loop.quit(); return false })
loop.run()
