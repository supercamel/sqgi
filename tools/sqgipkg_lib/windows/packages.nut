local GLib = import("GLib")
local Base = import("env.nut")
local PE = import("pe.nut")

class SqgiPkgWindowsPackages extends Base.SqgiPkgWindowsEnv {
    function trim_trailing_slash(value) {
        while (value.len() > 1 && value.slice(value.len() - 1) == "/")
            value = value.slice(0, value.len() - 1)
        return value
    }

    function url_basename(url) {
        url = this.trim_trailing_slash(url)
        local parts = this.split_path(url)
        return parts.len() == 0 ? url : parts[parts.len() - 1]
    }

    function normalize_package_entry(entry) {
        local changed = true
        while (changed) {
            changed = false
            while (entry.len() >= 3 && entry.slice(0, 3) == "/./") {
                entry = entry.slice(3)
                changed = true
            }
            while (entry.len() > 0 && entry.slice(0, 1) == "/") {
                entry = entry.slice(1)
                changed = true
            }
            while (entry.len() >= 2 && entry.slice(0, 2) == "./") {
                entry = entry.slice(2)
                changed = true
            }
        }
        return entry
    }

    function windows_package_dest(entry, prefix) {
        entry = this.normalize_package_entry(entry)
        if (entry.len() == 0 || this.ends_with(entry, "/")) return null

        local prefix_slash = prefix + "/"
        if (!this.starts_with(entry, prefix_slash)) return null
        local rel = entry.slice(prefix_slash.len())

        if (this.starts_with(rel, "lib/")) foreach (suffix in [".a", ".lib", ".la", ".pc", ".h", ".hpp"])
            if (this.ends_with(rel.tolower(), suffix)) return null

        if (this.starts_with(rel, "bin/") && this.ends_with(rel.tolower(), ".dll"))
            return rel
        if (this.dirname(rel) == "lib" && this.ends_with(rel.tolower(), ".dll"))
            return "bin/" + this.basename(rel)
        if (rel == "bin/gdk-pixbuf-query-loaders.exe")
            return rel
        if (rel == "bin/gdbus.exe")
            return rel
        if (this.starts_with(rel, "bin/gspawn-") && this.ends_with(rel, ".exe"))
            return rel
        if (this.starts_with(rel, "lib/ossl-modules/"))
            return rel
        if (this.starts_with(rel, "lib/engines-3/"))
            return rel
        if (this.starts_with(rel, "lib/girepository-1.0/"))
            return rel
        if (this.starts_with(rel, "lib/gstreamer-1.0/"))
            return rel
        if (this.starts_with(rel, "libexec/gstreamer-1.0/"))
            return rel
        if (this.starts_with(rel, "lib/gio/modules/"))
            return rel
        if (this.starts_with(rel, "lib/gdk-pixbuf-2.0/"))
            return rel
        if (this.starts_with(rel, "share/fontconfig/"))
            return rel
        if (this.starts_with(rel, "share/gdal/"))
            return rel
        if (this.starts_with(rel, "share/glib-2.0/"))
            return rel
        if (this.starts_with(rel, "share/gst-plugins-base/"))
            return rel
        if (this.starts_with(rel, "share/gstreamer-1.0/"))
            return rel
        if (this.starts_with(rel, "share/icons/"))
            return rel
        if (this.starts_with(rel, "share/icu/"))
            return rel
        if (this.starts_with(rel, "share/locale/"))
            return rel
        if (this.starts_with(rel, "share/themes/"))
            return rel
        if (this.starts_with(rel, "share/gtk-"))
            return rel
        if (this.starts_with(rel, "share/gdk-pixbuf-2.0/"))
            return rel
        if (this.starts_with(rel, "share/mime/"))
            return rel
        if (this.starts_with(rel, "etc/"))
            return rel

        return null
    }

    function stage_windows_runtime_support_path(opts, windir, rel) {
        local src = GLib.build_filenamev([opts.windows.sysroot, opts.windows.prefix, rel])
        if (!this.path_exists(src)) return

        if (this.is_directory(src)) {
            this.copy_runtime_bucket(opts, src, windir, rel, "Ooblerg runtime support", "manual_files")
        } else {
            this.copy_into_appdir(src, windir, rel, "Ooblerg runtime support")
            this.report_inc(opts, "manual_files")
        }
    }

