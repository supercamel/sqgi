local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("msys2.nut")

class SqgiPkgWindowsStaging extends Base.SqgiPkgWindowsMsys2 {
    function run_optional_tool(command, description) {
        local status = system(command)
        if (status != 0) this.info(description + " skipped or failed")
    }

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

    function postprocess_windows_runtime_files(opts, windir) {
        local schema_dir = GLib.build_filenamev([windir, "share", "glib-2.0", "schemas"])
        local has_schema_xml = this.path_exists(schema_dir) &&
            this.shell_has_matches(GLib.build_filenamev([schema_dir, "*.xml"]))

        if (has_schema_xml && this.executable_available("glib-compile-schemas")) {
            this.run_optional_tool(
                "glib-compile-schemas " + this.shell_quote(schema_dir),
                "Windows GSettings schema compilation"
            )
        } else if (has_schema_xml) {
            this.report_warn(opts,
                "GSettings schemas were staged, but glib-compile-schemas was not found; " +
                "the Windows bundle may fail to start")
        }

        this.ensure_windows_gdk_pixbuf_loader_cache(opts, windir)
    }

    function windows_gdk_pixbuf_loader_dir_rel() {
        return GLib.build_filenamev(["lib", "gdk-pixbuf-2.0", "2.10.0", "loaders"])
    }

    function windows_gdk_pixbuf_loader_cache_rel() {
        return GLib.build_filenamev(["lib", "gdk-pixbuf-2.0", "2.10.0", "loaders.cache"])
    }

    function windows_gdk_pixbuf_loader_cache_path(loader_name) {
        return "\"" + GLib.build_filenamev([
            "lib", "gdk-pixbuf-2.0", "2.10.0", "loaders", loader_name
        ]) + "\""
    }

    function windows_gdk_pixbuf_loader_names(loader_dir) {
        local out = []
        foreach (path in this.optional_command_output(
            "find " + this.shell_quote(loader_dir) + " -maxdepth 1 -type f -name '*.dll' | sort"
        ))
            out.push(this.basename(path))
        return out
    }

    function split_cache_lines(text) {
        local out = []
        local start = 0
        for (local i = 0; i <= text.len(); i++) {
            if (i == text.len() || text.slice(i, i + 1) == "\n") {
                local line = text.slice(start, i)
                if (line.len() > 0 && line.slice(line.len() - 1) == "\r")
                    line = line.slice(0, line.len() - 1)
                out.push(line)
                start = i + 1
            }
        }
        return out
    }

    function gdk_pixbuf_cache_loader_name(line) {
        if (line.len() < 2 || line.slice(0, 1) != "\"") return null
        local end = line.find("\"", 1)
        if (end == null || end <= 1) return null

        local path = this.replace_char(line.slice(1, end), "\\", "/")
        local lower = path.tolower()
        if (!this.ends_with(lower, ".dll")) return null
        if (lower.find("gdk-pixbuf-2.0/2.10.0/loaders/") == null) return null
        return this.basename(path)
    }

    function relocatable_windows_gdk_pixbuf_loader_cache(contents, loader_names) {
        local out = ""
        local keep_block = true

        foreach (line in this.split_cache_lines(contents)) {
            local loader_name = this.gdk_pixbuf_cache_loader_name(line)
            if (loader_name != null) {
                keep_block = this.array_contains(loader_names, loader_name)
                if (keep_block)
                    out += this.windows_gdk_pixbuf_loader_cache_path(loader_name) + "\n"
            } else {
                if (keep_block) out += line + "\n"
                if (line == "") keep_block = true
            }
        }

        return out
    }

