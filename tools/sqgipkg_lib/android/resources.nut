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
M.prepare <- function(destination, config, icon = "") {
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
    foreach (marker, value in { ["@SQGI_PERMISSIONS@"] = declarations, ["@SQGI_ICON@"] = icon_attribute }) {
        local offset = manifest.find(marker)
        if (offset == null || manifest.find(marker, offset + marker.len()) != null) throw "Android manifest template marker is missing or repeated"
        manifest = manifest.slice(0, offset) + value + manifest.slice(offset + marker.len())
    }
    C.write(destination + "/AndroidManifest.xml", manifest)
}
return M
