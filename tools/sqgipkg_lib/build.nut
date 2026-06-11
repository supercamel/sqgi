local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("doctor.nut")

class SqgiPkgBuild extends Base.SqgiPkgDoctor {
    function stage_appdir(opts) {
        local app_id = this.sanitize_id(opts.name)
        local package_name = this.package_basename(opts.name)
        local appdir = GLib.build_filenamev([opts.output_dir, package_name + ".AppDir"])

        this.run_shell("rm -rf " + this.shell_quote(appdir), "removing existing AppDir")
        this.mkdir_p(GLib.build_filenamev([appdir, "usr", "share", "sqgi", "app"]))

        if (opts.entry_type == "sqgi")
            this.copy_sqgi_runtime(opts, appdir)

        local staged_scripts = {}
        local entry_rel = this.stage_app_scripts(opts, appdir, staged_scripts)

        this.stage_native_projects(opts, appdir)
        if (opts.entry_type == "native")
            entry_rel = this.copy_linux_native_entry(opts, appdir)
        this.stage_extra_files(opts, appdir, staged_scripts)
        this.stage_linux_packages(opts, appdir)
        this.copy_linux_elf_dependencies(opts, appdir)
        this.postprocess_extra_files(appdir)
        this.write_linux_gtk_settings(opts, appdir)
        this.write_apprun(opts, appdir, entry_rel)
        this.write_desktop_file(appdir, app_id, opts.name)
        this.write_icon(appdir, app_id)

        return appdir
    }

    function run_linux_build_commands(opts) {
        local config = this.table_get(opts, "linux_current", null)
        local commands = this.array_copy(opts.linux.build)
        if (config != null)
            foreach (command in this.table_get(config, "build", [])) commands.push(command)
        if (commands.len() == 0) return

        local dir = opts.manifest_dir == "" ? GLib.get_current_dir() : opts.manifest_dir
        local env = this.linux_build_env_prefix(opts, this.command_list_contains(commands, "SQGI_SOURCE_DIR"))

        foreach (command in commands) {
            this.info("Linux " + opts.appimage_arch + " build: " + command)
            this.run_shell_in_dir(env + command, dir, "Linux " + opts.appimage_arch + " build")
        }
    }

    function build_appimage(opts) {
        this.mkdir_p(opts.output_dir)

        this.scan_project_imports(opts)
        this.apply_linux_package_defaults(opts)
        this.ensure_linux_deb_sysroot_packages(opts)
        this.prepare_linux_build_environment(opts)
        this.validate_linux_build_dir_state(opts)
        this.run_linux_build_commands(opts)

        local package_name = this.package_basename(opts.name)
        local appdir = this.stage_appdir(opts)
        local appimage = GLib.build_filenamev([opts.output_dir, package_name + ".AppImage"])

        local appimagetool = this.resolve_appimagetool(opts)

        this.info("building AppImage for " + opts.appimage_arch)
        local status = system("ARCH=" + this.shell_quote(opts.appimage_arch) + " " +
            this.shell_quote(appimagetool) + " " + this.shell_quote(appdir) + " " + this.shell_quote(appimage))
        if (status != 0) this.fail("building AppImage failed")
        this.require_elf_appimage_arch(appimage, opts.appimage_arch, "AppImage")

        this.print_report(opts, appdir, appimage)
        this.run_smoke_test(opts, appdir, appimage)

        if (!opts.keep_appdir) {
            this.run_shell("rm -rf " + this.shell_quote(appdir), "removing staged AppDir")
        } else {
            this.info("kept AppDir at " + appdir)
        }

        this.info("wrote " + appimage)
    }

    function build_selected_appimage(opts) {
        if (this.table_get(opts, "linux_current", null) != null || opts.linux.arches.len() == 0) {
            this.build_appimage(opts)
            return
        }

        local arch = this.normalize_appimage_arch(opts.appimage_arch)
        foreach (config in this.effective_linux_arches(opts)) {
            if (config.arch == arch) {
                this.build_appimage(this.clone_opts_for_linux_arch(opts, config, opts.output_dir))
                return
            }
        }

        this.build_appimage(opts)
    }

