local J = import("../src/jobs.nut"), GLib = import("GLib"), Gio = import("Gio")
local loop = GLib.MainLoop.new(null, false), failure = 0, directory = vargv[0]
local manifest = directory + "/sqgipkg.json"
Gio.File.new_for_path(manifest).replace_contents("{}", null, false, Gio.FileCreateFlags.none, null)
local digest = GLib.compute_checksum_for_string(GLib.ChecksumType.sha256, "{}", -1)
async function exercise() {
    local observed = [], job = J.Build()
    job.command_factory = function(path) { return [GLib.find_program_in_path("python3"), "-c",
        "import sys,json,pathlib,time; r=pathlib.Path(sys.argv[3]); t=r.with_suffix('.tmp'); t.write_text(json.dumps(dict(protocol_version=1,status='running',manifest_sha256=sys.argv[1],expected_outputs=3,artifacts=[],progress=dict(target='appimage',architecture='aarch64',phase='packaging',completed=1)))); t.replace(r); time.sleep(3); sys.exit(7)", digest] }
    local code = await job.run({path=manifest, sha256=digest}, directory, function() { observed.push(job.state) })
    local found = false
    foreach (state in observed) if (state.find("Output 2 of 3 — Linux AppImage · aarch64 — Creating package") != null) found = true
    if (!found || job.tail != "" || code != 7 || job.state.find("Build failed") == null) throw "Quiet progress or final failure precedence failed"
    local cancelled = false
    code = await job.run({path=manifest, sha256=digest}, directory, function() {
        if (job.state.find("Output 2 of 3") != null && !cancelled) { cancelled = true; job.cancel() }
    })
    if (!cancelled || job.state != "Build cancelled" || job.busy) throw "Progress overrode cancellation"
    print("PASS JOB-quiet-progress\n")
}
exercise().then(function(_) { loop.quit() }).catch(function(error) { print("FAIL " + error + "\n"); failure = 1; loop.quit() })
loop.run()
return failure
