/**
 * demo/gio/udp_broadcast.nut
 *
 * Async UDP broadcast demo. Listener and sender run together under a single
 * GMainLoop using sqgi.socket_add_watch for non-blocking receives. Uses the
 * loopback broadcast address (127.255.255.255) so the demo is self-contained
 * and reliable on Linux without external network configuration.
 *
 * Usage:
 *   sqgi demo/gio/udp_broadcast.nut                      # self-test
 *   sqgi demo/gio/udp_broadcast.nut --listen --port=9301
 *   sqgi demo/gio/udp_broadcast.nut --send --port=9301 --bcast=255.255.255.255
 *
 * Exercises:
 *   - Gio.Socket.set_broadcast(true)
 *   - bind() to 0.0.0.0 with allow_reuse=true
 *   - sqgi.socket_add_watch + GLib.IOCondition.in
 *   - send_to to a broadcast address
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local mode       = "self"
local port       = 9301
local bcast      = "127.255.255.255"      // loopback broadcast (works on Linux)
local count      = 3
local deadline_s = 5

foreach (a in vargv) {
    if      (a == "--listen") mode = "listen"
    else if (a == "--send")   mode = "send"
    else if (a.find("--port=")  == 0)    port  = a.slice(7).tointeger()
    else if (a.find("--bcast=") == 0)    bcast = a.slice(8)
    else if (a.find("--count=") == 0)    count = a.slice(8).tointeger()
    else if (a.find("--deadline=") == 0) deadline_s = a.slice(11).tointeger()
}

local function mk_inet_addr(ip_str, p) {
    return sqgi.new_object(Gio.InetSocketAddress, {
        "address": Gio.InetAddress.new_from_string(ip_str),
        "port":    p,
    })
}

local function mk_udp() {
    local s = Gio.Socket.new(Gio.SocketFamily.ipv4,
                             Gio.SocketType.datagram,
                             Gio.SocketProtocol.udp)
    s.set_blocking(false)
    s.set_broadcast(true)
    return s
}

local loop = GLib.MainLoop.new(null, false)

if (mode == "listen") {
    local s = mk_udp()
    s.bind(mk_inet_addr("0.0.0.0", port), true)
    print(format("listening for broadcasts on 0.0.0.0:%d\n", port))
    sqgi.socket_add_watch(s, GLib.IOCondition.in, function(sock, cond) {
        local r = sock.receive_bytes_from(1500, 0, null)
        print(format("  bcast from %s:%d -> %s\n",
                     r[1].get_address().to_string(), r[1].get_port(),
                     r[0].get_data().tostring()))
        return true
    })
    loop.run()
} else if (mode == "send") {
    local s = mk_udp()
    s.bind(mk_inet_addr("0.0.0.0", 0), true)
    local dst = mk_inet_addr(bcast, port)
    local sent = 0
    sqgi.timeout_add(100, function() {
        sent = sent + 1
        local msg = format("broadcast #%d", sent)
        local n = s.send_to(dst, msg, null)
        print(format("  sent %d B to %s:%d\n", n, bcast, port))
        if (sent >= count) { loop.quit(); return false }
        return true
    })
    loop.run()
} else {
    // self-test: listener + sender on loopback broadcast, single GMainLoop.
    local rx = mk_udp()
    rx.bind(mk_inet_addr("0.0.0.0", port), true)
    print(format("self-test: listening on 0.0.0.0:%d, sending to %s:%d\n",
                 port, bcast, port))
    local got = 0
    sqgi.socket_add_watch(rx, GLib.IOCondition.in, function(sock, cond) {
        local r = sock.receive_bytes_from(1500, 0, null)
        got = got + 1
        print(format("  rx '%s' from %s:%d\n",
                     r[0].get_data().tostring(),
                     r[1].get_address().to_string(),
                     r[1].get_port()))
        if (got >= count) { print("ok\n"); loop.quit() }
        return true
    })

    local tx = mk_udp()
    tx.bind(mk_inet_addr("0.0.0.0", 0), true)
    local dst = mk_inet_addr(bcast, port)
    local sent = 0
    sqgi.timeout_add(50, function() {
        sent = sent + 1
        tx.send_to(dst, format("broadcast #%d", sent), null)
        return sent < count
    })

    sqgi.timeout_add(deadline_s * 1000, function() {
        print(format("deadline: got %d/%d\n", got, count)); loop.quit(); return false
    })
    loop.run()
}
