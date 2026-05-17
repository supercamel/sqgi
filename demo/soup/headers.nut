/**
 * demo/soup/headers.nut
 *
 * Set custom request headers, then enumerate every response header.
 *
 * Usage: sqgi demo/soup/headers.nut [URL]
 *        (default: https://httpbin.org/headers)
 */

local GLib = import("GLib")
local Soup = import("Soup")

local url  = (vargv.len() >= 1) ? vargv[0] : "https://httpbin.org/headers"
local loop = GLib.MainLoop.new(null, false)

async function main() {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("GET", url)

    local req = msg.get_request_headers()
    req.append("User-Agent",  "sqgi-demo/headers")
    req.append("Accept",      "application/json")
    req.append("X-Demo-Tag",  "hello-from-sqgi")
    req.append("X-Trace-Id",  "trace-" + GLib.get_monotonic_time())

    local bytes = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)

    local reason = msg.get_reason_phrase()
    print("Status : " + msg.get_status() + " " + (reason != null ? reason : "") + "\n")

    print("\nResponse headers:\n")
    local resp = msg.get_response_headers()
    resp.foreach(function(name, value) {
        print("  " + name + ": " + value + "\n")
    })

    print("\nQuick lookups:\n")
    local function or_none(s) { return s != null ? s : "(none)" }
    print("  Content-Type   : " + or_none(resp.get_one("Content-Type"))   + "\n")
    print("  Content-Length : " + or_none(resp.get_one("Content-Length")) + "\n")
    print("  Server         : " + or_none(resp.get_one("Server"))         + "\n")

    print("\nBody preview (" + bytes.get_size() + " bytes):\n")
    local body = bytes.get_data()
    print("  " + (body.len() > 200 ? body.slice(0, 200) + "…" : body) + "\n")

    loop.quit()
}

main()
loop.run()
