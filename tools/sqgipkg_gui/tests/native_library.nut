local L = import("../src/native_library.nut")
local D = import("../src/document.nut")
function require(ok, message) { if (!ok) throw message }
local value = { entry = { type = "native", project = "app", executable = "hello" },
    native = [{ name = "app", dir = ".", build_system = "meson" }], future = { keep = true } }
local fields = { name = "serial", dir = "native", build_system = "meson", introspection = true,
    ns = "GSerial", version = "1.0", library = "gserial-1.0" }
local before = D.pretty(value), added = L.write(value, null, fields)
require(D.pretty(value) == before, "input mutated")
require(added.native[0].name == "serial" && added.native[1].name == "app", "dependency must precede application")
added.native[0].options <- { custom = "keep" }; added.native[0].install <- ["custom hook"]
added.native[0].libraries <- ["custom.dll"]; added.native[0].future <- { deep = [1, false] }
fields.ns = "Serial"; local updated = L.write(added, 0, fields)
require(updated.native[0].gi.namespace == "Serial", "GI name not changed")
foreach (key in ["options", "install", "libraries", "future"])
    require(D.pretty(updated.native[0][key]) == D.pretty(added.native[0][key]), "recipe override lost: " + key)
require(D.pretty(updated.native[1]) == D.pretty(value.native[0]) && updated.future.keep, "unrelated data changed")
local removed = L.remove(updated, 0)
require(removed.native.len() == 1 && removed.native[0].name == "app", "wrong recipe removed")
local implicit = { native = [{ dir = "native", build_system = "meson", gi = null }] }
require(D.pretty(L.write(implicit, 0, L.read(implicit.native[0]))) == D.pretty(implicit), "no-change apply authored omitted values")
foreach (invalid in ["app", "serial", "serial-gi-host", "sqgi", "../outside"]) {
    local bad = clone fields; bad.name = invalid; local rejected = false
    try { L.write(added, null, bad) } catch (_) { rejected = true }
    require(rejected, "invalid/duplicate name accepted: " + invalid)
}
foreach (key in ["dir", "name", "ns", "version", "library"]) {
    local bad = clone fields; bad[key] = ""; local rejected = false
    try { L.write(value, null, bad) } catch (_) { rejected = true }
    require(rejected, "empty field accepted: " + key)
}
local bad = clone fields; bad.build_system = "cmake"; local rejected = false
try { L.write(value, null, bad) } catch (_) { rejected = true }
require(rejected, "CMake host GI accepted")
rejected = false; try { L.remove(value, 0) } catch (_) { rejected = true }
require(rejected, "application removed as a library")
foreach (custom in [{ dir = "native", build_system = "meson", repo = "url" },
    { dir = "native", build_system = "meson", gi = { strategy = "unknown" } },
    { dir = "native", build = ["custom"] }]) require(L.read(custom) == null, "custom recipe should retain Advanced route")
print("PASS EDIT-native-library-preservation\n")
local git_fields = clone fields; git_fields.source <- "git"; git_fields.repo <- "/local/repository"; git_fields.ref <- "0123456789012345678901234567890123456789"; git_fields.dir = ""
local pinned = L.write(value, null, git_fields)
require(!("dir" in pinned.native[0]) && pinned.native[0].repo == git_fields.repo, "managed checkout omits source dir")
require(D.pretty(L.write(pinned, 0, L.read(pinned.native[0]))) == D.pretty(pinned), "pinned recipe roundtrip")
pinned.native[0].options <- { keep = true }; pinned.native[0].dir <- "private-checkout"
require(L.write(pinned, 0, L.read(pinned.native[0])).native[0].options.keep, "pinned overrides retained")
foreach (revision in ["main", "v1.0", "1234567", "g123456789012345678901234567890123456789"]) {
    local invalid = clone git_fields; invalid.ref = revision; local denied = false
    try { L.write(value, null, invalid) } catch (_) { denied = true }
    require(denied, "non-pinned revision accepted")
}
local local_fields = clone fields; local_fields.source <- "local"
local switched = L.write(pinned, 0, local_fields)
require(!("repo" in switched.native[0]) && !("ref" in switched.native[0]) && switched.native[0].options.keep, "source switching preserves unrelated options")
print("PASS EDIT-native-git\n")

local unnamed_git = clone git_fields; unnamed_git.name = ""; rejected = false
try { L.write(pinned, 0, unnamed_git) } catch (_) { rejected = true }
require(rejected, "Git checkout requires an explicit name")
local original_source = D.copy_value(pinned)
local alternate = L.read(pinned.native[0]); alternate.linux_package = "gserial"; alternate.windows_package = "gserial"
local prebuilt = L.write(pinned, 0, alternate)
require(prebuilt.native[0].repo == pinned.native[0].repo && prebuilt.native[0].ref == pinned.native[0].ref, "Linux package must preserve Git source")
require(prebuilt.native[0].options.keep, "Linux package must preserve recipe options")
alternate = L.read(prebuilt.native[0]); alternate.linux_package = ""
local restored = L.write(prebuilt, 0, alternate)
require(!("linux_package" in restored.native[0]) && restored.native[0].windows_package == "gserial", "clearing Linux replacement preserves Windows")
alternate = L.read(restored.native[0]); alternate.windows_package = ""
require(D.pretty(L.write(restored, 0, alternate)) == D.pretty(original_source), "clearing alternatives restores original source recipe exactly")
print("PASS EDIT-linux-native-source-preservation\n")
