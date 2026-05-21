local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("options.nut")

class SqgiPkgManifest extends Base.SqgiPkgOptions {
    function apply_default_manifest(opts) {
        if (opts.manifest != "") return
        if (this.path_exists("sqgipkg.json")) opts.manifest = "sqgipkg.json"
    }

    function apply_project_defaults(opts) {
        local project_dir = opts.manifest_dir == "" ? GLib.get_current_dir() : opts.manifest_dir

        if (opts.entry_type == "sqgi" && opts.script == "") {
            local main_script = GLib.build_filenamev([project_dir, "main.nut"])
            if (this.path_exists(main_script)) opts.script = main_script
        }

        if (opts.name == "") opts.name = this.basename(project_dir)
        if (opts.target == "") opts.target = "appimage"
        opts.appimage_arch = this.normalize_appimage_arch(opts.appimage_arch)
    }

    function apply_manifest(opts) {
        if (opts.manifest == "") return

        local manifest_path = this.abs_path(opts.manifest)
        if (!this.path_exists(manifest_path)) this.fail("manifest not found: " + opts.manifest)

        local manifest = sqgi.json.parse(this.read_file(manifest_path))
        local base_dir = this.dirname(manifest_path)
        opts.manifest_dir = base_dir

        local entry = this.table_get(manifest, "entry")
        local script = this.table_get(manifest, "script")
        local name = this.table_get(manifest, "name")
        local target = this.table_get(manifest, "target")
        local build_dir = this.table_get(manifest, "build_dir")
        local output_dir = this.table_get(manifest, "output")
        local appimagetool = this.table_get(manifest, "appimagetool")
        local appimagetool_cache = this.table_get(manifest, "appimagetool_cache")
        local sqgi_source = this.table_get(manifest, "sqgi_source")
        local refresh_appimagetool = this.table_get(manifest, "refresh_appimagetool")
        local appimage_arch = this.table_get(manifest, "appimage_arch")
        local keep_appdir = this.table_get(manifest, "keep_appdir")
        local compile_scripts = this.table_get(manifest, "compile_scripts")
        local gtk_theme = this.table_get(manifest, "gtk_theme")
        local gtk_icon_theme = this.table_get(manifest, "gtk_icon_theme")
        local gtk_font_name = this.table_get(manifest, "gtk_font_name")
        local gtk_prefer_dark = this.table_get(manifest, "gtk_prefer_dark")
        local gdk_backend = this.table_get(manifest, "gdk_backend")
        local linux = this.table_get(manifest, "linux")
        local linux_arches = this.table_get(manifest, "linux_arches")
        local windows = this.table_get(manifest, "windows")

        if (entry != null) this.apply_entry_manifest(opts, base_dir, entry)
        if (opts.script == "" && script != null) opts.script = this.manifest_path(base_dir, script)
        if (opts.name == "" && name != null) opts.name = name
        if (opts.target == "" && target != null) opts.target = target
        if (opts.build_dir == "build" && build_dir != null) opts.build_dir = this.manifest_path(base_dir, build_dir)
        if (opts.output_dir == "dist" && output_dir != null) opts.output_dir = this.manifest_path(base_dir, output_dir)
        if (opts.appimagetool == "appimagetool" && appimagetool != null) opts.appimagetool = this.manifest_path(base_dir, appimagetool)
        if (opts.appimagetool_cache == this.default_appimagetool_cache_dir() && appimagetool_cache != null)
            opts.appimagetool_cache = this.manifest_path(base_dir, appimagetool_cache)
        if (sqgi_source != null) this.apply_sqgi_source_manifest(opts, base_dir, sqgi_source)
        if (!opts.refresh_appimagetool && refresh_appimagetool != null) opts.refresh_appimagetool = refresh_appimagetool
        if (opts.appimage_arch == "" && appimage_arch != null) opts.appimage_arch = appimage_arch
        if (!opts.keep_appdir && keep_appdir != null) opts.keep_appdir = keep_appdir
        if (compile_scripts != null) opts.compile_scripts = compile_scripts
        if (gtk_theme != null) opts.gtk_theme = gtk_theme
        if (gtk_icon_theme != null) opts.gtk_icon_theme = gtk_icon_theme
        if (gtk_font_name != null) opts.gtk_font_name = gtk_font_name
        if (gtk_prefer_dark != null) opts.gtk_prefer_dark = gtk_prefer_dark
        if (gdk_backend != null) opts.gdk_backend = gdk_backend

        this.append_values(opts.scripts, this.manifest_includes(base_dir, this.table_get(manifest, "scripts")))
        this.append_values(opts.script_dirs, this.manifest_paths(base_dir, this.table_get(manifest, "script_dirs")))
        this.append_values(opts.files, this.manifest_files(base_dir, this.table_get(manifest, "files")))
        this.append_values(opts.libraries, this.manifest_paths(base_dir, this.table_get(manifest, "libraries")))
        this.append_values(opts.native_projects, this.manifest_native_projects(base_dir, this.table_get(manifest, "native_projects")))
        this.append_values(opts.includes, this.manifest_includes(base_dir, this.table_get(manifest, "includes")))
        this.append_values(opts.resources, this.manifest_paths(base_dir, this.table_get(manifest, "resources")))
        this.append_values(opts.gstreamer_plugins, this.manifest_paths(base_dir, this.table_get(manifest, "gstreamer_plugins")))
        this.append_values(opts.typelibs, this.manifest_paths(base_dir, this.table_get(manifest, "typelibs")))
        this.append_values(opts.gsettings_schemas, this.manifest_paths(base_dir, this.table_get(manifest, "gsettings_schemas")))
        this.append_values(opts.gtk_data, this.manifest_paths(base_dir, this.table_get(manifest, "gtk_data")))
        this.append_values(opts.gio_modules, this.manifest_paths(base_dir, this.table_get(manifest, "gio_modules")))
        this.append_values(opts.gdk_pixbuf_loaders, this.manifest_paths(base_dir, this.table_get(manifest, "gdk_pixbuf_loaders")))

        if (linux != null) this.apply_linux_manifest(opts, base_dir, linux)
        this.append_values(opts.linux.arches, this.manifest_linux_arches(base_dir, linux_arches))
        if (windows != null) this.apply_windows_manifest(opts, base_dir, windows)
    }

