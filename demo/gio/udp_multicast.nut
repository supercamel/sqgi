/**
 * demo/gio/udp_multicast.nut
 *
 * Async UDP multicast demo. Joins a multicast group on the loopback
 * interface, then sends and receives a few datagrams under a single
 * GMainLoop using sqgi.socket_add_watch for non-blocking receives.
 *
 * Usage:
 *   sqgi demo/gio/udp_multicast.nut                       # self-test
 *   sqgi demo/gio/udp_multicast.nut --listen --port=9401
 *   sqgi demo/gio/udp_multicast.nut --send --port=9401
 *
 * Exercises:
 *   - join_multicast_group(group, source_specific=false, iface)
 *   - set_multicast_loopback(true), set_multicast_ttl(N)
 *   - sqgi.socket_add_watch + GLib.IOCondition.in
 *   - send_to to a multicast group address
 *   - leave_multicast_group on cleanup
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local mode       = "self"
local port       = 9401
local group      = "224.0.0.123"
local iface      = "lo"
local count      = 3
local ttl        = 1
local deadline_s = 5

foreach (a in vargv) {
    if      (a == "--listen") mode = "listen"
    else if (a == "--send")   mode = "send"
    else if (a.find("--port=")  == 0)    port  = a.slice(7).tointeger()
    else if (a.find("--group=") == 0)    group = a.slice(8)
    else if (a.find("--iface=") == 0)    iface = a.slice(8)
    else if (a.find("--count=") == 0)    count = a.slice(8).tointeger()
    else if (a.find("--ttl=")   == 0)    ttl   = a.slice(6).tointeger()
    else if (a.find("--deadline=") == 0) deadline_s = a.slice(11).tointeger()
}

local function mk_inet_addr(ip_str, p) {
    return sqgi.new_object(Gio.InetSocketAddress, {
        "address": Gio.InetAddress.new_from_string(ip_str),
        "port":    p,
    })
}

local function mk_udp() {
    return Gio.Socket.new(Gio.SocketFamily.ipv4,
                          Gio.SocketType.datagram,
                          Gio.SocketProtocol.udp)
}

local function receiver(p, grp, ifname) {
    local s = mk_udp()
    s.bind(mk_inet_addr("0.0.0.0", p), true)
    s.set_blocking(false)
    s.set_multicast_loopback(true)
    s.join_multicast_group(Gio.InetAddress.new_from_string(grp), false, ifname)
    return s
}

local function transmitter(ttl_) {
    local s = mk_udp()
    // Bind to the loopback address so multicast packets route via 'lo'.
    s.bind(mk_inet_addr("127.0.0.1", 0), true)
    s.set_blocking(false)
    s.set_multicast_loopback(true)
    s.set_multicast_ttl(ttl_)
    return s
}

local loop = GLib.MainLoop.new(null, false)

if (mode == "listen") {
    local s = receiver(port, group, iface)
    print(format("joined %s, listening on 0.0.0.0:%d (iface=%s)\n",
                 group, port, iface))
    sqgi.socket_add_watch(s, GLib.IOCondition.in, function(sock, cond) {
        local r = sock.receive_bytes_from(1500, 0, null)
        print(format("  mcast from %s:%d -> %s\n",
                     r[1].get_address().to_string(), r[1].get_port(),
                     r[0].get_data().tostring()))
        return true
    })
    loop.run()
    s.leave_multicast_group(Gio.InetAddress.new_from_string(group), false, iface)
} else if (mode == "send") {
    local s = transmitter(ttl)
    local dst = mk_inet_addr(group, port)
    local sent = 0
    sqgi.timeout_add(100, function() {
        sent = sent + 1
        local n = s.send_to(dst, format("multicast #%d", sent), null)
        print(format("  sent %d B to %s:%d (ttl=%d)\n", n, group, port, ttl))
        if (sent >= count) { loop.quit(); return false }
        return true
    })
    loop.run()
} else {
    // self-test: receiver + transmitter in one GMainLoop.
    local rx = receiver(port, group, iface)
    local tx = transmitter(ttl)
    print(format("self-test: group %s, port %d, iface %s\n", group, port, iface))
    local dst = mk_inet_addr(group, port)
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

    local sent = 0
    sqgi.timeout_add(50, function() {
        sent = sent + 1
        tx.send_to(dst, format("multicast #%d", sent), null)
        return sent < count
    })

    sqgi.timeout_add(deadline_s * 1000, function() {
        print(format("deadline: got %d/%d\n", got, count)); loop.quit(); return false
    })
    loop.run()
    rx.leave_multicast_group(Gio.InetAddress.new_from_string(group), false, iface)
}
