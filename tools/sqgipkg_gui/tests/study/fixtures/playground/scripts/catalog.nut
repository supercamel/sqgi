// Minimal reader for these singular-string GNU gettext fixture catalogs.
// It reads compiled .mo files; .po sources are not runtime dependencies.
local Gio = import("Gio")
function read_string(stream, offset, size) {
    stream.seek(offset)
    local text = ""
    for (local i = 0; i < size; i++) text += (stream.readn('b') & 255).tochar()
    return text
}
function translate(root, language, message) {
    local path = root + "/" + language + "/LC_MESSAGES/playground.mo"
    if (!Gio.File.new_for_path(path).query_exists(null)) return message
    local stream = file(path, "rb")
    try {
        if ((stream.readn('i') & 0xffffffff) != 0x950412de) throw "Unexpected gettext catalog byte order"
        local revision = stream.readn('i'), count = stream.readn('i')
        local originals = stream.readn('i'), translations = stream.readn('i')
        if (revision != 0 || count < 0 || count > 128) throw "Unexpected fixture catalog format"
        for (local i = 0; i < count; i++) {
            stream.seek(originals + 8 * i)
            local length = stream.readn('i'), offset = stream.readn('i')
            if (read_string(stream, offset, length) != message) continue
            stream.seek(translations + 8 * i)
            length = stream.readn('i'); offset = stream.readn('i')
            local text = read_string(stream, offset, length)
            stream.close(); return text
        }
        stream.close(); return message
    } catch (error) { stream.close(); throw error }
}
return { translate = translate }
