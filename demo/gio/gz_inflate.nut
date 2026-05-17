/**
 * demo/gio/gz_inflate.nut
 *
 * Decompress a .gz file by chaining a Gio.ZlibDecompressor onto a
 * Gio.FileInputStream via Gio.ConverterInputStream — the "wrap a stream
 * around another stream" idiom — then splice into a plain output file.
 *
 * Usage:
 *   sqgi demo/gio/gz_inflate.nut SRC.gz DST
 *
 * Exercises:
 *   - Gio.ZlibCompressorFormat enum
 *   - Gio.ConverterInputStream (constructed via sqgi.new_object so we can
 *     pass the base_stream + converter as construction properties)
 *   - chained converter streams in a splice pipeline
 */

local GLib = import("GLib")
local Gio  = import("Gio")

if (vargv.len() < 2) {
    print("usage: gz_inflate.nut SRC.gz DST\n")
    return
}
local src_path = vargv[0]
local dst_path = vargv[1]

local loop = GLib.MainLoop.new(null, false)

async function inflate(src_path, dst_path) {
    local src = Gio.File.new_for_path(src_path)
    local dst = Gio.File.new_for_path(dst_path)

    local base_in = await sqgi.gio_async(
        @(c, cb) src.read_async(GLib.PRIORITY_DEFAULT, c, cb),
        @(r)     src.read_finish(r))

    local zlib = sqgi.new_object(Gio.ZlibDecompressor, {
        "format": Gio.ZlibCompressorFormat.gzip,
    })

    local conv_in = sqgi.new_object(Gio.ConverterInputStream, {
        "base-stream": base_in,
        "converter":   zlib,
    })

    local out = await sqgi.gio_async(
        @(c, cb) dst.replace_async(null, false,
                                   Gio.FileCreateFlags.none,
                                   GLib.PRIORITY_DEFAULT, c, cb),
        @(r)     dst.replace_finish(r))

    local flags = Gio.OutputStreamSpliceFlags.close_source |
                  Gio.OutputStreamSpliceFlags.close_target
    local n = await sqgi.gio_async(
        @(c, cb) out.splice_async(conv_in, flags,
                                  GLib.PRIORITY_DEFAULT, c, cb),
        @(r)     out.splice_finish(r))

    print(format("inflated %d bytes  %s  →  %s\n", n, src_path, dst_path))
}

inflate(src_path, dst_path).then(@(_) loop.quit(),
                                 function(e) {
                                     ::print("error: " + e + "\n")
                                     loop.quit()
                                 })
loop.run()
