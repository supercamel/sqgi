// Build an explicitly selected SQGI runtime against the immutable Android SDK.
// Only libsqgi and its public development files may replace SDK-owned files.
local C = import("common.nut"), S = import("sdk.nut"), E = import("elf.nut")
local Source = import("source.nut"), Exports = import("exports.nut"), GLib = import("GLib"), M = {}
M.project <- function() {
    return { build_system = "cmake", options = { SQGI_RUNTIME_ONLY = "ON", SQ_ENABLE_JIT = "OFF", SQGI_ENABLE_KERNELS = "OFF" }, targets = ["sqgi"] }
}
M.identity <- function(source) { return Source.source_provenance(M.project(), source) }
M.exports <- function(path, readelf) {
    local result = {}
    foreach (line in split(C.process([readelf, "--dyn-syms", "--wide", path]), "\n")) {
        local fields = split(strip(line), " \t", true)
        if (fields.len() >= 8 && fields[3] == "FUNC" && fields[4] == "GLOBAL" && fields[5] == "DEFAULT" && fields[6] != "UND" &&
            (C.starts(fields[7], "sq_") || C.starts(fields[7], "sqgi_") || C.starts(fields[7], "sqstd_"))) result[fields[7]] <- true
    }
    return result
}
M.allowed <- function(path) {
    return path == "usr/lib/libsqgi.so" || path == "usr/lib/pkgconfig/sqgi.pc" || C.starts(path, "usr/include/sqgi/")
}
M.build <- function(request, sdk_base, work, tools) {
    local selection = C.get(request, "runtime_source")
    if (selection == null) return { sdk = sdk_base, evidence = null }
    local source = C.resolve_path(selection.directory), inputs = M.identity(source)
    if (inputs.sha256 != selection.identity.sha256) throw "SQGI runtime sources changed after input resolution"
    local root = work + "/runtime-sdk", api = request.application.min_sdk, abi = request.abi
    Exports.initialize(sdk_base.root, root)
    return C.temporary(function(directory) {
        local build = directory + "/build", install = directory + "/install", prefix = root + "/usr"
        local env = Source.clean_environment()
        env.PKG_CONFIG_PATH <- ""; env.PKG_CONFIG_LIBDIR <- prefix + "/lib/pkgconfig:" + prefix + "/share/pkgconfig"
        env.PKG_CONFIG_SYSROOT_DIR <- root; env.DESTDIR <- install
        env.SOURCE_DATE_EPOCH <- sdk_base.metadata.source_lock.build.source_date_epoch.tostring()
        local flags = ["-O2", "-fPIC", "-ffile-prefix-map=" + source + "=/usr/src/sqgi",
            "-ffile-prefix-map=" + root + "=/usr/src/android-sdk", "-ffile-prefix-map=" + directory + "=/usr/src/sqgi-build"]
        env.CFLAGS <- Source.quote(flags); env.CXXFLAGS <- Source.quote(flags)
        env.LDFLAGS <- "-Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384"
        local configure = ["cmake", "-S", source, "-B", build, "-G", "Ninja", "-DCMAKE_BUILD_TYPE=Release",
            "-DCMAKE_TOOLCHAIN_FILE=" + tools.ndk + "/build/cmake/android.toolchain.cmake", "-DANDROID_ABI=" + abi,
            "-DANDROID_PLATFORM=android-" + api, "-DANDROID_STL=c++_shared", "-DCMAKE_INSTALL_PREFIX=/usr",
            "-DCMAKE_INSTALL_LIBDIR=lib", "-DCMAKE_SKIP_RPATH=ON", "-DCMAKE_FIND_ROOT_PATH=" + root,
            "-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER", "-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY",
            "-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY", "-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ONLY"]
        foreach (key, value in M.project().options) configure.push("-D" + key + "=" + value)
        Source.run(configure, env)
        local cache = C.read(build + "/CMakeCache.txt")
        foreach (setting in ["SQGI_RUNTIME_ONLY:BOOL=ON", "SQ_ENABLE_JIT:BOOL=OFF", "SQGI_ENABLE_KERNELS:BOOL=OFF"])
            if (cache.find(setting + "\n") == null) throw "Selected SQGI source lacks supported Android runtime configuration: " + setting
        Source.run(["cmake", "--build", build, "--target", "sqgi", "--parallel", "4"], env)
        Source.run(["cmake", "--install", build], env)
        if (M.identity(source).sha256 != inputs.sha256) throw "SQGI runtime sources changed during the build"
        local replacements = {}
        foreach (path in C.walk(install)) {
            local relative = path.slice(install.len() + 1)
            if (C.is_link(path) || !C.is_file(path) || !M.allowed(relative)) throw "Unexpected SQGI runtime install output: " + relative
            replacements[relative] <- path
        }
        foreach (path in ["usr/lib/libsqgi.so", "usr/lib/pkgconfig/sqgi.pc", "usr/include/sqgi/sqgi_vm.h", "usr/include/sqgi/squirrel.h"])
            if (!(path in replacements)) throw "Selected SQGI source did not install its Android runtime interface: " + path
        local library = replacements["usr/lib/libsqgi.so"], elf = E.inspect(library, abi, tools.readelf)
        if (elf.soname != "libsqgi.so") throw "Selected SQGI source does not provide the Android libsqgi.so SONAME"
        local provided = M.exports(library, tools.readelf), required = M.exports(sdk_base.prefix + "/lib/libsqgi.so", tools.readelf)
        if (!required.len()) throw "SDK SQGI runtime has no public C exports"
        foreach (symbol, unused in required) if (!(symbol in provided)) throw "Selected SQGI runtime is incompatible with the SDK C interface: missing " + symbol
        foreach (path, replacement in replacements) {
            // root is a private copy made above; none of these writes touch the
            // shared SDK. Reject directory aliases before replacing owned files.
            if (!C.within(C.resolve_path(GLib.path_get_dirname(root + "/" + path)), root)) throw "Runtime install escapes private SDK: " + path
            C.remove(root + "/" + path); C.copy(replacement, root + "/" + path)
        }
        local evidence = { source = inputs, min_api = api, abi = abi, library = elf, jit = false, kernels = false,
            base_sdk_sha256 = sdk_base.sha256, required_c_exports = C.keys(required), requested_revision = C.get(selection, "revision", "") }
        local metadata = clone sdk_base.metadata, files = {}
        foreach (path, record in Exports.inventory(root + "/usr")) files["usr/" + path] <- record
        metadata.files <- files; metadata.base_sdk_sha256 <- sdk_base.sha256
        metadata.runtime <- { revision = "source:" + inputs.sha256, source = inputs, jit = false, kernels = false, min_api = api }
        metadata.runtime_build <- evidence
        C.atomic_json(root + "/" + S.DESCRIPTOR, metadata)
        local sdk = S.SDK(root, abi, api).validate()
        E.closure(sdk.prefix, abi, ["libsqgi.so"], tools.readelf)
        return { sdk = sdk, evidence = evidence }
    }, work)
}
return M
