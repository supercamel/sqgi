local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("linux_deps.nut")

class SqgiPkgAppImage extends Base.SqgiPkgLinuxDeps {
    function run_optional_tool(command, description) {
        local status = system(command)
        if (status != 0) this.info(description + " skipped or failed")
    }

    function postprocess_extra_files(appdir) {
        local schema_dir = GLib.build_filenamev([appdir, "usr", "share", "glib-2.0", "schemas"])
        if (this.path_exists(schema_dir) &&
            this.executable_available("glib-compile-schemas") &&
            this.shell_has_matches(GLib.build_filenamev([schema_dir, "*.xml"]))) {
            this.run_optional_tool(
                "glib-compile-schemas " + this.shell_quote(schema_dir),
                "GSettings schema compilation"
            )
        }

        local gio_dir = GLib.build_filenamev([appdir, "usr", "lib", "gio", "modules"])
        if (this.path_exists(gio_dir) && this.executable_available("gio-querymodules")) {
            this.run_optional_tool(
                "gio-querymodules " + this.shell_quote(gio_dir),
                "GIO module cache generation"
            )
        }

        local pixbuf_dir = GLib.build_filenamev([appdir, "usr", "lib", "gdk-pixbuf-2.0", "2.10.0", "loaders"])
        local pixbuf_cache = GLib.build_filenamev([appdir, "usr", "lib", "gdk-pixbuf-2.0", "2.10.0", "loaders.cache"])
        if (this.path_exists(pixbuf_dir) &&
            this.executable_available("gdk-pixbuf-query-loaders") &&
            this.shell_has_matches(GLib.build_filenamev([pixbuf_dir, "*.so"]))) {
            this.run_optional_tool(
                "gdk-pixbuf-query-loaders " + this.shell_quote(pixbuf_dir) + "/* > " + this.shell_quote(pixbuf_cache),
                "gdk-pixbuf loader cache generation"
            )
        }
    }

    function finalize_report(opts) {
        if (opts.report.used_gst && opts.gstreamer_plugins.len() == 0 && opts.report.gstreamer_plugins == 0) {
            this.report_warn(opts, "GStreamer import detected, but no gstreamer_plugins entries were bundled")
        }
        if (opts.report.used_gtk && opts.gtk_data.len() == 0 && opts.typelibs.len() == 0 &&
                opts.report.gtk_data == 0 && opts.report.typelibs == 0) {
            this.report_warn(opts, "GTK import detected; this AppImage may rely on host GTK assets and typelibs")
        }
    }

    function print_report(opts, appdir, appimage) {
        this.finalize_report(opts)

        print("\nsqgipkg report\n")
        local dir_label = this.starts_with(opts.target, "win-") ? "dist dir" : "appdir"
        print("  " + dir_label + ": " + appdir + "\n")
        if (appimage != null) {
            print("  appimage: " + appimage + "\n")
            print("  appimage arch: " + opts.appimage_arch + "\n")
        }
        print("  scripts: " + opts.report.scripts_compiled + " compiled, " +
            opts.report.scripts_copied + " copied, " + opts.report.script_links + " compatibility links\n")
        print("  resources: " + opts.report.resources + "\n")
        print("  manual files: " + opts.report.manual_files + "\n")
        print("  includes: " + opts.report.includes + "\n")
        print("  native projects: " + opts.report.native_projects + "\n")
        print("  shared libraries: " + opts.report.libraries + "\n")
        print("  gstreamer plugins: " + opts.report.gstreamer_plugins + "\n")
        print("  typelibs: " + opts.report.typelibs + "\n")
        print("  gtk data: " + opts.report.gtk_data + "\n")
        print("  gsettings schemas: " + opts.report.gsettings_schemas + "\n")
        print("  gio modules: " + opts.report.gio_modules + "\n")
        print("  gdk-pixbuf loaders: " + opts.report.gdk_pixbuf_loaders + "\n")
        print("  fonts: " + opts.report.fonts + "\n")

        if (opts.report.warnings.len() > 0) {
            print("  warnings:\n")
            foreach (warning in opts.report.warnings)
                print("    - " + warning + "\n")
        }
    }

    function smoke_test_command(appimage, args, isolated) {
        local prefix = "APPIMAGE_EXTRACT_AND_RUN=1 "
        if (isolated)
            prefix = "GST_PLUGIN_SYSTEM_PATH_1_0= GST_PLUGIN_SYSTEM_PATH= " + prefix
        return prefix + this.shell_quote(appimage) + (args == null || args.len() == 0 ? "" : " " + args)
    }

