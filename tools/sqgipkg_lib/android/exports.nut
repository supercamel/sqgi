// Private native SDK composition. Never hard-link or modify a shared base.
local C = import("common.nut"), GLib = import("GLib"), Gio = import("Gio")
local M = { MARKER = ".sqgipkg-native-sdk.json" }
M.inventory <- function(root) {
    local files = {}
    foreach (path in C.walk(root)) {
        local info = Gio.File.new_for_path(path).query_info("standard::type,standard::symlink-target,unix::mode", Gio.FileQueryInfoFlags.nofollow_symlinks, null)
        files[path.slice(root.len() + 1)] <- C.is_link(path) ? { link = info.get_symlink_target() } :
            { sha256 = C.file_hash(path), mode = info.get_attribute_uint32("unix::mode") & 511 }
    }
    return files
}
M.initialize <- function(sdk_base, root) {
    sdk_base = C.realpath(sdk_base); root = C.absolute(root)
    local resolved = C.resolve_path(root)
    if (C.is_link(root) || C.within(resolved, sdk_base) || C.within(sdk_base, resolved)) throw "Native SDK must be separate from its base sysroot"
    if (C.exists(root) && !C.is_file(root + "/" + M.MARKER)) throw "Refusing to replace an unowned native SDK directory"
    local parent = GLib.path_get_dirname(root); C.mkdir(parent)
    C.temporary(function(temporary) {
        C.process(["cp", "-a", "--reflink=auto", "--", sdk_base + "/.", temporary])
        C.remove(temporary + "/" + M.MARKER)
        C.atomic_json(temporary + "/" + M.MARKER, { ["base"] = sdk_base, exports = {} })
        local backup = root + ".previous-" + GLib.uuid_string_random(), previous = C.exists(root)
        if (previous) C.move(root, backup)
        try { C.move(temporary, root) } catch (caught) { if (previous) C.move(backup, root); throw caught }
        if (previous) C.remove(backup)
    }, parent)
}
M.export_files <- function(root, owner, installed) {
    root = C.realpath(root)
    local data = sqgi.json.parse(C.read(root + "/" + M.MARKER)), prepared = [], destinations = {}
    foreach (source, target in installed) {
        if (!C.starts(target, "/")) throw "Invalid native install destination: " + target
        local relative = C.relative(target.slice(1))
        if (!C.starts(relative, "usr/")) throw "Native development exports must install below /usr: " + target
        if (!C.is_file(source)) throw "Native install output is missing: " + source
        local destination = root + "/" + relative
        if (!C.within(C.resolve_path(GLib.path_get_dirname(destination)), root)) throw "Native export escapes SDK through a directory symlink: " + relative
        local checksum = C.file_hash(source)
        if (relative in destinations && destinations[relative] != checksum) throw "Conflicting native SDK export in one recipe: " + relative
        destinations[relative] <- checksum
        if ((C.exists(destination) || C.is_link(destination)) && (!C.is_file(destination) || C.file_hash(destination) != checksum))
            throw "Conflicting native SDK export: " + relative
        prepared.push({ source = source, destination = destination, relative = relative, checksum = checksum })
    }
    foreach (item in prepared) {
        if (!C.exists(item.destination)) C.copy(item.source, item.destination)
        if (!(item.relative in data.exports) && !C.exists(data["base"] + "/" + item.relative))
            data.exports[item.relative] <- { recipe = owner, sha256 = item.checksum }
    }
    C.atomic_json(root + "/" + M.MARKER, data)
}
return M
