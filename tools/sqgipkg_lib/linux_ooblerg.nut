local GLib = import("GLib")
local Base = import("linux_deps.nut")
class SqgiPkgLinuxOoblerg extends Base.SqgiPkgLinuxDeps {
    function linux_ooblerg_seeds(opts) {
        local runtime = clone opts.linux.ooblerg_packages, build = []
        foreach (project in opts.native_projects) {
            local name = this.table_get(project, "linux_package", "")
            if (name == "") continue
            if (project.name == opts.entry_project) this.fail("The application entry recipe cannot be replaced by linux_package")
            this.append_unique(project.stage ? runtime : build, name)
        }
        return { packages = runtime, build_packages = build }
    }
    function apply_linux_ooblerg_defaults(opts) {
        local seeds = this.linux_ooblerg_seeds(opts)
        if (!seeds.packages.len() && !seeds.build_packages.len()) return
        if (opts.linux.deb.suite != "" && opts.linux.deb.suite != "noble")
            this.fail("Linux Ooblerg packages use Ubuntu 24.04/noble. Select suite noble or use the local/Git source recipe without Ooblerg.")
        opts.linux.deb.suite = "noble"
        if (opts.linux.deb.download_forced == null && !("ooblerg_download" in opts.linux) && this.linux_current_sysroot(opts) == "")
            opts.linux.deb.download = true
    }
    function prepare_linux_ooblerg(opts) {
        local seeds = this.linux_ooblerg_seeds(opts)
        if (!seeds.packages.len() && !seeds.build_packages.len()) return
        local target = this.linux_current_triplet(opts)
        local root = GLib.build_filenamev([this.abs_path(opts.output_dir), "_ooblerg-" + target])
        local request = { root = root, target = target,
            repository = this.strip_trailing_slashes(opts.linux.ooblerg_repository) + "/" + target + "/v1",
            cache = GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "ooblerg"]),
            download = opts.linux.deb.download_forced == null ? this.table_get(opts.linux, "ooblerg_download", true) : opts.linux.deb.download_forced,
            refresh = opts.linux.deb.refresh, packages = seeds.packages, build_packages = seeds.build_packages, locked = null }
        local prefix = "ooblerg:" + target + ":"
        if (this.locked_inputs != null) {
            request.locked = []
            foreach (key, value in this.locked_inputs) if (this.starts_with(key, prefix)) request.locked.push(value)
        }
        local input = GLib.build_filenamev([opts.output_dir, ".linux-ooblerg-request.json"]), output = input + ".result"
        this.write_file(input, sqgi.json.stringify(request))
        local argv = this.ooblerg_command(opts, "prepare")
        foreach (arg in ["--request", input, "--result", output]) argv.push(arg)
        local status = this.process(argv).status
        local result = this.path_exists(output) ? sqgi.json.parse(this.read_file(output)) : null
        remove(input); if (this.path_exists(output)) remove(output)
        if (result == null) this.fail("Linux Ooblerg preparation failed (exit " + status + ")")
        if (!result.ok) this.fail(result.diagnostics[0].message)
        if (status != 0) this.fail("Linux Ooblerg preparation failed (exit " + status + ")")
        opts.linux_ooblerg <- { root = root, packages = result.packages, runtime_packages = result.runtime_packages, build_packages = ["libglib2.0-dev"] }
        foreach (entry in result.packages) {
            local provenance = clone entry; delete provenance.files
            this.record_input(prefix + entry.metadata.name, provenance)
        }
        // Published GObject bundles can omit GLib from their .pc Requires.
        foreach (module in result.required_modules) {
            local package = this.linux_pkg_config_module_package(module, opts)
            if (package != null) this.append_unique(opts.linux_ooblerg.build_packages, package)
            else this.report_warn(opts, "Ooblerg development dependency " + module + " needs its Ubuntu package in linux.packages if not already supplied by the SDK")
        }
    }
    function compose_linux_ooblerg(opts) {
        if (!("linux_ooblerg" in opts)) return
        if (!("native_sdk" in opts)) this.fail("Linux Ooblerg requires a private Ubuntu 24.04 SDK; enable Linux package downloads or supply linux.sysroot")
        local argv = this.native_sdk_command()
        foreach (arg in ["overlay", "--root", opts.native_sdk, "--package-root", opts.linux_ooblerg.root]) argv.push(arg)
        this.run_process(argv, "adding Ooblerg development files to private Linux SDK")
    }
    function stage_linux_ooblerg(opts, appdir) {
        if (!("linux_ooblerg" in opts)) return
        foreach (entry in opts.linux_ooblerg.packages) {
            if (!this.array_contains(opts.linux_ooblerg.runtime_packages, entry.metadata.name)) continue
            foreach (path in entry.files) {
                if (this.linux_development_file(path)) continue
                local source = GLib.build_filenamev([opts.linux_ooblerg.root, path]), dest = GLib.build_filenamev([appdir, path])
                if (this.path_exists(dest) && this.file_sha256(dest) != this.file_sha256(source))
                    this.fail("Ooblerg runtime file conflicts with another package/source recipe: " + path)
                this.copy_into_appdir(source, appdir, path, "Linux Ooblerg " + entry.metadata.name)
                if (this.ends_with(path, ".typelib")) this.report_inc(opts, "typelibs")
                if (this.ends_with(path, ".so") || path.find(".so.") != null) this.report_inc(opts, "libraries")
            }
        }
    }
}
return { SqgiPkgLinuxOoblerg = SqgiPkgLinuxOoblerg }