    function apply_sqgi_source_manifest(opts, base_dir, value) {
        if (typeof(value) == "string") {
            opts.sqgi_source.dir = this.manifest_path(base_dir, value)
            return
        }

        if (typeof(value) != "table") this.fail("manifest sqgi_source entry must be a string or object")

        local dir = this.table_get(value, "dir")
        if (dir == null) dir = this.table_get(value, "path")
        local repo = this.table_get(value, "repo")
        if (repo == null) repo = this.table_get(value, "git")
        local branch = this.table_get(value, "branch")
        local tag = this.table_get(value, "tag")
        local ref = this.table_get(value, "ref")
        local commit = this.table_get(value, "commit")
        local cache = this.table_get(value, "cache")
        if (cache == null) cache = this.table_get(value, "cache_dir")
        local update = this.table_get(value, "update")
        local shallow = this.table_get(value, "shallow")
        local submodules = this.table_get(value, "submodules")

        if (ref == null && tag != null) ref = tag
        if (ref == null && commit != null) ref = commit

        if (dir != null) opts.sqgi_source.dir = this.manifest_path(base_dir, dir)
        if (repo != null) opts.sqgi_source.repo = repo
        if (branch != null) opts.sqgi_source.branch = branch
        if (ref != null) opts.sqgi_source.ref = ref
        if (cache != null) opts.sqgi_source.cache = this.manifest_path(base_dir, cache)
        if (update != null) opts.sqgi_source.update = update
        if (shallow != null) opts.sqgi_source.shallow = shallow
        if (submodules != null) opts.sqgi_source.submodules = submodules
    }

