// Translate the prototype launcher at the SQGI boundary. Application work uses
// the normal CLI, manifest resolver and Android backend after this conversion.
local C = import("common.nut"), GLib = import("GLib"), Gio = import("Gio"), M = {}
M.normalize <- function(args, options) {
    local commands = ["init", "check", "explain", "preview", "build", "bundle", "install", "deploy", "run", "logs", "sync", "watch", "reset", "migrate"]
    if (!args.len() || ["help", "--help", "-h"].find(args[0]) != null) return null
    local command = args[0]
    if (commands.find(command) == null) throw "Unknown legacy Android command: " + command
    local forwarded = [], values = {}, positional = [], producer = null, project = null
    for (local i = 1; i < args.len(); i++) {
        local arg = args[i]
        if (arg == "--help" || arg == "-h") return null
        if (arg == "--") {
            for (i++; i < args.len(); i++) positional.push(args[i])
            break
        }
        if (!C.starts(arg, "--")) { positional.push(arg); continue }
        local equal = arg.find("="), key = equal == null ? arg.slice(2) : arg.slice(2, equal)
        local value = equal == null ? null : arg.slice(equal + 1)
        if (key == "sqgi") throw "Use sqgipkg preview with the desired SQGI installation on PATH; the legacy --sqgi override is not supported"
        if (key == "abi") key = "arch"
        if (key == "id") key = "app-id"
        local special = ["project", "producer-root"].find(key) != null
        if (!special && !(key in options)) throw "Unknown Android compatibility option: --" + key
        local flag = !special && options[key].kind == GLib.OptionArg.none
        if (flag && value != null) throw "--" + key + " does not take a value"
        if (!flag && value == null) {
            if (++i >= args.len()) throw "--" + key + " requires a value"
            value = args[i]
        }
        if (key in values) throw "Repeated Android compatibility option: --" + key
        values[key] <- flag ? true : value
        if (key == "producer-root") producer = C.absolute(value)
        else if (key == "project") project = C.absolute(value)
        else { forwarded.push("--" + key); if (!flag) forwarded.push(value) }
    }
    if (command == "init") {
        if (project != null || "manifest" in values || positional.len() != 1) throw "Use sqgi-android init DIR --id org.example.app"
        foreach (key, unused in values) if (["app-id", "name", "producer-root"].find(key) == null) throw "Android init cannot use --" + key
        if (!("app-id" in values)) throw "Android init requires --id (or --app-id)"
        local directory = C.absolute(positional[0])
        return { args = ["init", "android-gtk4"].extend(forwarded), directory = directory, create = true }
    }
    if (positional.len()) throw "Use --project DIR or --manifest FILE; positional arguments are not accepted"
    if (project != null && "manifest" in values) throw "Choose --project or --manifest, not both"
    if (project == null) project = producer == null ? GLib.get_current_dir() : producer + "/examples/gtk"
    local manifest = "manifest" in values ? C.absolute(values.manifest) : project + "/sqgipkg.json"
    if (command == "migrate") {
        if (!("from-sqgi" in values)) forwarded.extend(["--from-sqgi", project + "/sqgi.json"])
        return { args = ["migrate"].extend(forwarded), directory = GLib.get_current_dir(), create = false }
    }
    if (!C.is_file(manifest)) {
        local legacy = project + "/sqgi.json"
        if (C.is_file(legacy)) throw "Legacy project needs migration: sqgipkg migrate --from-sqgi " + GLib.shell_quote(legacy)
        throw "No sqgipkg manifest: " + manifest
    }
    if (!("manifest" in values)) forwarded.extend(["--manifest", manifest])
    if (!("platform" in values)) forwarded.extend(["--platform", "android"])
    if (!("arch" in values)) forwarded.extend(["--arch", "x86_64"])
    if ((command == "build" || command == "bundle" || command == "deploy" || command == "install") && !("target" in values))
        forwarded.extend(["--target", command == "bundle" ? "android-aab" : "android-apk"])
    // The producer launcher historically used its exported SDK and dist/. Keep
    // those defaults only for that entry point; authored SDK/repository choices
    // and explicit CLI overrides continue to win.
    if (producer != null) {
        if (!("output" in values)) forwarded.extend(["--output", producer + "/dist"])
        local config = sqgi.json.parse(C.read(manifest)), android = C.get(C.get(config, "platforms", {}), "android", {})
        if (!("android-sdk" in values) && !("android-repository" in values) &&
            !("sdk_path" in android) && !("repository" in android) && C.is_dir(producer + "/sdk"))
            forwarded.extend(["--android-sdk", producer + "/sdk"])
        if (!("android-ndk" in values) && GLib.getenv("ANDROID_NDK_HOME") == null &&
            C.is_file(producer + "/.cache/tools/android-ndk-r28c/source.properties"))
            forwarded.extend(["--android-ndk", producer + "/.cache/tools/android-ndk-r28c"])
    }
    local followup = null
    if (command == "deploy") {
        // The prototype deploy command installs an existing APK and starts it.
        // Preserve demo/run.sh's build-if-missing behavior; normal sqgipkg deploy
        // continues to build, install and run in one command.
        followup = ["run"]
        for (local i = 0; i < forwarded.len(); i++) {
            if (forwarded[i] == "--artifact") { i++; continue }
            followup.push(forwarded[i])
        }
    }
    return { args = [command == "bundle" ? "build" : command == "deploy" ? "install" : command].extend(forwarded),
        next_args = followup, directory = GLib.get_current_dir(), create = false }
}
M.run <- function(args, options, cli) {
    local invocation = M.normalize(args, options)
    if (invocation == null) {
        print("Usage: sqgi-android COMMAND [options]\n\n" +
            "Application commands now run through sqgipkg.\n" +
            "  init DIR --id org.example.app   Create a GTK starter\n" +
            "  migrate --project DIR          Convert sqgi.json without overwriting files\n" +
            "  check / explain / preview      Inspect or preview the project\n" +
            "  build / bundle                 Build APK/AAB through sqgipkg\n" +
            "  deploy                         Install the existing APK and start it\n" +
            "  install / run / logs           Install, restart, or read logs\n" +
            "  sync / watch / reset           Update sources or restore packaged sources\n\n" +
            "--project DIR selects sqgipkg.json; --abi aliases --arch (default x86_64).\n" +
            "Use sqgipkg --help-all for shared options. Maintainer SDK builds stay in SqgiAndroid.\n")
        return 0
    }
    if (invocation.create) C.mkdir(invocation.directory)
    local launcher = Gio.SubprocessLauncher.new(Gio.SubprocessFlags.none)
    launcher.set_cwd(invocation.directory)
    local run = function(arguments) {
        local child = launcher.spawnv([GLib.file_read_link("/proc/self/exe"), C.absolute(cli)].extend(arguments))
        child.wait(null)
        return child.get_if_exited() ? child.get_exit_status() : 1
    }
    local status = run(invocation.args)
    if (status == 0 && C.get(invocation, "next_args") != null) status = run(invocation.next_args)
    return status
}
return M
