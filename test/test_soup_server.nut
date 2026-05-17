// test/test_soup_server.nut
//
// Self-contained libsoup server + client test. Spins up a Soup.Server on
// loopback, makes in-process HTTP requests against every endpoint, and
// asserts the expected behaviour. No external network is required.
//
// Covers:
//   - sqgi.new_object(Soup.Server, {}) construction
//   - server.listen_local with port 0 (kernel-assigned)
//   - text and JSON responses via set_response(content_type, memuse, string)
//   - query-string parameter access (`query` is null-or-table)
//   - request body reading via msg.get_request_body().flatten().get_data()
//   - JSON round-trip with sqgi.json.parse/stringify
//   - 404 and 405 paths
//   - Per-request cancellation via task.cancel()

local GLib = import("GLib")
local Soup = import("Soup")

local checks = 0
local fails  = 0
local fail_lines = []

function check(name, cond, detail) {
    checks += 1
    if (!cond) {
        fails += 1
        fail_lines.push(name + ": " + detail)
        print("  FAIL  " + name + ": " + detail + "\n")
    } else {
        print("  ok    " + name + "\n")
    }
}

// ── server ────────────────────────────────────────────────────────────────
local server = sqgi.new_object(Soup.Server, {})

server.add_handler("/", function(_s, msg, path, _q) {
    if (path == "/") {
        msg.set_status(200, null)
        msg.set_response("text/plain", Soup.MemoryUse.copy, "root ok\n")
    } else {
        msg.set_status(404, null)
        msg.set_response("text/plain", Soup.MemoryUse.copy, "missing\n")
    }
})

server.add_handler("/api/hello", function(_s, msg, _p, query) {
    local name = (query != null && "name" in query) ? query["name"] : "world"
    msg.set_status(200, null)
    msg.set_response("application/json", Soup.MemoryUse.copy,
                     sqgi.json.stringify({ greeting = "hello, " + name }))
})

server.add_handler("/api/echo", function(_s, msg, _p, _q) {
    if (msg.get_method() != "POST") {
        msg.get_response_headers().append("Allow", "POST")
        msg.set_status(405, null)
        msg.set_response("text/plain", Soup.MemoryUse.copy, "POST only\n")
        return
    }
    local text = msg.get_request_body().flatten().get_data()
    local ct   = msg.get_request_headers().get_one("Content-Type")
    if (ct != null && ct.find("application/json") != null) {
        msg.set_status(200, null)
        msg.set_response("application/json", Soup.MemoryUse.copy,
                         sqgi.json.stringify({ received = sqgi.json.parse(text) }))
    } else {
        msg.set_status(200, null)
        msg.set_response("text/plain", Soup.MemoryUse.copy,
                         "len=" + text.len() + ";body=" + text)
    }
})

server.add_handler("/slow", function(_s, msg, _p, _q) {
    // Defer response to give the client a chance to cancel.
    msg.pause()
    sqgi.timeout_add(2000, function() {
        msg.set_status(200, null)
        msg.set_response("text/plain", Soup.MemoryUse.copy, "late\n")
        msg.unpause()
        return false
    })
})

server.listen_local(0, Soup.ServerListenOptions.ipv4_only)
local uris = server.get_uris()
if (uris.len() == 0) throw "[FAIL] server did not bind"
local base_url = uris[0].to_string()

// ── client ────────────────────────────────────────────────────────────────
local loop = GLib.MainLoop.new(null, false)

