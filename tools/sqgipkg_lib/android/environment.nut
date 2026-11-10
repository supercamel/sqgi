// Shared host discovery; setup preferences never depend on a producer checkout.
local C = import("common.nut"), GLib = import("GLib")
local M = {}
local P = import("provision.nut")
M.host_arch <- function() {
    local host = split(strip(C.process(["uname", "-sm"])), " ")
    return host.len() == 2 && host[0] == "Linux" ? host[1] : "unsupported"
}
M.native_tool <- function(name) {
    local override = GLib.getenv("SQGI_ANDROID_" + name.toupper())
    if (override != null && override != "") {
        if (!C.is_file(override)) throw "SQGI_ANDROID_" + name.toupper() + " must identify an executable file"
        return C.absolute(override)
    }
    if (M.host_arch() != "aarch64") return null
    local input = C.get(P.lock(), "arm64_tools")
    return input != null && P.ready(input) ? P.root() + "/tools/" + input.directory + "/bin/" + name : null
}
M.aapt2 <- function() { return M.native_tool("aapt2") }
M.packaging_tool <- function(name, android) {
    local path = M.native_tool(name)
    if (path != null && C.is_file(path)) return path
    if (M.host_arch() == "aarch64") throw "ARM64 Android packaging needs native " + name + "; run sqgipkg setup --platform android --accept-licenses"
    return android + "/build-tools/35.0.0/" + name
}
M.tool_identity_root <- function(path) {
    local input = C.get(P.lock(), "arm64_tools")
    if (input != null) {
        local root = P.root() + "/tools/" + input.directory
        if (C.within(path, root)) return root
    }
    return C.realpath(path)
}
M.adb <- function() {
    local override = GLib.getenv("ADB")
    if (override != null && override != "") return C.absolute(override)
    if (M.host_arch() == "aarch64") {
        return GLib.find_program_in_path("adb")
    }
    local path = M.paths().android_sdk + "/platform-tools/adb"
    return C.is_file(path) ? path : GLib.find_program_in_path("adb")
}
M.config_path <- function() { return GLib.get_user_config_dir() + "/sqgipkg/android.json" }
M.saved <- function() {
    if (!C.exists(M.config_path())) return {}
    local value = sqgi.json.parse(C.read(M.config_path()))
    if (C.get(value, "schema") != 1) throw "Unsupported Android setup configuration: " + M.config_path()
    foreach (key in ["android_sdk", "java", "ndk"]) if (key in value &&
        (typeof(value[key]) != "string" || !GLib.path_is_absolute(value[key]))) throw "Invalid Android setup path: " + key
    return value
}
M.choose <- function(names, saved, key, fallback) {
    foreach (name in names) { local value = GLib.getenv(name); if (value != null && value != "") return C.absolute(value) }
    return C.get(saved, key, fallback)
}
M.paths <- function(overrides = null) {
    local saved = M.saved(), java = "/usr/lib/jvm/java-21-openjdk-amd64"
    if (!C.is_file(java + "/bin/javac")) {
        local compiler = GLib.find_program_in_path("javac")
        if (compiler != null) java = GLib.path_get_dirname(GLib.path_get_dirname(C.realpath(compiler)))
    }
    local result = { android_sdk = M.choose(["ANDROID_SDK_ROOT", "ANDROID_HOME"], saved, "android_sdk", GLib.get_home_dir() + "/Android/Sdk"),
        java = M.choose(["JAVA_HOME"], saved, "java", java) }
    if (overrides != null) foreach (key in ["android_sdk", "java"]) if (C.get(overrides, key, "") != "") result[key] = C.absolute(overrides[key])
    result.ndk <- M.choose(["ANDROID_NDK_HOME"], saved, "ndk", result.android_sdk + "/ndk/28.2.13676358")
    if (GLib.getenv("ANDROID_NDK_HOME") == null && result.android_sdk != C.get(saved, "android_sdk", result.android_sdk))
        result.ndk = result.android_sdk + "/ndk/28.2.13676358"
    if (overrides != null && C.get(overrides, "ndk", "") != "") result.ndk = C.absolute(overrides.ndk)
    // Selecting a different SDK must not silently reuse an old saved NDK.
    else if (overrides != null && C.get(overrides, "android_sdk", "") != "" && GLib.getenv("ANDROID_NDK_HOME") == null)
        result.ndk = result.android_sdk + "/ndk/28.2.13676358"
    return result
}
M.properties <- function(path) {
    local out = {}
    if (C.is_file(path)) foreach (line in split(C.read(path), "\n")) {
        local at = line.find("="); if (at != null) out[strip(line.slice(0, at))] <- strip(line.slice(at + 1))
    }
    return out
}
M.save <- function(paths) {
    local value = clone paths; value.schema <- 1
    C.atomic_json(M.config_path(), value)
}
M.xmllint <- function() {
    local path = GLib.getenv("SQGI_ANDROID_XMLLINT")
    if (path != null && path != "") return C.absolute(path)
    if (C.is_file("/usr/bin/xmllint")) return "/usr/bin/xmllint"
    return GLib.find_program_in_path("xmllint")
}
return M
