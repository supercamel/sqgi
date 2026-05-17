// test/test_stack_balance.nut — Stress the GI bridge to surface stack-balance
// regressions. Builds with NDEBUG off triggers SQGI_STACK_CHECK_END abort()
// on any imbalance.

local GLib = import("GLib")
local Gio  = import("Gio")

local passed = 0
local failed = 0
function check(name, cond) {
    if (cond) { print("[PASS] " + name + "\n"); passed++ }
    else      { print("[FAIL] " + name + "\n"); failed++ }
}

// ── Many namespace imports (cache hit/miss paths) ────────────────────────
for (local i = 0; i < 50; i++) {
    local g = import("GLib")
    local gio = import("Gio")
    assert(g.get_monotonic_time != null)
    assert(gio.Application != null)
}
check("repeated imports stable", true)

// ── Repeated method calls + property gets ────────────────────────────────
local app = Gio.Application.new("org.sqgi.stack.test", Gio.ApplicationFlags.flags_none)
for (local i = 0; i < 100; i++) {
    app.set_inactivity_timeout(i)
    assert(app.get_inactivity_timeout() == i)
}
check("100x property round-trip stable", true)

// ── Signal connect/disconnect churn ──────────────────────────────────────
local ids = []
for (local i = 0; i < 50; i++) {
    ids.push(app.connect("activate", function() {}))
}
foreach (id in ids) app.disconnect(id)
check("50x connect/disconnect stable", true)

// ── Error path: bad index lookup repeated ────────────────────────────────
for (local i = 0; i < 20; i++) {
    try { local x = Gio.NoSuchSymbol } catch (e) {}
}
check("error path doesn't leak stack", true)

print("\nResults: " + passed + " passed, " + failed + " failed\n")
if (failed > 0) ::exit(1)
