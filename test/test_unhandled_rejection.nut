// test/test_unhandled_rejection.nut
//
// Verifies that the async runtime detects unhandled promise rejections and
// that attaching a .catch / awaiting the task suppresses the warning.
//
// The actual stderr capture is performed by run_tests.sh; here we exercise
// the runtime paths and emit a final "OK" line that the harness greps for.

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── 1. .catch attached after reject still counts as handled ──────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local caught = null
    local t = sqgi.Task()
    t.reject("boom-1")
    t.catch(function(e) { caught = e })
    sqgi.timeout_add(30, function() { loop.quit(); return false })
    loop.run()
    check(caught == "boom-1", "synchronous catch should fire, got: " + caught)
}

// ── 2. await inside async function marks rejection as handled ────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local rethrown = null

    local inner = async function() {
        local t = sqgi.Task()
        sqgi.timeout_add(10, function() { t.reject("boom-2"); return false })
        try {
            await t
        } catch (e) {
            rethrown = e
        }
        loop.quit()
    }
    inner()
    loop.run()
    check(rethrown == "boom-2", "await should rethrow rejection, got: " + rethrown)
}

// ── 3. .catch on a task whose rejection propagates through .then ─────────
//
// .then(succ) without a rejection handler should propagate the rejection
// to the derived task; attaching .catch on that derived task suppresses
// the unhandled warning.
{
    local loop = GLib.MainLoop.new(null, false)
    local caught = null
    local t = sqgi.Task()
    local d = t.then(function(x) { return x })
    d.catch(function(e) { caught = e })
    t.reject("boom-3")
    sqgi.timeout_add(30, function() { loop.quit(); return false })
    loop.run()
    check(caught == "boom-3", "rejection should propagate through .then to .catch, got: " + caught)
}

// ── 4. Two-arg .then(succ, fail) handles rejection inline ────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local rej = null
    local resolved = false
    local t = sqgi.Task()
    t.then(function(_) { resolved = true },
           function(e) { rej = e })
    t.reject("boom-4")
    sqgi.timeout_add(30, function() { loop.quit(); return false })
    loop.run()
    check(rej == "boom-4", "rejection handler should fire, got: " + rej)
    check(!resolved, "success handler should NOT fire on rejection")
}

// ── 5. Two-arg .then(succ, fail) routes success to succ ──────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local got = null
    local rej_called = false
    local t = sqgi.Task()
    t.then(function(v) { got = v },
           function(_) { rej_called = true })
    t.resolve(42)
    sqgi.timeout_add(30, function() { loop.quit(); return false })
    loop.run()
    check(got == 42, "succ handler should receive value")
    check(!rej_called, "rej handler should NOT fire on resolve")
}

print("OK\n")