    function qemu_user_arch_name(arch) {
        arch = this.normalize_appimage_arch(arch)
        if (arch == "aarch64") return "aarch64"
        if (arch == "x86_64") return "x86_64"
        if (arch == "i386" || arch == "i686") return "i386"
        return arch
    }

    function qemu_user_binary_name(arch) {
        return "qemu-" + this.qemu_user_arch_name(arch)
    }

    function qemu_user_available(arch) {
        local name = this.qemu_user_binary_name(arch)
        return this.executable_available(name) || this.executable_available(name + "-static")
    }

    function qemu_binfmt_enabled(arch) {
        local path = GLib.build_filenamev([
            "/proc", "sys", "fs", "binfmt_misc",
            this.qemu_user_binary_name(arch)
        ])
        return this.file_contains(path, "enabled")
    }

    function path_list_existing(paths) {
        local out = []
        foreach (path in paths) {
            if (path != "" && this.path_exists(path))
                out.push(path)
        }
        return this.join_strings(out, ":")
    }

    function linux_sysroot_library_path(opts) {
        local sysroot = this.linux_current_sysroot(opts)
        local triplet = this.linux_current_triplet(opts)
        return this.path_list_existing([
            GLib.build_filenamev([sysroot, "lib", triplet]),
            GLib.build_filenamev([sysroot, "usr", "lib", triplet]),
            GLib.build_filenamev([sysroot, "usr", "lib64"]),
            GLib.build_filenamev([sysroot, "lib64"]),
            GLib.build_filenamev([sysroot, "usr", "lib"]),
            GLib.build_filenamev([sysroot, "lib"])
        ])
    }

    function linux_sysroot_typelib_path(opts) {
        local sysroot = this.linux_current_sysroot(opts)
        local triplet = this.linux_current_triplet(opts)
        return this.path_list_existing([
            GLib.build_filenamev([sysroot, "usr", "lib", triplet, "girepository-1.0"]),
            GLib.build_filenamev([sysroot, "usr", "lib", "girepository-1.0"])
        ])
    }

    function linux_sysroot_gstreamer_path(opts) {
        local sysroot = this.linux_current_sysroot(opts)
        local triplet = this.linux_current_triplet(opts)
        return this.path_list_existing([
            GLib.build_filenamev([sysroot, "usr", "lib", triplet, "gstreamer-1.0"]),
            GLib.build_filenamev([sysroot, "usr", "lib", "gstreamer-1.0"])
        ])
    }

    function linux_sysroot_data_path(opts) {
        local sysroot = this.linux_current_sysroot(opts)
        return this.path_list_existing([
            GLib.build_filenamev([sysroot, "usr", "share"])
        ])
    }

    function linux_sysroot_config_path(opts) {
        local sysroot = this.linux_current_sysroot(opts)
        return this.path_list_existing([
            GLib.build_filenamev([sysroot, "etc", "xdg"])
        ])
    }

    function cross_smoke_test_command(opts, appdir, args, isolated) {
        local sysroot = this.linux_current_sysroot(opts)
        local app_run = GLib.build_filenamev([appdir, "AppRun"])
        local cache_dir = GLib.build_filenamev([GLib.get_tmp_dir(),
            "sqgipkg-qemu-smoke-" + this.qemu_user_arch_name(opts.appimage_arch)])

        local command =
            this.shell_export("QEMU_LD_PREFIX", sysroot) +
            this.shell_export("XDG_CACHE_HOME", cache_dir)

        local library_path = this.linux_sysroot_library_path(opts)
        if (library_path != "")
            command += this.shell_export("LD_LIBRARY_PATH", library_path)

        local typelib_path = this.linux_sysroot_typelib_path(opts)
        if (typelib_path != "")
            command += this.shell_export("GI_TYPELIB_PATH", typelib_path)

        local data_path = this.linux_sysroot_data_path(opts)
        if (data_path != "")
            command += this.shell_export("XDG_DATA_DIRS", data_path)

        local config_path = this.linux_sysroot_config_path(opts)
        if (config_path != "")
            command += this.shell_export("XDG_CONFIG_DIRS", config_path)

        local gst_path = this.linux_sysroot_gstreamer_path(opts)
        if (isolated) {
            command += this.shell_export("GST_PLUGIN_PATH", "") +
                this.shell_export("GST_PLUGIN_SYSTEM_PATH_1_0", "") +
                this.shell_export("GST_PLUGIN_SYSTEM_PATH", "")
        } else if (gst_path != "") {
            command += this.shell_export("GST_PLUGIN_PATH", gst_path) +
                this.shell_export("GST_PLUGIN_SYSTEM_PATH", gst_path)
        }

        command += this.shell_export("GST_REGISTRY_FORK", "no")
        return command + this.shell_quote(app_run) +
            (args == null || args.len() == 0 ? "" : " " + args)
    }

