local GLib = import("GLib")
local Base = import("build.nut")

class SqgiPkg extends Base.SqgiPkgBuild {
    option_entries = null
    long_options = null
    short_options = null

    constructor(args) {
        this.option_entries = []
        this.long_options = {}
        this.short_options = {}

        this.add_option("name", 'n', GLib.OptionArg.string,
            "Application name shown to users", "NAME")
        this.add_option("manifest", 'm', GLib.OptionArg.string,
            "Distribution manifest JSON file", "FILE")
        this.add_option("target", 't', GLib.OptionArg.string,
            "Package target: appimage, linux-sysroot, win-dir, win-nsis, win-sysroot, all", "TARGET")
        this.add_option("build-dir", 0, GLib.OptionArg.string,
            "SQGI build directory", "DIR")
        this.add_option("output", 'o', GLib.OptionArg.string,
            "Output directory", "DIR")
        this.add_option("clean", 0, GLib.OptionArg.none,
            "Remove project-local sqgipkg build and distribution directories", null)
        this.add_option("appimagetool", 0, GLib.OptionArg.string,
            "appimagetool executable", "PATH")
        this.add_option("appimagetool-cache", 0, GLib.OptionArg.string,
            "Directory used for downloaded appimagetool", "DIR")
        this.add_option("sqgi-source", 0, GLib.OptionArg.string,
            "SQGI source checkout directory used by build commands", "DIR")
        this.add_option("sqgi-source-dir", 0, GLib.OptionArg.string,
            "Alias for --sqgi-source", "DIR")
        this.add_option("sqgi-source-repo", 0, GLib.OptionArg.string,
            "Git repository used when SQGI sources must be cloned", "URL")
        this.add_option("sqgi-source-branch", 0, GLib.OptionArg.string,
            "SQGI source branch to clone or update", "BRANCH")
        this.add_option("sqgi-source-ref", 0, GLib.OptionArg.string,
            "SQGI source tag, commit, or ref to checkout", "REF")
        this.add_option("sqgi-source-cache", 0, GLib.OptionArg.string,
            "Cache directory for cloned SQGI source checkouts", "DIR")
        this.add_option("refresh-appimagetool", 0, GLib.OptionArg.none,
            "Download the latest appimagetool before building", null)
        this.add_option("appimage-arch", 0, GLib.OptionArg.string,
            "Target AppImage architecture, e.g. x86_64 or aarch64", "ARCH")
        this.add_option("linux-arch", 0, GLib.OptionArg.string_array,
            "Add a Linux AppImage architecture for --target all", "ARCH")
        this.add_option("linux-deb-package", 0, GLib.OptionArg.string_array,
            "Copy runtime files from a Debian/Ubuntu package", "PACKAGE")
        this.add_option("linux-package", 0, GLib.OptionArg.string_array,
            "Alias for --linux-deb-package", "PACKAGE")
        this.add_option("linux-sysroot", 0, GLib.OptionArg.string,
            "Linux target sysroot used to resolve cross-architecture libraries", "DIR")
        this.add_option("linux-deb-download", 0, GLib.OptionArg.none,
            "Download Debian/Ubuntu packages into a private Linux sysroot", null)
        this.add_option("linux-deb-package-cache", 0, GLib.OptionArg.string,
            "Download cache for Debian/Ubuntu package archives", "DIR")
        this.add_option("linux-deb-sysroot-cache", 0, GLib.OptionArg.string,
            "Cache directory for reusable extracted Debian/Ubuntu Linux sysroots", "DIR")
        this.add_option("linux-deb-suite", 0, GLib.OptionArg.string,
            "Ubuntu suite codename to download packages from, e.g. noble for 24.04; defaults to host suite", "SUITE")
        this.add_option("refresh-linux-deb-packages", 0, GLib.OptionArg.none,
            "Refresh cached Debian/Ubuntu package archives", null)
        this.add_option("no-linux-deb-download", 0, GLib.OptionArg.none,
            "Do not download missing Debian/Ubuntu packages", null)
        this.add_option("linux-download-packages", 0, GLib.OptionArg.none,
            "Alias for --linux-deb-download", null)
        this.add_option("linux-package-cache", 0, GLib.OptionArg.string,
            "Alias for --linux-deb-package-cache", "DIR")
        this.add_option("linux-sysroot-cache", 0, GLib.OptionArg.string,
            "Alias for --linux-deb-sysroot-cache", "DIR")
        this.add_option("refresh-linux-packages", 0, GLib.OptionArg.none,
            "Alias for --refresh-linux-deb-packages", null)
        this.add_option("no-linux-download", 0, GLib.OptionArg.none,
            "Alias for --no-linux-deb-download", null)
        this.add_option("linux-library-dir", 0, GLib.OptionArg.string_array,
            "Additional Linux target library search directory", "DIR")
        this.add_option("no-linux-deps", 0, GLib.OptionArg.none,
            "Do not recursively copy Linux ELF shared-library dependencies", null)
        this.add_option("keep-appdir", 0, GLib.OptionArg.none,
            "Keep the staged AppDir after building", null)
        this.add_option("doctor", 0, GLib.OptionArg.none,
            "Check manifest paths, script compilation, and portability hints", null)
        this.add_option("smoke-test", 0, GLib.OptionArg.string,
            "Run the built AppImage with ARGS after packaging", "ARGS")
        this.add_option("smoke-test-isolated", 0, GLib.OptionArg.none,
            "Run smoke test with host GStreamer plugin discovery disabled", null)
        this.add_option("init", 0, GLib.OptionArg.string,
            "Write a starter manifest: simple, gtk4, gtk4-gstreamer, native-gobject, native-vala", "TEMPLATE")
        this.add_option("no-compile-scripts", 0, GLib.OptionArg.none,
            "Copy .nut scripts as source instead of compiling bytecode", null)
        this.add_option("script", 0, GLib.OptionArg.string_array,
            "Add a project .nut script or PATH=DEST script module", "SPEC")
        this.add_option("script-dir", 0, GLib.OptionArg.string_array,
            "Recursively add .nut scripts from a project directory", "DIR")
        this.add_option("app-id", 0, GLib.OptionArg.string,
            "Desktop application id for AppImage metadata, e.g. org.example.App", "ID")
        this.add_option("file", 0, GLib.OptionArg.string_array,
            "Copy PATH=DEST into the AppDir without special handling", "SPEC")
        this.add_option("library", 0, GLib.OptionArg.string_array,
            "Copy shared library file or directory into usr/lib", "PATH")
        this.add_option("include", 0, GLib.OptionArg.string_array,
            "Copy PATH or PATH=DEST into the AppDir", "SPEC")
        this.add_option("resource", 0, GLib.OptionArg.string_array,
            "Copy project resource into usr/share/sqgi/app/resources", "PATH")
        this.add_option("gstreamer-plugin", 0, GLib.OptionArg.string_array,
            "Copy GStreamer plugin file or directory into usr/lib/gstreamer-1.0", "PATH")
        this.add_option("typelib", 0, GLib.OptionArg.string_array,
            "Copy GI typelib file or directory into usr/lib/girepository-1.0", "PATH")
        this.add_option("gsettings-schema", 0, GLib.OptionArg.string_array,
            "Copy GSettings schema file or directory into usr/share/glib-2.0/schemas", "PATH")
        this.add_option("gtk-data", 0, GLib.OptionArg.string_array,
            "Copy GTK/icon/theme data into usr/share", "PATH")
        this.add_option("gio-module", 0, GLib.OptionArg.string_array,
            "Copy GIO module file or directory into usr/lib/gio/modules", "PATH")
        this.add_option("gdk-pixbuf-loader", 0, GLib.OptionArg.string_array,
            "Copy gdk-pixbuf loader file or directory into usr/lib/gdk-pixbuf-2.0/2.10.0/loaders", "PATH")
        this.add_option("gtk-theme", 0, GLib.OptionArg.string,
            "Set GTK_THEME and generate bundled GTK settings.ini", "NAME")
        this.add_option("gtk-icon-theme", 0, GLib.OptionArg.string,
            "Set gtk-icon-theme-name in bundled GTK settings.ini", "NAME")
        this.add_option("gtk-font-name", 0, GLib.OptionArg.string,
            "Set gtk-font-name in bundled GTK settings.ini", "NAME")
        this.add_option("gtk-prefer-dark", 0, GLib.OptionArg.none,
            "Set gtk-application-prefer-dark-theme=true in bundled GTK settings.ini", null)
        this.add_option("gdk-backend", 0, GLib.OptionArg.string,
            "Set GDK_BACKEND in launchers", "BACKEND")
        this.add_option("desktop-icon", 0, GLib.OptionArg.string,
            "Image file used for the AppImage desktop icon", "PATH")
        this.add_option("desktop-categories", 0, GLib.OptionArg.string,
            "Semicolon-separated desktop categories for the AppImage .desktop file", "LIST")
        this.add_option("desktop-terminal", 0, GLib.OptionArg.none,
            "Set Terminal=true in the AppImage .desktop file", null)
        this.add_option("desktop-no-terminal", 0, GLib.OptionArg.none,
            "Set Terminal=false in the AppImage .desktop file", null)
        this.add_option("msys2-root", 0, GLib.OptionArg.string,
            "MSYS2 root used for Windows packaging", "DIR")
        this.add_option("msys2-prefix", 0, GLib.OptionArg.string,
            "MSYS2 MinGW prefix for Windows packaging, usually mingw64 or clang64", "PREFIX")
        this.add_option("windows-build-package", 0, GLib.OptionArg.string_array,
            "Install an MSYS2 package for Windows builds without staging it", "PACKAGE")
        this.add_option("windows-package", 0, GLib.OptionArg.string_array,
            "Copy runtime files from an installed MSYS2 package", "PACKAGE")
        this.add_option("windows-font", 0, GLib.OptionArg.string_array,
            "Stage and register a Windows font for NSIS installers, PATH=REGISTRY_NAME", "SPEC")
        this.add_option("msys2-repo-url", 0, GLib.OptionArg.string,
            "MSYS2 repository URL used to download Windows packages", "URL")
        this.add_option("msys2-package-cache", 0, GLib.OptionArg.string,
            "Download cache for MSYS2 package archives", "DIR")
        this.add_option("win-cmake-toolchain", 0, GLib.OptionArg.string,
            "CMake toolchain file for Ubuntu/MinGW Windows builds", "FILE")
        this.add_option("win-meson-cross-file", 0, GLib.OptionArg.string,
            "Meson cross file for Ubuntu/MinGW Windows native extension builds", "FILE")
        this.add_option("refresh-msys2-packages", 0, GLib.OptionArg.none,
            "Refresh cached MSYS2 repository databases and package archives", null)
        this.add_option("no-msys2-download", 0, GLib.OptionArg.none,
            "Do not download missing MSYS2 packages", null)
        this.add_option("no-windows-auto-packages", 0, GLib.OptionArg.none,
            "Do not add inferred base/GTK/GStreamer MSYS2 packages", null)
        this.add_option("windows-console", 0, GLib.OptionArg.none,
            "Use the Windows console launcher even for GUI apps", null)
        this.add_option("no-windows-console", 0, GLib.OptionArg.none,
            "Build and launch Windows GUI apps without a visible console", null)
        this.add_option("nsis", 0, GLib.OptionArg.string,
            "makensis executable for --target win-nsis", "PATH")
        this.add_option("windows-gtk-theme", 0, GLib.OptionArg.string,
            "Set GTK_THEME in the Windows launcher and generate GTK settings.ini", "NAME")
        this.add_option("windows-icon-theme", 0, GLib.OptionArg.string,
            "Set gtk-icon-theme-name in bundled GTK settings.ini", "NAME")
        this.add_option("windows-prefer-dark", 0, GLib.OptionArg.none,
            "Set gtk-application-prefer-dark-theme=true in bundled GTK settings.ini", null)
        this.add_option("windows-gdk-backend", 0, GLib.OptionArg.string,
            "Set GDK_BACKEND in the Windows launcher, for example win32", "BACKEND")
        this.add_option("nsis-installer-name", 0, GLib.OptionArg.string,
            "Output installer filename for --target win-nsis", "FILE")
        this.add_option("nsis-install-dir", 0, GLib.OptionArg.string,
            "NSIS InstallDir, e.g. $LOCALAPPDATA\\App or $PROGRAMFILES64\\App", "DIR")
        this.add_option("nsis-request-execution-level", 0, GLib.OptionArg.string,
            "NSIS RequestExecutionLevel: user, admin, highest or none", "LEVEL")
        this.add_option("nsis-license", 0, GLib.OptionArg.string,
            "License file displayed by the NSIS installer", "FILE")
        this.add_option("nsis-icon", 0, GLib.OptionArg.string,
            "ICO file used for the installer and shortcuts", "FILE")
        this.add_option("nsis-header-image", 0, GLib.OptionArg.string,
            "MUI2 header bitmap used by the NSIS installer", "FILE")
        this.add_option("nsis-welcome-image", 0, GLib.OptionArg.string,
            "MUI2 welcome and finish bitmap used by the NSIS installer", "FILE")
        this.add_option("nsis-no-desktop-shortcut", 0, GLib.OptionArg.none,
            "Do not create a desktop shortcut in the NSIS installer", null)
        this.add_option("nsis-no-start-menu-shortcut", 0, GLib.OptionArg.none,
            "Do not create Start Menu shortcuts in the NSIS installer", null)
        this.add_option("nsis-start-menu-folder", 0, GLib.OptionArg.string,
            "Start Menu folder for NSIS shortcuts", "NAME")
        this.add_option("nsis-autostart", 0, GLib.OptionArg.none,
            "Create a current-user Startup shortcut in the NSIS installer", null)

        this.add_option("locked", 0, GLib.OptionArg.none,
            "Require the recorded source and package inputs", null)
        this.add_option("write-lock", 0, GLib.OptionArg.none,
            "Record resolved source and package inputs after a successful build", null)
        this.add_option("nsis-script-only", 0, GLib.OptionArg.none,
            "Generate an NSIS script without compiling an installer", null)
        this.add_option("explain", 0, GLib.OptionArg.none,
            "Print the resolved configuration without building or fetching", null)
    }

