local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("../appimage.nut")

class SqgiPkgWindowsEnv extends Base.SqgiPkgAppImage {
    function replace_char(value, needle, replacement) {
        local out = ""
        for (local i = 0; i < value.len(); i++) {
            local ch = value.slice(i, i + 1)
            out += (ch == needle) ? replacement : ch
        }
        return out
    }

    function windows_path(value) {
        return this.replace_char(value, "/", "\\")
    }

    function list_command_output(command, description) {
        local tmp = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-list-" + GLib.get_monotonic_time()])
        this.run_shell(command + " > " + this.shell_quote(tmp), description)
        local lines = this.path_exists(tmp) ? this.split_lines(this.read_file(tmp)) : []
        if (this.path_exists(tmp)) remove(tmp)
        return lines
    }

    function optional_command_output(command) {
        local tmp = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-output-" + GLib.get_monotonic_time()])
        local status = system(command + " > " + this.shell_quote(tmp) + " 2>/dev/null")
        local lines = (status == 0 && this.path_exists(tmp)) ? this.split_lines(this.read_file(tmp)) : []
        if (this.path_exists(tmp)) remove(tmp)
        return lines
    }

    function command_output_text(command) {
        local lines = this.optional_command_output(command)
        if (lines.len() == 0) return ""
        return lines[0]
    }

    function first_ldd_library(binary, library_name) {
        foreach (line in this.optional_command_output("ldd " + this.shell_quote(binary))) {
            local marker = library_name + " => "
            local pos = line.find(marker)
            if (pos == null) continue
            local rest = line.slice(pos + marker.len())
            local parts = this.split_once(rest, " ")
            if (parts[0] != "" && parts[0] != "not") return parts[0]
        }
        return null
    }

    function windows_sysroot_root(opts) {
        // Keep the Windows sysroot absolute.  CMake, pkg-config and Meson may
        // execute from different directories (manifest dir, native project dir,
        // CMake source/build dir), so relative sysroot paths produce poisoned
        // include paths such as ../../dist or repo-root/dist.
        if (opts.windows.msys2_root == "")
            opts.windows.msys2_root = GLib.build_filenamev([opts.output_dir, "_msys2-" + opts.windows.msys2_prefix])
        opts.windows.msys2_root = this.abs_path(opts.windows.msys2_root)
        return opts.windows.msys2_root
    }

    function windows_sysroot_prefix_dir(opts) {
        return GLib.build_filenamev([this.windows_sysroot_root(opts), opts.windows.msys2_prefix])
    }

    function windows_cross_dir(opts) {
        return GLib.build_filenamev([this.abs_path(opts.output_dir), "_cross", opts.windows.msys2_prefix])
    }

    function windows_cmake_toolchain_path(opts) {
        if (opts.windows.cmake_toolchain != "")
            return this.abs_path(opts.windows.cmake_toolchain)
        return GLib.build_filenamev([this.windows_cross_dir(opts), "toolchain-mingw64.cmake"])
    }

    function windows_meson_cross_file_path(opts) {
        if (opts.windows.meson_cross_file != "")
            return this.abs_path(opts.windows.meson_cross_file)
        return GLib.build_filenamev([this.windows_cross_dir(opts), "mingw64.ini"])
    }

    function windows_exe_wrapper_path(opts) {
        return GLib.build_filenamev([this.windows_cross_dir(opts), "wine-wrapper.sh"])
    }

    function windows_gir_scanner_wrapper_path(opts) {
        return GLib.build_filenamev([this.windows_cross_dir(opts), "g-ir-scanner-wrapper.sh"])
    }

    function windows_gir_ldd_wrapper_path(opts) {
        return GLib.build_filenamev([this.windows_cross_dir(opts), "g-ir-ldd-wrapper.sh"])
    }

