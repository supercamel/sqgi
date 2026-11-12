local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("staging.nut")

class SqgiPkgWindowsNsis extends Base.SqgiPkgWindowsStaging {
    function nsis_escape(value) {
        this.nsis_validate_string(value)
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
        this.nsis_validate_string(value)
        local out = ""
        for (local i = 0; i < value.len(); i++) {
            local ch = value.slice(i, i + 1)
            if (ch == "\"") out += "$\\\""
            else out += ch
        }
        return out
    }

    function nsis_validate_string(value) {
        if (typeof(value) != "string") this.fail("NSIS values must be strings")
        for (local i = 0; i < value.len(); i++) if (value[i] == 0 || value[i] == 10 || value[i] == 13)
            this.fail("NSIS values cannot contain NUL or newline characters")
    }

    function nsis_payload(root, hash_files) {
        local files = [], directories = [], seen = {}, visit
        visit = function(path, prefix) {
            foreach (entry in this.children(path)) {
                local name = entry.name, lower = GLib.utf8_casefold(name, -1), relative = prefix + name
                if (entry.symlink || name == "" || name[name.len() - 1] == '.' || name[name.len() - 1] == ' ' ||
                    regexp("^(con|prn|aux|nul|com[1-9]|lpt[1-9])(\\..*)?$").match(lower))
                    this.fail("Unsupported Windows installer payload path: " + relative)
                for (local i = 0; i < name.len(); i++) if ((name[i] & 255) < 32 || "<>:\\|?*\"".find(name.slice(i, i + 1)) != null)
                    this.fail("Unsupported Windows installer payload path: " + relative)
                local key = GLib.utf8_casefold(relative, -1)
                if (key in seen || key == "uninstall.exe") this.fail("Conflicting Windows installer payload path: " + relative)
                seen[key] <- true
                if (entry.directory) { directories.push(relative); visit(entry.path, relative + "/") }
                else {
                    if (Gio.File.new_for_path(entry.path).query_file_type(Gio.FileQueryInfoFlags.nofollow_symlinks, null) != Gio.FileType.regular)
                        this.fail("Installer payload must contain regular files: " + relative)
                    files.push({ path = relative, source = entry.path, sha256 = hash_files ? this.file_sha256(entry.path) : null })
                }
            }
        }.bindenv(this)
        visit(root, "")
        local identity = []; foreach (entry in files) identity.push([entry.path, entry.sha256])
        return { files = files, directories = directories,
            sha256 = GLib.compute_checksum_for_data(GLib.ChecksumType.sha256, sqgi.json.stringify([identity, directories])) }
    }

    function nsis_owned_shortcut(link, owner, action) {
        local key = this.nsis_escape(owner), path = this.nsis_escape_keep_vars(link)
        if (action == "install") return "  WriteRegStr HKCU \"" + key + "\" \"" + path + "\" \"$INSTDIR\"\n"
        return "  ReadRegStr $0 HKCU \"" + key + "\" \"" + path + "\"\n" +
            "  ${If} $0 == $INSTDIR\n  Delete \"" + path + "\"\n" +
            "  DeleteRegValue HKCU \"" + key + "\" \"" + path + "\"\n  ${EndIf}\n"
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
        this.copy_path(icon_abs, dest)
        return icon_abs
    }

    function nsis_compile_asset_path(path, label) {
        if (path == "") return ""
        local asset_abs = this.abs_path(path)
        if (!this.path_exists(asset_abs)) this.fail(label + " not found: " + path)
        return asset_abs
    }

