/**
 * demo/gio/tasks_all.nut
 *
 * Fan-out / fan-in with sqgi.all. Reads N small files concurrently via
 * Gio.File.load_contents_async and prints byte counts in completion order
 * vs request order, then sums sizes.
 *
 * Usage:
 *   sqgi demo/gio/tasks_all.nut [PATH...]
 *
 * Exercises:
 *   - Multiple awaitables in parallel
 *   - sqgi.all aggregation (results in request order)
 *   - Auto-async wrapper for File.load_contents_async
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local paths = (vargv.len() > 0) ? vargv
              : ["/etc/hostname", "/etc/os-release", "/proc/uptime",
                 "/proc/loadavg", "/proc/version"]

local loop = GLib.MainLoop.new(null, false)

async function load_one(path) {
    try {
        local f = Gio.File.new_for_path(path)
        local res = await f.load_contents_async(null)
        // load_contents_finish returns [contents, etag_out] as multi-out
        local data = (typeof(res) == "array") ? res[0] : res
        return [path, data, null]
    } catch (e) {
        return [path, null, e]
    }
}

async function run() {
    local t0 = GLib.get_monotonic_time()

    local tasks = []
    foreach (p in paths) tasks.append(load_one(p))

    local results = await sqgi.all(tasks)
    local elapsed_ms = (GLib.get_monotonic_time() - t0) / 1000

    local total = 0
    foreach (r in results) {
        local p = r[0]; local d = r[1]; local err = r[2]
        if (err != null) {
            print(format("  %-32s  ERR  %s\n", p, err))
        } else {
            print(format("  %-32s  %5d B\n", p, d.len()))
            total = total + d.len()
        }
    }
    print(format("total: %d B across %d files in %d ms\n",
                 total, paths.len(), elapsed_ms))
}

run().then(@(_) loop.quit(),
           function(e) { ::print("error: " + e + "\n"); loop.quit() })
sqgi.timeout_add(10000, function() { print("deadline\n"); loop.quit(); return false })
loop.run()
