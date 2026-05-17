/**
 * demo/soup/http_get.nut
 *
 * Minimal libsoup HTTP GET. Sends one request, prints status + body length.
 *
 * Usage: sqgi demo/soup/http_get.nut [URL]
 *        (default URL: https://example.com/)
 */

local GLib = import("GLib")
local Gio  = import("Gio")
local Soup = import("Soup")

local url = (vargv.len() >= 1) ? vargv[0] : "https://example.com/"
local loop = GLib.MainLoop.new(null, false)

async function fetch(url) {
    local session = Soup.Session.new()
    local msg = Soup.Message.new("GET", url)

    // The auto-async wrapper drops the trailing (cancellable, callback)
    // pair and gives back an awaitable Task that resolves to whatever
    // the matching _finish would have returned — here, a GLib.Bytes.
    local bytes = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)

    print("URL     : " + url + "\n")
    print("Status  : " + msg.get_status() + "\n")
    print("Length  : " + bytes.get_size() + " bytes\n")
    loop.quit()
}

fetch(url)
loop.run()
