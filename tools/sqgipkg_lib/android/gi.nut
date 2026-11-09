// Host scanner orchestration and target execution adapters for native recipes.
local C = import("common.nut"), E = import("elf.nut"), G = import("gir.nut"), I = import("inspection.nut")
local GLib = import("GLib"), Gio = import("Gio")
class Context {
    data = null; abi = null; sdk = null; roots = null; readelf = null; libraries = null; gir = null
    constructor(configuration = null, dynamic_paths = null) {
        data = configuration == null ? sqgi.json.parse(C.read(GLib.getenv("SQGI_ANDROID_CONTEXT"))) : configuration
        if (C.get(data, "schema") != 1) throw "Unsupported Android GI build context"
        abi = data.abi; sdk = C.resolve_path(data.sdk); roots = [sdk]; readelf = data.readelf
        foreach (path in data.allowed_roots) roots.push(C.resolve_path(path))
        libraries = []; local paths = []
        if (dynamic_paths == null) dynamic_paths = GLib.getenv("SQGI_ANDROID_TARGET_LIBRARIES")
        if (dynamic_paths == null) dynamic_paths = GLib.getenv("LD_LIBRARY_PATH")
        if (dynamic_paths != null && dynamic_paths != "") paths.extend(split(dynamic_paths, ":"))
        paths.extend(data.library_dirs); paths.push(sdk + "/usr/lib")
        foreach (path in paths) {
            if (path == "") continue
            local normalized = allowed(path)
            if (libraries.find(normalized) == null) libraries.push(normalized)
        }
        gir = sdk + "/usr/share/gir-1.0"
    }
    function allowed(path) {
        path = C.resolve_path(path)
        foreach (root in roots) if (C.within(path, root)) return path
        throw "Android GI path is outside the permitted target roots: " + path
    }
    function elf(path) {
        path = allowed(path)
        local header = C.read(path)
        local machines = { x86_64 = 62, ["arm64-v8a"] = 183 }
        if (!(abi in machines) || header.len() < 20 || header.slice(0, 6) != "\x7fELF\x02\x01" || C.uint_le(header, 18, 2) != machines[abi])
            throw "Android GI execution requires target ELF: " + path
        foreach (offset in E.headers(header)) if (C.uint_le(header, offset, 4) == 3) {
            local start = C.uint_le(header, offset + 8, 8), size = C.uint_le(header, offset + 32, 8)
            if (size < 1 || start > header.len() - size) throw "Invalid Android GI ELF interpreter bounds"
            local interpreter = header.slice(start, start + size)
            while (interpreter.len() && interpreter[interpreter.len() - 1] == 0) interpreter = interpreter.slice(0, interpreter.len() - 1)
            if (interpreter != "/system/bin/linker64") throw "Non-Bionic Android GI execution input: " + path
        }
        return path
    }
    function include_directory(value) {
        // Target .pc data variables are /usr paths, unlike sysrooted Cflags.
        if (C.starts(value, "/usr/")) value = sdk + value
        return allowed(value)
    }
    function target_arguments(args, option) {
        local result = [], directories = [gir]
        for (local i = 0; i < args.len(); i++) {
            local arg = args[i]
            if (arg == option || C.starts(arg, option + "=")) {
                if (arg == option && i + 1 == args.len()) throw "Missing Android GI option value: " + option
                local path = include_directory(arg == option ? args[++i] : arg.slice(option.len() + 1))
                result.push(option + "=" + path); directories.push(path)
            } else result.push(arg)
        }
        return { args = result, directories = directories }
    }
    function validate_gir_includes(args, directories) {
        local pending = [], paths = [], seen = {}, seen_paths = {}
        for (local i = 0; i < args.len(); i++) foreach (option in ["--include", "--include-uninstalled"]) {
            local arg = args[i]
            if (arg == option || C.starts(arg, option + "=")) {
                if (arg == option && i + 1 == args.len()) throw "Missing Android GI option value: " + option
                local value = arg == option ? args[++i] : arg.slice(option.len() + 1)
                if (option == "--include") pending.push(value)
                else paths.push(allowed(value))
                break
            }
        }
        while (paths.len() || pending.len()) {
            local path = null, name = null
            if (paths.len()) path = paths.pop()
            else {
                name = pending.pop()
                if (name in seen) continue
                if (!regexp("^[A-Za-z_][A-Za-z0-9_]*-[0-9]+(\\.[0-9]+)*$").match(name)) throw "Invalid GI include identity: " + name
                seen[name] <- true
                foreach (directory in directories) if (C.is_file(directory + "/" + name + ".gir")) { path = directory + "/" + name + ".gir"; break }
                if (path == null) throw "Target SDK lacks GIR dependency: " + name
            }
            path = allowed(path)
            if (path in seen_paths) continue
            seen_paths[path] <- true
            local record = G.read(path)
            if (name != null && record.name != name) throw "Android GIR include identity differs: " + name
            pending.extend(record.includes)
        }
    }
    function execute(binary, arguments) {
        binary = elf(binary)
        if (data.runner == "adb") return execute_adb(binary, arguments)
        local runtime = I.Inspection(abi, data.inspection_root).validate()
        runtime.execute(binary, arguments, libraries, [sdk + "/usr/lib/girepository-1.0"])
    }
    function execute_adb(binary, arguments) {
        local adb = [data.adb], self = this
        if (C.get(data, "serial", "") != "") adb.extend(["-s", data.serial])
        local call = function(args, capture = true) { local command = clone adb; command.extend(args); return C.process(command, null, capture) }
        local shell = function(args, capture = true) {
            local quoted = []; foreach (arg in args) quoted.push(GLib.shell_quote(arg.tostring()))
            return call(["shell", C.concat(quoted, " ")], capture)
        }
        local abis = split(strip(shell(["getprop", "ro.product.cpu.abilist"])), ",")
        if (!abis.len() || abi != abis[0]) throw "ADB GI probes require the device native ABI; APK native translation is not a shell runner. Use qemu for " + abi
        local remote = "/data/local/tmp/sqgipkg-gi-" + GLib.uuid_string_random(), failure = null
        shell(["mkdir", "-p", remote + "/lib", remote + "/gir", remote + "/typelib"])
        try {
            call(["push", binary, remote + "/program"]); shell(["chmod", "700", remote + "/program"])
            local staged = {}
            foreach (directory in libraries) {
                if (!C.is_dir(directory)) continue
                foreach (item in C.children(directory)) if (!item.directory && item.name.find(".so") != null && !(item.name in staged) && C.is_file(item.path)) {
                    elf(item.path); call(["push", C.realpath(item.path), remote + "/lib/" + item.name]); staged[item.name] <- true
                }
            }
            foreach (item in C.children(sdk + "/usr/lib/girepository-1.0")) if (!item.directory && C.ends(item.name, ".typelib"))
                call(["push", item.path, remote + "/typelib/" + item.name])
            local translated = [], output = null, directories = [gir]
            for (local i = 0; i < arguments.len(); i++) {
                local arg = arguments[i]
                if (["--includedir", "--output", "-o"].find(arg) != null) {
                    if (i + 1 == arguments.len()) throw "Missing Android GI option value: " + arg
                    arg = (arg == "-o" ? "--output" : arg) + "=" + arguments[++i]
                }
                if (C.starts(arg, "--includedir=")) {
                    directories.push(include_directory(arg.slice(13))); translated.push("--includedir=" + remote + "/gir")
                } else if (C.starts(arg, "--introspect-dump=")) {
                    local pair = split(arg.slice(18), ",")
                    if (pair.len() != 2) throw "Invalid Android GI introspection dump arguments"
                    output = allowed(pair[1]); call(["push", allowed(pair[0]), remote + "/input"])
                    translated.push("--introspect-dump=" + remote + "/input," + remote + "/output")
                } else if (C.starts(arg, "--output=")) { output = allowed(arg.slice(9)); translated.push("--output=" + remote + "/output") }
                else if (C.ends(arg, ".gir") && C.is_file(arg)) {
                    local path = allowed(arg), basename = GLib.path_get_basename(path)
                    call(["push", path, remote + "/gir/" + basename]); translated.push(remote + "/gir/" + basename)
                } else translated.push(arg)
            }
            for (local i = directories.len() - 1; i >= 0; i--) foreach (item in C.children(directories[i])) if (!item.directory && C.ends(item.name, ".gir"))
                call(["push", allowed(item.path), remote + "/gir/" + item.name])
            local command = ["env", "LD_LIBRARY_PATH=" + remote + "/lib", "GI_TYPELIB_PATH=" + remote + "/typelib", remote + "/program"]
            command.extend(translated); shell(command, false)
            if (output != null) call(["pull", remote + "/output", output])
        } catch (caught) { failure = caught }
        shell(["rm", "-rf", remote])
        if (failure != null) throw failure
    }
    function run(action, args) {
        if (action == "scan") {
            local target = target_arguments(args, "--add-include-path")
            validate_gir_includes(target.args, target.directories)
            local command = ["/usr/bin/g-ir-scanner", "--use-binary-wrapper=" + data.binary_wrapper, "--use-ldd-wrapper=" + data.ldd_wrapper, "--add-include-path=" + gir]
            command.extend(target.args); C.process(command, { LD_LIBRARY_PATH = null }, false)
        } else if (action == "compile") {
            local target = target_arguments(args, "--includedir")
            foreach (arg in target.args) if (C.ends(arg, ".gir") && C.is_file(arg)) validate_gir_includes(["--include-uninstalled=" + arg], target.directories)
            local command = ["--includedir=" + gir]; command.extend(target.args)
            execute(sdk + "/usr/bin/g-ir-compiler", command)
        } else if (action == "exec") {
            if (!args.len()) throw "Android GI exec requires a target binary"
            execute(args[0], args.slice(1))
        } else if (action == "ldd") {
            if (!args.len()) throw "Android GI ldd requires a target binary"
            local pending = [elf(args[0])], seen = {}
            while (pending.len()) {
                local path = pending.pop()
                foreach (name in E.dynamic_values(C.process([readelf, "-d", path]), "NEEDED")) {
                    if (name in seen) continue
                    seen[name] <- true; print(name + "\n")
                    if (E.SYSTEM_LIBRARIES.find(name) != null) continue
                    local library = null
                    foreach (directory in libraries) if (C.is_file(directory + "/" + name)) { library = directory + "/" + name; break }
                    if (library == null || name == "libz.so") throw "Missing/non-pinned Android GI library: " + name
                    pending.push(elf(library))
                }
            }
        } else throw "Unknown Android GI adapter action"
    }
}
return { Context = Context }
