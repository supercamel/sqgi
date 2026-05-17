/**
 * demo/soup/json_post.nut
 *
 * POST a JSON payload and parse the JSON response.
 *
 * Usage: sqgi demo/soup/json_post.nut [URL]
 *        (default: https://httpbin.org/post)
 */

local GLib = import("GLib")
local Soup = import("Soup")

local url  = (vargv.len() >= 1) ? vargv[0] : "https://httpbin.org/post"
local loop = GLib.MainLoop.new(null, false)

async function post_json(target, value) {
    local session = Soup.Session.new()
    local msg     = Soup.Message.new("POST", target)
    msg.get_request_headers().append("Accept", "application/json")

    // Body: stringify + wrap in GLib.Bytes.
    local body_text = sqgi.json.stringify(value)
    local body      = GLib.Bytes.new(body_text)
    msg.set_request_body_from_bytes("application/json", body)

    local resp = await session.send_and_read_async(msg, GLib.PRIORITY_DEFAULT)
    return {
        status = msg.get_status(),
        body   = sqgi.json.parse(resp.get_data())
    }
}

async function main() {
    local payload = {
        name  = "sqgi",
        tags  = ["http", "json", "demo"],
        count = 3
    }
    print("POST " + url + "\n")
    print("  payload: " + sqgi.json.stringify(payload) + "\n")

    try {
        local r = await post_json(url, payload)
        print("Status: " + r.status + "\n")
        // httpbin.org echoes the parsed JSON under r.body.json
        if (typeof r.body == "table" && "json" in r.body) {
            print("Server echoed JSON:\n")
            print("  " + sqgi.json.stringify(r.body.json) + "\n")
        } else {
            print("Server replied:\n")
            print("  " + sqgi.json.stringify(r.body) + "\n")
        }
    } catch (e) {
        print("error: " + e + "\n")
    }
    loop.quit()
}

main()
loop.run()
