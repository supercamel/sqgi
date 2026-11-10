// The Android application bridge is independent of the application's scripts.
local C = import("common.nut"), GLib = import("GLib"), M = {}
local HERE = GLib.path_get_dirname(C.absolute(__FILE__))
M.sources <- { platform = ["platform.c"], entry = ["native_entry.c", "sqgi_android_entry.h"] }
M.libraries <- { platform = "libsqgi-platform.so", entry = "libsqgi-entry.so" }
M.validate <- function(value) {
    if (typeof(value) != "table" || C.get(value, "schema") != 1 || C.get(value, "package") != "sqgi-android-wrapper" ||
            typeof(C.get(value, "sources")) != "table") throw "Invalid Android application wrapper contract"
    foreach (kind, names in M.sources) foreach (name in names)
        if (!regexp("^[0-9a-f]{64}$").match(C.get(value.sources, name, ""))) throw "Missing Android wrapper source identity: " + name
    return value
}
M.available <- function(metadata, kind) {
    local wrapper = C.get(metadata, "application_wrapper")
    if (wrapper == null) return false
    M.validate(wrapper)
    foreach (name in M.sources[kind]) if (wrapper.sources[name] != C.file_hash(HERE + "/" + name)) return false
    return "usr/lib/" + M.libraries[kind] in metadata.files
}
M.needs_compiler <- function(request) {
    if (C.get(request, "runtime_source") != null || C.get(request, "native_build", false)) return true
    foreach (project in C.get(request, "native", [])) if (C.get(project, "android_package", "") == "") return true
    local root = C.get(request, "sdk")
    if (root != null && root != "") {
        local metadata = sqgi.json.parse(C.read(root + "/sqgi-android-sdk.json"))
        if (!M.available(metadata, "platform")) return true
        if (C.get(C.get(request, "application"), "native_entry") != null && !M.available(metadata, "entry")) return true
    }
    return false
}
return M
