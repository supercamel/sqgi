local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("manifest.nut")

class SqgiPkgScripts extends Base.SqgiPkgManifest {
    function copy_sqgi_runtime(opts, appdir) {
        local build_dir = opts.build_dir
        local sqgi_bin = GLib.build_filenamev([build_dir, "sqgi"])
        local libsqgi = GLib.build_filenamev([build_dir, "libsqgi.so.0"])

        if (!this.path_exists(sqgi_bin)) {
            local app_arch = this.normalize_appimage_arch(opts.appimage_arch)
            local host_arch = this.normalize_appimage_arch(this.machine_arch())
            if (app_arch != host_arch) {
                this.fail("sqgi binary for " + app_arch + " not found at " + sqgi_bin +
                    "; build SQGI for that architecture or set linux.arches[].build_dir")
            }

            local installed_sqgi = this.executable_path("sqgi")
            if (installed_sqgi == null)
                this.fail("sqgi binary not found at " + sqgi_bin + " or in PATH; install sqgi or run cmake --build " + build_dir)
            sqgi_bin = installed_sqgi
            libsqgi = this.first_ldd_library(sqgi_bin, "libsqgi")
        }

        this.mkdir_p(GLib.build_filenamev([appdir, "usr", "bin"]))
        this.mkdir_p(GLib.build_filenamev([appdir, "usr", "lib"]))

        this.run_shell(
            "cp " + this.shell_quote(sqgi_bin) + " " + this.shell_quote(GLib.build_filenamev([appdir, "usr", "bin", "sqgi"])),
            "copying sqgi"
        )

        if (libsqgi != null && this.path_exists(libsqgi)) {
            if (this.starts_with(libsqgi, build_dir)) {
                this.run_shell(
                    "cp -P " + this.shell_quote(build_dir) + "/libsqgi.so* " + this.shell_quote(GLib.build_filenamev([appdir, "usr", "lib"])) + "/",
                    "copying libsqgi"
                )
            } else {
                this.run_shell(
                    "cp -P " + this.shell_quote(libsqgi) + " " + this.shell_quote(GLib.build_filenamev([appdir, "usr", "lib"])) + "/",
                    "copying libsqgi"
                )
            }
        } else {
            this.info("no separate libsqgi runtime found; assuming sqgi is self-contained")
        }
    }

    function copy_into_appdir(src, appdir, dest_rel, description) {
        local src_abs = this.abs_path(src)
        if (!this.path_exists(src_abs)) this.fail(description + " not found: " + src)

        dest_rel = this.relative_dest(dest_rel)
        local dest_abs = GLib.build_filenamev([appdir, dest_rel])
        this.mkdir_p(this.dirname(dest_abs))
        this.run_shell(
            "cp -a " + this.shell_quote(src_abs) + " " + this.shell_quote(dest_abs),
            "copying " + description
        )
    }

    function copy_to_dir(src, appdir, dest_dir_rel, description) {
        local src_abs = this.abs_path(src)
        if (!this.path_exists(src_abs)) this.fail(description + " not found: " + src)

        local dest_dir_abs = GLib.build_filenamev([appdir, this.relative_dest(dest_dir_rel)])
        this.mkdir_p(dest_dir_abs)
        this.run_shell(
            "cp -a " + this.shell_quote(src_abs) + " " + this.shell_quote(dest_dir_abs) + "/",
            "copying " + description
        )
    }

    function script_dest_for_source(src, script_root = null) {
        local src_abs = this.abs_path(src)
        if (script_root != null) {
            local root = this.strip_trailing_slashes(this.abs_path(script_root))
            local prefix = root + "/"
            if (src_abs == root) return this.basename(src_abs)
            if (this.starts_with(src_abs, prefix)) return src_abs.slice(prefix.len())
        }
        return this.basename(src_abs)
    }

    function is_space_char(ch) {
        return ch == " " || ch == "\t" || ch == "\n" || ch == "\r"
    }

    function is_identifier_char(ch) {
        if (ch == "_") return true
        local c = ch[0]
        return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')
    }

    function import_literal_at(text, pos) {
        if (pos + 6 > text.len() || text.slice(pos, pos + 6) != "import") return null
        if (pos > 0 && this.is_identifier_char(text.slice(pos - 1, pos))) return null

        local j = pos + 6
        if (j < text.len() && this.is_identifier_char(text.slice(j, j + 1))) return null
        while (j < text.len() && this.is_space_char(text.slice(j, j + 1))) j++
        if (j >= text.len() || text.slice(j, j + 1) != "(") return null
        j++
        while (j < text.len() && this.is_space_char(text.slice(j, j + 1))) j++
        if (j >= text.len()) return null

        local quote = text.slice(j, j + 1)
        if (quote != "\"" && quote != "'") return null
        j++

        local value = ""
        local escaped = false
        while (j < text.len()) {
            local ch = text.slice(j, j + 1)
            if (escaped) {
                value += ch
                escaped = false
                j++
                continue
            }
            if (ch == "\\") {
                escaped = true
                j++
                continue
            }
            if (ch == quote)
                return { value = value, next = j + 1 }
            value += ch
            j++
        }

        return null
    }

