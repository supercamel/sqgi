/**
 * demo/soup/parallel.nut
 *
 * Fetch several URLs concurrently with `sqgi.all`, sharing one
 * `Soup.Session` for HTTP/1.1 connection reuse.
 *
 * Usage: sqgi demo/soup/parallel.nut [URL ...]
 */

local GLib = import("GLib")
local Soup = import("Soup")

local urls = vargv.len() > 0 ? vargv : [
    "https://example.com/",
    "https://example.org/",
    "https://example.net/",
    "https://httpbin.org/uuid",
]

local loop = GLib.MainLoop.new(null, false)

async function fetch_all(url_list) {
    local session = Soup.Session.new()
    local tasks   = []
    foreach (u in url_list) {
        local msg = Soup.Message.new("GET", u)
        // Note: each Soup.Message is single-use; one Session can drive many.
        tasks.push(session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT))
    }
    return await sqgi.all(tasks)
}

async function main() {
    local started = GLib.get_monotonic_time()
    try {
        local bodies = await fetch_all(urls)
        local elapsed_ms = (GLib.get_monotonic_time() - started) / 1000
        print("Fetched " + bodies.len() + " URLs in " + elapsed_ms + " ms\n")
        foreach (i, b in bodies) {
            print(format("  [%d] %-32s  %d bytes\n", i, urls[i], b.get_size()))
        }
    } catch (e) {
        print("at least one request failed: " + e + "\n")
    }
    loop.quit()
}

main()
loop.run()
