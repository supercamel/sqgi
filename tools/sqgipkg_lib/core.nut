local GLib = import("GLib")
local Gio = import("Gio")

class SqgiPkgCore {
    function fail(message) {
        throw "sqgipkg: " + message
    }

    function info(message) {
        print("sqgipkg: " + message + "\n")
        stdout.flush()
    }

    function path_exists(path) {
        return Gio.File.new_for_path(path).query_exists(null)
    }

    function mkdir_p(path) {
        local rc = GLib.mkdir_with_parents(path, 493)
        if (rc != 0) this.fail("failed to create directory: " + path)
    }

    function write_file(path, contents) {
        local ok = GLib.file_set_contents(path, contents, -1)
        if (!ok) this.fail("failed to write file: " + path)
    }

    function read_file(path) {
        local data = Gio.File.new_for_path(path).load_contents(null)
        return (typeof(data) == "array") ? data[0] : data
    }

    function file_contains(path, needle) {
        try {
            return this.read_file(path).find(needle) != null
        } catch (e) {
            return false
        }
    }

    function chmod_exec(path) {
        this.run_shell("chmod 755 " + this.shell_quote(path), "make executable: " + path)
    }

    function replace_char(value, needle, replacement) {
        local out = ""
        for (local i = 0; i < value.len(); i++) {
            local ch = value.slice(i, i + 1)
            out += (ch == needle) ? replacement : ch
        }
        return out
    }

    function shell_quote(value) {
        local out = "'"
        for (local i = 0; i < value.len(); i++) {
            local ch = value.slice(i, i + 1)
            out += (ch == "'") ? "'\\''" : ch
        }
        return out + "'"
    }

    function shell_export(name, value) {
        if (value == null) value = ""
        return name + "=" + this.shell_quote(value) + "; export " + name + "; "
    }

    function run_shell(command, description) {
        local status = system(command)
        if (status != 0) this.fail(description + " failed")
    }

    function run_shell_status(command) {
        return system(command)
    }

    function run_shell_output(command) {
        local tmp = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-output-" + GLib.get_monotonic_time()])
        local status = system(command + " > " + this.shell_quote(tmp) + " 2>/dev/null")
        if (status != 0 || !this.path_exists(tmp)) {
            if (this.path_exists(tmp)) remove(tmp)
            return null
        }

        local text = this.read_file(tmp)
        remove(tmp)
        return text
    }

    function optional_command_output(command) {
        local output = this.run_shell_output(command)
        return output == null ? [] : this.split_lines(output)
    }

    function run_shell_in_dir(command, dir, description) {
        local status = system("cd " + this.shell_quote(dir) + " && " + command)
        if (status != 0) this.fail(description + " failed")
    }

    function contains_slash(value) {
        for (local i = 0; i < value.len(); i++) {
            if (value.slice(i, i + 1) == "/") return true
        }
        return false
    }

    function executable_available(path) {
        if (this.contains_slash(path)) return this.path_exists(path)
        return GLib.find_program_in_path(path) != null
    }

    function executable_path(path) {
        if (this.contains_slash(path)) return this.path_exists(path) ? path : null
        return GLib.find_program_in_path(path)
    }

    function dirname(path) {
        return GLib.path_get_dirname(path)
    }

    function basename(path) {
        return GLib.path_get_basename(path)
    }

    function strip_trailing_slashes(path) {
        while (path.len() > 1 && path.slice(path.len() - 1) == "/")
            path = path.slice(0, path.len() - 1)
        return path
    }

    function abs_path(path) {
        if (GLib.path_is_absolute(path)) return path
        if (path.len() >= 2 && path.slice(0, 2) == "./") path = path.slice(2)
        return GLib.build_filenamev([GLib.get_current_dir(), path])
    }

