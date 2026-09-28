local GLib = import("GLib")
local Base = import("scripts.nut")
local sdk_helper = GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null)) + "/native_sdk.py"

class SqgiPkgRecipes extends Base.SqgiPkgScripts {
    function native_sdk_command() {
        local python = this.executable_path("python3")
        if (python == null) this.fail("Native development export requires Python 3")
        return [python, sdk_helper]
    }

    function prepare_native_sdk(opts) {
        if (this.starts_with(opts.target, "win-")) return
        if (!("linux_ooblerg" in opts)) {
            if (opts.native_projects.len() == 0) return
            if (opts.entry_type != "native" && opts.native_projects.len() < 2) return
        }
        local base_root = this.linux_current_sysroot(opts)
        if (base_root == "") return // Preserve legacy builds using host development files.
        local root = GLib.build_filenamev([this.abs_path(opts.output_dir), "_native_sdk", this.recipe_target(opts)])
        local argv = this.native_sdk_command()
        foreach (arg in ["init", "--base", base_root, "--root", root]) argv.push(arg)
        this.info("preparing private native development SDK: " + root)
        this.run_process(argv, "preparing private native development SDK")
        opts.native_sdk <- root
    }

    function export_native_development(opts, project) {
        if (!("native_sdk" in opts) || project.name == opts.entry_project || project.build_system == "") return
        local argv = this.native_sdk_command()
        foreach (arg in ["export", "--root", opts.native_sdk, "--build", this.recipe_build_dir(opts, project),
            "--system", project.build_system, "--owner", project.name]) argv.push(arg)
        if (this.recipe_uses_host_gi(opts, project)) {
            local host = this.new_options(); host.target = "appimage"; host.manifest_dir = opts.manifest_dir
            host.appimage_arch = this.normalize_appimage_arch(this.machine_arch())
            local item = clone project; item.name = project.name + "-gi-host"
            argv.push("--host-gi"); argv.push(this.recipe_build_dir(host, item))
        }
        this.run_process(argv, "exporting native development files for " + project.name)
    }

    function recipe_environment(opts) {
        if (this.starts_with(opts.target, "win-")) {
            local env = {}
            foreach (key in ["PKG_CONFIG_PATH", "PKG_CONFIG_LIBDIR", "PKG_CONFIG_SYSROOT_DIR", "PATH"])
                if (GLib.getenv(key) != null) env[key] <- GLib.getenv(key)
            return env
        }
        local env = {}
        local sysroot = this.linux_current_sysroot(opts)
        if (sysroot != "") {
            env.PKG_CONFIG_PATH <- ""
            env.PKG_CONFIG_LIBDIR <- this.linux_pkg_config_libdir(opts)
            env.PKG_CONFIG_SYSROOT_DIR <- sysroot
            if (this.linux_current_is_cross(opts)) env.QEMU_LD_PREFIX <- sysroot
            else {
                foreach (key in ["CFLAGS", "CXXFLAGS", "CPPFLAGS"])
                    env[key] <- this.append_env_flag(key, "--sysroot=" + sysroot)
                env.LDFLAGS <- this.append_env_flag("LDFLAGS", this.linux_native_sysroot_ldflags(opts))
            }
            local vala = this.linux_vala_flags(opts)
            if (vala != null) env.VALAFLAGS <- vala
        }
        return env
    }

    function recipe_target(opts) {
        return this.starts_with(opts.target, "win-") ? (opts.windows.package_source == "ooblerg" ? "windows-x86_64-ooblerg" : "windows-x86_64") : "linux-" + opts.appimage_arch
    }

    function recipe_build_dir(opts, project) {
        local root = opts.manifest_dir == "" ? GLib.get_current_dir() : opts.manifest_dir
        return GLib.build_filenamev([root, ".sqgipkg", "build", this.recipe_target(opts), project.name])
    }

    function resolve_native_recipe_entry(opts) {
        if (opts.entry_type != "native" || opts.entry_project == "") return
        local windows = this.starts_with(opts.target, "win-")
        this.current_error_path = ["entry", "project"]
        local project = null
        foreach (item in (windows ? opts.windows.native_projects : opts.native_projects))
            if (item.name == opts.entry_project) project = item
        if (project == null || (project.build_system != "meson" && project.build_system != "cmake"))
            this.fail("entry.project must name a Meson/CMake native recipe for " + this.recipe_target(opts) + ": " + opts.entry_project)
        if (!windows) foreach (config in opts.linux.arches)
            if (this.table_get(config, "entry_linux", "") != "")
                this.fail("entry.project cannot be combined with architecture-specific entry_linux paths")
        local executable = opts.entry_executable
        if (windows && !this.ends_with(executable.tolower(), ".exe")) executable += ".exe"
        local path = GLib.build_filenamev([this.recipe_build_dir(opts, project), executable])
        if (windows) opts.entry_windows = path
        else opts.entry_linux = path
        this.current_error_path = []
    }

