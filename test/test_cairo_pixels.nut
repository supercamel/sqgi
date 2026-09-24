// GdkPixbuf sampling, alpha, clipping and restored transforms; no display needed.
local C = import("cairo")
local Gdk = import("Gdk", "4.0")
local Pb = import("GdkPixbuf", "2.0")
local GLib = import("GLib")
local Gio = import("Gio")
local tmp = GLib.dir_make_tmp("sqgi-cairo-pixels-XXXXXX")
local path = tmp + "/pixels.png"
try {
    foreach (alpha in [255, 128]) {
        local s = C.image_surface_create(C.Format.argb32, 260, 260)
        local cr = C.Context.create(s)
        local pixels = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 1, 1)
        pixels.fill(0xdc142800 + alpha)
        foreach (bad in [s, C.Pattern.create_rgb(1, 0, 0), pixels]) {
            local rejected = false
            try { Gdk.cairo_set_source_pixbuf(bad, pixels, 0, 0) }
            catch (e) { rejected = true }
            assert(rejected, "GI must reject an incorrectly typed Cairo context")
        }
        cr.set_source_rgb(0, 1, 0)
        cr.save()
        cr.rectangle(2, 2, 256, 256)
        cr.clip()
        cr.translate(2, 2)
        cr.scale(256, 256)
        Gdk.cairo_set_source_pixbuf(cr, pixels, 0, 0)
        assert(cr.get_source().get_extend() == C.Extend.none)
        cr.get_source().set_extend(C.Extend.pad)
        collectgarbage()
        cr.paint()
        cr.restore()
        cr.rectangle(0, 0, 1, 1)
        cr.fill() // Original green source, transform and clip must be restored.
        assert(cr.status() == 0)
        s.write_to_png(path)
        local result = Pb.Pixbuf.new_from_file(path)
        local bytes = result.get_pixels()
        assert(result.get_n_channels() == 4)
        foreach (xy in [[2,2], [257,2], [2,257], [257,257], [130,130]]) {
            local at = xy[1] * result.get_rowstride() + xy[0] * 4
            foreach (channel, expected in [220,20,40,alpha])
                assert(abs(bytes[at + channel] - expected) <= 1, "PAD color/alpha mismatch")
        }
        foreach (xy in [[1,1], [258,2], [2,258], [259,259]]) {
            local at = xy[1] * result.get_rowstride() + xy[0] * 4
            assert(bytes[at + 3] == 0, "PAD painting escaped the destination clip")
        }
        assert(bytes[0] == 0 && bytes[1] == 255 && bytes[2] == 0 && bytes[3] == 255)
    }
} catch (e) {
    try { Gio.File.new_for_path(path).delete(null) } catch (_) {}
    Gio.File.new_for_path(tmp).delete(null)
    throw e
}
Gio.File.new_for_path(path).delete(null)
Gio.File.new_for_path(tmp).delete(null)
print("test_cairo_pixels: ok\n")
