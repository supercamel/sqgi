// Android device selection, verified installation and complete source snapshots.
local C = import("common.nut"), P = import("payload.nut"), B = import("bundle.nut")
local Signing = import("signing.nut"), T = import("toolchain.nut"), A = import("archive.nut"), GLib = import("GLib")
local host = import("../host.nut").SqgiPkgHost()
local Environment = import("environment.nut")
local M = {}
M.angle_selection <- function(packages, drivers, package) {
    if (!regexp("^[A-Za-z_][A-Za-z0-9_]*(\\.[A-Za-z_][A-Za-z0-9_]*)+$").match(package)) throw "Invalid Android application ID"
    local names = packages == "" || packages == "null" ? [] : split(packages, ",")
    local values = drivers == "" || drivers == "null" ? [] : split(drivers, ",")
    if (names.len() != values.len()) throw "Existing Android ANGLE package/driver settings have different lengths"
    local found = false
    foreach (index, name in names) if (name == package) { values[index] = "angle"; found = true }
    if (!found) { names.push(package); values.push("angle") }
    return { packages = C.concat(names, ","), drivers = C.concat(values, ",") }
}
M.quote <- function(args) { local out = []; foreach (arg in args) out.push(GLib.shell_quote(arg.tostring())); return C.concat(out, " ") }
M.adb <- function() {
    local path = Environment.adb()
    if (path == null || !C.is_file(path)) throw "Android deployment needs adb; run sqgipkg setup --platform android"
    return C.absolute(path)
}
M.select <- function(devices, serial, abis, minimum) {
    local compatible = []
    foreach (device in devices) {
        if (serial != "" && device.serial != serial) continue
        local abi = null
        foreach (supported in device.abis) if (abis.find(supported) != null) { abi = supported; break }
        if (device.state == "device" && device.api >= minimum && abi != null) {
            local selected = clone device; selected.abi <- abi; compatible.push(selected)
        } else if (serial != "") throw "Selected Android device is unavailable or incompatible (state=" + device.state + ", API=" + device.api + ", ABIs=" + C.concat(device.abis) + ")"
    }
    if (compatible.len() != 1) throw compatible.len() ? "More than one compatible Android device; select --serial" : "No compatible Android device; connect an emulator/phone or select --serial"
    return compatible[0]
}
M.compatible_project <- function(installed, current) {
    if (!("development" in installed)) throw "This APK predates sqgipkg source updates; build and install it again"
    local before = clone installed, after = clone current
    // Entry and complete source inventory may change; runtime/native configuration may not.
    if ("entry" in before) delete before.entry
    if ("entry" in after) delete after.entry
    if (!C.equal(before, after)) throw "Android runtime, native inputs or application configuration changed; rebuild with sqgipkg deploy"
}
M.snapshot <- function(source, project, provenance) {
    local files = {}
    foreach (path in C.walk(source)) {
        if (C.is_link(path) || !C.is_file(path)) throw "Source updates require regular files: " + path
        local name = path.slice(source.len() + 1), bytes = C.read(path)
        if ((bytes.len() >= 4 && bytes.slice(0, 4) == "\x7fELF") ||
            regexp("\\.(so([.][0-9]+)*|typelib|dex|apk|aab|jar)$").search(name))
            throw "Native/runtime files cannot be source updates: " + name
        files[name] <- C.digest(bytes)
    }
    if (!(project.entry in files) && !(project.entry == "" && C.get(project, "native_entry") != null)) throw "Source snapshot entry is missing"
    return { schema = 1, project = project, files = files, base_id = provenance }
}
class Device {
    adb = null; serial = null; abi = null; info = null
    constructor(abis, minimum, requested = "") {
        adb = M.adb(); serial = ""
        if (requested == "") { local value = GLib.getenv("ANDROID_SERIAL"); if (value != null) requested = value }
        local devices = []
        foreach (line in split(C.process([adb, "devices"]), "\n")) {
            local fields = split(strip(line), "\t ")
            if (fields.len() != 2 || fields[0] == "List" || C.starts(fields[0], "*")) continue
            if (requested != "" && fields[0] != requested) continue
            local device = { serial = fields[0], state = fields[1], api = 0, abis = [] }
            if (device.state == "device") {
                serial = device.serial
                try { device.api = strip(shell(["getprop", "ro.build.version.sdk"])).tointeger(); device.abis = split(strip(shell(["getprop", "ro.product.cpu.abilist"])), ",") }
                catch (unused) { device.state = "unavailable" }
            }
            devices.push(device)
        }
        info = M.select(devices, requested, abis, minimum); serial = info.serial; abi = info.abi
    }
    function call(args, capture = true) {
        local command = [adb, "-s", serial]; command.extend(args)
        local result = host.process(command, null, null, capture)
        if (result.status) throw "adb failed (exit " + result.status + "): " + result.stdout + result.stderr
        return result.stdout
    }
    function shell(args, capture = true) { return call(["shell", M.quote(args)], capture) }
    function read(package, path) { return shell(["run-as", package, "cat", "files/" + C.relative(path)]) }
    function pid(package) { try { return strip(shell(["pidof", package])) } catch (unused) { return "" } }
    function launch(package, debug = true) {
        // The bundled emulator ANGLE supports GTK GLArea's offscreen contexts.
        // Scope the setting to this app; physical devices retain their driver.
        if (strip(shell(["getprop", "ro.kernel.qemu"])) == "1") {
            local available = false
            try { shell(["test", "-f", "/system/lib64/libEGL_angle.so"]); available = true } catch (unused) {}
            if (available) {
                local before = { packages = strip(shell(["settings", "get", "global", "angle_gl_driver_selection_pkgs"])),
                    drivers = strip(shell(["settings", "get", "global", "angle_gl_driver_selection_values"])) }
                local next = M.angle_selection(before.packages, before.drivers, package)
                if (next.packages != before.packages || next.drivers != before.drivers) {
                    try {
                        shell(["settings", "put", "global", "angle_gl_driver_selection_pkgs", next.packages])
                        shell(["settings", "put", "global", "angle_gl_driver_selection_values", next.drivers])
                    } catch (error) {
                        foreach (pair in [["angle_gl_driver_selection_pkgs", before.packages], ["angle_gl_driver_selection_values", before.drivers]])
                            try { shell(pair[1] == "null" ? ["settings", "delete", "global", pair[0]] : ["settings", "put", "global", pair[0], pair[1]]) } catch (unused) {}
                        throw error
                    }
                }
            }
        }
        shell(["am", "force-stop", package])
        local output = shell(["am", "start", "-W", "-n", package + "/org.sqgi.android.GtkActivity"])
        if (output.find("Error:") != null || output.find("Exception") != null) throw "Android activity failed: " + output
        local deadline = GLib.get_monotonic_time() + 30000000
        while (GLib.get_monotonic_time() < deadline) {
            local process = pid(package)
            if (!debug && process != "") return { pid = process, mode = "release", abi = abi }
            local session = null, status = ""
            try { session = sqgi.json.parse(read(package, "runtime/session.json")); status = strip(read(package, "runtime/status.txt")) } catch (unused) {}
            if (session != null && session.pid.tostring() == process) {
                if (status == "failed") throw "Android entry failed; inspect sqgipkg logs"
                if (status == "running" || status == "exited") return session
            }
            GLib.usleep(200000)
        }
        throw "Android SQGI runtime did not start; inspect sqgipkg logs"
    }
    function installed(package) {
        require_debug(package)
        local session = null
        try { session = sqgi.json.parse(read(package, "runtime/session.json")) } catch (unused) {}
        local paths = split(shell(["pm", "path", package]), "\n")
        if (!paths.len()) throw "Android application is not installed; use sqgipkg deploy"
        if (session == null || paths.find("package:" + C.get(session, "apk_path", "")) == null) session = launch(package)
        local bytes = read(package, "runtime/provenance.json"), provenance = sqgi.json.parse(bytes)
        if (provenance.variant != "debug") throw "Source updates require a debug APK"
        if (provenance.abi != abi) throw "Installed application ABI differs from the selected ABI; deploy it again"
        return { provenance = provenance, base_id = C.digest(bytes) }
    }
    function require_debug(package) {
        try { shell(["run-as", package, "id"]) }
        catch (unused) { throw "Source updates require an installed debug application; deploy a debug APK first" }
    }
    function install(path, options) {
        if (!C.ends(path, ".apk") && !C.ends(path, ".aab")) throw "Android installation requires an .apk or .aab"
        local index = sqgi.json.parse(A.Zip(path).read((C.ends(path, ".aab") ? "base/" : "") + "assets/runtime/index.json"))
        local abis = C.keys(index.abis)
        if (abis.find(abi) == null) throw "Android artifact lacks the selected ABI: " + abi
        local tools = T.host(), verified = P.verify_artifact(path, abis), provenance = verified.payloads[abi], split_report = null, signer = null
        if (info.api < provenance.application.project.min_sdk) throw "Artifact requires a newer Android API"
        if (provenance.application.project.application_id != options.application_id) throw "Android artifact belongs to a different application"
        if (C.ends(path, ".apk")) {
            signer = Signing.verify_apk(path, tools.android_sdk, tools.java)
            call(["install", "-r", "--abi", abi, path])
        } else {
            signer = Signing.verify_aab(path, tools.java)
            Signing.configured(provenance.variant)
            if (provenance.variant == "debug") Signing.prepare_debug_key(tools.java)
            if (Signing.expected_certificate(tools.java) != signer) throw "AAB device splits require the bundle's signing identity"
            local self = this
            split_report = C.temporary(function(root) {
                local command = [tools.java + "/bin/java", "-jar", B.tool(C.get(options, "offline", false))]
                local run = function(args) { local argv = clone command; argv.extend(args); return C.process(argv, Signing.environment(tools.java)) }
                local spec = root + "/device.json", apks = root + "/device.apks", selected = root + "/selected"
                run(["get-device-spec", "--adb=" + self.adb, "--device-id=" + self.serial, "--output=" + spec])
                local actual = sqgi.json.parse(C.read(spec)), selected_spec = clone actual
                selected_spec.supportedAbis = [self.abi]; C.atomic_json(spec, selected_spec)
                Signing.with_bundle_arguments(tools.java, function(arguments) {
                    local args = ["build-apks", "--bundle=" + path, "--output=" + apks, "--device-spec=" + spec,
                        "--aapt2=" + Environment.packaging_tool("aapt2", tools.android_sdk)]
                    args.extend(arguments); run(args)
                })
                run(["extract-apks", "--apks=" + apks, "--device-spec=" + spec, "--output-dir=" + selected])
                local paths = []; foreach (file in C.walk(selected)) if (C.ends(file, ".apk")) paths.push(file)
                P.verify_splits(paths, self.abi)
                local files = {}
                foreach (file in paths) { Signing.verify_apk(file, tools.android_sdk, tools.java, signer); files[GLib.path_get_basename(file)] <- C.file_hash(file) }
                local args = ["install-multiple", "-r", "--abi", self.abi]; args.extend(paths); self.call(args)
                return { device_spec = actual, selected_spec = selected_spec, files = files }
            })
        }
        return { artifact = path, sha256 = C.file_hash(path), abi = abi, variant = provenance.variant,
            signer_sha256 = signer, device = info, splits = split_report }
    }
    function sync(package, source, project) {
        local current = installed(package)
        M.compatible_project(current.provenance.application.project, project)
        local metadata = M.snapshot(source, project, current.base_id), encoded = C.encoded(metadata), identity = C.digest(encoded)
        local staging = "files/development/.upload-" + GLib.uuid_string_random(), target = "files/development/snapshots/" + identity
        local remote = "/data/local/tmp/sqgipkg-" + GLib.uuid_string_random() + ".tar", self = this, failure = null, session = null
        try {
            C.temporary(function(root) {
                C.mkdir(root + "/snapshot"); C.write(root + "/snapshot/project.json", encoded); C.copy_tree(source, root + "/snapshot/source")
                C.process(["tar", "-cf", root + "/snapshot.tar", "-C", root + "/snapshot", "project.json", "source"])
                self.call(["push", root + "/snapshot.tar", remote])
                local script = "set -eu; mkdir -p " + M.quote([staging]) + "; tar -xf - -C " + M.quote([staging])
                self.call(["shell", M.quote(["run-as", package, "sh", "-c", script]) + " < " + M.quote([remote])])
            })
            shell(["am", "force-stop", package])
            shell(["run-as", package, "sh", "-c", "set -eu; mkdir -p files/development/snapshots; rm -rf " + M.quote([target]) +
                "; mv " + M.quote([staging, target]) + "; printf '%s\\n' " + M.quote([identity]) +
                " > files/development/active.tmp; mv files/development/active.tmp files/development/active"])
            session = launch(package)
            if (session.mode != "development" || session.snapshot != identity) throw "Android rejected the source snapshot; inspect sqgipkg logs"
            shell(["run-as", package, "sh", "-c", "for p in files/development/snapshots/*; do if [ \"$p\" != " + M.quote([target]) + " ]; then rm -rf \"$p\"; fi; done"])
        } catch (caught) { failure = caught }
        try { shell(["rm", "-f", remote]); shell(["run-as", package, "rm", "-rf", staging]) } catch (unused) {}
        if (failure != null) throw failure
        return session
    }
    function reset(package) {
        require_debug(package)
        shell(["am", "force-stop", package]); shell(["run-as", package, "rm", "-rf", "files/development"])
        return launch(package)
    }
    function logs(package, once = false) {
        local process = pid(package)
        if (process == "") throw "Application is not running; use sqgipkg run first"
        local args = ["logcat", "--pid=" + process]
        if (once) args.push("-d")
        call(args, false)
    }
}
M.Device <- Device
return M
