/**
 * demo/gdkpixbuf/transform.nut
 *
 * Demonstrate every geometric and colour transform Pixbuf offers:
 *   - rotate_simple (multiples of 90°)
 *   - flip horizontal/vertical
 *   - scale_simple (resampling)
 *   - new_subpixbuf (region crop, shared pixels)
 *   - saturate_and_pixelate (colour adjustment)
 *
 * Usage:
 *     sqgi demo/gdkpixbuf/transform.nut [input.png]
 *
 *     # No input → uses a synthesised colour-grid source.
 *     sqgi demo/gdkpixbuf/transform.nut
 *
 * Writes every variant to /tmp/sqgi_pb_xform_<name>.png.
 */

local Pb   = import("GdkPixbuf")
local GLib = import("GLib")

local input = vargv.len() > 0 ? vargv[0] : null
local src
if (input == null) {
    // 96x72 colour grid (4x3 cells).
    src = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 96, 72)
    src.fill(0xFFFFFFFF)
    local palette = [
        0xCC0000FF, 0x00CC00FF, 0x0000CCFF, 0xCCCC00FF,
        0xCC00CCFF, 0x00CCCCFF, 0xCC6600FF, 0x66CC00FF,
        0x0066CCFF, 0xCC0066FF, 0x66CC66FF, 0xCCAA66FF,
    ]
    local idx = 0
    for (local y = 0; y < 72; y += 24) {
        for (local x = 0; x < 96; x += 24) {
            local c = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 24, 24)
            c.fill(palette[idx++])
            c.composite(src, x, y, 24, 24, x, y, 1.0, 1.0,
                        Pb.InterpType.nearest, 255)
        }
    }
    input = "(synth)"
}

local stem = GLib.get_tmp_dir() + "/sqgi_pb_xform_"

function save(name, p) {
    local out = stem + name + ".png"
    p.savev(out, "png", [], [])
    print(format("  %-18s %dx%d -> %s\n", name, p.get_width(), p.get_height(), out))
}

print("source: " + input + "  " + src.get_width() + "x" + src.get_height() + "\n")
save("orig",      src)
save("rot90ccw",  src.rotate_simple(Pb.PixbufRotation.counterclockwise))
save("rot180",    src.rotate_simple(Pb.PixbufRotation.upsidedown))
save("rot90cw",   src.rotate_simple(Pb.PixbufRotation.clockwise))
save("flip_h",    src.flip(true))
save("flip_v",    src.flip(false))
save("scale_2x",  src.scale_simple(src.get_width() * 2, src.get_height() * 2,
                                   Pb.InterpType.bilinear))
save("scale_half",src.scale_simple(src.get_width() / 2, src.get_height() / 2,
                                   Pb.InterpType.hyper))
save("crop",      src.new_subpixbuf(24, 24, 48, 24))

// saturate_and_pixelate writes into a destination of identical shape.
local desat = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8,
                            src.get_width(), src.get_height())
src.saturate_and_pixelate(desat, 0.0, false)
save("desat", desat)

local boosted = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8,
                              src.get_width(), src.get_height())
src.saturate_and_pixelate(boosted, 2.5, false)
save("boost", boosted)

local pixelated = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8,
                                src.get_width(), src.get_height())
src.saturate_and_pixelate(pixelated, 1.0, true)
save("pixelate", pixelated)
