// Verify GUI-authored rules with the real staging implementation; no package claim.
local Gio = import("Gio")
local B = import("../../../sqgipkg_lib/build.nut")
local pkg = B.SqgiPkgBuild(), manifest = vargv[0], base_dir = vargv[1], stage = vargv[2]
local value = sqgi.json.parse(Gio.File.new_for_path(manifest).load_contents(null)[0])
foreach (pair in [[value.files, "linux"], [value.windows.files, "windows"]]) {
    foreach (spec in pkg.manifest_files(base_dir, pair[0])) pkg.copy_file_spec(pkg.new_options(), spec, stage + "/" + pair[1])
}
print(sqgi.json.stringify({theme = value.gtk_theme, settings = pkg.gtk_settings_contents(value.gtk_theme, "", "", false), stage = stage}) + "\n")
