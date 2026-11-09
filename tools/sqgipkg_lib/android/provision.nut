// Hash-pinned host tools, extracted atomically into SQGI-owned directories.
local C = import("common.nut"), GLib = import("GLib"), Gio = import("Gio")
local HERE = GLib.path_get_dirname(C.absolute(__FILE__)), M = {}
M.lock <- function() { return sqgi.json.parse(C.read(HERE + "/setup.lock.json")) }
M.root <- function() { return GLib.get_user_data_dir() + "/sqgipkg/android" }
M.download <- function(input, offline) {
    local archive = C.cache() + "/downloads/" + input.name
    if (!C.exists(archive)) {
        if (offline) throw "Offline Android setup needs cached " + input.name
        print("sqgipkg: downloading " + input.name + " (" + input.size / 1048576 + " MiB)\n")
        C.fetch(input.url, archive, input.sha256, 1800)
    }
    if (Gio.File.new_for_path(archive).query_info("standard::size", Gio.FileQueryInfoFlags.none, null).get_size() != input.size || C.file_hash(archive) != input.sha256)
        throw "Android setup archive checksum mismatch: " + archive
    return archive
}
M.ready <- function(input) {
    local root = M.root() + "/tools/" + input.directory
    if (!C.is_file(root + "/input.json") || !C.is_file(root + "/" + input.probe)) return false
    return C.equal(sqgi.json.parse(C.read(root + "/input.json")), input)
}
M.prepare <- function(input, offline) {
    local parent = M.root() + "/tools", root = parent + "/" + input.directory
    C.mkdir(parent)
    return C.locked(parent + "/prepare.lock", function() {
        if (M.ready(input)) return root
        if (C.exists(root)) throw "Android tool directory is incomplete or belongs to another version: " + root
        local archive = M.download(input, offline)
        C.temporary(function(temporary) {
            // Only the checksum-pinned upstream archive reaches unzip.
            C.process(["unzip", "-q", archive, "-d", temporary])
            if (!C.is_file(temporary + "/" + input.probe)) throw "Android tool archive lacks " + input.probe
            C.atomic_json(temporary + "/input.json", input); C.move(temporary, root)
        }, parent)
        return root
    })
}
return M