    function execute_options(args, option_dict) {
        try {
            local opts = this.parse_args(args, option_dict)

            if (opts.init_template != "") {
                this.init_manifest(opts.init_template)
                return 0
            }

            if (this.option_present(option_dict, "explain")) {
                this.explain(opts)
                return 0
            }

            if (opts.doctor) {
                this.validate_doctor_options(opts)
                return this.check_selected(opts)
            }

            this.validate_options(opts)

            if (opts.clean || opts.target == "clean") {
                this.clean_project(opts)
            } else if (opts.target == "appimage") {
                this.build_selected_appimage(opts)
            } else if (opts.target == "win-dir") {
                this.build_windows_dir(opts)
            } else if (opts.target == "win-nsis") {
                this.build_windows_nsis(opts)
            } else if (opts.target == "linux-sysroot") {
                this.build_selected_linux_sysroot(opts)
            } else if (opts.target == "win-sysroot") {
                this.build_windows_sysroot(opts)
            } else if (opts.target == "all") {
                this.build_all(opts)
            } else if (opts.target == "appdir") {
                this.fail("--target appdir is reserved but not implemented yet")
            } else if (opts.target == "tarball") {
                this.fail("--target tarball is reserved but not implemented yet")
            } else {
                this.fail("unknown target: " + opts.target)
            }

            return 0
        } catch (e) {
            print(e + "\n")
            return 1
        }
    }

