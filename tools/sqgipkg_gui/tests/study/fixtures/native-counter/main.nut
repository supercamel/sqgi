local StudyNative = import("StudyNative", "1.0")
local GLib = import("GLib")
local system = import("system")
local results = [], failures = 0
function check(name, ok, observed) {
    results.push({ name = name, ok = ok, observed = observed })
    if (!ok) failures++
    print((ok ? "PASS " : "FAIL ") + name + ": " + observed.tostring() + "\n")
}
local expected_revision = GLib.getenv("SQGI_STUDY_EXPECT_REVISION")
expected_revision = expected_revision == null ? 42 : expected_revision.tointeger()
print("STUDY_ENV " + sqgi.json.stringify({ architecture = system.cpu.arch,
    packaged = system.package.packaged, runtime = system.runtime,
    typelib_path = GLib.getenv("GI_TYPELIB_PATH"),
    library_path = GLib.getenv("LD_LIBRARY_PATH"), expected_revision = expected_revision }) + "\n")
try {
    local counter = StudyNative.Counter.new()
    local changed = []
    counter.connect("changed", function(value) { changed.push(value) })
    check("initial property", counter.value == 40, counter.value)
    local result = counter.add(2)
    check("method result", result == 42, result)
    check("updated property", counter.value == 42, counter.value)
    check("signal count", changed.len() == 1, changed.len())
    check("signal payload", changed.len() == 1 && changed[0] == 42,
        changed.len() == 0 ? "missing" : changed[0])
    counter.value = 7
    check("writable property", counter.value == 7, counter.value)
    local revision = counter.get_revision()
    check("compiled revision", revision == expected_revision, revision)
} catch (e) { check("GI invocation", false, e.tostring()) }
print("STUDY_RESULT " + sqgi.json.stringify({ failures = failures, checks = results }) + "\n")
if (failures) throw "Native counter failed " + failures + " checks"
