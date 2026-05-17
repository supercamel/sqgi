/**
 * demo/gio/udp_echo.nut
 *
 * Async UDP echo demo using Gio.Socket (datagram) + sqgi.socket_add_watch.
 * Runs a server and client concurrently in a single GMainLoop: each side
 * is non-blocking and reacts to G_IO_IN readiness via a GSource attached
 * to the default context.
 *
 * Usage:
 *   sqgi demo/gio/udp_echo.nut                        # self-test
 *   sqgi demo/gio/udp_echo.nut --server --port=9201   # echo server only
 *   sqgi demo/gio/udp_echo.nut --client=127.0.0.1:9201 --count=3
 *
 * Exercises:
 *   - Gio.Socket.new(ipv4, datagram, udp)
 *   - bind() with allow_reuse=true
 *   - set_blocking(false)
 *   - sqgi.socket_add_watch(socket, GLib.IOCondition.in, fn)
 *   - send_to / receive_bytes_from(size, 0 /-non-blocking-/, null)
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local mode  = "self"            // self | server | client
local host  = "127.0.0.1"
local port  = 9201
local count = 3
local deadline_s = 5            // overall timeout for self/client modes

foreach (a in vargv) {
    if      (a == "--server")           mode = "server"
    else if (a.find("--client=") == 0) { mode = "client"
        local hp = a.slice(9)
        local i = hp.find(":")
        if (i != null) { host = hp.slice(0, i); port = hp.slice(i+1).tointeger() }
        else           { port = hp.tointeger() }
    }
    else if (a.find("--port=")  == 0)     port  = a.slice(7).tointeger()
    else if (a.find("--count=") == 0)     count = a.slice(8).tointeger()
    else if (a.find("--deadline=") == 0)  deadline_s = a.slice(11).tointeger()
}

local function mk_addr(ip_str, p) {
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
    return s
}

local loop = GLib.MainLoop.new(null, false)

if (mode == "server") {
    local s = mk_udp()
    s.bind(mk_addr("0.0.0.0", port), true)
    print(format("echo server on 0.0.0.0:%d\n", port))
    sqgi.socket_add_watch(s, GLib.IOCondition.in, function(sock, cond) {
        local r = sock.receive_bytes_from(1500, 0, null)
        local data = r[0].get_data()
        local from = r[1]
        print(format("  recv %d B from %s:%d -> echo\n",
                     data.len(), from.get_address().to_string(), from.get_port()))
        sock.send_to(from, data.tostring(), null)
        return true
    })
    loop.run()
} else if (mode == "client") {
    local s = mk_udp()
    local dst = mk_addr(host, port)
    local got = 0
    sqgi.socket_add_watch(s, GLib.IOCondition.in, function(sock, cond) {
        local r = sock.receive_bytes_from(1500, 0, null)
        got = got + 1
        print(format("  client got: %s\n", r[0].get_data().tostring()))
        if (got >= count) loop.quit()
        return true
    })
    for (local i = 1; i <= count; i = i + 1) {
        s.send_to(dst, format("ping #%d", i), null)
    }
    sqgi.timeout_add(deadline_s * 1000, function() {
        print(format("deadline: got %d/%d\n", got, count)); loop.quit(); return false
    })
    loop.run()
} else {
    // self-test: server + client in one GMainLoop, fully async.
    local srv = mk_udp()
    srv.bind(mk_addr("127.0.0.1", 0), true)
    local sport = srv.get_local_address().get_port()
    print(format("self-test: server on 127.0.0.1:%d\n", sport))

    sqgi.socket_add_watch(srv, GLib.IOCondition.in, function(sock, cond) {
        local r = sock.receive_bytes_from(1500, 0, null)
        print(format("  server saw '%s' from :%d\n",
                     r[0].get_data().tostring(), r[1].get_port()))
        sock.send_to(r[1], "pong: " + r[0].get_data().tostring(), null)
        return true
    })

    local cli = mk_udp()
    local dst = mk_addr("127.0.0.1", sport)
    local got = 0
    sqgi.socket_add_watch(cli, GLib.IOCondition.in, function(sock, cond) {
        local r = sock.receive_bytes_from(1500, 0, null)
        got = got + 1
        print(format("  client got '%s'\n", r[0].get_data().tostring()))
        if (got >= count) { print("ok\n"); loop.quit() }
        return true
    })

    for (local i = 1; i <= count; i = i + 1) {
        cli.send_to(dst, format("ping #%d", i), null)
    }
    sqgi.timeout_add(deadline_s * 1000, function() {
        print(format("deadline: got %d/%d\n", got, count)); loop.quit(); return false
    })
    loop.run()
}
