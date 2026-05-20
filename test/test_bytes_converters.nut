// test/test_bytes_converters.nut
// Exercises sqgi.bytes_to_array / sqgi.bytes_from_array converters and
// verifies they round-trip cleanly with the byte-buffer representation used
// by the GI marshaller (Squirrel string ↔ uint8[] C-array).

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

local GLib = import("GLib")
local Gio  = import("Gio")

// ── 1. Basic round-trip: string → array → string ─────────────────────────
// Build a 12-byte binary payload: "hello" + NUL + "world" + 0xff via the
// converter we're testing (Squirrel string literals don't embed NUL).
local original = sqgi.bytes_from_array(
    [104, 101, 108, 108, 111, 0, 119, 111, 114, 108, 100, 0xff])
check(original.len() == 12, "original length 12, got " + original.len())

local arr1 = sqgi.bytes_to_array(original)
check(typeof arr1 == "array",       "bytes_to_array returns array")
check(arr1.len() == original.len(), "length preserved: " + arr1.len())
check(arr1[0]  == 104,              "arr[0] == 'h' (0x68)")
check(arr1[5]  == 0,                "arr[5] == NUL (binary safe)")
check(arr1[11] == 0xff,             "arr[11] == 0xff (unsigned semantics)")

local back = sqgi.bytes_from_array(arr1)
check(typeof back == "string",      "bytes_from_array returns string")
check(back.len() == original.len(), "back length preserved")
check(back == original,             "round-trip equality")

// ── 2. Empty input ────────────────────────────────────────────────────────
local arr2 = sqgi.bytes_to_array("")
check(arr2.len() == 0, "empty string -> empty array")
local s2 = sqgi.bytes_from_array([])
check(s2.len() == 0,   "empty array -> empty string")

// ── 3. Pass-through symmetry ─────────────────────────────────────────────
local arr3 = sqgi.bytes_to_array([1, 2, 3])     // array -> array (pass-through)
check(arr3.len() == 3, "array passes through bytes_to_array")
local s3 = sqgi.bytes_from_array("xyz")         // string -> string (pass-through)
check(s3 == "xyz",     "string passes through bytes_from_array")

// ── 4. Low-8-bits truncation for out-of-range ints ───────────────────────
local s4 = sqgi.bytes_from_array([0x100, 0x1ff, -1])
check(s4.len() == 3,        "3 bytes produced")
check(s4[0] == 0,           "0x100 -> 0x00 (low 8 bits)")
check(s4[1] == 0xff,        "0x1ff -> 0xff")
check(s4[2] == 0xff,        "-1   -> 0xff")

local sum4 = 0
foreach (b in s4) sum4 += b
check(sum4 == 510,          "string byte iteration uses unsigned bytes")

// ── 5. Bad inputs ────────────────────────────────────────────────────────
local threw = false
try { sqgi.bytes_to_array(42) } catch (e) { threw = true }
check(threw, "bytes_to_array(int) must throw")

threw = false
try { sqgi.bytes_from_array("a string is a pass-through") } catch (e) { threw = true }
check(!threw, "bytes_from_array(string) is a pass-through, not an error")

threw = false
try { sqgi.bytes_from_array(42) } catch (e) { threw = true }
check(threw, "bytes_from_array(int) must throw")

threw = false
try { sqgi.bytes_from_array(["a", "b"]) } catch (e) { threw = true }
check(threw, "bytes_from_array of non-integers must throw")

// ── 6. Round-trip through actual GI marshaller ───────────────────────────
//   string -> file_set_contents (uint8[] IN) -> load_contents (uint8[] OUT) -> string
local tmp = GLib.get_tmp_dir() + "/sqgi_bytes_conv_" + GLib.get_monotonic_time()
local payload = sqgi.bytes_from_array(
    [98, 105, 110, 97, 114, 121, 0, 112, 97, 121, 108, 111, 97, 100, 1, 2, 0xff])
GLib.file_set_contents(tmp, payload, -1)

local f = Gio.File.new_for_path(tmp)
local r = f.load_contents(null)   // [contents_string, etag]
local contents = r[0]
check(contents == payload, "GI round-trip preserves bytes")

local arr6 = sqgi.bytes_to_array(contents)
local rebuilt = sqgi.bytes_from_array(arr6)
check(rebuilt == payload, "string <-> array <-> string preserves bytes through GI")

try { f.delete(null) } catch (e) {}

print("test_bytes_converters: all checks passed\n")
