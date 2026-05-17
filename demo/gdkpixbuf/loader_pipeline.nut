/**
 * demo/gdkpixbuf/loader_pipeline.nut
 *
 * Demonstrate incremental loading with PixbufLoader. This is the right
 * approach when image bytes arrive in chunks — e.g. from an HTTP stream,
 * a TCP socket, or progressive decoding.
 *
 * Usage:
 *     sqgi demo/gdkpixbuf/loader_pipeline.nut [input.png] [--chunk=N]
 *
 *     # No input → generates a PNG, then feeds it back into a fresh
 *     # PixbufLoader 4096 bytes at a time and prints per-chunk progress.
 *     sqgi demo/gdkpixbuf/loader_pipeline.nut
 *
 * Exercises:
 *   - PixbufLoader.new / .write / .close / .get_pixbuf
 *   - Connect to "size-prepared" + "area-prepared" + "closed" signals
 */

local Pb   = import("GdkPixbuf")
local GLib = import("GLib")
local Gio  = import("Gio")

local input = null
local chunk = 4096
foreach (a in vargv) {
    if (a.find("--chunk=") == 0) chunk = a.slice(8).tointeger()
    else if (a.find("--") != 0) input = a
}

if (input == null) {
    local src = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 256, 256)
    // Diagonal gradient by compositing 64 strips.
    for (local i = 0; i < 64; i += 1) {
        local r = (i * 4) & 0xFF
        local g = ((128 + i * 3) & 0xFF)
        local b = ((255 - i * 4) & 0xFF)
        local rgba = (r << 24) | (g << 16) | (b << 8) | 0xFF
        local strip = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 4, 256)
        strip.fill(rgba)
        strip.composite(src, i * 4, 0, 4, 256, i * 4, 0, 1.0, 1.0,
                        Pb.InterpType.nearest, 255)
    }
    input = GLib.get_tmp_dir() + "/sqgi_pb_loader_src.png"
    src.savev(input, "png", [], [])
    print("(synthesised " + input + ")\n")
}

// Read whole file into memory (in practice this is where you'd plug
// an HTTP body or a socket read loop instead).
local file = Gio.File.new_for_path(input)
local bytes = file.load_bytes(null)[0]
local data  = bytes.get_data()
local total = data.len()
print(format("source size: %d bytes\n", total))

local L = Pb.PixbufLoader.new()

L.connect("size-prepared", function (w, h) {
    print(format("  [size-prepared] declared size = %dx%d\n", w, h))
})
L.connect("area-prepared", function () {
    local p = L.get_pixbuf()
    print(format("  [area-prepared] pixbuf surface ready: %dx%d\n",
                 p.get_width(), p.get_height()))
})
L.connect("closed", function () {
    print("  [closed] loader closed\n")
})

local fed = 0
while (fed < total) {
    local take = (total - fed < chunk) ? (total - fed) : chunk
    L.write(data.slice(fed, fed + take))
    fed += take
    print(format("  fed %d / %d bytes\n", fed, total))
}
L.close()

local final = L.get_pixbuf()
print(format("decoded: %dx%d  alpha=%s  channels=%d\n",
             final.get_width(), final.get_height(),
             final.get_has_alpha().tostring(), final.get_n_channels()))