    function windows_gdk_pixbuf_known_loader_entries() {
        return [
            {
                name = "libpixbufloader-ani.dll",
                lines = [
                    "\"ani\" 4 \"gdk-pixbuf\" \"Windows animated cursor\" \"LGPL\"",
                    "\"application/x-navi-animation\" \"\"",
                    "\"ani\" \"\"",
                    "\"RIFF    ACON\" \"    xxxx    \" 100"
                ]
            },
            {
                name = "libpixbufloader-avif.dll",
                lines = [
                    "\"avif\" 5 \"gdk-pixbuf\" \"AV1 Image File Format\" \"BSD\"",
                    "\"image/avif\" \"\"",
                    "\"avif\" \"\"",
                    "\"    ftypavif\" \"zzz         \" 100"
                ]
            },
            {
                name = "libpixbufloader-bmp.dll",
                lines = [
                    "\"bmp\" 5 \"gdk-pixbuf\" \"BMP\" \"LGPL\"",
                    "\"image/bmp\" \"image/x-bmp\" \"image/x-MS-bmp\" \"\"",
                    "\"bmp\" \"\"",
                    "\"BM\" \"\" 100"
                ]
            },
            {
                name = "libpixbufloader-gif.dll",
                lines = [
                    "\"gif\" 4 \"gdk-pixbuf\" \"GIF\" \"LGPL\"",
                    "\"image/gif\" \"\"",
                    "\"gif\" \"\"",
                    "\"GIF8\" \"\" 100"
                ]
            },
            {
                name = "libpixbufloader-heif.dll",
                lines = [
                    "\"heif/avif\" 4 \"pixbufloader-heif\" \"HEIF/AVIF Image\" \"LGPL3\"",
                    "\"image/heif\" \"image/heic\" \"image/avif\" \"\"",
                    "\"heif\" \"heic\" \"avif\" \"\"",
                    "\"    ftyp\" \"xxxx    \" 100"
                ]
            },
            {
                name = "libpixbufloader-icns.dll",
                lines = [
                    "\"icns\" 4 \"gdk-pixbuf\" \"MacOS X icon\" \"GPL\"",
                    "\"image/x-icns\" \"\"",
                    "\"icns\" \"\"",
                    "\"icns\" \"\" 100"
                ]
            },
            {
                name = "libpixbufloader-ico.dll",
                lines = [
                    "\"ico\" 5 \"gdk-pixbuf\" \"Windows icon\" \"LGPL\"",
                    "\"image/x-icon\" \"image/x-ico\" \"image/x-win-bitmap\" \"image/vnd.microsoft.icon\" \"application/ico\" \"image/ico\" \"image/icon\" \"text/ico\" \"\"",
                    "\"ico\" \"cur\" \"\"",
                    "\"  \\001   \" \"zz znz\" 100",
                    "\"  \\002   \" \"zz znz\" 100"
                ]
            },
            {
                name = "libpixbufloader-jpeg.dll",
                lines = [
                    "\"jpeg\" 5 \"gdk-pixbuf\" \"JPEG\" \"LGPL\"",
                    "\"image/jpeg\" \"\"",
                    "\"jpeg\" \"jpe\" \"jpg\" \"\"",
                    "\"\\377\\330\" \"\" 100"
                ]
            },
            {
                name = "libpixbufloader-png.dll",
                lines = [
                    "\"png\" 5 \"gdk-pixbuf\" \"PNG\" \"LGPL\"",
                    "\"image/png\" \"\"",
                    "\"png\" \"\"",
                    "\"\\211PNG\\r\\n\\032\\n\" \"\" 100"
                ]
            },
            {
                name = "libpixbufloader-pnm.dll",
                lines = [
                    "\"pnm\" 4 \"gdk-pixbuf\" \"PNM/PBM/PGM/PPM\" \"LGPL\"",
                    "\"image/x-portable-anymap\" \"image/x-portable-bitmap\" \"image/x-portable-graymap\" \"image/x-portable-pixmap\" \"\"",
                    "\"pnm\" \"pbm\" \"pgm\" \"ppm\" \"\"",
                    "\"P1\" \"\" 100",
                    "\"P2\" \"\" 100",
                    "\"P3\" \"\" 100",
                    "\"P4\" \"\" 100",
                    "\"P5\" \"\" 100",
                    "\"P6\" \"\" 100"
                ]
            },
            {
                name = "libpixbufloader-qtif.dll",
                lines = [
                    "\"qtif\" 4 \"gdk-pixbuf\" \"QuickTime\" \"LGPL\"",
                    "\"image/x-quicktime\" \"image/qtif\" \"\"",
                    "\"qtif\" \"qif\" \"\"",
                    "\"abcdidsc\" \"xxxx    \" 100",
                    "\"abcdidat\" \"xxxx    \" 100"
                ]
            },
            {
                name = "libpixbufloader-tga.dll",
                lines = [
                    "\"tga\" 4 \"gdk-pixbuf\" \"Targa\" \"LGPL\"",
                    "\"image/x-tga\" \"\"",
                    "\"tga\" \"targa\" \"\"",
                    "\" \\001\\001\" \"x  \" 100",
                    "\" \\001\\t\" \"x  \" 100",
                    "\"  \\002\" \"xz \" 99",
                    "\"  \\003\" \"xz \" 100",
                    "\"  \\n\" \"xz \" 100",
                    "\"  \\v\" \"xz \" 100"
                ]
            },
            {
                name = "libpixbufloader-tiff.dll",
                lines = [
                    "\"tiff\" 5 \"gdk-pixbuf\" \"TIFF\" \"LGPL\"",
                    "\"image/tiff\" \"\"",
                    "\"tiff\" \"tif\" \"\"",
                    "\"MM *\" \"  z \" 100",
                    "\"II* \" \"   z\" 100",
                    "\"II* \\020   CR\\002 \" \"   z zzz   z\" 0"
                ]
            },
            {
                name = "libpixbufloader-xbm.dll",
                lines = [
                    "\"xbm\" 4 \"gdk-pixbuf\" \"XBM\" \"LGPL\"",
                    "\"image/x-xbitmap\" \"\"",
                    "\"xbm\" \"\"",
                    "\"#define \" \"\" 100",
                    "\"/*\" \"\" 50"
                ]
            },
            {
                name = "libpixbufloader-xpm.dll",
                lines = [
                    "\"xpm\" 4 \"gdk-pixbuf\" \"XPM\" \"LGPL\"",
                    "\"image/x-xpixmap\" \"\"",
                    "\"xpm\" \"\"",
                    "\"/* XPM */\" \"\" 100"
                ]
            },
            {
                name = "pixbufloader_svg.dll",
                lines = [
                    "\"svg\" 6 \"gdk-pixbuf\" \"Scalable Vector Graphics\" \"LGPL\"",
                    "\"image/svg+xml\" \"image/svg\" \"image/svg-xml\" \"image/vnd.adobe.svg+xml\" \"text/xml-svg\" \"image/svg+xml-compressed\" \"\"",
                    "\"svg\" \"svgz\" \"svg.gz\" \"\"",
                    "\" <svg\" \"*    \" 100",
                    "\" <!DOCTYPE svg\" \"*             \" 100"
                ]
            },
            {
                name = "libpixbufloader-svg.dll",
                lines = [
                    "\"svg\" 6 \"gdk-pixbuf\" \"Scalable Vector Graphics\" \"LGPL\"",
                    "\"image/svg+xml\" \"image/svg\" \"image/svg-xml\" \"image/vnd.adobe.svg+xml\" \"text/xml-svg\" \"image/svg+xml-compressed\" \"\"",
                    "\"svg\" \"svgz\" \"svg.gz\" \"\"",
                    "\" <svg\" \"*    \" 100",
                    "\" <!DOCTYPE svg\" \"*             \" 100"
                ]
            }
        ]
    }

