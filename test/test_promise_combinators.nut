// test/test_promise_combinators.nut
//
// Tests sqgi.all and sqgi.race.

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── 1. sqgi.all resolves with array of results ────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local results = null
    local a = sqgi.sleep(20)
    local b = sqgi.sleep(40)
    local c = sqgi.sleep(10)
    sqgi.all([a, b, c]).then(function(r) {
        results = r
        loop.quit()
    })
    loop.run()
    check(results != null && results.len() == 3,
          "sqgi.all should resolve with 3 results")
    check(typeof results[0] == "integer", "result[0] should be int (sleep elapsed)")
}

// ── 2. sqgi.all rejects on first rejection ────────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local err = null
    local t1 = sqgi.Task()
    local t2 = sqgi.Task()
    sqgi.timeout_add(10, function() { t2.reject("nope"); return false })
    sqgi.timeout_add(50, function() { t1.resolve(1); return false })
    sqgi.all([t1, t2]).catch(function(e) {
        err = e
        loop.quit()
    })
    loop.run()
    check(err == "nope", "expected rejection 'nope', got: " + err)
}

// ── 3. sqgi.all with empty array resolves immediately with [] ─────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local r = null
    sqgi.all([]).then(function(v) { r = v; loop.quit() })
    sqgi.timeout_add(50, function() { loop.quit(); return false })
    loop.run()
    check(r != null && r.len() == 0, "sqgi.all([]) should resolve with []")
}

// ── 4. sqgi.all unwraps non-task values ───────────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local r = null
    sqgi.all([42, "hi", sqgi.sleep(10)]).then(function(v) { r = v; loop.quit() })
    loop.run()
    check(r != null && r.len() == 3, "expected 3 results")
    check(r[0] == 42 && r[1] == "hi", "non-task values should pass through")
}

// ── 5. sqgi.race resolves with first settler ──────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local winner = null
    local fast = sqgi.sleep(10)
    local slow = sqgi.sleep(200)
    sqgi.race([slow, fast]).then(function(v) {
        winner = v
        loop.quit()
    })
    loop.run()
    check(winner != null, "race should resolve")
}

// ── 6. sqgi.race rejects if first settler rejects ─────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local err = null
    local t = sqgi.Task()
    local slow = sqgi.sleep(200)
    sqgi.timeout_add(10, function() { t.reject("first"); return false })
    sqgi.race([slow, t]).catch(function(e) {
        err = e
        loop.quit()
    })
    loop.run()
    check(err == "first", "race should reject with first error, got: " + err)
}

print("OK\n")
