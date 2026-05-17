// test/test_marshal_argcount.nut — Argument-count validation on GI calls.

local GLib = import("GLib")
local Gio  = import("Gio")

local passed = 0
local failed = 0

function check(name, cond) {
    if (cond) { print("[PASS] " + name + "\n"); passed++ }
    else      { print("[FAIL] " + name + "\n"); failed++ }
}

function throws(fn) {
    try { fn(); return false } catch (e) { return true }
}

// ── Zero-arg function: rejects extra args ────────────────────────────────
check("get_monotonic_time(0) ok",       !throws(function(){ GLib.get_monotonic_time() }))
check("get_monotonic_time(1) throws",    throws(function(){ GLib.get_monotonic_time(1) }))
check("get_monotonic_time(2) throws",    throws(function(){ GLib.get_monotonic_time("a","b") }))

// ── One-arg function: rejects too few / too many ─────────────────────────
check("Application.id_is_valid(1) ok",
      !throws(function(){ Gio.Application.id_is_valid("org.sqgi.test") }))
check("Application.id_is_valid(0) throws",
      throws(function(){ Gio.Application.id_is_valid() }))
check("Application.id_is_valid(2) throws",
      throws(function(){ Gio.Application.id_is_valid("a", "b") }))

// ── Methods on instances also validate ───────────────────────────────────
local app = Gio.Application.new("org.sqgi.argcount", Gio.ApplicationFlags.flags_none)
check("app.set_inactivity_timeout(1) ok",
      !throws(function(){ app.set_inactivity_timeout(100) }))
check("app.set_inactivity_timeout(0) throws",
      throws(function(){ app.set_inactivity_timeout() }))
check("app.set_inactivity_timeout(2) throws",
      throws(function(){ app.set_inactivity_timeout(1, 2) }))

// ── Methods with array-length args accept either style ───────────────────
// app.run(argv) — argv array, argc auto-computed from len  (new style)
// app.run(argc, argv) — both passed explicitly             (back-compat)
check("app.run(null) accepted (auto-length)",
      !throws(function(){ app.connect("activate", function(){ app.quit() }); app.run(null) }))

print("\nResults: " + passed + " passed, " + failed + " failed\n")
if (failed > 0) ::exit(1)
