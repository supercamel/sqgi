// C-DOC-04: conservative path relocation. Opaque hooks/unknown fields require
// explicit literal-copy consent because their path semantics cannot be known.
local GLib = import("GLib")
local Gio = import("Gio")
local module_dir = GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null))
local schema_file = GLib.build_filenamev([module_dir, "..", "..", "sqgipkg.schema.json"])
local schema = sqgi.json.parse(Gio.File.new_for_path(schema_file).load_contents(null)[0])
local path_keys = ["script", "script_dirs", "scripts", "build_dir", "output", "desktop_icon", "icon", "appimagetool_cache",
    "resources", "libraries", "typelibs", "gstreamer_plugins", "gsettings_schemas", "gtk_data", "gio_modules", "gdk_pixbuf_loaders",
    "library_dirs", "sysroot", "package_cache", "cache", "cache_dir", "deb_package_cache", "deb_sysroot_cache", "sysroot_cache",
    "msys2_root", "cmake_toolchain", "meson_cross_file", "entry_linux", "license", "header_image", "welcome_image", "welcome_finish_image"]
function relocate(value, old_dir, new_dir) {
    local result = sqgi.json.parse(sqgi.json.stringify(value))
    local rebase = function(path) {
        if (typeof(path) != "string" || path == "" || GLib.path_is_absolute(path)) return path
        local cut = path.find("="), suffix = cut == null ? "" : path.slice(cut)
        local source = cut == null ? path : path.slice(0, cut)
        local absolute = GLib.canonicalize_filename(source, old_dir)
        local relative = Gio.File.new_for_path(new_dir).get_relative_path(Gio.File.new_for_path(absolute))
        return (relative == null ? absolute : relative) + suffix
    }
    local rebase_many = function(v) {
        if (typeof(v) != "array") return rebase(v)
        local out = []; foreach (item in v) out.push(rebase(item)); return out
    }
    local walk = null
    walk = function(object, def, native_local = false) {
        if (typeof(object) != "table") return
        local props = schema["$defs"][def].properties
        foreach (key, item in object) {
            if (!(key in props)) throw "Cannot rebase unknown field " + def + "." + key + "; choose a literal copy explicitly"
            if ((key == "build" || key == "install") && item != null) throw "Cannot rebase opaque build/install commands; choose a literal copy explicitly"
            if (item == null) continue
            if ((key == "repo" || key == "git") && typeof(item) == "string" && item != "" &&
                !GLib.path_is_absolute(item) && item.find(":") == null)
                throw "Cannot automatically rebase a relative repository reference; choose a literal copy explicitly"
            if (key == "options" && typeof(item) == "table" && item.len())
                throw "Native build option paths are opaque; choose a literal copy explicitly"
            if (!native_local && (key == "appimagetool" || key == "nsis") && typeof(item) == "string" &&
                (item.find("/") != null || item.find("\\") != null)) { object[key] = rebase(item); continue }
            if (["includes", "scripts", "resources", "libraries", "typelibs"].find(key) != null) {
                local items = typeof(item) == "array" ? item : [item]
                foreach (entry in items) if (typeof(entry) != "string")
                    throw "Cannot rebase a non-string inclusion variant automatically; choose a literal copy explicitly"
            }
            if ((key == "native" || key == "native_projects" || key == "native_dependencies" || key == "build_dependencies") && typeof(item) == "array") {
                foreach (project in item) {
                    if (!native_local) project.dir <- rebase("dir" in project ? project.dir : ".")
                    walk(project, "native_projects", true)
                }
            } else if (key == "files") {
                local list = typeof(item) == "array" ? item : [item]
                foreach (i, rule in list) {
                    if (typeof(rule) == "string") { if (!native_local) list[i] = rebase(rule) }
                    else walk(rule, "files", native_local)
                }
                object[key] = typeof(item) == "array" ? list : list[0]
            } else if (key == "fonts") {
                local list = typeof(item) == "array" ? item : [item]
                foreach (i, font in list) { if (typeof(font) == "table") walk(font, "fonts", native_local); else if (!native_local) list[i] = rebase(font) }
                object[key] = typeof(item) == "array" ? list : list[0]
            } else if (key == "arches" || key == "linux_arches") {
                foreach (arch in item) if (typeof(arch) == "table") walk(arch, "arches", native_local)
            } else if (key == "entry") {
                if (typeof(item) == "string") object[key] = rebase(item)
                else walk(item, "entry", native_local)
            } else if (key == "sqgi_source") {
                if (typeof(item) == "string") object[key] = rebase(item)
                else walk(item, "sqgi_source", native_local)
            } else if (key == "platforms") walk(item, "platforms", native_local)
            else if (def == "platforms") walk(item, "platform_" + key, native_local)
            else if (typeof(item) == "table" && (key == "linux" || key == "windows" || key == "runtime" || key == "deb" || key == "nsis_options" || key == "gi")) walk(item, key, native_local)
            else if (!native_local && (path_keys.find(key) != null ||
                (def == "entry" && ["path", "linux", "windows"].find(key) != null) ||
                (def == "sqgi_source" && ["dir", "path"].find(key) != null) ||
                (def == "files" && ["path", "src", "from", "dir"].find(key) != null) ||
                (def == "fonts" && key == "path") || (def == "runtime" && key == "source") || key == "includes")) {
                // Destination-only fields inside file rules are not host paths.
                if (!(def == "files" && key == "includes")) object[key] = rebase_many(item)
            }
        }
    }
    walk(result, "manifest")
    return result
}
return { relocate = relocate }
