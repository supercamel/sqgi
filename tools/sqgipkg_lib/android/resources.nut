// Android manifest declarations and launcher icon, shared by every ABI.
local C = import("common.nut"), GLib = import("GLib")
local HERE = GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null))
local M = {}
M.permissions <- function(values) {
    if (typeof(values) != "array") throw "permissions must be an array"
    local names = {}
    foreach (name in values) {
        if (typeof(name) != "string" || !regexp("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$").match(name))
            throw "Use a fully qualified Android permission name"
        if (name in names) throw "Duplicate Android permission: " + name
        names[name] <- true
    }
    names["android.permission.REORDER_TASKS"] <- true
    return C.keys(names)
}
M.services <- function(sdk) {
    if (sdk == null) return ""
    local declarations = "", classes = {}, processes = {}, initializers = {}, prefix = "usr/share/sqgi-android/services/"
    local source = function(name) {
        if (typeof(name) != "string" || !regexp("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+(\\$[A-Za-z][A-Za-z0-9_]*)?$").match(name))
            throw "Invalid Android component class"
        local outer = split(name, "$", true)[0]
        local java = "usr/share/sqgi-android/java/" + C.concat(split(outer, ".", true), "/") + ".java"
        if (!(java in sdk.metadata.files)) throw "Android component lacks inventoried Java source: " + name
    }
    foreach (path in C.keys(sdk.metadata.files)) if (C.starts(path, prefix)) {
        if (!C.ends(path, ".json")) throw "Invalid Android service metadata filename"
        local descriptor = sqgi.json.parse(C.read(sdk.root + "/" + path))
        if (C.get(descriptor, "schema") != 1 || typeof(C.get(descriptor, "services")) != "array")
            throw "Invalid Android service metadata"
        foreach (service in descriptor.services) {
            local name = C.get(service, "class", ""), process = C.get(service, "process")
            source(name)
            if (typeof(process) != "string" || (process != "" && !regexp("^:sqgi_[a-z][a-z0-9_]*$").match(process)))
                throw "Invalid Android private service class or process"
            if (name in classes || (process != "" && process in processes)) throw "Duplicate Android service class or process"
            classes[name] <- true; if (process != "") processes[process] <- true
            declarations += "        <service android:name=\"" + name + "\"" + (process == "" ? "" : " android:process=\"" + process + "\"") + " android:exported=\"false\" />\n"
        }
        local startup = C.get(descriptor, "initializers", [])
        if (typeof(startup) != "array") throw "Invalid Android initializers"
        foreach (name in startup) {
            source(name)
            if (name in initializers) throw "Duplicate Android initializer: " + name
            initializers[name] <- true
        }
    }
    foreach (name in C.keys(initializers))
        declarations += "        <meta-data android:name=\"org.sqgi.android.initializer." + name + "\" android:value=\"" + name + "\" />\n"
    return declarations
}
M.prepare <- function(destination, config, icon = "", sdk = null) {
    C.mkdir(destination)
    local declarations = ""
    foreach (name in M.permissions(C.get(config, "permissions", [])))
        declarations += "    <uses-permission android:name=\"" + GLib.markup_escape_text(name, -1) + "\" />\n"
    local icon_attribute = ""
    if (icon != "") {
        local expected = C.get(config, "icon_sha256")
        if (expected == null || C.file_hash(icon) != expected) throw "Android icon changed after input resolution"
        local Pixbuf = import("GdkPixbuf", "2.0")
        local bitmap = Pixbuf.Pixbuf.new_from_file_at_scale(icon, 512, 512, true)
        local path = destination + "/res/drawable-nodpi/sqgi_app_icon.png"
        C.mkdir(GLib.path_get_dirname(path)); bitmap.savev(path, "png", [], [])
        if (C.file_hash(icon) != expected) throw "Android icon changed during conversion"
        icon_attribute = " android:icon=\"@drawable/sqgi_app_icon\""
    } else if (C.get(config, "icon_sha256") != null) throw "Android icon input is missing"
    local manifest = C.read(HERE + "/template/app/src/main/AndroidManifest.xml")
    foreach (marker, value in { ["@SQGI_PERMISSIONS@"] = declarations, ["@SQGI_ICON@"] = icon_attribute, ["@SQGI_SERVICES@"] = M.services(sdk) }) {
        local offset = manifest.find(marker)
        if (offset == null || manifest.find(marker, offset + marker.len()) != null) throw "Android manifest template marker is missing or repeated"
        manifest = manifest.slice(0, offset) + value + manifest.slice(offset + marker.len())
    }
    C.write(destination + "/AndroidManifest.xml", manifest)
}
return M