    function synthetic_windows_gdk_pixbuf_loader_cache(opts, loader_names) {
        local text =
            "# GdkPixbuf Image Loader Modules file\n" +
            "# Automatically generated by sqgipkg for a relocatable Windows bundle\n" +
            "# LoaderDir = lib\\gdk-pixbuf-2.0\\2.10.0\\loaders\n" +
            "#\n"
        local used = {}
        local added = 0

        foreach (entry in this.windows_gdk_pixbuf_known_loader_entries()) {
            if (!this.array_contains(loader_names, entry.name)) continue

            used[entry.name] <- true
            text += this.windows_gdk_pixbuf_loader_cache_path(entry.name) + "\n"
            foreach (line in entry.lines)
                text += line + "\n"
            text += "\n"
            added++
        }

        local unknown = []
        foreach (loader_name in loader_names) {
            if (!this.table_get(used, loader_name, false))
                unknown.push(loader_name)
        }
        if (unknown.len() > 0)
            this.report_warn(opts,
                "no built-in gdk-pixbuf loader cache metadata for: " +
                this.join_strings(unknown, ", "))

        return added == 0 ? "" : text
    }

    function ensure_windows_gdk_pixbuf_loader_cache(opts, windir) {
        local loader_dir_rel = this.windows_gdk_pixbuf_loader_dir_rel()
        local loader_dir = GLib.build_filenamev([windir, loader_dir_rel])
        if (!this.path_exists(loader_dir)) return

        local loader_names = this.windows_gdk_pixbuf_loader_names(loader_dir)
        if (loader_names.len() == 0) return

        local cache_rel = this.windows_gdk_pixbuf_loader_cache_rel()
        local cache = GLib.build_filenamev([windir, cache_rel])
        if (this.path_exists(cache)) return

        local source_cache = GLib.build_filenamev([
            opts.windows.msys2_root,
            opts.windows.msys2_prefix,
            cache_rel
        ])

        if (this.path_exists(source_cache)) {
            local rewritten_cache = this.relocatable_windows_gdk_pixbuf_loader_cache(
                this.read_file(source_cache),
                loader_names
            )
            if (rewritten_cache.find(loader_dir_rel + "/") != null) {
                this.write_file(cache, rewritten_cache)
                this.info("staged Windows gdk-pixbuf loader cache: " + cache_rel)
                return
            }
        }

        local synthetic_cache = this.synthetic_windows_gdk_pixbuf_loader_cache(opts, loader_names)
        if (synthetic_cache == "") {
            this.report_warn(opts,
                "gdk-pixbuf loaders were staged for Windows, but sqgipkg could not create loaders.cache")
            return
        }

        this.write_file(cache, synthetic_cache)
        this.info("wrote Windows gdk-pixbuf loader cache: " + cache_rel)
    }

