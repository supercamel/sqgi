local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("core.nut")

class SqgiPkgOptions extends Base.SqgiPkgCore {
    function new_options() {
        return {
            script = "",
            entry_type = "sqgi",
            entry_linux = "",
            entry_windows = "",
            manifest = "",
            manifest_dir = "",
            name = "",
            target = "",
            build_dir = "build",
            build_dir_forced = false,
            output_dir = "dist",
            output_dir_forced = false,
            appimagetool = "appimagetool",
            appimagetool_cache = this.default_appimagetool_cache_dir(),
            refresh_appimagetool = false,
            appimage_arch = "",
            sqgi_source = {
                dir = "",
                repo = this.default_sqgi_source_repo(),
                branch = "",
                ref = "",
                cache = this.default_sqgi_source_cache_dir(),
                update = true,
                shallow = false,
                submodules = false
            },
            linux = {
                arches = [],
                build = [],
                sysroot = "",
                deb = {
                    packages = [],
                    package_cache = "",
                    sysroot_cache = "",
                    suite = "",
                    suite_forced = false,
                    download = false,
                    download_forced = null,
                    refresh = false
                },
                library_dirs = [],
                copy_dependencies = true
            },
            clean = false,
            keep_appdir = false,
            doctor = false,
            smoke_test_args = null,
            smoke_test_isolated = false,
            init_template = "",
            compile_scripts = true,
            report = this.new_report(),
            scripts = [],
            script_dirs = [],
            files = [],
            libraries = [],
            native_projects = [],
            includes = [],
            resources = [],
            gstreamer_plugins = [],
            typelibs = [],
            gsettings_schemas = [],
            gtk_data = [],
            gio_modules = [],
            gdk_pixbuf_loaders = [],
            gtk_theme = "",
            gtk_icon_theme = "",
            gtk_font_name = "",
            gtk_prefer_dark = false,
            gdk_backend = "",
            windows = {
                build_dir = "",
                build = [],
                msys2_root = "",
                msys2_prefix = "mingw64",
                packages = [],
                repo_url = "",
                package_cache = "",
                cmake_toolchain = "",
                meson_cross_file = "",
                download_packages = true,
                refresh_packages = false,
                auto_packages = true,
                console = null,
                console_forced = false,
                libraries = [],
                typelibs = [],
                files = [],
                fonts = [],
                native_dependencies = [],
                native_projects = [],
                gtk_theme = "",
                gtk_icon_theme = "",
                gtk_font_name = "",
                gtk_prefer_dark = false,
                gdk_backend = "",
                nsis = "makensis",
                nsis_installer_name = "",
                nsis_install_dir = "",
                nsis_request_execution_level = "user",
                nsis_license = "",
                nsis_icon = "",
                nsis_header_image = "",
                nsis_welcome_image = "",
                nsis_desktop_shortcut = true,
                nsis_start_menu_shortcut = true,
                nsis_start_menu_folder = "",
                nsis_uninstall_registry = true
            }
        }
    }

    function option_takes_separate_value(arg) {
        if (arg.len() >= 2 && arg.slice(0, 2) == "--" && arg.find("=") != null)
            return false

        return this.array_contains([
            "--name", "-n",
            "--manifest", "-m",
            "--target", "-t",
            "--build-dir",
            "--output", "-o",
            "--appimagetool",
            "--appimagetool-cache",
            "--sqgi-source",
            "--sqgi-source-dir",
            "--sqgi-source-repo",
            "--sqgi-source-branch",
            "--sqgi-source-ref",
            "--sqgi-source-cache",
            "--appimage-arch",
            "--linux-arch",
            "--linux-deb-package",
            "--linux-deb-package-cache",
            "--linux-deb-sysroot-cache",
            "--linux-deb-suite",
            "--linux-package",
            "--linux-sysroot",
            "--linux-package-cache",
            "--linux-sysroot-cache",
            "--linux-library-dir",
            "--smoke-test",
            "--init",
            "--script",
            "--script-dir",
            "--file",
            "--library",
            "--include",
            "--resource",
            "--gstreamer-plugin",
            "--typelib",
            "--gsettings-schema",
            "--gtk-data",
            "--gio-module",
            "--gdk-pixbuf-loader",
            "--gtk-theme",
            "--gtk-icon-theme",
            "--gtk-font-name",
            "--gdk-backend",
            "--msys2-root",
            "--msys2-prefix",
            "--windows-package",
            "--windows-font",
            "--msys2-repo-url",
            "--msys2-package-cache",
            "--win-cmake-toolchain",
            "--win-meson-cross-file",
            "--nsis",
            "--windows-gtk-theme",
            "--windows-icon-theme",
            "--windows-gdk-backend",
            "--nsis-installer-name",
            "--nsis-install-dir",
            "--nsis-request-execution-level",
            "--nsis-license",
            "--nsis-icon",
            "--nsis-header-image",
            "--nsis-welcome-image",
            "--nsis-start-menu-folder"
        ], arg)
    }

