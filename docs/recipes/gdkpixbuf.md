# GdkPixbuf Cookbook

Practical recipes for **GdkPixbuf** — loading, saving, scaling, compositing
and pixel-level manipulation of raster images. GdkPixbuf is GTK's
historical image library, but it's perfectly happy to be used standalone
and pairs naturally with cairo (for drawing), libsoup (for HTTP images),
Gio (for streams) and GStreamer (for video snapshots).

All examples are runnable with:

```bash
./build/sqgi path/to/script.nut
```

The full source for every snippet lives in [`demo/gdkpixbuf/`](../../demo/gdkpixbuf/).

## Contents

- [1. Setup](#1-setup)
- [2. Creating pixbufs from scratch](#2-creating-pixbufs-from-scratch)
- [3. Loading from a file](#3-loading-from-a-file)
- [4. Loading with scale (thumbnails)](#4-loading-with-scale-thumbnails)
- [5. Saving to a file](#5-saving-to-a-file)
- [6. Encoding to in-memory bytes](#6-encoding-to-in-memory-bytes)
- [7. Format options (JPEG quality, PNG compression)](#7-format-options-jpeg-quality-png-compression)
- [8. Inspecting without decoding (`get_file_info`)](#8-inspecting-without-decoding-get_file_info)
- [9. Enumerating supported formats](#9-enumerating-supported-formats)
- [10. Geometric transforms: rotate, flip, scale](#10-geometric-transforms-rotate-flip-scale)
- [11. Cropping with `new_subpixbuf`](#11-cropping-with-new_subpixbuf)
- [12. Compositing onto a canvas](#12-compositing-onto-a-canvas)
- [13. Colour adjustments (`saturate_and_pixelate`)](#13-colour-adjustments-saturate_and_pixelate)
- [14. Raw pixel access](#14-raw-pixel-access)
- [15. Incremental loading with `PixbufLoader`](#15-incremental-loading-with-pixbufloader)
- [16. Loading from a stream (`new_from_stream`)](#16-loading-from-a-stream-new_from_stream)
- [17. End-to-end: fetching an image over HTTP](#17-end-to-end-fetching-an-image-over-http)
- [18. Common pitfalls](#18-common-pitfalls)

---

## 1. Setup

GdkPixbuf is exposed as the `GdkPixbuf` module. It plays well with `GLib`
(for `GLib.Bytes`) and `Gio` (for streams + files):

```squirrel
local Pb   = import("GdkPixbuf")
local GLib = import("GLib")
local Gio  = import("Gio")
```

All useful types live under `Pb`:

| Symbol                   | Purpose                                            |
|--------------------------|----------------------------------------------------|
| `Pb.Pixbuf`              | the main pixel-buffer class                        |
| `Pb.PixbufLoader`        | incremental decoder (push bytes, get a pixbuf)     |
| `Pb.PixbufFormat`        | metadata about a loader/encoder                    |
| `Pb.Colorspace.rgb`      | only colorspace currently defined                  |
| `Pb.InterpType`          | `.nearest`, `.tiles`, `.bilinear`, `.hyper`        |
| `Pb.PixbufRotation`      | `.none`, `.counterclockwise`, `.upsidedown`, `.clockwise` |

## 2. Creating pixbufs from scratch

`Pb.Pixbuf.new(colorspace, has_alpha, bits_per_sample, width, height)`
allocates a fresh, uninitialised buffer. Always pair it with `.fill()` (or
write your own pixels) before using it:

```squirrel
local p = Pb.Pixbuf.new(Pb.Colorspace.rgb, /*alpha=*/true, 8, 64, 48)
p.fill(0x336699FF)   // 0xRRGGBBAA
```

The shape of the buffer is queryable:

```squirrel
print(p.get_width())            // 64
print(p.get_height())           // 48
print(p.get_n_channels())       // 4 (RGBA)
print(p.get_has_alpha())        // true
print(p.get_bits_per_sample())  // 8
print(p.get_rowstride())        // >= width * n_channels, may be padded
print(p.get_byte_length())      // total bytes in the buffer
```

## 3. Loading from a file

```squirrel
local img = Pb.Pixbuf.new_from_file("/path/to/photo.jpg")
print(img.get_width() + "x" + img.get_height())
```

Missing files and corrupted bytes throw — wrap in `try`/`catch`:

```squirrel
try {
    local img = Pb.Pixbuf.new_from_file(path)
    // use it
} catch (e) {
    print("load failed: " + e + "\n")
}
```

## 4. Loading with scale (thumbnails)

`new_from_file_at_scale(path, w, h, preserve_aspect)` decodes and resamples
in one shot — much faster than loading at full size then scaling:

```squirrel
// fit inside 256x256, keep aspect ratio:
local thumb = Pb.Pixbuf.new_from_file_at_scale(path, 256, 256, true)
```

If `preserve_aspect` is `true`, the longest side is fitted to the
corresponding dimension and the other is computed proportionally. A 4000×3000
photo loaded with `new_from_file_at_scale(path, 256, 256, true)` comes back
as 256×192. Pass `false` to force exact dimensions (stretches the image).

There's also `new_from_file_at_size(path, w, h)` which always preserves
aspect (equivalent to passing `true` above).

Demo: [demo/gdkpixbuf/thumbnail.nut](../../demo/gdkpixbuf/thumbnail.nut).

## 5. Saving to a file

```squirrel
local ok = pb.savev("/tmp/out.png", "png", [], [])   // PNG, no options
```

The signature is `savev(path, format, keys, values)`. The last two arrays
are pairs of option name → option value. Supported formats depend on which
loaders your system has installed (see §9), but PNG and JPEG are
universally available on Linux.

## 6. Encoding to in-memory bytes

`save_to_bufferv` is the in-memory equivalent of `savev`. It returns a
plain Squirrel string holding the raw encoded bytes:

```squirrel
local png_bytes = pb.save_to_bufferv("png", [], [])
print(png_bytes.len())            // size in bytes

// The first 8 bytes match the PNG signature:
print(format("%02X%02X%02X%02X", png_bytes[0] & 0xFF, png_bytes[1],
             png_bytes[2], png_bytes[3]))   // "89504E47"
```

Pass the string directly to anything expecting byte data — e.g. a
`Soup.Message.set_response()`, an output stream's `write()`, or
`GLib.Bytes.new()`.

## 7. Format options (JPEG quality, PNG compression)

Both `savev` and `save_to_bufferv` accept format-specific options:

```squirrel
// JPEG at quality 85 (default is 75):
local jpg = pb.save_to_bufferv("jpeg", ["quality"], ["85"])

// PNG at maximum compression (0 = none, 9 = best):
pb.savev("/tmp/dense.png", "png", ["compression"], ["9"])

// PNG with embedded text chunks (key needs "tEXt::" prefix):
pb.savev("/tmp/tagged.png", "png",
         ["tEXt::Author", "tEXt::Description"],
         ["sqgi",        "demo image"])
```

Option values are always passed as strings, even for numbers.

## 8. Inspecting without decoding (`get_file_info`)

Want to know an image's dimensions and format without paying for a full
decode? `Pb.Pixbuf.get_file_info(path)` returns `[PixbufFormat, width, height]`:

```squirrel
local info = Pb.Pixbuf.get_file_info("/path/to/img.jpg")
local fmt = info[0], w = info[1], h = info[2]
print(format("%s  %s  %dx%d\n",
             fmt.get_name(), fmt.get_description(), w, h))
```

`PixbufFormat` exposes:

- `get_name()` — short identifier (`"png"`, `"jpeg"`, `"tiff"`, …)
- `get_description()` — human-readable
- `get_mime_types()` — array of strings
- `get_extensions()` — array of strings
- `is_writable()` — can we encode to this format?
- `is_scalable()` — is it a vector format (svg)?

## 9. Enumerating supported formats

```squirrel
foreach (f in Pb.Pixbuf.get_formats()) {
    print(format("%-10s %-30s writable=%s\n",
                 f.get_name(), f.get_description(),
                 f.is_writable().tostring()))
}
```

On a typical Linux box this lists ~17 loaders. The exact set depends on
which `gdk-pixbuf-loader-*` packages are installed.

Demo: [demo/gdkpixbuf/inspect.nut](../../demo/gdkpixbuf/inspect.nut).

## 10. Geometric transforms: rotate, flip, scale

All transforms produce a new `Pixbuf`; the source is unchanged.

```squirrel
local rotated = src.rotate_simple(Pb.PixbufRotation.counterclockwise)
local flipped = src.flip(/*horizontal=*/true)
local big     = src.scale_simple(src.get_width() * 2,
                                 src.get_height() * 2,
                                 Pb.InterpType.bilinear)
```

`rotate_simple` only handles multiples of 90°. For arbitrary angles use
cairo on a `cairo.ImageSurface`.

Interpolation modes from fastest/worst to slowest/best:

| Mode       | Use for                                            |
|------------|----------------------------------------------------|
| `nearest`  | pixel-art upscaling, fastest                       |
| `tiles`    | downscaling by integer factors                     |
| `bilinear` | sensible default for any scale                     |
| `hyper`    | high-quality downscaling, slowest                  |

## 11. Cropping with `new_subpixbuf`

```squirrel
// Region of interest: 100x100 starting at (40,40).
local roi = src.new_subpixbuf(40, 40, 100, 100)
```

`new_subpixbuf` **shares pixel memory with the source** — writes to the
sub-pixbuf are visible in the parent and vice versa. If you need an
independent copy use `.copy()`, or composite onto a fresh canvas.

## 12. Compositing onto a canvas

The big workhorse for building images out of multiple parts:

```squirrel
// composite(dest, dest_x, dest_y, dest_w, dest_h,
//           off_x, off_y, scale_x, scale_y, interp, overall_alpha)
src.composite(canvas, 50, 50, 100, 100,
              50, 50, 1.0, 1.0, Pb.InterpType.bilinear, 255)
```

- `dest_x`/`dest_y`/`dest_w`/`dest_h` — the *clip rectangle* in destination
  coordinates. Anything outside this rectangle in `canvas` is left alone.
- `off_x`/`off_y`/`scale_x`/`scale_y` — describe how the source is placed
  into the destination *before* the clip. `(off_x, off_y)` is where the
  source's `(0,0)` lands on `canvas`. `scale_x`/`scale_y` scale the source.
- `overall_alpha` — `0`-`255` multiplier on the source's alpha.

The most common pattern is "draw `src` at `(x,y)` with no scaling":

```squirrel
src.composite(canvas,
              x, y, src.get_width(), src.get_height(),
              x, y, 1.0, 1.0,
              Pb.InterpType.nearest, 255)
```

Demo: [demo/gdkpixbuf/mosaic.nut](../../demo/gdkpixbuf/mosaic.nut) builds
a grid of tiles with this pattern.

## 13. Colour adjustments (`saturate_and_pixelate`)

`saturate_and_pixelate(dest, saturation, pixelate)` is a quirky two-in-one:

- `saturation`: `0.0` desaturates to greyscale; `1.0` is identity; values
  greater than `1` boost saturation.
- `pixelate`: if `true`, applies a posterising effect on top.

```squirrel
local out = Pb.Pixbuf.new(Pb.Colorspace.rgb, true, 8,
                          src.get_width(), src.get_height())
src.saturate_and_pixelate(out, 0.0, false)   // greyscale
src.saturate_and_pixelate(out, 2.5, false)   // vivid
src.saturate_and_pixelate(out, 1.0, true)    // pixelated
```

The destination must be allocated by you and have identical dimensions to
the source.

Demo: [demo/gdkpixbuf/transform.nut](../../demo/gdkpixbuf/transform.nut)
covers every transform in one script.

## 14. Raw pixel access

`read_pixel_bytes()` returns a `GLib.Bytes` snapshot of the pixel buffer.
`get_data()` on that returns a plain Squirrel string of bytes — index it
to inspect individual channels:

```squirrel
local b   = pb.read_pixel_bytes()
local raw = b.get_data()
local rs  = pb.get_rowstride()
local nc  = pb.get_n_channels()

// Sample the pixel at (x, y):
local off = y * rs + x * nc
local r = raw[off]     & 0xFF
local g = raw[off + 1] & 0xFF
local b_ = raw[off + 2] & 0xFF
local a = nc == 4 ? (raw[off + 3] & 0xFF) : 255
```

`read_pixels()` exists too but returns a bare integer pointer that's
useless from Squirrel. Always prefer `read_pixel_bytes()`.

For *writing* into the buffer, build pixel rows in a Squirrel string and
hand them to a tile (`Pb.Pixbuf.new` + `.fill`) which you then composite —
direct mutation isn't safely exposed.

## 15. Incremental loading with `PixbufLoader`

When bytes arrive in chunks (HTTP, sockets, a slow disk), feed them into
`PixbufLoader.write()` as they come, then call `.close()`:

```squirrel
local L = Pb.PixbufLoader.new()
L.connect("size-prepared", function (w, h) {
    print(format("image declares %dx%d\n", w, h))
})
L.connect("area-prepared", function () {
    // Pixbuf surface is allocated; can be queried even before close().
    local p = L.get_pixbuf()
})
L.connect("closed", function () { print("done\n") })

while (have_more_bytes()) {
    L.write(next_chunk())
}
L.close()
local img = L.get_pixbuf()
```

Three signals are emitted in order:

1. `size-prepared(w, h)` — fired once the loader knows the dimensions.
2. `area-prepared()` — fired once the pixbuf is allocated and partially
   filled (a progress bar can start reading rows now).
3. `closed()` — fired on `.close()`.

Demo: [demo/gdkpixbuf/loader_pipeline.nut](../../demo/gdkpixbuf/loader_pipeline.nut).

## 16. Loading from a stream (`new_from_stream`)

If you already have a `Gio.InputStream`, `Pixbuf.new_from_stream` reads it
to EOF and decodes synchronously:

```squirrel
local bytes  = GLib.Bytes.new(encoded_data)
local stream = Gio.MemoryInputStream.new_from_bytes(bytes)
local img    = Pb.Pixbuf.new_from_stream(stream, /*cancellable=*/null)
```

Pass a `Gio.Cancellable` (not `null`) to make the read interruptible.
There's also `new_from_stream_async` if you want non-blocking I/O —
SQGI's auto-await rewrites it as a single awaitable call.

## 17. End-to-end: fetching an image over HTTP

Combining libsoup + GdkPixbuf is a one-liner if you're happy to buffer the
whole body, or you can stream chunks into a `PixbufLoader`:

```squirrel
local session = Soup.Session.new()
local msg     = Soup.Message.new("GET", url)

session.send_async(msg, GLib.PRIORITY_DEFAULT, null, function (s, res) {
    local stream = s.send_finish(res)
    local L = Pb.PixbufLoader.new()
    while (true) {
        local b = stream.read_bytes(8192, null)
        if (b == null || b.get_size() == 0) break
        L.write(b.get_data())
    }
    L.close()
    local img = L.get_pixbuf()
    img.savev("/tmp/downloaded.png", "png", [], [])
})
```

The full demo spins up a local Soup server, serves a generated PNG, and
fetches it back — completely hermetic, no network access required.

Demo: [demo/gdkpixbuf/from_http.nut](../../demo/gdkpixbuf/from_http.nut).

## 18. Common pitfalls

| Symptom                                                       | Cause                                                                                          | Fix                                                                                          |
|---------------------------------------------------------------|------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| `new_from_bytes` produces garbage / asserts                   | Expects **raw pixel data**, not an encoded PNG/JPEG blob.                                      | Use `PixbufLoader.write` (encoded bytes) or `Gio.MemoryInputStream` + `new_from_stream`.     |
| `read_pixels()` returns an integer                            | It's a raw pointer to internal storage — unusable from Squirrel.                               | Use `read_pixel_bytes()` → `GLib.Bytes` → `.get_data()` → string.                            |
| Modifying a `new_subpixbuf` changes the parent                | Sub-pixbufs share pixel memory.                                                                | Use `.copy()` first if you need an independent buffer.                                       |
| `savev` silently produces a 0-byte file                       | The format string didn't match a writable loader.                                              | Check `Pb.Pixbuf.get_formats()` and `fmt.is_writable()`; option keys/values must be strings. |
| JPEG of an RGBA pixbuf loses transparency                     | JPEG doesn't support alpha.                                                                    | Composite onto an opaque background first, or save as PNG/TIFF/WebP.                         |
| `PixbufLoader` warns "finalized without close()"              | You dropped the last ref before calling `.close()`.                                            | Always `L.close()` in both success and error paths, before discarding the loader.            |
| Loader silently produces no pixbuf                            | Bytes were truncated or didn't form a complete image; `close()` returns false in C.            | Wrap `write`/`close` in `try`/`catch`; `get_pixbuf()` returns `null` on undecodable input.   |
| Tile colours look "off" after composite                       | The destination wasn't pre-filled (uninitialised memory).                                      | Call `.fill(...)` on the destination right after `Pb.Pixbuf.new`.                            |
| `pb.set_property("colorspace", …)` does nothing               | Most Pixbuf properties are construct-only and read-only after that.                            | Build a fresh pixbuf with the desired shape and copy into it.                                |
