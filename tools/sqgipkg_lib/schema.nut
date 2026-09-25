local Base = import("options.nut")

class SqgiPkgSchema extends Base.SqgiPkgOptions {
    function schema_fields() {
        return {
            manifest = ["$schema","app_id", "appimage_arch", "appimagetool", "appimagetool_cache", "build_dir", "compile_scripts", "desktop_categories", "desktop_icon", "desktop_terminal", "entry", "files", "gdk_backend", "gdk_pixbuf_loaders", "gio_modules", "gsettings_schemas", "gstreamer_plugins", "gtk_data", "gtk_font_name", "gtk_icon_theme", "gtk_prefer_dark", "gtk_theme", "icon", "includes", "keep_appdir", "libraries", "linux", "linux_arches", "name", "native_projects", "output", "refresh_appimagetool", "resources", "script", "script_dirs", "scripts", "sqgi_source", "target", "typelibs", "windows", "schema_version", "runtime", "features", "native", "platforms"],
            linux = ["arches", "build", "copy_dependencies", "deb", "deb_download", "deb_package_cache", "deb_packages", "deb_refresh", "deb_suite", "deb_sysroot_cache", "download_packages", "library_dirs", "package_cache", "packages", "refresh_packages", "suite", "sysroot", "sysroot_cache"],
            windows = ["auto_packages", "build", "build_dependencies", "build_dir", "build_packages", "cmake_toolchain", "console", "download_packages", "files", "fonts", "gdk_backend", "gtk_font_name", "gtk_icon_theme", "gtk_prefer_dark", "gtk_theme", "libraries", "meson_cross_file", "msys2_prefix", "msys2_root", "native_dependencies", "native_projects", "nsis", "nsis_options", "package_cache", "packages", "refresh_packages", "repo_url", "typelibs"],
            sqgi_source = ["branch", "cache", "cache_dir", "commit", "dir", "git", "path", "ref", "repo", "shallow", "submodules", "tag", "update"],
            entry = ["linux", "path", "script", "type", "windows"],
            nsis_options = ["autostart", "desktop_shortcut", "header_image", "icon", "install_dir", "installer_name", "license", "request_execution_level", "start_menu_folder", "start_menu_shortcut", "uninstall_registry", "welcome_finish_image", "welcome_image"],
            native_projects = ["branch", "build", "commit", "dir", "files", "git", "install", "libraries", "name", "ref", "repo", "shallow", "stage", "submodules", "tag", "typelibs", "update", "build_system", "options", "gi", "targets"],
            arches = ["appimage_arch", "arch", "build", "build_dir", "cmake_toolchain", "copy_dependencies", "deb", "deb_download", "deb_package_cache", "deb_packages", "deb_refresh", "deb_suite", "deb_sysroot_cache", "download_packages", "entry_linux", "files", "gdk_pixbuf_loaders", "gio_modules", "gsettings_schemas", "gstreamer_plugins", "gtk_data", "inherit_native_projects", "libraries", "library_dirs", "meson_cross_file", "native_projects", "output", "package_arch", "package_cache", "packages", "refresh_packages", "resources", "suite", "sysroot", "sysroot_cache", "typelibs"],
            deb = ["download", "package_cache", "packages", "refresh", "suite", "sysroot_cache"],
            files = ["path", "src", "dest", "from", "dir", "to", "include", "includes", "glob", "globs", "exclude", "excludes", "match", "regex", "optional"],
            fonts = ["path", "registry_name", "name"],
            gi = ["strategy", "namespace", "version", "library"],
            runtime = ["sqgi", "source", "jit"],
            platforms = ["linux", "windows"],
            platform_linux = ["architectures", "baseline"],
            platform_windows = ["architectures", "format"]
        }
    }

