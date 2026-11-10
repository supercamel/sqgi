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

// Continuations run in a later main-context iteration. A fixed quit timer can
// overtake them on an emulated or busy host, even when cancellation succeeded.
function wait_for(ready) {
    local loop = GLib.MainLoop.new(null, false), expired = false
    local poll = sqgi.timeout_add(10, function() {
        if (!ready()) return true
        loop.quit()
        return false
    })
    local watchdog = sqgi.timeout_add(5000, function() {
        expired = true
        loop.quit()
        return false
    })
    loop.run()
    sqgi.source_remove(expired ? poll : watchdog)
    check(!expired, "timed out waiting for task continuation")
}

// ── 1. Cancel a plain Task ────────────────────────────────────────────────
{
    local caught = null
    local t = sqgi.Task()
    t.catch(function(e) { caught = e })
    sqgi.timeout_add(10, function() { t.cancel("nope"); return false })
    wait_for(function() { return caught != null })
    check(caught != null, "expected cancel rejection")
    check(caught.__cancelled == true, "missing __cancelled marker")
    check(caught.reason == "nope", "reason mismatch: " + caught.reason)
}

// ── 2. Cancel sqgi.sleep removes the timer ─────────────────────────────────
{
    local resolved = false
    local rejected = false
    local s = sqgi.sleep(200)
    s.then(function(_) { resolved = true })
     .catch(function(_) { rejected = true })
    // Cancel before dispatching the main context, so a delayed host cannot
    // dispatch the sleep's timer before the cancellation request.
    local source = s.__source_id
    s.cancel()
    check(GLib.MainContext.default().find_source_by_id(source) == null,
        "cancel must remove the sleep source")
    wait_for(function() { return rejected })
    local elapsed = false
    sqgi.sleep(400).then(function(_) { elapsed = true })
    wait_for(function() { return elapsed })
    check(rejected,  "sleep should have rejected on cancel")
    check(!resolved, "sleep should NOT have resolved after cancel")
}

// ── 3. Cancel after settle is a no-op ─────────────────────────────────────
{
    local result = null
    local t = sqgi.Task()
    t.then(function(v) { result = v })
    t.resolve(42)
    t.cancel("too-late")
    wait_for(function() { return result != null })
    check(result == 42, "settled task must keep its value, got: " + result)
}

// ── 4. await a cancelled task throws the cancellation error ───────────────
{
    local caught = null, finished = false
    local body = async function() {
        local s = sqgi.Task()
        sqgi.timeout_add(20, function() { s.cancel("bye"); return false })
        try {
            await s
        } catch (e) {
            caught = e
        }
        finished = true
    }
    body()
    wait_for(function() { return finished })
    check(caught != null && caught.__cancelled == true, "await did not see cancellation")
    check(caught.reason == "bye", "wrong reason: " + caught.reason)
}

print("OK\n")