    function apply_linux_manifest(opts, base_dir, linux) {
        if (typeof(linux) != "table") this.fail("manifest linux entry must be an object")

        local build = this.table_get(linux, "build")
        local sysroot = this.table_get(linux, "sysroot")
        local deb = this.table_get(linux, "deb")
        local package_cache = this.table_get(linux, "deb_package_cache")
        if (package_cache == null) package_cache = this.table_get(linux, "package_cache")
        local sysroot_cache = this.table_get(linux, "deb_sysroot_cache")
        if (sysroot_cache == null) sysroot_cache = this.table_get(linux, "sysroot_cache")
        local download_packages = this.table_get(linux, "deb_download")
        if (download_packages == null) download_packages = this.table_get(linux, "download_packages")
        local refresh_packages = this.table_get(linux, "deb_refresh")
        if (refresh_packages == null) refresh_packages = this.table_get(linux, "refresh_packages")
        local copy_dependencies = this.table_get(linux, "copy_dependencies")
        local packages = this.table_get(linux, "deb_packages")
        if (packages == null) packages = this.table_get(linux, "packages")
        local library_dirs = this.table_get(linux, "library_dirs")
        local arches = this.table_get(linux, "arches")

        if (deb != null) {
            if (typeof(deb) != "table") this.fail("manifest linux.deb entry must be an object")
            if (package_cache == null) package_cache = this.table_get(deb, "package_cache")
            if (sysroot_cache == null) sysroot_cache = this.table_get(deb, "sysroot_cache")
            if (download_packages == null) download_packages = this.table_get(deb, "download")
            if (refresh_packages == null) refresh_packages = this.table_get(deb, "refresh")
            this.append_values(opts.linux.deb.packages, this.manifest_string_list(this.table_get(deb, "packages")))
        }

        this.append_values(opts.linux.build, this.manifest_command_list(build))
        if (opts.linux.sysroot == "" && sysroot != null)
            opts.linux.sysroot = this.manifest_path(base_dir, sysroot)
        if (opts.linux.deb.package_cache == "" && package_cache != null)
            opts.linux.deb.package_cache = this.manifest_path(base_dir, package_cache)
        if (opts.linux.deb.sysroot_cache == "" && sysroot_cache != null)
            opts.linux.deb.sysroot_cache = this.manifest_path(base_dir, sysroot_cache)
        if (download_packages != null && opts.linux.deb.download_forced == null)
            opts.linux.deb.download = download_packages
        if (!opts.linux.deb.refresh && refresh_packages != null)
            opts.linux.deb.refresh = refresh_packages
        if (copy_dependencies != null) opts.linux.copy_dependencies = copy_dependencies
        this.append_values(opts.linux.deb.packages, this.manifest_string_list(packages))
        this.append_values(opts.linux.library_dirs, this.manifest_paths(base_dir, library_dirs))
        this.append_values(opts.linux.arches, this.manifest_linux_arches(base_dir, arches))
    }

    function apply_windows_manifest(opts, base_dir, windows) {
        if (typeof(windows) != "table") this.fail("manifest windows entry must be an object")

        local build_dir = this.table_get(windows, "build_dir")
        local build = this.table_get(windows, "build")
        local msys2_root = this.table_get(windows, "msys2_root")
        local msys2_prefix = this.table_get(windows, "msys2_prefix")
        local repo_url = this.table_get(windows, "repo_url")
        local package_cache = this.table_get(windows, "package_cache")
        local cmake_toolchain = this.table_get(windows, "cmake_toolchain")
        local meson_cross_file = this.table_get(windows, "meson_cross_file")
        local download_packages = this.table_get(windows, "download_packages")
        local refresh_packages = this.table_get(windows, "refresh_packages")
        local auto_packages = this.table_get(windows, "auto_packages")
        local nsis = this.table_get(windows, "nsis")
        local gtk_theme = this.table_get(windows, "gtk_theme")
        local gtk_icon_theme = this.table_get(windows, "gtk_icon_theme")
        local gtk_font_name = this.table_get(windows, "gtk_font_name")
        local gtk_prefer_dark = this.table_get(windows, "gtk_prefer_dark")
        local gdk_backend = this.table_get(windows, "gdk_backend")
        local nsis_options = this.table_get(windows, "nsis_options")
        local native_dependencies = this.table_get(windows, "native_dependencies")
        if (native_dependencies == null)
            native_dependencies = this.table_get(windows, "build_dependencies")

        if (opts.windows.build_dir == "" && build_dir != null)
            opts.windows.build_dir = this.manifest_path(base_dir, build_dir)
        this.append_values(opts.windows.build, this.manifest_command_list(build))
        if (opts.windows.msys2_root == "" && msys2_root != null)
            opts.windows.msys2_root = this.manifest_path(base_dir, msys2_root)
        if (msys2_prefix != null) opts.windows.msys2_prefix = msys2_prefix
        if (opts.windows.repo_url == "" && repo_url != null) opts.windows.repo_url = repo_url
        if (opts.windows.package_cache == "" && package_cache != null)
            opts.windows.package_cache = this.manifest_path(base_dir, package_cache)
        if (opts.windows.cmake_toolchain == "" && cmake_toolchain != null)
            opts.windows.cmake_toolchain = this.manifest_path(base_dir, cmake_toolchain)
        if (opts.windows.meson_cross_file == "" && meson_cross_file != null)
            opts.windows.meson_cross_file = this.manifest_path(base_dir, meson_cross_file)
        if (download_packages != null) opts.windows.download_packages = download_packages
        if (!opts.windows.refresh_packages && refresh_packages != null)
            opts.windows.refresh_packages = refresh_packages
        if (auto_packages != null) opts.windows.auto_packages = auto_packages
        if (opts.windows.nsis == "makensis" && nsis != null) opts.windows.nsis = nsis
        if (gtk_theme != null) opts.windows.gtk_theme = gtk_theme
        if (gtk_icon_theme != null) opts.windows.gtk_icon_theme = gtk_icon_theme
        if (gtk_font_name != null) opts.windows.gtk_font_name = gtk_font_name
        if (gtk_prefer_dark != null) opts.windows.gtk_prefer_dark = gtk_prefer_dark
        if (gdk_backend != null) opts.windows.gdk_backend = gdk_backend
        if (nsis_options != null) this.apply_nsis_options_manifest(opts, base_dir, nsis_options)

        this.append_values(opts.windows.packages, this.table_get(windows, "packages"))
        this.append_values(opts.windows.libraries, this.manifest_paths(base_dir, this.table_get(windows, "libraries")))
        this.append_values(opts.windows.typelibs, this.manifest_paths(base_dir, this.table_get(windows, "typelibs")))
        this.append_values(opts.windows.files, this.manifest_files(base_dir, this.table_get(windows, "files")))
        this.append_values(opts.windows.native_dependencies, this.manifest_native_projects(base_dir, native_dependencies))
        this.append_values(opts.windows.native_projects, this.manifest_native_projects(base_dir, this.table_get(windows, "native_projects")))
    }

