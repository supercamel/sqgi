local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("staging.nut")

class SqgiPkgWindowsNsis extends Base.SqgiPkgWindowsStaging {
    function nsis_escape(value) {
        local out = ""
        for (local i = 0; i < value.len(); i++) {
            local ch = value.slice(i, i + 1)
            if (ch == "$") out += "$$"
            else if (ch == "\"") out += "$\\\""
            else out += ch
        }
        return out
    }

    function nsis_escape_keep_vars(value) {
        local out = ""
        for (local i = 0; i < value.len(); i++) {
            local ch = value.slice(i, i + 1)
            if (ch == "\"") out += "$\\\""
            else out += ch
        }
        return out
    }

    function nsis_install_dir(opts, package_name) {
        if (opts.windows.nsis_install_dir != "")
            return opts.windows.nsis_install_dir
        return "$LOCALAPPDATA\\" + package_name
    }

    function nsis_installer_name(opts, package_name) {
        return opts.windows.nsis_installer_name != ""
            ? opts.windows.nsis_installer_name
            : package_name + "-Setup.exe"
    }

    function nsis_start_menu_folder(opts) {
        return opts.windows.nsis_start_menu_folder != ""
            ? opts.windows.nsis_start_menu_folder
            : opts.name
    }

    function nsis_validate_execution_level(level) {
        if (level == "user" || level == "admin" || level == "highest" || level == "none") return level
        this.fail("NSIS request_execution_level must be user, admin, highest or none")
    }

    function maybe_stage_nsis_icon(opts, windir) {
        if (opts.windows.nsis_icon == "") return ""
        local icon_abs = this.abs_path(opts.windows.nsis_icon)
        if (!this.path_exists(icon_abs)) this.fail("NSIS icon not found: " + opts.windows.nsis_icon)
        local dest = GLib.build_filenamev([windir, "app.ico"])
        this.run_shell("cp " + this.shell_quote(icon_abs) + " " + this.shell_quote(dest), "copying NSIS icon")
        return icon_abs
    }

    function nsis_shortcut_target(opts, package_name, windir) {
        if (this.windows_gui_enabled(opts)) {
            local exe = this.windows_exe_launcher_name(opts, package_name)
            if (this.path_exists(GLib.build_filenamev([windir, exe])))
                return exe
        }
        return this.windows_primary_launcher_name(opts, package_name)
    }

    function nsis_create_shortcut_line(link_path, target_rel, has_icon) {
        local target = this.windows_path(target_rel)
        local text = "  CreateShortcut \"" + this.nsis_escape_keep_vars(link_path) + "\" " +
            "\"$INSTDIR\\" + this.nsis_escape(target) + "\""
        if (has_icon)
            text += " \"\" \"$INSTDIR\\app.ico\""
        return text + "\n"
    }

    function write_nsis_script(opts, windir) {
        local package_name = this.package_basename(opts.name)
        local script = GLib.build_filenamev([opts.output_dir, package_name + ".nsi"])
        local installer = this.nsis_installer_name(opts, package_name)
        local source_glob = package_name + "/*"
        local launcher = this.nsis_shortcut_target(opts, package_name, windir)
        local install_dir = this.nsis_install_dir(opts, package_name)
        local level = this.nsis_validate_execution_level(opts.windows.nsis_request_execution_level)
        local start_menu_folder = this.nsis_start_menu_folder(opts)
        local icon_abs = this.maybe_stage_nsis_icon(opts, windir)
        local has_icon = icon_abs != ""
        local has_license = opts.windows.nsis_license != ""

        if (has_license && !this.path_exists(opts.windows.nsis_license))
            this.fail("NSIS license file not found: " + opts.windows.nsis_license)

        local text = "Unicode true\n" +
            "Name \"" + this.nsis_escape(opts.name) + "\"\n" +
            "OutFile \"" + this.nsis_escape(installer) + "\"\n" +
            "InstallDir \"" + this.nsis_escape_keep_vars(install_dir) + "\"\n" +
            "RequestExecutionLevel " + level + "\n"

        if (has_icon) {
            text += "Icon \"" + this.nsis_escape(icon_abs) + "\"\n" +
                    "UninstallIcon \"" + this.nsis_escape(icon_abs) + "\"\n"
        }

        text += "\n"
        if (has_license)
            text += "LicenseData \"" + this.nsis_escape(opts.windows.nsis_license) + "\"\nPage license\n"
        text += "Page directory\nPage instfiles\nUninstPage uninstConfirm\nUninstPage instfiles\n\n"

        text += "Section \"Install\"\n" +
            "  SetOutPath \"$INSTDIR\"\n" +
            "  File /r \"" + this.nsis_escape(source_glob) + "\"\n"

        if (opts.windows.nsis_desktop_shortcut) {
            text += this.nsis_create_shortcut_line(
                "$DESKTOP\\" + this.nsis_escape(opts.name) + ".lnk",
                launcher,
                has_icon
            )
        }

        if (opts.windows.nsis_start_menu_shortcut) {
            text += "  CreateDirectory \"$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\"\n" +
                    this.nsis_create_shortcut_line(
                        "$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\\" + this.nsis_escape(opts.name) + ".lnk",
                        launcher,
                        has_icon
                    ) +
                    "  CreateShortcut \"$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\\Uninstall " + this.nsis_escape(opts.name) + ".lnk\" " +
                    "\"$INSTDIR\\Uninstall.exe\"\n"
        }

        text += "  WriteUninstaller \"$INSTDIR\\Uninstall.exe\"\n"

        if (opts.windows.nsis_uninstall_registry) {
            text += "  WriteRegStr HKCU \"Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + this.nsis_escape(package_name) + "\" \"DisplayName\" \"" + this.nsis_escape(opts.name) + "\"\n" +
                    "  WriteRegStr HKCU \"Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + this.nsis_escape(package_name) + "\" \"UninstallString\" \"$INSTDIR\\Uninstall.exe\"\n" +
                    "  WriteRegStr HKCU \"Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + this.nsis_escape(package_name) + "\" \"InstallLocation\" \"$INSTDIR\"\n" +
                    "  WriteRegStr HKCU \"Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + this.nsis_escape(package_name) + "\" \"DisplayIcon\" \"$INSTDIR\\" + (has_icon ? "app.ico" : launcher) + "\"\n"
        }

        text += "SectionEnd\n\n" +
            "Section \"Uninstall\"\n"

        if (opts.windows.nsis_desktop_shortcut)
            text += "  Delete \"$DESKTOP\\" + this.nsis_escape(opts.name) + ".lnk\"\n"
        if (opts.windows.nsis_start_menu_shortcut) {
            text += "  Delete \"$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\\" + this.nsis_escape(opts.name) + ".lnk\"\n" +
                    "  Delete \"$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\\Uninstall " + this.nsis_escape(opts.name) + ".lnk\"\n" +
                    "  RMDir \"$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\"\n"
        }
        if (opts.windows.nsis_uninstall_registry)
            text += "  DeleteRegKey HKCU \"Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + this.nsis_escape(package_name) + "\"\n"
        text += "  RMDir /r \"$INSTDIR\"\n" +
            "SectionEnd\n"

        this.write_file(script, text)
        return script
    }

}

return { SqgiPkgWindowsNsis = SqgiPkgWindowsNsis }
