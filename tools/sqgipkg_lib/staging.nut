local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("scripts.nut")

class SqgiPkgStaging extends Base.SqgiPkgScripts {
    function cnut_dest_for_script_dest(dest_rel) {
        return this.ends_with(dest_rel, ".nut")
            ? this.replace_suffix(dest_rel, ".nut", ".cnut")
            : (dest_rel + ".cnut")
    }

    function compile_script_to(src_abs, dest_abs) {
        local closure = loadfile(src_abs, true)
        if (closure == null) this.fail("failed to compile script: " + src_abs)
        writeclosuretofile(dest_abs, closure)
    }

    function link_script_compat(opts, appdir, script_dest_rel, cnut_dest_rel) {
        if (script_dest_rel == cnut_dest_rel) return

        local link_abs = GLib.build_filenamev([appdir, script_dest_rel])
        local target_rel = this.basename(cnut_dest_rel)
        if (this.starts_with(opts.target, "win-")) {
            local cnut_abs = GLib.build_filenamev([appdir, cnut_dest_rel])
            this.run_shell(
                "cp " + this.shell_quote(cnut_abs) + " " + this.shell_quote(link_abs),
                "copying script bytecode compatibility path"
            )
            this.report_inc(opts, "script_links")
            return
        }

        this.run_shell(
            "rm -f " + this.shell_quote(link_abs) + " && ln -s " + this.shell_quote(target_rel) + " " + this.shell_quote(link_abs),
            "linking script bytecode compatibility path"
        )
        this.report_inc(opts, "script_links")
    }

    function stage_script_imports(opts, appdir, src_abs, dest_rel, staged, source_root = null, dest_root_rel = null) {
        foreach (import_path in this.script_import_literals(src_abs)) {
            if (!this.is_local_script_import(import_path)) continue

            local path = this.normalize_script_import_path(import_path)
            local dep_src = GLib.build_filenamev([this.dirname(src_abs), path])
            local dep_dest = this.script_dest_for_import(dest_rel, import_path)
            if (!this.path_exists(dep_src) && source_root != null) {
                local rooted = GLib.build_filenamev([source_root, path])
                if (this.path_exists(rooted)) {
                    dep_src = rooted
                    dep_dest = this.script_dest_for_import(dest_rel, import_path, dest_root_rel)
                }
            }
            if (!this.path_exists(dep_src))
                this.fail("imported script not found: " + import_path + " from " + src_abs)

            this.stage_script_file(opts, appdir, dep_src, dep_dest, "imported script", staged, source_root, dest_root_rel)
        }
    }

    function stage_script_file(opts, appdir, src, dest_rel, description, staged, source_root = null, dest_root_rel = null) {
        local src_abs = this.abs_path(src)
        if (!this.path_exists(src_abs)) this.fail(description + " not found: " + src)
        this.scan_script_imports(opts, src_abs)

        dest_rel = this.relative_dest(dest_rel)
        if (this.table_get(staged, dest_rel, false)) return null
        staged[dest_rel] <- true

        if (!opts.compile_scripts) {
            this.copy_into_appdir(src_abs, appdir, dest_rel, description)
            this.report_inc(opts, "scripts_copied")
            this.stage_script_imports(opts, appdir, src_abs, dest_rel, staged, source_root, dest_root_rel)
            return dest_rel
        }

        local cnut_dest_rel = this.relative_dest(this.cnut_dest_for_script_dest(dest_rel))
        local cnut_abs = GLib.build_filenamev([appdir, cnut_dest_rel])
        this.mkdir_p(this.dirname(cnut_abs))
        this.compile_script_to(src_abs, cnut_abs)
        this.report_inc(opts, "scripts_compiled")
        this.link_script_compat(opts, appdir, dest_rel, cnut_dest_rel)
        this.stage_script_imports(opts, appdir, src_abs, dest_rel, staged, source_root, dest_root_rel)
        return cnut_dest_rel
    }

    function copy_or_compile_include_spec(opts, spec, appdir, staged) {
        local parts = this.split_once(spec, "=")
        local src = parts[0]
        local dest = parts[1]
        if (dest == null) {
            dest = this.starts_with(opts.target, "win-")
                ? GLib.build_filenamev(["share", "sqgi", "resources", this.basename(src)])
                : GLib.build_filenamev(["usr", "share", "sqgi", "resources", this.basename(src)])
        }

        if (this.ends_with(src, ".nut") || this.ends_with(dest, ".nut") || this.ends_with(dest, ".cnut")) {
            this.stage_script_file(opts, appdir, src, dest, "include script", staged)
            return
        }

        this.copy_into_appdir(src, appdir, dest, "include")
        this.report_inc(opts, "includes")
    }

