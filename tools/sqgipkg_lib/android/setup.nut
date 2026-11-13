// First-run setup is an installed SQGI command, not a build-repository script.
local C = import("common.nut"), E = import("environment.nut"), P = import("provision.nut")
local Emulator = import("emulator.nut"), T = import("toolchain.nut"), GLib = import("GLib"), Gio = import("Gio")
local M = {}
M.components <- function(paths, native = false) {
    local result = [
        { id = "platform", package = "platforms;android-35", path = paths.android_sdk + "/platforms/android-35/android.jar" },
        { id = "build-tools", package = "build-tools;35.0.0", path = paths.android_sdk + "/build-tools/35.0.0/apksigner" },
        // AGP expects this SDK component even when deployment uses native ADB.
        { id = "platform-tools", package = "platform-tools", path = paths.android_sdk + "/platform-tools/adb" }
    ]
    if (native) result.push({ id = "ndk", package = "ndk;28.2.13676358", path = paths.ndk + "/toolchains/llvm/prebuilt/linux-x86_64/bin/clang" })
    return result
}
M.report <- function(paths, emulator, native) {
    local checks = [], add = function(id, ok, detail, remedy = "") {
        checks.push({ id = id, ok = ok, detail = detail, remedy = ok ? "" : remedy })
    }
    local platform = strip(C.process(["uname", "-sm"]))
    local arch = E.host_arch()
    add("host", ["x86_64", "aarch64"].find(arch) != null, platform, "Android packaging supports Linux x86_64 and ARM64; Ubuntu 24.04 is the tested baseline.")
    if (native) add("native-host", arch == "x86_64", platform, "Native source builds require the Linux x86_64 NDK; use prebuilt native packages on ARM64.")
    if (arch == "aarch64") {
        local input = C.get(P.lock(), "arm64_tools")
        add("arm64-tools", input != null && P.ready(input), "ARM64 AAPT2 and zipalign", "Run sqgipkg setup --platform android --accept-licenses")
        local adb = E.adb()
        add("adb", adb != null && C.is_file(adb), adb == null ? "missing" : adb, "On Ubuntu: sudo apt install adb")
    }
    local java = C.is_file(paths.java + "/bin/javac") && C.is_file(paths.java + "/bin/java"), version = "missing"
    if (java) try { version = strip(C.process([paths.java + "/bin/javac", "-version"])); java = regexp("^javac (17|21)([. ].*)?$").match(version) } catch (error) { java = false; version = error.tostring() }
    add("jdk", java, paths.java + " (" + version + ")", "Install openjdk-21-jdk, or select a full JDK with --java-home DIR / JAVA_HOME.")
    foreach (program in ["curl", "unzip", "flock", "readelf", "timeout", "setsid"]) {
        local path = GLib.find_program_in_path(program)
        add(program, path != null, path == null ? "missing" : path, "On Ubuntu: sudo apt install curl unzip util-linux binutils coreutils")
    }
    add("schemas", C.is_file("/usr/bin/glib-compile-schemas"), "/usr/bin/glib-compile-schemas", "On Ubuntu: sudo apt install libglib2.0-bin")
    local xml = E.xmllint()
    add("xmllint", xml != null && C.is_file(xml), xml == null ? "missing" : xml, "On Ubuntu: sudo apt install libxml2-utils")
    foreach (item in M.components(paths, native)) {
        local ok = C.is_file(item.path)
        if (item.id == "ndk") ok = ok && C.get(E.properties(paths.ndk + "/source.properties"), "Pkg.Revision") == "28.2.13676358"
        add(item.id, ok, item.path, "Run sqgipkg setup --platform android " + (item.id == "ndk" ? "--native-tools " : "") + "--accept-licenses")
    }
    if (emulator) {
        add("emulator-host", arch == "x86_64", platform, "The bundled Android emulator requires Linux x86_64. Deploy to a phone from ARM64.")
        add("emulator", Emulator.ready(), Emulator.paths().emulator, "Run sqgipkg setup --platform android --emulator --accept-licenses")
        local kvm = false
        try { local info = Gio.File.new_for_path("/dev/kvm").query_info("access::can-read,access::can-write", Gio.FileQueryInfoFlags.none, null); kvm = info.get_attribute_boolean("access::can-read") && info.get_attribute_boolean("access::can-write") } catch (unused) {}
        add("kvm", kvm, "/dev/kvm", "Enable hardware virtualization and add your user to the kvm group, then log in again.")
    }
    if (native) {
        foreach (item in [["meson", "1.3.2"], ["valac", "Vala 0.56.16"], ["g-ir-scanner", "g-ir-scanner 1.80.1"]]) {
            local version = ""
            try { version = strip(C.process(["/usr/bin/" + item[0], "--version"])) } catch (unused) {}
            add(item[0], version == item[1], version == "" ? "missing" : version, "Use the Ubuntu 24.04 meson, valac and gobject-introspection packages.")
        }
        foreach (name in ["cmake", "ninja", "pkg-config", "python3", "dpkg-deb"])
            add("native-" + name, GLib.find_program_in_path(name) != null, name, "Install the corresponding Ubuntu 24.04 native build tools; libxml2-utils supplies xmllint.")
        add("debugfs", C.is_file("/usr/sbin/debugfs"), "/usr/sbin/debugfs", "Install e2fsprogs for desktop GI inspection.")
    }
    local ok = true; foreach (item in checks) if (!item.ok) ok = false
    return { protocol_version = 1, ok = ok, platform = "android", paths = paths, checks = checks,
        configuration = E.config_path(), sdk_release = "noble-android-r7", ndk_revision = "28.2.13676358" }
}
M.install <- function(paths, accept, emulator, offline, native = false) {
    if (emulator && E.host_arch() != "x86_64") throw "The bundled Android emulator requires Linux x86_64; deploy to a phone from ARM64"
    local check = M.report(paths, false, native)
    foreach (item in check.checks) if (!item.ok && ["platform", "build-tools", "platform-tools", "ndk", "arm64-tools"].find(item.id) == null)
        throw item.id + ": " + item.remedy
    local packages = []
    foreach (item in check.checks) if (!item.ok)
        foreach (component in M.components(paths, native)) if (component.id == item.id) packages.push(component.package)
    if (packages.len()) {
        if (offline) throw "Android SDK components are missing; setup cannot install them with --no-android-download"
        if (!accept) throw "Installing Android SDK components requires --accept-licenses after reviewing https://developer.android.com/studio/terms"
        if (packages.find("ndk;28.2.13676358") != null && paths.ndk != paths.android_sdk + "/ndk/28.2.13676358")
            throw "Selected external NDK is missing or incompatible; choose the SDK's ndk/28.2.13676358 directory or a valid --android-ndk"
        local input = P.lock().commandline_tools, manager = P.prepare(input, false) + "/" + input.probe
        C.mkdir(paths.android_sdk)
        local launcher = Gio.SubprocessLauncher.new(Gio.SubprocessFlags.stdin_pipe + Gio.SubprocessFlags.stdout_pipe + Gio.SubprocessFlags.stderr_pipe)
        launcher.setenv("JAVA_HOME", paths.java, true)
        local command = [manager, "--sdk_root=" + paths.android_sdk]; command.extend(packages)
        print("sqgipkg: installing " + C.concat(packages, ", ") + "\n")
        local child = launcher.spawnv(command), yes = ""; for (local i = 0; i < 100; i++) yes += "y\n"
        local result = child.communicate_utf8(yes, null)
        if (!child.get_successful()) throw "Android SDK installation failed:\n" + result[0] + result[1]
        local installed = M.report(paths, false, native)
        foreach (item in installed.checks) if (!item.ok && item.id != "arm64-tools")
            throw "Android SDK installation is incomplete; run setup --check for details:\n" + result[0] + result[1]
    }
    if (E.host_arch() == "aarch64") {
        local input = C.get(P.lock(), "arm64_tools")
        if (input == null) throw "This sqgipkg installation has no pinned ARM64 packaging tools"
        P.prepare(input, offline)
    }
    if (emulator && !Emulator.ready()) {
        if (!accept) throw "Preparing Google's Android emulator requires --accept-licenses after reviewing https://developer.android.com/studio/terms"
        Emulator.prepare(offline)
    }
    E.save(paths)
    T.gradle(offline)
    return M.report(paths, emulator, native)
}
M.run <- function(options) {
    local paths = E.paths(options), result
    if (options.check) result = M.report(paths, options.emulator, options.native)
    else {
        result = M.install(paths, options.accept, options.emulator, options.offline, options.native)
    }
    if (options.json) print(sqgi.json.stringify(result) + "\n")
    else {
        foreach (item in result.checks) {
            print((item.ok ? "  OK  " : "  NEED  ") + item.id + ": " + item.detail + "\n")
            if (!item.ok) print("        " + item.remedy + "\n")
        }
        if (result.ok) print(options.check ? "sqgipkg: Android setup is ready.\n" : "sqgipkg: Android setup saved. Create an app with sqgipkg init android-gtk4.\n")
    }
    return result.ok ? 0 : 1
}
return M