    function recipe_cross_file(opts, cmake) {
        if (this.starts_with(opts.target, "win-")) {
            if (this.host_windows()) return ""
            return cmake ? this.windows_cmake_toolchain_path(opts) : this.windows_meson_cross_file_path(opts)
        }
        if (!this.linux_current_is_cross(opts)) return ""
        return cmake ? this.linux_cmake_toolchain_path(opts) : this.linux_meson_cross_file_path(opts)
    }

    function recipe_commands(opts, project, source) {
        local dir = this.recipe_build_dir(opts, project)
        local cmake = project.build_system == "cmake"
        local cross = this.recipe_cross_file(opts, cmake)
        local configure = cmake ? ["cmake", "-S", source, "-B", dir, "-G", "Ninja", "-DCMAKE_BUILD_TYPE=Release"]
            : ["meson", "setup", dir, source, "--buildtype=release"]
        if (!cmake && this.path_exists(GLib.build_filenamev([dir, "meson-private", "coredata.dat"]))) {
            local marker = GLib.build_filenamev([dir, ".sqgipkg-native-sdk"])
            if ("native_sdk" in opts && (!this.path_exists(marker) || this.read_file(marker) != opts.native_sdk))
                configure.push("--wipe") // Meson caches machine-file compiler/sysroot settings.
            else {
                configure.push("--reconfigure")
                if ("native_sdk" in opts) configure.push("--clearcache")
            }
        }
        if ("native_sdk" in opts && project.name != opts.entry_project) {
            if (!("prefix" in project.options) && !("CMAKE_INSTALL_PREFIX" in project.options))
                configure.push(cmake ? "-DCMAKE_INSTALL_PREFIX=/usr" : "--prefix=/usr")
            if (!cmake && !("libdir" in project.options)) configure.push("--libdir=lib/" + this.linux_current_triplet(opts))
        }
        if (cross != "") {
            if (cmake) configure.push("-DCMAKE_TOOLCHAIN_FILE=" + cross)
            else { configure.push("--cross-file"); configure.push(cross) }
        }
        local keys = []
        foreach (key, value in project.options) keys.push(key)
        keys.sort()
        foreach (key in keys) configure.push("-D" + key + "=" + project.options[key])
        local compile = cmake ? ["cmake", "--build", dir] : ["meson", "compile", "-C", dir]
        local targets = this.table_get(project, "targets", [])
        if (this.recipe_uses_host_gi(opts, project)) targets = [project.gi.library]
        if (targets.len() > 0) {
            if (cmake) compile.push("--target")
            foreach (target in targets) compile.push(target)
        }
        return [configure, compile]
    }

    function run_native_recipe(opts, project) {
        if (this.table_get(project, "build_system", "") == "") return
        if (!("recipe_auto_libraries" in project)) project.recipe_auto_libraries <- project.libraries.len() == 0
        if (!("recipe_auto_typelibs" in project)) project.recipe_auto_typelibs <- project.typelibs.len() == 0
        if (project.recipe_auto_libraries) project.libraries = []
        if (project.recipe_auto_typelibs) project.typelibs = []
        local env = this.recipe_environment(opts)
        foreach (argv in this.recipe_commands(opts, project, project.dir))
            this.run_process(argv, project.name + " " + argv[0], null, env)
        local dir = this.recipe_build_dir(opts, project)
        if ("native_sdk" in opts) this.write_file(GLib.build_filenamev([dir, ".sqgipkg-native-sdk"]), opts.native_sdk)
        // Explicit outputs remain available. Otherwise collect the native build
        // products, including projects whose Meson targets use install:false.
        if (project.libraries.len() == 0) {
            foreach (path in this.find_files(dir)) {
                local name = this.basename(path).tolower()
                if (this.starts_with(opts.target, "win-") ? this.ends_with(name, ".dll") :
                        (this.ends_with(name, ".so") || name.find(".so.") != null)) project.libraries.push(path)
            }
        }
        if (this.recipe_uses_host_gi(opts, project)) this.build_host_gi(opts, project)
        else if (project.typelibs.len() == 0) project.typelibs = this.find_files(dir, "*.typelib")
        this.export_native_development(opts, project)
        local entry = this.starts_with(opts.target, "win-") ? opts.entry_windows : opts.entry_linux
        local builds_entry = opts.entry_type == "native" && entry != "" &&
            this.path_is_within_dir(entry, dir) && this.path_exists(entry)
        if (project.stage && !builds_entry && project.libraries.len() == 0 && project.files.len() == 0)
            this.fail("native recipe produced no shared libraries: " + project.name + "; declare files for other outputs")
    }

