local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("msys2.nut")

class SqgiPkgWindowsStaging extends Base.SqgiPkgWindowsMsys2 {
    function stage_windows_extra_files(opts, windir, staged_scripts) {
        foreach (spec in opts.includes)
            this.copy_or_compile_include_spec(opts, spec, windir, staged_scripts)

        foreach (path in opts.resources) {
            this.copy_to_dir(path, windir, GLib.build_filenamev(["share", "sqgi", "app", "resources"]), "Windows resource")
            this.report_inc(opts, "resources")
        }

        foreach (path in opts.windows.libraries)
            this.copy_windows_library(opts, path, windir)
        foreach (path in opts.windows.typelibs)
            this.copy_windows_typelib(opts, path, windir)
        foreach (spec in opts.windows.files)
            this.copy_file_spec(opts, spec, windir)
        foreach (package_name in opts.windows.packages)
            this.stage_msys2_package(opts, windir, package_name)
    }

    function stage_app_scripts(opts, appdir, staged_scripts) {
        local main_script_abs = ""
        local entry_rel = null

        if (opts.script != "") {
            main_script_abs = this.abs_path(opts.script)
            if (!this.path_exists(main_script_abs)) this.fail("script not found: " + opts.script)
            local app_root = this.app_script_root_rel(opts)
            entry_rel = this.stage_script_file(
                opts,
                appdir,
                main_script_abs,
                GLib.build_filenamev([app_root, "main.nut"]),
                "main script",
                staged_scripts,
                this.dirname(main_script_abs),
                app_root
            )
        }

        foreach (spec in opts.scripts)
            this.add_script_spec(opts, appdir, spec, staged_scripts)

        foreach (dir in opts.script_dirs)
            this.add_script_dir(opts, appdir, dir, main_script_abs, staged_scripts)

        return entry_rel
    }

    function stage_windows_scripts(opts, windir, staged_scripts) {
        local main_script_abs = ""
        local entry_rel = null

        if (opts.script != "") {
            main_script_abs = this.abs_path(opts.script)
            if (!this.path_exists(main_script_abs)) this.fail("script not found: " + opts.script)
            local app_root = this.app_script_root_rel(opts)
            entry_rel = this.stage_script_file(
                opts,
                windir,
                main_script_abs,
                GLib.build_filenamev([app_root, "main.nut"]),
                "main script",
                staged_scripts,
                this.dirname(main_script_abs),
                app_root
            )
        }

        foreach (spec in opts.scripts)
            this.add_script_spec(opts, windir, spec, staged_scripts)

        foreach (dir in opts.script_dirs)
            this.add_script_dir(opts, windir, dir, main_script_abs, staged_scripts)

        return entry_rel
    }

    function windows_batch_set(name, value) {
        if (value == null || value == "") return ""
        return "set \"" + name + "=" + value + "\"\r\n"
    }

    function windows_effective_gtk_theme(opts) {
        return opts.windows.gtk_theme != "" ? opts.windows.gtk_theme : opts.gtk_theme
    }

    function windows_effective_gtk_icon_theme(opts) {
        return opts.windows.gtk_icon_theme != "" ? opts.windows.gtk_icon_theme : opts.gtk_icon_theme
    }

    function windows_effective_gtk_font_name(opts) {
        return opts.windows.gtk_font_name != "" ? opts.windows.gtk_font_name : opts.gtk_font_name
    }

    function windows_effective_gtk_prefer_dark(opts) {
        return opts.windows.gtk_prefer_dark || opts.gtk_prefer_dark
    }

    function windows_effective_gdk_backend(opts) {
        return opts.windows.gdk_backend != "" ? opts.windows.gdk_backend : opts.gdk_backend
    }

    function write_windows_gtk_settings(opts, windir) {
        local gtk_theme = this.windows_effective_gtk_theme(opts)
        local gtk_icon_theme = this.windows_effective_gtk_icon_theme(opts)
        local gtk_font_name = this.windows_effective_gtk_font_name(opts)
        local gtk_prefer_dark = this.windows_effective_gtk_prefer_dark(opts)
        local has_settings = this.has_gtk_settings(gtk_theme, gtk_icon_theme, gtk_font_name, gtk_prefer_dark)
        if (!has_settings) return

        local contents = this.gtk_settings_contents(gtk_theme, gtk_icon_theme, gtk_font_name, gtk_prefer_dark)

        foreach (rel in [
            GLib.build_filenamev(["etc", "gtk-4.0", "settings.ini"]),
            GLib.build_filenamev(["etc", "gtk-3.0", "settings.ini"]),
            GLib.build_filenamev(["share", "gtk-4.0", "settings.ini"]),
            GLib.build_filenamev(["share", "gtk-3.0", "settings.ini"])
        ])
            this.write_gtk_settings_file(windir, rel, contents)
    }

