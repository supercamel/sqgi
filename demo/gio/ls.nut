/**
 * demo/gio/ls.nut
 *
 * Async directory listing. Uses Gio.File.enumerate_children_async +
 * Gio.FileEnumerator.next_files_async in pages, printing one line per entry.
 *
 * Usage:
 *   sqgi demo/gio/ls.nut [PATH]    (default: current directory ".")
 *
 * Exercises:
 *   - enumerate_children_async / next_files_async (paged enumerator)
 *   - Gio.FileInfo attribute reads (name/size/type/mtime)
 *   - Gio.FileQueryInfoFlags
 *   - Gio.FileType enum dispatch
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local path = (vargv.len() >= 1) ? vargv[0] : "."
local loop = GLib.MainLoop.new(null, false)

function type_char(file_type) {
    if (file_type == Gio.FileType.directory) return "d"
    if (file_type == Gio.FileType.symbolic_link) return "l"
    if (file_type == Gio.FileType.special) return "s"
    return "-"
}

function fmt_size(n) {
    if (n < 1024) return format("%5d", n)
    if (n < 1024 * 1024) return format("%4.1fK", n / 1024.0)
    if (n < 1024 * 1024 * 1024) return format("%4.1fM", n / 1048576.0)
    return format("%4.1fG", n / 1073741824.0)
}

async function ls(path) {
    local dir = Gio.File.new_for_path(path)

    local attrs = "standard::name,standard::type,standard::size,time::modified"
    local enumr = await sqgi.gio_async(
        @(c, cb) dir.enumerate_children_async(attrs,
                                              Gio.FileQueryInfoFlags.none,
                                              GLib.PRIORITY_DEFAULT, c, cb),
        @(r)     dir.enumerate_children_finish(r))

    local total = 0
    while (true) {
        local infos = await sqgi.gio_async(
            @(c, cb) enumr.next_files_async(64, GLib.PRIORITY_DEFAULT, c, cb),
            @(r)     enumr.next_files_finish(r))
        if (infos == null || infos.len() == 0) break
        foreach (info in infos) {
            local name = info.get_name()
            local size = info.get_size()
            local ftyp = info.get_file_type()
            local mt   = info.get_modification_date_time()
            local stamp = mt ? mt.format("%Y-%m-%d %H:%M") : "                "
            print(format("%s  %s  %s  %s\n",
                         type_char(ftyp), fmt_size(size), stamp, name))
            total = total + 1
        }
    }
    print(format("\n%d entries in %s\n", total, path))
    // FileEnumerator owns its iteration; closing it releases the handle.
    enumr.close_sync(null)
}

ls(path).then(@(_) loop.quit(),
              function(e) { ::print("error: " + e + "\n"); loop.quit() })
loop.run()