    function build_linux_sysroot(opts) {
        this.mkdir_p(opts.output_dir)

        this.scan_project_imports(opts)
        this.apply_linux_package_defaults(opts)
        this.ensure_linux_deb_sysroot_packages(opts)
        this.prepare_linux_build_environment(opts)
        if (this.linux_has_cross_build_work(opts))
            this.validate_linux_build_dir_state(opts)

        local sysroot = this.linux_current_sysroot(opts)
        local toolchain = this.linux_current_is_cross(opts) ? this.linux_cmake_toolchain_path(opts) : ""
        local cross_file = this.linux_current_is_cross(opts) ? this.linux_meson_cross_file_path(opts) : ""

        this.info("Linux sysroot ready")
        this.info("  target arch: " + this.linux_current_arch(opts))
        this.info("  Debian arch: " + this.linux_current_deb_arch(opts))
        this.info("  target triplet: " + this.linux_current_triplet(opts))
        this.info("  sysroot: " + (sysroot == "" ? "(host root)" : sysroot))
        this.info("  CMake toolchain: " + (toolchain == "" ? "(native)" : toolchain))
        this.info("  Meson cross file: " + (cross_file == "" ? "(native)" : cross_file))
        this.info("  pkg-config sysroot: " + sysroot)
        this.info("  pkg-config libdir: " + this.linux_pkg_config_libdir(opts))
        this.info("  SQGI_LINUX_ARCH=" + this.linux_current_arch(opts))
        this.info("  SQGI_LINUX_DEB_ARCH=" + this.linux_current_deb_arch(opts))
        this.info("  SQGI_LINUX_TRIPLET=" + this.linux_current_triplet(opts))
        this.info("  SQGI_LINUX_SYSROOT=" + sysroot)
        this.info("  SQGI_LINUX_PREFIX=/usr")
        this.info("  SQGI_LINUX_PREFIX_DIR=" + (sysroot == "" ? "/usr" : GLib.build_filenamev([sysroot, "usr"])))
        this.info("  SQGI_LINUX_INSTALL_PREFIX=/usr")
        this.info("  SQGI_LINUX_CMAKE_TOOLCHAIN=" + toolchain)
        this.info("  SQGI_LINUX_MESON_CROSS_FILE=" + cross_file)
    }

    function build_selected_linux_sysroot(opts) {
        if (this.table_get(opts, "linux_current", null) != null || opts.linux.arches.len() == 0) {
            this.build_linux_sysroot(opts)
            return
        }

        local arch = this.normalize_appimage_arch(opts.appimage_arch)
        foreach (config in this.effective_linux_arches(opts)) {
            if (config.arch == arch) {
                local linux_opts = this.clone_opts_for_linux_arch(opts, config, opts.output_dir)
                linux_opts.target = "linux-sysroot"
                this.build_linux_sysroot(linux_opts)
                return
            }
        }

        this.build_linux_sysroot(opts)
    }

    function build_windows_sysroot(opts) {
        this.mkdir_p(opts.output_dir)

        // Build only the Windows dependency/sysroot side of sqgipkg.  This is
        // useful for probes, CI setup, native extension development, and for
        // validating the Ubuntu -> Windows cross environment without staging an
        // application or building an installer.
        this.scan_project_imports(opts)
        this.apply_windows_package_defaults(opts)
        this.ensure_msys2_packages(opts)
        this.prepare_windows_cross_environment(opts)
        this.build_windows_native_dependencies(opts)

        local sysroot = this.windows_sysroot_root(opts)
        local prefix_dir = this.windows_sysroot_prefix_dir(opts)

        this.info("Windows sysroot ready")
        this.info("  MSYS2 root: " + sysroot)
        this.info("  MSYS2 prefix: " + opts.windows.msys2_prefix)
        this.info("  prefix dir: " + prefix_dir)
        this.info("  CMake toolchain: " + GLib.getenv("SQGI_WIN_CMAKE_TOOLCHAIN"))
        this.info("  Meson cross file: " + GLib.getenv("SQGI_MESON_CROSS_FILE"))
        this.info("  pkg-config sysroot: " + GLib.getenv("PKG_CONFIG_SYSROOT_DIR"))
        this.info("  pkg-config libdir: " + GLib.getenv("PKG_CONFIG_LIBDIR"))
        this.info("  SQGI_WINDOWS_SYSROOT=" + GLib.getenv("SQGI_WINDOWS_SYSROOT"))
        this.info("  SQGI_WINDOWS_PREFIX=" + GLib.getenv("SQGI_WINDOWS_PREFIX"))
        this.info("  SQGI_WINDOWS_PREFIX_DIR=" + GLib.getenv("SQGI_WINDOWS_PREFIX_DIR"))
    }

    function build_windows_dir(opts) {
        this.mkdir_p(opts.output_dir)
        local windir = this.stage_windows_dir(opts)
        this.print_report(opts, windir, null)
        this.info("wrote Windows dist directory " + windir)
    }

