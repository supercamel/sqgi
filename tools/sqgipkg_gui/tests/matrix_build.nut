// C-PKG-04: real dispatch/selection, recording only the final builders.
local Main = import(vargv[0] + "/sqgipkg_lib/main.nut")
function require(ok, message) { if (!ok) throw "FAIL: " + message }
class Recorder extends Main.SqgiPkg {
    built = null
    constructor() { base.constructor([]); built = [] }
    function record(opts) { built.push({ target = opts.target, arch = opts.appimage_arch, output = opts.output_dir }) }
    function build_appimage(opts) { this.record(opts) }
    function build_windows_nsis(opts) { this.record(opts) }
    function build_windows_dir(opts) { this.record(opts) }
}
local pkg = Recorder()
local fixture = { schema_version = 2, entry = "main.nut", target = "appimage-all", output = "dist",
    platforms = { linux = { architectures = ["x86_64", "aarch64"] }, windows = { format = "installer" } } }
foreach (target in ["appimage-all", "all"]) {
    fixture.target = target
    local opts = pkg.new_options(); pkg.apply_manifest_data(opts, fixture, vargv[1]); pkg.apply_project_defaults(opts)
    local before_target = opts.target, before_output = opts.output_dir
    pkg.built.clear(); pkg.build_all(opts)
    require(pkg.built.len() == (target == "all" ? 3 : 2), "exact matrix builder count")
    require(pkg.built[0].target == "appimage" && pkg.built[0].arch == "x86_64", "x86_64 builder")
    require(pkg.built[1].target == "appimage" && pkg.built[1].arch == "aarch64", "AArch64 builder")
    require(pkg.built[0].output != pkg.built[1].output, "distinct architecture output folders")
    if (target == "all") require(pkg.built[2].target == "win-nsis", "NSIS builder")
    require(opts.target == before_target && opts.output_dir == before_output, "matrix dispatch preserves original options")
}
// Exercise actual CLI command dispatch too, with the same recording builders.
local native = pkg.new_options(); native.target = "appimage-all"; native.entry_type = "native"; native.entry_linux = "bin/app"
pkg.validate_options(native) // A Linux-only matrix does not require a Windows entry.
native.entry_linux = ""
local rejected = false
try { pkg.validate_options(native) } catch (e) { rejected = e.tostring().find("entry.linux") != null }
require(rejected, "native Linux matrix needs a Linux entry")
local fallback = pkg.new_options(); fallback.target = "appimage-all"; fallback.appimage_arch = "aarch64"
local plans = pkg.selected_configurations(fallback)
require(plans.len() == 1 && plans[0].target == "appimage" && plans[0].appimage_arch == "aarch64", "unconfigured Linux matrix uses existing default architecture")
pkg.built.clear()
require(pkg.run(["--manifest", vargv[1] + "/matrix.json"]) == 0, "CLI dispatch succeeds")
require(pkg.built.len() == 2, "appimage-all dispatch omits Windows")
print("PASS PKG-matrix-build\n")
