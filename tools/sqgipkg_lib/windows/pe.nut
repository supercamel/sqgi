// PE/COFF image inspection, independent of host binutils or a shell.
// Layout: https://learn.microsoft.com/en-us/windows/win32/debug/pe-format
function uint_at(data, offset, size) {
    if (offset < 0 || offset + size > data.len()) throw "truncated PE image"
    local value = 0
    for (local i = 0; i < size; i++) value = value | ((data[offset + i] & 255) << (8 * i))
    return value
}

function inspect(data) {
    if (data.len() < 64 || data.slice(0, 2) != "MZ") return null
    local pe = uint_at(data, 60, 4)
    if (uint_at(data, pe, 4) != 0x00004550) throw "invalid PE signature"
    local machine = uint_at(data, pe + 4, 2)
    local count = uint_at(data, pe + 6, 2)
    local optional_size = uint_at(data, pe + 20, 2)
    local optional = pe + 24
    local magic = uint_at(data, optional, 2)
    if (magic != 0x10b && magic != 0x20b) throw "unsupported PE optional header"
    local directories = optional + (magic == 0x20b ? 112 : 96)
    local directory_count = uint_at(data, directories - 4, 4)
    if (directories > optional + optional_size || count > 96) throw "invalid PE headers"
    local sections = []
    for (local i = 0; i < count; i++) {
        local offset = optional + optional_size + 40 * i
        sections.push({ rva = uint_at(data, offset + 12, 4), size = uint_at(data, offset + 16, 4),
            raw = uint_at(data, offset + 20, 4) })
    }
    local header_size = uint_at(data, optional + 60, 4)
    local file_offset = function(rva) {
        if (rva < header_size && rva < data.len()) return rva
        foreach (section in sections) if (rva >= section.rva && rva - section.rva < section.size) {
            local offset = section.raw + rva - section.rva
            if (offset >= data.len()) throw "PE RVA outside image"
            return offset
        }
        throw "PE RVA outside sections"
    }
    local dlls = []
    // Normal imports, plus RVA-based delay imports.
    foreach (index in [1, 13]) {
        if (index >= directory_count) continue
        if (directories + index * 8 + 8 > optional + optional_size) throw "truncated PE data directory"
        local rva = uint_at(data, directories + index * 8, 4)
        local size = uint_at(data, directories + index * 8 + 4, 4)
        if (rva == 0 || size == 0) continue
        local stride = index == 1 ? 20 : 32
        local offset = file_offset(rva)
        local terminated = false
        for (local pos = 0; pos + stride <= size; pos += stride) {
            local row = offset + pos
            local name_rva = uint_at(data, row + (index == 1 ? 12 : 4), 4)
            if (name_rva == 0) { terminated = true; break }
            if (index == 13 && (uint_at(data, row, 4) & 1) == 0) {
                // Old PE32 delay descriptors contain VAs instead of RVAs.
                if (magic != 0x10b) throw "unsupported PE64 delay import VA"
                name_rva -= uint_at(data, optional + 28, 4)
            }
            local start = file_offset(name_rva)
            local end = start
            while (end < data.len() && data[end] != 0 && end - start < 4096) end++
            if (end >= data.len() || end - start >= 4096) throw "unterminated PE import name"
            local name = data.slice(start, end)
            if (name.find("/") != null || name.find("\\") != null || name.find(":") != null) throw "invalid PE import name"
            dlls.push(name)
        }
        if (!terminated) throw "unterminated PE import table"
    }
    return { arch = machine == 0x8664 ? "x86_64" : (machine == 0x14c ? "i386" : (machine == 0xaa64 ? "aarch64" : "unknown")), dlls = dlls }
}
return { inspect = inspect }