async function run_checks() {
    local s = Soup.Session.new()

    // 1. GET /
    local m1 = Soup.Message.new("GET", base_url)
    local b1 = await s.send_and_read_async(m1, GLib.PRIORITY_DEFAULT)
    check("GET /", m1.get_status() == 200 && b1.get_data() == "root ok\n",
          "status=" + m1.get_status() + " body=" + b1.get_data())

    // 2. GET /api/hello?name=sqgi
    local m2 = Soup.Message.new("GET", base_url + "api/hello?name=sqgi")
    local b2 = await s.send_and_read_async(m2, GLib.PRIORITY_DEFAULT)
    local h  = sqgi.json.parse(b2.get_data())
    check("GET /api/hello?name=sqgi",
          m2.get_status() == 200 && h.greeting == "hello, sqgi",
          "got " + sqgi.json.stringify(h))

    // 3. GET /api/hello with no query → name=world
    local m3 = Soup.Message.new("GET", base_url + "api/hello")
    local b3 = await s.send_and_read_async(m3, GLib.PRIORITY_DEFAULT)
    local h3 = sqgi.json.parse(b3.get_data())
    check("GET /api/hello (no query)",
          h3.greeting == "hello, world",
          "got " + sqgi.json.stringify(h3))

    // 4. POST /api/echo with JSON
    local m4 = Soup.Message.new("POST", base_url + "api/echo")
    local payload = { a = 1, b = "two", c = [3, 4] }
    m4.set_request_body_from_bytes("application/json",
        GLib.Bytes.new(sqgi.json.stringify(payload)))
    local b4 = await s.send_and_read_async(m4, GLib.PRIORITY_DEFAULT)
    local r4 = sqgi.json.parse(b4.get_data())
    check("POST /api/echo (json)",
          r4.received.a == 1 && r4.received.b == "two" && r4.received.c.len() == 2,
          "got " + sqgi.json.stringify(r4))

    // 5. POST /api/echo with text
    local m5 = Soup.Message.new("POST", base_url + "api/echo")
    m5.set_request_body_from_bytes("text/plain", GLib.Bytes.new("xy"))
    local b5 = await s.send_and_read_async(m5, GLib.PRIORITY_DEFAULT)
    local body5 = b5.get_data()
    check("POST /api/echo (text)",
          body5 == "len=2;body=xy",
          "got " + body5)

    // 6. 404
    local m6 = Soup.Message.new("GET", base_url + "no/such")
    local b6 = await s.send_and_read_async(m6, GLib.PRIORITY_DEFAULT)
    check("GET 404", m6.get_status() == 404, "status=" + m6.get_status())

    // 7. 405
    local m7 = Soup.Message.new("GET", base_url + "api/echo")
    local b7 = await s.send_and_read_async(m7, GLib.PRIORITY_DEFAULT)
    local allow = m7.get_response_headers().get_one("Allow")
    check("GET /api/echo → 405",
          m7.get_status() == 405 && allow == "POST",
          "status=" + m7.get_status() + " allow=" + allow)

    // 8. Cancellation via task.cancel()
    local m8 = Soup.Message.new("GET", base_url + "slow")
    local t8 = s.send_and_read_async(m8, GLib.PRIORITY_DEFAULT)
    sqgi.timeout_add(50, function() { t8.cancel("test cancel"); return false })
    local cancelled = false
    try {
        local _ = await t8
    } catch (e) {
        if (typeof e == "table" && ("__cancelled" in e)) cancelled = true
    }
    check("cancel via task.cancel()", cancelled, "got non-cancellation result")

    // 9. Headers round-trip
    local m9 = Soup.Message.new("GET", base_url)
    m9.get_request_headers().append("X-Test-Header", "trace-42")
    local b9 = await s.send_and_read_async(m9, GLib.PRIORITY_DEFAULT)
    local ct = m9.get_response_headers().get_one("Content-Type")
    check("response Content-Type present", ct != null && ct.find("text/plain") != null,
          "got " + ct)

    loop.quit()
}

local task = run_checks()
task.catch(function(e) {
    print("uncaught: " + e + "\n")
    fails += 1
    loop.quit()
})

loop.run()

print("\n" + (checks - fails) + "/" + checks + " checks passed\n")

if (fails > 0) {
    print("[FAIL] test_soup_server: " + fails + " check(s) failed\n")
    foreach (line in fail_lines) print("  - " + line + "\n")
    throw "test_soup_server failures"
}

print("[PASS] test_soup_server\n")
