local R = import("../src/runtime_choice.nut")
local D = import("../src/document.nut")
local Gio = import("Gio")
function require(ok, message) { if (!ok) throw "FAIL: " + message }
local seed = { schema_version = 2, entry = "main.nut", target = "win-dir" }
local local_source = R.write(seed, "local", vargv[1])
require(R.read(local_source).mode == "local", "local source selection")
local revision = R.write(local_source, "revision", "v0.1.7-alpha")
require(!("source" in revision.runtime) && revision.runtime.sqgi == "v0.1.7-alpha", "changing selector removes only old source")
require(D.pretty(seed) == D.pretty(R.write(revision, "existing", "")), "simple recipe removal")
local custom = D.copy_value(local_source); custom.runtime.jit <- false; custom.future <- { keep = [false, 7] }
local changed = R.write(custom, "revision", "a-commit")
require(changed.runtime.jit == false && D.pretty(changed.future) == D.pretty(custom.future), "preserve explicit override and unknown data")
local document = D.Document(D.pretty(custom)), original = document.text
document.set([], R.write(custom, "local", vargv[1]))
require(document.text == original && !document.history.len(), "no-change Apply preserves history")
document.set([], changed); document.undo()
require(document.text == original, "source choice is one undoable edit")
foreach (input in [{ runtime = null }, { runtime = {} }, { runtime = { source = "here", sqgi = "tag" } },
        { runtime = { source = "here", future = true } }, { sqgi_source = { dir = "here" } }]) {
    local before = D.pretty(input), rejected = false
    require(R.read(input).mode == null, "complex declaration stays advanced")
    try { R.write(input, "local", "elsewhere") } catch (_) { rejected = true }
    require(rejected && D.pretty(input) == before, "refused edit preserves document")
}
foreach (mode in ["local", "revision", "existing"]) {
    local rejected = false
    try { R.write(custom, mode, "") } catch (_) { rejected = true }
    require(rejected, "empty source or discarded explicit override rejected")
}
require(R.read({ entry = { type = "native", linux = "app" } }).mode == "native", "native app needs no SQGI runtime")
Gio.File.new_for_path(vargv[0]).replace_contents(D.pretty([local_source, revision]), null, false, Gio.FileCreateFlags.none, null)
print("PASS EDIT-runtime-choice\n")
