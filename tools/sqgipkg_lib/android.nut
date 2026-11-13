local GLib = import("GLib")
local Base = import("doctor.nut")
local AndroidSdk = import("android/sdk.nut")
local AndroidToolchain = import("android/toolchain.nut")
local AndroidAssembly = import("android/assemble.nut")
local AndroidPackages = import("android/packages.nut")
local AndroidCommon = import("android/common.nut")
local AndroidSource = import("android/source.nut")
local AndroidEntry = import("android/entry.nut")
local AndroidCatalog = import("android/catalog.nut")
local AndroidRepository = import("android/repository.nut")
local AndroidProject = import("android/project.nut")
local AndroidRuntime = import("android/runtime.nut")
local AndroidResources = import("android/resources.nut")

class SqgiPkgAndroid extends Base.SqgiPkgDoctor {
    function migrate_android_project(args, options) {
        if (args.len() != 1 || args[0] != "--") this.fail("migrate uses --from-sqgi for its input; positional arguments are not accepted")
        foreach (flag, _ in this.long_options)
            if (["migrate-android", "from-sqgi", "manifest"].find(flag) == null && this.option_present(options, flag))
                this.fail("migrate cannot use --" + flag)
        local source = this.option_value(options, "from-sqgi")
        if (source == null) source = "sqgi.json"
        local destination = this.option_value(options, "manifest")
        if (destination == null) destination = GLib.path_get_dirname(this.abs_path(source)) + "/sqgipkg.json"
        local result = AndroidProject.migrate(source, destination)
        this.info("migrated " + result.files + " source files to " + result.destination + "; original sqgi.json and sources preserved")
        this.info("Use sqgipkg check --platform android --manifest " + this.shell_quote(result.destination))
        return 0
    }
    function android_catalog(args, options, target) {
        local opts = this.new_options()
        this.apply_option_dict(opts, options); this.apply_default_manifest(opts); this.apply_manifest(opts)
        if (opts.android.module_set == "") {
            local abi = target == "aarch64-linux-android" ? "arm64-v8a" : "x86_64"
            local loaded = AndroidCatalog.load({ repository = opts.android.repository, sdk_id = opts.android.sdk, abi = abi,
                cache = GLib.get_user_cache_dir() + "/sqgipkg/ooblerg", download = opts.android.download,
                refresh = this.option_present(options, "refresh-packages") })
            local packages = []; foreach (name in AndroidCommon.keys(loaded.entries)) packages.push(loaded.entries[name])
            return { protocol_version = 1, ok = true, diagnostics = [], target = target, repository = loaded.repo.url,
                sdk = opts.android.sdk, cached = loaded.cached, packages = packages }
        }
        local origin = opts.android.repository
        while (AndroidCommon.ends(origin, "/")) origin = origin.slice(0, origin.len() - 1)
        local url = origin + "/android/modules/" + opts.android.sdk + "/" + opts.android.module_set + "/" + target + "/v1"
        local repo = AndroidRepository.Repository(url, GLib.get_user_cache_dir() + "/sqgipkg/ooblerg", opts.android.download,
            this.option_present(options, "refresh-packages"), target)
        local catalog = repo.index(), raw = sqgi.json.parse(AndroidCommon.read(repo.cache + "/index.json"))
        if (AndroidCommon.get(raw, "schema") != 1 || AndroidCommon.get(raw, "release") != opts.android.module_set ||
            AndroidCommon.get(AndroidCommon.get(raw, "android_module", {}), "sdk_id") != opts.android.sdk)
            this.fail("Android module catalog does not match the selected SDK and module release")
        local packages = []
        foreach (name in AndroidCommon.keys(catalog.entries)) packages.push(catalog.entries[name])
        return { protocol_version = 1, ok = true, diagnostics = [], target = target, repository = url,
            sdk = opts.android.sdk, module_set = opts.android.module_set, cached = catalog.cached, packages = packages }
    }
    function is_android(opts) { return this.starts_with(opts.target, "android-") }
    function android_abi(value) {
        if (value == "aarch64" || value == "arm64") return "arm64-v8a"
        if (value != "arm64-v8a" && value != "x86_64") this.fail("unsupported Android ABI: " + value)
        return value
    }
    function new_options() {
        local opts = base.new_options()
        opts.platform <- ""; opts.architecture <- ""
        opts.target_explicit <- false
        opts.platform_enabled <- { linux = true, windows = true, android = true }
        opts.android_forced <- {}
        opts.android_entry <- null
        opts.android_runtime_explicit <- false
        opts.android_overrides_applied <- false
        opts.android_source_excludes <- []
        opts.android <- { declared = false, architectures = ["arm64-v8a"], format = "apk",
            sdk_path = "", ndk = "", sdk = "noble-android-r7", min_sdk = 31,
            repository = "https://ooblerg.xyz", download = true, refresh = false,
            runner = "auto", inspection_root = "", serial = "", module_set = "", variant = "debug",
            version_code = 1, version_name = "0.1.0", namespaces = ["Gtk-4.0"], runtime = "package",
            permissions = [], icon = "", native = [], packages = [], profile = "auto", compiler = "none" }
        return opts
    }
    function schema_fields() {
        local fields = base.schema_fields()
        fields.platforms.push("android")
        fields.platform_linux.push("enabled"); fields.platform_windows.push("enabled")
        fields.platform_android <- ["enabled", "architectures", "format", "sdk", "sdk_path", "min_sdk", "version_code",
            "version_name", "namespaces", "runtime", "repository", "download", "runner", "inspection_root", "serial", "module_set", "variant", "permissions", "icon", "native", "packages", "profile", "compiler"]
        return fields
    }
    function apply_option_dict(opts, options) {
        base.apply_option_dict(opts, options)
        if (this.option_value(options, "target") != null) opts.target_explicit = true
        foreach (pair in [["platform", "platform"], ["arch", "architecture"]]) {
            local value = this.option_value(options, pair[0])
            if (value != null) opts[pair[1]] = value
        }
        foreach (pair in [["android-sdk", "sdk_path"], ["android-ndk", "ndk"], ["android-inspection", "inspection_root"]]) {
            local value = this.option_value(options, pair[0])
            if (value != null) { opts.android[pair[1]] = this.abs_path(value); opts.android_forced[pair[1]] <- true }
        }
        foreach (pair in [["android-runner", "runner"], ["android-serial", "serial"], ["android-variant", "variant"]]) {
            local value = this.option_value(options, pair[0])
            if (value != null) { opts.android[pair[1]] = value; opts.android_forced[pair[1]] <- true }
        }
        local repository = this.option_value(options, "android-repository")
        if (repository != null) { opts.android.repository = repository; opts.android_forced.repository <- true }
        if (this.option_value(options, "no-android-download") != null) {
            opts.android.download = false; opts.android_forced.download <- true
        }
        if (this.option_value(options, "refresh-android-packages") != null) opts.android.refresh = true
    }
    function apply_recipe_manifest(opts, manifest, directory) {
        base.apply_recipe_manifest(opts, manifest, directory)
        local platforms = this.table_get(manifest, "platforms", {})
        foreach (platform in ["linux", "windows", "android"]) if (platform in platforms && "enabled" in platforms[platform]) {
            current_error_path = ["platforms", platform, "enabled"]
            if (typeof(platforms[platform].enabled) != "bool") this.fail("enabled must be a boolean")
            opts.platform_enabled[platform] = platforms[platform].enabled
        }
        current_error_path = null
        if (!("android" in platforms)) return
        opts.android.declared = true
        foreach (key, value in platforms.android) {
            if (key == "enabled") continue
            if (key == "runtime") opts.android_runtime_explicit = true
            current_error_path = ["platforms", "android", key]
            if (key == "native") {
                if (typeof(value) != "array") this.fail("Android native overrides must be an array")
                local names = {}
                foreach (index, item in value) {
                    local path = ["platforms", "android", "native", index]
                    if (typeof(item) != "table") this.fail("Android native override must be an object")
                    local fields = clone item
                    if ("gi" in fields && typeof(fields.gi) == "table") {
                        local gi_path = clone path; gi_path.push("gi")
                        this.validate_manifest_schema(fields.gi, "gi", "Android native GI override", true, gi_path)
                        delete fields.gi
                    }
                    this.validate_manifest_schema(fields, "native_projects", "platforms.android.native[" + index + "]", true, path)
                    current_error_path = path
                    if (typeof(item) != "table" || !("name" in item) || typeof(item.name) != "string" || item.name == "")
                        this.fail("Android native override requires an existing recipe name")
                    if (item.name in names) this.fail("Duplicate Android native override: " + item.name)
                    names[item.name] <- true
                }
            } else if (key == "packages") {
                if (typeof(value) != "array") this.fail("Android packages must be an array")
                local seen = {}
                foreach (name in value) {
                    if (typeof(name) != "string" || !regexp("^[a-z0-9][a-z0-9+.\\-]*$").match(name)) this.fail("Invalid Android package name")
                    if (name in seen) this.fail("Duplicate Android package: " + name)
                    seen[name] <- true
                }
            } else if (key == "permissions") {
                AndroidResources.permissions(value)
            } else if (key == "architectures" || key == "namespaces") {
                if (typeof(value) != "array" || !value.len()) this.fail(key + " must be a nonempty array")
                foreach (item in value) if (typeof(item) != "string" || !item.len()) this.fail(key + " entries must be nonempty strings")
                if (key == "namespaces") foreach (item in value)
                    if (!regexp("^[A-Za-z_][A-Za-z0-9_]*-[0-9]+(\\.[0-9]+)*$").match(item)) this.fail("Invalid GI namespace: " + item)
            } else if (key == "download") {
                if (typeof(value) != "bool") this.fail("download must be a boolean")
            } else if (key == "min_sdk" || key == "version_code") {
                if (typeof(value) != "integer" || value < 1) this.fail(key + " must be a positive integer")
            } else if (typeof(value) != "string" || !value.len()) this.fail(key + " must be a nonempty string")
            if (key in opts.android_forced) continue
            if (key == "sdk_path" || key == "inspection_root" || key == "icon") opts.android[key] = this.manifest_path(directory, value)
            else opts.android[key] = value
        }
        if (opts.android.format != "apk" && opts.android.format != "aab") this.fail("Android format must be apk or aab")
        if (["package", "source"].find(opts.android.runtime) == null) this.fail("Android runtime must be package or source")
        if (!regexp("^[a-z0-9][a-z0-9.\\-]*$").match(opts.android.sdk)) this.fail("Invalid Android SDK release name")
        if (opts.android.module_set != "" && !regexp("^[a-z0-9][a-z0-9.+\\-]*$").match(opts.android.module_set)) this.fail("Invalid Android module release name")
        if (opts.android.min_sdk < 31) this.fail("The pinned GTK Android SDK requires min_sdk >= 31")
        if (opts.android.version_code > 2100000000) this.fail("Android version_code exceeds 2100000000")
        local abis = []
        foreach (abi in opts.android.architectures) {
            local normalized = this.android_abi(abi)
            if (abis.find(normalized) != null) this.fail("duplicate Android ABI: " + normalized)
            abis.push(normalized)
        }
        opts.android.architectures = abis
        current_error_path = null
    }
    function apply_entry_manifest(opts, directory, entry) {
        if (typeof(entry) == "table" && "android" in entry) {
            if (this.table_get(entry, "type", "sqgi") != "native") this.fail("entry.android requires entry.type native")
            AndroidEntry.validate(entry.android); opts.android_entry = clone entry.android
        }
        base.apply_entry_manifest(opts, directory, entry)
    }
    function apply_project_defaults(opts) {
        if (opts.platform != "") {
            if (["linux", "windows", "android"].find(opts.platform) == null) this.fail("--platform requires linux, windows or android")
            local target = opts.platform == "android" ? "android-" + opts.android.format : opts.platform == "windows" ? "windows" : "appimage"
            local matches = opts.platform == "android" ? this.is_android(opts) : opts.platform == "windows" ? opts.target == "windows" || this.starts_with(opts.target, "win-") : ["appimage", "appimage-all", "linux-sysroot"].find(opts.target) != null
            if (opts.target == "" || !opts.target_explicit && !matches) opts.target = target
            else if ((opts.platform == "android" && !this.is_android(opts)) ||
                     (opts.platform == "windows" && opts.target != "windows" && !this.starts_with(opts.target, "win-")) ||
                     (opts.platform == "linux" && ["appimage", "appimage-all", "linux-sysroot"].find(opts.target) == null))
                this.fail("--platform and --target select different platforms")
        }
        if (opts.architecture != "") {
            if (this.is_android(opts)) opts.android.architectures = [this.android_abi(opts.architecture)]
            else opts.appimage_arch = opts.architecture
        }
        base.apply_project_defaults(opts)
        opts.native_projects = this.order_native_projects(opts.native_projects)
        opts.windows.native_dependencies = this.order_native_projects(opts.windows.native_dependencies)
        opts.windows.native_projects = this.order_native_projects(opts.windows.native_projects, opts.windows.native_dependencies)
        if (this.is_android(opts)) {
            opts.android.format = opts.target == "android-aab" ? "aab" : "apk"
            // Android source packaging is the supported default. Explicit bytecode
            // requests remain errors until producer/consumer compatibility is tested.
            if (authored_manifest != null && this.table_get(authored_manifest, "compile_scripts", false))
                this.fail("Android bytecode packaging is not yet supported; use compile_scripts: false")
            opts.compile_scripts = false
            if (!opts.output_dir_forced) opts.output_dir = GLib.build_filenamev([opts.manifest_dir, "dist-android"])
            local output = this.abs_path(opts.output_dir)
            opts.android_source_excludes = [output, output + "-arm64-v8a", output + "-x86_64",
                GLib.build_filenamev([opts.manifest_dir, "sqgipkg.lock.json"])]
        }
    }
    function android_configurations(opts) {
        local result = []
        if (opts.target == "android-aab") {
            local config = clone opts
            config.android = clone opts.android
            config.android.abi <- opts.android.architectures.len() > 1 ? "multi" : opts.android.architectures[0]
            config.architecture = config.android.abi
            config.compile_scripts = false
            config.report = this.new_report()
            return [config]
        }
        foreach (abi in opts.android.architectures) {
            local config = clone opts
            config.android = clone opts.android
            config.android.abi <- abi
            config.architecture = abi
            config.compile_scripts = false
            config.report = this.new_report()
            if (opts.android.architectures.len() > 1) config.output_dir += "-" + abi
            result.push(config)
        }
        return result
    }
    function android_source_runtime(opts) {
        return opts.android_runtime_explicit ? opts.android.runtime == "source" : opts.runtime_recipe
    }
    function android_resolve_native_overrides(opts) {
        if (opts.android_overrides_applied) return
        if (!opts.android.native.len()) { opts.android_overrides_applied = true; return }
        local recipes = {}, authored = {}, result = [], additions = []
        foreach (project in opts.native_projects) recipes[project.name] <- project
        if (authored_manifest != null) foreach (field in ["native", "native_projects"]) {
            local values = this.table_get(authored_manifest, field, [])
            if (values == null) continue
            if (typeof(values) != "array") values = [values]
            foreach (item in values) {
                local recipe = clone item
                if (field == "native" && !("build_system" in recipe)) recipe.build_system <- "meson"
                local normalized = this.manifest_native_projects(opts.manifest_dir, [recipe])[0]
                authored[normalized.name] <- recipe
            }
        }
        foreach (index, override in opts.android.native) {
            current_error_path = ["platforms", "android", "native", index]
            local existing = override.name in recipes && override.name in authored
            // A complete platform recipe adds a module only to Android. A
            // name-only partial override must still identify a shared recipe.
            if (!existing && !("dir" in override) && !("repo" in override) && !("git" in override) && !("android_package" in override))
                this.fail("Unknown Android native override: " + override.name)
            local merged = existing ? clone authored[override.name] : { build_system = "meson" }
            if (!existing) additions.push(override.name)
            foreach (aliases in [["repo", "git"], ["ref", "tag", "commit"]]) {
                local count = 0
                foreach (key in aliases) if (key in override) count++
                if (count > 1) this.fail("Ambiguous Android native source override: " + override.name)
                if (count) foreach (key in aliases) if (key in merged) delete merged[key]
            }
            foreach (key, value in override) {
                if ((key == "options" || key == "gi") && typeof(value) == "table" && key in merged && typeof(merged[key]) == "table") {
                    local object = clone merged[key]
                    foreach (name, setting in value) object[name] <- setting
                    merged[key] = object
                } else merged[key] <- value
            }
            this.validate_manifest_schema(merged, "native_projects", "Android native recipe " + override.name, true, ["platforms", "android", "native", index])
            recipes[override.name] <- this.manifest_native_projects(opts.manifest_dir, [merged])[0]
        }
        foreach (project in opts.native_projects) result.push(recipes[project.name])
        foreach (name in additions) result.push(recipes[name])
        this.validate_recipe_names(result)
        opts.native_projects = this.order_native_projects(result)
        opts.android_overrides_applied = true
        current_error_path = null
    }
    function android_runtime_source_dir(opts) {
        return opts.sqgi_source.dir != "" ? opts.sqgi_source.dir : this.sqgi_source_checkout_dir(opts)
    }
    function android_runtime_configuration(opts) {
        return AndroidRuntime.configuration(opts.android.compiler, opts.android.compiler == "llvm" && opts.runtime_jit)
    }
    function validate_android(opts) {
        this.android_resolve_native_overrides(opts)
        current_error_path = ["platforms", "android"]
        if (["auto", "runtime", "sdk", "tools", "complete"].find(opts.android.profile) == null) this.fail("Unsupported Android SDK profile")
        if (opts.android.sdk_path != "" && opts.android.packages.len()) this.fail("Android packages require an Ooblerg SDK; sdk_path already selects a complete local SDK")
        if (["android-apk", "android-aab"].find(opts.target) == null) this.fail("unknown Android target: " + opts.target)
        if (this.host_windows()) this.fail("Android packaging currently requires an Ubuntu x86-64 build host")
        if (opts.entry_type == "native") {
            if (opts.android_entry == null) this.fail("Android native entry requires entry.android with project, library and symbol")
            AndroidEntry.validate(opts.android_entry)
            local found = false
            foreach (project in opts.native_projects) if (project.name == opts.android_entry.project) found = true
            if (!found) this.fail("entry.android.project must name a native recipe")
        }
        opts.android.runtime = this.android_source_runtime(opts) ? "source" : "package"
        current_error_path = ["platforms", "android", "compiler"]
        if (["none", "llvm"].find(opts.android.compiler) == null) this.fail("Android compiler must be none or llvm")
        if (opts.android.compiler == "llvm") {
            if (opts.android.runtime != "source") this.fail("Android compiler selection requires runtime.source or runtime.sqgi")
            if (opts.android.module_set != "") this.fail("Android compiler selection requires the unified package catalog")
            if (opts.android.packages.find(AndroidRuntime.COMPILER_PACKAGE) != null)
                this.fail("compiler-llvm18 is selected automatically by platforms.android.compiler")
            foreach (project in opts.native_projects) if (project.android_package == AndroidRuntime.COMPILER_PACKAGE)
                this.fail("compiler-llvm18 is selected automatically by platforms.android.compiler")
        }
        if (opts.android.runtime == "source") {
            current_error_path = ["runtime"]
            if (!opts.runtime_recipe) this.fail("Android runtime source requires runtime.source or runtime.sqgi")
            local requested = authored_manifest == null ? null : this.table_get(authored_manifest, "runtime")
            if (opts.android.compiler == "none" && requested != null && this.table_get(requested, "jit", false)) {
                current_error_path = ["runtime", "jit"]
                this.fail("Android runtime.jit true requires platforms.android.compiler llvm")
            }
        }
        if (opts.entry_type == "sqgi" && opts.script == "") this.fail("Android packaging requires an entry script")
        if (opts.app_id == "" || !regexp("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$").match(opts.app_id))
            this.fail("Android requires app_id such as org.example.myapp")
        this.scan_project_imports(opts)
        if (opts.report.used_gst && opts.android.namespaces.find("Gst-1.0") == null)
            opts.android.namespaces.push("Gst-1.0")
        if (["auto", "qemu", "adb"].find(opts.android.runner) == null) this.fail("Android GI runner must be auto, qemu or adb")
        if (["debug", "release"].find(opts.android.variant) == null) this.fail("Android variant must be debug or release")
        foreach (project in opts.native_projects) {
            if (project.gi != null && this.table_get(project.gi, "strategy", "auto") == "host")
                this.fail("Android requires gi.strategy auto or target; host metadata is not portable: " + project.name)
            if (project.android_package != "" && !regexp("^[A-Za-z0-9][A-Za-z0-9+_.\\-]*$").match(project.android_package))
                this.fail("Invalid Android native package name: " + project.android_package)
        }
        if (opts.android.sdk_path != "" && opts.android.packages.len())
            this.fail("Android packages require a repository SDK; use native.android_package for libraries with a local SDK")
        current_error_path = null
    }
    function validate_options(opts) {
        if (this.is_android(opts)) { this.validate_android(opts); return }
        if (opts.target == "all" && !opts.clean) {
            foreach (config in this.selected_configurations(opts)) this.validate_options(config)
            return
        }
        base.validate_options(opts)
    }
    function validate_doctor_options(opts) {
        if (this.is_android(opts)) { this.validate_android(opts); return }
        if (opts.target == "all") {
            foreach (config in this.selected_configurations(opts)) this.validate_doctor_options(config)
            return
        }
        base.validate_doctor_options(opts)
    }
    function doctor(opts) {
        if (!this.is_android(opts)) return base.doctor(opts)
        if (opts.android.abi == "multi") {
            local status = 0
            foreach (abi in opts.android.architectures) {
                local part = clone opts; part.android = clone opts.android; part.android.abi = abi
                if (this.doctor(part)) status = 1
            }
            return status
        }
        local errors = opts.script == "" ? 0 : this.doctor_script(0, opts, "entry script", opts.script), warnings = []
        if (this.android_source_runtime(opts)) {
            if (opts.sqgi_source.dir != "") errors = this.doctor_path(errors, "SQGI runtime source", opts.sqgi_source.dir + "/CMakeLists.txt")
            else warnings.push("Build will resolve SQGI runtime revision " + opts.sqgi_source.ref + "; check does not fetch sources")
        }
        foreach (path in opts.resources) errors = this.doctor_path(errors, "resource", path)
        if (this.android_icon(opts) != "") errors = this.doctor_path(errors, "Android application icon", this.android_icon(opts))
        foreach (spec in opts.files) errors = this.doctor_file_spec(errors, warnings, spec, "file", false)
        errors = this.doctor_projects(errors, warnings, opts.native_projects, "android_package")
        if (opts.android.sdk_path == "") warnings.push("Build will resolve Android SDK " + opts.android.sdk + " from " + opts.android.repository + "; check does not download packages")
        else {
            local root = opts.android.sdk_path
            if (!this.path_exists(root + "/sqgi-android-sdk.json")) root += "/" + opts.android.abi
            errors = this.doctor_path(errors, "Android SDK descriptor", root + "/sqgi-android-sdk.json")
            if (!errors) {
                try {
                    AndroidSdk.SDK(root, opts.android.abi, opts.android.min_sdk).validate()
                    AndroidToolchain.resolve({ ndk = opts.android.ndk, sdk = root,
                        native = opts.native_projects, native_build = this.android_source_runtime(opts),
                        application = { native_entry = opts.entry_type == "native" ? opts.android_entry : null } })
                } catch (error) {
                    this.diagnostic("error", error.tostring(), ["platforms", "android"], "android_backend")
                    errors++
                }
            }
        }
        foreach (warning in warnings) this.diagnostic("warning", warning, ["platforms", "android"], "preflight")
        if (!machine_output) print(errors ? "Android check failed\n" : "Android check passed\n")
        return errors ? 1 : 0
    }
    function resolved_plan(opts) {
        if (!this.is_android(opts)) return base.resolved_plan(opts)
        this.validate_android(opts)
        local native = []
        foreach (project in opts.native_projects) native.push({ name = project.name, dir = project.dir,
            build_system = project.android_package == "" ? project.build_system : "package",
            package = project.android_package, depends_on = project.depends_on, gi = project.gi,
            options = project.options, targets = project.targets, repo = project.repo, ref = project.ref, commands = [] })
        return { target = opts.target, architecture = opts.android.abi, name = opts.name,
            architectures = opts.target == "android-aab" ? opts.android.architectures : [opts.android.abi],
            entry = opts.entry_type == "native" ? opts.android_entry : opts.script, entry_type = opts.entry_type,
            output = this.abs_path(opts.output_dir), android = opts.android,
            runtime = { recipe = this.android_source_runtime(opts), package = this.android_source_runtime(opts) ? null : "sqgi",
                source = this.android_source_runtime(opts) ? this.android_runtime_source_dir(opts) : null,
                revision = this.android_source_runtime(opts) ? opts.sqgi_source.ref : null, commands = [],
                requested = this.android_source_runtime(opts) ? { jit = this.android_runtime_configuration(opts).jit,
                    kernels = this.android_runtime_configuration(opts).kernels } : null,
                verified_binary = null },
            generated_outputs = "Android native exports and dependency closure are verified during the build.",
            native = native, package_source = opts.android.sdk_path == "" ? "ooblerg" : "local-sdk",
            packages = opts.android.sdk_path == "" ? ["sqgi-android-" + this.android_sdk_profile(opts)].extend(opts.android.packages).extend(
                opts.android.compiler == "llvm" ? [AndroidRuntime.COMPILER_PACKAGE] : []) : [], build_packages = [], linux_suite = null, files = opts.files,
            scripts = opts.scripts, script_dirs = opts.script_dirs, resources = opts.resources,
            features = opts.features, discovery = opts.report }
    }
    function explain_one(opts) {
        if (!this.is_android(opts)) { base.explain_one(opts); return }
        print(sqgi.json.stringify(this.resolved_plan(opts)) + "\n")
    }
    function input_target(opts) {
        return this.is_android(opts) ? "android-" + opts.android.abi + "-" + opts.android.sdk : base.input_target(opts)
    }
    function android_sdk_profile(opts) {
        local required = opts.native_projects.len() || this.android_source_runtime(opts) ? "sdk" : "runtime"
        foreach (project in opts.native_projects) if (project.android_package == "") required = "tools"
        if (opts.android.profile == "auto") return required
        local profiles = ["runtime", "sdk", "tools", "complete"]
        if (profiles.find(opts.android.profile) < profiles.find(required)) this.fail("Android native/runtime recipes require at least the " + required + " SDK profile")
        return opts.android.profile
    }
    function android_icon(opts) { return opts.android.icon != "" ? opts.android.icon : opts.desktop_icon }
    function android_development_contract(opts) {
        local native = [], local_sdk = {}
        foreach (project in opts.native_projects) {
            local recipe = clone project
            // Source paths are host locations, not application ABI inputs.
            if ("dir" in recipe) delete recipe.dir
            local input = { recipe = recipe }
            if (project.android_package == "") {
                if (!AndroidCommon.is_dir(project.dir)) this.fail("Native sources are missing; fetch/build before syncing: " + project.name)
                input.source <- AndroidSource.source_provenance(project, project.dir, opts.android_source_excludes).sha256
            }
            native.push(input)
        }
        if (opts.android.sdk_path != "") {
            foreach (abi in ["x86_64", "arm64-v8a"]) {
                local path = opts.android.sdk_path + "/" + abi + "/sqgi-android-sdk.json"
                if (AndroidCommon.is_file(path)) local_sdk[abi] <- AndroidCommon.file_hash(path)
            }
            local direct = opts.android.sdk_path + "/sqgi-android-sdk.json"
            if (AndroidCommon.is_file(direct)) local_sdk.direct <- AndroidCommon.file_hash(direct)
            if (!local_sdk.len()) this.fail("Local Android SDK has no descriptor; rebuild/deploy with a valid SDK")
        }
        local result = { schema = 1, native = native, sdk = opts.android.sdk, local_sdk = local_sdk,
            repository = opts.android.repository, module_set = opts.android.module_set,
            runtime = opts.android.runtime, variant = opts.android.variant, profile = opts.android.profile, packages = opts.android.packages,
            permissions = AndroidResources.permissions(opts.android.permissions),
            icon_sha256 = this.android_icon(opts) == "" ? null : AndroidCommon.file_hash(this.android_icon(opts)) }
        if (this.android_source_runtime(opts)) {
            local source = this.android_runtime_source_dir(opts)
            if (!AndroidCommon.is_dir(source)) this.fail("SQGI runtime sources are missing; build/deploy before syncing: " + source)
            result.runtime_source <- AndroidRuntime.identity(source, this.android_runtime_configuration(opts)).sha256
        }
        if (opts.entry_type == "native") result.native_entry_header <- AndroidCommon.file_hash(AndroidEntry.directory + "/sqgi_android_entry.h")
        return result
    }
    function android_stage_application(opts, destination) {
        local scripts = {}, entry = this.stage_app_scripts(opts, destination, scripts)
        this.stage_extra_files(opts, destination, scripts)
        local root = this.app_script_root_rel(opts), source = destination + "/" + root
        if (opts.entry_type == "native") {
            AndroidCommon.mkdir(source)
            if (AndroidCommon.exists(source + "/sqgipkg-native-entry.txt")) this.fail("Reserved native entry asset name")
            AndroidCommon.write(source + "/sqgipkg-native-entry.txt", "SQGI Android native entry ABI 1\n")
        }
        foreach (path in AndroidCommon.walk(destination))
            if (!AndroidCommon.within(path, source)) this.fail("Android file destination must be under " + root + ": " + path.slice(destination.len() + 1))
        local config = { schema = 1, application_id = opts.app_id, name = opts.name,
            version_code = opts.android.version_code, version_name = opts.android.version_name,
            min_sdk = opts.android.min_sdk, source_dir = "source", entry = entry == null ? "" : entry.slice(root.len() + 1),
            namespaces = opts.android.namespaces, development = this.android_development_contract(opts) }
        config.permissions <- config.development.permissions; config.icon_sha256 <- config.development.icon_sha256
        if (opts.entry_type == "native") { config.native_entry <- clone opts.android_entry; config.native_entry.abi_version <- 1 }
        return { source = source, project = config }
    }
    function android_request(request, job) {
        if (["resolve-sdk", "bundle", "build", "prepare"].find(request.operation) == null) this.fail("Unknown Android backend operation: " + request.operation)
        local input = job + "/" + request.operation + ".json", output = input + ".result"
        this.write_file(input, sqgi.json.stringify(request))
        local result = request.operation == "resolve-sdk" ? AndroidPackages.resolve(request) :
            request.operation == "bundle" ? AndroidAssembly.build_bundle(request) : AndroidAssembly.build(request)
        result.protocol_version <- 1; result.ok <- true; result.diagnostics <- []
        this.write_file(output, sqgi.json.stringify(result) + "\n")
        return result
    }
    function build_android(opts) {
        if (opts.target == "android-aab") return this.build_android_bundle(opts)
        return this.build_android_abi(opts)
    }
    function build_android_bundle(opts) {
        this.validate_android(opts)
        local work = GLib.build_filenamev([opts.manifest_dir, ".sqgipkg", "android", "bundle"])
        local job = work + "/jobs/" + GLib.uuid_string_random()
        this.mkdir_p(job)
        local inputs = [], evidence = {}
        foreach (abi in opts.android.architectures) {
            local part = clone opts
            part.android = clone opts.android; part.android.abi = abi
            part.architecture = abi; part.report = this.new_report()
            part.output_dir = job + "/" + abi
            local result = this.build_android_abi(part, true)
            inputs.push({ abi = abi, prepared = result.prepared, prepared_sha256 = result.prepared_sha256 })
            evidence[abi] <- result.inputs
        }
        local artifact = GLib.build_filenamev([this.abs_path(opts.output_dir), opts.app_id + "-" + opts.android.abi + "-" + opts.android.variant + ".aab"])
        this.begin_build_output(artifact)
        this.report_build_progress(opts, "packaging")
        local result = this.android_request({ protocol_version = 1, operation = "bundle", inputs = inputs,
            work = work, artifact = artifact, ndk = opts.android.ndk, offline = !opts.android.download,
            variant = opts.android.variant }, job)
        this.mkdir_p(opts.output_dir)
        this.write_file(opts.output_dir + "/sqgipkg-build.json", sqgi.json.stringify({ target = "android-aab",
            artifact = artifact, artifact_sha256 = result.sha256, architectures = opts.android.architectures,
            inputs_by_abi = evidence, splits = result.splits, verification = result.verification,
            variant = result.variant, signer_sha256 = result.signer_sha256 }) + "\n")
        this.report_build_artifact(opts, artifact, opts.target)
        this.info("wrote " + artifact)
        return result
    }
    function build_android_abi(opts, prepare_only = false) {
        this.validate_android(opts)
        if (authored_manifest != null && this.table_get(authored_manifest, "compile_scripts", false))
            this.fail("Android bytecode packaging is not yet supported; use compile_scripts: false")
        if (opts.libraries.len() || opts.typelibs.len())
            this.fail("Declare Android application libraries and typelibs in a native recipe")
        this.begin_inputs(opts)
        if (this.android_icon(opts) != "")
            this.record_input("android-icon", { sha256 = AndroidCommon.file_hash(this.android_icon(opts)) })
        local runtime_source = null
        if (this.android_source_runtime(opts)) {
            local source = this.ensure_sqgi_source(opts)
            if (opts.sqgi_source.ref != "") {
                local actual = strip(AndroidCommon.process(["git", "-C", source, "rev-parse", "HEAD"]))
                local wanted = strip(AndroidCommon.process(["git", "-C", source, "rev-parse", opts.sqgi_source.ref + "^{commit}"]))
                if (actual != wanted) this.fail("SQGI runtime source checkout does not match runtime.sqgi")
            }
            opts.sqgi_source = clone opts.sqgi_source; opts.sqgi_source.dir = source
            local configuration = this.android_runtime_configuration(opts)
            runtime_source = { directory = source, identity = AndroidRuntime.identity(source, configuration),
                configuration = configuration, revision = opts.sqgi_source.ref }
            this.record_input("android-runtime-source", { sha256 = runtime_source.identity.sha256, source = runtime_source.identity,
                requested_revision = runtime_source.revision })
        }
        foreach (project in opts.native_projects) if (project.android_package == "") {
            this.ensure_git_native_project(project, "native project " + project.name)
            local identity = AndroidSource.source_provenance(project, AndroidCommon.resolve_path(project.dir), opts.android_source_excludes)
            this.record_input("android-native:" + project.name, identity)
        }
        local work = GLib.build_filenamev([opts.manifest_dir, ".sqgipkg", "android", opts.android.abi])
        local job = work + "/jobs/" + GLib.uuid_string_random()
        this.mkdir_p(job)
        local sdk = opts.android.sdk_path, catalog_lock = null, module_packages = []
        if (sdk == "") {
            local request = { protocol_version = 1, operation = "resolve-sdk", abi = opts.android.abi,
                sdk_id = opts.android.sdk, min_api = opts.android.min_sdk, profile = this.android_sdk_profile(opts), packages = opts.android.packages,
                module_set = opts.android.module_set,
                repository = opts.android.repository, download = opts.android.download, refresh = opts.android.refresh,
                cache = GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "ooblerg"]),
                root = job + "/sdk", locked = null }
            if (this.locked_inputs != null) {
                if (!("android-catalog" in this.locked_inputs)) this.fail("lockfile has no Android catalog")
                request.locked = this.locked_inputs["android-catalog"]
            }
            request.native_packages <- []
            if (opts.android.compiler == "llvm") request.native_packages.push(AndroidRuntime.COMPILER_PACKAGE)
            foreach (project in opts.native_projects) if (project.android_package != "") request.native_packages.push(project.android_package)
            local result = this.android_request(request, job)
            catalog_lock = result.lock
            module_packages = result.module_packages
            sdk = result.sdk
            this.record_input("android-catalog", result.lock)
        } else if (!this.path_exists(sdk + "/sqgi-android-sdk.json")) sdk += "/" + opts.android.abi
        this.record_input("android-sdk", { sha256 = this.file_sha256(sdk + "/sqgi-android-sdk.json") })
        local staged = job + "/payload"
        this.mkdir_p(staged)
        local application = this.android_stage_application(opts, staged)
        local artifact = GLib.build_filenamev([this.abs_path(opts.output_dir), opts.app_id + "-" + opts.android.abi + "-" + opts.android.variant + "." + opts.android.format])
        local config = application.project
        // Resolve the SDK first: current prebuilt wrappers need no NDK. A legacy
        // SDK or authored native sources still identify their compiler in locks.
        this.record_input("android-host-tools", AndroidToolchain.identity({ ndk = opts.android.ndk, sdk = sdk,
            application = config, offline = !opts.android.download, native = opts.native_projects, runtime_source = runtime_source }))
        local request = { protocol_version = 1, operation = prepare_only ? "prepare" : "build", abi = opts.android.abi,
            sdk = sdk, ndk = opts.android.ndk, work = work, source = application.source,
            native = opts.native_projects, runner = opts.android.runner, serial = opts.android.serial,
            source_excludes = opts.android_source_excludes,
            inspection_root = opts.android.inspection_root,
            sdk_id = opts.android.sdk, module_set = opts.android.module_set, repository = opts.android.repository,
            catalog_lock = catalog_lock, module_packages = module_packages,
            refresh = opts.android.refresh, cache = GLib.build_filenamev([GLib.get_user_cache_dir(), "sqgipkg", "ooblerg"]),
            application = config, format = opts.android.format, artifact = artifact, variant = opts.android.variant,
            runtime_source = runtime_source, icon = this.android_icon(opts),
            offline = !opts.android.download,
            host_tools = this.active_inputs["android-host-tools"],
            sdk_sha256 = this.active_inputs["android-sdk"].sha256 }
        request.native_inputs <- {}
        foreach (project in opts.native_projects) if (project.android_package == "")
            request.native_inputs[project.name] <- this.active_inputs["android-native:" + project.name]
        if (prepare_only) request.prepared <- job + "/input"
        else this.begin_build_output(artifact)
        this.report_build_progress(opts, prepare_only ? "preparing" : "packaging")
        local has_native = opts.native_projects.len() || module_packages.len()
        if (this.locked_inputs != null && opts.android.compiler == "llvm") {
            if (!("android-runtime-compiler" in this.locked_inputs)) this.fail("lockfile has no Android runtime compiler input")
            request.runtime_modules_lock <- this.locked_inputs["android-runtime-compiler"]
        }
        if (this.locked_inputs != null && has_native) {
            if (!("android-inspection" in this.locked_inputs)) this.fail("lockfile has no Android inspection input")
            request.inspection_sha256 <- this.locked_inputs["android-inspection"].sha256
            local prebuilt = module_packages.len() != 0
            foreach (project in opts.native_projects) if (project.android_package != "") prebuilt = true
            if (prebuilt) {
                if (!("android-modules" in this.locked_inputs)) this.fail("lockfile has no Android module catalog input")
                request.modules_lock <- this.locked_inputs["android-modules"]
            }
        }
        local result = this.android_request(request, job)
        if (opts.android.compiler == "llvm") this.record_input("android-runtime-compiler", result.runtime_build.compiler.modules.modules_lock)
        if (has_native) this.record_input("android-inspection", { sha256 = result.native.inspection_sha256 })
        if (has_native && result.native.modules_lock != null) this.record_input("android-modules", result.native.modules_lock)
        this.mkdir_p(opts.output_dir)
        this.finish_inputs(opts, prepare_only ? result.prepared : artifact)
        if (!prepare_only) {
            local path = opts.output_dir + "/sqgipkg-build.json", report = sqgi.json.parse(this.read_file(path))
            report.variant <- result.variant; report.signer_sha256 <- result.signer_sha256
            this.write_file(path, sqgi.json.stringify(report) + "\n")
        }
        result.inputs <- this.active_inputs
        if (!prepare_only) {
            this.report_build_artifact(opts, artifact, opts.target)
            this.info("wrote " + artifact)
        }
        return result
    }
}
return { SqgiPkgAndroid = SqgiPkgAndroid }
