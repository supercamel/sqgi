// test/test_gdkpixbuf_recipes.nut
//
// Behavioural tests for the recipes documented in docs/recipes/gdkpixbuf.md.
// Hermetic — no network, no display, no system images. Every fixture is
// generated in-process from synthetic pixbufs and torn down at the end.

local Pb   = import("GdkPixbuf")
local GLib = import("GLib")
local Gio  = import("Gio")

local checks = 0
local fails  = 0
local fail_lines = []

function check(name, cond, detail) {
    checks += 1
    if (!cond) {
        fails += 1
        fail_lines.push(name + ": " + detail)
        print("  FAIL  " + name + ": " + detail + "\n")
    } else {
        print("  ok    " + name + "\n")
    }
}

function safe(fn) { try { return fn() } catch (e) { return e } }

local STAMP = GLib.get_monotonic_time().tostring()
local TMP   = GLib.get_tmp_dir() + "/sqgi_pb_recipes_" + STAMP
Gio.File.new_for_path(TMP).make_directory(null)

function cleanup() {
    try {
        local d = Gio.File.new_for_path(TMP)
        local en = d.enumerate_children("standard::name", 0, null)
        while (true) {
            local i = en.next_file(null)
            if (i == null) break
            try { Gio.File.new_for_path(TMP + "/" + i.get_name()).delete(null) } catch (e) {}
        }
        en.close(null)
        d.delete(null)
    } catch (e) {}
}

// Build a small RGBA pixbuf filled with `rgba` (0xRRGGBBAA).
function make_pixbuf(w, h, rgba) {
    local p = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, w, h)
    p.fill(rgba)
    return p
}

// ── 1. new() basics ──────────────────────────────────────────────────────
function test_basic_new() {
    local p = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 24, 18)
    check("new returns instance", typeof(p) == "instance", "got " + typeof(p))
    check("get_width",  p.get_width()  == 24, "" + p.get_width())
    check("get_height", p.get_height() == 18, "" + p.get_height())
    check("has_alpha",  p.get_has_alpha() == true, "" + p.get_has_alpha())
    check("n_channels", p.get_n_channels() == 4, "" + p.get_n_channels())
    check("bits_per_sample", p.get_bits_per_sample() == 8, "" + p.get_bits_per_sample())
    check("colorspace", p.get_colorspace() == Pb.Colorspace.rgb, "" + p.get_colorspace())
    // rgba 24x18 → rowstride >= 24*4 = 96
    check("rowstride sane", p.get_rowstride() >= 96, "" + p.get_rowstride())
    check("byte_length sane", p.get_byte_length() >= 18 * 96, "" + p.get_byte_length())
}
test_basic_new()

// ── 2. fill() and read_pixel_bytes() ─────────────────────────────────────
function test_fill_read_bytes() {
    local p = make_pixbuf(4, 4, 0xFF8040C0)
    local b = p.read_pixel_bytes()
    check("read_pixel_bytes returns GLib.Bytes", typeof(b) == "instance", "got " + typeof(b))
    local sz = b.get_size()
    check("bytes size matches byte_length", sz == p.get_byte_length(),
          "size=" + sz + " bl=" + p.get_byte_length())
    // Inspect first pixel via get_data
    local raw = b.get_data()
    check("get_data returns string", typeof(raw) == "string", "got " + typeof(raw))
    if (typeof(raw) == "string" && raw.len() >= 4) {
        // GdkPixbuf stores RGBA in memory, first pixel should be FF 80 40 C0
        local r = raw[0] & 0xFF
        local g = raw[1] & 0xFF
        local bl= raw[2] & 0xFF
        local a = raw[3] & 0xFF
        check("first pixel R == 0xFF", r == 0xFF, "got 0x" + format("%02X", r))
        check("first pixel G == 0x80", g == 0x80, "got 0x" + format("%02X", g))
        check("first pixel B == 0x40", bl == 0x40, "got 0x" + format("%02X", bl))
        check("first pixel A == 0xC0", a == 0xC0, "got 0x" + format("%02X", a))
    } else {
        check("first pixel readable", false, "raw too short: " + (typeof(raw) == "string" ? raw.len().tostring() : "non-string"))
    }
}
test_fill_read_bytes()