    function write_windows_cmake_toolchain(opts, path) {
        local prefix_dir = this.windows_sysroot_prefix_dir(opts)
        this.mkdir_p(this.dirname(path))
        this.write_file(path,
            "set(CMAKE_SYSTEM_NAME Windows)\n" +
            "set(CMAKE_SYSTEM_PROCESSOR x86_64)\n" +
            "\n" +
            "set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)\n" +
            "set(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)\n" +
            "set(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres)\n" +
            "set(CMAKE_AR x86_64-w64-mingw32-ar)\n" +
            "set(CMAKE_RANLIB x86_64-w64-mingw32-ranlib)\n" +
            "set(CMAKE_STRIP x86_64-w64-mingw32-strip)\n" +
            "\n" +
            "set(SQGI_MSYS2_PREFIX \"" + prefix_dir + "\")\n" +
            "set(CMAKE_FIND_ROOT_PATH \"${SQGI_MSYS2_PREFIX}\")\n" +
            "set(CMAKE_PREFIX_PATH \"${SQGI_MSYS2_PREFIX}\")\n" +
            "\n" +
            "set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n" +
            "set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n" +
            "set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n" +
            "set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)\n" +
            "\n" +
            "set(ENV{PKG_CONFIG_PATH} \"\")\n" +
            "set(ENV{PKG_CONFIG_SYSROOT_DIR} \"" + opts.windows.msys2_root + "\")\n" +
            "set(ENV{PKG_CONFIG_LIBDIR} \"" + prefix_dir + "/lib/pkgconfig:" + prefix_dir + "/share/pkgconfig\")\n" +
            "set(PKG_CONFIG_EXECUTABLE pkg-config CACHE FILEPATH \"pkg-config\")\n")
    }

    function write_windows_exe_wrapper(opts) {
        local wine = this.executable_path("wine")
        if (wine == null) wine = this.executable_path("wine64")
        if (wine == null) return null

        local path = this.windows_exe_wrapper_path(opts)
        local prefix_bin = GLib.build_filenamev([this.windows_sysroot_prefix_dir(opts), "bin"])
        this.mkdir_p(this.dirname(path))
        this.write_file(path,
            "#!/bin/sh\n" +
            "WINEPATH_PREFIX=" + this.shell_quote(prefix_bin) + "\n" +
            "if [ -n \"${PATH:-}\" ]; then\n" +
            "  SQGIPKG_PATH_AS_WINEPATH=$(printf '%s' \"${PATH}\" | tr ':' ';')\n" +
            "  WINEPATH_PREFIX=\"${WINEPATH_PREFIX};${SQGIPKG_PATH_AS_WINEPATH}\"\n" +
            "fi\n" +
            "if [ -n \"${WINEPATH:-}\" ]; then\n" +
            "  export WINEPATH=\"${WINEPATH_PREFIX};${WINEPATH}\"\n" +
            "else\n" +
            "  export WINEPATH=\"${WINEPATH_PREFIX}\"\n" +
            "fi\n" +
            "export PATH=" + this.shell_quote(prefix_bin) + ":${PATH:-}\n" +
            "exec " + this.shell_quote(wine) + " \"$@\"\n")
        this.chmod_exec(path)
        return path
    }

    function write_windows_gir_ldd_wrapper(opts) {
        local objdump = this.executable_path("x86_64-w64-mingw32-objdump")
        if (objdump == null) objdump = "x86_64-w64-mingw32-objdump"

        local path = this.windows_gir_ldd_wrapper_path(opts)
        local prefix_dir = this.windows_sysroot_prefix_dir(opts)
        this.mkdir_p(this.dirname(path))
        this.write_file(path,
            "#!/bin/sh\n" +
            "binary=\"$1\"\n" +
            "if [ -z \"$binary\" ] || [ ! -r \"$binary\" ]; then\n" +
            "  exit 1\n" +
            "fi\n" +
            "prefix_dir=" + this.shell_quote(prefix_dir) + "\n" +
            "binary_dir=$(dirname \"$binary\")\n" +
            this.shell_quote(objdump) + " -p \"$binary\" 2>/dev/null | sed -n 's/^[[:space:]]*DLL Name: //p' | while IFS= read -r dll; do\n" +
            "  resolved=\"\"\n" +
            "  for dir in \"$binary_dir\" \"$PWD\" \"$PWD/.libs\" \"$PWD/..\" \"$prefix_dir/bin\" \"$prefix_dir/lib\"; do\n" +
            "    if [ -f \"$dir/$dll\" ]; then\n" +
            "      resolved=\"$dir/$dll\"\n" +
            "      break\n" +
            "    fi\n" +
            "  done\n" +
            "  if [ -z \"$resolved\" ]; then\n" +
            "    resolved=\"$dll\"\n" +
            "  fi\n" +
            "  printf '\\t%s => %s (0x00000000)\\n' \"$dll\" \"$resolved\"\n" +
            "done\n")
        this.chmod_exec(path)
        return path
    }

