// C-PKG-06: all inspection crosses the real CLI boundary; no build imports.
local GLib = import("GLib")
local Gio = import("Gio")
local root = GLib.path_get_dirname(GLib.path_get_dirname(GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null))))
local runtime = GLib.getenv("SQGI_GUI_RUNTIME")
runtime = GLib.find_program_in_path(runtime == null ? "sqgi" : runtime)
local cli = GLib.build_filenamev([root, "sqgipkg"])
if (!Gio.File.new_for_path(cli).query_exists(null)) cli = GLib.build_filenamev([root, "sqgipkg.nut"])
function command(action, path) { return ["sqgipkg", action, "--manifest", path] }
function printable(argv) {
    local windows = import("system").os.name.tolower().find("windows") != null
    local out = windows ? "&" : ""
    foreach (arg in argv) {
        local quoted = GLib.shell_quote(arg)
        if (windows) {
            quoted = "'"
            foreach (ch in arg) quoted += ch == 39 ? "''" : format("%c", ch)
            quoted += "'"
        }
        out += (out == "" ? "" : " ") + quoted
    }
    return out
}
class Inspection {
    child = null
    cancelled = false
    busy = false
    async function run(action, text, base_dir) {
        if (busy) throw "An inspection is already running"
        if (action != "check" && action != "explain" && action != "describe") throw "Only local inspection is available"
        if (runtime == null) throw "Cannot locate SQGI; set SQGI_GUI_RUNTIME"
        busy = true; cancelled = false
        try {
            local argv = [runtime, cli, action, "--json"]
            if (action != "describe") foreach (arg in ["--manifest", "-", "--base-dir", base_dir]) argv.push(arg)
            local launcher = Gio.SubprocessLauncher.new(Gio.SubprocessFlags.stdin_pipe | Gio.SubprocessFlags.stdout_pipe | Gio.SubprocessFlags.stderr_pipe)
            launcher.set_cwd(base_dir)
            child = launcher.spawnv(argv)
            local output = await child.communicate_utf8_async(text, null)
            if (cancelled) throw "Inspection cancelled"
            local result = null
            try { result = sqgi.json.parse(output[0]) } catch (_) { throw "sqgipkg returned invalid inspection output: " + output[1] }
            if (!("protocol_version" in result) || result.protocol_version != 1) throw "Unsupported sqgipkg protocol"
            if (!child.get_successful() && result.ok) throw "sqgipkg exited unsuccessfully"
            busy = false; child = null
            return result
        } catch (e) { busy = false; child = null; throw e }
    }
    function cancel() { if (child != null && busy) { cancelled = true; child.force_exit() } }
}
return { Inspection = Inspection, command = command, printable = printable }
