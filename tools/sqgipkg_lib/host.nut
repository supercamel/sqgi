local GLib = import("GLib")
local Gio = import("Gio")

// Host operations never interpret argv as shell text. Legacy build hooks are
// handled separately; native recipes use this API on every host.
class SqgiPkgHost {
    function host_windows() { return import("system").os.family == "windows" }

    function process(argv, cwd = null, env = null, capture = false) {
        local flags = capture ? Gio.SubprocessFlags.stdout_pipe + Gio.SubprocessFlags.stderr_pipe : Gio.SubprocessFlags.none
        local launcher = Gio.SubprocessLauncher.new(flags)
        if (cwd != null) launcher.set_cwd(cwd)
        if (env != null) foreach (key, value in env) {
            if (value == null) launcher.unsetenv(key)
            else launcher.setenv(key, value, true)
        }
        local child = launcher.spawnv(argv)
        local output = ["", ""]
        if (capture) output = child.communicate_utf8(null, null)
        else child.wait(null)
        return { status = child.get_if_exited() ? child.get_exit_status() : 128,
            stdout = output[0] == null ? "" : output[0], stderr = output[1] == null ? "" : output[1] }
    }

    function run_build_hook(command, cwd, description, env = null) {
        if (typeof(command) == "string") {
            if (this.host_windows()) this.fail("shell build hooks are not supported on Windows; use build_system or {argv: [...]}: " + command)
            this.run_process(["/bin/sh", "-c", command], description, cwd, env)
            return
        }
        local merged = env == null ? {} : clone env
        if ("env" in command) foreach (key, value in command.env) merged[key] <- value
        this.run_process(command.argv, description, cwd, merged)
    }

    function run_process(argv, description, cwd = null, env = null) {
        local result = this.process(argv, cwd, env)
        if (result.status != 0) this.fail(description + " failed (exit " + result.status + ")")
    }

    function process_output(argv, required = false) {
        try {
            local result = this.process(argv, null, null, true)
            if (result.status == 0) return result.stdout
            if (required) this.fail("command failed: " + argv[0] + ": " + result.stderr)
        } catch (e) { if (required) throw e }
        return null
    }

    function download_to(url, dest, description) {
        if (this.starts_with(url, "file://")) { this.copy_path(url.slice(7), dest); return }
        if (this.executable_available("curl")) this.run_process(["curl", "-L", "--fail", "--show-error", "--output", dest, url], description)
        else if (this.executable_available("wget")) this.run_process(["wget", "-O", dest, url], description)
        else this.fail("download requires curl or wget in PATH")
    }

    function is_directory(path) {
        return Gio.File.new_for_path(path).query_file_type(Gio.FileQueryInfoFlags.none, null) == Gio.FileType.directory
    }

    function children(path) {
        local out = []
        local enumerator = Gio.File.new_for_path(path).enumerate_children(
            "standard::name,standard::type,standard::is-symlink", Gio.FileQueryInfoFlags.nofollow_symlinks, null)
        while (true) {
            local info = enumerator.next_file(null)
            if (info == null) break
            out.push({ name = info.get_name(), path = GLib.build_filenamev([path, info.get_name()]),
                directory = info.get_file_type() == Gio.FileType.directory, symlink = info.get_is_symlink() })
        }
        enumerator.close(null)
        out.sort(function(a, b) { return a.name <=> b.name })
        return out
    }

    function find_files(path, pattern = "*", depth = -1, directories = false, prune = false) {
        local out = []
        if (!this.is_directory(path)) return out
        foreach (item in this.children(path)) {
            if (prune && item.directory && (item.name == ".git" || item.name == ".sqgipkg" ||
                    item.name == "build" || item.name == "dist" || item.name == "AppDir" ||
                    this.starts_with(item.name, "build-") || this.starts_with(item.name, "dist-") ||
                    this.ends_with(item.name, ".AppDir"))) continue
            if (item.directory == directories && GLib.pattern_match_simple(pattern, item.name)) out.push(item.path)
            if (item.directory && depth != 1 && !item.symlink)
                foreach (file in this.find_files(item.path, pattern, depth < 0 ? -1 : depth - 1, directories, prune)) out.push(file)
        }
        out.sort()
        return out
    }

    function remove_tree(path) {
        local file = Gio.File.new_for_path(path)
        local kind = file.query_file_type(Gio.FileQueryInfoFlags.nofollow_symlinks, null)
        if (kind == Gio.FileType.unknown) return
        if (kind == Gio.FileType.directory) foreach (item in this.children(path)) this.remove_tree(item.path)
        file.delete(null)
    }

    function copy_path(src, dest, depth = 0) {
        if (depth > 64) this.fail("directory copy exceeds 64 levels (possible symlink cycle): " + src)
        if (this.is_directory(src)) {
            local source = Gio.File.new_for_path(GLib.canonicalize_filename(src, null))
            local destination = Gio.File.new_for_path(GLib.canonicalize_filename(dest, null))
            if (destination.equal(source) || destination.has_prefix(source))
                this.fail("cannot copy a directory into itself: " + dest)
            this.mkdir_p(dest)
            foreach (item in this.children(src)) this.copy_path(item.path, GLib.build_filenamev([dest, item.name]), depth + 1)
        } else {
            this.mkdir_p(this.dirname(dest))
            // Dereference package symlinks: Windows payloads must not require
            // developer mode or administrator privileges to create links.
            Gio.File.new_for_path(src).copy(Gio.File.new_for_path(dest), Gio.FileCopyFlags.overwrite, null, null)
        }
    }
}
return { SqgiPkgHost = SqgiPkgHost }