    function windows_launcher_exec_line(opts, entry_rel) {
        local entry = this.windows_path(entry_rel)
        if (opts.entry_type == "native")
            return "\"%HERE%" + entry + "\" %*\r\n"
        return "\"%HERE%bin\\sqgi.exe\" \"%HERE%" + entry + "\" %*\r\n"
    }

    function windows_primary_launcher_name(opts, package_name) {
        return package_name + ".bat"
    }

    function windows_exe_launcher_name(opts, package_name) {
        return package_name + ".exe"
    }

    function windows_exe_launcher_source(bat_name) {
        return "#define WIN32_LEAN_AND_MEAN\n" +
            "#include <windows.h>\n" +
            "\n" +
            "int main(void) {\n" +
            "    wchar_t dir[MAX_PATH];\n" +
            "    DWORD n = GetModuleFileNameW(NULL, dir, MAX_PATH);\n" +
            "    if (n == 0 || n >= MAX_PATH) return 1;\n" +
            "    while (n > 0 && dir[n - 1] != L'\\\\') n--;\n" +
            "    if (n > 0) dir[n - 1] = 0;\n" +
            "    wchar_t cmd[1024];\n" +
            "    lstrcpyW(cmd, L\"cmd.exe /c \\\"\\\"\");\n" +
            "    lstrcatW(cmd, dir);\n" +
            "    lstrcatW(cmd, L\"\\\\" + bat_name + "\\\"\\\"\");\n" +
            "    STARTUPINFOW si;\n" +
            "    ZeroMemory(&si, sizeof(si));\n" +
            "    si.cb = sizeof(si);\n" +
            "    si.dwFlags = STARTF_USESHOWWINDOW;\n" +
            "    si.wShowWindow = SW_HIDE;\n" +
            "    PROCESS_INFORMATION pi;\n" +
            "    ZeroMemory(&pi, sizeof(pi));\n" +
            "    if (!CreateProcessW(NULL, cmd, NULL, NULL, FALSE, CREATE_NO_WINDOW, NULL, dir, &si, &pi))\n" +
            "        return 1;\n" +
            "    CloseHandle(pi.hThread);\n" +
            "    CloseHandle(pi.hProcess);\n" +
            "    return 0;\n" +
            "}\n"
    }

