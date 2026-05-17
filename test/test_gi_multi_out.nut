// test/test_gi_multi_out.nut
//
// Hits sqgi_gi.c paths that pure callback-style tests miss:
//   - Synchronous GI call with bool return + multiple out args
//     (sqgi_gi.c lines around 862-871 / 901-936): bool dropped, single
//     visible out becomes string, length-out arg auto-detected and skipped.
//   - GI function returning a boxed/struct (GLib.DateTime).
//   - GI introspected getter calls returning strings.

local GLib = import("GLib")
local Gio  = import("Gio")

function check(c, m) { if (!c) throw "[FAIL] " + m }

// ── load_contents on an existing file (bool ret + uint8[] out + len + etag) ─
local tmp = GLib.get_tmp_dir() + "/sqgi_multi_out_" + GLib.get_monotonic_time().tostring()

// Create file via GLib.file_set_contents (length=-1 → strlen).
GLib.file_set_contents(tmp, "hello-multi-out", -1)

local f = Gio.File.new_for_path(tmp)

// f.load_contents(null) → bool ret + (uint8 array contents, gsize length, string etag).
// SQGI drops the bool return + hides `length` (array-length metadata) and
// converts the uint8[] to a string via the length-arg → result is
// [contents_string, etag_string].
local result = f.load_contents(null)
check(typeof result == "array",      "load_contents returns array, got " + typeof result)
check(result.len() == 2,             "expected [contents, etag], got len=" + result.len())
check(typeof result[0] == "string",  "contents should be string, got " + typeof result[0])
check(result[0] == "hello-multi-out","contents payload: " + result[0])
check(typeof result[1] == "string" || result[1] == null,
                                     "etag should be string|null, got " + typeof result[1])

try { f.delete(null) } catch (e) {}

// ── Boxed/struct return: GLib.DateTime.new_now_local() ────────────────────
// Exercises sqgi_push_gi_argument's INTERFACE → STRUCT/BOXED branch.
local dt = GLib.DateTime.new_now_local()
check(dt != null, "DateTime.new_now_local returned non-null")
// Format-out: returns a string.
local s = dt.format("%Y")
check(typeof s == "string" && s.len() == 4, "format(%Y) returned 4-char year: " + s)

// ── String-returning GI function: GLib.get_host_name ──────────────────────
local host = GLib.get_host_name()
check(typeof host == "string" && host.len() > 0, "get_host_name returned non-empty string")

// ── Get a GBytes via boxed return + read it back as string ────────────────
// Gio.File.load_bytes returns (GBytes, etag_out). GBytes.get_data returns a
// uint8 array which our marshaller converts to a Squirrel string.
local f2 = Gio.File.new_for_path(GLib.get_tmp_dir() + "/sqgi_multi_out_b_" + GLib.get_monotonic_time().tostring())
local f2_path = GLib.get_tmp_dir() + "/sqgi_multi_out_b_" + GLib.get_monotonic_time().tostring()
GLib.file_set_contents(f2_path, "bytes-payload", -1)
f2 = Gio.File.new_for_path(f2_path)

local bytes_res = f2.load_bytes(null)
check(bytes_res != null, "load_bytes result non-null")
local gbytes = (typeof bytes_res == "array") ? bytes_res[0] : bytes_res
check(gbytes != null, "GBytes non-null")
local payload = gbytes.get_data()
check(typeof payload == "string", "GBytes.get_data → string, got " + typeof payload)
check(payload == "bytes-payload", "payload: " + payload)

try { f2.delete(null) } catch (e) {}

print("[OK] test_gi_multi_out passed\n")
