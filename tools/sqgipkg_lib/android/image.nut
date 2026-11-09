// AOSP liblp metadata: pinned API-31, single-device linear/zero extents.
local C = import("common.nut"), Gio = import("Gio"), GLib = import("GLib"), M = {}
M.exact <- function(stream, size) {
    local parts = [], length = 0
    while (length < size) {
        local data = stream.read_bytes(size - length, null).get_data()
        if (data.len() == 0) throw "Truncated Android image"
        parts.push(data); length += data.len()
    }
    return C.concat(parts, "")
}
M.hex <- function(data) { local result = ""; foreach (byte in data) result += format("%02x", byte & 255); return result }
M.checksum <- function(data, offset) {
    local zero = ""; for (local i = 0; i < 32; i++) zero += "\x00"
    if (C.digest(data.slice(0, offset) + zero + data.slice(offset + 32)) != M.hex(data.slice(offset, offset + 32))) throw "Android partition metadata checksum mismatch"
}
M.partitions <- function(stream, start, size) {
    stream.seek(start + 4096, GLib.SeekType.set, null)
    local geometry = M.exact(stream, 52)
    if (C.uint_le(geometry, 0, 4) != 0x616c4467 || C.uint_le(geometry, 4, 4) != 52) throw "Unsupported Android partition geometry"
    M.checksum(geometry, 8)
    local maximum = C.uint_le(geometry, 40, 4), slots = C.uint_le(geometry, 44, 4), alignment = C.uint_le(geometry, 48, 4)
    if (maximum > 4194304 || maximum < 128 || slots == 0 || alignment % 512) throw "Invalid Android metadata geometry"
    stream.seek(start + 12288, GLib.SeekType.set, null)
    local header = M.exact(stream, 128), header_size = C.uint_le(header, 8, 4)
    if (C.uint_le(header, 0, 4) != 0x414c5030 || C.uint_le(header, 4, 2) != 10 || C.uint_le(header, 6, 2) > 2 || [128, 256].find(header_size) == null)
        throw "Unsupported Android metadata version"
    header += M.exact(stream, header_size - 128); M.checksum(header, 12)
    local table_size = C.uint_le(header, 44, 4)
    if (table_size + header_size > maximum || 12288 + maximum * slots * 2 > size) throw "Android metadata exceeds its partition"
    local tables = M.exact(stream, table_size)
    if (C.digest(tables) != M.hex(header.slice(48, 80))) throw "Android partition table checksum mismatch"
    local table = function(offset, expected_size) {
        local position = C.uint_le(header, offset, 4), count = C.uint_le(header, offset + 4, 4), stride = C.uint_le(header, offset + 8, 4), result = []
        if (stride != expected_size || position + count * stride > tables.len()) throw "Android table descriptor exceeds metadata"
        for (local i = 0; i < count; i++) result.push(tables.slice(position + i * stride, position + (i + 1) * stride))
        return result
    }
    local devices = table(116, 64)
    if (devices.len() != 1) throw "Only single-device Android images are supported"
    local first_sector = C.uint_le(devices[0], 0, 8), device_size = C.uint_le(devices[0], 16, 8)
    if (device_size > size) throw "Android block device exceeds the image partition"
    local extents = table(92, 24), result = {}
    foreach (entry in table(80, 52)) {
        local end = 0; while (end < 36 && entry[end] != 0) end++
        local name = entry.slice(0, end), attributes = C.uint_le(entry, 36, 4), first = C.uint_le(entry, 40, 4), count = C.uint_le(entry, 44, 4)
        if (!regexp("^[A-Za-z0-9_]+$").match(name) || name in result) throw "Invalid or duplicate Android partition name"
        if ((attributes & ~1) || first + count > extents.len()) throw "Unsupported Android partition attributes or extent range"
        local regions = []
        for (local i = first; i < first + count; i++) {
            local extent = extents[i], sectors = C.uint_le(extent, 0, 8), kind = C.uint_le(extent, 8, 4), data = C.uint_le(extent, 12, 8), source = C.uint_le(extent, 20, 4)
            if (sectors > size / 512) throw "Android extent exceeds the block device"
            if (kind == 0) {
                if (source != 0 || data < first_sector || data > device_size / 512 - sectors) throw "Android extent exceeds the block device"
                regions.push([start + data * 512, sectors * 512])
            } else if (kind == 1 && data == 0 && source == 0) regions.push([null, sectors * 512])
            else throw "Unsupported Android extent"
        }
        result[name] <- regions
    }
    return result
}
M.extract_system <- function(image, destination) {
    local layout = sqgi.json.parse(C.process(["/usr/sbin/sfdisk", "--json", image])).partitiontable
    if (layout.label != "gpt" || layout.sectorsize != 512) throw "Expected the pinned emulator GPT image"
    local supers = []; foreach (partition in layout.partitions) if (C.get(partition, "name") == "super") supers.push(partition)
    if (supers.len() != 1) throw "Expected one Android super partition"
    local start = supers[0].start * 512, size = supers[0].size * 512
    local file = Gio.File.new_for_path(image), image_size = file.query_info("standard::size", Gio.FileQueryInfoFlags.none, null).get_size()
    if (start < 0 || size <= 0 || start > image_size - size) throw "GPT partition exceeds image"
    local source = file.read(null), output = null, error = null
    try {
        local regions = M.partitions(source, start, size), length = 0
        if (!("system" in regions)) throw "Expected Android system partition"
        output = Gio.File.new_for_path(destination).replace(null, false, Gio.FileCreateFlags.none, null)
        foreach (region in regions.system) {
            local offset = region[0], count = region[1]; length += count
            if (offset == null) { output.seek(count, GLib.SeekType.cur, null); continue }
            source.seek(offset, GLib.SeekType.set, null)
            while (count) {
                local block = M.exact(source, count < 1048576 ? count : 1048576)
                output.write_all(block, null); count -= block.len()
            }
        }
        output.truncate(length, null)
    } catch (caught) { error = caught }
    if (output != null) output.close(null)
    source.close(null)
    if (error != null) throw error
}
return M
