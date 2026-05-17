// test/test_gio_async.nut
//
// Verifies sqgi.gio_async wraps GIO _async/_finish pairs as awaitable Tasks
// whose .cancel() propagates through a GCancellable.

local Gio = import("Gio")
local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── 1. Success path: load_contents_async on an existing file ─────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local ok = false
    local f = Gio.File.new_for_path("./test/test_gio_async.nut")

    sqgi.gio_async(
        @(c, cb) f.load_contents_async_raw(c, cb),
        @(res) f.load_contents_finish(res))
    .then(function(v) { ok = true; loop.quit() })
    .catch(function(e) { print("UNEXPECTED ERR: " + e + "\n"); loop.quit() })

    // safety timeout
    sqgi.timeout_add(2000, function() { loop.quit(); return false })
    loop.run()
    check(ok, "load_contents_async on existing file should succeed")
}

// ── 2. Error path: nonexistent file → sqgi.GError surfaces ────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local caught = null
    local f = Gio.File.new_for_path("/this/does/not/exist/sqgi-async-test")

    sqgi.gio_async(
        @(c, cb) f.load_contents_async_raw(c, cb),
        @(res) f.load_contents_finish(res))
    .then(function(v) { print("UNEXPECTED OK: " + v + "\n"); loop.quit() })
    .catch(function(e) { caught = e; loop.quit() })

    sqgi.timeout_add(2000, function() { loop.quit(); return false })
    loop.run()
    check(caught != null, "missing file should reject")
    check(caught instanceof sqgi.GError,
          "rejection should be a sqgi.GError; got: " + typeof(caught))
    check(caught.domain == "g-io-error-quark",
          "expected g-io-error-quark domain, got: " + caught.domain)
}

// ── 3. Cancellation path: task.cancel() propagates to GCancellable ───────
//
// We start a load_contents_async, immediately cancel, and verify the task
// is rejected with the cancellation marker (NOT a successful result), and
// that .cancel returns quickly (the GIO op aborts via the cancellable).
{
    local loop = GLib.MainLoop.new(null, false)
    local got = null
    local f = Gio.File.new_for_path("./test/test_gio_async.nut")

    local task = sqgi.gio_async(
        @(c, cb) f.load_contents_async_raw(c, cb),
        @(res) f.load_contents_finish(res))

    task.then(function(v) { got = {ok=true, v=v}; loop.quit() })
        .catch(function(e) { got = {ok=false, e=e}; loop.quit() })

    // Cancel before the GIO op completes. Since the file is local and tiny
    // this is racy in principle, but in practice cancel() runs in the same
    // main-loop iteration before the IO callback can fire.
    task.cancel("user requested")

    sqgi.timeout_add(2000, function() { loop.quit(); return false })
    loop.run()

    check(got != null, "task should have settled")
    check(!got.ok, "cancellation should reject the task")
    // The rejection value is the cancellation marker {__cancelled=true, reason=...}
    check(typeof(got.e) == "table" && got.e.__cancelled,
          "rejection should carry __cancelled marker; got: " + got.e)
    check(got.e.reason == "user requested",
          "reason should be passed through; got: " + got.e.reason)
}

// ── 4. Task already settled by cancel → ready callback silently absorbs the
//      eventual GIO completion (verified by no print spam, no double-resolve). ─
{
    local loop = GLib.MainLoop.new(null, false)
    local settle_count = 0
    local f = Gio.File.new_for_path("./test/test_gio_async.nut")

    local task = sqgi.gio_async(
        @(c, cb) f.load_contents_async_raw(c, cb),
        @(res) f.load_contents_finish(res))

    task.then(function(v) { settle_count++; loop.quit() })
        .catch(function(e) { settle_count++; loop.quit() })

    task.cancel("first")
    task.cancel("second") // should be a no-op since task is already settled

    // Give the GIO callback a chance to fire after cancellation.
    sqgi.timeout_add(200, function() { loop.quit(); return false })
    loop.run()

    check(settle_count == 1,
          "task must settle exactly once, got: " + settle_count)
}

print("[OK] test_gio_async passed\n")