    function cross_smoke_skip_reason(opts, appdir) {
        local sysroot = this.linux_current_sysroot(opts)
        if (sysroot == "" || !this.path_exists(sysroot))
            return "no Linux target sysroot is available"

        local app_run = GLib.build_filenamev([appdir, "AppRun"])
        if (!this.path_exists(app_run))
            return "AppDir AppRun is missing"

        if (!this.qemu_user_available(opts.appimage_arch))
            return this.qemu_user_binary_name(opts.appimage_arch) + " is not installed"

        if (!this.qemu_binfmt_enabled(opts.appimage_arch))
            return this.qemu_user_binary_name(opts.appimage_arch) + " binfmt registration is not enabled"

        return null
    }

    function run_smoke_test(opts, appdir, appimage) {
        if (opts.smoke_test_args == null && !opts.smoke_test_isolated) return

        local command = null
        if (this.normalize_appimage_arch(this.machine_arch()) == opts.appimage_arch) {
            command = this.smoke_test_command(appimage, opts.smoke_test_args, opts.smoke_test_isolated)
            this.info(opts.smoke_test_isolated ? "running isolated smoke test" : "running smoke test")
        } else {
            local reason = this.cross_smoke_skip_reason(opts, appdir)
            if (reason != null) {
                this.info("cross-arch smoke test skipped for " + opts.appimage_arch +
                    " AppImage on " + this.machine_arch() + " host: " + reason)
                return
            }
            command = this.cross_smoke_test_command(opts, appdir, opts.smoke_test_args, opts.smoke_test_isolated)
            this.info(opts.smoke_test_isolated
                ? ("running isolated cross-arch smoke test through " + this.qemu_user_binary_name(opts.appimage_arch))
                : ("running cross-arch smoke test through " + this.qemu_user_binary_name(opts.appimage_arch)))
        }

        local status = system(command)
        if (status != 0) this.fail("smoke test failed")
        this.info("smoke test passed")
    }

    function gtk_settings_contents(gtk_theme, gtk_icon_theme, gtk_font_name, gtk_prefer_dark) {
        local contents = "[Settings]\n"
        if (gtk_theme != "")
            contents += "gtk-theme-name=" + gtk_theme + "\n"
        if (gtk_icon_theme != "")
            contents += "gtk-icon-theme-name=" + gtk_icon_theme + "\n"
        if (gtk_font_name != "")
            contents += "gtk-font-name=" + gtk_font_name + "\n"
        if (gtk_prefer_dark)
            contents += "gtk-application-prefer-dark-theme=true\n"
        return contents
    }

    function has_gtk_settings(gtk_theme, gtk_icon_theme, gtk_font_name, gtk_prefer_dark) {
        return gtk_theme != "" || gtk_icon_theme != "" || gtk_font_name != "" || gtk_prefer_dark
    }

    function write_gtk_settings_file(root, rel, contents) {
        local path = GLib.build_filenamev([root, rel])
        this.mkdir_p(this.dirname(path))
        this.write_file(path, contents)
    }

    function write_linux_gtk_settings(opts, appdir) {
        if (!this.has_gtk_settings(opts.gtk_theme, opts.gtk_icon_theme, opts.gtk_font_name, opts.gtk_prefer_dark))
            return

        local contents = this.gtk_settings_contents(opts.gtk_theme, opts.gtk_icon_theme, opts.gtk_font_name, opts.gtk_prefer_dark)
        foreach (rel in [
            GLib.build_filenamev(["usr", "etc", "gtk-4.0", "settings.ini"]),
            GLib.build_filenamev(["usr", "etc", "gtk-3.0", "settings.ini"]),
            GLib.build_filenamev(["usr", "share", "gtk-4.0", "settings.ini"]),
            GLib.build_filenamev(["usr", "share", "gtk-3.0", "settings.ini"])
        ])
            this.write_gtk_settings_file(appdir, rel, contents)
    }

    function bash_export_line(name, value) {
        if (value == null || value == "") return ""
        return "export " + name + "=" + this.shell_quote(value) + "\n"
    }