    function apply_entry_manifest(opts, base_dir, entry) {
        if (typeof(entry) == "string") {
            opts.entry_type = "sqgi"
            if (opts.script == "") opts.script = this.manifest_path(base_dir, entry)
            return
        }

        if (typeof(entry) != "table")
            this.fail("manifest entry must be a string or object")

        local entry_type = this.table_get(entry, "type", "sqgi")
        if (entry_type != "sqgi" && entry_type != "native")
            this.fail("manifest entry.type must be sqgi or native")

        opts.entry_type = entry_type

        if (entry_type == "sqgi") {
            local path = this.table_get(entry, "path")
            if (path == null) path = this.table_get(entry, "script")
            if (opts.script == "" && path != null)
                opts.script = this.manifest_path(base_dir, path)
            return
        }

        local linux = this.table_get(entry, "linux")
        local windows = this.table_get(entry, "windows")
        local path = this.table_get(entry, "path")

        if (linux == null && path != null) linux = path
        if (windows == null && path != null) windows = path

        if (linux != null) opts.entry_linux = this.manifest_path(base_dir, linux)
        if (windows != null) opts.entry_windows = this.manifest_path(base_dir, windows)
    }

    function apply_nsis_options_manifest(opts, base_dir, nsis_options) {
        if (typeof(nsis_options) != "table") this.fail("manifest windows.nsis_options entry must be an object")

        local installer_name = this.table_get(nsis_options, "installer_name")
        local install_dir = this.table_get(nsis_options, "install_dir")
        local request_execution_level = this.table_get(nsis_options, "request_execution_level")
        local license = this.table_get(nsis_options, "license")
        local icon = this.table_get(nsis_options, "icon")
        local desktop_shortcut = this.table_get(nsis_options, "desktop_shortcut")
        local start_menu_shortcut = this.table_get(nsis_options, "start_menu_shortcut")
        local start_menu_folder = this.table_get(nsis_options, "start_menu_folder")
        local uninstall_registry = this.table_get(nsis_options, "uninstall_registry")

        if (installer_name != null) opts.windows.nsis_installer_name = installer_name
        if (install_dir != null) opts.windows.nsis_install_dir = install_dir
        if (request_execution_level != null) opts.windows.nsis_request_execution_level = request_execution_level
        if (license != null) opts.windows.nsis_license = this.manifest_path(base_dir, license)
        if (icon != null) opts.windows.nsis_icon = this.manifest_path(base_dir, icon)
        if (desktop_shortcut != null) opts.windows.nsis_desktop_shortcut = desktop_shortcut
        if (start_menu_shortcut != null) opts.windows.nsis_start_menu_shortcut = start_menu_shortcut
        if (start_menu_folder != null) opts.windows.nsis_start_menu_folder = start_menu_folder
        if (uninstall_registry != null) opts.windows.nsis_uninstall_registry = uninstall_registry
    }

