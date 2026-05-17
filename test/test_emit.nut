// test/test_emit.nut — Tests for the GObject.emit() binding.

local Gio  = import("Gio")
local GLib = import("GLib")

local passed = 0
local failed = 0

function check(name, cond) {
    if (cond) { print("[PASS] " + name + "\n"); passed++ }
    else      { print("[FAIL] " + name + "\n"); failed++ }
}

// ── Emit a zero-arg signal ────────────────────────────────────────────────
local c1 = Gio.Cancellable.new()
local fired = 0
c1.connect("cancelled", function() { fired++ })
c1.emit("cancelled")
check("zero-arg emit fires handler", fired == 1)

c1.emit("cancelled")
c1.emit("cancelled")
check("subsequent emits accumulate", fired == 3)

// ── Wrong argument count throws ──────────────────────────────────────────
local c2 = Gio.Cancellable.new()
local threw = false
try { c2.emit("cancelled", "extra-arg") } catch (e) { threw = true }
check("emit with too many args throws", threw)

// ── Unknown signal throws ────────────────────────────────────────────────
threw = false
try { c2.emit("no-such-signal") } catch (e) { threw = true }
check("emit with unknown signal throws", threw)

// ── Emit on disconnected handler does nothing ────────────────────────────
local c3 = Gio.Cancellable.new()
local hits = 0
local id = c3.connect("cancelled", function() { hits++ })
c3.disconnect(id)
c3.emit("cancelled")
check("emit after disconnect does not fire", hits == 0)

// ── Emit with detail (notify::propname) ──────────────────────────────────
// Construct an Application so we have a notifyable property.
local app = Gio.Application.new("org.sqgi.emit.test", Gio.ApplicationFlags.flags_none)
local notify_fired = 0
local pname = ""
app.connect("notify::application-id", function(pspec) {
    notify_fired++
    pname = pspec.name
})
app.set_application_id("org.sqgi.emit.test.changed")
check("notify::property fires on set", notify_fired == 1)
check("pspec.name carries property name",
      pname == "application-id" || pname == "application_id")

// ── Done ─────────────────────────────────────────────────────────────────
print("\nResults: " + passed + " passed, " + failed + " failed\n")
if (failed > 0) ::exit(1)
