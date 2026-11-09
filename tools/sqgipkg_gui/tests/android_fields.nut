local D = import("../src/document.nut"), A = import("../src/android.nut")
function require(ok, message) { if (!ok) throw message }
local original = { target="all", future={keep=true}, entry={type="native",android={project="app",library="libapp.so",symbol="start"}},
    platforms={linux={architectures=["x86_64"]},android={enabled=false,sdk_path="private-sdk",runner="adb",architectures=["arm64-v8a"]}} }
local snapshot = D.pretty(original)
local changed = A.write(original, {min_sdk="31",version_code="7",version_name="0.7",namespaces="Gtk-4.0, MyModule-1.0",variant="release"})
local resources = A.write(changed, {permissions="android.permission.INTERNET, android.permission.CAMERA",icon="art/android.svg"})
require(resources.platforms.android.permissions.len() == 2 && resources.platforms.android.icon == "art/android.svg", "Android permissions and icon are authored")
require(!("icon" in A.write(resources, {icon=""}).platforms.android), "Blank Android icon restores shared inheritance")
require(D.pretty(original) == snapshot, "Android edits must not mutate the input")
require(changed.platforms.android.version_code == 7 && changed.platforms.android.namespaces.len() == 2, "Android typed values")
require(!changed.platforms.android.enabled && changed.platforms.android.sdk_path == "private-sdk" && changed.platforms.android.runner == "adb", "Advanced Android fields preserved")
require(D.pretty(changed.entry) == D.pretty(original.entry) && changed.future.keep && changed.platforms.linux.architectures[0] == "x86_64", "Other targets and native entry preserved")
foreach (fields in [{min_sdk="30"},{version_code="0"},{version_code="2147483647"},{namespaces="../Gtk-4.0"},{sdk=""},
                   {permissions="CAMERA"},{permissions="android.permission.CAMERA,android.permission.CAMERA"}]) {
    local rejected = false
    try { A.write(original, fields) } catch (_) { rejected = true }
    require(rejected && D.pretty(original) == snapshot, "Invalid Android edit must be atomic")
}
local source_runtime = A.write(changed, {runtime="source"})
require(source_runtime.platforms.android.runtime == "source", "Explicit Android source runtime")
local automatic_runtime = A.write(source_runtime, {runtime="auto"})
require(!("runtime" in automatic_runtime.platforms.android), "Automatic Android runtime removes the override")
require(D.pretty(automatic_runtime.entry) == D.pretty(original.entry), "Runtime choice preserves native entry")
local R = import("../src/relocation.nut")
local GLib = import("GLib")
local original_dir = GLib.canonicalize_filename("original", GLib.get_tmp_dir())
local moved_dir = GLib.canonicalize_filename("moved", GLib.get_tmp_dir())
function original_path(relative) { return GLib.canonicalize_filename(relative, original_dir) }
local portable = { entry={type="sqgi",script="src/app/main.nut",source_root="src"},
    platforms={android={sdk_path="sdk",inspection_root="inspection",module_set="modules-r1",icon="android.svg"}} }
local moved = R.relocate(portable, original_dir, moved_dir)
require(moved.entry.source_root == original_path("src") && moved.entry.script == original_path("src/app/main.nut"), "Source root and script relocate together")
require(moved.platforms.android.sdk_path == original_path("sdk") && moved.platforms.android.inspection_root == original_path("inspection") && moved.platforms.android.module_set == "modules-r1", "Android host paths relocate without changing release identifiers")
require(moved.platforms.android.icon == original_path("android.svg"), "Android icon path relocates")
local native_entry = {entry=D.copy_value(original.entry)}
require(D.pretty(R.relocate(native_entry, original_dir, moved_dir).entry.android) == D.pretty(original.entry.android), "Android entry symbols and SONAME remain literal")
print("PASS EDIT-android-settings\n")