    function manifest_path(base_dir, path) {
        if (path == null) return null
        if (GLib.path_is_absolute(path) || this.is_windows_drive_path(path)) return path
        return GLib.build_filenamev([base_dir, path])
    }

    function is_windows_drive_path(path) {
        if (path.len() < 3) return false
        local drive = path.slice(0, 1)
        local colon = path.slice(1, 2)
        local slash = path.slice(2, 3)
        if (colon != ":") return false
        if (slash != "/" && slash != "\\") return false
        return (drive >= "A" && drive <= "Z") || (drive >= "a" && drive <= "z")
    }

    function manifest_paths(base_dir, values) {
        if (values == null) return []
        local out = []
        if (typeof(values) == "array") {
            foreach (value in values) out.push(this.manifest_path(base_dir, value))
        } else {
            out.push(this.manifest_path(base_dir, values))
        }
        return out
    }

    function manifest_includes(base_dir, values) {
        if (values == null) return []

        local out = []
        local items = (typeof(values) == "array") ? values : [values]
        foreach (item in items) {
            if (typeof(item) == "string") {
                local parts = this.split_once(item, "=")
                local src = this.manifest_path(base_dir, parts[0])
                out.push(parts[1] == null ? src : (src + "=" + parts[1]))
            } else {
                local src = this.table_get(item, "path")
                local dest = this.table_get(item, "dest")
                if (src == null) this.fail("manifest include object requires path")
                src = this.manifest_path(base_dir, src)
                out.push(dest == null ? src : (src + "=" + dest))
            }
        }
        return out
    }

    function manifest_files(base_dir, values) {
        if (values == null) return []

        local out = []
        local items = (typeof(values) == "array") ? values : [values]
        foreach (item in items) {
            if (typeof(item) == "string") {
                local parts = this.split_once(item, "=")
                if (parts[1] == null) this.fail("manifest file string requires PATH=DEST")
                local src = this.manifest_path(base_dir, parts[0])
                out.push(src + "=" + parts[1])
            } else {
                local src = this.table_get(item, "path")
                local dest = this.table_get(item, "dest")
                if (src == null) this.fail("manifest file object requires path")
                if (dest == null) this.fail("manifest file object requires dest")
                src = this.manifest_path(base_dir, src)
                out.push(src + "=" + dest)
            }
        }
        return out
    }

    function manifest_command_list(value) {
        if (value == null) return []
        if (typeof(value) == "array") return value
        return [value]
    }

    function manifest_string_list(value) {
        if (value == null) return []
        if (typeof(value) == "array") return value
        return [value]
    }

    function manifest_native_project_paths(base_dir, project_dir, values) {
        if (values == null) return []
        local out = []
        local items = (typeof(values) == "array") ? values : [values]
        foreach (value in items) {
            if (GLib.path_is_absolute(value)) out.push(value)
            else out.push(GLib.build_filenamev([project_dir == null ? base_dir : project_dir, value]))
        }
        return out
    }

    function manifest_native_project_files(base_dir, project_dir, values) {
        if (values == null) return []

        local out = []
        local items = (typeof(values) == "array") ? values : [values]
        foreach (item in items) {
            if (typeof(item) == "string") {
                local parts = this.split_once(item, "=")
                if (parts[1] == null) this.fail("native project file string requires PATH=DEST")
                local src = GLib.path_is_absolute(parts[0])
                    ? parts[0]
                    : GLib.build_filenamev([project_dir == null ? base_dir : project_dir, parts[0]])
                out.push(src + "=" + parts[1])
            } else {
                local src = this.table_get(item, "path")
                local dest = this.table_get(item, "dest")
                if (src == null) this.fail("native project file object requires path")
                if (dest == null) this.fail("native project file object requires dest")
                src = GLib.path_is_absolute(src)
                    ? src
                    : GLib.build_filenamev([project_dir == null ? base_dir : project_dir, src])
                out.push(src + "=" + dest)
            }
        }
        return out
    }