    function add_option(name, short_name, kind, description, value_name) {
        local entry = { name = name, short_name = short_name, kind = kind,
            description = description, value_name = value_name }
        this.option_entries.push(entry)
        this.long_options[name] <- entry
        if (short_name != 0) this.short_options[format("%c", short_name)] <- entry
    }

    function print_option_help() {
        print("Usage: sqgipkg [build|check|init|explain|clean] [options] [script]\n\nOptions:\n")
        print("  -h, --help-all  Show this full reference\n")
        foreach (entry in this.option_entries) {
            local label = "--" + entry.name
            if (entry.short_name != 0) label = format("-%c, ", entry.short_name) + label
            if (entry.value_name != null) label += " " + entry.value_name
            print("  " + label + "\n      " + entry.description + "\n")
        }
    }

    function parse_cli_options(args) {
        local values = {}
        // Keep the separator so parse_args accepts positional filenames beginning with '-'.
        local positional = ["--"]
        local options_done = false
        for (local i = 0; i < args.len(); i++) {
            local arg = args[i]
            if (options_done || arg == "-" || !this.starts_with(arg, "-")) {
                positional.push(arg)
                continue
            }
            if (arg == "--") { options_done = true; continue }
            if (arg == "--help" || arg == "--help-all" || arg == "-h" || arg == "-?") {
                this.print_option_help()
                return null
            }
            local entry = null
            local value = null
            if (this.starts_with(arg, "--")) {
                local parts = this.split_once(arg.slice(2), "=")
                if (parts[0] in this.long_options) entry = this.long_options[parts[0]]
                value = parts[1]
            } else {
                local short_name = arg.slice(1, 2)
                if (short_name in this.short_options) entry = this.short_options[short_name]
                if (arg.len() > 2) value = arg.slice(2)
            }
            if (entry == null) this.fail("unknown option: " + arg)
            if (entry.kind == GLib.OptionArg.none) {
                if (value != null) this.fail("--" + entry.name + " does not take a value")
                values[entry.name] <- true
                continue
            }
            if (value == null) {
                if (++i >= args.len()) this.fail("--" + entry.name + " requires a value")
                value = args[i]
            }
            if (entry.kind == GLib.OptionArg.string_array) {
                if (!(entry.name in values)) values[entry.name] <- []
                values[entry.name].push(value)
            } else values[entry.name] <- value
        }
        return { options = values, positional = positional }
    }

    function run(args) {
        // GApplication.run ignores supplied argv on Windows and re-reads the OS
        // command line, losing the subcommand/alias normalization in sqgipkg.
        // Parse the supplied arguments directly on every host for consistent CLI behavior.
        try {
            local parsed = this.parse_cli_options(args)
            if (parsed == null) return 0
            return this.execute_options(parsed.positional, parsed.options)
        } catch (e) {
            print(e + "\n")
            return 1
        }
    }
}

return { SqgiPkg = SqgiPkg }