    function write_windows_gir_scanner_wrapper(opts, exe_wrapper, ldd_wrapper) {
        local scanner = this.executable_path("g-ir-scanner")
        if (scanner == null) return null

        local path = this.windows_gir_scanner_wrapper_path(opts)
        local prefix_dir = this.windows_sysroot_prefix_dir(opts)
        local typelib_dir = GLib.build_filenamev([prefix_dir, "lib", "girepository-1.0"])
        this.mkdir_p(this.dirname(path))

        local command = "exec " + this.shell_quote(scanner)
        if (exe_wrapper != null) {
            command += " --use-binary-wrapper=" + this.shell_quote(exe_wrapper)
            command += " --use-ldd-wrapper=" + this.shell_quote(ldd_wrapper)
            command += " --lib-dirs-envvar=PATH"
        }
        command += " \"$@\"\n"

        this.write_file(path,
            "#!/bin/sh\n" +
            "export PATH=" + this.shell_quote(GLib.build_filenamev([prefix_dir, "bin"])) + ":${PATH:-}\n" +
            "if [ -d " + this.shell_quote(typelib_dir) + " ]; then\n" +
            "  if [ -n \"${GI_TYPELIB_PATH:-}\" ]; then\n" +
            "    export GI_TYPELIB_PATH=" + this.shell_quote(typelib_dir) + ":${GI_TYPELIB_PATH}\n" +
            "  else\n" +
            "    export GI_TYPELIB_PATH=" + this.shell_quote(typelib_dir) + "\n" +
            "  fi\n" +
            "fi\n" +
            command)
        this.chmod_exec(path)
        return path
    }

    function write_windows_meson_cross_file(opts, path) {
        local prefix_dir = this.windows_sysroot_prefix_dir(opts)
        local exe_wrapper = this.write_windows_exe_wrapper(opts)
        local ldd_wrapper = (exe_wrapper != null) ? this.write_windows_gir_ldd_wrapper(opts) : null
        local gir_scanner = this.write_windows_gir_scanner_wrapper(opts, exe_wrapper, ldd_wrapper)
        local gir_compiler = this.executable_path("g-ir-compiler")
        local binary_overrides = ""
        if (gir_scanner != null)
            binary_overrides += "g-ir-scanner = '" + gir_scanner + "'\n"
        if (gir_compiler != null)
            binary_overrides += "g-ir-compiler = '" + gir_compiler + "'\n"
        if (exe_wrapper != null)
            binary_overrides += "exe_wrapper = '" + exe_wrapper + "'\n"
        this.mkdir_p(this.dirname(path))
        this.write_file(path,
            "[binaries]\n" +
            "c = 'x86_64-w64-mingw32-gcc'\n" +
            "cpp = 'x86_64-w64-mingw32-g++'\n" +
            "ar = 'x86_64-w64-mingw32-ar'\n" +
            "strip = 'x86_64-w64-mingw32-strip'\n" +
            "windres = 'x86_64-w64-mingw32-windres'\n" +
            "pkg-config = 'pkg-config'\n" +
            binary_overrides +
            "\n" +
            "[properties]\n" +
            "sys_root = '" + opts.windows.msys2_root + "'\n" +
            "pkg_config_libdir = ['" + prefix_dir + "/lib/pkgconfig', '" + prefix_dir + "/share/pkgconfig']\n" +
            "\n" +
            "[host_machine]\n" +
            "system = 'windows'\n" +
            "cpu_family = 'x86_64'\n" +
            "cpu = 'x86_64'\n" +
            "endian = 'little'\n")
    }