    function git_repo_basename(repo) {
        if (repo == null || repo == "") return "native-dependency"

        local value = repo
        if (this.ends_with(value, "/")) value = value.slice(0, value.len() - 1)
        local slash = null
        for (local i = value.len() - 1; i >= 0; i--) {
            local ch = value.slice(i, i + 1)
            if (ch == "/" || ch == ":") { slash = i; break }
        }
        if (slash != null) value = value.slice(slash + 1)
        if (this.ends_with(value, ".git")) value = value.slice(0, value.len() - 4)
        return value.len() == 0 ? "native-dependency" : value
    }

    function manifest_native_projects(base_dir, values) {
        if (values == null) return []

        local out = []
        local items = (typeof(values) == "array") ? values : [values]
        foreach (item in items) {
            if (typeof(item) != "table") this.fail("native project entry must be an object")

            local repo = this.table_get(item, "repo")
            if (repo == null) repo = this.table_get(item, "git")
            local branch = this.table_get(item, "branch")
            local tag = this.table_get(item, "tag")
            local ref = this.table_get(item, "ref")
            local commit = this.table_get(item, "commit")
            if (ref == null && tag != null) ref = tag
            if (ref == null && commit != null) ref = commit
            local update = this.table_get(item, "update", true)
            local shallow = this.table_get(item, "shallow", false)
            local submodules = this.table_get(item, "submodules", false)

            local name = this.table_get(item, "name")
            if (name == null && repo != null) name = this.git_repo_basename(repo)

            local dir = this.table_get(item, "dir")
            if (dir == null) {
                if (repo != null) {
                    dir = GLib.build_filenamev([".sqgipkg", "native", name == null ? this.git_repo_basename(repo) : name])
                } else {
                    dir = "."
                }
            }

            local project_dir = this.manifest_path(base_dir, dir)
            if (name == null) name = this.basename(project_dir)

            local build = this.manifest_command_list(this.table_get(item, "build"))
            local install = this.manifest_command_list(this.table_get(item, "install"))
            local libraries = this.manifest_native_project_paths(base_dir, project_dir, this.table_get(item, "libraries"))
            local typelibs = this.manifest_native_project_paths(base_dir, project_dir, this.table_get(item, "typelibs"))
            local files = this.manifest_native_project_files(base_dir, project_dir, this.table_get(item, "files"))
            local stage = this.table_get(item, "stage", true)

            out.push({
                name = name,
                dir = project_dir,
                repo = repo,
                branch = branch,
                ref = ref,
                update = update,
                shallow = shallow,
                submodules = submodules,
                build = build,
                install = install,
                libraries = libraries,
                typelibs = typelibs,
                files = files,
                stage = stage
            })
        }
        return out
    }