// ── 3. scale_simple ──────────────────────────────────────────────────────
function test_scale_simple() {
    local p = make_pixbuf(16, 16, 0x3399FFFF)
    local q = p.scale_simple(64, 32, Pb.InterpType.bilinear)
    check("scale_simple returns instance", typeof(q) == "instance", "got " + typeof(q))
    check("scaled width",  q.get_width()  == 64, "" + q.get_width())
    check("scaled height", q.get_height() == 32, "" + q.get_height())
    // Original untouched
    check("source unchanged width",  p.get_width()  == 16, "" + p.get_width())
    check("source unchanged height", p.get_height() == 16, "" + p.get_height())
}
test_scale_simple()

// ── 4. save_to_bufferv → encoded bytes (PNG and JPEG) ────────────────────
function test_save_to_bufferv() {
    local p = make_pixbuf(32, 32, 0x66CC33FF)
    local png = p.save_to_bufferv("png", [], [])
    check("PNG bytes is string", typeof(png) == "string", "got " + typeof(png))
    check("PNG size > 60", png.len() > 60, "got " + png.len())
    // PNG signature: 89 50 4E 47 0D 0A 1A 0A
    check("PNG signature byte 0", (png[0] & 0xFF) == 0x89, "got " + (png[0] & 0xFF))
    check("PNG signature 'P'",    png[1] == 'P',           "")
    check("PNG signature 'N'",    png[2] == 'N',           "")
    check("PNG signature 'G'",    png[3] == 'G',           "")

    // JPEG with quality option
    local rgb = Pb.Pixbuf.new(Pb.Colorspace.rgb, false, 8, 32, 32)
    rgb.fill(0xCC3366FF)
    local jpg = rgb.save_to_bufferv("jpeg", ["quality"], ["50"])
    check("JPEG bytes is string", typeof(jpg) == "string", "got " + typeof(jpg))
    check("JPEG size > 100",   jpg.len() > 100,  "got " + jpg.len())
    // JPEG SOI: FF D8
    check("JPEG SOI byte 0", (jpg[0] & 0xFF) == 0xFF, "got " + (jpg[0] & 0xFF))
    check("JPEG SOI byte 1", (jpg[1] & 0xFF) == 0xD8, "got " + (jpg[1] & 0xFF))

    // higher quality → larger file (sanity)
    local jpg_hi = rgb.save_to_bufferv("jpeg", ["quality"], ["95"])
    check("JPEG quality=95 >= quality=50", jpg_hi.len() >= jpg.len(),
          "lo=" + jpg.len() + " hi=" + jpg_hi.len())
}
test_save_to_bufferv()

// ── 5. savev + new_from_file round-trip ──────────────────────────────────
function test_file_roundtrip() {
    local src = make_pixbuf(40, 30, 0x112233FF)
    local path = TMP + "/round.png"
    local r = safe(@() src.savev(path, "png", [], []))
    check("savev does not throw", typeof(r) != "string", "got " + r)

    local exists = Gio.File.new_for_path(path).query_exists(null)
    check("png file exists", exists, "" + path)

    local back = Pb.Pixbuf.new_from_file(path)
    check("new_from_file returns instance", typeof(back) == "instance", "got " + typeof(back))
    check("loaded width",  back.get_width()  == 40, "" + back.get_width())
    check("loaded height", back.get_height() == 30, "" + back.get_height())

    // Re-encode and compare round-trip pixels (lossless PNG).
    local b1 = src.read_pixel_bytes().get_data()
    local b2 = back.read_pixel_bytes().get_data()
    check("PNG round-trip pixel bytes equal", b1 == b2,
          "src=" + b1.len() + "B back=" + b2.len() + "B")
}
test_file_roundtrip()