    function env_empty(name) {
        local value = GLib.getenv(name)
        return value == null || value == ""
    }

    function prepare_windows_cross_environment(opts) {
        if (!this.starts_with(opts.target, "win-")) return
        if (this.is_windows_shell()) return

        local sysroot = this.windows_sysroot_root(opts)
        local prefix_dir = this.windows_sysroot_prefix_dir(opts)
        local needs_sysroot = opts.windows.packages.len() > 0 ||
            opts.windows.build.len() > 0 ||
            opts.windows.native_dependencies.len() > 0 ||
            opts.windows.native_projects.len() > 0
        if (!this.path_exists(prefix_dir) && !needs_sysroot)
            return
        if (!this.path_exists(prefix_dir))
            this.fail("Windows MSYS2 sysroot prefix not found: " + prefix_dir)

        this.require_windows_cross_tools(opts)

        local toolchain = this.windows_cmake_toolchain_path(opts)
        local cross_file = this.windows_meson_cross_file_path(opts)
        this.write_windows_cmake_toolchain(opts, toolchain)
        this.write_windows_meson_cross_file(opts, cross_file)

        // Always export the generated/selected cross files.  They are absolute
        // paths so manifests can simply reference $SQGI_WIN_CMAKE_TOOLCHAIN and
        // $SQGI_MESON_CROSS_FILE from any build directory.
        GLib.setenv("SQGI_WIN_CMAKE_TOOLCHAIN", toolchain, true)
        GLib.setenv("SQGI_MESON_CROSS_FILE", cross_file, true)
        GLib.setenv("SQGI_WINDOWS_SYSROOT", sysroot, true)
        GLib.setenv("SQGI_WINDOWS_PREFIX", "/" + opts.windows.msys2_prefix, true)
        GLib.setenv("SQGI_WINDOWS_PREFIX_DIR", prefix_dir, true)
        GLib.setenv("SQGI_WINDOWS_SYSROOT_PREFIX", prefix_dir, true)

        // Lock pkg-config to the Windows sysroot.  This prevents the host
        // /usr/include and /usr/lib/pkgconfig paths from leaking into MinGW
        // builds while keeping manifests free of pkg-config boilerplate.
        GLib.setenv("PKG_CONFIG_PATH", "", true)
        GLib.setenv("PKG_CONFIG_SYSROOT_DIR", sysroot, true)
        GLib.setenv("PKG_CONFIG_LIBDIR", prefix_dir + "/lib/pkgconfig:" + prefix_dir + "/share/pkgconfig", true)

        this.info("Windows cross sysroot: " + sysroot + " (" + opts.windows.msys2_prefix + ")")
        this.info("SQGI_WIN_CMAKE_TOOLCHAIN=" + GLib.getenv("SQGI_WIN_CMAKE_TOOLCHAIN"))
        this.info("SQGI_MESON_CROSS_FILE=" + GLib.getenv("SQGI_MESON_CROSS_FILE"))
    }

    function windows_cross_tool_names(opts) {
        return [
            "x86_64-w64-mingw32-gcc",
            "x86_64-w64-mingw32-g++",
            "x86_64-w64-mingw32-ar",
            "x86_64-w64-mingw32-strip",
            "x86_64-w64-mingw32-windres",
            "x86_64-w64-mingw32-objdump"
        ]
    }

    function windows_cross_tool_package_names(opts) {
        return [
            "gcc-mingw-w64-x86-64",
            "g++-mingw-w64-x86-64",
            "binutils-mingw-w64-x86-64"
        ]
    }

