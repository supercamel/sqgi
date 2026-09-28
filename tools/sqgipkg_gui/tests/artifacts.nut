// Protocol/file acceptance; fixture bytes do not claim real package execution.
local GLib = import("GLib"), Gio = import("Gio")
local A = import("../src/artifacts.nut")
local B = import("../../sqgipkg_lib/build.nut")
local dir = vargv[0]
function write(path, text) { Gio.File.new_for_path(path).replace_contents(text, null, false, Gio.FileCreateFlags.none, null) }
function require(ok, message) { if (!ok) throw message }
local manifest = dir + "/sqgipkg.json", output = dir + "/fixture.AppImage", report = dir + "/result.json"
write(manifest, "{}"); write(output, "fixture bytes")
local pkg = B.SqgiPkgBuild(), opts = pkg.new_options()
opts.manifest = manifest; opts.target = "appimage"; opts.appimage_arch = "aarch64"
pkg.begin_build_result(opts, report)
pkg.report_build_progress(opts, "packaging")
require(A.read_progress(report, pkg.file_sha256(manifest)).find("Output 1 of 1 — Linux AppImage · aarch64") != null, "progress identifies output")
local snapshot = sqgi.json.parse(Gio.File.new_for_path(report).load_contents(null)[0])
foreach (change in [{phase="invented"}, {target="all"}, {architecture="mystery"}, {completed=-1}, {completed=1}]) {
    local broken = sqgi.json.parse(sqgi.json.stringify(snapshot))
    foreach (key, value in change) broken.progress[key] = value
    write(report, sqgi.json.stringify(broken)); require(A.read_progress(report, pkg.file_sha256(manifest)) == null, "invalid progress rejected")
}
write(report, sqgi.json.stringify(snapshot))
require(A.read_progress(report, "wrong digest") == null, "progress bound to manifest")
pkg.report_build_artifact(opts, output, "appimage")
require(A.read_progress(report, pkg.file_sha256(manifest)).find("Output ready") != null, "completed count advances after artifact")
pkg.finish_build_result("succeeded")
local digest = pkg.file_sha256(manifest), result = A.read_result(report, digest)
require(result.complete && result.outputs.len() == 1, "complete report")
require(result.outputs[0].label.find("aarch64") != null && result.outputs[0].folder == dir, "friendly output and folder")
local valid_report = sqgi.json.parse(Gio.File.new_for_path(report).load_contents(null)[0])
function rejected(value) {
    write(report, sqgi.json.stringify(value))
    local failed = false
    try { A.read_result(report, digest) } catch (_) { failed = true }
    require(failed, "invalid report accepted: " + sqgi.json.stringify(value))
}
function copy(value) { return sqgi.json.parse(sqgi.json.stringify(value)) }
local changed = copy(valid_report); changed.protocol_version = 2; rejected(changed)
changed = copy(valid_report); changed.manifest_sha256 = "different"; rejected(changed)
changed = copy(valid_report); changed.artifacts[0].architecture = "mystery"; rejected(changed)
changed = copy(valid_report); changed.artifacts[0].path = "relative"; rejected(changed)
changed = copy(valid_report); changed.artifacts[0].size++; rejected(changed)
changed = copy(valid_report); changed.artifacts[0].path = dir + "/absent"; rejected(changed)
changed = copy(valid_report); changed.artifacts.push(copy(changed.artifacts[0])); changed.expected_outputs = 2; rejected(changed)
changed = copy(valid_report); changed.expected_outputs = 3; changed.status = "failed"
write(report, sqgi.json.stringify(changed)); result = A.read_result(report, digest)
require(!result.complete && result.outputs.len() == 1, "partial failure is not success")
changed.status = "succeeded"; write(report, sqgi.json.stringify(changed))
require(!A.read_result(report, digest).complete, "missing matrix output is not success")
changed = copy(valid_report); changed.artifacts[0].kind = "nsis-script"; changed.artifacts[0].target = "win-nsis"; changed.artifacts[0].architecture = "x86_64"
write(report, sqgi.json.stringify(changed)); result = A.read_result(report, digest)
require(result.outputs[0].label.find("not an installer") != null, "script-only result must not claim an installer")
local before = Gio.File.new_for_path(manifest).load_contents(null)[0], failed = false
try { pkg.begin_build_result(opts, manifest) } catch (_) { failed = true }
require(failed && Gio.File.new_for_path(manifest).load_contents(null)[0] == before, "existing result path must never be overwritten")
local folder = dir + "/empty"
Gio.File.new_for_path(folder).make_directory(null)
changed = copy(valid_report); changed.artifacts[0] = {kind="windows-directory", target="win-dir", architecture="x86_64", path=folder, size=null}
rejected(changed)
write(folder + "/app.exe", "fixture"); write(report, sqgi.json.stringify(changed))
require(A.read_result(report,digest).outputs[0].folder == folder, "directory opens itself")
pkg.begin_build_output(output)
failed = false
try { pkg.report_build_artifact(opts, output, "appimage") } catch (_) { failed = true }
require(failed && Gio.File.new_for_path(output).query_exists(null), "unchanged prior output rejected without deleting it")
local matrix = pkg.new_options()
pkg.apply_manifest_data(matrix, {target="all", platforms={linux={architectures=["x86_64", "aarch64"]}, windows={format="installer"}}}, dir)
matrix.manifest = manifest
pkg.begin_build_result(matrix, dir + "/matrix-progress.json")
local configs = pkg.selected_configurations(matrix)
require(configs.len() == 3, "three selected progress outputs")
foreach (i, config in configs) {
    pkg.report_build_progress(config, "preparing")
    local progress = A.read_progress(dir + "/matrix-progress.json", digest)
    require(progress.find("Output " + (i + 1) + " of 3") != null, "matrix progress advances")
    local artifact = dir + "/matrix-output-" + i
    write(artifact, "fixture")
    pkg.report_build_artifact(config, artifact, config.target == "appimage" ? "appimage" : "nsis-script")
}
require(pkg.build_result.progress.completed == 3, "matrix counts recorded outputs only")
print("PASS JOB-artifact-results\n")