    function app_script_root_rel(opts) {
        return this.starts_with(opts.target, "win-")
            ? GLib.build_filenamev(["share", "sqgi", "app"])
            : GLib.build_filenamev(["usr", "share", "sqgi", "app"])
    }

    function add_script_spec(opts, appdir, spec, staged) {
        local parts = this.split_once(spec, "=")
        local src = parts[0]
        local dest = parts[1]
        if (dest == null) dest = this.script_dest_for_source(src)
        local app_root = this.app_script_root_rel(opts)
        dest = GLib.build_filenamev([app_root, dest])
        this.stage_script_file(opts, appdir, src, dest, "script", staged, this.dirname(this.abs_path(src)), app_root)
    }

    function list_nut_files(dir) {
        local dir_abs = this.abs_path(dir)
        if (this.ends_with(dir_abs, "/."))
            dir_abs = dir_abs.slice(0, dir_abs.len() - 2)
        if (!this.path_exists(dir_abs)) this.fail("script directory not found: " + dir)

        local tmp = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-scripts-" + GLib.get_monotonic_time()])
        this.run_shell(
            "find " + this.shell_quote(dir_abs) +
            " \\( -name .git -o -name build -o -name dist -o -name AppDir -o -name '*.AppDir' \\) -type d -prune" +
            " -o -type f -name '*.nut' -print | sort > " + this.shell_quote(tmp),
            "listing script directory"
        )
        local files = this.split_lines(this.read_file(tmp))
        remove(tmp)
        return files
    }

    function add_script_dir(opts, appdir, dir, main_script_abs, staged) {
        foreach (src in this.list_nut_files(dir)) {
            local src_abs = this.abs_path(src)
            if (src_abs == main_script_abs) continue

            local dest = this.script_dest_for_source(src_abs, dir)
            local app_root = this.app_script_root_rel(opts)
            dest = GLib.build_filenamev([app_root, dest])
            this.stage_script_file(opts, appdir, src_abs, dest, "script directory entry", staged, this.abs_path(dir), app_root)
        }
    }

    function copy_file_spec(opts, spec, appdir) {
        local parts = this.split_once(spec, "=")
        local src = parts[0]
        local dest = parts[1]
        if (dest == null) this.fail("--file requires PATH=DEST")
        this.copy_into_appdir(src, appdir, dest, "file")
        this.report_inc(opts, "manual_files")
    }

