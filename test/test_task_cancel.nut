// test/test_task_cancel.nut
//
// Verifies task.cancel():
//   1. Cancelling a pending Task rejects it with {__cancelled, reason}.
//   2. Cancelling sqgi.sleep tears down its GLib source so the timer never
//      fires after cancellation.
//   3. Cancelling an already-settled task is a no-op.
//   4. await on a cancelled task throws the cancellation error.

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── 1. Cancel a plain Task ────────────────────────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local caught = null
    local t = sqgi.Task()
    t.catch(function(e) { caught = e })
    sqgi.timeout_add(10, function() { t.cancel("nope"); return false })
    sqgi.timeout_add(50, function() { loop.quit(); return false })
    loop.run()
    check(caught != null, "expected cancel rejection")
    check(caught.__cancelled == true, "missing __cancelled marker")
    check(caught.reason == "nope", "reason mismatch: " + caught.reason)
}

// ── 2. Cancel sqgi.sleep removes the timer ─────────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local resolved = false
    local rejected = false
    local s = sqgi.sleep(200)
    s.then(function(_) { resolved = true })
     .catch(function(_) { rejected = true })
    sqgi.timeout_add(20, function() { s.cancel(); return false })
    sqgi.timeout_add(400, function() { loop.quit(); return false })
    loop.run()
    check(rejected,  "sleep should have rejected on cancel")
    check(!resolved, "sleep should NOT have resolved after cancel")
}

// ── 3. Cancel after settle is a no-op ─────────────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local result = null
    local t = sqgi.Task()
    t.then(function(v) { result = v })
    t.resolve(42)
    t.cancel("too-late")
    sqgi.timeout_add(30, function() { loop.quit(); return false })
    loop.run()
    check(result == 42, "settled task must keep its value, got: " + result)
}

// ── 4. await a cancelled task throws the cancellation error ───────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local caught = null
    local body = async function() {
        local s = sqgi.sleep(500)
        sqgi.timeout_add(20, function() { s.cancel("bye"); return false })
        try {
            await s
        } catch (e) {
            caught = e
        }
        loop.quit()
    }
    body()
    loop.run()
    check(caught != null && caught.__cancelled == true, "await did not see cancellation")
    check(caught.reason == "bye", "wrong reason: " + caught.reason)
}

print("OK\n")
