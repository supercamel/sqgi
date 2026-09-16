local GLib = import("GLib")
local Gio = import("Gio")
local Host = import("host.nut")

class SqgiPkgProvenance extends Host.SqgiPkgHost {
    active_inputs = null
    locked_inputs = null

    function file_sha256(path) {
        local stream = Gio.File.new_for_path(path).read(null)
        local checksum = GLib.Checksum.new(GLib.ChecksumType.sha256)
        while (true) {
            local bytes = stream.read_bytes(65536, null)
            if (bytes.get_size() == 0) break
            checksum.update(bytes.get_data(), bytes.get_size())
        }
        stream.close(null)
        return checksum.get_string()
    }

    function lock_path(opts) {
        return GLib.build_filenamev([opts.manifest_dir == "" ? GLib.get_current_dir() : opts.manifest_dir, "sqgipkg.lock.json"])
    }

    function input_target(opts) {
        return this.starts_with(opts.target, "win-") ? "windows-" + opts.windows.msys2_prefix : "linux-" + opts.appimage_arch
    }

    function begin_inputs(opts) {
        this.active_inputs = {}
        this.locked_inputs = null
        if (opts.locked && opts.write_lock) this.fail("--locked and --write-lock cannot be combined")
        if (!opts.locked) return
        local path = this.lock_path(opts)
        if (!this.path_exists(path)) this.fail("lockfile missing; build once with --write-lock")
        local lock = sqgi.json.parse(this.read_file(path))
        if (this.table_get(lock, "version", 0) != 1) this.fail("unsupported lockfile version")
        if (opts.manifest == "" || lock.manifest_sha256 != this.file_sha256(this.abs_path(opts.manifest)))
            this.fail("manifest changed since lockfile was written; review and rebuild with --write-lock")
        local target = this.input_target(opts)
        if (!(target in lock.targets)) this.fail("lockfile has no target " + target)
        this.locked_inputs = lock.targets[target]
    }

    function record_input(key, value) {
        if (this.active_inputs == null) return
        if (this.locked_inputs != null) {
            if (!(key in this.locked_inputs)) this.fail("unlocked build input: " + key)
            local expected = this.locked_inputs[key]
            local field = "commit" in value ? "commit" : "sha256"
            if (!(field in expected) || value[field] != expected[field]) this.fail("locked input changed: " + key)
        }
        this.active_inputs[key] <- value
    }

    function pin_source(project) {
        if (this.locked_inputs == null || project.repo == null || project.repo == "") return
        local key = "source:" + project.name
        if (!(key in this.locked_inputs)) this.fail("unlocked source: " + project.name)
        project.ref = this.locked_inputs[key].commit
        project.branch = null
        project.update = false
    }

    function record_source(project) {
        if (this.active_inputs == null || project.repo == null || project.repo == "") return
        local commit = this.replace_char(this.replace_char(this.process_output(["git", "-C", project.dir, "rev-parse", "HEAD"], true), "\n", ""), "\r", "")
        local dirty = this.process_output(["git", "-C", project.dir, "status", "--porcelain", "--untracked-files=no"], true)
        if (this.locked_inputs != null && dirty.len()) this.fail("locked source has local modifications: " + project.name)
        this.record_input("source:" + project.name, { commit = commit, repo = project.repo, dirty = dirty.len() > 0 })
    }

    function finish_inputs(opts, artifact) {
        if (this.active_inputs == null) return
        if (this.locked_inputs != null) foreach (key, value in this.locked_inputs)
            if (!(key in this.active_inputs)) this.fail("locked input was not used: " + key)
        local report = { target = this.input_target(opts), artifact = this.abs_path(artifact),
            host = import("system").os.name, inputs = this.active_inputs }
        if (!this.is_directory(artifact)) report.artifact_sha256 <- this.file_sha256(artifact)
        this.write_file(GLib.build_filenamev([opts.output_dir, "sqgipkg-build.json"]), sqgi.json.stringify(report) + "\n")
        if (!opts.write_lock) return
        if (opts.manifest == "") this.fail("--write-lock requires a manifest")
        foreach (key, input in this.active_inputs)
            if (this.table_get(input, "dirty", false)) this.fail("cannot lock modified source: " + key)
        local path = this.lock_path(opts)
        local digest = this.file_sha256(this.abs_path(opts.manifest))
        local lock = { version = 1, manifest_sha256 = digest, targets = {} }
        if (this.path_exists(path)) {
            local old = sqgi.json.parse(this.read_file(path))
            if (this.table_get(old, "manifest_sha256", "") == digest) lock = old
        }
        lock.targets[this.input_target(opts)] <- this.active_inputs
        this.write_file(path + ".tmp", sqgi.json.stringify(lock) + "\n")
        Gio.File.new_for_path(path + ".tmp").move(Gio.File.new_for_path(path), Gio.FileCopyFlags.overwrite, null, null)
        this.info("wrote " + path)
    }
}
return { SqgiPkgProvenance = SqgiPkgProvenance }
