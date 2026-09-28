local GLib = import("GLib")
local Base = import("msys2.nut")
local helper = GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null)) + "/ooblerg.py"

class SqgiPkgWindowsOoblerg extends Base.SqgiPkgWindowsMsys2 {
    function ooblerg_cache(opts) {
        return opts.windows.package_cache != "" ? opts.windows.package_cache :
            GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "ooblerg"])
    }
    function ooblerg_command(opts, action) {
        local python = this.executable_path("python3")
        if (python == null) python = this.executable_path("python")
        if (python == null) this.fail("Ooblerg package preparation requires Python 3")
        return [python, helper, action, "--cache", this.ooblerg_cache(opts)]
    }
    function ooblerg_catalog(refresh, target = null) {
        local opts = this.new_options(), argv = this.ooblerg_command(opts, "catalog")
        if (target != null) { argv.push("--target"); argv.push(target) }
        if (refresh) argv.push("--refresh")
        local result = this.process(argv, null, null, true)
        if (result.stdout == "") this.fail("Ooblerg catalog failed: " + result.stderr)
        return sqgi.json.parse(result.stdout)
    }
    function ensure_msys2_packages(opts) {
        if (opts.windows.package_source != "ooblerg") { base.ensure_msys2_packages(opts); return }
        local root = this.windows_sysroot_root(opts)
        local request = { root = root, repository = opts.windows.repo_url == "" ? "https://ooblerg.xyz/v1" : opts.windows.repo_url,
            cache = this.ooblerg_cache(opts), download = opts.windows.download_packages, refresh = opts.windows.refresh_packages,
            packages = opts.windows.packages, build_packages = opts.windows.build_packages, locked = null }
        if (this.locked_inputs != null) {
            request.locked = []
            foreach (key, value in this.locked_inputs) if (this.starts_with(key, "ooblerg:") && value.target == "x86_64-w64-mingw32") request.locked.push(value)
        }
        this.mkdir_p(opts.output_dir)
        local path = GLib.build_filenamev([opts.output_dir, ".ooblerg-request.json"]), output = path + ".result"
        this.write_file(path, sqgi.json.stringify(request))
        local argv = this.ooblerg_command(opts, "prepare")
        foreach (arg in ["--request", path, "--result", output]) argv.push(arg)
        this.info("preparing Ooblerg Windows packages in " + root)
        local status = this.process(argv).status
        local result = this.path_exists(output) ? sqgi.json.parse(this.read_file(output)) : null
        remove(path); if (this.path_exists(output)) remove(output)
        if (result == null) this.fail("Ooblerg preparation failed (exit " + status + ")")
        if (!result.ok) this.fail(result.diagnostics[0].message)
        if (status != 0) this.fail("Ooblerg preparation failed (exit " + status + ")")
        opts.windows.ooblerg_packages <- {}
        foreach (entry in result.packages) {
            opts.windows.ooblerg_packages[entry.metadata.name] <- entry.files
            local provenance = clone entry; delete provenance.files
            this.record_input("ooblerg:" + entry.metadata.name, provenance)
        }
        opts.windows.packages = result.runtime_packages
    }
    function stage_msys2_package(opts, windir, name) {
        if (opts.windows.package_source != "ooblerg") { base.stage_msys2_package(opts, windir, name); return }
        foreach (path in opts.windows.ooblerg_packages[name]) {
            local dest = this.windows_package_dest(path, "mingw64")
            if (this.starts_with(path, "mingw64/share/licenses/")) dest = path.slice(8)
            if (dest == null) continue
            this.copy_into_appdir(GLib.build_filenamev([opts.windows.msys2_root, path]), windir, dest, "Ooblerg " + name)
            this.report_windows_package_dest(opts, dest)
        }
    }
}
return { SqgiPkgWindowsOoblerg = SqgiPkgWindowsOoblerg }