    function script_import_literals(src_abs) {
        local out = []
        if (!this.ends_with(src_abs, ".nut")) return out

        local text = this.read_file(src_abs)
        local i = 0
        local mode = "code"
        local quote = ""

        while (i < text.len()) {
            local ch = text.slice(i, i + 1)
            local next = (i + 1 < text.len()) ? text.slice(i + 1, i + 2) : ""

            if (mode == "line-comment") {
                if (ch == "\n") mode = "code"
                i++
                continue
            }

            if (mode == "block-comment") {
                if (ch == "*" && next == "/") {
                    mode = "code"
                    i += 2
                } else {
                    i++
                }
                continue
            }

            if (mode == "string") {
                if (ch == "\\") {
                    i += 2
                    continue
                }
                if (ch == quote) mode = "code"
                i++
                continue
            }

            if (ch == "/" && next == "/") {
                mode = "line-comment"
                i += 2
                continue
            }
            if (ch == "/" && next == "*") {
                mode = "block-comment"
                i += 2
                continue
            }
            if (ch == "\"" || ch == "'") {
                mode = "string"
                quote = ch
                i++
                continue
            }

            local parsed = this.import_literal_at(text, i)
            if (parsed != null) {
                if (!this.array_contains(out, parsed.value)) out.push(parsed.value)
                i = parsed.next
                continue
            }

            i++
        }

        return out
    }

    function normalize_script_import_path(path) {
        while (this.starts_with(path, "./")) path = path.slice(2)
        return path
    }

    function is_local_script_import(path) {
        if (!this.ends_with(path, ".nut")) return false
        if (path.find("://") != null) return false
        if (GLib.path_is_absolute(path) || this.is_windows_drive_path(path)) return false
        return true
    }

    function script_source_for_import(src_abs, import_path, source_root = null) {
        local path = this.normalize_script_import_path(import_path)
        local sibling = GLib.build_filenamev([this.dirname(src_abs), path])
        if (this.path_exists(sibling)) return sibling

        if (source_root != null) {
            local rooted = GLib.build_filenamev([source_root, path])
            if (this.path_exists(rooted)) return rooted
        }

        return sibling
    }

    function script_dest_for_import(parent_dest_rel, import_path, dest_root_rel = null) {
        local path = this.normalize_script_import_path(import_path)
        if (dest_root_rel != null) return GLib.build_filenamev([dest_root_rel, path])

        local parent_dir = this.dirname(parent_dest_rel)
        if (parent_dir == "" || parent_dir == ".") return path
        return GLib.build_filenamev([parent_dir, path])
    }

    function scan_script_imports(opts, src_abs) {
        if (!this.ends_with(src_abs, ".nut")) return
        if (this.file_contains(src_abs, "import(\"Gtk") || this.file_contains(src_abs, "import('Gtk"))
            opts.report.used_gtk = true
        if (this.file_contains(src_abs, "import(\"Gst") || this.file_contains(src_abs, "import('Gst"))
            opts.report.used_gst = true
    }

    function scan_script_import_tree(opts, src, visited, source_root = null) {
        local src_abs = this.abs_path(src)
        if (this.table_get(visited, src_abs, false)) return
        visited[src_abs] <- true

        this.scan_script_imports(opts, src_abs)
        foreach (import_path in this.script_import_literals(src_abs)) {
            if (!this.is_local_script_import(import_path)) continue

            local dep_src = this.script_source_for_import(src_abs, import_path, source_root)
            if (this.path_exists(dep_src))
                this.scan_script_import_tree(opts, dep_src, visited, source_root)
        }
    }

    function scan_project_imports(opts) {
        local visited = {}

        if (opts.script != "") {
            local script_abs = this.abs_path(opts.script)
            this.scan_script_import_tree(opts, script_abs, visited, this.dirname(script_abs))
        }

        foreach (spec in opts.scripts) {
            local parts = this.split_once(spec, "=")
            local src_abs = this.abs_path(parts[0])
            this.scan_script_import_tree(opts, src_abs, visited, this.dirname(src_abs))
        }

        local main_script_abs = opts.script == "" ? "" : this.abs_path(opts.script)
        foreach (dir in opts.script_dirs) {
            local dir_abs = this.abs_path(dir)
            foreach (src in this.list_nut_files(dir)) {
                local src_abs = this.abs_path(src)
                if (src_abs != main_script_abs)
                    this.scan_script_import_tree(opts, src_abs, visited, dir_abs)
            }
        }
    }

    function append_unique(list, value) {
        if (!this.array_contains(list, value)) list.push(value)
    }

    function msys2_package_prefix(opts) {
        local prefix = opts.windows.msys2_prefix
        if (prefix == "ucrt64") return "mingw-w64-ucrt-x86_64"
        if (prefix == "clang64") return "mingw-w64-clang-x86_64"
        if (prefix == "clangarm64") return "mingw-w64-clang-aarch64"
        if (prefix == "mingw32") return "mingw-w64-i686"
        return "mingw-w64-x86_64"
    }

    function msys2_pkg(opts, name) {
        return this.msys2_package_prefix(opts) + "-" + name
    }

    function apply_windows_package_defaults(opts) {
        if (!this.starts_with(opts.target, "win-")) return
        if (!opts.windows.auto_packages) return

        this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "glib2"))
        this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "gobject-introspection"))
        // Build-time GI provides headers/tools; runtime GI provides the DLL name
        // older consumers still link against (libgirepository-1.0-1.dll).
        this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "gobject-introspection-runtime"))
        this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "libffi"))
        this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "cairo"))

        if (opts.report.used_gtk)
            this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "gtk4"))

        if (opts.report.used_gst) {
            this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "gstreamer"))
            this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "gst-plugins-base"))
            this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "gst-plugins-good"))
            if (opts.report.used_gtk)
                this.append_unique(opts.windows.packages, this.msys2_pkg(opts, "gst-plugin-gtk"))
        }
    }

}

return { SqgiPkgScripts = SqgiPkgScripts }
