local GLib = import("GLib")
local Base = import("scripts.nut")

class SqgiPkgRecipes extends Base.SqgiPkgScripts {
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
        return this.starts_with(opts.target, "win-") ? "windows-x86_64" : "linux-" + opts.appimage_arch
    }

    function recipe_build_dir(opts, project) {
        local root = opts.manifest_dir == "" ? GLib.get_current_dir() : opts.manifest_dir
        return GLib.build_filenamev([root, ".sqgipkg", "build", this.recipe_target(opts), project.name])
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
        if (!cmake && this.path_exists(GLib.build_filenamev([dir, "meson-private", "coredata.dat"]))) configure.push("--reconfigure")
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
        if (this.starts_with(opts.target, "win-")) options.SQGI_WINDOWS_GUI <- this.windows_gui_cmake_value(opts)
        return { name = "sqgi", build_system = "cmake", options = options, targets = ["sqgi-bin", "sqgi"] }
    }

    function build_runtime_recipe(opts) {
        if (!opts.runtime_recipe || opts.entry_type != "sqgi") return
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
        else this.apply_linux_package_defaults(opts)
        local runtime = { recipe = opts.runtime_recipe, revision = opts.sqgi_source.ref,
            build_dir = windows ? opts.windows.build_dir : opts.build_dir, commands = [],
            requested = opts.runtime_recipe ? { jit = opts.runtime_jit, kernels = true, backend = "LLVM" } : null,
            verified_binary = null }
        if (opts.runtime_recipe) {
            local source = opts.sqgi_source.dir != "" ? opts.sqgi_source.dir : this.sqgi_source_checkout_dir(opts)
            runtime.commands = this.recipe_commands(opts, this.runtime_project(opts), source)
        }
        local native = []
        foreach (project in (windows ? opts.windows.native_projects : opts.native_projects)) {
            local commands = project.build_system == "" ? [] : this.recipe_commands(opts, project, project.dir)
            foreach (command in project.build) commands.push(command)
            native.push({ name = project.name, build_system = project.build_system,
                dir = project.dir, commands = commands })
        }
        return { target = opts.target, architecture = windows ? "x86_64" : opts.appimage_arch,
            name = opts.name, entry = opts.entry_type == "sqgi" ? opts.script : (windows ? opts.entry_windows : opts.entry_linux),
            output = this.abs_path(opts.output_dir), runtime = runtime, native = native,
            packages = windows ? opts.windows.packages : opts.linux.deb.packages,
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
        } else print("  runtime: existing build or installed runtime\n")
        foreach (project in plan.native) {
            print("  native: " + project.name + " (" + (project.build_system == "" ? "custom" : project.build_system) + ")\n")
            foreach (command in project.commands) print("    " + sqgi.json.stringify(command) + "\n")
        }
        if (!this.starts_with(plan.target, "win-")) print("  Linux package suite: " + plan.linux_suite + "\n")
        print("  runtime packages: " + sqgi.json.stringify(plan.packages) + "\n")
    }

}
return { SqgiPkgRecipes = SqgiPkgRecipes }