// ── 6. new_from_file_at_scale (preserve aspect) ──────────────────────────
function test_load_at_scale() {
    local src = make_pixbuf(40, 20, 0xAA55FFFF)
    local path = TMP + "/wide.png"
    src.savev(path, "png", [], [])

    local q = Pb.Pixbuf.new_from_file_at_scale(path, 100, 100, true)
    check("at_scale returns instance", typeof(q) == "instance", "got " + typeof(q))
    // Aspect 2:1 → fits inside 100x100 → expect 100x50
    check("at_scale preserves aspect (w)", q.get_width()  == 100, "" + q.get_width())
    check("at_scale preserves aspect (h)", q.get_height() == 50,  "" + q.get_height())

    // Don't preserve aspect
    local q2 = Pb.Pixbuf.new_from_file_at_scale(path, 64, 64, false)
    check("at_scale ignore aspect (w)", q2.get_width()  == 64, "" + q2.get_width())
    check("at_scale ignore aspect (h)", q2.get_height() == 64, "" + q2.get_height())
}
test_load_at_scale()

// ── 7. rotate_simple + flip ──────────────────────────────────────────────
function test_rotate_flip() {
    local p = make_pixbuf(40, 20, 0x445566FF)
    local r = p.rotate_simple(Pb.PixbufRotation.counterclockwise)
    check("rotate 90° swaps dims (w)", r.get_width()  == 20, "" + r.get_width())
    check("rotate 90° swaps dims (h)", r.get_height() == 40, "" + r.get_height())

    local f = p.flip(true)
    check("flip horizontal preserves dims", f.get_width() == 40 && f.get_height() == 20,
          "" + f.get_width() + "x" + f.get_height())
}
test_rotate_flip()

// ── 8. new_subpixbuf (shares pixels) ─────────────────────────────────────
function test_subpixbuf() {
    local p = make_pixbuf(32, 32, 0x778899FF)
    local sp = p.new_subpixbuf(4, 4, 16, 16)
    check("subpixbuf width",  sp.get_width()  == 16, "" + sp.get_width())
    check("subpixbuf height", sp.get_height() == 16, "" + sp.get_height())
}
test_subpixbuf()

// ── 9. composite ─────────────────────────────────────────────────────────
function test_composite() {
    local src = make_pixbuf(32, 32, 0xFFFF0080)  // semi-transparent yellow
    local dst = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 64, 64)
    dst.fill(0x000000FF)                          // opaque black background

    // composite(dest, dest_x, dest_y, dest_w, dest_h,
    //           off_x, off_y, scale_x, scale_y, interp, overall_alpha)
    local r = safe(@() src.composite(dst, 16, 16, 32, 32, 16, 16, 1.0, 1.0,
                                     Pb.InterpType.nearest, 255))
    check("composite returns", typeof(r) != "string", "got " + r)

    // Sample dst centre: should be biased away from pure black.
    local raw = dst.read_pixel_bytes().get_data()
    local rs  = dst.get_rowstride()
    local idx = 32 * rs + 32 * 4
    local rr  = raw[idx]   & 0xFF
    local gg  = raw[idx+1] & 0xFF
    check("composite centre R lifted", rr > 0, "R=" + rr)
    check("composite centre G lifted", gg > 0, "G=" + gg)
}
test_composite()

// ── 10. PixbufLoader (encoded byte stream → pixbuf) ──────────────────────
function test_loader() {
    local p = make_pixbuf(24, 24, 0x336699FF)
    local png = p.save_to_bufferv("png", [], [])

    local L = Pb.PixbufLoader.new()
    L.write(png)
    L.close()
    local q = L.get_pixbuf()
    check("loader produced pixbuf", typeof(q) == "instance", "got " + typeof(q))
    check("loader pixbuf width",  q.get_width()  == 24, "" + q.get_width())
    check("loader pixbuf height", q.get_height() == 24, "" + q.get_height())
}
test_loader()

// ── 11. new_from_stream via Gio.MemoryInputStream ────────────────────────
function test_load_from_stream() {
    local p = make_pixbuf(28, 14, 0xCC9933FF)
    local png = p.save_to_bufferv("png", [], [])

    local bytes  = GLib.Bytes.new(png)
    local stream = Gio.MemoryInputStream.new_from_bytes(bytes)
    local q = Pb.Pixbuf.new_from_stream(stream, null)
    check("new_from_stream width",  q.get_width()  == 28, "" + q.get_width())
    check("new_from_stream height", q.get_height() == 14, "" + q.get_height())
}
test_load_from_stream()