    function app_run_exec_line(opts, entry_rel) {
        if (opts.entry_type == "native")
            return "exec \"${HERE}/" + entry_rel + "\" \"$@\"\n"
        return "exec \"${HERE}/usr/bin/sqgi\" \"${HERE}/" + entry_rel + "\" \"$@\"\n"
    }

    function write_apprun(opts, appdir, entry_rel) {
        local path = GLib.build_filenamev([appdir, "AppRun"])
        this.write_file(path,
            "#!/usr/bin/env bash\n" +
            "set -euo pipefail\n" +
            "\n" +
            "if [ -n \"${APPDIR:-}\" ]; then\n" +
            "  HERE=\"${APPDIR}\"\n" +
            "else\n" +
            "  HERE=\"$(dirname \"$(readlink -f \"${BASH_SOURCE[0]}\")\")\"\n" +
            "fi\n" +
            "export SQGI_APPDIR=\"${HERE}\"\n" +
            "export SQGI_APP_SHARE=\"${HERE}/usr/share/sqgi/app\"\n" +
            "export SQGI_APP_RESOURCES=\"${HERE}/usr/share/sqgi/app/resources\"\n" +
            "export LD_LIBRARY_PATH=\"${HERE}/usr/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}\"\n" +
            "export XDG_DATA_DIRS=\"${HERE}/usr/share${XDG_DATA_DIRS:+:${XDG_DATA_DIRS}}\"\n" +
            "export XDG_CONFIG_DIRS=\"${HERE}/usr/etc${XDG_CONFIG_DIRS:+:${XDG_CONFIG_DIRS}}\"\n" +
            "export GTK_DATA_PREFIX=\"${HERE}/usr\"\n" +
            "export GTK_EXE_PREFIX=\"${HERE}/usr\"\n" +
            "export GTK_PATH=\"${HERE}/usr/lib/gtk-4.0:${HERE}/usr/lib/gtk-3.0${GTK_PATH:+:${GTK_PATH}}\"\n" +
            this.bash_export_line("GTK_THEME", opts.gtk_theme) +
            this.bash_export_line("GDK_BACKEND", opts.gdk_backend) +
            "export GI_TYPELIB_PATH=\"${HERE}/usr/lib/girepository-1.0${GI_TYPELIB_PATH:+:${GI_TYPELIB_PATH}}\"\n" +
            "export GSETTINGS_SCHEMA_DIR=\"${HERE}/usr/share/glib-2.0/schemas\"\n" +
            "export GIO_MODULE_DIR=\"${HERE}/usr/lib/gio/modules\"\n" +
            "export GIO_EXTRA_MODULES=\"${HERE}/usr/lib/gio/modules${GIO_EXTRA_MODULES:+:${GIO_EXTRA_MODULES}}\"\n" +
            "export GDK_PIXBUF_MODULEDIR=\"${HERE}/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders\"\n" +
            "export GDK_PIXBUF_MODULE_FILE=\"${HERE}/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache\"\n" +
            "SQGI_CACHE_HOME=\"${XDG_CACHE_HOME:-${HOME:-/tmp}/.cache}/sqgi\"\n" +
            "mkdir -p \"${SQGI_CACHE_HOME}\"\n" +
            "if [ -x \"${HERE}/usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders\" ] && compgen -G \"${GDK_PIXBUF_MODULEDIR}/*.so\" >/dev/null; then\n" +
            "  GDK_PIXBUF_RUNTIME_CACHE=\"${SQGI_CACHE_HOME}/gdk-pixbuf-loaders.cache\"\n" +
            "  if \"${HERE}/usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders\" \"${GDK_PIXBUF_MODULEDIR}\"/*.so > \"${GDK_PIXBUF_RUNTIME_CACHE}\" 2>/dev/null; then\n" +
            "    export GDK_PIXBUF_MODULE_FILE=\"${GDK_PIXBUF_RUNTIME_CACHE}\"\n" +
            "  fi\n" +
            "fi\n" +
            "export GST_PLUGIN_PATH=\"${HERE}/usr/lib/gstreamer-1.0${GST_PLUGIN_PATH:+:${GST_PLUGIN_PATH}}\"\n" +
            "export GST_PLUGIN_SYSTEM_PATH_1_0=\"${HERE}/usr/lib/gstreamer-1.0\"\n" +
            "export GST_PLUGIN_SYSTEM_PATH=\"${HERE}/usr/lib/gstreamer-1.0\"\n" +
            "export GST_PLUGIN_SCANNER=\"${HERE}/usr/lib/gstreamer1.0/gstreamer-1.0/gst-plugin-scanner\"\n" +
            "export GST_REGISTRY=\"${SQGI_CACHE_HOME}/gstreamer-registry.bin\"\n" +
            this.app_run_exec_line(opts, entry_rel))
        this.chmod_exec(path)
    }

