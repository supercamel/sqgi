/**
 * demo/soup/server.nut
 *
 * Minimal libsoup HTTP server with several endpoints:
 *
 *   GET  /                     plain-text greeting
 *   GET  /api/hello?name=NAME  JSON greeting
 *   GET  /api/time             JSON {now=monotonic}
 *   POST /api/echo             echoes back the request body (as JSON if JSON)
 *   *    /quit                 stops the server
 *
 * Run it standalone:
 *
 *   sqgi demo/soup/server.nut
 *
 * Then in another terminal:
 *
 *   curl http://127.0.0.1:8080/
 *   curl 'http://127.0.0.1:8080/api/hello?name=sam'
 *   curl http://127.0.0.1:8080/api/time
 *   curl -X POST -H 'Content-Type: application/json' \
 *        -d '{"x":1,"y":2}' http://127.0.0.1:8080/api/echo
 *   curl http://127.0.0.1:8080/quit
 *
 * Pass `--port=N`  to pick a fixed port (default 8080; use 0 for an
 * ephemeral one). Pass `--selftest` to spin up the server, run an
 * in-process client against every endpoint, and exit.
 */

local GLib = import("GLib")
local Soup = import("Soup")

// ── option parsing (tiny ad-hoc) ───────────────────────────────────────────
local port      = 8080
local do_selftest = false
foreach (a in vargv) {
    if (a.find("--port=") == 0)      port = a.slice(7).tointeger()
    else if (a == "--selftest")      do_selftest = true
}

// ── helpers ───────────────────────────────────────────────────────────────
function send_text(msg, status, text) {
    msg.set_status(status, null)
    // Pass a plain Squirrel string: Soup.ServerMessage.set_response takes
    // (content_type, memuse, char*, size_t).  GLib.Bytes does NOT marshal
    // correctly here.
    msg.set_response("text/plain; charset=utf-8", Soup.MemoryUse.copy, text)
}

function send_json(msg, status, value) {
    msg.set_status(status, null)
    msg.set_response("application/json; charset=utf-8",
                     Soup.MemoryUse.copy, sqgi.json.stringify(value))
}

function or_none(s) { return s != null ? s : "(none)" }

// ── server ────────────────────────────────────────────────────────────────
local server = sqgi.new_object(Soup.Server, {})
local loop   = GLib.MainLoop.new(null, false)

server.add_handler("/", function(_s, msg, path, _q) {
    // Fallback / 404 handler — but also handles the root "/" path.
    if (path == "/") {
        send_text(msg, 200, "hello from sqgi soup server\n" +
                            "try /api/hello, /api/time, POST /api/echo, /quit\n")
    } else {
        send_text(msg, 404, "not found: " + path + "\n")
    }
})

server.add_handler("/api/hello", function(_s, msg, _p, query) {
    local name = (query != null && "name" in query) ? query["name"] : "world"
    send_json(msg, 200, { greeting = "hello, " + name })
})

server.add_handler("/api/time", function(_s, msg, _p, _q) {
    send_json(msg, 200, {
        now_monotonic_us = GLib.get_monotonic_time(),
        wall_us          = GLib.get_real_time()
    })
})

server.add_handler("/api/echo", function(_s, msg, _p, _q) {
    if (msg.get_method() != "POST") {
        msg.get_response_headers().append("Allow", "POST")
        send_text(msg, 405, "POST required\n")
        return
    }
    // Read the whole request body via flatten() → GBytes → string.
    local text = msg.get_request_body().flatten().get_data()
    local ct   = msg.get_request_headers().get_one("Content-Type")
    if (ct != null && ct.find("application/json") != null) {
        try {
            send_json(msg, 200, { received = sqgi.json.parse(text) })
        } catch (e) {
            send_json(msg, 400, { error = "invalid JSON", detail = e.tostring() })
        }
    } else {
        send_text(msg, 200, "received " + text.len() + " bytes:\n" + text)
    }
})

