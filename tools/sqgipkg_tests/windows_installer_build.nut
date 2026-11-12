local pkg = import("../sqgipkg_lib/main.nut").SqgiPkg([])
try {
    local opts = pkg.new_options()
    opts.name = "Installer Test"; opts.app_id = "org.sqgi.test.installer"
    opts.target = "win-nsis"; opts.output_dir = vargv[1]
    local config = sqgi.json.parse(pkg.read_file(vargv[2]))
    pkg.validate_manifest_schema(config, "nsis_options", "windows.nsis_options", true)
    pkg.apply_nsis_options_manifest(opts, import("GLib").path_get_dirname(vargv[2]), config)
    local font = vargv[0] + "/share/fonts/InstallerTest.ttf"
    if (pkg.path_exists(font)) opts.windows.fonts = [{ path = font, registry_name = "Installer Test (TrueType)" }]
    local script = pkg.write_nsis_script(opts, vargv[0])
    if (vargv.len() < 4) pkg.run_process(["makensis", "-V2", script], "NSIS test installer", opts.output_dir)
    return 0
} catch (error) { print("NSIS test build: " + error.tostring() + "\n"); return 1 }
