local N = import("../src/native_application.nut")
local D = import("../src/document.nut")
function require(ok, message) { if (!ok) throw message }
local value = { schema_version = 2, entry = { type = "native", project = "app", executable = "hello" },
    native = [{ name = "dependency", dir = "lib", build_system = "meson" },
        { name = "app", dir = ".", build_system = "meson", options = { feature = "custom" }, install = ["custom hook"] }],
    features = ["gtk4"], future = { keep = [1, "two"] } }
local original = D.pretty(value)
local updated = N.write(value, "src/hello", "source", "cmake")
require(D.pretty(value) == original, "native controls mutated their input")
require(updated.entry.executable == "src/hello" && updated.native[1].build_system == "cmake" && updated.native[1].dir == "source", "selected application was not edited")
require(D.pretty(updated.native[0]) == D.pretty(value.native[0]), "dependency recipe changed")
require(D.pretty(updated.native[1].options) == D.pretty(value.native[1].options) &&
    D.pretty(updated.native[1].install) == D.pretty(value.native[1].install) &&
    D.pretty(updated.future) == D.pretty(value.future), "custom native settings lost")
foreach (bad in ["", "../hello", "/hello", "C:\\hello.exe", "dir/../hello"]) {
    local failed = false
    try { N.write(value, bad, ".", "meson") } catch (_) { failed = true }
    require(failed, "unsafe or empty executable accepted")
}
local custom = D.copy_value(value); custom.entry <- { type = "native", linux = "legacy/hello" }
require(N.read(custom) == null, "legacy explicit entry should stay in full editor")
local duplicate = D.copy_value(value); duplicate.native.push(D.copy_value(duplicate.native[1]))
require(N.read(duplicate) == null, "ambiguous project should stay in full editor")
print("PASS EDIT-native-application-preservation\n")
