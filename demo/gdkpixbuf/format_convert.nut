/**
 * demo/gdkpixbuf/format_convert.nut
 *
 * Convert an image between formats supported by GdkPixbuf
 * (PNG, JPEG, BMP, TIFF, ICO, …).
 *
 * Usage:
 *     sqgi demo/gdkpixbuf/format_convert.nut <input> <output>
 *
 *     # No args → generates a synthetic checkerboard PNG, then converts it
 *     # to JPEG (quality=85) and TIFF in /tmp/.
 *     sqgi demo/gdkpixbuf/format_convert.nut
 *
 * Exercises:
 *   - Pixbuf.new_from_file
 *   - Pixbuf.savev with format-specific options ("quality" for JPEG)
 *   - Format detection from output extension
 */

local Pb   = import("GdkPixbuf")
local GLib = import("GLib")
local Gio  = import("Gio")

function ext_to_format(path) {
    local i = path.find(".")
    if (i == null) return "png"
    local dot = -1
    for (local k = path.len() - 1; k >= 0; k -= 1) {
        if (path[k] == '.') { dot = k; break }
    }
    if (dot < 0) return "png"
    local e = path.slice(dot + 1).tolower()
    switch (e) {
        case "jpg": case "jpeg": return "jpeg"
        case "tif": case "tiff": return "tiff"
        default: return e
    }
}

function synth_checkerboard(w, h, cell) {
    // Build a tiled coloured grid by compositing solid swatches together.
    local p = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, w, h)
    p.fill(0xFFFFFFFF)
    local colours = [0xCC3333FF, 0x33CC33FF, 0x3366CCFF, 0xCCAA33FF]
    local idx = 0
    for (local y = 0; y < h; y += cell) {
        for (local x = 0; x < w; x += cell) {
            local sw = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, cell, cell)
            sw.fill(colours[(idx++) % colours.len()])
            sw.composite(p, x, y, cell, cell, x, y, 1.0, 1.0,
                         Pb.InterpType.nearest, 255)
        }
    }
    return p
}

local input  = vargv.len() >= 1 ? vargv[0] : null
local output = vargv.len() >= 2 ? vargv[1] : null

local src
if (input == null) {
    print("(no input given — generating 128x96 checkerboard)\n")
    src = synth_checkerboard(128, 96, 16)
    local seed = GLib.get_tmp_dir() + "/sqgi_pb_demo_seed.png"
    src.savev(seed, "png", [], [])
    input = seed
    print("seeded: " + seed + "\n")
} else {
    src = Pb.Pixbuf.new_from_file(input)
}

print(format("loaded: %s  %dx%d  channels=%d  alpha=%s\n",
             input, src.get_width(), src.get_height(),
             src.get_n_channels(), src.get_has_alpha().tostring()))

local outputs = []
if (output != null) {
    outputs.append([output, ext_to_format(output), [], []])
} else {
    local stem = GLib.get_tmp_dir() + "/sqgi_pb_demo_out"
    outputs.append([stem + ".jpg",  "jpeg", ["quality"], ["85"]])
    outputs.append([stem + ".tiff", "tiff", [], []])
    outputs.append([stem + ".bmp",  "bmp",  [], []])
}

foreach (job in outputs) {
    local path = job[0], fmt = job[1], keys = job[2], values = job[3]
    src.savev(path, fmt, keys, values)
    local size = Gio.File.new_for_path(path).query_info(
        "standard::size", 0, null).get_size()
    print(format("  -> %-40s %s  %d bytes\n", path, fmt, size))
}
