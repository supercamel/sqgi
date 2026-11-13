// Legacy Android project conversion. No source edits, builds or dependency fetches.
local C = import("common.nut"), GLib = import("GLib"), Gio = import("Gio"), M = {}
M.create_file <- function(path, text) {
    local file = Gio.File.new_for_path(path), temporary = Gio.File.new_for_path(path + ".tmp-" + GLib.uuid_string_random())
    local stream = temporary.create(Gio.FileCreateFlags.none, null)
    try {
        stream.write_all(text, null); stream.close(null)
        temporary.move(file, Gio.FileCopyFlags.none, null, null)
    } catch (error) { try { stream.close(null) } catch (_) {}; try { temporary.delete(null) } catch (_) {}; throw error }
}
M.legacy <- function(path) {
    path = C.absolute(path)
    local config = sqgi.json.parse(C.read(path)), root = GLib.path_get_dirname(path)
    if (typeof(config) != "table" || C.get(config, "schema") != 1 || typeof(config.schema) != "integer") throw "Legacy sqgi.json requires schema: 1"
    foreach (key, unused in config) if (["schema", "application_id", "name", "version_code", "version_name", "source_dir", "entry", "namespaces"].find(key) == null)
        throw "Unknown legacy field: " + key + "; migration cannot discard it"
    local id = C.get(config, "application_id", "")
    if (typeof(id) != "string" || !regexp("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$").match(id)) throw "Invalid legacy application_id"
    foreach (pair in [["name", ""], ["version_name", "0.1.0"]]) {
        local value = C.get(config, pair[0], pair[1])
        if (typeof(value) != "string" || strip(value) == "") throw "Legacy " + pair[0] + " must be a nonempty string"
        foreach (ch in value) if (ch < 32 && ch >= 0) throw "Legacy " + pair[0] + " must be single-line"
        config[pair[0]] <- value
    }
    local code = C.get(config, "version_code", 1)
    if (typeof(code) != "integer" || code < 1 || code > 2100000000) throw "Invalid legacy version_code"
    local source_dir = C.get(config, "source_dir", "src")
    source_dir = source_dir == "." ? "." : C.relative(source_dir)
    local entry = C.relative(C.get(config, "entry", "main.nut")), source = GLib.canonicalize_filename(source_dir, root)
    if (!C.is_dir(source) || C.realpath(source) != source) throw "Legacy source_dir must exist without symlinks"
    local namespaces = C.get(config, "namespaces", ["Gtk-4.0"])
    if (typeof(namespaces) != "array" || !namespaces.len()) throw "Legacy namespaces must be a nonempty array"
    local unique = {}
    foreach (name in namespaces) {
        if (typeof(name) != "string" || !regexp("^[A-Za-z_][A-Za-z0-9_]*-[0-9]+(\\.[0-9]+)*$").match(name)) throw "Invalid legacy GI namespace"
        unique[name] <- true
    }
    local files = [], inventory = {}
    foreach (file in C.walk(source)) {
        local relative = file.slice(source.len() + 1), ignored = false
        foreach (part in split(relative, "/")) if (part == ".git" || part == "__pycache__") ignored = true
        if (ignored || file == path) continue
        if (C.is_link(file) || !C.is_file(file)) throw "Legacy sources must be regular files without symlinks: " + relative
        inventory[relative] <- C.file_hash(file); files.push(relative)
    }
    if (!(entry in inventory)) throw "Legacy entry script is missing: " + entry
    local manifest = { schema_version = 2, name = config.name, app_id = id, target = "android-apk", compile_scripts = false,
        entry = { type = "sqgi", script = source_dir == "." ? entry : source_dir + "/" + entry, source_root = source_dir },
        platforms = { android = { architectures = ["arm64-v8a", "x86_64"], format = "apk", sdk = "noble-android-r7", min_sdk = 31,
            version_code = code, version_name = config.version_name, namespaces = C.keys(unique) } } }
    if ("Gtk-4.0" in unique) manifest.features <- ["gtk4"]
    local common_files = [], windows_files = []
    if (source_dir != ".") {
        manifest.script_dirs <- [source_dir]
        local exclude = ["**/.git/**", "**/__pycache__/**"]
        local legacy_relative = Gio.File.new_for_path(source).get_relative_path(Gio.File.new_for_path(path))
        if (legacy_relative != null) exclude.push(legacy_relative)
        common_files.push({ from = source_dir, to = "usr/share/sqgi/app", exclude = exclude })
        windows_files.push({ from = source_dir, to = "share/sqgi/app", exclude = clone exclude })
    } else {
        // A source tree covering the project root must not consume future build
        // products or the new manifest. Inventory the existing files explicitly.
        foreach (file in files) {
            common_files.push({ from = file, to = "usr/share/sqgi/app/" + GLib.path_get_dirname(file) })
            windows_files.push({ from = file, to = "share/sqgi/app/" + GLib.path_get_dirname(file) })
        }
    }
    manifest.files <- common_files; manifest.windows <- { files = windows_files }
    return { manifest = manifest, inventory = inventory, source = source, legacy = path }
}
M.migrate <- function(source, destination) {
    source = C.absolute(source); destination = C.absolute(destination)
    if (GLib.path_get_dirname(source) != GLib.path_get_dirname(destination)) throw "Migration writes beside sqgi.json; choose a manifest filename in that directory"
    if (C.exists(destination) || C.is_link(destination)) throw "Destination already exists: " + destination + "; choose an explicit --manifest filename"
    local result = M.legacy(source)
    M.create_file(destination, C.encoded(result.manifest))
    return { source = source, destination = destination, files = result.inventory.len(), source_root = result.source }
}
return M