    function copy_library(opts, path, appdir, description = "shared library") {
        this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "lib"]), description)
        this.report_inc(opts, "libraries")
    }

    function copy_windows_library(opts, path, windir, description = "Windows shared library") {
        this.copy_to_dir(path, windir, "bin", description)
        this.report_inc(opts, "libraries")
    }

    function copy_windows_typelib(opts, path, windir, description = "Windows GI typelib") {
        this.copy_to_dir(path, windir, GLib.build_filenamev(["lib", "girepository-1.0"]), description)
        this.report_inc(opts, "typelibs")
    }

    function stage_native_projects(opts, appdir) {
        foreach (project in opts.native_projects) {
            this.ensure_git_native_project(project, "native project " + project.name)

            local dir = project.dir
            if (!this.path_exists(dir)) this.fail("native project directory not found: " + dir)

            local env = this.starts_with(opts.target, "win-") ? "" : this.linux_build_env_prefix(opts)
            foreach (command in project.build) {
                this.info("native build: " + command)
                this.run_shell_in_dir(env + command, dir, "native build")
            }

            this.report_inc(opts, "native_projects")

            foreach (path in project.libraries)
                this.copy_library(opts, path, appdir, "native shared library")

            foreach (path in project.typelibs) {
                this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "lib", "girepository-1.0"]), "native GI typelib")
                this.report_inc(opts, "typelibs")
            }

            foreach (spec in project.files)
                this.copy_file_spec(opts, spec, appdir)
        }
    }

    function ensure_git_native_project(project, label) {
        if (project.repo == null || project.repo == "") return
        if (!this.executable_available("git")) this.fail(label + " requires git in PATH")

        local dir = project.dir
        local git_dir = GLib.build_filenamev([dir, ".git"])
        local branch = project.branch

        if (!this.path_exists(dir)) {
            branch = this.resolve_git_branch(project, label, null, true)
            this.mkdir_p(this.dirname(dir))
            local clone_cmd = "git clone "
            if (project.shallow) clone_cmd += "--depth 1 "
            if (branch != null && branch != "")
                clone_cmd += "--branch " + this.shell_quote(branch) + " "
            clone_cmd += this.shell_quote(project.repo) + " " + this.shell_quote(dir)
            this.info(label + " clone_cmd: " + project.repo)
            this.run_shell(clone_cmd, label + " clone")
        } else if (!this.path_exists(git_dir)) {
            this.fail(label + " directory exists but is not a git checkout: " + dir)
        } else if (project.update) {
            this.info(label + " git fetch")
            this.run_shell("git -C " + this.shell_quote(dir) + " fetch --all --tags --prune", label + " git fetch")
            branch = this.resolve_git_branch(project, label, dir, true)
            if (branch != null && branch != "") {
                this.info(label + " git checkout branch: " + branch)
                this.run_shell("git -C " + this.shell_quote(dir) + " checkout " + this.shell_quote(branch), label + " git checkout")
                this.run_shell("git -C " + this.shell_quote(dir) + " pull --ff-only", label + " git pull")
            }
        } else {
            branch = this.resolve_git_branch(project, label, dir, false)
        }

        if (project.ref != null && project.ref != "") {
            this.info(label + " git checkout ref: " + project.ref)
            this.run_shell("git -C " + this.shell_quote(dir) + " checkout " + this.shell_quote(project.ref), label + " git checkout ref")
        } else if (branch != null && branch != "") {
            this.run_shell("git -C " + this.shell_quote(dir) + " checkout " + this.shell_quote(branch), label + " git checkout branch")
        }

        if (project.submodules) {
            this.info(label + " git submodules")
            this.run_shell("git -C " + this.shell_quote(dir) + " submodule update --init --recursive", label + " git submodules")
        }
    }

    function resolve_git_branch(project, label, dir, allow_remote_lookup) {
        if (project.branch == null || project.branch == "") return project.branch
        if (dir != null && this.path_exists(GLib.build_filenamev([dir, ".git"]))) {
            if (this.git_local_has_branch(dir, project.branch)) return project.branch

            local local_default_branch = this.git_local_default_branch(dir)
            if (local_default_branch != null && local_default_branch != "") {
                this.info(label + " requested branch '" + project.branch + "' was not found; using checkout default branch '" + local_default_branch + "'")
                project.branch = local_default_branch
                return local_default_branch
            }

            if (!allow_remote_lookup)
                this.fail(label + " requested branch '" + project.branch + "' was not found in local checkout " + dir)
        }

        if (!allow_remote_lookup) return project.branch
        if (this.git_remote_has_branch(project.repo, project.branch)) return project.branch

        local default_branch = this.git_remote_default_branch(project.repo)
        if (default_branch != null && default_branch != "") {
            this.info(label + " requested branch '" + project.branch + "' was not found; using remote default branch '" + default_branch + "'")
            project.branch = default_branch
            return default_branch
        }

        this.fail(label + " requested branch '" + project.branch + "' was not found in " + project.repo)
    }

    function git_local_has_branch(dir, branch) {
        if (dir == null || dir == "" || branch == null || branch == "") return false
        local prefix = "git -C " + this.shell_quote(dir) + " rev-parse --verify --quiet "
        local quoted_branch = this.shell_quote(branch)
        if (this.run_shell_status(prefix + "refs/heads/" + quoted_branch + " >/dev/null 2>&1") == 0)
            return true
        return this.run_shell_status(prefix + "refs/remotes/origin/" + quoted_branch + " >/dev/null 2>&1") == 0
    }

    function git_local_default_branch(dir) {
        if (dir == null || dir == "") return null

        local output = this.run_shell_output("git -C " + this.shell_quote(dir) + " symbolic-ref --short refs/remotes/origin/HEAD")
        if (output == null) return null

        local lines = this.split_lines(output)
        if (lines.len() == 0) return null

        local branch = lines[0]
        if (this.starts_with(branch, "origin/"))
            branch = branch.slice("origin/".len())
        return branch
    }

    function git_remote_has_branch(repo, branch) {
        if (repo == null || repo == "" || branch == null || branch == "") return false
        return this.run_shell_status("git ls-remote --exit-code --heads " +
            this.shell_quote(repo) + " " + this.shell_quote(branch) + " >/dev/null 2>&1") == 0
    }

    function git_remote_default_branch(repo) {
        if (repo == null || repo == "") return null

        local output = this.run_shell_output("git ls-remote --symref " + this.shell_quote(repo) + " HEAD")
        if (output == null) return null

        foreach (line in this.split_lines(output)) {
            local prefix = "ref: refs/heads/"
            local suffix = "\tHEAD"
            if (this.starts_with(line, prefix) && this.ends_with(line, suffix))
                return line.slice(prefix.len(), line.len() - suffix.len())
        }
        return null
    }

    function run_windows_native_project_commands(opts, project, label) {
        this.ensure_git_native_project(project, label)

        local dir = project.dir
        if (!this.path_exists(dir)) this.fail(label + " directory not found: " + dir)

        foreach (command in project.build) {
            this.info(label + " build: " + command)
            this.run_windows_shell_in_dir(opts, command, dir, label + " build")
        }

        foreach (command in project.install) {
            this.info(label + " install: " + command)
            this.run_windows_shell_in_dir(opts, command, dir, label + " install")
        }

        this.report_inc(opts, "native_projects")
    }

    function stage_windows_native_project_outputs(opts, project, windir, label) {
        if (!project.stage) return

        foreach (path in project.libraries)
            this.copy_windows_library(opts, path, windir, label + " shared library")

        foreach (path in project.typelibs)
            this.copy_windows_typelib(opts, path, windir, label + " GI typelib")

        foreach (spec in project.files)
            this.copy_file_spec(opts, spec, windir)
    }

    function build_windows_native_dependencies(opts) {
        foreach (project in opts.windows.native_dependencies)
            this.run_windows_native_project_commands(opts, project, "Windows native dependency " + project.name)
    }

    function stage_windows_native_dependencies(opts, windir) {
        foreach (project in opts.windows.native_dependencies)
            this.stage_windows_native_project_outputs(opts, project, windir, "Windows native dependency " + project.name)
    }

    function stage_windows_native_projects(opts, windir) {
        foreach (project in opts.windows.native_projects) {
            this.run_windows_native_project_commands(opts, project, "Windows native project " + project.name)
            this.stage_windows_native_project_outputs(opts, project, windir, "Windows native project " + project.name)
        }
    }

    function copy_include_spec(spec, appdir) {
        local parts = this.split_once(spec, "=")
        local src = parts[0]
        local dest = parts[1]
        if (dest == null) {
            dest = GLib.build_filenamev(["usr", "share", "sqgi", "resources", this.basename(src)])
        }
        this.copy_into_appdir(src, appdir, dest, "include")
    }

    function stage_extra_files(opts, appdir, staged_scripts) {
        foreach (spec in opts.files)
            this.copy_file_spec(opts, spec, appdir)

        foreach (spec in opts.includes)
            this.copy_or_compile_include_spec(opts, spec, appdir, staged_scripts)

        foreach (path in opts.libraries)
            this.copy_library(opts, path, appdir)

        foreach (path in opts.resources) {
            this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "share", "sqgi", "app", "resources"]), "resource")
            this.report_inc(opts, "resources")
        }

        foreach (path in opts.gstreamer_plugins) {
            this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "lib", "gstreamer-1.0"]), "GStreamer plugin")
            this.report_inc(opts, "gstreamer_plugins")
        }

        foreach (path in opts.typelibs) {
            this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "lib", "girepository-1.0"]), "GI typelib")
            this.report_inc(opts, "typelibs")
        }

        foreach (path in opts.gsettings_schemas) {
            this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "share", "glib-2.0", "schemas"]), "GSettings schema")
            this.report_inc(opts, "gsettings_schemas")
        }

        foreach (path in opts.gtk_data) {
            this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "share"]), "GTK data")
            this.report_inc(opts, "gtk_data")
        }

        foreach (path in opts.gio_modules) {
            this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "lib", "gio", "modules"]), "GIO module")
            this.report_inc(opts, "gio_modules")
        }

        foreach (path in opts.gdk_pixbuf_loaders) {
            this.copy_to_dir(path, appdir, GLib.build_filenamev(["usr", "lib", "gdk-pixbuf-2.0", "2.10.0", "loaders"]), "gdk-pixbuf loader")
            this.report_inc(opts, "gdk_pixbuf_loaders")
        }
    }

}

return { SqgiPkgStaging = SqgiPkgStaging }