    function build_windows_nsis(opts) {
        this.mkdir_p(opts.output_dir)
        local windir = this.stage_windows_dir(opts)
        local script = this.write_nsis_script(opts, windir)
        local nsis = this.executable_path(opts.windows.nsis)

        this.print_report(opts, windir, null)

        if (nsis == null) {
            this.info("makensis not found; wrote NSIS script at " + script)
            this.info("run makensis from " + opts.output_dir + " to build the installer")
            return
        }

        this.info("building NSIS installer")
        this.run_shell_in_dir(this.shell_quote(nsis) + " " + this.shell_quote(this.basename(script)), opts.output_dir, "building NSIS installer")
        this.info("wrote " + GLib.build_filenamev([opts.output_dir, this.nsis_installer_name(opts, this.package_basename(opts.name))]))
    }

    function add_clean_path(paths, path) {
        if (path == null || path == "") return
        foreach (existing in paths)
            if (existing == path) return
        paths.push(path)
    }

    function path_is_within_dir(path, root) {
        path = this.strip_trailing_slashes(GLib.canonicalize_filename(this.abs_path(path), null))
        root = this.strip_trailing_slashes(GLib.canonicalize_filename(this.abs_path(root), null))
        return path == root || this.starts_with(path, root + "/")
    }

    function clean_abs_path(project_dir, path) {
        local abs = GLib.path_is_absolute(path)
            ? path
            : GLib.build_filenamev([project_dir, path])
        return GLib.canonicalize_filename(abs, null)
    }

    function clean_path(project_dir, path, label) {
        if (path == null || path == "") return
        local abs = this.clean_abs_path(project_dir, path)
        if (!this.path_exists(abs)) return
        if (!this.path_is_within_dir(abs, project_dir)) {
            this.info("skipping " + label + " outside project: " + abs)
            return
        }
        this.run_shell("rm -rf " + this.shell_quote(abs), "removing " + label)
        this.info("removed " + label + ": " + abs)
    }

    function clean_project(opts) {
        local project_dir = opts.manifest_dir == "" ? GLib.get_current_dir() : opts.manifest_dir
        local output_paths = []
        local build_paths = []
        local host_arch = this.normalize_appimage_arch(this.machine_arch())

        this.add_clean_path(output_paths, opts.output_dir)
        this.add_clean_path(output_paths, "dist")
        this.add_clean_path(output_paths, "dist-linux")
        this.add_clean_path(output_paths, "dist-windows")
        this.add_clean_path(output_paths, this.default_linux_output_dir(opts, host_arch))
        this.add_clean_path(output_paths, this.default_windows_output_dir(opts))

        this.add_clean_path(build_paths, opts.build_dir)
        this.add_clean_path(build_paths, "build")
        this.add_clean_path(build_paths, "build-win")
        this.add_clean_path(build_paths, this.default_linux_build_dir(opts))
        this.add_clean_path(build_paths, this.default_windows_build_dir(opts))
        this.add_clean_path(build_paths, opts.windows.build_dir)

        foreach (config in this.effective_linux_arches(opts)) {
            this.add_clean_path(output_paths, config.output != "" ? config.output : this.default_linux_output_dir(opts, config.arch))
            this.add_clean_path(build_paths, config.build_dir != "" ? config.build_dir : "build-linux-" + this.linux_arch_display_suffix(config.arch))
            this.add_clean_path(build_paths, "build-" + this.linux_arch_display_suffix(config.arch))
        }

        foreach (path in output_paths)
            this.clean_path(project_dir, path, "output")
        foreach (path in build_paths)
            this.clean_path(project_dir, path, "build directory")
    }

    function normalize_linux_arch_config(opts, config) {
        local arch = this.normalize_appimage_arch(this.table_get(config, "arch", opts.appimage_arch))
        local copy_dependencies = this.table_get(config, "copy_dependencies", null)
        local deb_download = this.table_get(config, "deb_download", null)
        local deb_refresh = this.table_get(config, "deb_refresh", null)
        return {
            arch = arch,
            package_arch = this.table_get(config, "package_arch", ""),
            build_dir = this.table_get(config, "build_dir", ""),
            output = this.table_get(config, "output", ""),
            sysroot = this.table_get(config, "sysroot", ""),
            deb_package_cache = this.table_get(config, "deb_package_cache", ""),
            deb_sysroot_cache = this.table_get(config, "deb_sysroot_cache", ""),
            deb_suite = this.table_get(config, "deb_suite", ""),
            deb_download = deb_download,
            deb_refresh = deb_refresh,
            entry_linux = this.table_get(config, "entry_linux", ""),
            cmake_toolchain = this.table_get(config, "cmake_toolchain", ""),
            meson_cross_file = this.table_get(config, "meson_cross_file", ""),
            build = this.table_get(config, "build", []),
            deb_packages = this.manifest_string_list(this.table_get(config, "deb_packages", [])),
            library_dirs = this.table_get(config, "library_dirs", []),
            copy_dependencies = copy_dependencies,
            libraries = this.table_get(config, "libraries", []),
            typelibs = this.table_get(config, "typelibs", []),
            files = this.table_get(config, "files", []),
            resources = this.table_get(config, "resources", []),
            gstreamer_plugins = this.table_get(config, "gstreamer_plugins", []),
            gsettings_schemas = this.table_get(config, "gsettings_schemas", []),
            gtk_data = this.table_get(config, "gtk_data", []),
            gio_modules = this.table_get(config, "gio_modules", []),
            gdk_pixbuf_loaders = this.table_get(config, "gdk_pixbuf_loaders", []),
            native_projects = this.table_get(config, "native_projects", []),
            inherit_native_projects = this.table_get(config, "inherit_native_projects", true)
        }
    }

