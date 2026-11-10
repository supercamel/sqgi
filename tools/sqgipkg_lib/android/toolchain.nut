local C = import("common.nut"), S = import("sdk.nut"), A = import("archive.nut"), GLib = import("GLib")
local Inputs = import("host_inputs.nut")
local Environment = import("environment.nut")
local Wrapper = import("wrapper.nut")
local M = { GRADLE_VERSION = "8.9", GRADLE_SHA256 = "d725d707bfabd4dfdc958c624003b3c80accc03f7037b5122c4b1d0ef15cecab" }
M.host <- function() {
    local selected = Environment.paths()
    if (!C.is_file(selected.java + "/bin/javac")) throw "Android needs a full JDK 17 or 21; run sqgipkg setup --platform android --check"
    return { android_sdk = selected.android_sdk, java = selected.java }
}
M.resolve <- function(request) {
    local tools = M.host(), android = tools.android_sdk
    local arch = Environment.host_arch()
    if (["x86_64", "aarch64"].find(arch) == null) throw "Android packaging requires Linux x86_64 or ARM64"
    tools.readelf <- GLib.find_program_in_path("readelf")
    if (tools.readelf == null) throw "Android packaging needs readelf; install binutils"
    tools.aapt2 <- Environment.aapt2()
    if (arch == "aarch64" && (tools.aapt2 == null || !C.is_file(tools.aapt2)))
        throw "ARM64 Android packaging needs native AAPT2; run sqgipkg setup --platform android --accept-licenses"
    tools.zipalign <- Environment.packaging_tool("zipalign", android)
    tools.ndk <- null
    if (!Wrapper.needs_compiler(request)) return tools
    if (arch != "x86_64") throw "This app needs an Android native compiler. Use prebuilt native packages on ARM64, or build native sources on Linux x86_64."
    local ndk = C.get(request, "ndk", "")
    if (ndk == "") ndk = Environment.paths().ndk
    ndk = C.absolute(ndk)
    if (!C.is_file(ndk + "/source.properties"))
        throw "This app needs NDK " + S.NDK_REVISION + "; run sqgipkg setup --platform android --native-tools --accept-licenses"
    local properties = {}
    foreach (line in split(C.read(ndk + "/source.properties"), "\n")) {
        local equals = line.find("=")
        if (equals != null) properties[strip(line.slice(0, equals))] <- strip(line.slice(equals + 1))
    }
    if (C.get(properties, "Pkg.Revision") != S.NDK_REVISION) throw "Android backend requires pinned NDK " + S.NDK_REVISION
    local readelf = ndk + "/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-readelf"
    if (!C.is_file(readelf)) throw "Android packaging currently requires a Linux x86-64 NDK host"
    tools.ndk = ndk; tools.readelf = readelf
    return tools
}
M.gradle <- function(offline = false) {
    local override = GLib.getenv("GRADLE_HOME")
    if (override != null && override != "") {
        if (!C.is_file(override + "/lib/gradle-core-" + M.GRADLE_VERSION + ".jar")) throw "GRADLE_HOME must identify Gradle " + M.GRADLE_VERSION
        return C.absolute(override) + "/bin/gradle"
    }
    local cache = C.cache(), name = "gradle-" + M.GRADLE_VERSION, root = cache + "/" + name
    return C.locked(cache + "/gradle.lock", function() {
        if (C.is_file(root + "/bin/gradle")) return root + "/bin/gradle"
        local path = cache + "/" + name + "-bin.zip"
        if (!C.is_file(path)) {
            if (offline) throw "Offline Android build requires cached Gradle " + M.GRADLE_VERSION
            C.fetch("https://services.gradle.org/distributions/" + name + "-bin.zip", path, M.GRADLE_SHA256)
        }
        if (C.file_hash(path) != M.GRADLE_SHA256) throw "Gradle archive checksum mismatch"
        local archive = A.Zip(path)
        foreach (entry, unused in archive.entries) {
            local normalized = C.relative(entry)
            if (normalized != name && !C.starts(normalized, name + "/")) throw "Unexpected Gradle archive path"
            if ((unused.mode & 61440) == 40960) throw "Unexpected Gradle archive symlink"
        }
        // The archive is checksum-pinned and its complete path table validated.
        // Extract into a fresh directory and promote only the complete tree.
        C.temporary(function(temporary) {
            C.process(["unzip", "-q", path, "-d", temporary])
            C.chmod(temporary + "/" + name + "/bin/gradle", 493)
            C.remove(root); C.move(temporary + "/" + name, root)
        }, cache)
        return root + "/bin/gradle"
    })
}
M.identity <- function(request) {
    local selected = M.resolve(request), gradle = M.gradle(C.get(request, "offline", false))
    local roots = { jdk = selected.java,
        gradle = GLib.path_get_dirname(GLib.path_get_dirname(gradle)),
        android_platform = selected.android_sdk + "/platforms/android-35",
        android_build_tools = selected.android_sdk + "/build-tools/35.0.0",
        sqgi = GLib.file_read_link("/proc/self/exe"),
        schema_compiler = "/usr/bin/glib-compile-schemas" }
    if (selected.ndk != null) roots.ndk <- selected.ndk
    roots.readelf <- C.realpath(selected.readelf)
    if (selected.aapt2 != null) roots.aapt2 <- Environment.tool_identity_root(selected.aapt2)
    roots.zipalign <- Environment.tool_identity_root(selected.zipalign)
    local here = GLib.path_get_dirname(C.absolute(__FILE__))
    foreach (item in C.children(GLib.path_get_dirname(here)))
        if (!item.directory && C.ends(item.name, ".nut")) roots["frontend/" + item.name] <- item.path
    // Capture the loaded SQGI/GLib/GI runtime as well as the launcher binary.
    foreach (line in split(C.read("/proc/self/maps"), "\n")) {
        local slash = line.find("/")
        if (slash == null) continue
        local path = line.slice(slash), name = GLib.path_get_basename(path)
        local selected_library = false
        foreach (prefix in ["libsqgi.", "libglib-2.0.", "libgobject-2.0.", "libgio-2.0.", "libgirepository-1.0.", "libffi.",
            "libstdc++.", "libgcc_s.", "libc.so", "libm.so"])
            if (C.starts(name, prefix)) selected_library = true
        if (selected_library && C.is_file(path)) roots["host-library/" + name] <- path
    }
    foreach (path in C.walk(here)) {
        local name = path.slice(here.len() + 1)
        if (C.ends(name, ".nut") || C.ends(name, ".c") || C.ends(name, ".h") || name == "fonts.conf" || C.starts(name, "template/"))
            roots["backend/" + name] <- path
    }
    local xml = Environment.xmllint()
    if (xml != null && C.is_file(xml)) roots.xmllint <- xml
    local sources = C.get(request, "runtime_source") != null, custom = false
    foreach (project in C.get(request, "native", [])) if (C.get(project, "android_package", "") == "") {
        sources = true
        if (C.get(project, "build_system") == "custom") custom = true
    }
    if (sources) {
        foreach (name in ["cmake", "ninja", "pkg-config", "meson", "valac", "g-ir-scanner", "python3"])
            if (C.is_file("/usr/bin/" + name)) roots[name] <- "/usr/bin/" + name
        foreach (path in ["/usr/lib/python3/dist-packages/mesonbuild", "/usr/lib/x86_64-linux-gnu/gobject-introspection/giscanner",
            "/usr/lib/python3.12", "/usr/share/cmake-3.28", "/usr/share/vala-0.56"])
            if (C.is_dir(path)) roots[GLib.path_get_basename(path)] <- path
        local rustc = GLib.find_program_in_path("rustc"), cargo = GLib.find_program_in_path("cargo")
        if (custom && rustc != null && cargo != null) {
            // rustup's proxy does not identify the compiler it currently selects.
            roots.rust <- strip(C.process([rustc, "--print", "sysroot"]))
            roots.cargo <- cargo
        }
    }
    return Inputs.identify(roots)
}
return M