    function apply_recipe_manifest(opts, manifest, base_dir) {
        local runtime = this.table_get(manifest, "runtime")
        if (runtime != null) {
            local ref = this.table_get(runtime, "sqgi")
            if (typeof(ref) != "string" || ref == "") this.fail("runtime.sqgi requires a version, tag or commit")
            opts.runtime_recipe = true
            if (opts.sqgi_source.ref == "") opts.sqgi_source.ref = ref
            opts.runtime_jit = this.table_get(runtime, "jit", true)
            local source = this.table_get(runtime, "source")
            if (source != null && opts.sqgi_source.dir == "") opts.sqgi_source.dir = this.manifest_path(base_dir, source)
        }
        local features = this.table_get(manifest, "features", [])
        if (typeof(features) != "array") this.fail("features must be an array")
        foreach (feature in features) {
            if (!this.array_contains(["gtk4", "gstreamer", "gdk-pixbuf", "soup3"], feature)) this.fail("unknown feature: " + feature)
            opts.features.push(feature)
        }
        if (features.len() > 0 && opts.linux.deb.download_forced == null) {
            opts.linux.deb.download = true
            if (opts.linux.deb.suite == "") opts.linux.deb.suite = "noble"
        }
        if (this.array_contains(features, "gtk4") && !opts.desktop_terminal_forced) opts.desktop_terminal = false
        local native = this.table_get(manifest, "native", [])
        if (typeof(native) != "array") this.fail("native must be an array")
        foreach (project in native) {
            local recipe = clone project
            if (!("build_system" in recipe)) recipe.build_system <- "meson"
            this.append_values(opts.native_projects, this.manifest_native_projects(base_dir, [recipe]))
            this.append_values(opts.windows.native_projects, this.manifest_native_projects(base_dir, [recipe]))
        }
        local platforms = this.table_get(manifest, "platforms", {})
        if ("linux" in platforms) {
            local linux = platforms.linux
            if ("architectures" in linux) this.append_values(opts.linux.arches, this.manifest_linux_arches(base_dir, linux.architectures))
            if ("baseline" in linux) {
                local suites = { "ubuntu-22.04": "jammy", "ubuntu-24.04": "noble" }
                if (!(linux.baseline in suites)) this.fail("unknown Linux baseline: " + linux.baseline)
                if (!opts.linux.deb.suite_forced) opts.linux.deb.suite = suites[linux.baseline]
                if (opts.linux.deb.download_forced == null) opts.linux.deb.download = true
            }
        }
        if ("windows" in platforms) {
            local windows = platforms.windows
            if ("architectures" in windows && (typeof(windows.architectures) != "array" || windows.architectures.len() != 1 || windows.architectures[0] != "x86_64"))
                this.fail("Windows packaging currently supports architectures: [x86_64]")
            if ("format" in windows && windows.format != "installer" && windows.format != "directory")
                this.fail("platforms.windows.format must be installer or directory")
            opts.windows_format = this.table_get(windows, "format", "installer")
        }
    }

