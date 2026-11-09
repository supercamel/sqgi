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
    require(D.pretty(O.read(manifest).selection) == D.pretty(O.normalize(selection)), "selection round trip")
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
capabilities.targets.extend(["android-apk", "android-aab"])
local mobile = O.write(seed, O.normalize({ x86_64 = false, aarch64 = false, windows = false, format = "installer", android_arm64 = true }), capabilities)
mobile.app_id <- "org.sqgi.gui.matrix"; mobile.compile_scripts <- false
mobile.platforms.android.repository <- "https://packages.example.test"
mobile.platforms.android.module_set <- "custom-r1"
mobile.platforms.android.namespaces <- ["Gtk-4.0"]
for (local mask = 1; mask < 32; mask++) {
    local choice = { x86_64 = (mask & 1) != 0, aarch64 = (mask & 2) != 0, windows = (mask & 4) != 0, format = "directory",
        android_arm64 = (mask & 8) != 0, android_x86_64 = (mask & 16) != 0, android_format = mask % 2 ? "apk" : "aab" }
    local manifest = O.write(mobile, choice, capabilities), expected = []
    require(manifest.platforms.android.repository == mobile.platforms.android.repository && manifest.platforms.android.module_set == "custom-r1", "Android SDK settings retained across target edits")
    local actual = O.read(manifest).selection
    // Formats of disabled platforms are retained, and do not affect outputs.
    if (!choice.windows) actual.format = choice.format
    if (!choice.android_arm64 && !choice.android_x86_64) actual.android_format = choice.android_format
    require(D.pretty(actual) == D.pretty(choice), "five-architecture selection round trip: " + mask)
    foreach (arch in O.arches(choice)) expected.push("appimage:" + arch)
    if (choice.windows) expected.push("win-dir:x86_64")
    if (choice.android_format == "aab" && (choice.android_arm64 || choice.android_x86_64))
        expected.push("android-aab:" + (choice.android_arm64 && choice.android_x86_64 ? "multi" : choice.android_arm64 ? "arm64-v8a" : "x86_64"))
    else {
        if (choice.android_arm64) expected.push("android-apk:arm64-v8a")
        if (choice.android_x86_64) expected.push("android-apk:x86_64")
    }
    records.push({ manifest = manifest, expected = expected })
}
Gio.File.new_for_path(vargv[0]).replace_contents(D.pretty(records), null, false, Gio.FileCreateFlags.none, null)
print("PASS EDIT-output-matrix\n")
