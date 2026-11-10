// Meson/CMake and portable native hooks against a private Android SDK.
local C = import("common.nut"), S = import("sdk.nut"), E = import("elf.nut"), Exports = import("exports.nut")
local GLib = import("GLib"), Environment = import("environment.nut")
local HERE = GLib.path_get_dirname(C.absolute(__FILE__)), M = {}
M.quote <- function(values) { local result = []; foreach (value in values) result.push(GLib.shell_quote(value.tostring())); return C.concat(result, " ") }
M.cmake_flags <- function(values) {
    // CMake strips a quote pair enclosing an entire -D value. Keep a plain
    // leading flag and quote only arguments which need shell quoting.
    local result = ["-fPIC"]
    foreach (value in values) result.push(regexp("^[A-Za-z0-9_/.,=:+@%\\-]+$").match(value) ? value : GLib.shell_quote(value))
    return C.concat(result, " ")
}
M.meson_value <- function(value) {
    if (typeof(value) == "array") { local items = []; foreach (item in value) items.push(M.meson_value(item)); return "[" + C.concat(items, ", ") + "]" }
    if (typeof(value) != "string") throw "Expected a string or array in the Android Meson cross file"
    local result = "'"
    for (local i = 0; i < value.len(); i++) {
        local byte = value[i]
        if (byte == '\n') result += "\\n"
        else if (byte == '\r') result += "\\r"
        else if (byte == '\t') result += "\\t"
        else { if (byte == '\\' || byte == '\'') result += "\\"; result += value.slice(i, i + 1) }
    }
    return result + "'"
}
M.clean_environment <- function() {
    local env = {}
    foreach (record in GLib.get_environ()) {
        local equals = record.find("=")
        if (equals != null) env[record.slice(0, equals)] <- record.slice(equals + 1)
    }
    env.PATH <- "/usr/bin:/bin"; env.LC_ALL <- "C.UTF-8"; env.TZ <- "UTC"; env.PYTHONHASHSEED <- "0"
    foreach (name in ["CC", "CXX", "CPP", "AR", "AS", "LD", "NM", "RANLIB", "STRIP", "CFLAGS", "CXXFLAGS", "CPPFLAGS", "LDFLAGS",
        "CPATH", "C_INCLUDE_PATH", "CPLUS_INCLUDE_PATH", "LIBRARY_PATH", "LD_LIBRARY_PATH", "LD_PRELOAD", "PKG_CONFIG_PATH", "PKG_CONFIG_LIBDIR",
        "PKG_CONFIG_SYSROOT_DIR", "GI_TYPELIB_PATH", "GI_GIR_PATH", "VALAFLAGS", "PYTHONPATH", "CONDA_PREFIX", "CMAKE_PREFIX_PATH", "SQGI_ANDROID_TARGET_LIBRARIES",
        "SQGI_ANDROID_KEYSTORE", "SQGI_ANDROID_KEY_ALIAS", "SQGI_ANDROID_STORE_PASSWORD", "SQGI_ANDROID_KEY_PASSWORD"]) env[name] <- null
    // Resolve before PATH is narrowed, so GI subprocesses use the same tool
    // that setup checked and the build lock identified.
    env.SQGI_ANDROID_XMLLINT <- Environment.xmllint()
    return env
}
M.prepare_directory <- function(directory, context) {
    local marker = directory + "/build-context.json"
    // Meson and CMake retain compiler paths across reconfiguration. Only this
    // generated module directory is disposable; source trees stay outside it.
    if (C.exists(directory) && (!C.is_file(marker) || !C.equal(sqgi.json.parse(C.read(marker)), context)))
        C.remove(directory)
    C.mkdir(directory)
    C.atomic_json(marker, context)
}
M.run <- function(argv, env, cwd = null) {
    print("sqgipkg Android native: " + M.quote(argv) + "\n")
    C.process(argv, env, false, cwd)
}
M.expand <- function(value, variables) {
    local result = "", position = 0, pattern = regexp("\\$\\{([A-Za-z_][A-Za-z0-9_]*)\\}"), match
    while ((match = pattern.capture(value, position)) != null) {
        local name = value.slice(match[1].begin, match[1].end)
        if (!(name in variables) || variables[name] == null) throw "Unknown native hook context variable: " + name
        result += value.slice(position, match[0].begin) + variables[name]; position = match[0].end
    }
    return result + value.slice(position)
}
M.hooks <- function(commands, env, source) {
    foreach (command in commands) {
        if (typeof(command) == "string") throw "Android native hooks require portable {argv: [...]} commands"
        local merged = clone env, args = []
        foreach (key, value in C.get(command, "env", {})) merged[key] <- M.expand(value, env)
        foreach (arg in command.argv) args.push(M.expand(arg, merged))
        M.run(args, merged, source)
    }
}
M.source_provenance <- function(project, source, excludes = []) {
    foreach (root in excludes) if (C.within(C.absolute(source), C.absolute(root)))
        throw "Android output directory must not contain native sources: " + source
    local paths = [], tracked = null
    try { tracked = C.process_bytes(["git", "-C", source, "ls-files", "-co", "--exclude-standard", "-z", "--", "."]) } catch (unused) {}
    // A project copied beneath an ancestor's ignored build directory still has
    // real sources. Git succeeds there but reports no paths: inventory it as a
    // standalone source tree instead of recording an empty source identity.
    if (tracked != null && tracked.len()) {
        local start = 0
        for (local i = 0; i < tracked.len(); i++) if (tracked[i] == 0) {
            if (i > start) paths.push(source + "/" + tracked.slice(start, i))
            start = i + 1
        }
        if (start != tracked.len()) throw "Invalid Git native source inventory"
    } else foreach (path in C.walk(source)) {
        local exclude = false
        foreach (part in split(path.slice(source.len() + 1), "/")) if ([".git", ".sqgipkg", "build", "_build", "target"].find(part) != null) exclude = true
        if (!exclude) paths.push(path)
    }
    local files = {}, recipe = {}
    foreach (path in paths) if (C.is_file(path)) {
        local excluded = false
        foreach (root in excludes) if (C.within(C.absolute(path), C.absolute(root))) excluded = true
        if (!excluded) files[path.slice(source.len() + 1)] <- C.file_hash(path)
    }
    foreach (key in ["build_system", "gi", "options", "targets", "build", "install", "depends_on"]) recipe[key] <- C.get(project, key)
    return { files = files, recipe = recipe, sha256 = C.digest(C.encoded({ files = files, recipe = recipe })) }
}
M.shims <- function(work) {
    local root = work + "/native-tools", sqgi = GLib.file_read_link("/proc/self/exe")
    C.mkdir(root)
    foreach (name, action in { ["g-ir-scanner"] = "scan", ["g-ir-compiler"] = "compile", ["gi-exec"] = "exec", ["gi-ldd"] = "ldd" }) {
        local path = root + "/" + name
        // The host SQGI loader must never search Android libraries. Preserve
        // the scanner's target paths separately for Context to validate.
        C.write(path, "#!/bin/sh\nSQGI_ANDROID_TARGET_LIBRARIES=\"${LD_LIBRARY_PATH-}\"\nexport SQGI_ANDROID_TARGET_LIBRARIES\nunset LD_LIBRARY_PATH LD_PRELOAD\nexec " +
            M.quote([sqgi, HERE + "/gi_tool.nut", action]) + " \"$@\"\n")
        C.chmod(path, 493)
    }
    return { directory = root, sqgi = sqgi }
}
M.build <- function(project, request, sdk_base, root, work, tools, inspection, shims) {
    local name = project.name, system = C.get(project, "build_system", "custom"), abi = request.abi, api = request.application.min_sdk
    if (["meson", "cmake", "custom"].find(system) == null) throw "Unknown Android native build system: " + system
    local source = C.resolve_path(project.dir), directory = work + "/native/" + name, prefix = root + "/usr"
    if (!C.is_dir(source)) throw "Native source directory is missing: " + source
    local excludes = C.get(request, "source_excludes", []), source_inputs = M.source_provenance(project, source, excludes)
    local expected = C.get(C.get(request, "native_inputs", {}), name)
    if (expected != null && expected.sha256 != source_inputs.sha256) throw "Android native sources changed after input resolution: " + name
    if (C.get(sdk_base.metadata.runtime, "source") != null)
        source_inputs.recipe.android_runtime_source <- sdk_base.metadata.runtime.source.sha256
    if (C.get(request.application, "native_entry") != null) {
        source_inputs.recipe.android_entry_header <- C.file_hash(HERE + "/sqgi_android_entry.h")
    }
    source_inputs.sha256 = C.digest(C.encoded({ files = source_inputs.files, recipe = source_inputs.recipe }))
    M.prepare_directory(directory, { schema = 1, source = source, sdk = root,
        ndk = tools.ndk, abi = abi, api = api, build_system = system })
    local install = directory + "/install"; C.remove(install); C.mkdir(install)
    local config = directory + "/android-context.json", bin = tools.ndk + "/toolchains/llvm/prebuilt/linux-x86_64/bin"
    local cc = bin + "/" + S.TARGETS[abi] + api + "-clang", cxx = cc + "++", wrappers = shims.directory
    C.atomic_json(config, { schema = 1, abi = abi, sdk = root, allowed_roots = [directory, source], library_dirs = [directory], readelf = tools.readelf,
        runner = C.get(request, "runner", "auto") == "adb" ? "adb" : "qemu", inspection_root = inspection == null ? "" : inspection.directory,
        adb = C.get(request, "adb", "adb"), serial = C.get(request, "serial", ""), binary_wrapper = wrappers + "/gi-exec", ldd_wrapper = wrappers + "/gi-ldd" })
    local env = M.clean_environment(), values = { PATH = wrappers + ":/usr/bin:/bin", CC = cc, CXX = cxx,
        AR = bin + "/llvm-ar", RANLIB = bin + "/llvm-ranlib", NM = bin + "/llvm-nm", STRIP = bin + "/llvm-strip", PKG_CONFIG = "/usr/bin/pkg-config", PKG_CONFIG_PATH = "",
        PKG_CONFIG_LIBDIR = prefix + "/lib/pkgconfig:" + prefix + "/share/pkgconfig", PKG_CONFIG_SYSROOT_DIR = root, GI_GIR_PATH = prefix + "/share/gir-1.0",
        XDG_DATA_DIRS = prefix + "/share", SQGI_ANDROID_CONTEXT = config, SQGI_ANDROID_ABI = abi, ANDROID_ABI = abi, ANDROID_API = api.tostring(),
        ANDROID_NDK_HOME = tools.ndk, ANDROID_NDK_ROOT = tools.ndk, SQGI_NATIVE_SDK = root, BUILD_DIR = directory, SOURCE_DIR = source, DESTDIR = install,
        GI_SCANNER = wrappers + "/g-ir-scanner", GI_COMPILER = wrappers + "/g-ir-compiler", GI_RUNNER = wrappers + "/gi-exec", SQGI = shims.sqgi,
        SOURCE_DATE_EPOCH = sdk_base.metadata.source_lock.build.source_date_epoch.tostring() }
    foreach (key, value in values) env[key] <- value
    if (C.get(request, "jobs") != null) env.SQGI_ANDROID_JOBS <- request.jobs.tostring()
    local cflags = ["-O2", "-fPIC", "-I" + prefix + "/include", "-ffile-prefix-map=" + source + "=/usr/src/" + name]
    if (C.get(request.application, "native_entry") != null) { cflags.push("-I" + HERE); env.SQGI_ANDROID_ENTRY_INCLUDE <- HERE }
    local ldflags = ["-L" + prefix + "/lib", "-Wl,-z,max-page-size=16384", "-Wl,-z,common-page-size=16384"]
    env.CFLAGS <- M.quote(cflags); env.CXXFLAGS <- M.quote(cflags); env.LDFLAGS <- M.quote(ldflags)
    env.CARGO <- GLib.find_program_in_path("cargo"); if (env.CARGO == null) env.CARGO = "cargo"
    env.RUSTC <- GLib.find_program_in_path("rustc"); if (env.RUSTC == null) env.RUSTC = "rustc"
    env.VALAFLAGS <- "--vapidir=" + prefix + "/share/vala/vapi"
    local cross = directory + "/android.ini", lines = ["[binaries]"]
    foreach (key, value in { c = cc, cpp = cxx, ar = bin + "/llvm-ar", strip = bin + "/llvm-strip", ["pkg-config"] = "/usr/bin/pkg-config", vala = "/usr/bin/valac",
        ["g-ir-scanner"] = env.GI_SCANNER, ["g-ir-compiler"] = env.GI_COMPILER, exe_wrapper = env.GI_RUNNER }) lines.push(key + " = " + M.meson_value(value))
    lines.extend(["[host_machine]", "system = 'android'", "cpu_family = '" + (abi == "arm64-v8a" ? "aarch64" : "x86_64") + "'",
        "cpu = '" + (abi == "arm64-v8a" ? "armv8" : "x86_64") + "'", "endian = 'little'", "[properties]", "needs_exe_wrapper = true",
        "sys_root = " + M.meson_value(root), "pkg_config_libdir = " + M.meson_value(split(env.PKG_CONFIG_LIBDIR, ":")), "[built-in options]"])
    foreach (key, value in { c_args = cflags, cpp_args = cflags, vala_args = [env.VALAFLAGS], c_link_args = ldflags, cpp_link_args = ldflags }) lines.push(key + " = " + M.meson_value(value))
    C.write(cross, C.concat(lines, "\n") + "\n")
    local toolchain = tools.ndk + "/build/cmake/android.toolchain.cmake"
    env.MESON_CROSS_FILE <- cross; env.CMAKE_TOOLCHAIN_FILE <- toolchain
    local settings = [], options = C.get(project, "options", {})
    foreach (key in C.keys(options)) settings.push("-D" + key + "=" + options[key].tostring())
    if (system == "meson") {
        local configure = ["meson", "setup", directory, source, "--cross-file", cross, "--prefix=/usr", "--libdir=lib", "--buildtype=release", "--wrap-mode=nodownload"]
        configure.extend(settings)
        if (C.exists(directory + "/meson-private/coredata.dat")) configure.extend(["--reconfigure", "--clearcache"])
        M.run(configure, env)
        local compile = ["meson", "compile", "-C", directory]
        if (C.get(request, "jobs") != null) compile.extend(["-j", request.jobs.tostring()])
        compile.extend(C.get(project, "targets", [])); M.run(compile, env)
    } else if (system == "cmake") {
        local configure = ["cmake", "-S", source, "-B", directory, "-G", "Ninja", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_TOOLCHAIN_FILE=" + toolchain,
            "-DANDROID_ABI=" + abi, "-DANDROID_PLATFORM=android-" + api, "-DANDROID_STL=c++_shared", "-DCMAKE_INSTALL_PREFIX=/usr", "-DCMAKE_INSTALL_LIBDIR=lib", "-DCMAKE_SKIP_RPATH=ON",
            "-DCMAKE_C_FLAGS=" + M.cmake_flags(cflags), "-DCMAKE_CXX_FLAGS=" + M.cmake_flags(cflags),
            "-DCMAKE_SHARED_LINKER_FLAGS=" + M.cmake_flags(ldflags), "-DCMAKE_MODULE_LINKER_FLAGS=" + M.cmake_flags(ldflags), "-DCMAKE_EXE_LINKER_FLAGS=" + M.cmake_flags(ldflags),
            "-DCMAKE_FIND_ROOT_PATH=" + root, "-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER", "-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY", "-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY", "-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=ONLY"]
        configure.extend(settings); M.run(configure, env)
        local compile = ["cmake", "--build", directory], targets = C.get(project, "targets", [])
        if (C.get(request, "jobs") != null) compile.extend(["--parallel", request.jobs.tostring()])
        if (targets.len()) { compile.push("--target"); compile.extend(targets) }
        M.run(compile, env)
    }
    M.hooks(C.get(project, "build", []), env, source)
    if (system == "meson") M.run(["meson", "install", "-C", directory, "--no-rebuild", "--destdir", install], env)
    else if (system == "cmake") M.run(["cmake", "--install", directory], env)
    M.hooks(C.get(project, "install", []), env, source)
    local installed = {}, destinations = {}, has_libraries = false
    foreach (path in C.walk(install)) if (C.is_file(path)) {
        local target = "/" + path.slice(install.len() + 1)
        installed[path] <- target; destinations[target] <- true
        if (regexp("\\.so(\\.[0-9]+)*$").search(target)) has_libraries = true
    }
    local output_libraries = clone C.get(project, "libraries", []), output_typelibs = clone C.get(project, "typelibs", []), discovered = []
    foreach (path in C.walk(directory)) if (!C.within(path, install) && C.is_file(path)) discovered.push(path)
    if (!output_libraries.len() && !has_libraries) foreach (path in discovered)
        if (regexp("\\.so(\\.[0-9]+)*$").search(path) && split(path, "/").find("CMakeFiles") == null) output_libraries.push(path)
    if (!output_typelibs.len()) foreach (path in discovered) if (C.ends(path, ".typelib")) output_typelibs.push(path)
    foreach (path in output_libraries) {
        local target = "/usr/lib/" + GLib.path_get_basename(path)
        if (!(target in destinations)) { installed[path] <- target; destinations[target] <- true }
    }
    foreach (path in output_typelibs) {
        local basename = GLib.path_get_basename(path), target = "/usr/lib/girepository-1.0/" + basename
        if (!(target in destinations)) { installed[path] <- target; destinations[target] <- true }
        local name = basename.slice(0, basename.len() - 8) + ".gir", candidates = []
        foreach (file in discovered) if (GLib.path_get_basename(file) == name) candidates.push(file)
        if (candidates.len() != 1) throw "Native typelib needs exactly one target GIR: " + basename
        target = "/usr/share/gir-1.0/" + name
        if (!(target in destinations)) { installed[candidates[0]] <- target; destinations[target] <- true }
    }
    local native_libraries = {}, native_namespaces = {}, normalizations = {}
    foreach (original in C.keys(installed)) {
        local path = original, basename = GLib.path_get_basename(path)
        if (regexp("\\.so(\\.[0-9]+)*$").search(basename)) {
            local normalized = install + "/.normalized/" + basename, adjustment = E.remove_build_rpath(path, normalized, [directory, root], tools.readelf)
            if (adjustment != null) { installed[normalized] <- installed[path]; delete installed[path]; normalizations[basename] <- adjustment; path = normalized }
            local record = E.inspect(path, abi, tools.readelf)
            if (!C.ends(basename, ".so") || record.soname != basename) throw "Android native libraries need unversioned .so names and matching SONAMEs: " + path
            native_libraries[basename] <- true
        } else if (C.ends(basename, ".typelib")) native_namespaces[basename.slice(0, basename.len() - 8)] <- true
    }
    Exports.export_files(root, name, installed)
    local gi = C.get(project, "gi")
    if (gi != null && !(gi.namespace + "-" + gi.version in native_namespaces)) throw "Native recipe did not produce its declared target typelib: " + name
    if (!C.equal(M.source_provenance(project, source, excludes).files, source_inputs.files)) throw "Android native sources changed during the build: " + name
    return { name = name, build_system = system, libraries = C.keys(native_libraries), min_api = api,
        namespaces = C.keys(native_namespaces), build = directory, normalizations = normalizations, depends_on = C.get(project, "depends_on", []), source = source_inputs }
}
return M