    function nsis_shortcut_target(opts, package_name, windir) {
        if (this.windows_console_enabled(opts)) {
            local console = package_name + "-console.exe"
            if (this.path_exists(GLib.build_filenamev([windir, console]))) return console
        }
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
            text += "  WriteRegStr HKCU \"Software\\sqgipkg\\FontInstallations\" \"" + this.nsis_escape(registry_name) + "\" \"$INSTDIR\"\n"
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
            text += "  ReadRegStr $0 HKCU \"Software\\sqgipkg\\FontInstallations\" \"" + this.nsis_escape(registry_name) + "\"\n" +
                "  ${If} $0 == $INSTDIR\n" +
                "  System::Call 'gdi32::RemoveFontResourceW(w \"" + this.nsis_escape_keep_vars(target) + "\") i .r0'\n" +
                "  DeleteRegValue HKCU \"Software\\Microsoft\\Windows NT\\CurrentVersion\\Fonts\" \"" +
                this.nsis_escape(registry_name) + "\"\n" +
                "  Delete \"" + this.nsis_escape_keep_vars(target) + "\"\n" +
                "  DeleteRegValue HKCU \"Software\\sqgipkg\\FontInstallations\" \"" + this.nsis_escape(registry_name) + "\"\n" +
                "  ${EndIf}\n"
        }
        text += "  DeleteRegKey /ifempty HKCU \"Software\\sqgipkg\\FontInstallations\"\n"
        text += this.nsis_font_broadcast_line()
        return text
    }

    function write_nsis_script(opts, windir) {
        local package_name = this.package_basename(opts.name)
        local script = GLib.build_filenamev([opts.output_dir, package_name + ".nsi"])
        local installer = this.nsis_installer_name(opts, package_name)
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
        local payload = this.nsis_payload(windir, opts.windows.nsis_side_by_side)
        local build_id = (opts.windows.nsis_version == "" ? "" : opts.windows.nsis_version + "-") + payload.sha256.slice(0, 12)
        if (opts.windows.nsis_side_by_side && opts.windows.nsis_install_dir == "") install_dir += "\\" + build_id
        local owner = "Software\\sqgipkg\\Installations\\" + (opts.app_id != "" ? opts.app_id : package_name)
        local uninstall = "Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\" + package_name +
            (opts.windows.nsis_side_by_side ? "-" + build_id : "")

        // Stable Windows NSIS distributions may contain only x86 stubs. A
        // 32-bit installer can deploy our x86_64 payload on 64-bit Windows.
        // Prefer a native bootstrap where available, but do not require one.
        local text = "!if /FileExists \"${NSISDIR}/Stubs/zlib-amd64-unicode\"\n" +
            "Target amd64-unicode\n!else\nTarget x86-unicode\n!endif\nUnicode true\n" +
            "!include MUI2.nsh\n!include x64.nsh\n" +
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

        foreach (init in [".onInit", "un.onInit"]) {
            text += "Function " + init + "\n" +
                "  ${IfNot} ${RunningX64}\n" +
                "    MessageBox MB_OK|MB_ICONSTOP \"This application requires 64-bit Windows.\"\n" +
                "    Abort\n" +
                "  ${EndIf}\n" +
                "  SetShellVarContext current\n" +
                "  SetRegView 64\n" +
                "FunctionEnd\n\n"
        }

        text += "Section \"Install\"\n"
        if (opts.windows.nsis_side_by_side) text +=
            "  FindFirst $0 $1 \"$INSTDIR\\*\"\ncheck_directory:\n" +
            "  StrCmp $1 \"\" directory_ready\n  StrCmp $1 \".\" next_entry\n  StrCmp $1 \"..\" next_entry\n" +
            "  FindClose $0\n  MessageBox MB_OK|MB_ICONSTOP \"Choose an empty installation folder.\" /SD IDOK\n" +
            "  SetErrorLevel 2\n  Abort\nnext_entry:\n  FindNext $0 $1\n  Goto check_directory\n" +
            "directory_ready:\n  FindClose $0\n"
        foreach (directory in payload.directories)
            text += "  CreateDirectory \"$INSTDIR\\" + this.nsis_escape(this.windows_path(directory)) + "\"\n"
        foreach (entry in payload.files) {
            local parent = GLib.path_get_dirname(entry.path)
            local source = this.abs_path(entry.source)
            // Native NSIS splits its source patterns using Windows separators.
            if (this.host_windows()) source = this.windows_path(source)
            text += "  SetOutPath \"$INSTDIR" + (parent == "." ? "" : "\\" + this.nsis_escape(this.windows_path(parent))) + "\"\n" +
                "  File \"/oname=" + this.nsis_escape(GLib.path_get_basename(entry.path)) + "\" \"" +
                this.nsis_escape_keep_vars(source) + "\"\n"
        }
        text += "  SetOutPath \"$INSTDIR\"\n"

        text += this.nsis_install_fonts_lines(opts)

        if (opts.windows.nsis_desktop_shortcut) {
            text += this.nsis_create_shortcut_line(
                "$DESKTOP\\" + this.nsis_escape(opts.name) + ".lnk",
                launcher,
                has_icon
            )
            text += this.nsis_owned_shortcut("$DESKTOP\\" + this.nsis_escape(opts.name) + ".lnk", owner, "install")
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
            text += this.nsis_owned_shortcut("$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\\" + this.nsis_escape(opts.name) + ".lnk", owner, "install")
            text += this.nsis_owned_shortcut("$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\\Uninstall " + this.nsis_escape(opts.name) + ".lnk", owner, "install")
        }

        if (opts.windows.nsis_autostart) {
            text += "  CreateDirectory \"$SMSTARTUP\"\n" +
                    this.nsis_create_shortcut_line(
                        "$SMSTARTUP\\" + this.nsis_escape(opts.name) + ".lnk",
                        launcher,
                        has_icon
                    )
            text += this.nsis_owned_shortcut("$SMSTARTUP\\" + this.nsis_escape(opts.name) + ".lnk", owner, "install")
        }

        text += "  WriteUninstaller \"$INSTDIR\\Uninstall.exe\"\n"

        if (opts.windows.nsis_uninstall_registry) {
            local key = this.nsis_escape(uninstall)
            text += "  WriteRegStr HKCU \"" + key + "\" \"DisplayName\" \"" + this.nsis_escape(opts.name) + "\"\n" +
                    "  WriteRegStr HKCU \"" + key + "\" \"DisplayVersion\" \"" + this.nsis_escape(opts.windows.nsis_version) + "\"\n" +
                    "  WriteRegStr HKCU \"" + key + "\" \"UninstallString\" '$\\\"$INSTDIR\\Uninstall.exe$\\\"'\n" +
                    "  WriteRegStr HKCU \"" + key + "\" \"InstallLocation\" \"$INSTDIR\"\n" +
                    "  WriteRegStr HKCU \"" + key + "\" \"DisplayIcon\" \"$INSTDIR\\" + this.nsis_escape(has_icon ? "app.ico" : launcher) + "\"\n"
        }

        text += "SectionEnd\n\n" +
            "Section \"Uninstall\"\n"

        if (opts.windows.nsis_desktop_shortcut)
            text += this.nsis_owned_shortcut("$DESKTOP\\" + this.nsis_escape(opts.name) + ".lnk", owner, "uninstall")
        if (opts.windows.nsis_start_menu_shortcut) {
            text += this.nsis_owned_shortcut("$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\\" + this.nsis_escape(opts.name) + ".lnk", owner, "uninstall") +
                    this.nsis_owned_shortcut("$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\\Uninstall " + this.nsis_escape(opts.name) + ".lnk", owner, "uninstall") +
                    "  RMDir \"$SMPROGRAMS\\" + this.nsis_escape(start_menu_folder) + "\"\n"
        }
        if (opts.windows.nsis_autostart)
            text += this.nsis_owned_shortcut("$SMSTARTUP\\" + this.nsis_escape(opts.name) + ".lnk", owner, "uninstall")
        if (opts.windows.nsis_uninstall_registry)
            text += "  ReadRegStr $0 HKCU \"" + this.nsis_escape(uninstall) + "\" \"InstallLocation\"\n" +
                "  ${If} $0 == $INSTDIR\n  DeleteRegKey HKCU \"" + this.nsis_escape(uninstall) + "\"\n  ${EndIf}\n"
        text += "  DeleteRegKey /ifempty HKCU \"" + this.nsis_escape(owner) + "\"\n"
        text += this.nsis_uninstall_fonts_lines(opts)
        foreach (entry in payload.files) text += "  Delete \"$INSTDIR\\" + this.nsis_escape(this.windows_path(entry.path)) + "\"\n"
        text += "  Delete \"$INSTDIR\\Uninstall.exe\"\n"
        for (local i = payload.directories.len() - 1; i >= 0; i--)
            text += "  RMDir \"$INSTDIR\\" + this.nsis_escape(this.windows_path(payload.directories[i])) + "\"\n"
        text += "  RMDir \"$INSTDIR\"\nSectionEnd\n"

        // Explicit UTF-8 also preserves non-ASCII paths with native makensis.
        this.write_file(script, "\xEF\xBB\xBF" + text)
        return script
    }

}

return { SqgiPkgWindowsNsis = SqgiPkgWindowsNsis }