    function stage_windows_runtime_support_files(opts, windir) {
        foreach (rel in [
            GLib.build_filenamev(["bin", "gdbus.exe"]),
            GLib.build_filenamev(["bin", "gspawn-win64-helper.exe"]),
            GLib.build_filenamev(["bin", "gspawn-win64-helper-console.exe"]),
            GLib.build_filenamev(["etc", "fonts"]),
            GLib.build_filenamev(["lib", "ossl-modules"]),
            GLib.build_filenamev(["lib", "engines-3"]),
            GLib.build_filenamev(["libexec", "gstreamer-1.0"]),
            GLib.build_filenamev(["share", "fontconfig"]),
            GLib.build_filenamev(["share", "gdal"]),
            GLib.build_filenamev(["share", "gst-plugins-base"]),
            GLib.build_filenamev(["share", "gstreamer-1.0"]),
            GLib.build_filenamev(["share", "icu"]),
            GLib.build_filenamev(["share", "locale"])
        ])
            this.stage_windows_runtime_support_path(opts, windir, rel)
    }

    function report_windows_package_dest(opts, dest_rel) {
        dest_rel = this.relative_dest(dest_rel)
        if (this.starts_with(dest_rel, GLib.build_filenamev(["lib", "gstreamer-1.0"]) + "/")) {
            if (this.ends_with(dest_rel, ".dll")) this.report_inc(opts, "gstreamer_plugins")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["lib", "girepository-1.0"]) + "/")) {
            if (this.ends_with(dest_rel, ".typelib")) this.report_inc(opts, "typelibs")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["share", "glib-2.0", "schemas"]) + "/")) {
            if (this.ends_with(dest_rel, ".xml")) this.report_inc(opts, "gsettings_schemas")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["lib", "gio", "modules"]) + "/")) {
            if (this.ends_with(dest_rel, ".dll")) this.report_inc(opts, "gio_modules")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["lib", "gdk-pixbuf-2.0"]) + "/")) {
            if (this.ends_with(dest_rel, ".dll")) this.report_inc(opts, "gdk_pixbuf_loaders")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["share", "themes"]) + "/") ||
                this.starts_with(dest_rel, GLib.build_filenamev(["share", "icons"]) + "/") ||
                this.starts_with(dest_rel, GLib.build_filenamev(["share", "gtk-4.0"]) + "/") ||
                this.starts_with(dest_rel, GLib.build_filenamev(["lib", "gtk-4.0"]) + "/")) {
            this.report_inc(opts, "gtk_data")
        }
    }


    function windows_system_dll(name) {
        local n = name.tolower()
        if (this.starts_with(n, "api-ms-win-")) return true
        if (this.starts_with(n, "ext-ms-win-")) return true
        if (this.starts_with(n, "api-ms-")) return true
        if (this.starts_with(n, "ext-ms-")) return true

        local system = [
            "advapi32.dll", "avicap32.dll", "avrt.dll", "bcrypt.dll",
            "cfgmgr32.dll", "comctl32.dll", "comdlg32.dll", "crypt32.dll",
            "d2d1.dll", "d3d9.dll", "d3d11.dll", "d3d12.dll",
            "dcomp.dll", "dbghelp.dll", "dnsapi.dll", "dsound.dll",
            "dwmapi.dll", "dwrite.dll", "dxgi.dll", "gdi32.dll",
            "gdiplus.dll", "glu32.dll", "hid.dll", "imm32.dll",
            "iphlpapi.dll", "kernel32.dll", "ksuser.dll", "mf.dll",
            "mfplat.dll", "mfreadwrite.dll", "mmdevapi.dll",
            "msimg32.dll", "msvcrt.dll", "mswsock.dll", "ncrypt.dll",
            "netapi32.dll", "ntdll.dll",
            "odbc32.dll", "odbccp32.dll", "ole32.dll", "oleaut32.dll",
            "opengl32.dll", "psapi.dll", "rpcrt4.dll",
            "secur32.dll", "setupapi.dll", "shcore.dll", "shell32.dll",
            "shlwapi.dll", "ucrtbase.dll", "urlmon.dll", "user32.dll",
            "userenv.dll", "usp10.dll", "uuid.dll", "version.dll",
            "winhttp.dll", "wininet.dll", "winmm.dll", "winspool.drv",
            "wldap32.dll", "ws2_32.dll", "wsock32.dll", "wtsapi32.dll",
            "xinput9_1_0.dll",
            "bcryptprimitives.dll"
        ]
        return this.array_contains(system, n)
    }

    function windows_dll_basename(path) {
        return this.basename(path).tolower()
    }

    function windows_dll_in_bundle(windir, dll_name) {
        local bin_path = GLib.build_filenamev([windir, "bin", dll_name])
        if (this.path_exists(bin_path)) return bin_path
        local lib_path = GLib.build_filenamev([windir, "lib", dll_name])
        if (this.path_exists(lib_path)) return lib_path
        foreach (dir in [windir + "/bin", windir + "/lib"])
            foreach (path in this.find_files(dir, "*", 1))
                if (this.basename(path).tolower() == dll_name.tolower()) return path
        return null
    }

    function windows_find_sysroot_dll(opts, dll_name) {
        local bin = GLib.build_filenamev([this.windows_sysroot_prefix_dir(opts), "bin"])
        local candidates = this.windows_sysroot_dll_name_candidates(dll_name)
        foreach (file in this.find_files(bin, "*", 1))
            foreach (candidate in candidates)
                if (this.basename(file).tolower() == candidate.tolower()) return file
        return null
    }

    function windows_sysroot_dll_name_candidates(dll_name) {
        local out = [dll_name]
        local lower = dll_name.tolower()
        if (!this.starts_with(lower, "lib"))
            out.push("lib" + dll_name)
        else if (dll_name.len() > 3)
            out.push(dll_name.slice(3))
        return out
    }

    function windows_objdump_tool() {
        local tool = this.executable_path("x86_64-w64-mingw32-objdump")
        if (tool != null) return tool
        tool = this.executable_path("objdump")
        if (tool != null) return tool
        this.fail("cannot resolve Windows DLL dependencies: install binutils-mingw-w64-x86-64 or provide objdump")
    }

    function windows_imported_dlls(path) {
        local result = PE.inspect(this.read_file(path))
        return result == null ? [] : result.dlls
    }

    function windows_pe_arch(path) {
        local result = PE.inspect(this.read_file(path))
        return result == null ? null : result.arch
    }

    function require_windows_pe_arch(path, expected_arch, label) {
        local actual = this.windows_pe_arch(path)
        if (actual == null) return

        local expected = this.normalize_appimage_arch(expected_arch)
        if (actual != expected) {
            this.fail(label + " has PE architecture " + actual +
                " but Windows target architecture is " + expected + ": " + path)
        }
    }

    function verify_windows_binary_arches(opts, windir) {
        foreach (path in this.windows_collect_binary_files(windir))
            this.require_windows_pe_arch(path, "x86_64", "Windows binary")
    }

    function windows_collect_binary_files(windir) {
        local out = []
        foreach (path in this.find_files(windir)) {
            local lower = path.tolower()
            if (this.ends_with(lower, ".exe") || this.ends_with(lower, ".dll")) out.push(path)
        }
        return out
    }

    function copy_windows_dependency_dll(opts, windir, dll_name) {
        local src = this.windows_find_sysroot_dll(opts, dll_name)
        if (src == null) return false

        local dest = GLib.build_filenamev([windir, "bin", dll_name])
        if (this.path_exists(dest)) return true

        this.copy_into_appdir(src, windir, GLib.build_filenamev(["bin", dll_name]), "Windows DLL dependency")
        return true
    }

    function resolve_windows_dll_dependencies(opts, windir) {
        local queue = this.windows_collect_binary_files(windir)
        local scanned = {}
        local copied = 0
        local missing = []

        while (queue.len() > 0) {
            local path = queue[0]
            queue.remove(0)

            local key = path.tolower()
            if (this.table_get(scanned, key, false)) continue
            scanned[key] <- true

            foreach (dll in this.windows_imported_dlls(path)) {
                if (this.windows_system_dll(dll)) continue

                local bundled = this.windows_dll_in_bundle(windir, dll)
                if (bundled != null) {
                    if (!this.table_get(scanned, bundled.tolower(), false)) queue.push(bundled)
                    continue
                }

                if (this.copy_windows_dependency_dll(opts, windir, dll)) {
                    local copied_path = this.windows_dll_in_bundle(windir, dll)
                    if (copied_path != null) {
                        copied++
                        queue.push(copied_path)
                    }
                } else if (!this.array_contains(missing, dll)) {
                    missing.push(dll)
                }
            }
        }

        if (copied > 0)
            this.info("copied " + copied + " recursively resolved Windows DLL dependency/dependencies")

        foreach (dll in missing)
            this.report_warn(opts, "Windows DLL dependency could not be resolved from Ooblerg sysroot: " + dll)
    }

}

return { SqgiPkgWindowsPackages = SqgiPkgWindowsPackages }
