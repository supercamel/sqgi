// test/test_async.nut — JS-style async/await tests on the SQGI runtime.
//
// Covers:
//   1. sqgi.timeout_add / sqgi.source_remove (low-level GLib timeout)
//   2. await sqgi.sleep(ms) inside `async function`
//   3. async function auto-wrap: calling it returns a Task
//   4. Concurrent awaits in independent async tasks
//   5. Task.then / Task.catch chaining
//   6. Manual sqgi.Task() + resolve / reject

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── Test 1: timeout_add + source_remove ───────────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local ticks = 0
    sqgi.timeout_add(20, function() {
        ticks++
        if (ticks >= 3) { loop.quit(); return false }
        return true
    })
    loop.run()
    check(ticks == 3, "expected 3 ticks, got " + ticks)

    // source_remove: schedule then cancel.
    local fired = false
    local src = sqgi.timeout_add(20, function() { fired = true; return false })
    sqgi.source_remove(src)

    local guard = GLib.MainLoop.new(null, false)
    sqgi.timeout_add(60, function() { guard.quit(); return false })
    guard.run()
    check(!fired, "cancelled source must not fire")
    print("test 1 (timeout_add/source_remove) passed\n")
}

// ── Test 2: await sqgi.sleep inside async function ─────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local elapsed = -1

    async function nap() {
        elapsed = await sqgi.sleep(40)
        loop.quit()
    }

    local t = nap()
    check(typeof t == "table", "async function must return a Task (table)")
    loop.run()
    check(elapsed >= 30, "elapsed must be ~40ms, got " + elapsed)
    print("test 2 (await sqgi.sleep) passed\n")
}

// ── Test 3: async function auto-wrap returns a settled Task ───────────────
{
    async function compute() { return 42 }
    local t = compute()
    check(typeof t == "table", "must return a Task")
    check(t.__done == true, "sync async must be done immediately")
    check(t.__result == 42, "sync async result must be 42, got " + t.__result)
    print("test 3 (sync async wrap) passed\n")
}

// ── Test 4: concurrent async tasks ────────────────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local results = []

    async function delay_push(label, ms) {
        await sqgi.sleep(ms)
        results.push(label)
    }

    delay_push("C", 180)
    delay_push("A", 60)
    delay_push("B", 120)

    sqgi.timeout_add(360, function() { loop.quit(); return false })
    loop.run()

    check(results.len() == 3, "expected 3 results, got " + results.len())
    check(results[0] == "A", "expected A first, got " + results[0])
    check(results[1] == "B", "expected B second, got " + results[1])
    check(results[2] == "C", "expected C third, got " + results[2])
    print("test 4 (concurrent awaits) passed\n")
}

// ── Test 5: Task.then / Task.catch chaining ───────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local got = null
    local caught = null
    local finished = 0

    async function answer() { await sqgi.sleep(20); return 7 }
    async function boom()   { await sqgi.sleep(20); throw "kaboom" }

    answer().then(function(v) {
        got = v
        finished++
        if (finished >= 2) loop.quit()
    })

    boom().catch(function(e) {
        caught = e
        finished++
        if (finished >= 2) loop.quit()
    })

    loop.run()
    check(got == 7, "then(answer) must receive 7, got " + got)
    check(caught == "kaboom", "catch(boom) must receive 'kaboom', got " + caught)
    print("test 5 (then/catch) passed\n")
}

// ── Test 6: manual sqgi.Task() + resolve / reject ──────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local resolved = null
    local rejected = null
    local done_count = 0

    local t_ok = sqgi.Task()
    local t_err = sqgi.Task()

    t_ok.then(function(v)  { resolved = v; if (++done_count == 2) loop.quit() })
    t_err.catch(function(e){ rejected = e; if (++done_count == 2) loop.quit() })

    sqgi.timeout_add(20, function() { t_ok.resolve("ok");  return false })
    sqgi.timeout_add(20, function() { t_err.reject("bad"); return false })

    loop.run()
    check(resolved == "ok",  "resolved value mismatch: " + resolved)
    check(rejected == "bad", "rejected value mismatch: " + rejected)
    print("test 6 (manual Task) passed\n")
}

print("test_async.nut passed\n")