    function manifest_linux_arch(base_dir, item) {
        if (typeof(item) == "string") {
            return { arch = item }
        }

        if (typeof(item) != "table") this.fail("linux.arches entries must be strings or objects")

        local arch = this.table_get(item, "arch")
        if (arch == null) arch = this.table_get(item, "appimage_arch")
        if (arch == null) this.fail("linux.arches object requires arch")

        local build_dir = this.table_get(item, "build_dir")
        local output = this.table_get(item, "output")
        local sysroot = this.table_get(item, "sysroot")
        local entry_linux = this.table_get(item, "entry_linux")
        local copy_dependencies = this.table_get(item, "copy_dependencies")
        local deb = this.table_get(item, "deb")
        local download_packages = this.table_get(item, "deb_download")
        if (download_packages == null) download_packages = this.table_get(item, "download_packages")
        local refresh_packages = this.table_get(item, "deb_refresh")
        if (refresh_packages == null) refresh_packages = this.table_get(item, "refresh_packages")
        local package_cache = this.table_get(item, "deb_package_cache")
        if (package_cache == null) package_cache = this.table_get(item, "package_cache")
        local sysroot_cache = this.table_get(item, "deb_sysroot_cache")
        if (sysroot_cache == null) sysroot_cache = this.table_get(item, "sysroot_cache")
        local packages = this.table_get(item, "deb_packages")
        if (packages == null) packages = this.table_get(item, "packages")
        if (deb != null) {
            if (typeof(deb) != "table") this.fail("linux.arches deb entries must be objects")
            if (download_packages == null) download_packages = this.table_get(deb, "download")
            if (refresh_packages == null) refresh_packages = this.table_get(deb, "refresh")
            if (package_cache == null) package_cache = this.table_get(deb, "package_cache")
            if (sysroot_cache == null) sysroot_cache = this.table_get(deb, "sysroot_cache")
            if (packages == null) packages = this.table_get(deb, "packages")
        }
        local package_arch = this.table_get(item, "package_arch")
        local cmake_toolchain = this.table_get(item, "cmake_toolchain")
        local meson_cross_file = this.table_get(item, "meson_cross_file")

        return {
            arch = arch,
            package_arch = package_arch == null ? "" : package_arch,
            build_dir = build_dir == null ? "" : this.manifest_path(base_dir, build_dir),
            output = output == null ? "" : this.manifest_path(base_dir, output),
            sysroot = sysroot == null ? "" : this.manifest_path(base_dir, sysroot),
            deb_package_cache = package_cache == null ? "" : this.manifest_path(base_dir, package_cache),
            deb_sysroot_cache = sysroot_cache == null ? "" : this.manifest_path(base_dir, sysroot_cache),
            deb_download = download_packages == null ? null : download_packages,
            deb_refresh = refresh_packages == null ? null : refresh_packages,
            entry_linux = entry_linux == null ? "" : this.manifest_path(base_dir, entry_linux),
            cmake_toolchain = cmake_toolchain == null ? "" : this.manifest_path(base_dir, cmake_toolchain),
            meson_cross_file = meson_cross_file == null ? "" : this.manifest_path(base_dir, meson_cross_file),
            build = this.manifest_command_list(this.table_get(item, "build")),
            deb_packages = this.manifest_string_list(packages),
            library_dirs = this.manifest_paths(base_dir, this.table_get(item, "library_dirs")),
            copy_dependencies = copy_dependencies == null ? null : copy_dependencies,
            libraries = this.manifest_paths(base_dir, this.table_get(item, "libraries")),
            typelibs = this.manifest_paths(base_dir, this.table_get(item, "typelibs")),
            files = this.manifest_files(base_dir, this.table_get(item, "files")),
            resources = this.manifest_paths(base_dir, this.table_get(item, "resources")),
            gstreamer_plugins = this.manifest_paths(base_dir, this.table_get(item, "gstreamer_plugins")),
            gsettings_schemas = this.manifest_paths(base_dir, this.table_get(item, "gsettings_schemas")),
            gtk_data = this.manifest_paths(base_dir, this.table_get(item, "gtk_data")),
            gio_modules = this.manifest_paths(base_dir, this.table_get(item, "gio_modules")),
            gdk_pixbuf_loaders = this.manifest_paths(base_dir, this.table_get(item, "gdk_pixbuf_loaders")),
            native_projects = this.manifest_native_projects(base_dir, this.table_get(item, "native_projects")),
            inherit_native_projects = this.table_get(item, "inherit_native_projects", true)
        }
    }

    function manifest_linux_arches(base_dir, values) {
        if (values == null) return []
        local out = []
        local items = (typeof(values) == "array") ? values : [values]
        foreach (item in items)
            out.push(this.manifest_linux_arch(base_dir, item))
        return out
    }

    function validate_options(opts) {
        if (opts.target == "linux-sysroot" || opts.target == "win-sysroot") return
        if (opts.entry_type == "sqgi") {
            if (opts.script == "") this.fail("missing script")
            return
        }

        if (opts.entry_type == "native") {
            local has_linux_entry = opts.entry_linux != ""
            foreach (config in opts.linux.arches) {
                if (this.table_get(config, "entry_linux", "") != "") has_linux_entry = true
            }
            if ((opts.target == "appimage" || opts.target == "all") && !has_linux_entry)
                this.fail("native entry requires entry.linux for target " + opts.target)
            if ((this.starts_with(opts.target, "win-") || opts.target == "all") && opts.entry_windows == "")
                this.fail("native entry requires entry.windows for target " + opts.target)
            return
        }

        this.fail("unknown entry type: " + opts.entry_type)
    }

    function validate_doctor_options(opts) {
        if (opts.entry_type == "sqgi" && opts.script == "") this.fail("doctor requires a script")
        if (opts.entry_type == "native" && opts.entry_linux == "" && opts.entry_windows == "")
            this.fail("doctor requires a native entry path")
    }

}

return { SqgiPkgManifest = SqgiPkgManifest }