    function effective_linux_arches(opts) {
        local out = []
        foreach (config in opts.linux.arches)
            out.push(this.normalize_linux_arch_config(opts, config))
        return out
    }

    function clone_opts_for_linux_arch(opts, config, output_dir) {
        local out = clone opts
        out.target = "appimage"
        out.output_dir = output_dir
        out.appimage_arch = config.arch
        out.report = this.new_report()
        out.linux_current <- config

        if (config.build_dir != "")
            out.build_dir = config.build_dir
        else if (config.arch != this.normalize_appimage_arch(this.machine_arch()))
            out.build_dir = "build-linux-" + this.linux_arch_display_suffix(config.arch)

        if (config.entry_linux != "") out.entry_linux = config.entry_linux

        out.linux = clone opts.linux
        out.linux.deb = clone opts.linux.deb
        if (config.deb_package_cache != "") out.linux.deb.package_cache = config.deb_package_cache
        if (config.deb_sysroot_cache != "") out.linux.deb.sysroot_cache = config.deb_sysroot_cache
        if (config.deb_suite != "" && !out.linux.deb.suite_forced)
            out.linux.deb.suite = config.deb_suite
        if (config.deb_download != null && out.linux.deb.download_forced == null)
            out.linux.deb.download = config.deb_download
        if (config.deb_refresh != null) out.linux.deb.refresh = config.deb_refresh
        out.linux.deb.packages = this.array_join(opts.linux.deb.packages, config.deb_packages)
        out.linux.library_dirs = this.array_join(opts.linux.library_dirs, config.library_dirs)
        out.linux.copy_dependencies = config.copy_dependencies == null ? opts.linux.copy_dependencies : config.copy_dependencies

        out.libraries = this.array_join(opts.libraries, config.libraries)
        out.typelibs = this.array_join(opts.typelibs, config.typelibs)
        out.files = this.array_join(opts.files, config.files)
        out.resources = this.array_join(opts.resources, config.resources)
        out.gstreamer_plugins = this.array_join(opts.gstreamer_plugins, config.gstreamer_plugins)
        out.gsettings_schemas = this.array_join(opts.gsettings_schemas, config.gsettings_schemas)
        out.gtk_data = this.array_join(opts.gtk_data, config.gtk_data)
        out.gio_modules = this.array_join(opts.gio_modules, config.gio_modules)
        out.gdk_pixbuf_loaders = this.array_join(opts.gdk_pixbuf_loaders, config.gdk_pixbuf_loaders)
        out.native_projects = config.inherit_native_projects
            ? this.array_join(opts.native_projects, config.native_projects)
            : this.array_copy(config.native_projects)

        return out
    }

    function build_all(opts) {
        this.info("building all distribution targets")

        local base_output = opts.output_dir
        local linux_arches = this.effective_linux_arches(opts)

        if (linux_arches.len() == 0) {
            opts.target = "appimage"
            opts.output_dir = base_output + "-linux-" + this.linux_arch_display_suffix(opts.appimage_arch)
            opts.report = this.new_report()
            this.build_selected_appimage(opts)
        } else {
            foreach (config in linux_arches) {
                local output_dir = config.output != ""
                    ? config.output
                    : (base_output + "-linux-" + this.linux_arch_display_suffix(config.arch))
                local linux_opts = this.clone_opts_for_linux_arch(opts, config, output_dir)
                this.build_appimage(linux_opts)
            }
        }

        opts.target = "win-nsis"
        opts.output_dir = base_output + "-windows-x86_64"
        opts.report = this.new_report()
        this.build_windows_nsis(opts)

        opts.output_dir = base_output
    }

}

return { SqgiPkgBuild = SqgiPkgBuild }
