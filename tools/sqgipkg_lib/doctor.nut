local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("templates.nut")

class SqgiPkgDoctor extends Base.SqgiPkgTemplates {
    function doctor_path(errors, label, path) {
        if (this.path_exists(path)) {
            print("OK: " + label + ": " + path + "\n")
            return errors
        }
        print("ERROR: missing " + label + ": " + path + "\n")
        return errors + 1
    }

    function doctor_dest(errors, label, dest) {
        try {
            this.relative_dest(dest)
            return errors
        } catch (e) {
            print("ERROR: invalid " + label + " destination: " + dest + "\n")
            return errors + 1
        }
    }

    function doctor_file_spec(errors, warnings, spec, label, outputs_may_be_missing) {
        if (this.file_spec_is_rule(spec)) {
            try {
                foreach (expanded in this.expand_file_rule(spec))
                    errors = this.doctor_file_spec(errors, warnings, expanded, label, outputs_may_be_missing)
            } catch (e) {
                local message = "" + e
                local missing_output = message.find("source not found") != null ||
                    message.find("matched no files") != null
                if (outputs_may_be_missing && missing_output) {
                    warnings.push(label + " rule outputs not found yet: " + spec.from)
                } else {
                    print("ERROR: " + message + "\n")
                    errors++
                }
            }
            return errors
        }

        local parts = this.split_once(spec, "=")
        if (outputs_may_be_missing) {
            if (this.path_exists(parts[0])) print("OK: " + label + " output: " + parts[0] + "\n")
            else warnings.push(label + " output not found yet: " + parts[0])
        } else {
            errors = this.doctor_path(errors, label, parts[0])
        }

        if (parts[1] == null) {
            print("ERROR: " + label + " entry requires PATH=DEST\n")
            errors++
        } else {
            errors = this.doctor_dest(errors, label, parts[1])
        }
        return errors
    }

    function doctor_script(errors, opts, label, path) {
        local src_abs = this.abs_path(path)
        errors = this.doctor_path(errors, label, src_abs)
        if (!this.path_exists(src_abs)) return errors

        this.scan_script_imports(opts, src_abs)
        try {
            local closure = loadfile(src_abs, true)
            if (closure == null) {
                print("ERROR: failed to compile " + label + ": " + src_abs + "\n")
                return errors + 1
            }
            print("OK: compiles " + label + "\n")
        } catch (e) {
            print("ERROR: failed to compile " + label + ": " + e + "\n")
            return errors + 1
        }

        return errors
    }

    function doctor_linux_arch_build_dir(opts, config) {
        local configured = this.table_get(config, "build_dir", "")
        if (configured != "") return this.abs_path(configured)

        local arch = this.normalize_appimage_arch(this.table_get(config, "arch", opts.appimage_arch))
        if (arch != this.normalize_appimage_arch(this.machine_arch()))
            return this.abs_path("build-" + arch)
        return this.abs_path(opts.build_dir)
    }

    function doctor_linux_arches(errors, warnings, opts) {
        local seen_arches = {}
        local seen_build_dirs = {}

        foreach (config in opts.linux.arches) {
            local arch = this.normalize_appimage_arch(this.table_get(config, "arch", opts.appimage_arch))
            if (this.table_get(seen_arches, arch, false)) {
                print("ERROR: duplicate linux.arches target: " + arch + "\n")
                errors++
            }
            seen_arches[arch] <- true

            local build_dir = this.doctor_linux_arch_build_dir(opts, config)
            if (build_dir in seen_build_dirs && seen_build_dirs[build_dir] != arch) {
                warnings.push("Linux arch " + arch + " shares build_dir with " +
                    seen_build_dirs[build_dir] + ": " + build_dir)
            } else {
                seen_build_dirs[build_dir] <- arch
            }

            local entry_linux = this.table_get(config, "entry_linux", "")
            if (opts.entry_type == "native" && entry_linux == "")
                warnings.push("Linux arch " + arch + " has no arch-specific native entry")
        }

        return errors
    }

