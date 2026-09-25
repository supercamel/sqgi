local D = import("../src/document.nut")
local Gio = import("Gio")
local GLib = import("GLib")
local root = GLib.canonicalize_filename(vargv[0], null)
function require(ok, message) { if (!ok) throw "FAIL: " + message }
function rejects(callback, message) { local failed = false; try { callback() } catch (_) { failed = true }; require(failed, message) }
function write(path, text) { Gio.File.new_for_path(path).replace_contents(text, null, false, Gio.FileCreateFlags.none, null) }
function same(a, b) { return D.pretty(a) == D.pretty(b) }
local original = "{ \"name\": \"Café λ\", \"unknown\": {\"x\":[false,null,3,\"a\"]}, \"entry\": \"main.nut\", \"windows\":{\"console\":false} }\n"
local filename = root + "/文 manifest.json"
write(filename, original)
local doc = D.open_document(filename)
local etag = D.read_file(filename).etag
doc.save(); require(D.read_file(filename).text == original && D.read_file(filename).etag == etag, "no-op bytes and etag")
local before = D.copy_value(doc.value)
doc.set(["name"], "Changed"); require(same(doc.get(["unknown"]), before.unknown), "unknown nested values")
require(doc.get(["windows", "console"]) == false && doc.has(["windows", "console"]), "explicit false")
doc.set(["null_value"], null); require(doc.has(["null_value"]) && doc.get(["null_value"]) == null, "null is present")
doc.unset(["null_value"]); require(!doc.has(["null_value"]), "unset")
doc.set(["unknown", "x", 4], "new"); doc.unset(["unknown", "x", 2]); require(same(doc.get(["unknown", "x"]), [false,null,"a","new"]), "ordered nested array edits")
print("PASS DOC-preservation\n")
local valid = D.copy_value(doc.value)
doc.edit_json("{broken"); require(!doc.valid && same(doc.value, valid), "invalid draft retains value")
rejects(function() { doc.set(["name"], "bad") }, "invalid form refused")
rejects(function() { doc.save() }, "invalid save refused")
doc.undo(); require(doc.valid && same(doc.value, valid), "undo invalid draft")
doc.redo(); require(!doc.valid && doc.text == "{broken", "redo invalid draft")
doc.undo(); doc.save(); require(!doc.dirty, "save establishes baseline")
doc.undo(); require(doc.dirty, "undo after save")
doc.redo(); require(!doc.dirty, "redo to baseline")
print("PASS DOC-history\n")
local baseline = D.read_file(filename).text
write(filename, "{}\n"); rejects(function() { doc.save() }, "conflicting no-op save refused")
require(D.read_file(filename).text == "{}\n" && doc.text == baseline, "conflict preserves both versions")
local missing = root + "/missing-parent/new.json"
rejects(function() { doc.save(missing, "literal") }, "failed IO refused"); require(doc.text == baseline, "failed IO preserves draft")
local draft = D.Document("{\"schema_version\":99,\"unknown\":false}"); draft.save(root + "/invalid-schema.json")
require(!draft.dirty, "semantic-invalid draft can save")
print("PASS DOC-atomic-save\n")
local source = root + "/a", destination = root + "/b"
GLib.mkdir_with_parents(source, 493); GLib.mkdir_with_parents(destination, 493)
local moving = D.Document("{\"entry\":\"main.nut\",\"files\":[{\"from\":\"assets\",\"to\":\"usr/share/app\"}],\"native\":[{\"dir\":\"native\",\"libraries\":[\"out/lib.so\"]}]}")
moving.save(source + "/sqgipkg.json")
rejects(function() { moving.save(destination + "/sqgipkg.json") }, "no silent move")
local preview = moving.relocation_preview(destination + "/sqgipkg.json")
require(GLib.canonicalize_filename(preview.value.entry, null) == GLib.canonicalize_filename(source + "/main.nut", null), "entry rebase")
require(preview.value.files[0].to == "usr/share/app", "package destination unchanged")
require(GLib.canonicalize_filename(preview.value["native"][0].dir, null) == GLib.canonicalize_filename(source + "/native", null) && preview.value["native"][0].libraries[0] == "out/lib.so", "native path base retained")
moving.set(["mystery"], "file"); rejects(function() { moving.relocation_preview(destination + "/sqgipkg.json") }, "unknown fields refuse automatic rebase")
moving.save(destination + "/sqgipkg.json", "literal"); require(moving.get(["entry"]) == "main.nut", "explicit literal copy")
print("PASS DOC-relocation\n")
local revision = moving.build_revision(); require(revision.path == moving.path && revision.sha256.len() == 64, "saved digest")
moving.set(["name"], "new"); rejects(function() { moving.build_revision() }, "dirty revision refused")
print("PASS DOC-build-revision\n")
// The Python driver supplies every checked-in manifest as a no-op corpus.
local corpus = sqgi.json.parse(D.read_file(root + "/corpus.json").text)
foreach (i, text in corpus) {
    local path = root + "/corpus-" + i + ".json"; write(path, text)
    local item = D.open_document(path); item.save(); require(D.read_file(path).text == text, "corpus bytes " + i)
    local snapshot = D.copy_value(item.value); item.set(["gui_test_unknown"], [false,null]); item.unset(["gui_test_unknown"])
    require(same(snapshot, item.value), "corpus semantics " + i)
}
print("PASS DOC-corpus " + corpus.len() + "\n")
