// C-DOC: authored JSON stays separate from the packager's resolved options.
local Gio = import("Gio")
local GLib = import("GLib")
local Relocation = import("relocation.nut")

function copy_value(value) { return sqgi.json.parse(sqgi.json.stringify(value)) }

function pretty(value, depth = 0) {
    if (depth > 96) throw "Document nesting is too deep"
    local kind = typeof(value)
    if (kind != "table" && kind != "array") return sqgi.json.stringify(value)
    local indent = "", next = ""
    for (local i = 0; i < depth; i++) indent += "  "
    next = indent + "  "
    local lines = []
    if (kind == "table") {
        local keys = []
        foreach (key, _ in value) keys.push(key)
        keys.sort()
        foreach (key in keys) lines.push(next + sqgi.json.stringify(key) + ": " + pretty(value[key], depth + 1))
    } else foreach (item in value) lines.push(next + pretty(item, depth + 1))
    local left = kind == "table" ? "{" : "[", right = kind == "table" ? "}" : "]"
    if (!lines.len()) return left + right
    local result = left + "\n"
    foreach (i, line in lines) result += (i ? ",\n" : "") + line
    return result + "\n" + indent + right
}

function path_label(path) {
    local result = "manifest"
    foreach (part in path) result += typeof(part) == "integer" ? "[" + part + "]" : "." + part
    return result
}

function lookup(value, path) {
    foreach (part in path) {
        if (typeof(value) == "table" && part in value) value = value[part]
        else if (typeof(value) == "array" && typeof(part) == "integer" && part >= 0 && part < value.len()) value = value[part]
        else return { present = false, value = null }
    }
    return { present = true, value = value }
}

function difference(before, after, path = null, result = null) {
    if (path == null) path = []
    if (result == null) result = []
    if (typeof(before) == "table" && typeof(after) == "table") {
        local keys = []
        foreach (key, _ in before) keys.push(key)
        foreach (key, _ in after) if (!(key in before)) keys.push(key)
        keys.sort()
        foreach (key in keys) {
            local child = clone path; child.push(key)
            if (!(key in before)) result.push({ path = child, action = "added", after = copy_value(after[key]) })
            else if (!(key in after)) result.push({ path = child, action = "removed", before = copy_value(before[key]) })
            else difference(before[key], after[key], child, result)
        }
    } else if (pretty(before) != pretty(after))
        result.push({ path = clone path, action = "changed", before = copy_value(before), after = copy_value(after) })
    return result
}

function read_file(path) {
    local data = Gio.File.new_for_path(path).load_contents(null)
    return { text = data[0], etag = data[1] }
}

class Document {
    value = null
    text = ""
    path = null
    dirty = false
    valid = true
    error = null
    saved_text = null
    saved_etag = null
    history = null
    future = null

    constructor(initial = "{}", filename = null) {
        value = {}; history = []; future = []
        if (filename != null) path = GLib.canonicalize_filename(filename, null)
        this.restore(initial)
        if (path != null && Gio.File.new_for_path(path).query_exists(null)) {
            local disk = read_file(path)
            saved_text = disk.text; saved_etag = disk.etag
        }
        this.update_dirty()
    }

    function update_dirty() { dirty = saved_text == null || text != saved_text }

    function restore(draft) {
        text = draft
        try {
            local parsed = sqgi.json.parse(draft)
            if (typeof(parsed) != "table") throw "The manifest must be a JSON object"
            value = parsed; valid = true; error = null
        } catch (e) { valid = false; error = e.tostring() }
        this.update_dirty()
    }

    function edit_json(draft) {
        if (draft == text) return false
        history.push({ text = text, value = copy_value(value) })
        if (history.len() > 128) history.remove(0)
        future.clear()
        this.restore(draft)
        return true
    }

    function undo() {
        if (!history.len()) return false
        future.push({ text = text, value = copy_value(value) })
        local state = history.pop(); value = state.value; this.restore(state.text)
        return true
    }

    function redo() {
        if (!future.len()) return false
        history.push({ text = text, value = copy_value(value) })
        local state = future.pop(); value = state.value; this.restore(state.text)
        return true
    }

    function get(parts) { return copy_value(lookup(value, parts).value) }
    function has(parts) { return lookup(value, parts).present }

