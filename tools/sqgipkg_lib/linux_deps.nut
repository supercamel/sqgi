local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("staging.nut")

class SqgiPkgLinuxDeps extends Base.SqgiPkgStaging {
    apt_show_cache = null

    function linux_current_config(opts) {
        return this.table_get(opts, "linux_current", null)
    }

    function linux_current_arch(opts) {
        return this.normalize_appimage_arch(opts.appimage_arch)
    }

    function linux_current_deb_arch(opts) {
        local config = this.table_get(opts, "linux_current", null)
        if (config != null && this.table_get(config, "package_arch", "") != "")
            return config.package_arch
        return this.deb_arch_for_appimage_arch(this.linux_current_arch(opts))
    }

    function linux_current_triplet(opts) {
        return this.linux_triplet_for_appimage_arch(this.linux_current_arch(opts))
    }

    function linux_current_sysroot(opts) {
        local config = this.linux_current_config(opts)
        local sysroot = config == null ? "" : this.table_get(config, "sysroot", "")
        if (sysroot == "") sysroot = opts.linux.sysroot
        return this.linux_normalize_sysroot_path(sysroot)
    }

    function linux_normalize_sysroot_path(sysroot) {
        if (sysroot == "") return ""
        return this.strip_trailing_slashes(this.abs_path(sysroot))
    }

    function linux_current_is_cross(opts) {
        return this.linux_current_arch(opts) != this.normalize_appimage_arch(this.machine_arch())
    }

    function linux_has_cross_build_work(opts) {
        local config = this.linux_current_config(opts)
        if (opts.linux.build.len() > 0) return true
        if (config != null && this.table_get(config, "build", []).len() > 0) return true

        foreach (project in opts.native_projects) {
            if (project.build.len() > 0) return true
        }

        return false
    }

    function linux_cross_dir(opts) {
        return GLib.build_filenamev([this.abs_path(opts.output_dir), "_cross", this.linux_current_arch(opts)])
    }

    function linux_cmake_toolchain_path(opts) {
        local config = this.linux_current_config(opts)
        local configured = config == null ? "" : this.table_get(config, "cmake_toolchain", "")
        if (configured != "") return this.abs_path(configured)
        return GLib.build_filenamev([this.linux_cross_dir(opts), "toolchain-" + this.linux_current_arch(opts) + ".cmake"])
    }

    function linux_meson_cross_file_path(opts) {
        local config = this.linux_current_config(opts)
        local configured = config == null ? "" : this.table_get(config, "meson_cross_file", "")
        if (configured != "") return this.abs_path(configured)
        return GLib.build_filenamev([this.linux_cross_dir(opts), this.linux_current_arch(opts) + ".ini"])
    }

    function linux_pkg_config_libdir(opts) {
        local triplet = this.linux_current_triplet(opts)
        local sysroot = this.linux_current_sysroot(opts)
        if (sysroot != "") sysroot = this.strip_trailing_slashes(sysroot)

        local root = sysroot == "" ? "" : sysroot
        return root + "/usr/lib/" + triplet + "/pkgconfig:" + root + "/usr/share/pkgconfig"
    }

    function write_linux_cmake_toolchain(opts, path) {
        local arch = this.linux_current_arch(opts)
        local triplet = this.linux_current_triplet(opts)
        local sysroot = this.linux_current_sysroot(opts)
        local pkg_config_libdir = this.linux_pkg_config_libdir(opts)

        local sysroot_settings = ""
        if (sysroot != "") {
            sysroot_settings =
                "set(CMAKE_SYSROOT \"" + sysroot + "\")\n" +
                "set(CMAKE_FIND_ROOT_PATH \"" + sysroot + "\")\n" +
                "set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n" +
                "set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n" +
                "set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n" +
                "set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)\n" +
                "\n"
        }

        this.mkdir_p(this.dirname(path))
        this.write_file(path,
            "set(CMAKE_SYSTEM_NAME Linux)\n" +
            "set(CMAKE_SYSTEM_PROCESSOR " + arch + ")\n" +
            "\n" +
            "set(CMAKE_C_COMPILER " + triplet + "-gcc)\n" +
            "set(CMAKE_CXX_COMPILER " + triplet + "-g++)\n" +
            "set(CMAKE_AR " + triplet + "-ar)\n" +
            "set(CMAKE_RANLIB " + triplet + "-ranlib)\n" +
            "set(CMAKE_STRIP " + triplet + "-strip)\n" +
            "\n" +
            sysroot_settings +
            "set(ENV{PKG_CONFIG_PATH} \"\")\n" +
            "set(ENV{PKG_CONFIG_SYSROOT_DIR} \"" + sysroot + "\")\n" +
            "set(ENV{PKG_CONFIG_LIBDIR} \"" + pkg_config_libdir + "\")\n" +
            "set(PKG_CONFIG_EXECUTABLE pkg-config CACHE FILEPATH \"pkg-config\")\n")
    }

    function write_linux_meson_cross_file(opts, path) {
        local arch = this.linux_current_arch(opts)
        local triplet = this.linux_current_triplet(opts)
        local sysroot = this.linux_current_sysroot(opts)
        local sysroot_property = sysroot == "" ? "" : ("sys_root = '" + sysroot + "'\n")

        this.mkdir_p(this.dirname(path))
        this.write_file(path,
            "[binaries]\n" +
            "c = '" + triplet + "-gcc'\n" +
            "cpp = '" + triplet + "-g++'\n" +
            "ar = '" + triplet + "-ar'\n" +
            "strip = '" + triplet + "-strip'\n" +
            "pkg-config = 'pkg-config'\n" +
            "\n" +
            "[properties]\n" +
            sysroot_property +
            "pkg_config_libdir = ['" + this.replace_char(this.linux_pkg_config_libdir(opts), ":", "', '") + "']\n" +
            "\n" +
            "[host_machine]\n" +
            "system = 'linux'\n" +
            "cpu_family = '" + arch + "'\n" +
            "cpu = '" + arch + "'\n" +
            "endian = 'little'\n")
    }