    function doctor(opts) {
        local errors = 0
        local warnings = []
        local script_abs = opts.script == "" ? "" : this.abs_path(opts.script)

        print("sqgipkg doctor\n")
        if (opts.entry_type == "sqgi") {
            errors = this.doctor_script(errors, opts, "entry script", script_abs)
        } else {
            if (opts.entry_linux != "") {
                if (this.path_exists(opts.entry_linux)) print("OK: native Linux entry: " + opts.entry_linux + "\n")
                else warnings.push("native Linux entry output not found yet: " + opts.entry_linux)
            }
            if (opts.entry_windows != "") {
                if (this.path_exists(opts.entry_windows)) print("OK: native Windows entry: " + opts.entry_windows + "\n")
                else warnings.push("native Windows entry output not found yet: " + opts.entry_windows)
            }
        }

        foreach (spec in opts.scripts) {
            local parts = this.split_once(spec, "=")
            errors = this.doctor_script(errors, opts, "script", parts[0])
            if (parts[1] != null)
                errors = this.doctor_dest(errors, "script", parts[1])
        }

        foreach (dir in opts.script_dirs) {
            local dir_abs = this.abs_path(dir)
            errors = this.doctor_path(errors, "script directory", dir_abs)
            if (this.path_exists(dir_abs)) {
                foreach (src in this.list_nut_files(dir_abs)) {
                    if (script_abs == "" || this.abs_path(src) != script_abs)
                        errors = this.doctor_script(errors, opts, "script directory entry", src)
                }
            }
        }

        foreach (spec in opts.files) {
            errors = this.doctor_file_spec(errors, warnings, spec, "file", false)
        }

        foreach (spec in opts.includes) {
            local parts = this.split_once(spec, "=")
            errors = this.doctor_path(errors, "include", parts[0])
            if (parts[1] != null)
                errors = this.doctor_dest(errors, "include", parts[1])
        }

        foreach (path in opts.resources)
            errors = this.doctor_path(errors, "resource", path)
        foreach (path in opts.libraries)
            errors = this.doctor_path(errors, "shared library", path)
        foreach (path in opts.gstreamer_plugins)
            errors = this.doctor_path(errors, "GStreamer plugin", path)
        foreach (path in opts.typelibs)
            errors = this.doctor_path(errors, "GI typelib", path)
        foreach (path in opts.gsettings_schemas)
            errors = this.doctor_path(errors, "GSettings schema", path)
        foreach (path in opts.gtk_data)
            errors = this.doctor_path(errors, "GTK data", path)
        foreach (path in opts.gio_modules)
            errors = this.doctor_path(errors, "GIO module", path)
        foreach (path in opts.gdk_pixbuf_loaders)
            errors = this.doctor_path(errors, "gdk-pixbuf loader", path)
        if (opts.desktop_icon != "")
            errors = this.doctor_path(errors, "desktop icon", opts.desktop_icon)
        if (opts.windows.nsis_license != "")
            errors = this.doctor_path(errors, "NSIS license", opts.windows.nsis_license)
        if (opts.windows.nsis_icon != "")
            errors = this.doctor_path(errors, "NSIS icon", opts.windows.nsis_icon)
        if (opts.windows.nsis_header_image != "")
            errors = this.doctor_path(errors, "NSIS header image", opts.windows.nsis_header_image)
        if (opts.windows.nsis_welcome_image != "")
            errors = this.doctor_path(errors, "NSIS welcome image", opts.windows.nsis_welcome_image)
        foreach (font in opts.windows.fonts) {
            local path = this.table_get(font, "path", "")
            local registry_name = this.table_get(font, "registry_name", "")
            errors = this.doctor_path(errors, "Windows font", path)
            if (registry_name == "") {
                print("ERROR: Windows font requires registry_name: " + path + "\n")
                errors = errors + 1
            }
        }

        foreach (project in opts.native_projects) {
            errors = this.doctor_path(errors, "native project directory", project.dir)
            if (project.build.len() == 0)
                warnings.push("native project has no build commands: " + project.dir)
            foreach (command in project.build)
                print("OK: native build command: " + command + "\n")
            foreach (path in project.libraries) {
                if (this.path_exists(path)) print("OK: native shared library output: " + path + "\n")
                else warnings.push("native shared library output not found yet: " + path)
            }
            foreach (path in project.typelibs) {
                if (this.path_exists(path)) print("OK: native GI typelib output: " + path + "\n")
                else warnings.push("native GI typelib output not found yet: " + path)
            }
            foreach (spec in project.files)
                errors = this.doctor_file_spec(errors, warnings, spec, "native file", true)
        }

        errors = this.doctor_linux_arches(errors, warnings, opts)

        local linux_auto_runtime = this.linux_auto_runtime_packages_enabled(opts)
        if (opts.report.used_gst && opts.gstreamer_plugins.len() == 0 && !linux_auto_runtime)
            warnings.push("GStreamer import detected; package may rely on host GStreamer plugins")
        if (opts.report.used_gtk && opts.gtk_data.len() == 0 && opts.typelibs.len() == 0 && !linux_auto_runtime)
            warnings.push("GTK import detected; package may rely on host GTK assets and typelibs")

        if (opts.entry_type == "sqgi") {
            if (!this.path_exists(GLib.build_filenamev([opts.build_dir, "sqgi"])))
                warnings.push("sqgi binary not found in build_dir yet: " + opts.build_dir)
            if (!this.path_exists(GLib.build_filenamev([opts.build_dir, "libsqgi.so.0"])))
                warnings.push("libsqgi.so.0 not found in build_dir yet: " + opts.build_dir)
        }
        if (this.executable_path(opts.appimagetool) == null)
            warnings.push("appimagetool not found in PATH; build will download it if curl or wget is available")

        foreach (warning in warnings)
            print("WARN: " + warning + "\n")

        if (errors == 0) {
            print("Doctor: OK with " + warnings.len() + " warning(s)\n")
            return 0
        }

        print("Doctor: FAILED with " + errors + " error(s) and " + warnings.len() + " warning(s)\n")
        return 1
    }

}

return { SqgiPkgDoctor = SqgiPkgDoctor }