    function recipe_uses_host_gi(opts, project) {
        if (this.table_get(project, "gi", null) == null) return false
        if (this.starts_with(opts.target, "win-")) return !this.host_windows()
        return this.linux_current_is_cross(opts)
    }

    function build_host_gi(opts, project) {
        if (project.build_system != "meson") this.fail("host GI recipe currently requires Meson")
        local host = this.new_options()
        host.target = "appimage"
        host.manifest_dir = opts.manifest_dir
        host.appimage_arch = this.normalize_appimage_arch(this.machine_arch())
        local host_project = clone project
        host_project.name = project.name + "-gi-host"
        host_project.gi = null
        host_project.targets = []
        local env = { PATH = opts.host_path, PKG_CONFIG_PATH = null, PKG_CONFIG_LIBDIR = null, PKG_CONFIG_SYSROOT_DIR = null,
            CFLAGS = null, CXXFLAGS = null, CPPFLAGS = null, LDFLAGS = null, GI_TYPELIB_PATH = null, VALAFLAGS = null, LD_LIBRARY_PATH = null }
        foreach (argv in this.recipe_commands(host, host_project, project.dir))
            this.run_process(argv, project.name + " host GI", null, env)
        local gir_name = project.gi.namespace + "-" + project.gi.version + ".gir"
        local candidates = this.find_files(this.recipe_build_dir(host, host_project), gir_name)
        if (candidates.len() != 1) this.fail("host GI recipe requires exactly one " + gir_name)
        local text = this.read_file(candidates[0])
        local marker = "shared-library=\""
        local start = text.find(marker)
        if (start == null) this.fail("host GIR has no shared-library attribute: " + gir_name)
        start += marker.len()
        local end = text.find("\"", start)
        if (end == null) this.fail("invalid shared-library attribute in " + gir_name)
        local libraries = []
        foreach (path in project.libraries)
            if (this.basename(path).find(project.gi.library) != null) libraries.push(path)
        if (libraries.len() == 0) this.fail("GI target library not found: " + project.gi.library)
        // Preserve the metadata; change only its declared target library name.
        // This strategy is explicit because metadata must describe the same API
        // on both targets. Native Windows builds generate GI natively instead.
        text = text.slice(0, start) + this.basename(libraries[0]) + text.slice(end)
        local dir = this.recipe_build_dir(opts, project)
        local gir = GLib.build_filenamev([dir, gir_name])
        local typelib = this.replace_suffix(gir, ".gir", ".typelib")
        this.write_file(gir, text)
        this.run_process(["g-ir-compiler", gir, "--output", typelib], "compile target GI metadata", null, env)
        project.typelibs = [typelib]
    }

    function runtime_project(opts) {
        // C-PKG-03: configure the standard runtime even in a stale build cache.
        local options = { SQ_ENABLE_JIT = opts.runtime_jit ? "ON" : "OFF",
            SQGI_ENABLE_KERNELS = "ON", SQGI_BYTECODE_JIT_BACKEND = "LLVM",
            SQGI_KERNEL_BACKEND = "LLVM" }
        if (this.starts_with(opts.target, "win-")) {
            options.SQGI_WINDOWS_GUI <- this.windows_gui_cmake_value(opts)
            if (opts.windows.package_source == "ooblerg") {
                local prefix = this.windows_sysroot_prefix_dir(opts)
                options.SQGI_LLVM_INCLUDE_DIR <- prefix + "/include"
                options.SQGI_LLVM_LIBRARY <- prefix + "/lib/LLVM-C.lib"
            }
        }
        else {
            local sysroot = this.linux_current_sysroot(opts)
            if (sysroot != "") {
                // Explicit values also replace host paths in an existing cache.
                options.SQGI_LLVM_INCLUDE_DIR <- GLib.build_filenamev([sysroot, "usr", "lib", "llvm-18", "include"])
                options.SQGI_LLVM_LIBRARY <- GLib.build_filenamev([sysroot, "usr", "lib", this.linux_current_triplet(opts), "libLLVM-18.so"])
            }
        }
        return { name = "sqgi", build_system = "cmake", options = options, targets = ["sqgi-bin", "sqgi"] }
    }