    function prepare_linux_build_environment(opts) {
        local cross = this.linux_current_is_cross(opts)
        if (!cross) return

        local toolchain = this.linux_cmake_toolchain_path(opts)
        local cross_file = this.linux_meson_cross_file_path(opts)
        this.write_linux_cmake_toolchain(opts, toolchain)
        this.write_linux_meson_cross_file(opts, cross_file)

        this.info("Linux cross target: " + this.linux_current_arch(opts) +
            " (" + this.linux_current_triplet(opts) + ")")
        this.info("SQGI_LINUX_CMAKE_TOOLCHAIN=" + toolchain)
        this.info("SQGI_LINUX_MESON_CROSS_FILE=" + cross_file)

        this.require_linux_cross_build_requirements(opts)
    }

    function linux_build_env_prefix(opts) {
        local arch = this.linux_current_arch(opts)
        local deb_arch = this.linux_current_deb_arch(opts)
        local triplet = this.linux_current_triplet(opts)
        local sysroot = this.linux_current_sysroot(opts)
        local env = this.shell_export("SQGI_LINUX_ARCH", arch) +
            this.shell_export("SQGI_LINUX_DEB_ARCH", deb_arch) +
            this.shell_export("SQGI_LINUX_TRIPLET", triplet) +
            this.shell_export("SQGI_LINUX_BUILD_DIR", opts.build_dir) +
            this.shell_export("SQGI_LINUX_SYSROOT", sysroot)

        if (this.linux_current_is_cross(opts)) {
            env += this.shell_export("SQGI_LINUX_CMAKE_TOOLCHAIN", this.linux_cmake_toolchain_path(opts)) +
                this.shell_export("SQGI_LINUX_MESON_CROSS_FILE", this.linux_meson_cross_file_path(opts))
        } else {
            env += this.shell_export("SQGI_LINUX_CMAKE_TOOLCHAIN", "") +
                this.shell_export("SQGI_LINUX_MESON_CROSS_FILE", "")
        }

        if (sysroot != "") {
            env += this.shell_export("PKG_CONFIG_PATH", "") +
                this.shell_export("PKG_CONFIG_SYSROOT_DIR", sysroot) +
                this.shell_export("PKG_CONFIG_LIBDIR", this.linux_pkg_config_libdir(opts))
        }

        return env
    }

    function linux_required_pkg_config_modules(opts) {
        local out = []

        if (opts.entry_type == "sqgi") {
            foreach (module in [
                "glib-2.0",
                "gobject-2.0",
                "gio-2.0",
                "gobject-introspection-1.0",
                "libffi",
                "cairo"
            ]) this.append_unique(out, module)
        }

        if (opts.report.used_gtk)
            this.append_unique(out, "gtk4")

        if (opts.report.used_gst) {
            this.append_unique(out, "gstreamer-1.0")
            this.append_unique(out, "gstreamer-base-1.0")
        }

        return out
    }

    function linux_pkg_config_module_package(module) {
        if (module == "glib-2.0" || module == "gobject-2.0" || module == "gio-2.0")
            return "libglib2.0-dev"
        if (module == "gobject-introspection-1.0")
            return "libgirepository-1.0-dev"
        if (module == "libffi")
            return "libffi-dev"
        if (module == "cairo")
            return "libcairo2-dev"
        if (module == "gtk4")
            return "libgtk-4-dev"
        if (module == "gstreamer-1.0")
            return "libgstreamer1.0-dev"
        if (module == "gstreamer-base-1.0")
            return "libgstreamer-plugins-base1.0-dev"
        return null
    }

    function linux_tool_package(tool) {
        if (tool.find("-gcc") != null) return "gcc-" + tool.slice(0, tool.len() - 4)
        if (tool.find("-g++") != null) return "g++-" + tool.slice(0, tool.len() - 4)
        if (tool.find("-ar") != null || tool.find("-strip") != null) {
            local suffix = tool.find("-ar") != null ? "-ar" : "-strip"
            return "binutils-" + tool.slice(0, tool.len() - suffix.len())
        }
        return null
    }

    function linux_pkg_config_module_exists(opts, module) {
        local command = "PKG_CONFIG_PATH='' " +
            "PKG_CONFIG_SYSROOT_DIR=" + this.shell_quote(this.linux_current_sysroot(opts)) + " " +
            "PKG_CONFIG_LIBDIR=" + this.shell_quote(this.linux_pkg_config_libdir(opts)) + " " +
            "pkg-config --exists " + this.shell_quote(module) + " >/dev/null 2>&1"
        return this.run_shell_status(command) == 0
    }

    function linux_pkg_config_module_error(opts, module) {
        local tmp = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-pkg-config-" + GLib.get_monotonic_time()])
        local command = "PKG_CONFIG_PATH='' " +
            "PKG_CONFIG_SYSROOT_DIR=" + this.shell_quote(this.linux_current_sysroot(opts)) + " " +
            "PKG_CONFIG_LIBDIR=" + this.shell_quote(this.linux_pkg_config_libdir(opts)) + " " +
            "pkg-config --print-errors --exists " + this.shell_quote(module) +
            " > " + this.shell_quote(tmp) + " 2>&1"
        system(command)
        local text = this.path_exists(tmp) ? this.read_file(tmp) : ""
        if (this.path_exists(tmp)) remove(tmp)
        return text
    }