server.add_handler("/quit", function(_s, msg, _p, _q) {
    send_text(msg, 200, "shutting down\n")
    sqgi.timeout_add(50, function() { loop.quit(); return false })
})

server.listen_local(port, Soup.ServerListenOptions.ipv4_only)
local uris = server.get_uris()
print("Listening:\n")
foreach (u in uris) print("  " + u.to_string() + "\n")

// ── optional in-process self-test ─────────────────────────────────────────
if (do_selftest) {
    local target = uris[0].to_string()

    async function selftest() {
        local sess = Soup.Session.new()
        local checks = 0
        local fails  = 0

        function assert_ok(name, cond, detail) {
            checks += 1
            if (cond) {
                print("  PASS  " + name + "\n")
            } else {
                fails += 1
                print("  FAIL  " + name + ": " + detail + "\n")
            }
        }

        // /
        local m = Soup.Message.new("GET", target)
        local b = await sess.send_and_read_async(m, GLib.PRIORITY_DEFAULT)
        assert_ok("GET /", m.get_status() == 200 && b.get_data().find("hello from sqgi") != null,
                  "status=" + m.get_status())

        // /api/hello?name=sqgi
        m = Soup.Message.new("GET", target + "api/hello?name=sqgi")
        b = await sess.send_and_read_async(m, GLib.PRIORITY_DEFAULT)
        local hello = sqgi.json.parse(b.get_data())
        assert_ok("GET /api/hello", hello.greeting == "hello, sqgi",
                  "got " + sqgi.json.stringify(hello))

        // /api/time
        m = Soup.Message.new("GET", target + "api/time")
        b = await sess.send_and_read_async(m, GLib.PRIORITY_DEFAULT)
        local t = sqgi.json.parse(b.get_data())
        assert_ok("GET /api/time", typeof t.now_monotonic_us == "integer",
                  "got " + sqgi.json.stringify(t))

        // POST /api/echo with JSON
        m = Soup.Message.new("POST", target + "api/echo")
        local payload = { x = 1, y = "two", z = [3, 4, 5] }
        m.set_request_body_from_bytes("application/json",
            GLib.Bytes.new(sqgi.json.stringify(payload)))
        b = await sess.send_and_read_async(m, GLib.PRIORITY_DEFAULT)
        local echoed = sqgi.json.parse(b.get_data())
        assert_ok("POST /api/echo (json)",
                  echoed.received.x == 1 && echoed.received.y == "two" &&
                  echoed.received.z.len() == 3,
                  "got " + sqgi.json.stringify(echoed))

        // POST /api/echo with plain text
        m = Soup.Message.new("POST", target + "api/echo")
        m.set_request_body_from_bytes("text/plain", GLib.Bytes.new("plain body"))
        b = await sess.send_and_read_async(m, GLib.PRIORITY_DEFAULT)
        assert_ok("POST /api/echo (text)",
                  b.get_data().find("plain body") != null,
                  "got " + b.get_data())

        // 404
        m = Soup.Message.new("GET", target + "no/such/path")
        b = await sess.send_and_read_async(m, GLib.PRIORITY_DEFAULT)
        assert_ok("GET 404", m.get_status() == 404, "status=" + m.get_status())

        // 405
        m = Soup.Message.new("PUT", target + "api/echo")
        b = await sess.send_and_read_async(m, GLib.PRIORITY_DEFAULT)
        assert_ok("PUT /api/echo → 405",
                  m.get_status() == 405 &&
                  or_none(m.get_response_headers().get_one("Allow")) == "POST",
                  "status=" + m.get_status())

        print("\n" + (checks - fails) + "/" + checks + " checks passed\n")

        loop.quit()
    }

    selftest().catch(function(e) {
        print("selftest threw: " + e + "\n")
        loop.quit()
    })
} else {
    print("Press Ctrl-C to stop, or hit /quit.\n")
}

loop.run()