    function validate_manifest_schema(value, kind = "manifest", path = "manifest", strict = false, key_path = null) {
        if (key_path == null) key_path = this.schema_json_path(path)
        current_error_path = clone key_path
        if (typeof(value) != "table") this.fail(path + " must be an object")
        local fields = this.schema_fields()
        if (kind == "manifest") {
            local version = this.table_get(value, "schema_version", 1)
            if (typeof(version) != "integer" || (version != 1 && version != 2)) this.fail("manifest.schema_version must be 1 or 2")
            strict = version == 2
        }
        foreach (key, item in value) {
            local label = path + "." + key
            local field_path = clone key_path; field_path.push(key)
            current_error_path = field_path
            if (!this.array_contains(fields[kind], key)) {
                if (strict) this.fail("unknown field: " + label)
                this.diagnostic("warning", "unknown field: " + label + " (ignored)", current_error_path, "unknown_field")
                continue
            }
            if (item == null) continue
            if (key == "build_system" && item != "meson" && item != "cmake") this.fail(label + " must be meson or cmake")
            if (key == "strategy" && item != "host") this.fail(label + " must be host")
            if (key == "gi") {
                if (typeof(item) != "table") this.fail(label + " must be an object")
                foreach (field in ["namespace", "version", "library"])
                    if (!(field in item) || typeof(item[field]) != "string" || item[field] == "") this.fail(label + "." + field + " must be a nonempty string")
            }
            if (key == "options") {
                if (typeof(item) != "table") this.fail(label + " must be an object")
                foreach (option, setting in item)
                    if (!this.array_contains(["string", "integer", "float", "bool"], typeof(setting))) this.fail(label + "." + option + " must be scalar")
            }
            if (this.array_contains(["features", "architectures", "targets"], key)) {
                if (typeof(item) != "array") this.fail(label + " must be an array")
                foreach (entry in item) if (typeof(entry) != "string") this.fail(label + " entries must be strings")
            }
            if (key == "build" || key == "install") {
                local commands = typeof(item) == "array" ? item : [item]
                foreach (command in commands) {
                    if (typeof(command) == "string") continue
                    if (typeof(command) != "table" || !("argv" in command) || typeof(command.argv) != "array" || command.argv.len() == 0)
                        this.fail(label + " commands must be shell strings or objects with nonempty argv")
                    foreach (arg in command.argv) if (typeof(arg) != "string") this.fail(label + " argv entries must be strings")
                    if ("env" in command) {
                        if (typeof(command.env) != "table") this.fail(label + " env must be an object")
                        foreach (key, value in command.env) if (typeof(value) != "string") this.fail(label + " env values must be strings")
                    }
                    foreach (key, value in command) if (key != "argv" && key != "env") this.fail(label + " unknown command field: " + key)
                }
            }
            local child = key
            if (kind == "platforms") child = "platform_" + key
            if (key == "native" || key == "native_dependencies") child = "native_projects"
            if (key == "linux_arches") child = "arches"
            local nested = (kind == "manifest" && this.array_contains(["linux", "windows", "entry", "sqgi_source", "native_projects", "native", "linux_arches", "runtime", "platforms"], key)) ||
                (kind == "linux" && (key == "deb" || key == "arches")) ||
                (kind == "windows" && this.array_contains(["native_projects", "native_dependencies", "build_dependencies", "nsis_options"], key)) ||
                (kind == "arches" && (key == "deb" || key == "native_projects")) || (kind == "native_projects" && key == "gi") || kind == "platforms"
            if (key == "build_dependencies") child = "native_projects"
            if (key == "files" || key == "fonts") nested = true
            if (nested && child in fields) {
                if ((child == "entry" || child == "sqgi_source") && typeof(item) == "string") continue
                if (child == "native_projects" || child == "arches" || child == "files" || child == "fonts") {
                    local entries = typeof(item) == "array" ? item : [item]
                    foreach (i, entry in entries) {
                        if ((child == "arches" || child == "files" || child == "fonts") && typeof(entry) == "string") continue
                        local child_path = clone field_path; child_path.push(i)
                        this.validate_manifest_schema(entry, child, label + "[" + i + "]", strict, child_path)
                    }
                } else this.validate_manifest_schema(item, child, label, strict, field_path)
            }
            current_error_path = field_path
            if (this.array_contains(["compile_scripts", "keep_appdir", "desktop_terminal", "download", "update",
                    "shallow", "submodules", "stage", "console", "auto_packages", "download_packages",
                    "refresh_packages", "copy_dependencies", "inherit_native_projects", "jit"], key) && typeof(item) != "bool")
                this.fail(label + " must be a boolean")
            if (this.array_contains(["name", "app_id", "target", "script", "build_dir", "output", "dir", "repo",
                    "ref", "branch", "suite", "msys2_prefix", "build_system", "baseline", "format"], key) && typeof(item) != "string")
                this.fail(label + " must be a string")
        }
        current_error_path = null
    }
}
return { SqgiPkgSchema = SqgiPkgSchema }
