// ELF64/Bionic audit. readelf supplies dynamic strings; SQGI checks raw headers.
local C = import("common.nut"), GLib = import("GLib")
local M = { SYSTEM_LIBRARIES = ["libc.so", "libm.so", "libdl.so", "liblog.so", "libandroid.so",
    "libEGL.so", "libGLESv2.so", "libvulkan.so", "libjnigraphics.so", "libnativewindow.so"] }
M.headers <- function(data) {
    if (data.len() < 64 || data.slice(0, 6) != "\x7fELF\x02\x01") throw "Expected a 64-bit little-endian ELF"
    local offset = C.uint_le(data, 32, 8), stride = C.uint_le(data, 54, 2), count = C.uint_le(data, 56, 2)
    if (stride < 56 || offset > data.len() || count * stride > data.len() - offset) throw "Invalid ELF program headers"
    local result = []
    for (local i = 0; i < count; i++) result.push(offset + i * stride)
    return result
}
M.dynamic_values <- function(text, kind) {
    local values = []
    foreach (line in split(text, "\n")) {
        if (line.find("(" + kind + ")") == null) continue
        local start = line.find("["), end = line.find("]")
        if (start == null || end == null || end <= start) throw "Malformed readelf dynamic entry"
        values.push(line.slice(start + 1, end))
    }
    return values
}
M.inspect <- function(path, abi, readelf = "readelf") {
    local data = C.read(path), headers = M.headers(data)
    local machines = { ["arm64-v8a"] = 183, x86_64 = 62 }
    if (!(abi in machines) || C.uint_le(data, 18, 2) != machines[abi]) throw "Wrong ELF architecture for " + abi + ": " + path
    local alignments = []
    foreach (header in headers) {
        local type = C.uint_le(data, header, 4)
        if (type == 1) {
            local alignment = C.uint_le(data, header + 48, 8)
            if (alignment < 16384) throw "ELF LOAD segments are not aligned for 16 KB pages: " + path
            alignments.push(alignment)
        }
        if (type == 3) {
            local start = C.uint_le(data, header + 8, 8), size = C.uint_le(data, header + 32, 8)
            if (size < 1 || start > data.len() - size) throw "Invalid ELF interpreter bounds: " + path
            local value = data.slice(start, start + size)
            while (value.len() && value[value.len() - 1] == 0) value = value.slice(0, value.len() - 1)
            if (value != "/system/bin/linker64") throw "Non-Bionic ELF interpreter: " + path
        }
    }
    if (!alignments.len()) throw "ELF has no LOAD segments: " + path
    local dynamic = C.process([readelf, "-d", path])
    if (dynamic.find("(RPATH)") != null || dynamic.find("(RUNPATH)") != null) throw "Android ELF contains a runtime search path: " + path
    local names = M.dynamic_values(dynamic, "SONAME")
    return { soname = names.len() ? names[0] : null, needed = M.dynamic_values(dynamic, "NEEDED"),
        load_alignments = alignments, sha256 = C.digest(data), size = data.len() }
}
M.closure <- function(prefix, abi, roots, readelf = "readelf") {
    local pending = clone roots, result = {}
    while (pending.len()) {
        local name = pending.pop()
        if (name in result || M.SYSTEM_LIBRARIES.find(name) != null) continue
        if (name == "libz.so") throw "Runtime links Android's public libz; rebuild against the private pinned zlib"
        if (GLib.path_get_basename(name) != name) throw "Invalid runtime dependency name: " + name
        local path = prefix + "/lib/" + name
        if (!C.is_file(path)) throw "Missing runtime dependency: " + path
        local record = M.inspect(path, abi, readelf)
        if (record.soname != name) throw "SONAME mismatch: " + name
        result[name] <- record
        pending.extend(record.needed)
    }
    return result
}
M.remove_build_rpath <- function(source, destination, allowed_roots, readelf = "readelf") {
    local dynamic = C.process([readelf, "-d", source])
    local paths = M.dynamic_values(dynamic, "RPATH"); paths.extend(M.dynamic_values(dynamic, "RUNPATH"))
    if (!paths.len()) return null
    local roots = []; foreach (root in allowed_roots) roots.push(C.resolve_path(root))
    foreach (value in paths) foreach (part in split(value, ":")) {
        // Origin substitutions are literal, not shell expansion.
        local expanded = part
        foreach (origin in ["${ORIGIN}", "$ORIGIN"]) {
            local position
            while ((position = expanded.find(origin)) != null)
                expanded = expanded.slice(0, position) + GLib.path_get_dirname(source) + expanded.slice(position + origin.len())
        }
        local path = C.resolve_path(expanded), allowed = false
        foreach (root in roots) if (C.within(path, root)) allowed = true
        if (!allowed) throw "Refusing non-target native runtime search path: " + part
    }
    local data = C.read(source), changes = [], changed = false
    foreach (header in M.headers(data)) {
        if (C.uint_le(data, header, 4) != 2) continue
        local start = C.uint_le(data, header + 8, 8), size = C.uint_le(data, header + 32, 8)
        if (size % 16 || start > data.len() - size) throw "Invalid ELF dynamic section"
        local contents = ""
        for (local position = start; position < start + size; position += 16) {
            local tag = C.uint_le(data, position, 8)
            if (tag == 0) break
            if (tag == 15 || tag == 29) changed = true
            else contents += data.slice(position, position + 16)
        }
        while (contents.len() < size) contents += "\x00"
        changes.push({ start = start, size = size, contents = contents })
    }
    if (!changed) throw "Cannot find native library runtime search path tags"
    local original = C.digest(data)
    foreach (change in changes) data = data.slice(0, change.start) + change.contents + data.slice(change.start + change.size)
    C.copy(source, destination); C.write(destination, data)
    return { original_sha256 = original, sha256 = C.digest(data), removed_build_search_paths = paths }
}
return M
