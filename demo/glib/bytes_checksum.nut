/**
 * demo/glib/bytes_checksum.nut
 *
 * Build a GLib.Bytes buffer, hash it with several algorithms, and verify
 * that base64 encode/decode is a round-trip.
 *
 * Usage: sqgi demo/glib/bytes_checksum.nut
 *
 * Exercises:
 *   - GLib.Bytes.new / .get_data / .get_size / .equal
 *   - GLib.compute_checksum_for_string (md5/sha1/sha256/sha512)
 *   - GLib.base64_encode / base64_decode
 */

local GLib = import("GLib")

local payload = "The quick brown fox jumps over the lazy dog"
local b = GLib.Bytes.new(payload)
print("payload: " + payload + "\n")
print("size:    " + b.get_size() + " B\n")
print("equal:   " + b.equal(GLib.Bytes.new(payload)) + "\n\n")

print("== checksums ==\n")
local algos = [
    ["md5",    GLib.ChecksumType.md5],
    ["sha1",   GLib.ChecksumType.sha1],
    ["sha256", GLib.ChecksumType.sha256],
    ["sha512", GLib.ChecksumType.sha512],
]
foreach (a in algos) {
    local hex = GLib.compute_checksum_for_string(a[1], payload, payload.len())
    print(format("  %-7s %s\n", a[0], hex))
}

print("\n== base64 ==\n")
local enc = GLib.base64_encode(payload, payload.len())
print("  encoded: " + enc + "\n")
local dec_arr = GLib.base64_decode(enc)
// base64_decode shape varies (string / array / Bytes). Normalise:
local dec = dec_arr
if (typeof(dec) == "array") dec = dec[0]
if (typeof(dec) == "instance") {
    try { dec = dec.get_data() } catch (e) {}
}
// strip trailing NULs if any
while (dec.len() > 0 && dec[dec.len()-1] == 0)
    dec = dec.slice(0, dec.len()-1)
print("  decoded: " + dec + "\n")
print("  match:   " + (dec == payload) + "\n")
