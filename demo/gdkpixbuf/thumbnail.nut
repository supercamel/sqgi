/**
 * demo/gdkpixbuf/thumbnail.nut
 *
 * Generate a thumbnail of an image while preserving aspect ratio.
 *
 * Usage:
 *     sqgi demo/gdkpixbuf/thumbnail.nut <input> [--size=N] [--out=PATH]
 *
 *     # Default: synthesises a 256x128 source and writes a 96-pixel thumb.
 *     sqgi demo/gdkpixbuf/thumbnail.nut
 *
 * Flags:
 *     --size=N    longest side of thumbnail (default: 96)
 *     --out=P     output PNG path (default: derived from input)
 *
 * Exercises:
 *   - Pixbuf.new_from_file_at_scale(path, w, h, preserve_aspect=true)
 *   - savev to PNG (lossless)
 */

local Pb   = import("GdkPixbuf")
local GLib = import("GLib")

local input = null
local size  = 96
local out   = null
foreach (a in vargv) {
    if (a.find("--size=") == 0) size = a.slice(7).tointeger()
    else if (a.find("--out=") == 0) out = a.slice(6)
    else if (a.find("--") != 0) input = a
}

if (input == null) {
    // Synthesise: wide gradient.
    local src = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 256, 128)
    local strip = 16
    local cols = [0xFF3344FF, 0xFF8833FF, 0xFFCC33FF, 0x88CC33FF, 0x33CCCCFF,
                  0x3388CCFF, 0x6633CCFF, 0xCC33CCFF]
    for (local i = 0; i < cols.len(); i += 1) {
        local sw = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, strip * 2, 128)
        sw.fill(cols[i])
        sw.composite(src, i * 32, 0, 32, 128, i * 32, 0, 1.0, 1.0,
                     Pb.InterpType.nearest, 255)
    }
    input = GLib.get_tmp_dir() + "/sqgi_pb_thumb_src.png"
    src.savev(input, "png", [], [])
    print("(no input — synthesised " + input + ")\n")
}

if (out == null) {
    out = GLib.get_tmp_dir() + "/sqgi_pb_thumb_" + size + ".png"
}

// Load + scale in one shot, preserving aspect.
local thumb = Pb.Pixbuf.new_from_file_at_scale(input, size, size, true)
thumb.savev(out, "png", [], [])

print(format("input  %s  (full size on disk)\n", input))
print(format("thumb  %dx%d  -> %s\n", thumb.get_width(), thumb.get_height(), out))
