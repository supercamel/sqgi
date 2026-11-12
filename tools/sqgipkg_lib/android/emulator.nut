// A shared emulator for installed SQGI, independent of any application checkout.
local C = import("common.nut"), P = import("provision.nut"), E = import("environment.nut")
local GLib = import("GLib"), Gio = import("Gio"), Host = import("../host.nut").SqgiPkgHost()
local M = { name = "SQGI_API_36", default_port = 5564 }
M.paths <- function() {
    local lock = P.lock(), root = P.root()
    return { avds = root + "/avd", avd = root + "/avd/" + M.name + ".avd",
        emulator = root + "/tools/" + lock.emulator.directory + "/" + lock.emulator.probe,
        image = root + "/tools/" + lock.image.directory + "/x86_64/" }
}
M.ready <- function() {
    local lock = P.lock(), paths = M.paths()
    return P.ready(lock.emulator) && P.ready(lock.image) && C.is_file(paths.avd + "/config.ini") &&
        C.is_file(paths.avd + "/sqgipkg.json")
}
M.prepare <- function(offline) {
    local lock = P.lock()
    P.prepare(lock.emulator, offline); P.prepare(lock.image, offline)
    local paths = M.paths()
    C.mkdir(paths.avds)
    C.locked(paths.avds + "/prepare.lock", function() {
        if (C.exists(paths.avd) && !C.is_file(paths.avd + "/sqgipkg.json"))
            throw "Refusing to overwrite an existing AVD: " + paths.avd
        if (!C.exists(paths.avd)) {
            C.temporary(function(root) {
                C.write(root + "/config.ini", "AvdId=" + M.name + "\navd.ini.encoding=UTF-8\nabi.type=x86_64\nhw.cpu.arch=x86_64\nhw.cpu.ncore=4\n" +
                    "image.sysdir.1=" + paths.image + "\ntag.id=google_apis\nhw.ramSize=4096\nhw.keyboard=yes\nhw.mainKeys=no\n" +
                    "hw.gpu.enabled=yes\nhw.gpu.mode=auto\nhw.initialOrientation=landscape\nhw.lcd.width=1440\nhw.lcd.height=900\n" +
                    "hw.lcd.density=240\nhw.sensors.orientation=yes\ndisk.dataPartition.size=6G\nshowDeviceFrame=no\nskin.name=1440x900\n" +
                    "skin.path=_no_skin\nskin.dynamic=yes\nPlayStore.enabled=false\n");
                C.atomic_json(root + "/sqgipkg.json", { schema = 1, image = lock.image.sha256 })
                C.move(root, paths.avd)
            }, paths.avds)
        }
        C.write(paths.avds + "/" + M.name + ".ini", "avd.ini.encoding=UTF-8\npath=" + paths.avd + "\ntarget=android-36\n")
    })
    return paths
}
M.port <- function(value) {
    if (typeof(value) == "string" && !regexp("^[0-9]+$").match(value)) throw "Emulator port must be an even number from 5554 to 5682"
    local result = value.tointeger()
    if (result < 5554 || result > 5682 || result % 2) throw "Emulator port must be an even number from 5554 to 5682"
    return result
}
M.gpu <- function(value) {
    if (value == null) return "auto"
    if (["auto", "host", "software", "lavapipe", "swiftshader", "swangle"].find(value) == null)
        throw "Emulator --gpu must be auto, host, software, lavapipe, swiftshader or swangle"
    return value
}
M.command <- function(paths, port, headless, gpu = null) {
    local result = ["setsid", paths.emulator, "-avd", M.name, "-port", port.tostring(),
        "-no-snapshot", "-no-audio", "-no-boot-anim", "-gpu", M.gpu(gpu), "-memory", "4096",
        // Emulator 37.2.13's host compositor can present older portions of
        // CPU-drawn GTK surfaces. Let SurfaceFlinger compose them instead;
        // the selected GPU still accelerates rendering and composition.
        "-feature", "-HostComposition"]
    if (headless) result.push("-no-window")
    result.extend(["-qemu", "-cpu", "host"]) // Expose AES for ARM64 native translation.
    return result
}
M.run <- function(port, headless, stop, gpu = null) {
    if (E.host_arch() != "x86_64") throw "The bundled Android emulator requires Linux x86_64; deploy to a phone from ARM64"
    port = M.port(port)
    local selected_gpu = M.gpu(gpu)
    local paths = M.paths(), sdk = E.paths().android_sdk, adb = sdk + "/platform-tools/adb", serial = "emulator-" + port
    if (!C.is_file(adb)) throw "Missing Android platform-tools; run sqgipkg setup --platform android"
    local call = function(args) { local command = ["timeout", "10", adb, "-s", serial]; command.extend(args); return Host.process(command, null, null, true) }
    local active = call(["get-state"]).status == 0
    if (active) {
        local identity = call(["emu", "avd", "name"])
        if (identity.status || split(strip(identity.stdout), "\r\n").find(M.name) == null)
            throw serial + " belongs to another emulator; choose --port instead"
        if (stop) {
            C.process([adb, "-s", serial, "emu", "kill"])
            // ADB briefly reports a device after its console has closed.
            local deadline = GLib.get_monotonic_time() + 30000000
            while (call(["get-state"]).status == 0) {
                if (GLib.get_monotonic_time() > deadline) throw "Emulator shutdown did not finish: " + serial
                GLib.usleep(250000)
            }
            return { serial = serial, stopped = true }
        }
        print("sqgipkg: reusing " + serial + " (" + M.name + ")\n")
        if (gpu != null) print("sqgipkg: --gpu applies at startup; stop the emulator first to change its renderer\n")
    } else {
        if (stop) return { serial = serial, stopped = true }
        foreach (line in split(C.process([adb, "devices"]), "\n")) {
            local fields = split(strip(line), "\t ")
            if (fields.len() != 2 || fields[1] != "device" || !C.starts(fields[0], "emulator-")) continue
            local identity = Host.process(["timeout", "10", adb, "-s", fields[0], "emu", "avd", "name"], null, null, true)
            if (!identity.status && split(strip(identity.stdout), "\r\n").find(M.name) != null)
                throw M.name + " is already running as " + fields[0] + "; use its --port"
        }
        if (!M.ready()) throw "Prepare the emulator with sqgipkg setup --platform android --emulator --accept-licenses"
        if (!GLib.file_test("/dev/kvm", GLib.FileTest.exists) || !Gio.File.new_for_path("/dev/kvm").query_info("access::can-read,access::can-write", Gio.FileQueryInfoFlags.none, null).get_attribute_boolean("access::can-write"))
            throw "Android emulation requires access to /dev/kvm; enable virtualization and add your user to the kvm group"
        if (!headless && GLib.getenv("DISPLAY") == null && GLib.getenv("WAYLAND_DISPLAY") == null)
            throw "No desktop display; use sqgipkg emulator --headless"
        local log = P.root() + "/logs/emulator-" + port + ".log"; C.mkdir(GLib.path_get_dirname(log))
        local launch = Gio.SubprocessLauncher.new(Gio.SubprocessFlags.stderr_merge)
        launch.setenv("ANDROID_AVD_HOME", paths.avds, true); launch.setenv("ANDROID_SDK_ROOT", sdk, true)
        launch.set_stdout_file_path(log)
        local child = launch.spawnv(M.command(paths, port, headless, selected_gpu))
        C.atomic_json(P.root() + "/emulator.json", { pid = child.get_identifier(), serial = serial, avd = M.name, gpu = selected_gpu, log = log })
        print("sqgipkg: starting " + serial + "; log: " + log + "\n")
    }
    local deadline = GLib.get_monotonic_time() + 180000000
    while (GLib.get_monotonic_time() < deadline) {
        local boot = call(["shell", "getprop", "sys.boot_completed"])
        if (!boot.status && strip(boot.stdout) == "1") {
            call(["shell", "input", "keyevent", "KEYCODE_WAKEUP"])
            call(["shell", "wm", "dismiss-keyguard"])
            print("sqgipkg: emulator ready; use sqgipkg deploy --platform android --arch x86_64 --serial " + serial + "\n")
            return { serial = serial, stopped = false }
        }
        GLib.usleep(1000000)
    }
    throw "Emulator did not boot; inspect " + P.root() + "/logs/emulator-" + port + ".log"
}
return M