    function change(parts, setting, remove_value = false) {
        if (!valid) throw "Fix or revert the invalid JSON before editing fields"
        if (!parts.len()) {
            if (remove_value || typeof(setting) != "table") throw "The manifest must remain an object"
            return this.edit_json(pretty(setting) + "\n")
        }
        local next = copy_value(value), parent = next
        for (local i = 0; i < parts.len() - 1; i++) {
            local key = parts[i]
            if (typeof(parent) == "table" && !(key in parent)) {
                if (remove_value) return false
                if (typeof(parts[i + 1]) == "integer") throw "Create the list before adding an item"
                parent[key] <- {}
            }
            if (typeof(parent) != "table" && typeof(parent) != "array") throw "Cannot edit inside a scalar value"
            parent = parent[key]
        }
        local key = parts.top()
        if (typeof(parent) == "array") {
            if (typeof(key) != "integer" || key < 0 || key > parent.len()) throw "Invalid list index"
            if (remove_value) { if (key >= parent.len()) return false; parent.remove(key) }
            else if (key == parent.len()) parent.push(copy_value(setting))
            else parent[key] = copy_value(setting)
        } else if (typeof(parent) == "table") {
            if (remove_value) { if (!(key in parent)) return false; delete parent[key] }
            else parent[key] <- copy_value(setting)
        } else throw "Cannot edit inside a scalar value"
        if (pretty(next) == pretty(value)) return false
        return this.edit_json(pretty(next) + "\n")
    }

    function set(parts, setting) { return this.change(parts, setting) }
    function unset(parts) { return this.change(parts, null, true) }
    function changes() {
        local before = saved_text == null ? {} : sqgi.json.parse(saved_text)
        return difference(before, value)
    }

    function relocation_preview(filename) {
        if (!valid || path == null) throw "Save a valid document before rebasing it"
        local relocated = Relocation.relocate(value, GLib.path_get_dirname(path), GLib.path_get_dirname(filename))
        return { value = relocated, text = pretty(relocated) + "\n", changes = difference(value, relocated) }
    }

    function save(filename = null, relocation = null) {
        if (!valid) throw "Fix JSON syntax before saving the manifest"
        local destination = filename == null ? path : GLib.canonicalize_filename(filename, null)
        if (destination == null) throw "Choose a manifest filename"
        if (path != null && GLib.path_get_dirname(path) != GLib.path_get_dirname(destination) && relocation != "literal")
            throw "Moving a manifest changes relative paths. Choose an explicit literal copy or save beside the original."
        local file = Gio.File.new_for_path(destination)
        local exists = file.query_exists(null), same = destination == path
        if (same && saved_text != null) {
            if (!exists) throw "The manifest was removed outside the editor; choose Save As or reload"
            local disk = read_file(destination)
            if (disk.text != saved_text || disk.etag != saved_etag)
                throw "The manifest changed outside the editor; reload or save a copy"
            if (text == saved_text) return destination
            file.replace_contents(text, saved_etag, false, Gio.FileCreateFlags.none, null)
        } else {
            if (exists) throw "The destination already exists; open it or choose another filename"
            // The move is exclusive; a concurrently created destination is never overwritten.
            local temp = Gio.File.new_for_path(destination + ".tmp-" + GLib.get_monotonic_time())
            try {
                temp.replace_contents(text, null, false, Gio.FileCreateFlags.private, null)
                temp.move(file, Gio.FileCopyFlags.none, null, null)
            } catch (e) {
                try { temp.delete(null) } catch (_) {}
                throw e
            }
        }
        local disk = read_file(destination)
        path = destination; saved_text = disk.text; saved_etag = disk.etag
        this.update_dirty()
        return path
    }

    function digest() {
        if (saved_text == null) return null
        local hash = GLib.Checksum.new(GLib.ChecksumType.sha256)
        hash.update(saved_text, saved_text.len())
        return hash.get_string()
    }

    function build_revision() {
        if (!valid || dirty || path == null) throw "Save a valid manifest before building"
        local disk = read_file(path)
        if (disk.text != saved_text || disk.etag != saved_etag) throw "The manifest changed outside the editor"
        return { path = path, sha256 = this.digest() }
    }
}

function open_document(path) { return Document(read_file(path).text, path) }

return { Document = Document, open_document = open_document, read_file = read_file,
    pretty = pretty, copy_value = copy_value, lookup = lookup, difference = difference, path_label = path_label }
