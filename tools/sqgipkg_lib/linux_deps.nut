local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("staging.nut")

class SqgiPkgLinuxDeps extends Base.SqgiPkgStaging {
    apt_show_cache = null
    apt_depends_cache = null
    repo_index_cache = null

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

    function qemu_user_executable(arch) {
        local name = this.qemu_user_binary_name(arch)
        local path = this.executable_path(name)
        if (path != null) return path
        return this.executable_path(name + "-static")
    }

    function qemu_user_available(arch) {
        return this.qemu_user_executable(arch) != null
    }

    function linux_qemu_wrapper_path(opts) {
        return GLib.build_filenamev([this.linux_cross_dir(opts), this.qemu_user_binary_name(opts.appimage_arch) + "-wrapper.sh"])
    }

    function write_linux_qemu_wrapper(opts) {
        local qemu = this.qemu_user_executable(opts.appimage_arch)
        if (qemu == null) return ""

        local path = this.linux_qemu_wrapper_path(opts)
        this.mkdir_p(this.dirname(path))
        this.write_file(path,
            "#!/usr/bin/env bash\n" +
            "set -euo pipefail\n" +
            "export QEMU_LD_PREFIX=" + this.shell_quote(this.linux_current_sysroot(opts)) + "\n" +
            "exec " + this.shell_quote(qemu) + " \"$@\"\n")
        this.chmod_exec(path)
        return path
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
        local c_binary = "'" + triplet + "-gcc'"
        local cpp_binary = "'" + triplet + "-g++'"
        if (sysroot != "") {
            c_binary = "['" + triplet + "-gcc', '--sysroot=" + sysroot + "']"
            cpp_binary = "['" + triplet + "-g++', '--sysroot=" + sysroot + "']"
        }
        local exe_wrapper = ""
        if (this.linux_current_is_cross(opts)) {
            local wrapper = this.write_linux_qemu_wrapper(opts)
            if (wrapper != "") exe_wrapper = "exe_wrapper = '" + wrapper + "'\n"
        }
        local gir_compiler = this.executable_path("g-ir-compiler")
        local gir_compiler_binary = gir_compiler == null ? "" : ("g-ir-compiler = '" + gir_compiler + "'\n")

        this.mkdir_p(this.dirname(path))
        this.write_file(path,
            "[binaries]\n" +
            "c = " + c_binary + "\n" +
            "cpp = " + cpp_binary + "\n" +
            "ar = '" + triplet + "-ar'\n" +
            "strip = '" + triplet + "-strip'\n" +
            "pkg-config = 'pkg-config'\n" +
            gir_compiler_binary +
            exe_wrapper +
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

    function linux_expected_meson_cpu_values(opts) {
        local arch = this.linux_current_arch(opts)
        if (arch == "x86_64") return ["x86_64"]
        if (arch == "aarch64") return ["aarch64"]
        if (arch == "i386" || arch == "i686") return ["x86"]
        return [arch]
    }

    function linux_meson_machine_mentions_arch(text, opts) {
        foreach (arch in this.linux_expected_meson_cpu_values(opts)) {
            if (text.find("\"cpu_family\": \"" + arch + "\"") != null ||
                    text.find("\"cpu_family\":\"" + arch + "\"") != null ||
                    text.find("\"cpu\": \"" + arch + "\"") != null ||
                    text.find("\"cpu\":\"" + arch + "\"") != null)
                return true
        }
        return false
    }

    function validate_linux_cmake_build_dir_state(opts) {
        local cache = GLib.build_filenamev([opts.build_dir, "CMakeCache.txt"])
        if (!this.path_exists(cache)) return

        local triplet = this.linux_current_triplet(opts)
        foreach (line in this.split_lines(this.read_file(cache))) {
            if (this.starts_with(line, "CMAKE_C_COMPILER:") &&
                    line.find(triplet + "-gcc") == null) {
                this.fail("stale CMake build directory for Linux " + this.linux_current_arch(opts) +
                    ": " + cache + " uses " + line +
                    "; remove the build directory or reconfigure with SQGI_LINUX_CMAKE_TOOLCHAIN=" +
                    this.linux_cmake_toolchain_path(opts))
            }
            if (this.starts_with(line, "CMAKE_CXX_COMPILER:") &&
                    line.find(triplet + "-g++") == null) {
                this.fail("stale CMake build directory for Linux " + this.linux_current_arch(opts) +
                    ": " + cache + " uses " + line +
                    "; remove the build directory or reconfigure with SQGI_LINUX_CMAKE_TOOLCHAIN=" +
                    this.linux_cmake_toolchain_path(opts))
            }
        }
    }

    function validate_linux_meson_build_dir_state(opts) {
        local machines = GLib.build_filenamev([opts.build_dir, "meson-info", "intro-machines.json"])
        if (!this.path_exists(machines)) return

        local text = this.read_file(machines)
        if (this.linux_meson_machine_mentions_arch(text, opts)) return

        this.fail("stale Meson build directory for Linux " + this.linux_current_arch(opts) +
            ": " + machines + " does not mention target CPU " + this.linux_current_arch(opts) +
            "; remove the build directory or reconfigure with SQGI_LINUX_MESON_CROSS_FILE=" +
            this.linux_meson_cross_file_path(opts))
    }

    function validate_linux_build_dir_state(opts) {
        if (!this.linux_current_is_cross(opts)) return
        this.validate_linux_cmake_build_dir_state(opts)
        this.validate_linux_meson_build_dir_state(opts)
    }

    function linux_build_env_prefix(opts, include_source = false) {
        local arch = this.linux_current_arch(opts)
        local deb_arch = this.linux_current_deb_arch(opts)
        local triplet = this.linux_current_triplet(opts)
        local sysroot = this.linux_current_sysroot(opts)
        local env = this.shell_export("SQGI_LINUX_ARCH", arch) +
            this.shell_export("SQGI_LINUX_DEB_ARCH", deb_arch) +
            this.shell_export("SQGI_LINUX_TRIPLET", triplet) +
            this.shell_export("SQGI_LINUX_BUILD_DIR", opts.build_dir) +
            this.shell_export("SQGI_LINUX_SYSROOT", sysroot) +
            this.shell_export("SQGI_LINUX_PREFIX", "/usr") +
            this.shell_export("SQGI_LINUX_PREFIX_DIR", sysroot == "" ? "/usr" : GLib.build_filenamev([sysroot, "usr"])) +
            this.shell_export("SQGI_LINUX_INSTALL_PREFIX", "/usr")

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
            if (this.linux_current_is_cross(opts))
                env += this.shell_export("QEMU_LD_PREFIX", sysroot)
        }

        if (include_source)
            env += this.shell_export("SQGI_SOURCE_DIR", this.ensure_sqgi_source(opts))

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

        if (opts.report.used_gdk_pixbuf)
            this.append_unique(out, "gdk-pixbuf-2.0")

        if (opts.report.used_soup)
            this.append_unique(out, "libsoup-3.0")

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
        if (module == "gdk-pixbuf-2.0")
            return "libgdk-pixbuf-2.0-dev"
        if (module == "libsoup-3.0")
            return "libsoup-3.0-dev"
        return null
    }

    function linux_auto_runtime_packages_enabled(opts) {
        return opts.linux.deb.download || opts.linux.deb.packages.len() > 0
    }

    function apply_linux_package_defaults(opts) {
        if (!this.linux_auto_runtime_packages_enabled(opts)) return

        if (opts.report.used_gtk) {
            this.append_unique(opts.linux.deb.packages, "libgtk-4-1")
            this.append_unique(opts.linux.deb.packages, "gir1.2-gtk-4.0")
        }

        if (opts.report.used_gst) {
            this.append_unique(opts.linux.deb.packages, "libgstreamer1.0-0")
            this.append_unique(opts.linux.deb.packages, "gir1.2-gstreamer-1.0")
            this.append_unique(opts.linux.deb.packages, "gir1.2-gst-plugins-base-1.0")
            this.append_unique(opts.linux.deb.packages, "gstreamer1.0-plugins-base")
            this.append_unique(opts.linux.deb.packages, "gstreamer1.0-plugins-good")
        }

        if (opts.report.used_gdk_pixbuf) {
            this.append_unique(opts.linux.deb.packages, "libgdk-pixbuf-2.0-0")
            this.append_unique(opts.linux.deb.packages, "gir1.2-gdkpixbuf-2.0")
        }

        if (opts.report.used_soup) {
            this.append_unique(opts.linux.deb.packages, "libsoup-3.0-0")
            this.append_unique(opts.linux.deb.packages, "gir1.2-soup-3.0")
        }
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

    function linux_apt_package_depends(package_name) {
        if (this.apt_depends_cache == null) this.apt_depends_cache = {}
        if (package_name in this.apt_depends_cache) {
            local cached = this.apt_depends_cache[package_name]
            return cached == false ? null : cached
        }

        local output = this.run_shell_output(
            "apt-cache depends --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances " +
            this.shell_quote(package_name)
        )
        this.apt_depends_cache[package_name] <- output == null ? false : output
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

    function default_linux_repo_index_cache_dir() {
        return GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "linux-repo-indexes"])
    }

    function linux_repo_index_cache(opts) {
        return this.default_linux_repo_index_cache_dir()
    }

    function linux_deb_repo_targets(opts) {
        local distro = this.linux_os_release_value("ID")
        local release = this.linux_os_release_value("VERSION_CODENAME")
        if (release == "") release = this.linux_os_release_value("UBUNTU_CODENAME")
        if (release == "") return []

        local arch = this.linux_current_deb_arch(opts)
        local targets = []
        local components = ["main", "restricted", "universe", "multiverse"]

        if (distro == "ubuntu") {
            local archive_base = (arch == "amd64" || arch == "i386")
                ? "http://archive.ubuntu.com/ubuntu"
                : "http://ports.ubuntu.com/ubuntu-ports"
            local security_base = (arch == "amd64" || arch == "i386")
                ? "http://security.ubuntu.com/ubuntu"
                : "http://ports.ubuntu.com/ubuntu-ports"

            foreach (suite_entry in [
                { suite = release + "-updates", uri = archive_base },
                { suite = release + "-security", uri = security_base },
                { suite = release, uri = archive_base },
                { suite = release + "-backports", uri = archive_base }
            ]) {
                foreach (component in components) {
                    targets.push({
                        uri = suite_entry.uri,
                        suite = suite_entry.suite,
                        component = component,
                        arch = arch
                    })
                }
            }
        }

        return targets
    }

    function linux_repo_target_url(target, suffix) {
        return this.strip_trailing_slashes(target.uri) +
            "/dists/" + target.suite +
            "/" + target.component +
            "/binary-" + target.arch +
            "/Packages." + suffix
    }

    function linux_repo_archive_url(target, filename) {
        return this.strip_trailing_slashes(target.uri) + "/" + filename
    }

    function linux_repo_cache_name(value) {
        local out = ""
        for (local i = 0; i < value.len(); i++) {
            local ch = value.slice(i, i + 1)
            local c = ch[0]
            local ok = (c >= 'a' && c <= 'z') ||
                (c >= 'A' && c <= 'Z') ||
                (c >= '0' && c <= '9')
            out += ok ? ch : "_"
        }
        return out
    }

    function linux_repo_index_path(opts, target) {
        local name = target.uri + "_" + target.suite + "_" + target.component + "_" + target.arch
        return GLib.build_filenamev([this.linux_repo_index_cache(opts), this.linux_repo_cache_name(name) + "_Packages"])
    }

    function linux_repo_index_file(opts, target) {
        local path = this.linux_repo_index_path(opts, target)
        if (this.path_exists(path) && !opts.linux.deb.refresh) return path

        this.mkdir_p(this.dirname(path))
        foreach (format in [
            { suffix = "xz", tool = "xz" },
            { suffix = "gz", tool = "gzip" }
        ]) {
            if (!this.executable_available(format.tool)) continue

            local compressed = path + "." + format.suffix + ".download"
            local decompressed = path + ".download"
            if (this.path_exists(compressed)) remove(compressed)
            if (this.path_exists(decompressed)) remove(decompressed)

            local url = this.linux_repo_target_url(target, format.suffix)
            local download_status = system(this.downloader_command(url, compressed) + " >/dev/null 2>&1")
            if (download_status != 0 || !this.path_exists(compressed)) continue

            local command = format.tool + " -dc " + this.shell_quote(compressed) +
                " > " + this.shell_quote(decompressed)
            local unpack_status = system(command)
            remove(compressed)
            if (unpack_status != 0 || !this.path_exists(decompressed)) {
                if (this.path_exists(decompressed)) remove(decompressed)
                continue
            }

            if (this.path_exists(path)) remove(path)
            rename(decompressed, path)
            return path
        }

        return null
    }

    function linux_repo_index_files(opts) {
        local out = []
        foreach (target in this.linux_deb_repo_targets(opts)) {
            local path = this.linux_repo_index_file(opts, target)
            if (path != null) out.push({ path = path, uri = target.uri })
        }
        return out
    }

    function linux_repo_package_map_path(opts) {
        return GLib.build_filenamev([
            this.linux_repo_index_cache(opts),
            "package-map-" + this.linux_sysroot_cache_key(opts) + ".tsv"
        ])
    }

    function linux_repo_package_map(opts, files) {
        if (files.len() == 0) return null
        if (this.repo_index_cache == null) this.repo_index_cache = {}

        local cache_key = "package-map:" + this.linux_sysroot_cache_key(opts)
        if (cache_key in this.repo_index_cache)
            return this.repo_index_cache[cache_key]

        local path = this.linux_repo_package_map_path(opts)
        if (!this.path_exists(path) || opts.linux.deb.refresh) {
            this.mkdir_p(this.dirname(path))
            local tmp = path + ".download"
            if (this.path_exists(tmp)) remove(tmp)

            local command = "awk " + this.shell_quote(
                "BEGIN { RS=\"\"; FS=\"\\n\"; OFS=\"\\t\" }\n" +
                "function trim(s) { gsub(/^[ \\t]+|[ \\t]+$/, \"\", s); return s }\n" +
                "function emit(kind, name, arch, path, pkg,    key) { key=kind SUBSEP name SUBSEP arch; if (!(key in seen)) { seen[key]=1; print kind, name, arch, path, pkg } }\n" +
                "function emit_provides(value,    n, i, item) { n=split(value, items, \",\"); for (i=1; i<=n; i++) { item=trim(items[i]); sub(/[ \\t]*\\(.*/, \"\", item); sub(/:.*/, \"\", item); if (item != \"\") emit(\"provide\", item, a, FILENAME, p) } }\n" +
                "{ p=\"\"; a=\"\"; prov=\"\"; inprov=0; for (i=1; i<=NF; i++) { line=$i; if (line ~ /^Package: /) { p=substr(line, 10); inprov=0 } else if (line ~ /^Architecture: /) { a=substr(line, 15); inprov=0 } else if (line ~ /^Provides: /) { prov=substr(line, 11); inprov=1 } else if (inprov && line ~ /^[ \\t]/) { prov=prov \" \" trim(line) } else { inprov=0 } } if (p != \"\" && a != \"\") { emit(\"package\", p, a, FILENAME, p); emit_provides(prov) } }"
            )
            foreach (info in files)
                command += " " + this.shell_quote(info.path)
            command += " > " + this.shell_quote(tmp)

            this.run_shell(command, "building Linux repository package map")
            if (this.path_exists(path)) remove(path)
            rename(tmp, path)
        }

        this.repo_index_cache[cache_key] <- path
        return path
    }

    function linux_repo_package_map_table(opts, files) {
        if (this.repo_index_cache == null) this.repo_index_cache = {}

        local cache_key = "package-map-table:" + this.linux_sysroot_cache_key(opts)
        if (cache_key in this.repo_index_cache)
            return this.repo_index_cache[cache_key]

        local map_path = this.linux_repo_package_map(opts, files)
        if (map_path == null) return null

        local table = {}
        foreach (line in this.split_lines(this.read_file(map_path))) {
            local first = this.split_once(line, "\t")
            if (first[1] == null) continue
            local second = this.split_once(first[1], "\t")
            if (second[1] == null) continue
            local third = this.split_once(second[1], "\t")
            if (third[1] == null) continue
            local fourth = this.split_once(third[1], "\t")
            if (fourth[1] == null) continue

            local key = first[0] + "\t" + second[0] + "\t" + third[0]
            if (!(key in table))
                table[key] <- { path = fourth[0], package_name = fourth[1], arch = third[0] }
        }

        this.repo_index_cache[cache_key] <- table
        return table
    }

    function linux_repo_lookup_package_map(opts, files, kind, package_name, arch) {
        local map_table = this.linux_repo_package_map_table(opts, files)
        if (map_table == null) return null

        local key = kind + "\t" + package_name + "\t" + arch
        if (!(key in map_table)) return null

        local match = map_table[key]
        local uri = ""
        foreach (info in files) {
            if (info.path == match.path) {
                uri = info.uri
                break
            }
        }

        return { path = match.path, uri = uri, package_name = match.package_name, arch = match.arch }
    }

    function split_lines_keep_empty(value) {
        local out = []
        local start = 0
        for (local i = 0; i <= value.len(); i++) {
            if (i == value.len() || value.slice(i, i + 1) == "\n") {
                local line = value.slice(start, i)
                if (line.len() > 0 && line.slice(line.len() - 1) == "\r")
                    line = line.slice(0, line.len() - 1)
                out.push(line)
                start = i + 1
            }
        }
        return out
    }

    function linux_deb_stanza_fields(stanza) {
        local fields = {}
        local current = null
        foreach (line in this.split_lines_keep_empty(stanza)) {
            if (line == "") continue
            if ((this.starts_with(line, " ") || this.starts_with(line, "\t")) && current != null) {
                fields[current] = fields[current] + " " + this.trim_space(line)
                continue
            }

            local parts = this.split_once(line, ":")
            if (parts[1] == null) continue
            current = parts[0]
            fields[current] <- this.trim_space(parts[1])
        }
        return fields
    }

    function linux_deb_stanza_field(stanza, name) {
        return this.table_get(this.linux_deb_stanza_fields(stanza), name, "")
    }

    function linux_repo_find_record_in_files(files, package_name, arch) {
        if (files.len() == 0) return null

        local command = "awk -v pkg=" + this.shell_quote(package_name) +
            " -v arch=" + this.shell_quote(arch) + " " +
            this.shell_quote(
                "BEGIN { RS=\"\"; FS=\"\\n\" }\n" +
                "{ p=\"\"; a=\"\"; for (i=1; i<=NF; i++) { if ($i ~ /^Package: /) p=substr($i, 10); else if ($i ~ /^Architecture: /) a=substr($i, 15); } if (p == pkg && a == arch) { print \"SqgiPkg-Index-File: \" FILENAME; print; exit } }"
            )
        foreach (info in files)
            command += " " + this.shell_quote(info.path)

        local output = this.run_shell_output(command)
        if (output == null || output.len() == 0 || this.split_lines(output).len() == 0)
            return null

        local lines = this.split_lines(output)
        local path = ""
        local stanza = ""
        foreach (i, line in lines) {
            if (i == 0 && this.starts_with(line, "SqgiPkg-Index-File: ")) {
                path = line.slice("SqgiPkg-Index-File: ".len())
                continue
            }
            stanza += line + "\n"
        }

        local uri = ""
        foreach (info in files) {
            if (info.path == path) {
                uri = info.uri
                break
            }
        }

        return stanza + "SqgiPkg-Repo-URI: " + uri + "\n"
    }

    function linux_repo_find_provider_record_in_files(files, package_name, arch) {
        if (files.len() == 0) return null

        local command = "awk -v pkg=" + this.shell_quote(package_name) +
            " -v arch=" + this.shell_quote(arch) + " " +
            this.shell_quote(
                "BEGIN { RS=\"\"; FS=\"\\n\" }\n" +
                "function trim(s) { gsub(/^[ \\t]+|[ \\t]+$/, \"\", s); return s }\n" +
                "function provides_pkg(value,    n, i, item) { n=split(value, items, \",\"); for (i=1; i<=n; i++) { item=trim(items[i]); sub(/[ \\t]*\\(.*/, \"\", item); sub(/:.*/, \"\", item); if (item == pkg) return 1 } return 0 }\n" +
                "{ p=\"\"; a=\"\"; prov=\"\"; inprov=0; for (i=1; i<=NF; i++) { line=$i; if (line ~ /^Package: /) { p=substr(line, 10); inprov=0 } else if (line ~ /^Architecture: /) { a=substr(line, 15); inprov=0 } else if (line ~ /^Provides: /) { prov=substr(line, 11); inprov=1 } else if (inprov && line ~ /^[ \\t]/) { prov=prov \" \" trim(line) } else { inprov=0 } } if (a == arch && provides_pkg(prov)) { print \"SqgiPkg-Index-File: \" FILENAME; print; exit } }"
            )
        foreach (info in files)
            command += " " + this.shell_quote(info.path)

        local output = this.run_shell_output(command)
        if (output == null || output.len() == 0 || this.split_lines(output).len() == 0)
            return null

        local lines = this.split_lines(output)
        local path = ""
        local stanza = ""
        foreach (i, line in lines) {
            if (i == 0 && this.starts_with(line, "SqgiPkg-Index-File: ")) {
                path = line.slice("SqgiPkg-Index-File: ".len())
                continue
            }
            stanza += line + "\n"
        }

        local uri = ""
        foreach (info in files) {
            if (info.path == path) {
                uri = info.uri
                break
            }
        }

        return stanza + "SqgiPkg-Repo-URI: " + uri + "\n"
    }

    function linux_repo_package_show(opts, package_name) {
        if (this.repo_index_cache == null) this.repo_index_cache = {}
        local cache_key = "package:" + this.linux_current_deb_arch(opts) + ":" + package_name
        if (cache_key in this.repo_index_cache) {
            local cached = this.repo_index_cache[cache_key]
            return cached == false ? null : cached
        }

        local parts = this.split_once(package_name, ":")
        local package_base = parts[0]
        local arch = parts[1] == null ? this.linux_current_deb_arch(opts) : parts[1]
        local files = this.linux_repo_index_files(opts)

        local match = this.linux_repo_lookup_package_map(opts, files, "package", package_base, arch)
        if (match == null) match = this.linux_repo_lookup_package_map(opts, files, "package", package_base, "all")
        if (match == null) match = this.linux_repo_lookup_package_map(opts, files, "provide", package_base, arch)
        if (match == null) match = this.linux_repo_lookup_package_map(opts, files, "provide", package_base, "all")

        local record = null
        if (match != null) {
            record = this.linux_repo_find_record_in_files([match], match.package_name, match.arch)
            if (record == null && match.arch != "all")
                record = this.linux_repo_find_record_in_files([match], match.package_name, "all")
        }

        this.repo_index_cache[cache_key] <- record == null ? false : record
        return record
    }

    function linux_deb_package_show(opts, package_name) {
        if (opts.linux.deb.download) {
            local output = this.linux_repo_package_show(opts, package_name)
            if (output != null) return output
        }

        local output = this.linux_apt_package_show(package_name)
        if (output != null) return output

        if (package_name.find(":") != null) {
            local package_base = this.split_once(package_name, ":")[0]
            output = this.linux_apt_package_show(package_base)
            if (this.linux_apt_package_architecture_from_output(output) == "all")
                return output
        }

        return null
    }

    function linux_split_dependency_list(value) {
        local out = []
        local item = ""
        local paren_depth = 0
        for (local i = 0; i < value.len(); i++) {
            local ch = value.slice(i, i + 1)
            if (ch == "(") paren_depth++
            else if (ch == ")" && paren_depth > 0) paren_depth--

            if (ch == "," && paren_depth == 0) {
                local trimmed = this.trim_space(item)
                if (trimmed != "") out.push(trimmed)
                item = ""
            } else {
                item += ch
            }
        }

        local trimmed = this.trim_space(item)
        if (trimmed != "") out.push(trimmed)
        return out
    }

    function linux_deb_package_depends_from_stanza(stanza) {
        local fields = this.linux_deb_stanza_fields(stanza)
        local out = this.linux_deb_stanza_field(stanza, "Package") + "\n"
        foreach (field in ["Pre-Depends", "Depends"]) {
            local value = this.table_get(fields, field, "")
            if (value == "") continue
            foreach (dep in this.linux_split_dependency_list(value))
                out += "  Depends: " + dep + "\n"
        }
        return out
    }

    function linux_deb_package_depends(opts, package_name) {
        if (opts.linux.deb.download) {
            local stanza = this.linux_repo_package_show(opts, package_name)
            if (stanza != null)
                return this.linux_deb_package_depends_from_stanza(stanza)
        }

        return this.linux_apt_package_depends(package_name)
    }

    function linux_deb_package_available(opts, package_name) {
        return this.linux_deb_package_show(opts, package_name) != null
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

        local metadata = this.linux_deb_archive_metadata(opts, package_name)
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

    function linux_deb_archive_metadata(opts, package_name) {
        local output = this.linux_deb_package_show(opts, package_name)
        if (output == null) return null
        return this.linux_deb_archive_metadata_from_output(package_name, output)
    }

    function linux_deb_archive_metadata_from_output(requested_package, output) {
        local package_field = ""
        local version = ""
        local architecture = ""
        local filename = ""
        local repo_uri = ""

        foreach (line in this.split_lines(output)) {
            if (this.starts_with(line, "Package: "))
                package_field = line.slice("Package: ".len())
            else if (this.starts_with(line, "Version: "))
                version = line.slice("Version: ".len())
            else if (this.starts_with(line, "Architecture: "))
                architecture = line.slice("Architecture: ".len())
            else if (this.starts_with(line, "Filename: "))
                filename = line.slice("Filename: ".len())
            else if (this.starts_with(line, "SqgiPkg-Repo-URI: "))
                repo_uri = line.slice("SqgiPkg-Repo-URI: ".len())
        }

        local basename = null
        if (package_field != "" && version != "" && architecture != "")
            basename = package_field + "_" + this.replace_char(version, ":", "%3a") + "_" + architecture + ".deb"
        else if (filename != "")
            basename = this.basename(filename)
        if (basename == null) return null

        local download_package = requested_package
        if (architecture == "all")
            download_package = this.split_once(requested_package, ":")[0]

        return {
            requested_package = requested_package,
            package_name = package_field,
            version = version,
            architecture = architecture,
            filename = filename,
            repo_uri = repo_uri,
            basename = basename,
            download_package = download_package,
            download_url = repo_uri == "" || filename == "" ? null : (this.strip_trailing_slashes(repo_uri) + "/" + filename)
        }
    }

    function linux_deb_archive_basename_from_output(output) {
        local metadata = this.linux_deb_archive_metadata_from_output("", output)
        return metadata == null ? null : metadata.basename
    }

    function linux_deb_archive_url_from_output(output) {
        local metadata = this.linux_deb_archive_metadata_from_output("", output)
        return metadata == null ? null : metadata.download_url
    }

    function linux_deb_archive_basename(opts, package_name) {
        local metadata = this.linux_deb_archive_metadata(opts, package_name)
        return metadata == null ? null : metadata.basename
    }

    function linux_download_deb(opts, package_name) {
        local arch = this.linux_current_deb_arch(opts)
        local cache_dir = GLib.build_filenamev([this.linux_package_cache(opts), arch])
        this.mkdir_p(cache_dir)

        local metadata = this.linux_deb_archive_metadata(opts, package_name)
        if (metadata == null)
            this.fail("cannot find apt metadata for Linux package: " + package_name)
        local basename = metadata.basename

        local archive = GLib.build_filenamev([cache_dir, basename])
        if (!this.path_exists(archive))
            archive = this.linux_find_cached_deb(cache_dir, package_name, arch, archive)
        if (opts.linux.deb.refresh && this.path_exists(archive)) remove(archive)
        if (!this.path_exists(archive)) {
            this.info("downloading Linux package " + package_name)
            if (metadata.download_url != null) {
                local tmp = archive + ".download"
                if (this.path_exists(tmp)) remove(tmp)
                this.run_shell(this.downloader_command(metadata.download_url, tmp),
                    "downloading Linux package " + package_name)
                if (this.path_exists(archive)) remove(archive)
                rename(tmp, archive)
            } else {
                this.run_shell_in_dir("apt-get download " + this.shell_quote(metadata.download_package), cache_dir,
                    "downloading Linux package " + package_name)
            }
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

    function write_linux_deb_sysroot_metadata(opts, package_name, file_list, metadata) {
        local dir = this.linux_deb_sysroot_package_metadata(opts, package_name)
        this.mkdir_p(dir)
        local files = ""
        foreach (path in file_list)
            files += path + "\n"
        this.write_file(GLib.build_filenamev([dir, "files"]), files)
        this.write_file(GLib.build_filenamev([dir, "archive"]), metadata.basename + "\n")

        local details = ""
        foreach (entry in [
            ["requested_package", package_name],
            ["resolved_package", metadata.package_name],
            ["version", metadata.version],
            ["architecture", metadata.architecture],
            ["archive", metadata.basename],
            ["filename", metadata.filename],
            ["repo_uri", metadata.repo_uri],
            ["download_url", metadata.download_url == null ? "" : metadata.download_url],
            ["extracted_at_unix_usec", "" + GLib.get_real_time()]
        ]) {
            details += entry[0] + ": " + entry[1] + "\n"
        }
        this.write_file(GLib.build_filenamev([dir, "metadata"]), details)
    }

    function extract_linux_deb_to_sysroot(opts, package_name) {
        local metadata = this.linux_deb_archive_metadata(opts, package_name)
        if (metadata == null)
            this.fail("cannot find apt metadata for Linux package: " + package_name)

        local archive = this.linux_download_deb(opts, package_name)
        local file_list = this.linux_deb_archive_files(archive)
        local sysroot = this.linux_download_sysroot_root(opts)

        this.mkdir_p(sysroot)
        this.run_shell("dpkg-deb -x " + this.shell_quote(archive) + " " + this.shell_quote(sysroot),
            "extracting Linux Debian package")
        this.write_linux_deb_sysroot_metadata(opts, package_name, file_list, metadata)
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

    function linux_dependency_alternatives(expr) {
        local out = []
        local item = ""
        for (local i = 0; i < expr.len(); i++) {
            local ch = expr.slice(i, i + 1)
            if (ch == "|") {
                local trimmed = this.trim_space(item)
                if (trimmed != "") out.push(trimmed)
                item = ""
            } else {
                item += ch
            }
        }

        local trimmed = this.trim_space(item)
        if (trimmed != "") out.push(trimmed)
        return out
    }

    function linux_dependency_package_candidates(opts, expr) {
        local out = []
        foreach (alternative in this.linux_dependency_alternatives(expr)) {
            local dep = this.linux_dependency_package_name(opts, alternative)
            if (dep != null) this.append_unique(out, dep)
        }
        return out
    }

    function linux_select_dependency_package(opts, expr, available, require_available = false) {
        local fallback = null
        foreach (dep in this.linux_dependency_package_candidates(opts, expr)) {
            if (fallback == null) fallback = dep
            if (this.linux_dependency_package_available(opts, dep, available))
                return dep
        }
        return require_available ? null : fallback
    }

    function linux_dependency_line_is_alternative(line) {
        line = this.trim_space(line)
        return this.starts_with(line, "|")
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

    function linux_dependency_package_available(opts, package_name, available) {
        if (available != null) return this.table_get(available, package_name, false)
        return this.linux_deb_package_available(opts, package_name)
    }

    function linux_deb_dependency_packages_from_output(opts, output, available = null) {
        local out = []
        local pending_virtual = false
        local pending_virtual_ends_alternative_group = false
        local alternative_group_active = false
        local alternative_group_satisfied = false

        foreach (line in this.split_lines(output)) {
            local trimmed = this.trim_space(line)
            local expr = this.linux_dependency_expr(trimmed)
            if (expr != null) {
                if (pending_virtual) {
                    pending_virtual = false
                    if (pending_virtual_ends_alternative_group) {
                        alternative_group_active = false
                        alternative_group_satisfied = false
                        pending_virtual_ends_alternative_group = false
                    }
                }

                local alternative_line = this.linux_dependency_line_is_alternative(trimmed)
                local final_alternative = alternative_group_active && !alternative_line
                if (alternative_line && !alternative_group_active) {
                    alternative_group_active = true
                    alternative_group_satisfied = false
                }

                if (alternative_group_satisfied) {
                    if (final_alternative) {
                        alternative_group_active = false
                        alternative_group_satisfied = false
                    }
                    continue
                }

                if (this.linux_dependency_is_virtual(expr)) {
                    pending_virtual = true
                    pending_virtual_ends_alternative_group = final_alternative
                    continue
                }

                local dep = this.linux_select_dependency_package(opts, expr, available, alternative_group_active)
                if (dep != null) this.append_unique(out, dep)
                if (dep != null && alternative_group_active)
                    alternative_group_satisfied = true
                if (final_alternative) {
                    alternative_group_active = false
                    alternative_group_satisfied = false
                }
                continue
            }

            if (this.linux_dependency_ignored_marker(trimmed)) {
                pending_virtual = false
                pending_virtual_ends_alternative_group = false
                alternative_group_active = false
                alternative_group_satisfied = false
                continue
            }

            if (pending_virtual) {
                local provider = this.linux_dependency_package_name(opts, trimmed)
                if (provider != null && this.linux_dependency_package_available(opts, provider, available)) {
                    this.append_unique(out, provider)
                    if (alternative_group_active)
                        alternative_group_satisfied = true
                    pending_virtual = false
                    if (pending_virtual_ends_alternative_group) {
                        alternative_group_active = false
                        alternative_group_satisfied = false
                        pending_virtual_ends_alternative_group = false
                    }
                }
            }
        }

        return out
    }

    function resolve_linux_deb_package(opts, package_name, resolved, visiting, ordered) {
        package_name = this.linux_arch_package(package_name, this.linux_current_deb_arch(opts))
        if (this.table_get(resolved, package_name, false)) return
        if (this.table_get(visiting, package_name, false)) return

        if (!this.linux_deb_package_available(opts, package_name))
            this.fail("cannot find Linux package " + package_name +
                " in sqgipkg's configured Debian/Ubuntu package indexes for architecture " +
                this.linux_current_deb_arch(opts))

        visiting[package_name] <- true
        local output = this.linux_deb_package_depends(opts, package_name)
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

        this.ensure_linux_sysroot_compat_links(opts)
    }

    function ensure_linux_sysroot_compat_links(opts) {
        local sysroot = this.linux_current_sysroot(opts)
        if (sysroot == "") return

        local usr_lib64 = GLib.build_filenamev([sysroot, "usr", "lib64"])
        local lib64 = GLib.build_filenamev([sysroot, "lib64"])
        if (this.path_exists(usr_lib64) && !this.path_exists(lib64))
            this.create_linux_sysroot_symlink("usr/lib64", lib64)

        local arch = this.linux_current_arch(opts)
        if (arch == "aarch64")
            this.ensure_linux_sysroot_loader_link(opts, "ld-linux-aarch64.so.1")
        else if (arch == "i386" || arch == "i686")
            this.ensure_linux_sysroot_loader_link(opts, "ld-linux.so.2")

        this.ensure_linux_sysroot_triplet_file_link(opts, "libc.so.6")
        if (arch == "x86_64")
            this.ensure_linux_sysroot_triplet_file_link(opts, "ld-linux-x86-64.so.2")
        else if (arch == "aarch64")
            this.ensure_linux_sysroot_triplet_file_link(opts, "ld-linux-aarch64.so.1")
        else if (arch == "i386" || arch == "i686")
            this.ensure_linux_sysroot_triplet_file_link(opts, "ld-linux.so.2")
    }

    function create_linux_sysroot_symlink(target, link) {
        this.mkdir_p(this.dirname(link))
        this.run_shell(
            "ln -s " + this.shell_quote(target) + " " + this.shell_quote(link),
            "creating Linux sysroot compatibility link"
        )
    }

    function ensure_linux_sysroot_loader_link(opts, loader_name) {
        local sysroot = this.linux_current_sysroot(opts)
        local link = GLib.build_filenamev([sysroot, "lib", loader_name])
        if (this.path_exists(link)) return

        local triplet = this.linux_current_triplet(opts)
        foreach (entry in [
            { source = GLib.build_filenamev([sysroot, "usr", "lib", loader_name]),
              target = "../usr/lib/" + loader_name },
            { source = GLib.build_filenamev([sysroot, "usr", "lib", triplet, loader_name]),
              target = "../usr/lib/" + triplet + "/" + loader_name }
        ]) {
            if (this.path_exists(entry.source)) {
                this.create_linux_sysroot_symlink(entry.target, link)
                return
            }
        }
    }

    function ensure_linux_sysroot_triplet_file_link(opts, name) {
        local sysroot = this.linux_current_sysroot(opts)
        local triplet = this.linux_current_triplet(opts)
        local src = GLib.build_filenamev([sysroot, "usr", "lib", triplet, name])
        local link = GLib.build_filenamev([sysroot, "lib", triplet, name])
        if (!this.path_exists(src) || this.path_exists(link)) return

        this.create_linux_sysroot_symlink("../../usr/lib/" + triplet + "/" + name, link)
    }

    function linux_unavailable_apt_packages(opts, packages) {
        local out = []

        foreach (package_name in packages) {
            if (!this.linux_deb_package_available(opts, package_name))
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
        message += "PKG_CONFIG_SYSROOT_DIR: " + this.linux_current_sysroot(opts) + "\n"
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
                    message += "Check the private repository index cache and sysroot resolver for:\n"
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
            if (opts.linux.deb.download)
                message += "\nThe private Debian/Ubuntu repository indexes do not currently contain these suggested packages:\n"
            else
                message += "\nApt cannot currently see these suggested packages:\n"
            foreach (package_name in unavailable_apt_packages)
                message += "  - " + package_name + "\n"
            if (opts.linux.deb.download) {
                message += "For the private sysroot workflow, retry with --refresh-linux-deb-packages to refresh cached repository indexes, or check network access to Ubuntu package repositories.\n"
                message += "This workflow does not require adding " + deb_arch + " to host apt.\n"
            } else {
                message += "If apt says 'Unable to locate package', run `sudo apt update` after adding " + deb_arch + ".\n"
                local host_deb_arch = this.deb_arch_for_appimage_arch(this.machine_arch())
                message += "If it still fails, check that your Ubuntu sources provide " + deb_arch + " package indexes; third-party sources may need architecture filters so host and target repos do not conflict.\n"
                if (deb_arch == "arm64" && host_deb_arch == "amd64") {
                    message += "\nOn Ubuntu amd64 hosts, arm64 packages normally come from ports.ubuntu.com. Keep your normal archive.ubuntu.com/security.ubuntu.com sources limited to host architectures such as amd64/i386, then add an arm64-only source such as:\n"
                    message += "  /etc/apt/sources.list.d/ubuntu-arm64.sources\n"
                    message += "  Types: deb\n"
                    message += "  URIs: http://ports.ubuntu.com/ubuntu-ports/\n"
                    message += "  Suites: noble noble-updates noble-backports noble-security\n"
                    message += "  Components: main restricted universe multiverse\n"
                    message += "  Architectures: arm64\n"
                    message += "  Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg\n"
                    message += "Then run `sudo apt update` again.\n"
                } else if (deb_arch == "amd64" && host_deb_arch == "arm64") {
                    message += "\nOn Ubuntu arm64 hosts, amd64 packages normally come from archive.ubuntu.com/security.ubuntu.com while arm64 host packages normally come from ports.ubuntu.com. Keep ports sources limited to arm64, then add an amd64-only source such as:\n"
                    message += "  /etc/apt/sources.list.d/ubuntu-amd64.sources\n"
                    message += "  Types: deb\n"
                    message += "  URIs: http://archive.ubuntu.com/ubuntu/\n"
                    message += "  Suites: noble noble-updates noble-backports noble-security\n"
                    message += "  Components: main restricted universe multiverse\n"
                    message += "  Architectures: amd64\n"
                    message += "  Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg\n"
                    message += "Then run `sudo apt update` again.\n"
                }
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
            local unavailable_apt_packages = this.linux_unavailable_apt_packages(opts, install_packages)
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

    function report_linux_package_dest(opts, dest_rel) {
        dest_rel = this.relative_dest(dest_rel)
        if (this.starts_with(dest_rel, GLib.build_filenamev(["usr", "lib", "gstreamer-1.0"]) + "/")) {
            if (this.ends_with(dest_rel, ".so")) this.report_inc(opts, "gstreamer_plugins")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["usr", "lib", "girepository-1.0"]) + "/")) {
            if (this.ends_with(dest_rel, ".typelib")) this.report_inc(opts, "typelibs")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["usr", "share", "glib-2.0", "schemas"]) + "/")) {
            if (this.ends_with(dest_rel, ".xml")) this.report_inc(opts, "gsettings_schemas")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["usr", "lib", "gio", "modules"]) + "/")) {
            if (this.ends_with(dest_rel, ".so")) this.report_inc(opts, "gio_modules")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["usr", "lib", "gdk-pixbuf-2.0"]) + "/")) {
            if (this.ends_with(dest_rel, ".so")) this.report_inc(opts, "gdk_pixbuf_loaders")
            return
        }
        if (this.starts_with(dest_rel, GLib.build_filenamev(["usr", "share", "themes"]) + "/") ||
                this.starts_with(dest_rel, GLib.build_filenamev(["usr", "share", "icons"]) + "/") ||
                this.starts_with(dest_rel, GLib.build_filenamev(["usr", "share", "gtk-4.0"]) + "/") ||
                this.starts_with(dest_rel, GLib.build_filenamev(["usr", "lib", "gtk-4.0"]) + "/")) {
            this.report_inc(opts, "gtk_data")
        }
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

        local sysroot = this.linux_current_sysroot(opts)
        if (sysroot != "") sysroot = this.strip_trailing_slashes(sysroot)

        local copied = 0
        foreach (path in file_list) {
            local src = path
            if (!this.path_exists(src) && sysroot != "")
                src = GLib.build_filenamev([sysroot, this.normalize_package_entry(path)])
            if (!this.path_exists(src)) continue
            if (this.run_shell_status("[ -f " + this.shell_quote(src) + " ]") != 0) continue

            local dest = this.linux_package_dest_for_file(opts, path)
            if (dest == null) continue

            this.copy_file_to_appdir_dest(src, appdir, dest, "Linux package file")
            this.report_linux_package_dest(opts, dest)
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
                "/usr/lib/" + triplet + "/blas",
                "/usr/lib/" + triplet + "/lapack",
                "/usr/lib/" + triplet + "/openblas-pthread",
                "/usr/lib/" + triplet + "/pulseaudio",
                "/lib/" + triplet,
                "/lib/" + triplet + "/pulseaudio",
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