    function desktop_app_id(opts) {
        local app_id = opts.app_id != "" ? opts.app_id : this.sanitize_id(opts.name)
        this.validate_desktop_id(app_id)
        return app_id
    }

    function validate_desktop_id(app_id) {
        if (app_id == "") this.fail("desktop app id cannot be empty")
        for (local i = 0; i < app_id.len(); i++) {
            local ch = app_id.slice(i, i + 1)
            local c = ch[0]
            if (ch == "/" || c < 32 || c == 127)
                this.fail("desktop app id cannot contain slashes or control characters: " + app_id)
        }
    }

    function write_desktop_file(appdir, app_id, app_name, opts) {
        local terminal = opts.desktop_terminal ? "true" : "false"
        local categories = opts.desktop_categories
        if (categories == "") categories = "Utility;"
        if (!this.ends_with(categories, ";")) categories += ";"
        this.write_file(GLib.build_filenamev([appdir, app_id + ".desktop"]),
            "[Desktop Entry]\n" +
            "Type=Application\n" +
            "Name=" + app_name + "\n" +
            "Exec=AppRun\n" +
            "Icon=" + app_id + "\n" +
            "Categories=" + categories + "\n" +
            "Terminal=" + terminal + "\n" +
            "StartupNotify=true\n" +
            "StartupWMClass=" + app_id + "\n")
    }

    function desktop_icon_extension(path) {
        local name = this.basename(path)
        local dot = null

        for (local i = name.len() - 1; i >= 0; i--) {
            if (name.slice(i, i + 1) == ".") {
                dot = i
                break
            }
        }

        if (dot == null || dot == 0 || dot == name.len() - 1)
            this.fail("desktop icon must have a file extension: " + path)

        local ext = name.slice(dot + 1).tolower()
        if (ext != "png" && ext != "svg" && ext != "svgz" && ext != "xpm")
            this.fail("desktop icon must be png, svg, svgz or xpm: " + path)

        return ext
    }

    function copy_desktop_icon(appdir, app_id, icon_path) {
        local src = this.abs_path(icon_path)
        if (!this.path_exists(src)) this.fail("desktop icon not found: " + icon_path)

        local ext = this.desktop_icon_extension(src)
        local size = (ext == "svg" || ext == "svgz") ? "scalable" : "256x256"
        local root_icon = GLib.build_filenamev([appdir, app_id + "." + ext])
        local icon_dir = GLib.build_filenamev([appdir, "usr", "share", "icons", "hicolor", size, "apps"])
        this.mkdir_p(icon_dir)

        this.run_shell("cp " + this.shell_quote(src) + " " + this.shell_quote(root_icon), "copying desktop icon")
        this.run_shell("cp " + this.shell_quote(src) + " " +
            this.shell_quote(GLib.build_filenamev([icon_dir, app_id + "." + ext])), "copying desktop icon")
    }

    function write_icon(appdir, app_id, icon_path) {
        if (icon_path != "") {
            this.copy_desktop_icon(appdir, app_id, icon_path)
            return
        }

        local icon_dir = GLib.build_filenamev([appdir, "usr", "share", "icons", "hicolor", "scalable", "apps"])
        this.mkdir_p(icon_dir)

        local icon =
            "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"128\" height=\"128\" viewBox=\"0 0 128 128\">\n" +
            "  <rect width=\"128\" height=\"128\" rx=\"24\" fill=\"#1d2733\"/>\n" +
            "  <path d=\"M32 72c0-22 18-40 40-40h16v16H72c-13.25 0-24 10.75-24 24s10.75 24 24 24h24v16H72c-22 0-40-18-40-40z\" fill=\"#76d275\"/>\n" +
            "  <path d=\"M64 56h32v16H64z\" fill=\"#f3f7f0\"/>\n" +
            "  <path d=\"M64 80h40v16H64z\" fill=\"#f3f7f0\"/>\n" +
            "</svg>\n"

        local root_icon = GLib.build_filenamev([appdir, app_id + ".svg"])
        this.write_file(root_icon, icon)
        this.write_file(GLib.build_filenamev([icon_dir, app_id + ".svg"]), icon)
    }

}

return { SqgiPkgAppImage = SqgiPkgAppImage }
