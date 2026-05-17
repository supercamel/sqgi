/**
 * demo/soup/json_get.nut
 *
 * GET a JSON document and pretty-print a few fields.
 *
 * Usage: sqgi demo/soup/json_get.nut [URL]
 *        (default: https://httpbin.org/get)
 */

local GLib = import("GLib")
local Soup = import("Soup")

local url  = (vargv.len() >= 1) ? vargv[0] : "https://httpbin.org/get"
local loop = GLib.MainLoop.new(null, false)

async function main() {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("GET", url)
    msg.get_request_headers().append("Accept", "application/json")
    msg.get_request_headers().append("User-Agent", "sqgi-demo/json_get")

    local bytes
    try {
        bytes = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)
    } catch (e) {
        print("transport error: " + e + "\n")
        loop.quit()
        return
    }

    local status = msg.get_status()
    print("URL    : " + url + "\n")
    print("Status : " + status + "\n")
    if (status != 200) {
        print("Body   : " + bytes.get_data() + "\n")
        loop.quit()
        return
    }

    local data = sqgi.json.parse(bytes.get_data())

    // httpbin.org/get echoes request info; fall back gracefully otherwise.
    if (typeof data == "table") {
        print("Echoed : " + sqgi.json.stringify(data) + "\n")
        if ("url" in data)     print("  url    = " + data.url + "\n")
        if ("origin" in data)  print("  origin = " + data.origin + "\n")
        if ("headers" in data) {
            print("  echoed headers:\n")
            foreach (k, v in data.headers) {
                print("    " + k + " = " + v + "\n")
            }
        }
    } else {
        print("Parsed : " + typeof data + "\n")
    }
    loop.quit()
}

main()
loop.run()
