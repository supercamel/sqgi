/**
 * demo/gio/file_read.nut
 *
 * Read a file asynchronously via Gio.File using direct await on
 * load_contents_async.
 *
 * Usage: sqgi demo/gio/file_read.nut [path]   (defaults to this file)
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local path = (vargv.len() >= 1) ? vargv[0] : "demo/gio/file_read.nut"
local loop = GLib.MainLoop.new(null, false)

async function dump(path) {
    local f = Gio.File.new_for_path(path)
    // load_contents_async(cancellable, ready_cb) →
    //   load_contents_finish(res) → [contents_string, etag]
    // (the GIR signature is `bool ret + uint8[] contents (length=length) + gsize length
    //  + utf8 etag` — SQGI hides the bool return and the length-arg, and converts
    //  the uint8[] to a Squirrel string using the length metadata.)
    local result = await f.load_contents_async(null)
    local data = result[0]
    local etag = result[1]
    print("read " + data.len() + " bytes from " + path + " (etag=" + etag + ")\n")
    print("---- first 200 bytes ----\n")
    print(data.slice(0, data.len() < 200 ? data.len() : 200) + "\n")
    loop.quit()
}

dump(path)
loop.run()