    function linux_pkg_config_missing_modules(error_text) {
        local out = []
        foreach (line in this.split_lines(error_text)) {
            local name = null
            local quoted = "Package '"
            local quoted_pos = line.find(quoted)
            if (quoted_pos != null) {
                local rest = line.slice(quoted_pos + quoted.len())
                local end = rest.find("'")
                if (end != null) name = rest.slice(0, end)
            } else if (this.starts_with(line, "Package ")) {
                local rest = line.slice("Package ".len())
                local end = rest.find(" ")
                if (end != null) name = rest.slice(0, end)
            }

            if (name != null && name != "" && !this.array_contains(out, name))
                out.push(name)
        }
        return out
    }

    function linux_dpkg_package_installed(package_name) {
        local command = "dpkg-query -W -f='${Status}' " + this.shell_quote(package_name) +
            " 2>/dev/null | grep -q 'install ok installed'"
        return this.run_shell_status(command) == 0
    }

    function linux_deb_arch_enabled(deb_arch) {
        local primary = this.run_shell_output("dpkg --print-architecture")
        foreach (line in this.split_lines(primary == null ? "" : primary)) {
            if (line == deb_arch) return true
        }

        local foreign = this.run_shell_output("dpkg --print-foreign-architectures")
        foreach (line in this.split_lines(foreign == null ? "" : foreign)) {
            if (line == deb_arch) return true
        }

        return false
    }

    function linux_apt_package_show(package_name) {
        if (this.apt_show_cache == null) this.apt_show_cache = {}
        if (package_name in this.apt_show_cache) {
            local cached = this.apt_show_cache[package_name]
            return cached == false ? null : cached
        }

        local output = this.run_shell_output("apt-cache show --no-all-versions " + this.shell_quote(package_name))
        if (output == null || this.split_lines(output).len() == 0) {
            this.apt_show_cache[package_name] <- false
            return null
        }
        this.apt_show_cache[package_name] <- output
        return output
    }

    function linux_apt_package_architecture_from_output(output) {
        if (output == null) return null
        foreach (line in this.split_lines(output)) {
            if (this.starts_with(line, "Architecture: "))
                return line.slice("Architecture: ".len())
        }
        return null
    }

    function linux_apt_arch_all_show(package_name) {
        if (package_name.find(":") == null) return null

        local package_base = this.split_once(package_name, ":")[0]
        local output = this.linux_apt_package_show(package_base)
        return this.linux_apt_package_architecture_from_output(output) == "all" ? output : null
    }

    function linux_apt_package_available(package_name) {
        if (this.linux_apt_package_show(package_name) != null) return true
        return this.linux_apt_arch_all_show(package_name) != null
    }