    function windows_launcher_exec_line(opts, entry_rel) {
        local entry = this.windows_path(entry_rel)
        if (opts.entry_type == "native")
            return "\"%HERE%" + entry + "\" %*\r\n"
        return "\"%HERE%bin\\sqgi.exe\" \"%HERE%" + entry + "\" %*\r\n"
    }

    function write_windows_launcher(opts, windir, app_name, entry_rel) {
        local path = GLib.build_filenamev([windir, app_name + ".bat"])
        local gtk_theme = this.windows_effective_gtk_theme(opts)
        local gdk_backend = this.windows_effective_gdk_backend(opts)
        this.write_file(path,
            "@echo off\r\n" +
            "set \"HERE=%~dp0\"\r\n" +
            "set \"SQGI_APPDIR=%HERE%\"\r\n" +
            "set \"SQGI_APP_SHARE=%HERE%share\\sqgi\\app\"\r\n" +
            "set \"SQGI_APP_RESOURCES=%HERE%share\\sqgi\\app\\resources\"\r\n" +
            "set \"PATH=%HERE%bin;%HERE%lib;%PATH%\"\r\n" +
            "set \"XDG_DATA_DIRS=%HERE%share;%XDG_DATA_DIRS%\"\r\n" +
            "set \"XDG_CONFIG_DIRS=%HERE%etc;%XDG_CONFIG_DIRS%\"\r\n" +
            "set \"GTK_DATA_PREFIX=%HERE%\"\r\n" +
            "set \"GTK_EXE_PREFIX=%HERE%\"\r\n" +
            "set \"GTK_PATH=%HERE%lib\\gtk-4.0;%HERE%lib\\gtk-3.0;%GTK_PATH%\"\r\n" +
            this.windows_batch_set("GTK_THEME", gtk_theme) +
            this.windows_batch_set("GDK_BACKEND", gdk_backend) +
            "set \"GI_TYPELIB_PATH=%HERE%lib\\girepository-1.0;%GI_TYPELIB_PATH%\"\r\n" +
            "set \"GST_PLUGIN_PATH=%HERE%lib\\gstreamer-1.0;%GST_PLUGIN_PATH%\"\r\n" +
            "set \"GIO_EXTRA_MODULES=%HERE%lib\\gio\\modules;%GIO_EXTRA_MODULES%\"\r\n" +
            "set \"GDK_PIXBUF_MODULEDIR=%HERE%lib\\gdk-pixbuf-2.0\\2.10.0\\loaders\"\r\n" +
            this.windows_launcher_exec_line(opts, entry_rel))
    }

    function stage_windows_dir(opts) {
        local package_name = this.package_basename(opts.name)
        local windir = GLib.build_filenamev([opts.output_dir, package_name])

        this.scan_project_imports(opts)
        this.apply_windows_package_defaults(opts)
        this.ensure_msys2_packages(opts)
        this.prepare_windows_cross_environment(opts)
        this.build_windows_native_dependencies(opts)
        this.run_windows_build(opts)
        this.run_shell("rm -rf " + this.shell_quote(windir), "removing existing Windows dist directory")
        this.mkdir_p(GLib.build_filenamev([windir, "share", "sqgi", "app"]))

        if (opts.entry_type == "sqgi")
            this.copy_windows_sqgi_runtime(opts, windir)

        local staged_scripts = {}
        local entry_rel = this.stage_windows_scripts(opts, windir, staged_scripts)

        this.stage_windows_native_dependencies(opts, windir)
        this.stage_windows_native_projects(opts, windir)
        if (opts.entry_type == "native")
            entry_rel = this.copy_windows_native_entry(opts, windir)
        this.stage_windows_extra_files(opts, windir, staged_scripts)
        this.resolve_windows_dll_dependencies(opts, windir)
        this.verify_windows_binary_arches(opts, windir)
        this.write_windows_gtk_settings(opts, windir)
        this.write_windows_launcher(opts, windir, package_name, entry_rel)

        return windir
    }

}

return { SqgiPkgWindowsStaging = SqgiPkgWindowsStaging }