    function write_windows_exe_launcher(opts, windir, package_name) {
        local compiler = "x86_64-w64-mingw32-gcc"
        if (!this.executable_available(compiler)) {
            this.report_warn(opts, "mingw C compiler not found (" + compiler +
                "); GUI shortcut will fall back to the .bat launcher")
            return false
        }

        local bat_name = this.windows_primary_launcher_name(opts, package_name)
        local out = GLib.build_filenamev([windir, this.windows_exe_launcher_name(opts, package_name)])
        local src = GLib.build_filenamev([GLib.get_tmp_dir(),
            "sqgipkg-launcher-" + GLib.get_monotonic_time() + ".c"])

        this.write_file(src, this.windows_exe_launcher_source(bat_name))
        local status = this.run_shell_status(
            this.shell_quote(compiler) + " -O2 -s -mwindows -o " +
            this.shell_quote(out) + " " + this.shell_quote(src))
        remove(src)

        if (status != 0 || !this.path_exists(out)) {
            this.report_warn(opts, "failed to compile Windows GUI launcher; " +
                "falling back to the .bat shortcut")
            return false
        }

        this.info("wrote Windows GUI launcher: " + this.windows_exe_launcher_name(opts, package_name))
        return true
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
            "set \"GSETTINGS_SCHEMA_DIR=%HERE%share\\glib-2.0\\schemas\"\r\n" +
            "set \"GST_PLUGIN_PATH=%HERE%lib\\gstreamer-1.0\"\r\n" +
            "set \"GST_PLUGIN_SYSTEM_PATH_1_0=%HERE%lib\\gstreamer-1.0\"\r\n" +
            "set \"GST_PLUGIN_SYSTEM_PATH=%HERE%lib\\gstreamer-1.0\"\r\n" +
            "set \"GST_PLUGIN_SCANNER=%HERE%libexec\\gstreamer-1.0\\gst-plugin-scanner.exe\"\r\n" +
            "if not exist \"%LOCALAPPDATA%\\sqgi\" mkdir \"%LOCALAPPDATA%\\sqgi\" >NUL 2>NUL\r\n" +
            "set \"GST_REGISTRY=%LOCALAPPDATA%\\sqgi\\" + app_name + "-gstreamer-registry.bin\"\r\n" +
            "set \"GIO_EXTRA_MODULES=%HERE%lib\\gio\\modules;%GIO_EXTRA_MODULES%\"\r\n" +
            "set \"GDK_PIXBUF_MODULEDIR=%HERE%lib\\gdk-pixbuf-2.0\\2.10.0\\loaders\"\r\n" +
            "set \"GDK_PIXBUF_BUNDLE_MODULE_FILE=%HERE%lib\\gdk-pixbuf-2.0\\2.10.0\\loaders.cache\"\r\n" +
            "set \"GDK_PIXBUF_MODULE_FILE=%GDK_PIXBUF_BUNDLE_MODULE_FILE%\"\r\n" +
            "if exist \"%HERE%bin\\gdk-pixbuf-query-loaders.exe\" (\r\n" +
            "  set \"GDK_PIXBUF_RUNTIME_MODULE_FILE=%LOCALAPPDATA%\\sqgi\\" + app_name + "-gdk-pixbuf-loaders.cache\"\r\n" +
            "  type NUL > \"%GDK_PIXBUF_RUNTIME_MODULE_FILE%\"\r\n" +
            "  for %%F in (\"%GDK_PIXBUF_MODULEDIR%\\*.dll\") do \"%HERE%bin\\gdk-pixbuf-query-loaders.exe\" \"%%~fF\" >> \"%GDK_PIXBUF_RUNTIME_MODULE_FILE%\" 2>NUL\r\n" +
            "  if exist \"%GDK_PIXBUF_RUNTIME_MODULE_FILE%\" for %%C in (\"%GDK_PIXBUF_RUNTIME_MODULE_FILE%\") do if %%~zC GTR 0 set \"GDK_PIXBUF_MODULE_FILE=%GDK_PIXBUF_RUNTIME_MODULE_FILE%\"\r\n" +
            ")\r\n" +
            this.windows_launcher_exec_line(opts, entry_rel))

    }

    function materialize_windows_symlinks(windir) {
        local links = this.optional_command_output(
            "find " + this.shell_quote(windir) + " -type l | sort"
        )

        foreach (link in links) {
            if (link == "") continue

            local tmp = link + ".sqgipkg-link-target"
            this.run_shell(
                "rm -rf " + this.shell_quote(tmp) + " && " +
                "if [ -e " + this.shell_quote(link) + " ]; then " +
                "cp -aL " + this.shell_quote(link) + " " + this.shell_quote(tmp) + " && " +
                "rm -f " + this.shell_quote(link) + " && " +
                "mv " + this.shell_quote(tmp) + " " + this.shell_quote(link) + "; " +
                "else rm -f " + this.shell_quote(link) + "; fi",
                "materializing Windows symlink"
            )
        }
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
        this.stage_windows_runtime_support_files(opts, windir)
        this.postprocess_windows_runtime_files(opts, windir)
        this.resolve_windows_dll_dependencies(opts, windir)
        this.verify_windows_binary_arches(opts, windir)
        this.write_windows_gtk_settings(opts, windir)
        this.materialize_windows_symlinks(windir)
        this.write_windows_launcher(opts, windir, package_name, entry_rel)
        if (this.windows_gui_enabled(opts))
            this.write_windows_exe_launcher(opts, windir, package_name)

        return windir
    }

}

return { SqgiPkgWindowsStaging = SqgiPkgWindowsStaging }
