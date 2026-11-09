// Pinned Bionic userspaces for desktop GI inspection, never APK payloads.
local C = import("common.nut"), Image = import("image.nut"), Exports = import("exports.nut")
local GLib = import("GLib"), Gio = import("Gio"), Host = import("../host.nut")
local HERE = GLib.path_get_dirname(C.absolute(__FILE__)), host = Host.SqgiPkgHost()
local CONFIG = "dir.default = /\n[default]\nnamespace.default.isolated = false\nnamespace.default.search.paths = /system/lib64:/apex/com.android.runtime/lib64/bionic:/apex/com.android.art/lib64:/apex/com.android.i18n/lib64\n"
class Inspection {
    abi = null; identity = null; key = null; cache = null; directory = null; root = null; program = null; qemu = null; manifest = null; inputs = null
    constructor(target_abi, location = null) {
        abi = target_abi; inputs = sqgi.json.parse(C.read(HERE + "/inspection.lock.json"))
        if (!(abi in inputs.images)) throw "Unsupported Android inspection ABI"
        local recipes = {}; foreach (name in ["inspection.nut", "image.nut"]) recipes[name] <- C.file_hash(HERE + "/" + name)
        identity = { abi = abi, image = inputs.images[abi], qemu = inputs.qemu, recipes = recipes }
        key = C.digest(C.encoded(identity)); cache = C.cache()
        directory = location == null || location == "" ? cache + "/inspection/" + abi + "/" + key : C.absolute(location)
        root = directory + "/sysroot"; program = abi == "arm64-v8a" ? "qemu-aarch64" : "qemu-x86_64"
        qemu = directory + "/host/usr/bin/" + program; manifest = directory + "/inspection.json"
    }
    function validate() {
        local metadata = sqgi.json.parse(C.read(manifest))
        if (!C.equal(C.get(metadata, "identity"), identity) || !C.equal(C.get(metadata, "sysroot"), Exports.inventory(root)) ||
            C.get(metadata, "qemu_sha256") != C.file_hash(qemu)) throw "Android inspection runtime is changed or incompatible: " + directory
        return this
    }
    function fetch(record, offline) {
        local path = cache + "/inspection-downloads/" + record.name
        if (!C.exists(path)) {
            if (offline) throw "Offline Android inspection requires cached " + record.name
            print("sqgipkg: downloading inspection input " + record.url + "\n")
            // Emulator userspace archives are over 1 GB; keep package-sized
            // timeout defaults from prematurely ending the initial download.
            C.fetch(record.url, path, record.sha256, 1800)
        }
        if (Gio.File.new_for_path(path).query_info("standard::size", Gio.FileQueryInfoFlags.none, null).get_size() != record.size || C.file_hash(path) != record.sha256)
            throw "Android inspection cache checksum mismatch: " + record.name
        return path
    }
    function unzip_file(archive, member, output) {
        // Checksum-pinned inputs; extract one fixed member directly to a file.
        local launcher = Gio.SubprocessLauncher.new(Gio.SubprocessFlags.stderr_pipe)
        launcher.set_stdout_file_path(output)
        local child = launcher.spawnv(["unzip", "-p", archive, member]), result = child.communicate_utf8(null, null)
        if (!child.get_successful()) throw "Cannot extract Android inspection input: " + result[1]
    }
    function prepare(offline = false) {
        // bindenv holds a weak receiver. Capture this strongly because the
        // tail call below can otherwise collect a temporary Inspection object.
        local self = this, parent = GLib.path_get_dirname(directory); C.mkdir(parent)
        return C.locked(cache + "/inspection.lock", function() {
            if (C.exists(self.manifest)) return self.validate()
            if (C.exists(self.directory)) throw "Refusing to replace an unowned Android inspection directory"
            local qemu_archive = self.fetch(self.inputs.qemu, offline), image = self.fetch(self.inputs.images[self.abi], offline)
            C.temporary(function(temporary) {
                local sysroot = temporary + "/sysroot", work = temporary + "/extract"
                C.mkdir(sysroot); C.mkdir(work)
                C.process(["dpkg-deb", "-x", qemu_archive, temporary + "/host"])
                self.unzip_file(image, self.abi + "/system.img", work + "/system.img")
                Image.extract_system(work + "/system.img", work + "/system.ext4")
                local debug = function(command, image, cwd) {
                    local result = host.process(["/usr/sbin/debugfs", "-R", command, image], cwd, null, true)
                    if (result.status) throw "Android userspace extraction failed: " + result.stderr
                    foreach (line in split(result.stdout + result.stderr, "\n")) if (line != "" && !C.starts(line, "debugfs ") && line.find("Operation not permitted while changing ownership of ") == null)
                        throw "Android userspace extraction failed: " + line
                }
                C.mkdir(sysroot + "/system")
                debug("rdump /system/lib64 system", work + "/system.ext4", sysroot)
                foreach (name, mount in { ["com.android.runtime"] = "com.android.runtime", ["com.android.i18n"] = "com.android.i18n", ["com.google.android.art"] = "com.android.art" }) {
                    debug("dump /system/apex/" + name + ".apex " + name + ".apex", work + "/system.ext4", work)
                    self.unzip_file(work + "/" + name + ".apex", "apex_payload.img", work + "/" + name + ".img")
                    local destination = sysroot + "/apex/" + mount; C.mkdir(destination)
                    debug("rdump / .", work + "/" + name + ".img", destination)
                }
                C.mkdir(sysroot + "/system/bin")
                Gio.File.new_for_path(sysroot + "/system/bin/linker64").make_symbolic_link("../../apex/com.android.runtime/bin/linker64", null)
                foreach (path in C.walk(sysroot)) if (C.is_link(path)) {
                    local target = GLib.file_read_link(path)
                    if (C.starts(target, "/")) {
                        local relative = strip(C.process(["realpath", "-m", "-s", "--relative-to=" + GLib.path_get_dirname(path), "--", sysroot + target]))
                        C.remove(path); Gio.File.new_for_path(path).make_symbolic_link(relative, null)
                    }
                }
                C.mkdir(sysroot + "/linkerconfig"); C.write(sysroot + "/linkerconfig/ld.config.txt", CONFIG)
                foreach (name in ["system/bin/linker64", "system/lib64/libandroid.so", "apex/com.android.runtime/lib64/bionic/libc.so"])
                    if (!C.starts(C.read(sysroot + "/" + name), "\x7fELF")) throw "Android inspection userspace lacks " + name
                C.atomic_json(temporary + "/inspection.json", { identity = self.identity, qemu_sha256 = C.file_hash(temporary + "/host/usr/bin/" + self.program), sysroot = Exports.inventory(sysroot) })
                C.remove(work); C.move(temporary, self.directory)
            }, parent)
            return self.validate()
        })
    }
    function execute(binary, arguments, libraries, typelibs, environment = null) {
        local env = environment == null ? {} : clone environment
        foreach (name in ["LD_LIBRARY_PATH", "LD_PRELOAD", "GI_TYPELIB_PATH"]) env[name] <- null
        local paths = clone libraries
        foreach (path in ["system/lib64", "apex/com.android.runtime/lib64/bionic", "apex/com.android.art/lib64", "apex/com.android.i18n/lib64"]) paths.push(root + "/" + path)
        local command = ["timeout", "120", qemu, "-L", root, "-E", "LD_LIBRARY_PATH=" + C.concat(paths, ":"), "-E", "GI_TYPELIB_PATH=" + C.concat(typelibs, ":"), binary]
        command.extend(arguments)
        local parent = GLib.path_get_dirname(C.realpath(binary))
        if (parent.find("\n") != null || parent.find("\r") != null) throw "Android execution paths cannot contain newlines"
        C.temporary(function(temporary) {
            local config = temporary + "/ld.config.txt"
            C.write(config, "dir.default = " + parent + "\n" + CONFIG.slice(CONFIG.find("\n") + 1)); env.LD_CONFIG_FILE <- config
            C.process(command, env, false)
        })
    }
}
return { Inspection = Inspection }
