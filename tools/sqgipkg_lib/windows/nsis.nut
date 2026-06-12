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

    function nsis_compile_asset_path(path, label) {
        if (path == "") return ""
        local asset_abs = this.abs_path(path)
        if (!this.path_exists(asset_abs)) this.fail(label + " not found: " + path)
        return asset_abs
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

    function nsis_font_file_name(font) {
        return this.basename(this.table_get(font, "path", ""))
    }

    function nsis_font_registry_name(font) {
        return this.table_get(font, "registry_name", "")
    }

    function nsis_font_target_path(font) {
        return "$LOCALAPPDATA\\Microsoft\\Windows\\Fonts\\" + this.nsis_font_file_name(font)
    }

    function nsis_font_broadcast_line() {
        return "  System::Call 'user32::SendMessageTimeoutW(p 0xffff, i 0x001D, p 0, p 0, i 0x0002, i 5000, *p .r0)'\n"
    }

    function nsis_install_fonts_lines(opts) {
        if (opts.windows.fonts.len() == 0) return ""

        local text = "  CreateDirectory \"$LOCALAPPDATA\\Microsoft\\Windows\\Fonts\"\n"
        foreach (font in opts.windows.fonts) {
            local file_name = this.nsis_font_file_name(font)
            local registry_name = this.nsis_font_registry_name(font)
            if (file_name == "" || registry_name == "") continue

            local target = this.nsis_font_target_path(font)
            text += "  CopyFiles /SILENT \"$INSTDIR\\share\\fonts\\" + this.nsis_escape(file_name) +
                "\" \"" + this.nsis_escape_keep_vars(target) + "\"\n" +
                "  WriteRegStr HKCU \"Software\\Microsoft\\Windows NT\\CurrentVersion\\Fonts\" \"" +
                this.nsis_escape(registry_name) + "\" \"" + this.nsis_escape_keep_vars(target) + "\"\n" +
                "  System::Call 'gdi32::AddFontResourceW(w \"" + this.nsis_escape_keep_vars(target) + "\") i .r0'\n"
        }
        text += this.nsis_font_broadcast_line()
        return text
    }

    function nsis_uninstall_fonts_lines(opts) {
        if (opts.windows.fonts.len() == 0) return ""

        local text = ""
        foreach (font in opts.windows.fonts) {
            local file_name = this.nsis_font_file_name(font)
            local registry_name = this.nsis_font_registry_name(font)
            if (file_name == "" || registry_name == "") continue

            local target = this.nsis_font_target_path(font)
            text += "  System::Call 'gdi32::RemoveFontResourceW(w \"" + this.nsis_escape_keep_vars(target) + "\") i .r0'\n" +
                "  DeleteRegValue HKCU \"Software\\Microsoft\\Windows NT\\CurrentVersion\\Fonts\" \"" +
                this.nsis_escape(registry_name) + "\"\n" +
                "  Delete \"" + this.nsis_escape_keep_vars(target) + "\"\n"
        }
        text += this.nsis_font_broadcast_line()
        return text
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
        local license_abs = this.nsis_compile_asset_path(opts.windows.nsis_license, "NSIS license file")
        local header_image_abs = this.nsis_compile_asset_path(opts.windows.nsis_header_image, "NSIS header image")
        local welcome_image_abs = this.nsis_compile_asset_path(opts.windows.nsis_welcome_image, "NSIS welcome image")
        local has_license = license_abs != ""

        local text = "Unicode true\n" +
            "!include MUI2.nsh\n" +
            "Name \"" + this.nsis_escape(opts.name) + "\"\n" +
            "OutFile \"" + this.nsis_escape(installer) + "\"\n" +
            "InstallDir \"" + this.nsis_escape_keep_vars(install_dir) + "\"\n" +
            "RequestExecutionLevel " + level + "\n" +
            "!define MUI_ABORTWARNING\n"

        if (has_icon)
            text += "!define MUI_ICON \"" + this.nsis_escape(icon_abs) + "\"\n" +
                    "!define MUI_UNICON \"" + this.nsis_escape(icon_abs) + "\"\n"
        if (header_image_abs != "")
            text += "!define MUI_HEADERIMAGE\n" +
                    "!define MUI_HEADERIMAGE_BITMAP \"" + this.nsis_escape(header_image_abs) + "\"\n"
        if (welcome_image_abs != "")
            text += "!define MUI_WELCOMEFINISHPAGE_BITMAP \"" + this.nsis_escape(welcome_image_abs) + "\"\n"

        text += "\n" +
            "!insertmacro MUI_PAGE_WELCOME\n"
        if (has_license)
            text += "!insertmacro MUI_PAGE_LICENSE \"" + this.nsis_escape(license_abs) + "\"\n"
        text += "!insertmacro MUI_PAGE_DIRECTORY\n" +
            "!insertmacro MUI_PAGE_INSTFILES\n" +
            "!insertmacro MUI_PAGE_FINISH\n" +
            "!insertmacro MUI_UNPAGE_CONFIRM\n" +
            "!insertmacro MUI_UNPAGE_INSTFILES\n" +
            "!insertmacro MUI_LANGUAGE \"English\"\n\n"

        text += "Section \"Install\"\n" +
            "  SetOutPath \"$INSTDIR\"\n" +
            "  File /r \"" + this.nsis_escape(source_glob) + "\"\n"

        text += this.nsis_install_fonts_lines(opts)

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
        text += this.nsis_uninstall_fonts_lines(opts)
        text += "  RMDir /r \"$INSTDIR\"\n" +
            "SectionEnd\n"

        this.write_file(script, text)
        return script
    }

}

return { SqgiPkgWindowsNsis = SqgiPkgWindowsNsis }