    function require_windows_cross_tools(opts) {
        if (this.is_windows_shell()) return

        local needs_tools = opts.windows.build.len() > 0 ||
            opts.windows.native_dependencies.len() > 0 ||
            opts.windows.native_projects.len() > 0
        if (!needs_tools) return

        local missing = []
        foreach (tool in this.windows_cross_tool_names(opts)) {
            if (!this.executable_available(tool)) missing.push(tool)
        }
        if (missing.len() == 0) return

        local message = "missing Windows x64 cross build tools for " +
            opts.windows.msys2_prefix + "; refusing to run Windows build.\n"
        message += "Missing tools:\n"
        foreach (tool in missing)
            message += "  - " + tool + "\n"
        message += "\nOn Ubuntu, install the missing host build tools with:\n"
        message += "  sudo apt install " + this.join_strings(this.windows_cross_tool_package_names(opts), " ") + "\n"
        message += "The Windows target remains x64; these tools are required on both x86_64 and arm64 Linux hosts.\n"

        this.fail(message)
    }

    function is_windows_shell() {
        local uname = this.command_output_text("uname -s")
        return this.starts_with(uname, "MINGW") ||
            this.starts_with(uname, "MSYS") ||
            this.starts_with(uname, "CYGWIN")
    }

    function command_list_contains(commands, needle) {
        foreach (command in commands) {
            if (command.find(needle) != null) return true
        }
        return false
    }

    function windows_native_builds_contain(opts, needle) {
        foreach (project in opts.windows.native_dependencies) {
            if (this.command_list_contains(project.build, needle) ||
                this.command_list_contains(project.install, needle))
                return true
        }
        foreach (project in opts.windows.native_projects) {
            if (this.command_list_contains(project.build, needle) ||
                this.command_list_contains(project.install, needle))
                return true
        }
        return false
    }

    function require_windows_build_environment(opts) {
        if (this.is_windows_shell()) return

        if (this.command_list_contains(opts.windows.build, "SQGI_WIN_CMAKE_TOOLCHAIN") &&
                (GLib.getenv("SQGI_WIN_CMAKE_TOOLCHAIN") == null || GLib.getenv("SQGI_WIN_CMAKE_TOOLCHAIN") == "")) {
            this.fail("SQGI_WIN_CMAKE_TOOLCHAIN is required for this Ubuntu/MinGW Windows build")
        }

        if (this.windows_native_builds_contain(opts, "SQGI_MESON_CROSS_FILE") &&
                (GLib.getenv("SQGI_MESON_CROSS_FILE") == null || GLib.getenv("SQGI_MESON_CROSS_FILE") == "")) {
            this.fail("SQGI_MESON_CROSS_FILE is required for this Ubuntu/MinGW native extension build")
        }
    }

    function windows_env_prefix(opts, include_source = false) {
        if (this.is_windows_shell()) return ""

        local sysroot = this.windows_sysroot_root(opts)
        local prefix_dir = this.windows_sysroot_prefix_dir(opts)

        local env = this.shell_export("PKG_CONFIG_PATH", "") +
            this.shell_export("PKG_CONFIG_SYSROOT_DIR", sysroot) +
            this.shell_export("PKG_CONFIG_LIBDIR", prefix_dir + "/lib/pkgconfig:" + prefix_dir + "/share/pkgconfig") +
            this.shell_export("SQGI_WIN_CMAKE_TOOLCHAIN", GLib.getenv("SQGI_WIN_CMAKE_TOOLCHAIN")) +
            this.shell_export("SQGI_MESON_CROSS_FILE", GLib.getenv("SQGI_MESON_CROSS_FILE")) +
            this.shell_export("SQGI_WINDOWS_BUILD_DIR", this.windows_build_dir(opts)) +
            this.shell_export("SQGI_WINDOWS_SYSROOT", sysroot) +
            this.shell_export("SQGI_WINDOWS_PREFIX", "/" + opts.windows.msys2_prefix) +
            this.shell_export("SQGI_WINDOWS_PREFIX_DIR", prefix_dir) +
            this.shell_export("SQGI_WINDOWS_SYSROOT_PREFIX", prefix_dir)
        if (include_source)
            env += this.shell_export("SQGI_SOURCE_DIR", this.ensure_sqgi_source(opts))
        return env
    }

