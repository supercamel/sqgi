// C-JOB: CLI-backed build, with native process-tree ownership.
local GLib = import("GLib")
local Gio = import("Gio")
local B = import("backend.nut")
local A = import("artifacts.nut")
local runtime = GLib.getenv("SQGI_GUI_RUNTIME")
runtime = GLib.find_program_in_path(runtime == null ? "sqgi" : runtime)
local helper = runtime == null ? null : GLib.build_filenamev([GLib.path_get_dirname(runtime), "sqgipkg-runner"])
if (helper != null && !Gio.File.new_for_path(helper).query_exists(null)) helper = null
class Build {
    busy = false
    cancelled = false
    child = null
    cancel_path = null
    log_path = null
    tail = ""
    state = "No build started"
    revision = null
    outputs = null
    result_path = null
    result_error = null
    command_factory = null
    constructor(command = null) { command_factory = command == null ? B.build_command : command }
    function available() { return helper != null }
    function cancel() {
        if (!busy || cancelled) return
        Gio.File.new_for_path(cancel_path).replace_contents("cancel", null, false, Gio.FileCreateFlags.private, null)
        cancelled = true; state = "Cancelling build — waiting for child processes to stop…"
    }
    async function run(saved, directory, changed) {
        if (busy) throw "A build is already running"
        if (helper == null) throw "Build supervision is unavailable on this installation. Copy the command to build in a terminal."
        busy = true; cancelled = false; revision = saved; tail = ""; outputs = []; result_error = null; state = "Building selected outputs…"
        local log = null
        try {
            local folder = GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg-gui", "builds", GLib.uuid_string_random()])
            Gio.File.new_for_path(folder).make_directory_with_parents(null)
            cancel_path = GLib.build_filenamev([folder, "cancel"])
            log_path = GLib.build_filenamev([folder, "build.log"])
            Gio.File.new_for_path(GLib.build_filenamev([folder, "manifest.json"])).replace_contents(
                sqgi.json.stringify(saved), null, false, Gio.FileCreateFlags.private, null)
            log = Gio.File.new_for_path(log_path).create(Gio.FileCreateFlags.private, null)
            result_path = GLib.build_filenamev([folder, "result.json"])
            local argv = [helper, cancel_path, "--"]
            foreach (arg in command_factory(saved.path)) argv.push(arg)
            argv.push("--build-result"); argv.push(result_path)
            local launcher = Gio.SubprocessLauncher.new(Gio.SubprocessFlags.stdout_pipe | Gio.SubprocessFlags.stderr_merge)
            launcher.set_cwd(directory)
            child = launcher.spawnv(argv)
            local owned_path = result_path, self = this, digest = saved.sha256
            GLib.timeout_add(GLib.PRIORITY_DEFAULT, 300, function() {
                if (!self.busy || self.result_path != owned_path) return false
                if (self.cancelled) return false
                local next = null
                try { next = A.read_progress(owned_path, digest) } catch (_) {}
                if (next == null) next = "Building selected outputs…"
                if (self.state != next) { self.state = next; changed() }
                return true
            })
            changed()
            local stream = child.get_stdout_pipe()
            while (true) {
                local bytes = await stream.read_bytes_async(16384, GLib.PRIORITY_DEFAULT, null)
                if (bytes.get_size() == 0) break
                log.write_all(bytes.get_data(), null)
                tail += bytes.get_data().tostring()
                if (tail.len() > 65536) tail = tail.slice(tail.len() - 65536)
                changed()
            }
            await child.wait_async(null)
            local code = child.get_if_exited() ? child.get_exit_status() : 128 + child.get_term_sig()
            state = cancelled || code == 130 ? "Build cancelled" : code == 0 ?
                "Build command completed — package verification still required" : "Build failed (exit " + code + ") — see the log below"
            try {
                local reported = A.read_result(result_path, revision.sha256)
                outputs = reported.outputs
                if (!cancelled && code == 0 && reported.complete)
                    state = "Build completed — " + outputs.len() + " output(s) found. Runtime testing is still required."
                else if (!cancelled && code == 0) result_error = "The build did not report all selected outputs as complete."
            } catch (error) {
                if (code == 0 || Gio.File.new_for_path(result_path).query_exists(null)) result_error = "Outputs could not be verified: " + error
            }
            log.close(null); log = null; child = null; busy = false; changed()
            return code
        } catch (error) {
            // If log IO fails, still ask the supervisor to clean up and await it.
            if (child != null) {
                try { this.cancel() } catch (_) { child.send_signal(15) }
                await child.wait_async(null)
            }
            if (log != null) try { log.close(null) } catch (_) {}
            child = null; busy = false; state = "Build could not finish: " + error; changed()
            throw error
        }
    }
}
return { Build = Build }