// ── 12. get_file_info → [format, w, h] ───────────────────────────────────
function test_get_file_info() {
    local p = make_pixbuf(50, 25, 0x224488FF)
    local path = TMP + "/info.png"
    p.savev(path, "png", [], [])

    local r = Pb.Pixbuf.get_file_info(path)
    check("get_file_info returns array", typeof(r) == "array", "got " + typeof(r))
    check("get_file_info has 3 entries", r.len() == 3, "len=" + r.len())
    if (r.len() == 3) {
        check("format is PixbufFormat instance", typeof(r[0]) == "instance",
              "got " + typeof(r[0]))
        check("reported width",  r[1] == 50, "" + r[1])
        check("reported height", r[2] == 25, "" + r[2])
        if (typeof(r[0]) == "instance") {
            check("format name is 'png'", r[0].get_name() == "png",
                  "got '" + r[0].get_name() + "'")
        }
    }
}
test_get_file_info()

// ── 13. get_formats returns metadata for every loader ────────────────────
function test_get_formats() {
    local fs = Pb.Pixbuf.get_formats()
    check("get_formats returns array", typeof(fs) == "array", "got " + typeof(fs))
    check("at least 4 formats", fs.len() >= 4, "got " + fs.len())

    local names = []
    foreach (f in fs) names.append(f.get_name())
    // PNG is universally available on Linux.
    local has_png = false
    foreach (n in names) if (n == "png") has_png = true
    check("'png' in formats", has_png, names.tostring())
}
test_get_formats()

// ── 14. saturate_and_pixelate (in-place into dst) ────────────────────────
function test_saturate_pixelate() {
    local src = make_pixbuf(32, 32, 0xFF6633FF)
    local dst = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8, 32, 32)
    local r = safe(@() src.saturate_and_pixelate(dst, 0.2, true))
    check("saturate_and_pixelate returns", typeof(r) != "string", "got " + r)
    check("dst dimensions unchanged",
          dst.get_width() == 32 && dst.get_height() == 32,
          "" + dst.get_width() + "x" + dst.get_height())
}
test_saturate_pixelate()

// ── 15. Error handling: missing file throws ──────────────────────────────
function test_missing_file() {
    // GError throws can surface as either a string or a GError instance
    // (with toString containing the message). A successful Pixbuf load
    // would have get_width on it.
    local r = safe(@() Pb.Pixbuf.new_from_file(TMP + "/does-not-exist.png"))
    local is_pixbuf = (typeof(r) == "instance" &&
                      ("get_width" in r) &&
                      safe(@() r.get_width()) != null &&
                      typeof(safe(@() r.get_width())) == "integer")
    check("missing file raises error (no pixbuf returned)",
          !is_pixbuf, "got pixbuf: " + r)
}
test_missing_file()

// ── 16. Error handling: corrupted bytes via loader ───────────────────────
function test_loader_bad_bytes() {
    local L = Pb.PixbufLoader.new()
    local r = safe(function() {
        L.write("this is definitely not PNG data")
        L.close()
        return L.get_pixbuf()
    })
    // Either write or close should fail, or get_pixbuf returns null.
    // Anything other than a usable pixbuf is acceptable.
    local is_pixbuf = (typeof(r) == "instance" &&
                      ("get_width" in r) &&
                      typeof(safe(@() r.get_width())) == "integer")
    check("loader rejects garbage (no pixbuf produced)",
          !is_pixbuf, "got pixbuf: " + r)
}
test_loader_bad_bytes()

// ── Summary ──────────────────────────────────────────────────────────────
cleanup()
print(format("\n%d/%d checks passed\n", checks - fails, checks))
if (fails > 0) {
    foreach (l in fail_lines) print("  - " + l + "\n")
    throw "test_gdkpixbuf_recipes failures: " + fails
}