    function build_runtime_recipe(opts) {
        if (!opts.runtime_recipe || opts.entry_type != "sqgi") return
        if (this.starts_with(opts.target, "win-") && opts.windows.runtime == "package") return
        local source = this.ensure_sqgi_source(opts)
        local project = this.runtime_project(opts)
        foreach (argv in this.recipe_commands(opts, project, source))
            this.run_process(argv, "SQGI runtime " + argv[0], null, this.recipe_environment(opts))
        local dir = this.recipe_build_dir(opts, project)
        if (this.starts_with(opts.target, "win-")) opts.windows.build_dir = dir
        else opts.build_dir = dir
    }

    function resolved_plan(opts) {
        this.scan_project_imports(opts)
        local windows = this.starts_with(opts.target, "win-")
        if (windows) this.apply_windows_package_defaults(opts)
        else { this.apply_linux_ooblerg_defaults(opts); this.apply_linux_package_defaults(opts) }
        local package_runtime = windows && opts.windows.runtime == "package"
        local runtime = { recipe = opts.runtime_recipe && !package_runtime, package = package_runtime ? "sqgi" : null, revision = opts.sqgi_source.ref,
            build_dir = windows ? opts.windows.build_dir : opts.build_dir, commands = [],
            requested = opts.runtime_recipe && !package_runtime ? { jit = opts.runtime_jit, kernels = true, backend = "LLVM" } : null,
            verified_binary = null }
        if (runtime.recipe) {
            local source = opts.sqgi_source.dir != "" ? opts.sqgi_source.dir : this.sqgi_source_checkout_dir(opts)
            runtime.commands = this.recipe_commands(opts, this.runtime_project(opts), source)
        }
        local native = []
        foreach (project in (windows ? opts.windows.native_projects : opts.native_projects)) {
            local package = windows ? project.windows_package : project.linux_package
            local commands = project.build_system == "" || package != "" ? [] : this.recipe_commands(opts, project, project.dir)
            if (package == "") foreach (command in project.build) commands.push(command)
            native.push({ name = project.name, build_system = project.build_system,
                dir = project.dir, package = package, commands = commands })
        }
        return { target = opts.target, architecture = windows ? "x86_64" : opts.appimage_arch,
            name = opts.name, entry = opts.entry_type == "sqgi" ? opts.script : (windows ? opts.entry_windows : opts.entry_linux),
            output = this.abs_path(opts.output_dir), runtime = runtime, native = native,
            package_source = windows ? opts.windows.package_source : "ubuntu",
            build_packages = windows ? opts.windows.build_packages : [],
            packages = windows ? opts.windows.packages : opts.linux.deb.packages,
            ooblerg_packages = windows ? [] : this.linux_ooblerg_seeds(opts).packages,
            ooblerg_build_packages = windows ? [] : this.linux_ooblerg_seeds(opts).build_packages,
            ooblerg_repository = windows ? opts.windows.repo_url : opts.linux.ooblerg_repository,
            linux_suite = opts.linux.deb.suite, files = opts.files, scripts = opts.scripts,
            script_dirs = opts.script_dirs, resources = opts.resources, features = opts.features,
            discovery = opts.report, generated_outputs = "Native outputs are resolved after their build recipes run" }
    }

    function explain_one(opts) {
        local plan = this.resolved_plan(opts)
        print("sqgipkg plan (no fetch/build)\n")
        print("  app: " + plan.name + "\n  target: " + plan.target + "\n  output: " + plan.output + "\n")
        if (plan.runtime.recipe) {
            print("  runtime: SQGI " + plan.runtime.revision + " (CMake recipe)\n")
            foreach (argv in plan.runtime.commands) print("    " + sqgi.json.stringify(argv) + "\n")
        } else print(plan.runtime.package != null ? "  runtime: Ooblerg package " + plan.runtime.package + "\n" : "  runtime: existing build or installed runtime\n")
        foreach (project in plan.native) {
            print("  native: " + project.name + " (" + (project.build_system == "" ? "custom" : project.build_system) + ")\n")
            foreach (command in project.commands) print("    " + sqgi.json.stringify(command) + "\n")
        }
        if (!this.starts_with(plan.target, "win-")) print("  Linux package suite: " + plan.linux_suite + "\n")
        print("  runtime packages: " + sqgi.json.stringify(plan.packages) + "\n")
    }

}
return { SqgiPkgRecipes = SqgiPkgRecipes }
