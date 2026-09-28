local O = import("../src/outputs.nut")
local D = import("../src/document.nut")
local Gio = import("Gio")
function require(ok, message) { if (!ok) throw "FAIL: " + message }
local capabilities = { targets = ["appimage", "appimage-all", "all", "win-nsis", "win-dir"] }
local seed = { schema_version = 2, entry = "main.nut", output = "dist" }
local defaults = O.defaults(capabilities), initial = O.write(seed, defaults, capabilities)
require(initial.target == "all" && initial.platforms.linux.architectures.len() == 2 && initial.platforms.windows.format == "installer", "three default outputs")
local records = []
for (local mask = 1; mask < 8; mask++) {
    local selection = { x86_64 = (mask & 1) != 0, aarch64 = (mask & 2) != 0, windows = (mask & 4) != 0, format = "installer" }
    local manifest = O.write(initial, selection, capabilities), expected = []
    foreach (arch in O.arches(selection)) expected.push("appimage:" + arch)
    if (selection.windows) expected.push("win-nsis:x86_64")
    records.push({ manifest = manifest, expected = expected })
    require(D.pretty(O.read(manifest).selection) == D.pretty(selection), "selection round trip")
}
local empty = { x86_64 = false, aarch64 = false, windows = false, format = "installer" }, failed = false
try { O.write(initial, empty, capabilities) } catch (e) { failed = e.tostring().find("at least one") != null }
require(failed, "empty selection rejected")
local alias = { target = "all", appimage_arch = "arm64", future = { value = false },
    platforms = { linux = { architectures = ["amd64", "arm64"], baseline = "ubuntu-22.04" }, windows = { format = "installer" } } }
require(D.pretty(O.write(alias, defaults, capabilities)) == D.pretty(alias), "no-change apply preserves aliases and unknown data")
local changed = O.write(alias, { x86_64 = true, aarch64 = true, windows = false, format = "installer" }, capabilities)
require(changed.platforms.linux.baseline == "ubuntu-22.04" && changed.future.value == false && changed.appimage_arch == "arm64", "unrelated data preserved")
local legacy = { target = "all", linux_arches = [{ arch = "aarch64", build = ["custom command"] }] }
require(O.read(legacy).selection == null, "custom recipe matrix is not flattened")
local windows = O.defaults({ targets = ["win-dir", "win-nsis"] })
require(!windows.x86_64 && !windows.aarch64 && windows.windows && windows.format == "installer", "Windows host default")
local directory = O.write(initial, { x86_64 = true, aarch64 = true, windows = true, format = "directory" }, capabilities)
records.push({ manifest = directory, expected = ["appimage:x86_64", "appimage:aarch64", "win-dir:x86_64"] })
Gio.File.new_for_path(vargv[0]).replace_contents(D.pretty(records), null, false, Gio.FileCreateFlags.none, null)
print("PASS EDIT-output-matrix\n")
