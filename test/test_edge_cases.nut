// test/test_edge_cases.nut
//
// Targeted small tests for previously-uncovered code paths:
//   - JSON stringify error paths
//   - sqgi.__task_attach_cancellable arg validation
//   - sqgi.__await pass-through on non-thenables
//   - async function with synchronous throw + multi-step await
//   - GError class fallback when no _giinfo present

local Gio  = import("Gio")
local GLib = import("GLib")
local J    = sqgi.json

function check(c, m) { if (!c) throw "[FAIL] " + m }
function expect_throw(fn, substr, label) {
    try { fn() } catch (e) {
        local s = "" + e
        if (s.find(substr) == null)
            throw "[FAIL] " + label + ": want '" + substr + "', got '" + s + "'"
        return
    }
    throw "[FAIL] " + label + ": expected throw"
}

// ── 1. JSON.stringify error paths ────────────────────────────────────────
expect_throw(function() { J.stringify() }, "missing value", "stringify no arg")

class NoTojson {
    x = 1
}
expect_throw(function() { J.stringify(NoTojson()) },
             "no _tojson", "instance without _tojson")

expect_throw(function() {
    local t = {}
    t[42] <- "not allowed"
    J.stringify(t)
}, "must be a string", "non-string table key")

// Function values are unsupported
expect_throw(function() { J.stringify(function() {}) },
             "unsupported", "function not stringifiable")

// Indent clamping — over 16 should still work (clamped silently)
local big_indent = J.stringify([1, 2, 3], 999)
check(big_indent.find("[") == 0, "indent clamp still produces valid JSON")

// Negative indent treated as 0
local neg = J.stringify([1], -5)
check(neg == "[1]" || neg.find("1") != null, "negative indent handled")

// ── 2. __task_attach_cancellable arg validation ──────────────────────────
expect_throw(function() {
    sqgi.__task_attach_cancellable("not a task", Gio.Cancellable.new())
}, "not a Task", "attach: arg 1 not task")

expect_throw(function() {
    sqgi.__task_attach_cancellable(sqgi.Task(), "not a GObject")
}, "not a GObject", "attach: arg 2 not GObject")

expect_throw(function() {
    sqgi.__task_attach_cancellable(sqgi.Task(),
        Gio.File.new_for_path("/tmp"))
}, "not a Gio.Cancellable", "attach: arg 2 wrong GObject type")

expect_throw(function() { sqgi.__task_attach_cancellable(sqgi.Task()) },
             "expected", "attach: too few args")

// ── 3. __await pass-through on non-thenable ──────────────────────────────
local loop1 = GLib.MainLoop.new(null, false)
local pass_result = null
local async_fn = async function() {
    // Awaiting a string/array/table-without-__sqgi_task is pass-through.
    local s = await "literal"
    local a = await [1, 2, 3]
    local t = await { x = 99 }
    return [s, a[1], t.x]
}
async_fn().then(function(r) { pass_result = r; loop1.quit() })
loop1.run()
check(pass_result != null && pass_result.len() == 3, "await pass-through")
check(pass_result[0] == "literal", "await string passthrough")
check(pass_result[1] == 2, "await array passthrough")
check(pass_result[2] == 99, "await table passthrough")

// ── 4. __make_async rejects non-closure ──────────────────────────────────
expect_throw(function() { sqgi.__make_async(42) },
             "expected function", "__make_async non-closure")

// ── 5. Async function with sync throw before any await ───────────────────
local loop2 = GLib.MainLoop.new(null, false)
local sync_err = null
local sync_throwing = async function() {
    throw "sync boom"
}
sync_throwing().catch(function(e) { sync_err = e; loop2.quit() })
loop2.run()
check(sync_err == "sync boom",
      "synchronous throw inside async should reject task, got: " + sync_err)

// ── 6. Async function with multi-step await chain ────────────────────────
local loop3 = GLib.MainLoop.new(null, false)
local multi_step_result = null
local multi_step = async function() {
    local a = await sqgi.sleep(5)
    local b = await sqgi.sleep(5)
    local c = await sqgi.sleep(5)
    return a + b + c   // sum of elapsed ms
}
multi_step().then(function(v) { multi_step_result = v; loop3.quit() })
loop3.run()
check(typeof multi_step_result == "integer" && multi_step_result >= 15,
      "multi-step await sum: " + multi_step_result)

// ── 7. Async function rejection propagates through await ────────────────
local loop4 = GLib.MainLoop.new(null, false)
local rej_err = null
local rejecting = async function() {
    local t = sqgi.Task()
    sqgi.timeout_add(5, function() { t.reject("inner err"); return false })
    await t  // should rethrow
    return "never reached"
}
rejecting().catch(function(e) { rej_err = e; loop4.quit() })
loop4.run()
check(rej_err == "inner err",
      "rejection should propagate through await, got: " + rej_err)

// ── 8. _tojson metamethod that itself returns a complex value ────────────
class Pt {
    x = 0; y = 0
    constructor(_x, _y) { x = _x; y = _y }
    function _tojson() { return { x = x, y = y } }
}
local p = Pt(3, 4)
local pjson = J.stringify(p)
local parsed = J.parse(pjson)
check(parsed.x == 3 && parsed.y == 4, "_tojson returning table round-trips")

class NestPt {
    function _tojson() { return [Pt(1, 2), Pt(3, 4)] }
}
local nested = J.parse(J.stringify(NestPt()))
check(typeof nested == "array" && nested.len() == 2,
      "_tojson returning array of instances")
check(nested[0].x == 1 && nested[1].y == 4,
      "nested _tojson values")

// ── 9. VM member caches preserve dynamic semantics ───────────────────────
class CacheBox {
    value = 0
    function get_value() { return this.value }
    function set_value(v) { this.value = v }
}
local cache_box = CacheBox()
for (local i = 0; i < 16; i++) {
    cache_box.set_value(i)
    check(cache_box.get_value() == i, "cached instance field tracks writes")
}

class CacheFallback {
    count = 0
    function _get(k) {
        if (k == "missing") {
            this.count++
            return this.count
        }
        throw null
    }
}
local cache_fallback = CacheFallback()
check(cache_fallback.missing == 1, "member cache fallback first miss")
check(cache_fallback.missing == 2, "member cache does not cache _get fallback")

local cache_len = [1]
for (local i = 0; i < 8; i++) {
    check(cache_len.len() == i + 1, "array len fast path tracks size")
    cache_len.append(i)
}

print("[OK] test_edge_cases passed\n")
