// test/test_gvalue.nut — GValue marshaling round-trips via GObject properties.

local Gio  = import("Gio")
local GLib = import("GLib")

local passed = 0
local failed = 0
function check(name, cond) {
    if (cond) { print("[PASS] " + name + "\n"); passed++ }
    else      { print("[FAIL] " + name + "\n"); failed++ }
}

local app = Gio.Application.new("org.sqgi.gvalue.test", Gio.ApplicationFlags.flags_none)

// ── String property round-trip ────────────────────────────────────────────
app.set_application_id("org.sqgi.gvalue.string")
check("string property round-trips",
      app.get_application_id() == "org.sqgi.gvalue.string")

// ── uint property round-trip via inactivity-timeout ──────────────────────
app.set_inactivity_timeout(1234)
check("uint property round-trips", app.get_inactivity_timeout() == 1234)

// ── flags property round-trip ────────────────────────────────────────────
app.set_flags(Gio.ApplicationFlags.handles_open)
check("flags property round-trips",
      app.get_flags() == Gio.ApplicationFlags.handles_open)

// ── bool property via is-registered (read-only) ──────────────────────────
check("bool property reads as Squirrel bool",
      typeof(app.get_is_registered()) == "bool")

// ── Property notification fires with usable pspec table ──────────────────
local got_pspec = null
app.connect("notify::application-id", function(pspec) {
    got_pspec = pspec
})
app.set_application_id("org.sqgi.gvalue.notified")
check("notify:: pspec is a table",  typeof(got_pspec) == "table")
check("notify:: pspec has name key", "name" in got_pspec)
check("notify:: pspec has nick key", "nick" in got_pspec)
check("notify:: pspec has blurb key","blurb" in got_pspec)
check("notify:: pspec.name matches",
      got_pspec.name == "application-id" ||
      got_pspec.name == "application_id")

print("\nResults: " + passed + " passed, " + failed + " failed\n")
if (failed > 0) ::exit(1)