    function extract_script_arg(args) {
        local script = ""
        local positional = false
        local i = 0
        while (i < args.len()) {
            local arg = args[i]
            if (!positional && arg == "--") {
                positional = true
                i++
            } else if (!positional && arg.len() >= 1 && arg.slice(0, 1) == "-") {
                i += this.option_takes_separate_value(arg) ? 2 : 1
            } else {
                if (script != "") this.fail("only one script may be packaged")
                script = arg
                i++
            }
        }

        return script
    }

    function option_value(option_dict, name) {
        if (option_dict == null) return null
        return option_dict.lookup_value(name, null)
    }

    function option_present(option_dict, name) {
        return this.option_value(option_dict, name) != null
    }

    function option_values(option_dict, name) {
        local value = this.option_value(option_dict, name)
        if (value == null) return []
        if (typeof(value) == "array") return value
        return [value]
    }

    function windows_font_spec(spec) {
        local parts = this.split_once(spec, "=")
        if (parts[1] == null) this.fail("--windows-font requires PATH=REGISTRY_NAME")
        return {
            path = parts[0],
            registry_name = parts[1]
        }
    }

    function windows_font_specs(values) {
        local out = []
        foreach (value in values)
            out.push(this.windows_font_spec(value))
        return out
    }

    function apply_option_dict(opts, option_dict) {
        local v = null

        v = this.option_value(option_dict, "name")
        if (v != null) opts.name = v
        v = this.option_value(option_dict, "manifest")
        if (v != null) opts.manifest = v
        v = this.option_value(option_dict, "target")
        if (v != null) opts.target = v
        v = this.option_value(option_dict, "build-dir")
        if (v != null) {
            opts.build_dir = v
            opts.build_dir_forced = true
        }
        v = this.option_value(option_dict, "output")
        if (v != null) {
            opts.output_dir = v
            opts.output_dir_forced = true
        }
        v = this.option_value(option_dict, "appimagetool")
        if (v != null) opts.appimagetool = v
        v = this.option_value(option_dict, "appimagetool-cache")
        if (v != null) opts.appimagetool_cache = v
        v = this.option_value(option_dict, "sqgi-source")
        if (v != null) opts.sqgi_source.dir = v
        v = this.option_value(option_dict, "sqgi-source-dir")
        if (v != null) opts.sqgi_source.dir = v
        v = this.option_value(option_dict, "sqgi-source-repo")
        if (v != null) opts.sqgi_source.repo = v
        v = this.option_value(option_dict, "sqgi-source-branch")
        if (v != null) opts.sqgi_source.branch = v
        v = this.option_value(option_dict, "sqgi-source-ref")
        if (v != null) opts.sqgi_source.ref = v
        v = this.option_value(option_dict, "sqgi-source-cache")
        if (v != null) opts.sqgi_source.cache = v
        v = this.option_value(option_dict, "appimage-arch")
        if (v != null) opts.appimage_arch = v
        v = this.option_value(option_dict, "linux-sysroot")
        if (v != null) opts.linux.sysroot = v
        v = this.option_value(option_dict, "linux-deb-package-cache")
        if (v != null) opts.linux.deb.package_cache = v
        v = this.option_value(option_dict, "linux-package-cache")
        if (v != null) opts.linux.deb.package_cache = v
        v = this.option_value(option_dict, "linux-deb-sysroot-cache")
        if (v != null) opts.linux.deb.sysroot_cache = v
        v = this.option_value(option_dict, "linux-sysroot-cache")
        if (v != null) opts.linux.deb.sysroot_cache = v
        v = this.option_value(option_dict, "linux-deb-suite")
        if (v != null) {
            opts.linux.deb.suite = v
            opts.linux.deb.suite_forced = true
        }
        v = this.option_value(option_dict, "smoke-test")
        if (v != null) opts.smoke_test_args = v
        v = this.option_value(option_dict, "init")
        if (v != null) opts.init_template = v
        v = this.option_value(option_dict, "gtk-theme")
        if (v != null) opts.gtk_theme = v
        v = this.option_value(option_dict, "gtk-icon-theme")
        if (v != null) opts.gtk_icon_theme = v
        v = this.option_value(option_dict, "gtk-font-name")
        if (v != null) opts.gtk_font_name = v
        v = this.option_value(option_dict, "gdk-backend")
        if (v != null) opts.gdk_backend = v
        v = this.option_value(option_dict, "msys2-root")
        if (v != null) opts.windows.msys2_root = v
        v = this.option_value(option_dict, "msys2-prefix")
        if (v != null) opts.windows.msys2_prefix = v
        v = this.option_value(option_dict, "msys2-repo-url")
        if (v != null) opts.windows.repo_url = v
        v = this.option_value(option_dict, "msys2-package-cache")
        if (v != null) opts.windows.package_cache = v
        v = this.option_value(option_dict, "win-cmake-toolchain")
        if (v != null) opts.windows.cmake_toolchain = v
        v = this.option_value(option_dict, "win-meson-cross-file")
        if (v != null) opts.windows.meson_cross_file = v
        v = this.option_value(option_dict, "nsis")
        if (v != null) opts.windows.nsis = v
        v = this.option_value(option_dict, "windows-gtk-theme")
        if (v != null) opts.windows.gtk_theme = v
        v = this.option_value(option_dict, "windows-icon-theme")
        if (v != null) opts.windows.gtk_icon_theme = v
        v = this.option_value(option_dict, "windows-gdk-backend")
        if (v != null) opts.windows.gdk_backend = v
        v = this.option_value(option_dict, "nsis-installer-name")
        if (v != null) opts.windows.nsis_installer_name = v
        v = this.option_value(option_dict, "nsis-install-dir")
        if (v != null) opts.windows.nsis_install_dir = v
        v = this.option_value(option_dict, "nsis-request-execution-level")
        if (v != null) opts.windows.nsis_request_execution_level = v
        v = this.option_value(option_dict, "nsis-license")
        if (v != null) opts.windows.nsis_license = v
        v = this.option_value(option_dict, "nsis-icon")
        if (v != null) opts.windows.nsis_icon = v
        v = this.option_value(option_dict, "nsis-header-image")
        if (v != null) opts.windows.nsis_header_image = v
        v = this.option_value(option_dict, "nsis-welcome-image")
        if (v != null) opts.windows.nsis_welcome_image = v
        v = this.option_value(option_dict, "nsis-start-menu-folder")
        if (v != null) opts.windows.nsis_start_menu_folder = v

        if (this.option_present(option_dict, "refresh-appimagetool")) opts.refresh_appimagetool = true
        if (this.option_present(option_dict, "clean")) opts.clean = true
        if (this.option_present(option_dict, "no-linux-deps")) opts.linux.copy_dependencies = false
        if (this.option_present(option_dict, "linux-deb-download")) {
            opts.linux.deb.download = true
            opts.linux.deb.download_forced = true
        }
        if (this.option_present(option_dict, "linux-download-packages")) {
            opts.linux.deb.download = true
            opts.linux.deb.download_forced = true
        }
        if (this.option_present(option_dict, "refresh-linux-deb-packages")) opts.linux.deb.refresh = true
        if (this.option_present(option_dict, "refresh-linux-packages")) opts.linux.deb.refresh = true
        if (this.option_present(option_dict, "no-linux-deb-download")) {
            opts.linux.deb.download = false
            opts.linux.deb.download_forced = false
        }
        if (this.option_present(option_dict, "no-linux-download")) {
            opts.linux.deb.download = false
            opts.linux.deb.download_forced = false
        }
        if (this.option_present(option_dict, "keep-appdir")) opts.keep_appdir = true
        if (this.option_present(option_dict, "doctor")) opts.doctor = true
        if (this.option_present(option_dict, "smoke-test-isolated")) opts.smoke_test_isolated = true
        if (this.option_present(option_dict, "no-compile-scripts")) opts.compile_scripts = false
        if (this.option_present(option_dict, "gtk-prefer-dark")) opts.gtk_prefer_dark = true
        if (this.option_present(option_dict, "refresh-msys2-packages")) opts.windows.refresh_packages = true
        if (this.option_present(option_dict, "no-msys2-download")) opts.windows.download_packages = false
        if (this.option_present(option_dict, "no-windows-auto-packages")) opts.windows.auto_packages = false
        if (this.option_present(option_dict, "windows-console")) {
            opts.windows.console = true
            opts.windows.console_forced = true
        }
        if (this.option_present(option_dict, "no-windows-console")) {
            opts.windows.console = false
            opts.windows.console_forced = true
        }
        if (this.option_present(option_dict, "windows-prefer-dark")) opts.windows.gtk_prefer_dark = true
        if (this.option_present(option_dict, "nsis-no-desktop-shortcut")) opts.windows.nsis_desktop_shortcut = false
        if (this.option_present(option_dict, "nsis-no-start-menu-shortcut")) opts.windows.nsis_start_menu_shortcut = false

        foreach (arch in this.option_values(option_dict, "linux-arch"))
            opts.linux.arches.push({ arch = arch })
        this.append_values(opts.linux.deb.packages, this.option_values(option_dict, "linux-deb-package"))
        this.append_values(opts.linux.deb.packages, this.option_values(option_dict, "linux-package"))
        this.append_values(opts.linux.library_dirs, this.option_values(option_dict, "linux-library-dir"))
        this.append_values(opts.scripts, this.option_values(option_dict, "script"))
        this.append_values(opts.script_dirs, this.option_values(option_dict, "script-dir"))
        this.append_values(opts.files, this.option_values(option_dict, "file"))
        this.append_values(opts.libraries, this.option_values(option_dict, "library"))
        this.append_values(opts.includes, this.option_values(option_dict, "include"))
        this.append_values(opts.resources, this.option_values(option_dict, "resource"))
        this.append_values(opts.gstreamer_plugins, this.option_values(option_dict, "gstreamer-plugin"))
        this.append_values(opts.typelibs, this.option_values(option_dict, "typelib"))
        this.append_values(opts.gsettings_schemas, this.option_values(option_dict, "gsettings-schema"))
        this.append_values(opts.gtk_data, this.option_values(option_dict, "gtk-data"))
        this.append_values(opts.gio_modules, this.option_values(option_dict, "gio-module"))
        this.append_values(opts.gdk_pixbuf_loaders, this.option_values(option_dict, "gdk-pixbuf-loader"))
        this.append_values(opts.windows.packages, this.option_values(option_dict, "windows-package"))
        this.append_values(opts.windows.fonts, this.windows_font_specs(this.option_values(option_dict, "windows-font")))
    }

    function parse_args(args, option_dict) {
        local opts = this.new_options()
        opts.script = this.extract_script_arg(args)
        this.apply_option_dict(opts, option_dict)
        this.apply_default_manifest(opts)
        this.apply_manifest(opts)
        this.apply_project_defaults(opts)
        return opts
    }

}

return { SqgiPkgOptions = SqgiPkgOptions }