    function default_appimagetool_cache_dir() {
        return GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "tools"])
    }

    function default_sqgi_source_repo() {
        return "https://github.com/supercamel/sqgi.git"
    }

    function default_sqgi_source_cache_dir() {
        return GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "sources"])
    }

    function command_list_contains(commands, needle) {
        foreach (command in commands) {
            if (command.find(needle) != null) return true
        }
        return false
    }

    function machine_arch() {
        local tmp = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-uname-" + GLib.get_monotonic_time()])
        local status = system("uname -m > " + this.shell_quote(tmp))
        if (status == 0 && this.path_exists(tmp)) {
            try {
                local data = Gio.File.new_for_path(tmp).load_contents(null)
                remove(tmp)
                local text = (typeof(data) == "array") ? data[0] : data
                while (text.len() > 0 && (text.slice(text.len() - 1) == "\n" || text.slice(text.len() - 1) == "\r"))
                    text = text.slice(0, text.len() - 1)
                if (text.len() > 0) return text
            } catch (e) {}
        }
        return "x86_64"
    }

    function appimagetool_asset_arch() {
        local arch = this.machine_arch()
        if (arch == "amd64") return "x86_64"
        if (arch == "arm64") return "aarch64"
        return arch
    }

    function normalize_appimage_arch(arch) {
        if (arch == null || arch == "") return this.appimagetool_asset_arch()
        if (arch == "amd64" || arch == "x64") return "x86_64"
        if (arch == "arm64") return "aarch64"
        return arch
    }

    function deb_arch_for_appimage_arch(arch) {
        arch = this.normalize_appimage_arch(arch)
        if (arch == "x86_64") return "amd64"
        if (arch == "aarch64") return "arm64"
        if (arch == "i386" || arch == "i686") return "i386"
        return arch
    }

    function linux_triplet_for_appimage_arch(arch) {
        arch = this.normalize_appimage_arch(arch)
        if (arch == "x86_64") return "x86_64-linux-gnu"
        if (arch == "aarch64") return "aarch64-linux-gnu"
        if (arch == "i386" || arch == "i686") return "i386-linux-gnu"
        return arch + "-linux-gnu"
    }

    function linux_arch_display_suffix(arch) {
        return this.normalize_appimage_arch(arch)
    }

    function elf_appimage_arch(path) {
        if (!this.executable_available("readelf")) return null

        local output = this.run_shell_output("readelf -h " + this.shell_quote(path))
        if (output == null) return null

        foreach (line in this.split_lines(output)) {
            if (line.find("Machine:") == null) continue
            if (line.find("AArch64") != null) return "aarch64"
            if (line.find("X86-64") != null) return "x86_64"
            if (line.find("80386") != null) return "i386"
        }

        return null
    }

    function require_elf_appimage_arch(path, expected_arch, label) {
        local expected = this.normalize_appimage_arch(expected_arch)
        local actual = this.elf_appimage_arch(path)
        if (actual == null) return

        if (actual != expected) {
            this.fail(label + " has ELF architecture " + actual +
                " but target AppImage architecture is " + expected + ": " + path)
        }
    }

    function appimagetool_download_url() {
        return "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-" +
            this.appimagetool_asset_arch() + ".AppImage"
    }

    function downloader_command(url, dest) {
        if (this.starts_with(url, "file://"))
            return "cp " + this.shell_quote(url.slice(7)) + " " + this.shell_quote(dest)
        if (this.executable_available("curl"))
            return "curl -L --fail --show-error --output " + this.shell_quote(dest) + " " + this.shell_quote(url)
        if (this.executable_available("wget"))
            return "wget -O " + this.shell_quote(dest) + " " + this.shell_quote(url)
        this.fail("cannot download URL: install curl or wget")
    }

    function download_latest_appimagetool(cache_dir) {
        this.mkdir_p(cache_dir)

        local tool = GLib.build_filenamev([cache_dir, "appimagetool-" + this.appimagetool_asset_arch() + ".AppImage"])
        local tmp = tool + ".download"
        local url = this.appimagetool_download_url()

        this.info("downloading latest appimagetool")
        this.run_shell(this.downloader_command(url, tmp), "downloading appimagetool")
        this.chmod_exec(tmp)
        if (this.path_exists(tool)) remove(tool)
        rename(tmp, tool)
        this.chmod_exec(tool)

        return tool
    }

    function resolve_appimagetool(opts) {
        if (opts.refresh_appimagetool)
            return this.download_latest_appimagetool(opts.appimagetool_cache)

        local existing = this.executable_path(opts.appimagetool)
        if (existing != null) return existing

        return this.download_latest_appimagetool(opts.appimagetool_cache)
    }

    function is_alnum_lower(ch) {
        local c = ch[0]
        return (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')
    }

    function trim_dashes(value) {
        while (value.len() > 0 && value.slice(0, 1) == "-") value = value.slice(1)
        while (value.len() > 0 && value.slice(value.len() - 1) == "-") value = value.slice(0, value.len() - 1)
        return value
    }

    function split_once(value, needle) {
        for (local i = 0; i < value.len(); i++) {
            if (value.slice(i, i + 1) == needle) {
                return [value.slice(0, i), value.slice(i + 1)]
            }
        }
        return [value, null]
    }

    function split_lines(value) {
        local out = []
        local start = 0
        for (local i = 0; i <= value.len(); i++) {
            if (i == value.len() || value.slice(i, i + 1) == "\n") {
                local line = value.slice(start, i)
                if (line.len() > 0 && line.slice(line.len() - 1) == "\r")
                    line = line.slice(0, line.len() - 1)
                if (line.len() > 0) out.push(line)
                start = i + 1
            }
        }
        return out
    }

    function split_path(value) {
        local out = []
        local start = 0
        for (local i = 0; i <= value.len(); i++) {
            if (i == value.len() || value.slice(i, i + 1) == "/") {
                if (i > start) out.push(value.slice(start, i))
                start = i + 1
            }
        }
        return out
    }

    function starts_with(value, prefix) {
        return value.len() >= prefix.len() && value.slice(0, prefix.len()) == prefix
    }

    function ends_with(value, suffix) {
        return value.len() >= suffix.len() && value.slice(value.len() - suffix.len()) == suffix
    }

    function replace_suffix(value, suffix, replacement) {
        if (!this.ends_with(value, suffix)) return value
        return value.slice(0, value.len() - suffix.len()) + replacement
    }

    function append_value(list, value) {
        list.push(value)
    }

    function append_values(list, values) {
        if (values == null) return
        if (typeof(values) == "array") {
            foreach (value in values) list.push(value)
        } else {
            list.push(values)
        }
    }

    function array_copy(list) {
        local out = []
        foreach (value in list) out.push(value)
        return out
    }

    function array_join(a, b) {
        local out = this.array_copy(a)
        foreach (value in b) out.push(value)
        return out
    }

    function array_contains(list, value) {
        foreach (item in list) {
            if (item == value) return true
        }
        return false
    }

    function join_strings(list, separator) {
        local out = ""
        foreach (i, value in list) {
            if (i > 0) out += separator
            out += value
        }
        return out
    }

    function table_get(table, key, fallback = null) {
        try {
            return table[key]
        } catch (e) {
            return fallback
        }
    }

    function new_report() {
        return {
            scripts_compiled = 0,
            scripts_copied = 0,
            script_links = 0,
            manual_files = 0,
            includes = 0,
            libraries = 0,
            native_projects = 0,
            resources = 0,
            gstreamer_plugins = 0,
            typelibs = 0,
            gsettings_schemas = 0,
            gtk_data = 0,
            gio_modules = 0,
            gdk_pixbuf_loaders = 0,
            fonts = 0,
            used_gtk = false,
            used_gst = false,
            used_gdk_pixbuf = false,
            used_soup = false,
            warnings = []
        }
    }

    function report_inc(opts, key) {
        opts.report[key] = this.table_get(opts.report, key, 0) + 1
    }

    function report_warn(opts, message) {
        opts.report.warnings.push(message)
    }

    function relative_dest(dest) {
        if (dest.len() == 0) this.fail("empty destination in include spec")
        if (GLib.path_is_absolute(dest)) this.fail("include destination must be relative: " + dest)

        // Collapse "." and ".." segments so destinations derived from valid
        // file-relative imports (e.g. "src/ui/../util.nut") resolve to the same
        // location the runtime importer would use, instead of being rejected
        // outright. A ".." that would climb above the package root is still an
        // error, since that escapes the staging directory.
        local parts = []
        local part = ""
        for (local i = 0; i <= dest.len(); i++) {
            local end = i == dest.len()
            local ch = end ? "/" : dest.slice(i, i + 1)
            if (ch == "/") {
                if (part == "" || part == ".") {
                    // Drop empty and current-directory segments.
                } else if (part == "..") {
                    if (parts.len() == 0)
                        this.fail("include destination escapes package root: " + dest)
                    parts.pop()
                } else {
                    parts.push(part)
                }
                part = ""
            } else {
                part += ch
            }
        }

        if (parts.len() == 0) this.fail("include destination resolves to package root: " + dest)

        local normalized = parts[0]
        for (local i = 1; i < parts.len(); i++) normalized += "/" + parts[i]
        return normalized
    }

    function shell_has_matches(pattern) {
        return system("find " + this.shell_quote(this.dirname(pattern)) + " -maxdepth 1 -name " + this.shell_quote(this.basename(pattern)) + " | grep -q .") == 0
    }

    function sanitize_id(raw) {
        local lowered = raw.tolower()
        local out = ""
        local last_dash = false

        for (local i = 0; i < lowered.len(); i++) {
            local ch = lowered.slice(i, i + 1)
            if (this.is_alnum_lower(ch)) {
                out += ch
                last_dash = false
            } else if (!last_dash) {
                out += "-"
                last_dash = true
            }
        }

        out = this.trim_dashes(out)
        return (out.len() == 0) ? "sqgi-app" : out
    }

    function package_basename(raw) {
        local out = ""
        local last_dash = false

        for (local i = 0; i < raw.len(); i++) {
            local ch = raw.slice(i, i + 1)
            local c = ch[0]
            local control = c < 32 || c == 127
            if (ch == "/" || control) {
                if (!last_dash) {
                    out += "-"
                    last_dash = true
                }
            } else {
                out += ch
                last_dash = false
            }
        }

        out = this.trim_dashes(out)
        return (out.len() == 0) ? "sqgi-app" : out
    }

}

return { SqgiPkgCore = SqgiPkgCore }
