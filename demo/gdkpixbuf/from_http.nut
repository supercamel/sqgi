/**
 * demo/gdkpixbuf/from_http.nut
 *
 * Fetch an image from a Soup HTTP server and decode it incrementally with
 * PixbufLoader. Demonstrates the natural pairing of libsoup + GdkPixbuf:
 * bytes arrive in chunks, so feed them straight into the loader.
 *
 * Usage:
 *     sqgi demo/gdkpixbuf/from_http.nut [URL]
 *
 *     # No URL → spawns a tiny in-process Soup server that serves a
 *     # generated PNG, then fetches it back, then exits. Hermetic, no
 *     # network access required.
 *
 * Exercises:
 *   - Soup.Server.add_handler returning Pixbuf bytes
 *   - Soup.Session.send_async + chunked InputStream reads
 *   - PixbufLoader.write + close
 */

local Pb   = import("GdkPixbuf")
local GLib = import("GLib")
local Gio  = import("Gio")
local Soup = import("Soup")

local url = vargv.len() > 0 ? vargv[0] : null
local loop = GLib.MainLoop.new(null, false)
local server = null

if (url == null) {
    // Generate a 200x200 image to serve.
    local p = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 200, 200)
    p.fill(0x223344FF)
    for (local i = 0; i < 16; i += 1) {
        local r = (i * 16) & 0xFF
        local g = ((128 + i * 8) & 0xFF)
        local sw = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 200, 12)
        sw.fill((r << 24) | (g << 16) | 0x80FF)
        sw.composite(p, 0, i * 12, 200, 12, 0, i * 12, 1.0, 1.0,
                     Pb.InterpType.nearest, 255)
    }
    local png = p.save_to_bufferv("png", [], [])
    print(format("serving %d-byte PNG\n", png.len()))

    server = sqgi.new_object(Soup.Server, {})
    server.add_handler("/image.png", function (srv, msg, path, query) {
        msg.set_status(200, null)
        local rh = msg.get_response_headers()
        rh.set_content_type("image/png", null)
        msg.set_response("image/png", Soup.MemoryUse.copy, png)
    })
    server.listen_local(0, Soup.ServerListenOptions.ipv4_only)
    local uris = server.get_uris()
    local root = uris[0].to_string()
    url = root + "image.png"
    print("server: " + url + "\n")
}

local session = Soup.Session.new()
local msg     = Soup.Message.new("GET", url)

local L = Pb.PixbufLoader.new()
local fed = 0

session.send_async(msg, GLib.PRIORITY_DEFAULT, null, function (sess, res) {
    try {
        local stream = sess.send_finish(res)
        // Read in 4 KiB chunks.
        local buf_size = 4096
        while (true) {
            local b = stream.read_bytes(buf_size, null)
            if (b == null || b.get_size() == 0) break
            L.write(b.get_data())
            fed += b.get_size()
        }
        L.close()
        stream.close(null)
        local img = L.get_pixbuf()
        print(format("downloaded %d bytes, decoded %dx%d\n",
                     fed, img.get_width(), img.get_height()))
        local out = GLib.get_tmp_dir() + "/sqgi_pb_from_http.png"
        img.savev(out, "png", [], [])
        print("saved to " + out + "\n")
    } catch (e) {
        print("ERROR: " + e + "\n")
    }
    loop.quit()
})

loop.run()
// Soup.Server is stopped automatically when its last ref drops.
