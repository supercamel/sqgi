/**
 * demo/gdkpixbuf/mosaic.nut
 *
 * Build a grid mosaic from a list of source images (or generated tiles)
 * by compositing them into a single output canvas.
 *
 * Usage:
 *     sqgi demo/gdkpixbuf/mosaic.nut [img1.png img2.png ...]
 *                                     [--cols=N] [--tile=N] [--out=PATH]
 *
 *     # No inputs → generates 9 synthetic coloured tiles and arranges
 *     # them in a 3x3 grid in /tmp/.
 *     sqgi demo/gdkpixbuf/mosaic.nut
 *
 * Exercises:
 *   - Pixbuf.composite into a destination canvas
 *   - scale_simple to normalise tile sizes
 */

local Pb   = import("GdkPixbuf")
local GLib = import("GLib")

local inputs = []
local cols = 3
local tile = 96
local out  = null
foreach (a in vargv) {
    if (a.find("--cols=") == 0) cols = a.slice(7).tointeger()
    else if (a.find("--tile=") == 0) tile = a.slice(7).tointeger()
    else if (a.find("--out=") == 0) out = a.slice(6)
    else if (a.find("--") != 0) inputs.append(a)
}

local tiles = []
if (inputs.len() == 0) {
    print("(no inputs — generating 9 synthetic tiles)\n")
    local palette = [
        0xFF6F61FF, 0xFFA500FF, 0xFFD700FF,
        0x9ACD32FF, 0x40E0D0FF, 0x6495EDFF,
        0x9370DBFF, 0xFF69B4FF, 0x8B4513FF,
    ]
    foreach (i, c in palette) {
        local t = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, tile, tile)
        t.fill(c)
        tiles.append(t)
    }
} else {
    foreach (path in inputs) {
        local p = Pb.Pixbuf.new_from_file_at_scale(path, tile, tile, true)
        // Pad with alpha if scaled smaller than tile.
        if (p.get_width() != tile || p.get_height() != tile) {
            local pad = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, tile, tile)
            pad.fill(0x00000000)
            local off_x = (tile - p.get_width()) / 2
            local off_y = (tile - p.get_height()) / 2
            p.composite(pad, off_x, off_y, p.get_width(), p.get_height(),
                        off_x, off_y, 1.0, 1.0, Pb.InterpType.bilinear, 255)
            p = pad
        }
        tiles.append(p)
    }
}

local n    = tiles.len()
local rows = (n + cols - 1) / cols
local canv = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, cols * tile, rows * tile)
canv.fill(0x101010FF)

foreach (i, t in tiles) {
    local r = i / cols, c = i % cols
    t.composite(canv, c * tile, r * tile, tile, tile,
                c * tile, r * tile, 1.0, 1.0, Pb.InterpType.bilinear, 255)
}

if (out == null) out = GLib.get_tmp_dir() + "/sqgi_pb_mosaic.png"
canv.savev(out, "png", [], [])
print(format("mosaic %dx%d (%d tiles, %d cols) -> %s\n",
             canv.get_width(), canv.get_height(), n, cols, out))
