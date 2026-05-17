// test/test_vget_download.nut
//
// Regression test for the demo/soup/vget.nut "Soup re-entrancy" crash.
//
// History: an earlier version of `download_file` used an `async function`
// with `await sqgi.sleep(0)` between chunk reads. When run against a real
// HTTPS source, `Soup.InputStream.read_bytes` spins a *nested* main-loop
// iteration while waiting for network bytes, which dispatched a pending
// wake into the still-on-C-stack Squirrel async body and segfaulted
// around 13 MB into a 30 MB transfer.
//
// The fix replaces the await loop with a single `sqgi.timeout_add(0, ...)`
// source — GLib won't re-enter a currently-dispatching source, so reads
// stay safe even when the underlying stream spins the loop internally.
//
// This test:
//   1. Builds a 4 MB random payload via `head -c`.
//   2. Spawns `python3 -m http.server` to serve it on a local port.
//   3. Runs `demo/soup/vget.nut` against that URL.
//   4. `cmp`s the downloaded bytes against the source.
//   5. Verifies the demo's success markers appeared in stdout.
//
// If python3 isn't available, the test is skipped (exit 0).

local Gio  = import("Gio")
local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// Helper: run argv and return [exit_status, stdout_string].
function run_capture(argv) {
    local p = Gio.Subprocess.new(argv,
        Gio.SubprocessFlags.stdout_pipe + Gio.SubprocessFlags.stderr_silence)
    local s = p.get_stdout_pipe()
    local out = ""
    while (true) {
        local b = s.read_bytes(8192, null)
        local n = b.get_size()
        if (n == 0) break
        out += b.get_data().tostring()
    }
    p.wait(null)
    return [p.get_exit_status(), out]
}

// Helper: run argv silently, return exit_status.
function run_silent(argv) {
    local p = Gio.Subprocess.new(argv,
        Gio.SubprocessFlags.stdout_silence + Gio.SubprocessFlags.stderr_silence)
    p.wait(null)
    return p.get_exit_status()
}

// ── Locate python3 ─────────────────────────────────────────────────────────
local python = null
foreach (cand in ["python3", "python"]) {
    if (run_silent([cand, "-c", "import sys"]) == 0) { python = cand; break }
}
if (python == null) {
    print("[SKIP] python3 not found — skipping vget regression test\n")
    return
}

// ── Layout ────────────────────────────────────────────────────────────────
local PAYLOAD_BYTES = 32 * 1024 * 1024  // 32 MB — large enough to surface
                                        // re-entrancy crashes mid-stream.
local serve_dir = "/tmp/sqgi_vget_test"
local src_path  = serve_dir + "/payload.bin"
local dst_path  = "/tmp/sqgi_vget_test_download.bin"

run_silent(["rm", "-rf", serve_dir, dst_path])
run_silent(["mkdir", "-p", serve_dir])

// ── Build deterministic random payload ────────────────────────────────────
local mk = Gio.Subprocess.new(
    ["sh", "-c", "head -c " + PAYLOAD_BYTES + " /dev/urandom > " + src_path],
    Gio.SubprocessFlags.none)
mk.wait(null)
check(mk.get_exit_status() == 0, "failed to create payload")

// ── Spawn python -m http.server on a fixed port ───────────────────────────
local PORT = 38719
local server = Gio.Subprocess.new(
    [python, "-m", "http.server", PORT.tostring(),
     "--bind", "127.0.0.1", "--directory", serve_dir],
    Gio.SubprocessFlags.stdout_silence + Gio.SubprocessFlags.stderr_silence)

// Poll until the server accepts connections (max ~2 s).
local server_ready = false
for (local tries = 0; tries < 40; tries++) {
    try {
        local c = Gio.SocketClient.new()
        local conn = c.connect_to_host("127.0.0.1", PORT, null)
        conn.close(null)
        server_ready = true
        break
    } catch (e) {
        local L = GLib.MainLoop.new(null, false)
        sqgi.timeout_add(50, function() { L.quit(); return false })
        L.run()
    }
}
check(server_ready, "python http.server failed to start on port " + PORT)

// ── Run the demo ──────────────────────────────────────────────────────────
local demo_url = "http://127.0.0.1:" + PORT + "/payload.bin"
local sqgi_bin = GLib.getenv("SQGI_BIN")
if (sqgi_bin == null) sqgi_bin = "./build/sqgi"
local r = run_capture(
    [sqgi_bin, "demo/soup/vget.nut", "--uri=" + demo_url, "-o", dst_path])
local demo_status = r[0]
local stdout_str  = r[1]

// Always tear down the server, regardless of demo outcome.
server.force_exit()
server.wait(null)

// ── Assertions ────────────────────────────────────────────────────────────
check(demo_status == 0,
      "demo exited non-zero: " + demo_status + "\nstdout:\n" + stdout_str)

// Byte-for-byte equality. `cmp -s` exits 0 only if identical.
local cmp_status = run_silent(["cmp", "-s", src_path, dst_path])
check(cmp_status == 0,
      "downloaded bytes do not match source (cmp exit " + cmp_status + ")")

// Demo success markers — these guard against silent regressions where the
// process exits 0 but never actually streamed the file.
check(stdout_str.find("Download finished.") != null,
      "missing 'Download finished.' in stdout:\n" + stdout_str)
check(stdout_str.find("Download complete.") != null,
      "missing 'Download complete.' in stdout:\n" + stdout_str)

// ── Cleanup ───────────────────────────────────────────────────────────────
run_silent(["rm", "-rf", serve_dir, dst_path])

print("test_vget_download.nut passed (" + PAYLOAD_BYTES + " bytes verified)\n")
