local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("env.nut")

class SqgiPkgWindowsMsys2 extends Base.SqgiPkgWindowsEnv {
    function default_msys2_package_cache_dir() {
        return GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "msys2"])
    }

    function trim_trailing_slash(value) {
        while (value.len() > 1 && value.slice(value.len() - 1) == "/")
            value = value.slice(0, value.len() - 1)
        return value
    }

    function msys2_repo_url(opts) {
        if (opts.windows.repo_url != "")
            return this.trim_trailing_slash(opts.windows.repo_url)

        local prefix = opts.windows.msys2_prefix
        return "https://repo.msys2.org/mingw/" + prefix
    }

    function url_basename(url) {
        url = this.trim_trailing_slash(url)
        local parts = this.split_path(url)
        return parts.len() == 0 ? url : parts[parts.len() - 1]
    }

    function msys2_repo_name(repo_url) {
        return this.url_basename(repo_url)
    }

    function msys2_package_cache(opts) {
        return opts.windows.package_cache == ""
            ? this.default_msys2_package_cache_dir()
            : opts.windows.package_cache
    }

    function download_file(url, dest, description, force = false) {
        if (force && this.path_exists(dest)) remove(dest)
        if (this.path_exists(dest)) return
        this.mkdir_p(this.dirname(dest))
        local tmp = dest + ".download"
        if (this.path_exists(tmp)) remove(tmp)
        this.info("downloading " + url)
        this.run_shell(this.downloader_command(url, tmp), description)
        rename(tmp, dest)
    }

    function read_pacman_desc(path) {
        local out = {}
        local key = null

        foreach (line in this.split_lines(this.read_file(path))) {
            if (line.len() >= 2 && line.slice(0, 1) == "%" && line.slice(line.len() - 1) == "%") {
                key = line.slice(1, line.len() - 1)
                out[key] <- []
            } else if (key != null && line.len() > 0) {
                out[key].push(line)
            }
        }

        return out
    }

    function first_desc_value(desc, key) {
        local values = this.table_get(desc, key)
        if (values == null || values.len() == 0) return null
        return values[0]
    }

    function strip_dependency_version(dep) {
        local out = ""
        for (local i = 0; i < dep.len(); i++) {
            local ch = dep.slice(i, i + 1)
            if (ch == "<" || ch == ">" || ch == "=") break
            out += ch
        }
        return out
    }

    function load_msys2_repo_index(opts) {
        local repo_url = this.msys2_repo_url(opts)
        local repo_name = this.msys2_repo_name(repo_url)
        local cache_dir = GLib.build_filenamev([this.msys2_package_cache(opts), repo_name])
        local db_archive = GLib.build_filenamev([cache_dir, repo_name + ".db"])
        local db_extract = GLib.build_filenamev([cache_dir, "db"])

        this.download_file(repo_url + "/" + repo_name + ".db", db_archive,
            "downloading MSYS2 repo database", opts.windows.refresh_packages)
        this.run_shell("rm -rf " + this.shell_quote(db_extract), "clearing MSYS2 repo database cache")
        this.mkdir_p(db_extract)
        this.run_shell("tar -xf " + this.shell_quote(db_archive) + " -C " + this.shell_quote(db_extract),
            "extracting MSYS2 repo database")

        local desc_paths = this.list_command_output(
            "find " + this.shell_quote(db_extract) + " -type f -name desc | sort",
            "listing MSYS2 repo packages"
        )

        local index = {}
        foreach (desc_path in desc_paths) {
            local desc = this.read_pacman_desc(desc_path)
            local name = this.first_desc_value(desc, "NAME")
            local filename = this.first_desc_value(desc, "FILENAME")
            if (name == null || filename == null) continue
            index[name] <- {
                name = name,
                filename = filename,
                depends = this.table_get(desc, "DEPENDS", [])
            }
        }

        return index
    }

    function resolve_msys2_package(opts, index, package_name, resolved, visiting, ordered) {
        if (this.table_get(resolved, package_name, false)) return
        if (this.table_get(visiting, package_name, false)) return

        local entry = this.table_get(index, package_name)
        if (entry == null) {
            this.report_warn(opts, "MSYS2 dependency not found in repo metadata: " + package_name)
            return
        }

        visiting[package_name] <- true
        foreach (dep in entry.depends) {
            local dep_name = this.strip_dependency_version(dep)
            if (dep_name.len() == 0) continue
            this.resolve_msys2_package(opts, index, dep_name, resolved, visiting, ordered)
        }
        visiting[package_name] <- false
        resolved[package_name] <- true
        ordered.push(entry)
    }

    function msys2_installed(opts, package_name) {
        local root = opts.windows.msys2_root
        if (root == "") return false
        local db = GLib.build_filenamev([root, "var", "lib", "pacman", "local"])
        if (!this.path_exists(db)) return false

        local candidates = this.list_command_output(
            "find " + this.shell_quote(db) + " -maxdepth 1 -type d -name " + this.shell_quote(package_name + "-*") + " | sort",
            "checking MSYS2 package metadata"
        )
        foreach (candidate in candidates) {
            if (this.msys2_metadata_name(candidate) == package_name)
                return true
        }
        return false
    }

    function package_local_dir_name(entry) {
        local filename = entry.filename
        local suffix = ".pkg.tar"
        local idx = filename.find(suffix)
        if (idx != null) filename = filename.slice(0, idx)

        local prefix = entry.name + "-"
        if (this.starts_with(filename, prefix))
            return filename
        return entry.name
    }

    function write_msys2_local_metadata(opts, entry, file_list) {
        local local_dir = GLib.build_filenamev([
            opts.windows.msys2_root,
            "var", "lib", "pacman", "local",
            this.package_local_dir_name(entry)
        ])
        this.mkdir_p(local_dir)

        local desc = "%NAME%\n" + entry.name + "\n"
        if (entry.filename != null) desc += "\n%FILENAME%\n" + entry.filename + "\n"
        if (entry.depends.len() > 0) {
            desc += "\n%DEPENDS%\n"
            foreach (dep in entry.depends)
                desc += dep + "\n"
        }
        this.write_file(GLib.build_filenamev([local_dir, "desc"]), desc)

        local files = "%FILES%\n"
        foreach (path in file_list)
            files += path + "\n"
        this.write_file(GLib.build_filenamev([local_dir, "files"]), files)
    }

    function extract_msys2_package(opts, repo_url, entry) {
        local repo_name = this.msys2_repo_name(repo_url)
        local cache_dir = GLib.build_filenamev([this.msys2_package_cache(opts), repo_name, "packages"])
        local archive = GLib.build_filenamev([cache_dir, entry.filename])
        this.download_file(repo_url + "/" + entry.filename, archive,
            "downloading MSYS2 package", opts.windows.refresh_packages)

        local file_list = []
        foreach (line in this.list_command_output("tar -tf " + this.shell_quote(archive), "listing MSYS2 package archive")) {
            local path = this.normalize_package_entry(line)
            if (path.len() == 0) continue
            if (this.starts_with(path, ".")) continue
            file_list.push(path)
        }

        this.mkdir_p(opts.windows.msys2_root)
        this.run_shell("tar -xf " + this.shell_quote(archive) + " -C " + this.shell_quote(opts.windows.msys2_root),
            "extracting MSYS2 package")
        this.write_msys2_local_metadata(opts, entry, file_list)
        this.info("installed MSYS2 package into sysroot: " + entry.name)
    }

    function ensure_msys2_packages(opts) {
        if (!this.starts_with(opts.target, "win-")) return
        if (opts.windows.packages.len() == 0) return

        if (opts.windows.msys2_root == "")
            opts.windows.msys2_root = GLib.build_filenamev([opts.output_dir, "_msys2-" + opts.windows.msys2_prefix])

        if (!opts.windows.download_packages) return

        local missing = []
        foreach (package_name in opts.windows.packages) {
            if (!this.msys2_installed(opts, package_name))
                missing.push(package_name)
        }
        if (missing.len() == 0) return

        local repo_url = this.msys2_repo_url(opts)
        local index = this.load_msys2_repo_index(opts)
        local resolved = {}
        local visiting = {}
        local ordered = []

        foreach (package_name in missing)
            this.resolve_msys2_package(opts, index, package_name, resolved, visiting, ordered)

        foreach (entry in ordered) {
            if (!this.msys2_installed(opts, entry.name))
                this.extract_msys2_package(opts, repo_url, entry)
            if (!this.array_contains(opts.windows.packages, entry.name))
                opts.windows.packages.push(entry.name)
        }
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

        if (this.starts_with(rel, "bin/") && this.ends_with(rel, ".dll"))
            return rel
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

    function msys2_package_files(opts, package_name) {
        local root = opts.windows.msys2_root
        if (root == "") this.fail("MSYS2 package staging requires windows.msys2_root or --msys2-root")

        local db = GLib.build_filenamev([root, "var", "lib", "pacman", "local"])
        if (!this.path_exists(db)) this.fail("MSYS2 pacman database not found: " + db)

        local candidates = this.list_command_output(
            "find " + this.shell_quote(db) + " -maxdepth 1 -type d -name " + this.shell_quote(package_name + "-*") + " | sort",
            "listing MSYS2 package metadata"
        )
        local matches = []
        foreach (candidate in candidates) {
            if (this.msys2_metadata_name(candidate) == package_name)
                matches.push(candidate)
        }
        if (matches.len() == 0)
            this.fail("MSYS2 package is not installed in " + root + ": " + package_name)

        local files_path = GLib.build_filenamev([matches[matches.len() - 1], "files"])
        if (!this.path_exists(files_path)) this.fail("MSYS2 package file list missing: " + files_path)

        local out = []
        foreach (line in this.split_lines(this.read_file(files_path))) {
            if (line.len() == 0) continue
            if (this.starts_with(line, "%")) continue
            out.push(line)
        }
        return out
    }

    function msys2_metadata_name(dir) {
        local desc = GLib.build_filenamev([dir, "desc"])
        if (!this.path_exists(desc)) return null

        local want_name = false
        foreach (line in this.split_lines(this.read_file(desc))) {
            if (want_name && line.len() > 0)
                return line
            want_name = (line == "%NAME%")
        }
        return null
    }

    function stage_msys2_package(opts, windir, package_name) {
        local copied = 0
        foreach (entry in this.msys2_package_files(opts, package_name)) {
            local dest = this.windows_package_dest(entry, opts.windows.msys2_prefix)
            if (dest == null) continue

            local src = GLib.build_filenamev([opts.windows.msys2_root, this.normalize_package_entry(entry)])
            if (!this.path_exists(src)) continue
            this.copy_into_appdir(src, windir, dest, "MSYS2 package file")
            this.report_windows_package_dest(opts, dest)
            copied++
        }

        if (copied == 0)
            this.report_warn(opts, "MSYS2 package had no selected runtime files: " + package_name)
        else
            this.info("copied " + copied + " runtime file(s) from MSYS2 package " + package_name)
    }

    function stage_windows_runtime_support_path(opts, windir, rel) {
        local src = GLib.build_filenamev([opts.windows.msys2_root, opts.windows.msys2_prefix, rel])
        if (!this.path_exists(src)) return

        if (this.run_shell_status("[ -d " + this.shell_quote(src) + " ]") == 0) {
            this.copy_runtime_bucket(opts, src, windir, rel, "MSYS2 runtime support", "manual_files")
        } else {
            this.copy_into_appdir(src, windir, rel, "MSYS2 runtime support")
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
        return null
    }

    function windows_find_sysroot_dll(opts, dll_name) {
        local prefix_dir = this.windows_sysroot_prefix_dir(opts)
        foreach (candidate in this.windows_sysroot_dll_name_candidates(dll_name)) {
            local direct = GLib.build_filenamev([prefix_dir, "bin", candidate])
            if (this.path_exists(direct)) return direct

            // Case-insensitive fallback for filesystems/packages with odd casing.
            local hits = this.optional_command_output(
                "find " + this.shell_quote(GLib.build_filenamev([prefix_dir, "bin"])) +
                " -maxdepth 1 -type f -iname " + this.shell_quote(candidate) + " | sort"
            )
            if (hits.len() > 0) return hits[0]
        }

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
        local tool = this.windows_objdump_tool()
        local dlls = []
        foreach (line in this.optional_command_output(
                this.shell_quote(tool) + " -p " + this.shell_quote(path) +
                " | sed -n 's/^[[:space:]]*DLL Name: //p'")) {
            local name = line
            while (name.len() > 0 && name.slice(0, 1) == " ") name = name.slice(1)
            while (name.len() > 0 && (name.slice(name.len() - 1) == " " || name.slice(name.len() - 1) == "\r"))
                name = name.slice(0, name.len() - 1)
            if (name.len() > 0 && !this.array_contains(dlls, name))
                dlls.push(name)
        }
        return dlls
    }

    function windows_pe_arch(path) {
        local tool = this.windows_objdump_tool()
        local output = this.run_shell_output(this.shell_quote(tool) + " -f " + this.shell_quote(path))
        if (output == null) return null

        foreach (line in this.split_lines(output)) {
            if (line.find("pei-x86-64") != null ||
                    line.find("pe-x86-64") != null ||
                    line.find("i386:x86-64") != null)
                return "x86_64"
            if (line.find("pei-i386") != null ||
                    line.find("pe-i386") != null ||
                    line.find("i386") != null)
                return "i386"
            if (line.find("pei-aarch64") != null ||
                    line.find("pe-aarch64") != null ||
                    line.find("AArch64") != null)
                return "aarch64"
        }

        return null
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
        return this.optional_command_output(
            "find " + this.shell_quote(windir) +
            " -type f \\( -iname '*.exe' -o -iname '*.dll' \\) | sort"
        )
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
            this.report_warn(opts, "Windows DLL dependency could not be resolved from MSYS2 sysroot: " + dll)
    }

}

return { SqgiPkgWindowsMsys2 = SqgiPkgWindowsMsys2 }
