local C = import("common.nut"), E = import("elf.nut"), S = import("sdk.nut"), Source = import("source.nut"), GLib = import("GLib")
local M = { directory = GLib.path_get_dirname(C.absolute(__FILE__)) }
local Wrapper = import("wrapper.nut")
M.validate <- function(entry) {
    if (typeof(entry) != "table") throw "entry.android must be a native entry object"
    foreach (key in ["project", "library", "symbol"]) if (typeof(C.get(entry, key)) != "string" || entry[key] == "") throw "entry.android requires " + key
    if (!regexp("^lib[A-Za-z0-9_.+\\-]+[.]so$").match(entry.library)) throw "entry.android.library must be an unversioned library SONAME"
    foreach (key in ["symbol", "shutdown"]) if (key in entry && (typeof(entry[key]) != "string" || !regexp("^[A-Za-z_][A-Za-z0-9_]*$").match(entry[key])))
        throw "entry.android." + key + " must be an exported C symbol"
    foreach (key, unused in entry) if (["project", "library", "symbol", "shutdown", "abi_version"].find(key) == null) throw "Unknown Android native entry field: " + key
    if (C.get(entry, "abi_version", 1) != 1) throw "Unsupported Android native entry ABI"
    if (["libsqgi-platform.so", "libsqgi-entry.so", "libsqgi-gtk.so", "libsqgi.so"].find(entry.library) != null || E.SYSTEM_LIBRARIES.find(entry.library) != null)
        throw "Native entry must select an application library"
}
M.symbols <- function(path, entry, readelf) {
    local wanted = [entry.symbol], exported = {}
    if ("shutdown" in entry) wanted.push(entry.shutdown)
    foreach (line in split(C.process([readelf, "--dyn-syms", "--wide", path]), "\n")) {
        local fields = split(strip(line), " \t", true)
        if (fields.len() >= 8 && fields[3] == "FUNC" && fields[4] == "GLOBAL" && fields[5] == "DEFAULT" && fields[6] != "UND") exported[fields[7]] <- true
    }
    foreach (name in wanted) if (!(name in exported)) throw "Android native entry library has no exported C function: " + name
}
M.owner <- function(entry, projects) {
    local found = null
    foreach (project in projects) if (project.name == entry.project && project.libraries.find(entry.library) != null) found = project
    if (found == null) throw "Android entry library must be provided by its declared native recipe"
    if (C.get(C.get(C.get(found, "source"), "recipe"), "android_entry_header") != C.file_hash(M.directory + "/sqgi_android_entry.h"))
        throw "Native entry module lacks the current interface identity; rebuild its source/package with this sqgipkg"
    return found
}
M.prepare <- function(request, sdk, work, tools) {
    local entry = request.application.native_entry; M.validate(entry)
    M.owner(entry, request.native_evidence.projects)
    M.symbols(sdk.prefix + "/lib/" + entry.library, entry, tools.readelf)
    if (Wrapper.available(sdk.metadata, "entry")) {
        local path = sdk.prefix + "/lib/libsqgi-entry.so"
        return { path = path, record = E.inspect(path, request.abi, tools.readelf) }
    }
    local archive = sdk.prefix + "/lib/libsqgi-gtk-glue.a"
    if (!C.is_file(archive)) throw "Native entry requires the Android development SDK's GTK glue archive"
    local env = Source.clean_environment()
    env.PKG_CONFIG_SYSROOT_DIR <- sdk.root; env.PKG_CONFIG_PATH <- ""
    env.PKG_CONFIG_LIBDIR <- sdk.prefix + "/lib/pkgconfig:" + sdk.prefix + "/share/pkgconfig"
    local flags = strip(C.process(["/usr/bin/pkg-config", "--cflags", "--libs", "gtk4", "gobject-introspection-1.0"], env))
    local compiler = tools.ndk + "/toolchains/llvm/prebuilt/linux-x86_64/bin/" + S.TARGETS[request.abi] + request.application.min_sdk + "-clang"
    local destination = work + "/native-entry/libsqgi-entry.so"; C.mkdir(GLib.path_get_dirname(destination))
    local args = [compiler, "-shared", "-fPIC", "-O2", "-Wl,--no-undefined", "-Wl,-soname,libsqgi-entry.so",
        "-Wl,-z,max-page-size=16384", "-Wl,-z,common-page-size=16384", M.directory + "/native_entry.c",
        "-Wl,--whole-archive", archive, "-Wl,--no-whole-archive", "-o", destination]
    args.extend(GLib.shell_parse_argv(flags)); args.extend(["-llog", "-landroid", "-ldl"])
    C.process(args, env, false)
    return { path = destination, record = E.inspect(destination, request.abi, tools.readelf) }
}
return M
