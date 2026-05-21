local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("build.nut")

class SqgiPkg extends Base.SqgiPkgBuild {
    app = null
    raw_args = null

    constructor(args) {
        this.raw_args = args
        this.app = Gio.Application.new(
            "org.sqgi.sqgipkg",
            Gio.ApplicationFlags.handles_command_line + Gio.ApplicationFlags.non_unique
        )

        this.app.add_main_option("name", 'n', 0, GLib.OptionArg.string,
            "Application name shown to users", "NAME")
        this.app.add_main_option("manifest", 'm', 0, GLib.OptionArg.string,
            "Distribution manifest JSON file", "FILE")
        this.app.add_main_option("target", 't', 0, GLib.OptionArg.string,
            "Package target: appimage, linux-sysroot, win-dir, win-nsis, win-sysroot, all, appdir, tarball", "TARGET")
        this.app.add_main_option("build-dir", 0, 0, GLib.OptionArg.string,
            "SQGI build directory", "DIR")
        this.app.add_main_option("output", 'o', 0, GLib.OptionArg.string,
            "Output directory", "DIR")
        this.app.add_main_option("appimagetool", 0, 0, GLib.OptionArg.string,
            "appimagetool executable", "PATH")
        this.app.add_main_option("appimagetool-cache", 0, 0, GLib.OptionArg.string,
            "Directory used for downloaded appimagetool", "DIR")
        this.app.add_main_option("sqgi-source", 0, 0, GLib.OptionArg.string,
            "SQGI source checkout directory used by build commands", "DIR")
        this.app.add_main_option("sqgi-source-dir", 0, 0, GLib.OptionArg.string,
            "Alias for --sqgi-source", "DIR")
        this.app.add_main_option("sqgi-source-repo", 0, 0, GLib.OptionArg.string,
            "Git repository used when SQGI sources must be cloned", "URL")
        this.app.add_main_option("sqgi-source-branch", 0, 0, GLib.OptionArg.string,
            "SQGI source branch to clone or update", "BRANCH")
        this.app.add_main_option("sqgi-source-ref", 0, 0, GLib.OptionArg.string,
            "SQGI source tag, commit, or ref to checkout", "REF")
        this.app.add_main_option("sqgi-source-cache", 0, 0, GLib.OptionArg.string,
            "Cache directory for cloned SQGI source checkouts", "DIR")
        this.app.add_main_option("refresh-appimagetool", 0, 0, GLib.OptionArg.none,
            "Download the latest appimagetool before building", null)
        this.app.add_main_option("appimage-arch", 0, 0, GLib.OptionArg.string,
            "Target AppImage architecture, e.g. x86_64 or aarch64", "ARCH")
        this.app.add_main_option("linux-arch", 0, 0, GLib.OptionArg.string_array,
            "Add a Linux AppImage architecture for --target all", "ARCH")
        this.app.add_main_option("linux-deb-package", 0, 0, GLib.OptionArg.string_array,
            "Copy runtime files from a Debian/Ubuntu package", "PACKAGE")
        this.app.add_main_option("linux-package", 0, 0, GLib.OptionArg.string_array,
            "Alias for --linux-deb-package", "PACKAGE")
        this.app.add_main_option("linux-sysroot", 0, 0, GLib.OptionArg.string,
            "Linux target sysroot used to resolve cross-architecture libraries", "DIR")
        this.app.add_main_option("linux-deb-download", 0, 0, GLib.OptionArg.none,
            "Download Debian/Ubuntu packages into a private Linux sysroot", null)
        this.app.add_main_option("linux-deb-package-cache", 0, 0, GLib.OptionArg.string,
            "Download cache for Debian/Ubuntu package archives", "DIR")
        this.app.add_main_option("linux-deb-sysroot-cache", 0, 0, GLib.OptionArg.string,
            "Cache directory for reusable extracted Debian/Ubuntu Linux sysroots", "DIR")
        this.app.add_main_option("refresh-linux-deb-packages", 0, 0, GLib.OptionArg.none,
            "Refresh cached Debian/Ubuntu package archives", null)
        this.app.add_main_option("no-linux-deb-download", 0, 0, GLib.OptionArg.none,
            "Do not download missing Debian/Ubuntu packages", null)
        this.app.add_main_option("linux-download-packages", 0, 0, GLib.OptionArg.none,
            "Alias for --linux-deb-download", null)
        this.app.add_main_option("linux-package-cache", 0, 0, GLib.OptionArg.string,
            "Alias for --linux-deb-package-cache", "DIR")
        this.app.add_main_option("linux-sysroot-cache", 0, 0, GLib.OptionArg.string,
            "Alias for --linux-deb-sysroot-cache", "DIR")
        this.app.add_main_option("refresh-linux-packages", 0, 0, GLib.OptionArg.none,
            "Alias for --refresh-linux-deb-packages", null)
        this.app.add_main_option("no-linux-download", 0, 0, GLib.OptionArg.none,
            "Alias for --no-linux-deb-download", null)
        this.app.add_main_option("linux-library-dir", 0, 0, GLib.OptionArg.string_array,
            "Additional Linux target library search directory", "DIR")
        this.app.add_main_option("no-linux-deps", 0, 0, GLib.OptionArg.none,
            "Do not recursively copy Linux ELF shared-library dependencies", null)
        this.app.add_main_option("keep-appdir", 0, 0, GLib.OptionArg.none,
            "Keep the staged AppDir after building", null)
        this.app.add_main_option("doctor", 0, 0, GLib.OptionArg.none,
            "Check manifest paths, script compilation, and portability hints", null)
        this.app.add_main_option("smoke-test", 0, 0, GLib.OptionArg.string,
            "Run the built AppImage with ARGS after packaging", "ARGS")
        this.app.add_main_option("smoke-test-isolated", 0, 0, GLib.OptionArg.none,
            "Run smoke test with host GStreamer plugin discovery disabled", null)
        this.app.add_main_option("init", 0, 0, GLib.OptionArg.string,
            "Write a starter manifest: simple, gtk4, gtk4-gstreamer, native-gobject, native-vala", "TEMPLATE")
        this.app.add_main_option("no-compile-scripts", 0, 0, GLib.OptionArg.none,
            "Copy .nut scripts as source instead of compiling bytecode", null)
        this.app.add_main_option("script", 0, 0, GLib.OptionArg.string_array,
            "Add a project .nut script or PATH=DEST script module", "SPEC")
        this.app.add_main_option("script-dir", 0, 0, GLib.OptionArg.string_array,
            "Recursively add .nut scripts from a project directory", "DIR")
        this.app.add_main_option("file", 0, 0, GLib.OptionArg.string_array,
            "Copy PATH=DEST into the AppDir without special handling", "SPEC")
        this.app.add_main_option("library", 0, 0, GLib.OptionArg.string_array,
            "Copy shared library file or directory into usr/lib", "PATH")
        this.app.add_main_option("include", 0, 0, GLib.OptionArg.string_array,
            "Copy PATH or PATH=DEST into the AppDir", "SPEC")
        this.app.add_main_option("resource", 0, 0, GLib.OptionArg.string_array,
            "Copy project resource into usr/share/sqgi/app/resources", "PATH")
        this.app.add_main_option("gstreamer-plugin", 0, 0, GLib.OptionArg.string_array,
            "Copy GStreamer plugin file or directory into usr/lib/gstreamer-1.0", "PATH")
        this.app.add_main_option("typelib", 0, 0, GLib.OptionArg.string_array,
            "Copy GI typelib file or directory into usr/lib/girepository-1.0", "PATH")
        this.app.add_main_option("gsettings-schema", 0, 0, GLib.OptionArg.string_array,
            "Copy GSettings schema file or directory into usr/share/glib-2.0/schemas", "PATH")
        this.app.add_main_option("gtk-data", 0, 0, GLib.OptionArg.string_array,
            "Copy GTK/icon/theme data into usr/share", "PATH")
        this.app.add_main_option("gio-module", 0, 0, GLib.OptionArg.string_array,
            "Copy GIO module file or directory into usr/lib/gio/modules", "PATH")
        this.app.add_main_option("gdk-pixbuf-loader", 0, 0, GLib.OptionArg.string_array,
            "Copy gdk-pixbuf loader file or directory into usr/lib/gdk-pixbuf-2.0/2.10.0/loaders", "PATH")
        this.app.add_main_option("gtk-theme", 0, 0, GLib.OptionArg.string,
            "Set GTK_THEME and generate bundled GTK settings.ini", "NAME")
        this.app.add_main_option("gtk-icon-theme", 0, 0, GLib.OptionArg.string,
            "Set gtk-icon-theme-name in bundled GTK settings.ini", "NAME")
        this.app.add_main_option("gtk-font-name", 0, 0, GLib.OptionArg.string,
            "Set gtk-font-name in bundled GTK settings.ini", "NAME")
        this.app.add_main_option("gtk-prefer-dark", 0, 0, GLib.OptionArg.none,
            "Set gtk-application-prefer-dark-theme=true in bundled GTK settings.ini", null)
        this.app.add_main_option("gdk-backend", 0, 0, GLib.OptionArg.string,
            "Set GDK_BACKEND in launchers", "BACKEND")
        this.app.add_main_option("msys2-root", 0, 0, GLib.OptionArg.string,
            "MSYS2 root used for Windows packaging", "DIR")
        this.app.add_main_option("msys2-prefix", 0, 0, GLib.OptionArg.string,
            "MSYS2 MinGW prefix for Windows packaging, usually mingw64 or clang64", "PREFIX")
        this.app.add_main_option("windows-package", 0, 0, GLib.OptionArg.string_array,
            "Copy runtime files from an installed MSYS2 package", "PACKAGE")
        this.app.add_main_option("msys2-repo-url", 0, 0, GLib.OptionArg.string,
            "MSYS2 repository URL used to download Windows packages", "URL")
        this.app.add_main_option("msys2-package-cache", 0, 0, GLib.OptionArg.string,
            "Download cache for MSYS2 package archives", "DIR")
        this.app.add_main_option("win-cmake-toolchain", 0, 0, GLib.OptionArg.string,
            "CMake toolchain file for Ubuntu/MinGW Windows builds", "FILE")
        this.app.add_main_option("win-meson-cross-file", 0, 0, GLib.OptionArg.string,
            "Meson cross file for Ubuntu/MinGW Windows native extension builds", "FILE")
        this.app.add_main_option("refresh-msys2-packages", 0, 0, GLib.OptionArg.none,
            "Refresh cached MSYS2 repository databases and package archives", null)
        this.app.add_main_option("no-msys2-download", 0, 0, GLib.OptionArg.none,
            "Do not download missing MSYS2 packages", null)
        this.app.add_main_option("no-windows-auto-packages", 0, 0, GLib.OptionArg.none,
            "Do not add inferred base/GTK/GStreamer MSYS2 packages", null)
        this.app.add_main_option("nsis", 0, 0, GLib.OptionArg.string,
            "makensis executable for --target win-nsis", "PATH")
        this.app.add_main_option("windows-gtk-theme", 0, 0, GLib.OptionArg.string,
            "Set GTK_THEME in the Windows launcher and generate GTK settings.ini", "NAME")
        this.app.add_main_option("windows-icon-theme", 0, 0, GLib.OptionArg.string,
            "Set gtk-icon-theme-name in bundled GTK settings.ini", "NAME")
        this.app.add_main_option("windows-prefer-dark", 0, 0, GLib.OptionArg.none,
            "Set gtk-application-prefer-dark-theme=true in bundled GTK settings.ini", null)
        this.app.add_main_option("windows-gdk-backend", 0, 0, GLib.OptionArg.string,
            "Set GDK_BACKEND in the Windows launcher, for example win32", "BACKEND")
        this.app.add_main_option("nsis-installer-name", 0, 0, GLib.OptionArg.string,
            "Output installer filename for --target win-nsis", "FILE")
        this.app.add_main_option("nsis-install-dir", 0, 0, GLib.OptionArg.string,
            "NSIS InstallDir, e.g. $LOCALAPPDATA\\App or $PROGRAMFILES64\\App", "DIR")
        this.app.add_main_option("nsis-request-execution-level", 0, 0, GLib.OptionArg.string,
            "NSIS RequestExecutionLevel: user, admin, highest or none", "LEVEL")
        this.app.add_main_option("nsis-license", 0, 0, GLib.OptionArg.string,
            "License file displayed by the NSIS installer", "FILE")
        this.app.add_main_option("nsis-icon", 0, 0, GLib.OptionArg.string,
            "ICO file used for the installer and shortcuts", "FILE")
        this.app.add_main_option("nsis-no-desktop-shortcut", 0, 0, GLib.OptionArg.none,
            "Do not create a desktop shortcut in the NSIS installer", null)
        this.app.add_main_option("nsis-no-start-menu-shortcut", 0, 0, GLib.OptionArg.none,
            "Do not create Start Menu shortcuts in the NSIS installer", null)
        this.app.add_main_option("nsis-start-menu-folder", 0, 0, GLib.OptionArg.string,
            "Start Menu folder for NSIS shortcuts", "NAME")

        this.app.connect("command-line", function(command_line) {
            try {
                local opts = this.parse_args(this.raw_args, command_line.get_options_dict())

                if (opts.init_template != "") {
                    this.init_manifest(opts.init_template)
                    return 0
                }

                if (opts.doctor) {
                    this.validate_doctor_options(opts)
                    return this.doctor(opts)
                }

                this.validate_options(opts)

                if (opts.target == "appimage") {
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
        }.bindenv(this))
    }

    function run(args) {
        local argv = ["sqgipkg"]
        foreach (a in args) argv.push(a)
        return this.app.run(argv.len(), argv)
    }
}

return { SqgiPkg = SqgiPkg }
