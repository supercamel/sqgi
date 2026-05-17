// test/test_newthread.nut
// Smoke test for `newthread` — the low-level coroutine primitive.
// (Modern code should prefer `async function`, but newthread still
// underpins async and direct generator use.)

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── Test 1: newthread runs a closure and returns ──────────────────────────
{
    local ran = 0
    local co = newthread(function() { ran++ })
    co.call()
    check(ran == 1, "newthread body must run once, got " + ran)
    print("test 1 (basic newthread) passed\n")
}

// ── Test 2: newthread receives arguments ──────────────────────────────────
{
    local sum = 0
    local co = newthread(function(a, b) { sum = a + b })
    co.call(7, 35)
    check(sum == 42, "newthread args, got " + sum)
    print("test 2 (newthread args) passed\n")
}

// ── Test 3: newthread can suspend via await inside an `async function` ───
//   (newthread + async compose: the inner async function returns a Task.)
{
    local loop = GLib.MainLoop.new(null, false)
    local done = false
    newthread(function() {
        async function inner() { await sqgi.sleep(20) }
        inner().then(function(_) { done = true; loop.quit() })
    }).call()
    loop.run()
    check(done, "newthread + async/await must complete")
    print("test 3 (newthread + async) passed\n")
}

print("test_newthread.nut passed\n")
