// test/test_async_jsstyle.nut
// Focused JS-style chaining tests (Promise-shaped Tasks).

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── Test 1: .then chain forwards values ───────────────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local final_value = null

    async function ten() { await sqgi.sleep(20); return 10 }

    ten()
      .then(function(v) { return v + 5 })
      .then(function(v) { return v * 2 })
      .then(function(v) { final_value = v; loop.quit() })

    loop.run()
    check(final_value == 30, "chained then must produce 30, got " + final_value)
    print("test 1 (then chain) passed\n")
}

// ── Test 2: .catch recovers and chain continues ───────────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local caught = null
    local after = null

    async function bad() { await sqgi.sleep(15); throw "nope" }

    bad()
      .catch(function(e) { caught = e; return "recovered" })
      .then(function(v) { after = v; loop.quit() })

    loop.run()
    check(caught == "nope", ".catch must receive thrown value")
    check(after == "recovered", ".then after .catch must see recovered value")
    print("test 2 (catch + recover) passed\n")
}

// ── Test 3: .resolve()/.reject() round-trip with await ────────────────────
{
    local loop = GLib.MainLoop.new(null, false)
    local got = null
    local caught = null

    local t1 = sqgi.Task()
    local t2 = sqgi.Task()

    async function consumer() {
        got = await t1
        try { local _ = await t2 } catch (e) { caught = e }
        loop.quit()
    }

    consumer()
    sqgi.timeout_add(20, function() { t1.resolve("alpha"); return false })
    sqgi.timeout_add(40, function() { t2.reject("beta");   return false })

    loop.run()
    check(got == "alpha",   "await on resolved Task returns payload, got " + got)
    check(caught == "beta", "await on rejected Task throws payload, got " + caught)
    print("test 3 (await + Task) passed\n")
}

print("test_async_jsstyle.nut passed\n")