    function run_windows_shell_in_dir(opts, command, dir, description) {
        this.run_shell_in_dir(this.windows_env_prefix(opts, command.find("SQGI_SOURCE_DIR") != null) + command, dir, description)
    }

    function run_windows_build(opts) {
        local dir = opts.manifest_dir == "" ? GLib.get_current_dir() : opts.manifest_dir
        this.require_windows_build_environment(opts)
        foreach (command in opts.windows.build) {
            this.info("Windows SQGI build: " + command)
            this.run_windows_shell_in_dir(opts, command, dir, "Windows SQGI build")
        }
    }

    function windows_build_dir(opts) {
        return opts.windows.build_dir == "" ? opts.build_dir : opts.windows.build_dir
    }

    function copy_windows_sqgi_runtime(opts, windir) {
        local build_dir = this.windows_build_dir(opts)
        local sqgi_exe = GLib.build_filenamev([build_dir, "sqgi.exe"])

        local copy_build_dlls = true
        if (!this.path_exists(sqgi_exe)) {
            local installed_sqgi = this.executable_path("sqgi.exe")
            if (installed_sqgi == null) {
                if (opts.windows.build.len() == 0) {
                    this.fail("Windows sqgi.exe not found at " + sqgi_exe +
                        ", no windows.build command is configured, and sqgi.exe is not in PATH; " +
                        "set windows.build/windows.build_dir or provide a Windows sqgi.exe")
                }
                this.fail("Windows build completed but sqgi.exe was not found at " + sqgi_exe +
                    " or in PATH; check windows.build_dir/windows.build output")
            }
            sqgi_exe = installed_sqgi
            copy_build_dlls = false
        }

        this.mkdir_p(GLib.build_filenamev([windir, "bin"]))
        this.run_shell(
            "cp " + this.shell_quote(sqgi_exe) + " " + this.shell_quote(GLib.build_filenamev([windir, "bin", "sqgi.exe"])),
            "copying Windows sqgi.exe"
        )

        if (copy_build_dlls) {
            local dlls = this.list_command_output(
                "find " + this.shell_quote(build_dir) + " -maxdepth 3 -type f -name '*.dll' | sort",
                "listing Windows SQGI DLLs"
            )
            foreach (dll in dlls) {
                this.run_shell(
                    "cp " + this.shell_quote(dll) + " " + this.shell_quote(GLib.build_filenamev([windir, "bin"])) + "/",
                    "copying Windows SQGI DLL"
                )
            }
        }
    }

    function copy_linux_native_entry(opts, appdir) {
        local src = this.abs_path(opts.entry_linux)
        if (!this.path_exists(src)) this.fail("native Linux entry not found: " + opts.entry_linux)
        this.require_elf_appimage_arch(src, opts.appimage_arch, "native Linux entry")

        local name = this.basename(src)
        local dest_rel = GLib.build_filenamev(["usr", "bin", name])
        local dest_abs = GLib.build_filenamev([appdir, dest_rel])
        this.mkdir_p(this.dirname(dest_abs))
        this.run_shell(
            "cp " + this.shell_quote(src) + " " + this.shell_quote(dest_abs),
            "copying native Linux entry"
        )
        this.chmod_exec(dest_abs)
        return dest_rel
    }

    function copy_windows_native_entry(opts, windir) {
        local src = this.abs_path(opts.entry_windows)
        if (!this.path_exists(src)) this.fail("native Windows entry not found: " + opts.entry_windows)

        local name = this.basename(src)
        local dest_rel = GLib.build_filenamev(["bin", name])
        this.copy_into_appdir(src, windir, dest_rel, "native Windows entry")
        return dest_rel
    }

}

return { SqgiPkgWindowsEnv = SqgiPkgWindowsEnv }