    function default_linux_package_cache_dir() {
        return GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "linux-debs"])
    }

    function linux_package_cache(opts) {
        return opts.linux.deb.package_cache == ""
            ? this.default_linux_package_cache_dir()
            : opts.linux.deb.package_cache
    }

    function default_linux_sysroot_cache_dir() {
        return GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "linux-sysroots"])
    }

    function linux_sysroot_cache(opts) {
        return opts.linux.deb.sysroot_cache == ""
            ? this.default_linux_sysroot_cache_dir()
            : this.abs_path(opts.linux.deb.sysroot_cache)
    }

    function linux_os_release_value(key) {
        local path = "/etc/os-release"
        if (!this.path_exists(path)) return ""

        foreach (line in this.split_lines(this.read_file(path))) {
            local parts = this.split_once(line, "=")
            if (parts[1] == null || parts[0] != key) continue
            local value = parts[1]
            if (value.len() >= 2) {
                local first = value.slice(0, 1)
                local last = value.slice(value.len() - 1)
                if ((first == "\"" && last == "\"") || (first == "'" && last == "'"))
                    value = value.slice(1, value.len() - 1)
            }
            return value
        }

        return ""
    }

    function linux_sysroot_cache_key(opts) {
        local distro = this.linux_os_release_value("ID")
        if (distro == "") distro = "apt"

        local release = this.linux_os_release_value("VERSION_CODENAME")
        if (release == "") release = this.linux_os_release_value("UBUNTU_CODENAME")
        if (release == "") release = this.linux_os_release_value("VERSION_ID")

        local key = distro
        if (release != "") key += "-" + release
        key += "-" + this.linux_current_deb_arch(opts)
        return this.sanitize_id(key)
    }

    function trim_space(value) {
        while (value.len() > 0 && (value.slice(0, 1) == " " || value.slice(0, 1) == "\t"))
            value = value.slice(1)
        while (value.len() > 0 && (value.slice(value.len() - 1) == " " || value.slice(value.len() - 1) == "\t"))
            value = value.slice(0, value.len() - 1)
        return value
    }

    function linux_deb_sysroot_metadata_dir(opts) {
        local sysroot = this.linux_current_sysroot(opts)
        if (sysroot == "") return ""
        return GLib.build_filenamev([sysroot, "var", "lib", "sqgipkg", "debs"])
    }

    function linux_deb_sysroot_package_metadata(opts, package_name) {
        local dir = this.linux_deb_sysroot_metadata_dir(opts)
        if (dir == "") return ""
        return GLib.build_filenamev([dir, this.replace_char(package_name, "/", "_")])
    }

    function linux_deb_sysroot_package_installed(opts, package_name) {
        local dir = this.linux_deb_sysroot_package_metadata(opts, package_name)
        if (dir == "") return false
        if (opts.linux.deb.refresh) return false
        if (!this.path_exists(GLib.build_filenamev([dir, "files"]))) return false

        local metadata = this.linux_deb_archive_metadata(package_name)
        if (metadata == null) return false

        local archive_path = GLib.build_filenamev([dir, "archive"])
        if (!this.path_exists(archive_path)) return false

        foreach (line in this.split_lines(this.read_file(archive_path)))
            return line == metadata.basename
        return false
    }

    function linux_deb_sysroot_package_files(opts, package_name) {
        local dir = this.linux_deb_sysroot_package_metadata(opts, package_name)
        if (dir == "") return null
        local path = GLib.build_filenamev([dir, "files"])
        if (!this.path_exists(path)) return null

        local out = []
        foreach (line in this.split_lines(this.read_file(path))) {
            local normalized = this.normalize_package_path(line)
            if (normalized != "") out.push(normalized)
        }
        return out
    }

    function linux_download_sysroot_root(opts) {
        local sysroot = this.linux_current_sysroot(opts)
        if (sysroot != "") return sysroot

        local root = GLib.build_filenamev([this.linux_sysroot_cache(opts), this.linux_sysroot_cache_key(opts)])
        local config = this.linux_current_config(opts)
        if (config != null) config.sysroot = root
        else opts.linux.sysroot = root
        return root
    }

    function linux_deb_archive_metadata(package_name) {
        local download_package = package_name
        local output = this.linux_apt_package_show(package_name)
        if (output == null) {
            output = this.linux_apt_arch_all_show(package_name)
            if (output != null) download_package = this.split_once(package_name, ":")[0]
        }
        if (output == null) return null
        local basename = this.linux_deb_archive_basename_from_output(output)
        if (basename != null) {
            return {
                basename = basename,
                download_package = download_package
            }
        }
        return null
    }

    function linux_deb_archive_basename_from_output(output) {
        local package_field = ""
        local version = ""
        local architecture = ""
        local filename = ""

        foreach (line in this.split_lines(output)) {
            if (this.starts_with(line, "Package: "))
                package_field = line.slice("Package: ".len())
            else if (this.starts_with(line, "Version: "))
                version = line.slice("Version: ".len())
            else if (this.starts_with(line, "Architecture: "))
                architecture = line.slice("Architecture: ".len())
            else if (this.starts_with(line, "Filename: "))
                filename = line.slice("Filename: ".len())
        }

        if (package_field != "" && version != "" && architecture != "")
            return package_field + "_" + this.replace_char(version, ":", "%3a") + "_" + architecture + ".deb"

        return filename == "" ? null : this.basename(filename)
    }

    function linux_deb_archive_basename(opts, package_name) {
        local metadata = this.linux_deb_archive_metadata(package_name)
        return metadata == null ? null : metadata.basename
    }

    function linux_download_deb(opts, package_name) {
        local arch = this.linux_current_deb_arch(opts)
        local cache_dir = GLib.build_filenamev([this.linux_package_cache(opts), arch])
        this.mkdir_p(cache_dir)

        local metadata = this.linux_deb_archive_metadata(package_name)
        if (metadata == null)
            this.fail("cannot find apt metadata for Linux package: " + package_name)
        local basename = metadata.basename

        local archive = GLib.build_filenamev([cache_dir, basename])
        if (!this.path_exists(archive))
            archive = this.linux_find_cached_deb(cache_dir, package_name, arch, archive)
        if (opts.linux.deb.refresh && this.path_exists(archive)) remove(archive)
        if (!this.path_exists(archive)) {
            this.info("downloading Linux package " + package_name)
            this.run_shell_in_dir("apt-get download " + this.shell_quote(metadata.download_package), cache_dir,
                "downloading Linux package " + package_name)
        }
        if (!this.path_exists(archive))
            archive = this.linux_find_cached_deb(cache_dir, package_name, arch, archive)
        if (!this.path_exists(archive))
            this.fail("downloaded Linux package archive was not found: " + archive)
        return archive
    }

    function linux_find_cached_deb(cache_dir, package_name, arch, fallback) {
        local package_base = this.split_once(package_name, ":")[0]
        local hits = this.optional_command_output(
            "find " + this.shell_quote(cache_dir) + " -maxdepth 1 -type f \\( " +
            "-name " + this.shell_quote(package_base + "_*_" + arch + ".deb") + " -o " +
            "-name " + this.shell_quote(package_base + "_*_all.deb") + " -o " +
            "-name " + this.shell_quote(package_base + "_*.deb") + " \\) | sort"
        )
        return hits.len() > 0 ? hits[hits.len() - 1] : fallback
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

    function normalize_package_path(path) {
        local entry = this.normalize_package_entry(path)
        return entry == "" ? "" : ("/" + entry)
    }

    function linux_deb_archive_files(archive) {
        local out = []
        local output = this.run_shell_output("dpkg-deb -c " + this.shell_quote(archive))
        if (output == null) this.fail("listing Debian package archive failed: " + archive)

        foreach (line in this.split_lines(output)) {
            local link_pos = line.find(" -> ")
            if (link_pos != null) line = line.slice(0, link_pos)
            local pos = null
            for (local i = line.len() - 1; i >= 0; i--) {
                local ch = line.slice(i, i + 1)
                if (ch == " " || ch == "\t") { pos = i; break }
            }
            local path = pos == null ? line : line.slice(pos + 1)
            path = this.normalize_package_path(path)
            if (path.len() == 0 || this.ends_with(path, "/")) continue
            out.push(path)
        }

        return out
    }

    function write_linux_deb_sysroot_metadata(opts, package_name, file_list, archive_basename) {
        local dir = this.linux_deb_sysroot_package_metadata(opts, package_name)
        this.mkdir_p(dir)
        local files = ""
        foreach (path in file_list)
            files += path + "\n"
        this.write_file(GLib.build_filenamev([dir, "files"]), files)
        this.write_file(GLib.build_filenamev([dir, "archive"]), archive_basename + "\n")
    }

    function extract_linux_deb_to_sysroot(opts, package_name) {
        local archive = this.linux_download_deb(opts, package_name)
        local file_list = this.linux_deb_archive_files(archive)
        local sysroot = this.linux_download_sysroot_root(opts)

        this.mkdir_p(sysroot)
        this.run_shell("dpkg-deb -x " + this.shell_quote(archive) + " " + this.shell_quote(sysroot),
            "extracting Linux Debian package")
        this.write_linux_deb_sysroot_metadata(opts, package_name, file_list, this.basename(archive))
        this.info("installed Linux package into sysroot: " + package_name)
    }

    function linux_dependency_package_name(opts, dep) {
        dep = this.trim_space(dep)
        if (dep.len() == 0) return null
        if (this.starts_with(dep, "|")) dep = this.trim_space(dep.slice(1))
        if (dep.len() == 0) return null
        if (this.starts_with(dep, "<")) return null

        local out = ""
        for (local i = 0; i < dep.len(); i++) {
            local ch = dep.slice(i, i + 1)
            if (ch == " " || ch == "\t" || ch == "(" || ch == "<" || ch == ">" || ch == "=") break
            out += ch
        }
        if (out.len() == 0) return null
        if (this.ends_with(out, ":any")) out = out.slice(0, out.len() - ":any".len())
        local arch_pos = out.find(":")
        if (arch_pos != null) {
            local explicit_arch = out.slice(arch_pos + 1)
            if (explicit_arch != this.linux_current_deb_arch(opts)) return null
        }
        return this.linux_arch_package(out, this.linux_current_deb_arch(opts))
    }

    function linux_dependency_expr(line) {
        line = this.trim_space(line)
        if (this.starts_with(line, "|")) line = this.trim_space(line.slice(1))
        if (this.starts_with(line, "Depends:")) return this.trim_space(line.slice("Depends:".len()))
        if (this.starts_with(line, "PreDepends:")) return this.trim_space(line.slice("PreDepends:".len()))
        return null
    }

    function linux_dependency_ignored_marker(line) {
        line = this.trim_space(line)
        if (this.starts_with(line, "|")) line = this.trim_space(line.slice(1))
        foreach (marker in [
            "Recommends:",
            "Suggests:",
            "Conflicts:",
            "Breaks:",
            "Replaces:",
            "Enhances:"
        ]) {
            if (this.starts_with(line, marker)) return true
        }
        return false
    }

    function linux_dependency_is_virtual(dep) {
        dep = this.trim_space(dep)
        if (this.starts_with(dep, "|")) dep = this.trim_space(dep.slice(1))
        return dep.len() >= 2 && this.starts_with(dep, "<")
    }

    function linux_dependency_package_available(package_name, available) {
        if (available != null) return this.table_get(available, package_name, false)
        return this.linux_apt_package_available(package_name)
    }

    function linux_deb_dependency_packages_from_output(opts, output, available = null) {
        local out = []
        local pending_virtual = false

        foreach (line in this.split_lines(output)) {
            local trimmed = this.trim_space(line)
            local expr = this.linux_dependency_expr(trimmed)
            if (expr != null) {
                pending_virtual = false
                if (this.linux_dependency_is_virtual(expr)) {
                    pending_virtual = true
                    continue
                }

                local dep = this.linux_dependency_package_name(opts, expr)
                if (dep != null) this.append_unique(out, dep)
                continue
            }

            if (this.linux_dependency_ignored_marker(trimmed)) {
                pending_virtual = false
                continue
            }

            if (pending_virtual) {
                local provider = this.linux_dependency_package_name(opts, trimmed)
                if (provider != null && this.linux_dependency_package_available(provider, available)) {
                    this.append_unique(out, provider)
                    pending_virtual = false
                }
            }
        }

        return out
    }

    function resolve_linux_deb_package(opts, package_name, resolved, visiting, ordered) {
        package_name = this.linux_arch_package(package_name, this.linux_current_deb_arch(opts))
        if (this.table_get(resolved, package_name, false)) return
        if (this.table_get(visiting, package_name, false)) return

        if (!this.linux_apt_package_available(package_name))
            this.fail("apt cannot see Linux package " + package_name + "; check apt sources for architecture " + this.linux_current_deb_arch(opts))

        visiting[package_name] <- true
        local output = this.run_shell_output(
            "apt-cache depends --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances " +
            this.shell_quote(package_name)
        )
        if (output != null) {
            foreach (dep in this.linux_deb_dependency_packages_from_output(opts, output))
                this.resolve_linux_deb_package(opts, dep, resolved, visiting, ordered)
        }

        visiting[package_name] <- false
        resolved[package_name] <- true
        ordered.push(package_name)
    }

    function linux_deb_sysroot_seed_packages(opts) {
        local out = []
        foreach (package_name in opts.linux.deb.packages)
            this.linux_append_install_package(out, package_name, this.linux_current_deb_arch(opts))

        if (this.linux_has_cross_build_work(opts)) {
            foreach (module in this.linux_required_pkg_config_modules(opts))
                this.linux_append_install_package(out, this.linux_pkg_config_module_package(module), this.linux_current_deb_arch(opts))
        }

        return out
    }

    function ensure_linux_deb_sysroot_packages(opts) {
        if (!opts.linux.deb.download) return
        local seeds = this.linux_deb_sysroot_seed_packages(opts)
        if (seeds.len() == 0) return

        if (!this.executable_available("apt-cache")) this.fail("Debian package download requires apt-cache")
        if (!this.executable_available("apt-get")) this.fail("Debian package download requires apt-get")
        if (!this.executable_available("dpkg-deb")) this.fail("Debian package download requires dpkg-deb")

        local sysroot = this.linux_download_sysroot_root(opts)
        this.info("Linux Debian sysroot: " + sysroot)

        local resolved = {}
        local visiting = {}
        local ordered = []
        this.info("resolving Debian sysroot packages for " + this.linux_current_arch(opts) +
            " from " + this.join_strings(seeds, ", "))
        foreach (package_name in seeds)
            this.resolve_linux_deb_package(opts, package_name, resolved, visiting, ordered)
        this.info("Debian sysroot package closure for " + this.linux_current_arch(opts) +
            ": " + ordered.len() + " package(s)")

        foreach (package_name in ordered) {
            if (!this.linux_deb_sysroot_package_installed(opts, package_name))
                this.extract_linux_deb_to_sysroot(opts, package_name)
        }
    }

    function linux_unavailable_apt_packages(packages) {
        local out = []
        if (!this.executable_available("apt-cache")) return out

        foreach (package_name in packages) {
            if (!this.linux_apt_package_available(package_name))
                out.push(package_name)
        }

        return out
    }

    function linux_arch_package(package_name, deb_arch) {
        return package_name.find(":") == null ? (package_name + ":" + deb_arch) : package_name
    }

    function linux_append_install_package(out, package_name, deb_arch) {
        if (package_name == null || package_name == "") return
        this.append_unique(out, this.linux_arch_package(package_name, deb_arch))
    }

    function linux_cross_requirement_message(opts, missing_tools, missing_modules, missing_pkg_config_deps, pkg_config_errors, missing_packages, install_packages, deb_arch_enabled, unavailable_apt_packages) {
        local arch = this.linux_current_arch(opts)
        local deb_arch = this.linux_current_deb_arch(opts)
        local message = "missing Linux " + arch + " build requirements; refusing to run cross build.\n"
        message += "Target Debian architecture: " + deb_arch + "\n"
        message += "PKG_CONFIG_LIBDIR: " + this.linux_pkg_config_libdir(opts) + "\n"

        if (missing_tools.len() > 0) {
            message += "\nMissing tools:\n"
            foreach (tool in missing_tools)
                message += "  - " + tool + "\n"
        }

        if (missing_modules.len() > 0) {
            message += "\nMissing target pkg-config modules:\n"
            foreach (module in missing_modules)
                message += "  - " + module + "\n"
        }

        if (missing_pkg_config_deps.len() > 0) {
            message += "\nMissing transitive pkg-config dependencies:\n"
            foreach (module in missing_pkg_config_deps)
                message += "  - " + module + "\n"
        }

        if (pkg_config_errors.len() > 0) {
            message += "\npkg-config diagnostics:\n"
            foreach (line in pkg_config_errors)
                message += "  " + line + "\n"
        }

        if (missing_packages.len() > 0) {
            message += "\nMissing target Debian packages requested by the manifest:\n"
            foreach (package_name in missing_packages)
                message += "  - " + package_name + "\n"
        }

        if (install_packages.len() > 0) {
            local host_packages = []
            local target_packages = []
            foreach (package_name in install_packages) {
                if (package_name.find(":" + deb_arch) != null)
                    this.append_unique(target_packages, package_name)
                else
                    this.append_unique(host_packages, package_name)
            }

            if (host_packages.len() > 0) {
                message += "\nOn Ubuntu, install the missing host build tools with:\n"
                message += "  sudo apt install " + this.join_strings(host_packages, " ") + "\n"
            }

            if (target_packages.len() > 0) {
                if (opts.linux.deb.download) {
                    message += "\nThe Debian sysroot backend is enabled, so sqgipkg should fetch target packages into the private sysroot instead of installing them on the host.\n"
                    message += "Check that apt can see the target package indexes and that the sysroot resolver installed:\n"
                    foreach (package_name in target_packages)
                        message += "  - " + package_name + "\n"
                } else {
                    message += "\nOn Ubuntu, install the target architecture and likely packages with:\n"
                    message += "  sudo dpkg --add-architecture " + deb_arch + "\n"
                    message += "  sudo apt update\n"
                    message += "  sudo apt install " + this.join_strings(target_packages, " ") + "\n"
                }
            }
        }

        if (!deb_arch_enabled && !opts.linux.deb.download) {
            message += "\nApt is not configured for " + deb_arch + " packages yet. Run the dpkg --add-architecture and apt update commands above before apt install.\n"
        } else if (unavailable_apt_packages.len() > 0) {
            message += "\nApt cannot currently see these suggested packages:\n"
            foreach (package_name in unavailable_apt_packages)
                message += "  - " + package_name + "\n"
            if (opts.linux.deb.download)
                message += "For the private sysroot workflow, make sure apt sources include " + deb_arch + " package indexes, then run `sudo apt update`.\n"
            else
                message += "If apt says 'Unable to locate package', run `sudo apt update` after adding " + deb_arch + ".\n"
            message += "If it still fails, check that your Ubuntu sources provide " + deb_arch + " package indexes; third-party sources may need to be limited to amd64.\n"
            if (deb_arch == "arm64") {
                message += "\nOn Ubuntu amd64 hosts, arm64 packages normally come from ports.ubuntu.com. Keep your normal archive.ubuntu.com/security.ubuntu.com sources limited to host architectures such as amd64/i386, then add an arm64-only source such as:\n"
                message += "  /etc/apt/sources.list.d/ubuntu-arm64.sources\n"
                message += "  Types: deb\n"
                message += "  URIs: http://ports.ubuntu.com/ubuntu-ports/\n"
                message += "  Suites: noble noble-updates noble-backports noble-security\n"
                message += "  Components: main restricted universe multiverse\n"
                message += "  Architectures: arm64\n"
                message += "  Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg\n"
                message += "Then run `sudo apt update` again.\n"
            }
        }

        return message
    }

    function require_linux_cross_build_requirements(opts) {
        if (!this.linux_has_cross_build_work(opts)) return

        local deb_arch = this.linux_current_deb_arch(opts)
        local triplet = this.linux_current_triplet(opts)
        local missing_tools = []
        local missing_modules = []
        local missing_pkg_config_deps = []
        local pkg_config_errors = []
        local missing_packages = []
        local install_packages = []

        foreach (tool in [
            triplet + "-gcc",
            triplet + "-g++",
            triplet + "-ar",
            triplet + "-strip"
        ]) {
            if (!this.executable_available(tool)) {
                missing_tools.push(tool)
                local package_name = this.linux_tool_package(tool)
                if (package_name != null) this.append_unique(install_packages, package_name)
            }
        }

        if (!this.executable_available("pkg-config")) {
            missing_tools.push("pkg-config")
            this.append_unique(install_packages, "pkg-config")
        } else {
            foreach (module in this.linux_required_pkg_config_modules(opts)) {
                if (!this.linux_pkg_config_module_exists(opts, module)) {
                    missing_modules.push(module)
                    local error_text = this.linux_pkg_config_module_error(opts, module)
                    foreach (missing in this.linux_pkg_config_missing_modules(error_text))
                        this.append_unique(missing_pkg_config_deps, missing)
                    foreach (line in this.split_lines(error_text)) {
                        line = this.trim_space(line)
                        if (line != "" && !this.array_contains(pkg_config_errors, module + ": " + line))
                            pkg_config_errors.push(module + ": " + line)
                    }
                    this.linux_append_install_package(install_packages, this.linux_pkg_config_module_package(module), deb_arch)
                }
            }
        }

        if (opts.linux.deb.packages.len() > 0 && !this.executable_available("dpkg-query")) {
            local all_in_sysroot = true
            foreach (package_name in opts.linux.deb.packages) {
                local package_for_arch = this.linux_package_name_for_arch(opts, package_name)
                if (!this.linux_deb_sysroot_package_installed(opts, package_for_arch))
                    all_in_sysroot = false
            }
            if (!all_in_sysroot) missing_tools.push("dpkg-query")
        } else {
            foreach (package_name in opts.linux.deb.packages) {
                local package_for_arch = this.linux_package_name_for_arch(opts, package_name)
                if (!this.linux_deb_sysroot_package_installed(opts, package_for_arch) &&
                        !this.linux_dpkg_package_installed(package_for_arch)) {
                    missing_packages.push(package_for_arch)
                    this.append_unique(install_packages, package_for_arch)
                }
            }
        }

        if (missing_tools.len() > 0 || missing_modules.len() > 0 || missing_packages.len() > 0) {
            local deb_arch_enabled = this.linux_deb_arch_enabled(deb_arch)
            local unavailable_apt_packages = this.linux_unavailable_apt_packages(install_packages)
            this.fail(this.linux_cross_requirement_message(opts, missing_tools, missing_modules, missing_pkg_config_deps, pkg_config_errors, missing_packages, install_packages, deb_arch_enabled, unavailable_apt_packages))
        }
    }

    function linux_package_name_for_arch(opts, package_name) {
        if (package_name.find(":") != null) return package_name
        local deb_arch = this.linux_current_deb_arch(opts)
        return deb_arch == "" ? package_name : (package_name + ":" + deb_arch)
    }

    function linux_package_dest_for_file(opts, path) {
        path = this.normalize_package_path(path)
        if (this.ends_with(path, ".a") || this.ends_with(path, ".la")) return null

        local triplet = this.linux_current_triplet(opts)
        local usr_lib_triplet = "/usr/lib/" + triplet + "/"
        local lib_triplet = "/lib/" + triplet + "/"
        if (this.starts_with(path, usr_lib_triplet))
            return GLib.build_filenamev(["usr", "lib", path.slice(usr_lib_triplet.len())])
        if (this.starts_with(path, lib_triplet))
            return GLib.build_filenamev(["usr", "lib", path.slice(lib_triplet.len())])

        if (this.starts_with(path, "/usr/lib/"))
            return GLib.build_filenamev(["usr", "lib", path.slice("/usr/lib/".len())])
        if (this.starts_with(path, "/lib/"))
            return GLib.build_filenamev(["usr", "lib", path.slice("/lib/".len())])

        if (this.starts_with(path, "/usr/share/")) {
            local rel = path.slice("/usr/share/".len())
            if (this.starts_with(rel, "doc/") ||
                    this.starts_with(rel, "man/") ||
                    this.starts_with(rel, "info/") ||
                    this.starts_with(rel, "lintian/"))
                return null
            return GLib.build_filenamev(["usr", "share", rel])
        }

        if (this.starts_with(path, "/etc/"))
            return GLib.build_filenamev(["usr", "etc", path.slice("/etc/".len())])

        return null
    }

    function copy_file_to_appdir_dest(src, appdir, dest_rel, description) {
        dest_rel = this.relative_dest(dest_rel)
        local dest_abs = GLib.build_filenamev([appdir, dest_rel])
        this.mkdir_p(this.dirname(dest_abs))
        this.run_shell(
            "cp -aL " + this.shell_quote(src) + " " + this.shell_quote(dest_abs),
            "copying " + description
        )
    }

    function stage_linux_package(opts, appdir, package_name) {
        local package_for_arch = this.linux_package_name_for_arch(opts, package_name)
        local file_list = this.linux_deb_sysroot_package_files(opts, package_for_arch)
        if (file_list == null) {
            local output = this.run_shell_output("dpkg-query -L " + this.shell_quote(package_for_arch))
            if (output == null)
                this.fail("Linux package is not installed or has no file list: " + package_for_arch)
            file_list = this.split_lines(output)
        }

        local config = this.table_get(opts, "linux_current", null)
        local sysroot = config == null ? "" : this.table_get(config, "sysroot", "")
        if (sysroot == "") sysroot = opts.linux.sysroot
        if (sysroot != "") sysroot = this.strip_trailing_slashes(sysroot)

        local copied = 0
        foreach (path in file_list) {
            local src = path
            if (!this.path_exists(src) && sysroot != "")
                src = sysroot + path
            if (!this.path_exists(src)) continue
            if (this.run_shell_status("[ -f " + this.shell_quote(src) + " ]") != 0) continue

            local dest = this.linux_package_dest_for_file(opts, path)
            if (dest == null) continue

            this.copy_file_to_appdir_dest(src, appdir, dest, "Linux package file")
            copied++
        }

        if (copied == 0)
            this.report_warn(opts, "Linux package had no selected runtime files: " + package_for_arch)
        else
            this.info("copied " + copied + " file(s) from " + package_for_arch)
    }

    function stage_linux_packages(opts, appdir) {
        foreach (package_name in opts.linux.deb.packages)
            this.stage_linux_package(opts, appdir, package_name)
    }

    function linux_system_library(name) {
        return name == "libc.so.6" ||
            name == "libm.so.6" ||
            name == "libdl.so.2" ||
            name == "libpthread.so.0" ||
            name == "librt.so.1" ||
            name == "libresolv.so.2" ||
            name == "libutil.so.1" ||
            name == "libanl.so.1" ||
            this.starts_with(name, "ld-linux") ||
            this.starts_with(name, "linux-vdso") ||
            this.starts_with(name, "libnss_")
    }

    function linux_elf_needed(path) {
        local output = this.run_shell_output("readelf -d " + this.shell_quote(path))
        if (output == null) return []

        local out = []
        foreach (line in this.split_lines(output)) {
            local marker = "Shared library: ["
            local pos = line.find(marker)
            if (pos == null) continue
            local rest = line.slice(pos + marker.len())
            local end = rest.find("]")
            if (end == null) continue
            local name = rest.slice(0, end)
            if (name != "" && !this.array_contains(out, name)) out.push(name)
        }
        return out
    }

    function linux_bundled_library(appdir, name) {
        local libdir = GLib.build_filenamev([appdir, "usr", "lib"])
        if (!this.path_exists(libdir)) return null
        local output = this.run_shell_output("find " + this.shell_quote(libdir) + " -name " + this.shell_quote(name) + " -print -quit")
        if (output == null) return null
        local lines = this.split_lines(output)
        return lines.len() == 0 ? null : lines[0]
    }

    function linux_library_search_dirs(opts) {
        local out = this.array_copy(opts.linux.library_dirs)
        local triplet = this.linux_current_triplet(opts)

        local roots = []
        local config = this.table_get(opts, "linux_current", null)
        local sysroot = config == null ? "" : this.table_get(config, "sysroot", "")
        if (sysroot == "") sysroot = opts.linux.sysroot
        if (sysroot != "") roots.push(this.strip_trailing_slashes(sysroot))
        roots.push("")

        foreach (root in roots) {
            foreach (rel in [
                "/usr/lib/" + triplet,
                "/lib/" + triplet,
                "/usr/" + triplet + "/lib",
                "/usr/local/lib",
                "/usr/lib",
                "/lib"
            ]) {
                local dir = root + rel
                if (this.path_exists(dir) && !this.array_contains(out, dir)) out.push(dir)
            }
        }

        return out
    }

    function resolve_linux_library(opts, name) {
        foreach (dir in this.linux_library_search_dirs(opts)) {
            local candidate = GLib.build_filenamev([dir, name])
            if (this.path_exists(candidate)) return candidate
        }
        return null
    }

    function linux_elf_files(appdir) {
        local dirs = []
        foreach (rel in [
            GLib.build_filenamev(["usr", "bin"]),
            GLib.build_filenamev(["usr", "lib"])
        ]) {
            local dir = GLib.build_filenamev([appdir, rel])
            if (this.path_exists(dir)) dirs.push(this.shell_quote(dir))
        }
        if (dirs.len() == 0) return []
        local command = "find"
        foreach (dir in dirs)
            command += " " + dir
        command += " -type f -print"
        return this.optional_command_output(command)
    }

    function copy_linux_dependency_library(opts, appdir, name, src) {
        local dest = GLib.build_filenamev([appdir, "usr", "lib", name])
        if (this.path_exists(dest)) return dest
        this.mkdir_p(this.dirname(dest))
        this.run_shell(
            "cp -aL " + this.shell_quote(src) + " " + this.shell_quote(dest),
            "copying Linux shared library dependency"
        )
        this.report_inc(opts, "libraries")
        return dest
    }

    function copy_linux_elf_dependencies(opts, appdir) {
        if (!opts.linux.copy_dependencies) return
        if (!this.executable_available("readelf")) {
            this.report_warn(opts, "readelf not found; Linux ELF dependency copy skipped")
            return
        }

        local queue = this.linux_elf_files(appdir)
        local scanned = {}
        local missing = []
        local copied = 0

        while (queue.len() > 0) {
            local path = queue[0]
            queue.remove(0)

            if (this.table_get(scanned, path, false)) continue
            scanned[path] <- true

            foreach (needed in this.linux_elf_needed(path)) {
                if (this.linux_system_library(needed)) continue

                local bundled = this.linux_bundled_library(appdir, needed)
                if (bundled != null) {
                    if (!this.table_get(scanned, bundled, false)) queue.push(bundled)
                    continue
                }

                local resolved = this.resolve_linux_library(opts, needed)
                if (resolved != null) {
                    local copied_path = this.copy_linux_dependency_library(opts, appdir, needed, resolved)
                    copied++
                    queue.push(copied_path)
                } else if (!this.array_contains(missing, needed)) {
                    missing.push(needed)
                }
            }
        }

        if (copied > 0)
            this.info("copied " + copied + " recursively resolved Linux ELF dependency/dependencies")

        foreach (name in missing)
            this.report_warn(opts, "Linux ELF dependency could not be resolved for " + opts.appimage_arch + ": " + name)
    }

}

return { SqgiPkgLinuxDeps = SqgiPkgLinuxDeps }
