// Android host primitives implemented with SQGI, GLib and GIO.
local GLib = import("GLib"), Gio = import("Gio")
local Host = import("../provenance.nut")
local host = Host.SqgiPkgProvenance()
local M = {}
local progress_sink = null, progress_time = 0
M.progress <- function(message, periodic = false) {
    if (progress_sink == null) return
    local now = GLib.get_monotonic_time()
    if (periodic && now - progress_time < 5000000) return
    progress_time = now
    progress_sink(message)
}
M.with_progress <- function(sink, callback) {
    local previous = progress_sink, previous_time = progress_time
    progress_sink = sink; progress_time = 0
    local result = null, caught = null
    try { result = callback() } catch (failure) { caught = failure }
    progress_sink = previous; progress_time = previous_time
    if (caught != null) throw caught
    return result
}
M.get <- function(value, key, fallback = null) { return typeof(value) == "table" && key in value ? value[key] : fallback }
// Unsigned UTF-8 order matches Unicode code-point order in canonical JSON.
// Squirrel's default string comparator can place high bytes before ASCII.
M.sort_strings <- function(values) {
    values.sort(function(a, b) {
        local length = a.len() < b.len() ? a.len() : b.len()
        for (local i = 0; i < length; i++) {
            local left = a[i] & 255, right = b[i] & 255
            if (left != right) return left < right ? -1 : 1
        }
        return a.len() - b.len()
    })
    return values
}
M.keys <- function(value) { local out = []; foreach (key, unused in value) out.push(key); return M.sort_strings(out) }
M.join <- function(parts) { return GLib.build_filenamev(parts) }
M.absolute <- function(path) { return GLib.canonicalize_filename(path, null) }
M.exists <- function(path) { return Gio.File.new_for_path(path).query_exists(null) }
M.is_dir <- function(path) { return Gio.File.new_for_path(path).query_file_type(Gio.FileQueryInfoFlags.none, null) == Gio.FileType.directory }
M.is_file <- function(path) { return Gio.File.new_for_path(path).query_file_type(Gio.FileQueryInfoFlags.none, null) == Gio.FileType.regular }
M.is_link <- function(path) { return Gio.File.new_for_path(path).query_file_type(Gio.FileQueryInfoFlags.nofollow_symlinks, null) == Gio.FileType.symbolic_link }
M.mkdir <- function(path) { if (GLib.mkdir_with_parents(path, 493) != 0) throw "Cannot create directory: " + path }
M.read <- function(path) { return Gio.File.new_for_path(path).load_contents(null)[0] }
M.write <- function(path, data) { if (!GLib.file_set_contents(path, data, data.len())) throw "Cannot write file: " + path }
M.digest <- function(data) { return GLib.compute_checksum_for_data(GLib.ChecksumType.sha256, data) }
M.file_hash <- function(path) { return host.file_sha256(path) }
M.children <- function(path) { return host.children(path) }
M.remove <- function(path) { host.remove_tree(path) }
M.chmod <- function(path, mode) { Gio.File.new_for_path(path).set_attribute_uint32("unix::mode", mode, Gio.FileQueryInfoFlags.nofollow_symlinks, null) }
M.move <- function(source, destination) { Gio.File.new_for_path(source).move(Gio.File.new_for_path(destination), Gio.FileCopyFlags.overwrite, null, null) }
M.concat <- function(values, separator = ",") { local out = ""; foreach (i, value in values) out += (i ? separator : "") + value; return out }
M.starts <- function(value, prefix) { return value.len() >= prefix.len() && value.slice(0, prefix.len()) == prefix }
M.ends <- function(value, suffix) { return value.len() >= suffix.len() && value.slice(value.len() - suffix.len()) == suffix }
M.cache <- function() { return GLib.get_user_cache_dir() + "/sqgipkg/android" }
M.process <- function(argv, env = null, capture = true, cwd = null) {
    local result = host.process(argv, cwd, env, capture)
    if (result.status) throw argv[0] + " failed (exit " + result.status + "): " + result.stderr
    return result.stdout
}
M.process_bytes <- function(argv) {
    local child = Gio.Subprocess.new(argv, Gio.SubprocessFlags.stdout_pipe + Gio.SubprocessFlags.stderr_pipe)
    local output = child.communicate(null, null)
    if (!child.get_successful()) throw argv[0] + " failed: " + output[1].get_data()
    return output[0].get_data()
}
M.realpath <- function(path) { return strip(M.process(["realpath", "-e", "--", path])) }
M.resolve_path <- function(path) { return strip(M.process(["realpath", "-m", "--", path])) }
M.relative <- function(value) {
    if (typeof(value) != "string" || value == "" || value.find("\\") != null || value[0] == '/')
        throw "Invalid relative Android payload path"
    for (local i = 0; i < value.len(); i++) if (value[i] == 0) throw "Invalid relative Android payload path"
    local parts = []
    foreach (part in split(value, "/")) {
        if (part == "..") throw "Android payload path escapes its root: " + value
        if (part != "." && part != "") parts.push(part)
    }
    if (!parts.len()) throw "Invalid relative Android payload path"
    return parts.reduce(function(a, b) { return a + "/" + b })
}
M.within <- function(path, root) { return path == root || (path.len() > root.len() && path.slice(0, root.len() + 1) == root + "/") }
M.walk <- function(root) {
    local out = []
    foreach (item in host.children(root)) {
        if (item.directory && !item.symlink) foreach (child in M.walk(item.path)) out.push(child)
        else out.push(item.path)
    }
    return M.sort_strings(out)
}
M.copy <- function(source, destination) {
    M.mkdir(GLib.path_get_dirname(destination))
    Gio.File.new_for_path(source).copy(Gio.File.new_for_path(destination), Gio.FileCopyFlags.overwrite, null, null)
}
M.copy_tree <- function(source, destination) {
    M.mkdir(destination)
    foreach (path in M.walk(source)) {
        if (M.is_link(path)) throw "Unexpected symlink in copied Android tree: " + path
        M.copy(path, destination + "/" + path.slice(source.len() + 1))
    }
}
M.temporary <- function(callback, parent = null) {
    local root = parent == null ? GLib.dir_make_tmp("sqgipkg-android-XXXXXX") : parent + "/.sqgipkg-" + GLib.uuid_string_random()
    if (parent != null && GLib.mkdir_with_parents(root, 448) != 0) throw "Cannot create private staging directory"
    local result = null, error = null
    try { result = callback(root) } catch (caught) { error = caught }
    M.remove(root)
    if (error != null) throw error
    return result
}
M.locked <- function(path, callback) {
    M.mkdir(GLib.path_get_dirname(path))
    // A child owns flock until our pipe closes, including when SQGI exits.
    // Only this fixed program is shell text; paths always remain argv entries.
    local launcher = Gio.SubprocessLauncher.new(Gio.SubprocessFlags.stdin_pipe + Gio.SubprocessFlags.stdout_pipe)
    local child = launcher.spawnv(["flock", "-x", path, "/bin/sh", "-c", "printf 'locked\\n'; cat >/dev/null"])
    local input = Gio.DataInputStream.new(child.get_stdout_pipe()), result = null, error = null
    try {
        if (input.read_line_utf8(null) != "locked") throw "Cannot lock Android build/cache: " + path
        result = callback()
    } catch (caught) { error = caught }
    child.get_stdin_pipe().close(null); child.wait(null); input.close(null)
    if (error != null) throw error
    if (!child.get_successful()) throw "Android build/cache lock failed: " + path
    return result
}
M.fetch <- function(url, destination, checksum = null, timeout_seconds = 120) {
    if (!regexp("^(https?|file)://").search(url)) throw "Unsupported download URL"
    M.mkdir(GLib.path_get_dirname(destination))
    local temporary = destination + "." + GLib.uuid_string_random() + ".download", error = null
    try {
        M.process(["curl", "--fail", "--location", "--silent", "--show-error", "--connect-timeout", "15", "--max-time", timeout_seconds.tostring(),
            "--proto", "=http,https,file", "--proto-redir", "=http,https", "--output", temporary, url])
        if (checksum != null && M.file_hash(temporary) != checksum) throw "Downloaded Android input checksum mismatch"
        M.move(temporary, destination)
    } catch (caught) { error = caught }
    M.remove(temporary)
    if (error != null) throw error
}
// Stable, UTF-8 JSON preserves the original package/snapshot wire format.
M.json_value <- function(value, level = 0) {
    if (typeof(value) != "table" && typeof(value) != "array") return sqgi.json.stringify(value)
    local object = typeof(value) == "table", parts = [], prefix = ""
    for (local i = 0; i < level; i++) prefix += "  "
    if (object) foreach (key in M.keys(value))
        parts.push(prefix + "  " + sqgi.json.stringify(key) + ": " + M.json_value(value[key], level + 1))
    else foreach (item in value) parts.push(prefix + "  " + M.json_value(item, level + 1))
    local body = ""
    foreach (part in parts) body += (body == "" ? "" : ",\n") + part
    return (object ? "{" : "[") + (parts.len() ? "\n" + body + "\n" + prefix : "") + (object ? "}" : "]")
}
M.encoded <- function(value) { return M.json_value(value) + "\n" }
M.equal <- function(a, b) { return M.encoded(a) == M.encoded(b) }
M.atomic_bytes <- function(path, data) {
    M.mkdir(GLib.path_get_dirname(path))
    local temporary = path + "." + GLib.uuid_string_random() + ".tmp"
    M.write(temporary, data)
    Gio.File.new_for_path(temporary).move(Gio.File.new_for_path(path), Gio.FileCopyFlags.overwrite, null, null)
}
M.atomic_json <- function(path, value) { M.atomic_bytes(path, M.encoded(value)) }
M.uint_le <- function(data, offset, size) {
    if (offset < 0 || size < 1 || size > 8 || offset > data.len() - size) throw "Truncated binary header"
    local value = 0
    for (local i = 0; i < size; i++) value = value | ((data[offset + i] & 255) << (i * 8))
    if (value < 0) throw "Binary field exceeds supported signed range"
    return value
}
return M
