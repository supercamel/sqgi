/**
 * demo/gio/stream_copy.nut
 *
 * cp(1)-alike. Stream src → dst with zero-copy
 * Gio.OutputStream.splice_async, which is the canonical "let GIO drive both
 * sides of the pipe" idiom and works regardless of whether the underlying
 * descriptors are files, sockets, pipes, or GVFS resources.
 *
 * Usage:
 *   sqgi demo/gio/stream_copy.nut SRC DST
 *
 * Exercises:
 *   - Gio.File.read_async  / replace_async / splice_async  finish pair
 *   - Gio.OutputStreamSpliceFlags bitmask (CLOSE_SOURCE | CLOSE_TARGET)
 *   - error reporting via sqgi.GError
 */

local GLib = import("GLib")
local Gio  = import("Gio")

if (vargv.len() < 2) {
    print("usage: stream_copy.nut SRC DST\n")
    return
}
local src_path = vargv[0]
local dst_path = vargv[1]

local loop = GLib.MainLoop.new(null, false)

async function copy(src_path, dst_path) {
    local src = Gio.File.new_for_path(src_path)
    local dst = Gio.File.new_for_path(dst_path)

    local input  = await sqgi.gio_async(
        @(c, cb) src.read_async(GLib.PRIORITY_DEFAULT, c, cb),
        @(r)     src.read_finish(r))

    local output = await sqgi.gio_async(
        @(c, cb) dst.replace_async(null, false,
                                   Gio.FileCreateFlags.none,
                                   GLib.PRIORITY_DEFAULT, c, cb),
        @(r)     dst.replace_finish(r))

    // splice_async returns the total number of bytes spliced.
    local flags = Gio.OutputStreamSpliceFlags.close_source |
                  Gio.OutputStreamSpliceFlags.close_target
    local n = await sqgi.gio_async(
        @(c, cb) output.splice_async(input, flags,
                                     GLib.PRIORITY_DEFAULT, c, cb),
        @(r)     output.splice_finish(r))

    print(format("copied %d bytes  %s  →  %s\n", n, src_path, dst_path))
}

try {
    copy(src_path, dst_path).then(@(_) loop.quit(),
                                  function(e) {
                                      ::print("error: " + e + "\n")
                                      loop.quit()
                                  })
    loop.run()
} catch (e) {
    print("error: " + e + "\n")
}
