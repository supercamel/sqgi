local B = import("../src/backend.nut")
local GLib = import("GLib")
local D = import("../src/document.nut")
local loop = GLib.MainLoop.new(null, false)
local failure = 0
async function exercise() {
    local job = B.Inspection()
    local result = await job.run("explain", "{\"entry\":\"main.nut\",\"name\":\"Async café\"}", vargv[0])
    if (!result.ok || result.configurations[0].name != "Async café") throw "CLI inspection did not resolve the unsaved manifest"
    local rejected = false
    try { await job.run("build", "{}", vargv[0]) } catch (_) { rejected = true }
    if (!rejected) throw "Backend allowed a mutating operation"
    local pending = job.run("explain", "{}", vargv[0])
    job.cancel(); rejected = false
    try { await pending } catch (_) { rejected = true }
    if (!rejected || job.busy || job.child != null) throw "Cancellation did not settle and reap the child"
    print("PASS PKG-cli-boundary\nPASS PKG-async-inspection\n")
}
exercise().then(function(_) { loop.quit() }).catch(function(e) { failure = 1; print("FAIL: " + e + "\n"); loop.quit() })
loop.run()
return failure
