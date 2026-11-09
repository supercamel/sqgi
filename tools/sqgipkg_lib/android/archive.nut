// Read the ZIP32 archives emitted by the pinned Android toolchain. GIO handles
// deflate; SQGI validates directory/member boundaries and duplicate names.
local C = import("common.nut"), GLib = import("GLib"), Gio = import("Gio")
class Zip {
    data = null; entries = null; directory_start = null
    constructor(path) {
        data = C.read(path); entries = {}
        local end = null, lower = data.len() > 65557 ? data.len() - 65557 : 0
        for (local offset = data.len() - 22; offset >= lower; offset--) {
            if (C.uint_le(data, offset, 4) == 0x06054b50 && offset + 22 + C.uint_le(data, offset + 20, 2) == data.len()) {
                end = offset; break
            }
        }
        if (end == null) throw "Missing ZIP end record: " + path
        local count = C.uint_le(data, end + 10, 2), size = C.uint_le(data, end + 12, 4), start = C.uint_le(data, end + 16, 4)
        if (count == 65535 || size == 0xffffffff || start == 0xffffffff) throw "ZIP64 is not supported by this Android packaging profile"
        if (C.uint_le(data, end + 4, 2) || C.uint_le(data, end + 6, 2) || count != C.uint_le(data, end + 8, 2))
            throw "Multi-disk ZIP archives are unsupported"
        if (start > end || size > end - start) throw "ZIP central directory escapes the archive"
        directory_start = start
        local cursor = start
        for (local i = 0; i < count; i++) {
            if (cursor > start + size - 46 || C.uint_le(data, cursor, 4) != 0x02014b50) throw "Invalid ZIP central directory"
            local name_size = C.uint_le(data, cursor + 28, 2), extra_size = C.uint_le(data, cursor + 30, 2), comment_size = C.uint_le(data, cursor + 32, 2)
            local next = cursor + 46 + name_size + extra_size + comment_size
            if (next > start + size) throw "Truncated ZIP member metadata"
            local name = data.slice(cursor + 46, cursor + 46 + name_size)
            C.relative(name)
            if (name in entries) throw "Duplicate archive members in Android artifact: " + name
            local entry = { offset = C.uint_le(data, cursor + 42, 4), flags = C.uint_le(data, cursor + 8, 2),
                method = C.uint_le(data, cursor + 10, 2), size = C.uint_le(data, cursor + 24, 4),
                compressed = C.uint_le(data, cursor + 20, 4), mode = C.uint_le(data, cursor + 38, 4) >> 16 }
            if (entry.offset >= start || entry.flags & 1 || C.uint_le(data, cursor + 34, 2)) throw "Unsupported encrypted/split ZIP member"
            if (entry.size == 0xffffffff || entry.compressed == 0xffffffff) throw "ZIP64 member is unsupported"
            entries[name] <- entry; cursor = next
        }
        if (cursor != start + size) throw "ZIP central directory contains unexpected data"
    }
    function read(name) {
        if (!(name in entries)) throw "ZIP member is missing: " + name
        local e = entries[name], offset = e.offset
        if (offset > data.len() - 30 || C.uint_le(data, offset, 4) != 0x04034b50) throw "Invalid ZIP local header"
        if (C.uint_le(data, offset + 6, 2) != e.flags || C.uint_le(data, offset + 8, 2) != e.method) throw "ZIP local/central metadata differs"
        local name_size = C.uint_le(data, offset + 26, 2), extra_size = C.uint_le(data, offset + 28, 2)
        local start = offset + 30 + name_size + extra_size
        if (start > directory_start || e.compressed > directory_start - start || data.slice(offset + 30, offset + 30 + name_size) != name)
            throw "ZIP member bounds/name differs"
        local bytes = data.slice(start, start + e.compressed)
        if (e.method == 8) {
            local input = Gio.MemoryInputStream.new_from_bytes(GLib.Bytes.new(bytes))
            local stream = Gio.ConverterInputStream.new(input, Gio.ZlibDecompressor.new(Gio.ZlibCompressorFormat.raw))
            local chunks = [], length = 0
            while (true) {
                local chunk = stream.read_bytes(1048576, null)
                if (!chunk.get_size()) break
                length += chunk.get_size()
                if (length > e.size) throw "Inflated ZIP member exceeds its declared length"
                chunks.push(chunk.get_data())
            }
            stream.close(null)
            bytes = ""; foreach (chunk in chunks) bytes += chunk
        } else if (e.method != 0) throw "Unsupported ZIP compression method: " + e.method
        if (bytes.len() != e.size) throw "ZIP member length differs: " + name
        return bytes
    }
}
local M = { Zip = Zip }
M.tar_text <- function(data, start, size) {
    local end = start
    while (end < start + size && data[end] != 0) end++
    return data.slice(start, end)
}
M.tar_number <- function(data, start, size) {
    local value = 0
    if ((data[start] & 255) == 128) {
        for (local i = start + 1; i < start + size; i++) {
            if (value > 0x7fffffffffffffff / 256) throw "TAR number exceeds supported range"
            value = value * 256 + (data[i] & 255)
        }
        return value
    }
    local text = strip(M.tar_text(data, start, size))
    foreach (c in text) {
        if (c < '0' || c > '7') throw "Invalid TAR numeric field"
        value = value * 8 + c - '0'
    }
    return value
}
M.tar_read <- function(path, callback) {
    local input = Gio.File.new_for_path(path).read(null)
    local stream = Gio.ConverterInputStream.new(input, Gio.ZlibDecompressor.new(Gio.ZlibCompressorFormat.gzip))
    local read = function(size) {
        local parts = [], length = 0
        while (length < size) {
            local bytes = stream.read_bytes(size - length, null)
            if (!bytes.get_size()) throw "Truncated TAR archive"
            parts.push(bytes.get_data()); length += bytes.get_size()
        }
        return C.concat(parts, "")
    }
    local global = {}, attributes = {}, error = null
    try {
        while (true) {
            local header = read(512), zero = true
            foreach (c in header) if (c != 0) { zero = false; break }
            if (zero) break
            local sum = 0, signed_sum = 0
            for (local i = 0; i < 512; i++) {
                local value = i >= 148 && i < 156 ? 32 : header[i] & 255
                sum += value; signed_sum += value >= 128 ? value - 256 : value
            }
            local checksum = M.tar_number(header, 148, 8)
            if (checksum != sum && checksum != signed_sum) throw "TAR header checksum mismatch"
            local type = header[156], size = M.tar_number(header, 124, 12), name = M.tar_text(header, 0, 100)
            local prefix = M.tar_text(header, 345, 155), link = M.tar_text(header, 157, 100)
            if (prefix != "" && M.tar_text(header, 257, 6) == "ustar") name = prefix + "/" + name
            if (type != 'x' && type != 'g' && type != 'L' && type != 'K') {
                local effective = clone global; foreach (key, value in attributes) effective[key] <- value
                if ("path" in effective) name = effective.path
                if ("linkpath" in effective) link = effective.linkpath
                if ("size" in effective) {
                    if (!regexp("^[0-9]+$").match(effective.size)) throw "Invalid PAX size"
                    size = effective.size.tointeger()
                    if (size < 0) throw "Invalid PAX size"
                }
                attributes = {}
            }
            local data = read(size)
            if (size % 512) read(512 - size % 512)
            if (type == 'x' || type == 'g') {
                local offset = 0
                while (offset < data.len()) {
                    local space = data.find(" ", offset)
                    if (space == null || !regexp("^[0-9]+$").match(data.slice(offset, space))) throw "Invalid PAX record"
                    local length = data.slice(offset, space).tointeger()
                    if (length <= space - offset + 2 || length > data.len() - offset || data[offset + length - 1] != '\n') throw "Truncated PAX record"
                    local record = data.slice(space + 1, offset + length - 1), equals = record.find("=")
                    if (equals == null) throw "Invalid PAX attribute"
                    local target = type == 'g' ? global : attributes
                    target[record.slice(0, equals)] <- record.slice(equals + 1); offset += length
                }
            } else if (type == 'L' || type == 'K') attributes[type == 'L' ? "path" : "linkpath"] <- M.tar_text(data, 0, data.len())
            else callback({ name = name, link = link, type = type, mode = M.tar_number(header, 100, 8), data = data })
        }
        // Consume the compressor footer too, so a complete-looking TAR prefix
        // cannot conceal a truncated or corrupt gzip stream.
        while (true) {
            local padding = stream.read_bytes(65536, null)
            if (!padding.get_size()) break
            foreach (byte in padding.get_data()) if (byte != 0) throw "Unexpected data after TAR end record"
        }
    } catch (caught) { error = caught }
    stream.close(null)
    if (error != null) throw error
}
return M
