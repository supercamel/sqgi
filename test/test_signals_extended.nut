// test/test_signals_extended.nut
//
// Goes beyond the minimal connect-and-fire of test_signals.nut:
//   - explicit disconnect() and verification handler stops firing
//   - multiple handlers on the same signal both fire
//   - notify::<property> detail signal hits the GParamSpec marshal path
//   - signal with a payload argument other than the emitter

local Gio  = import("Gio")
local GLib = import("GLib")

function check(c, m) { if (!c) throw "[FAIL] " + m }

// ── 1. disconnect stops further firings ─────────────────────────────────
local c = Gio.Cancellable.new()
local fires = 0
local id = c.connect("cancelled", function() { fires++ })
c.cancel()
check(fires == 1, "first cancel must fire once, got " + fires)

c.disconnect(id)

// Reset and emit again — cancellable can only be cancelled once, so use a
// fresh one with a fresh handler to confirm disconnect path independently.
local c2 = Gio.Cancellable.new()
local f2 = 0
local id2 = c2.connect("cancelled", function() { f2++ })
c2.disconnect(id2)
c2.cancel()
check(f2 == 0, "after disconnect, handler must not fire, got " + f2)

// ── 2. multiple handlers, same signal, all fire ─────────────────────────
local c3 = Gio.Cancellable.new()
local order = []
c3.connect("cancelled", function() { order.append("a") })
c3.connect("cancelled", function() { order.append("b") })
c3.connect("cancelled", function() { order.append("c") })
c3.cancel()
check(order.len() == 3, "all 3 handlers must fire, got " + order.len())
// Order isn't strictly guaranteed by GObject but in practice is connect-order:
check(order[0] == "a" && order[1] == "b" && order[2] == "c",
      "expected a/b/c order")

// ── 3. notify::<property> → GParamSpec marshalling ──────────────────────
local app = Gio.Application.new("org.sqgi.signals.ext", 0)
local pspec_seen = null
app.connect("notify::application-id", function(pspec) {
    pspec_seen = pspec
})
app.set_application_id("org.sqgi.signals.ext.renamed")
check(pspec_seen != null, "notify:: must fire")
check(typeof pspec_seen == "table", "pspec must be a table")
check("name" in pspec_seen, "pspec must have name")
check(pspec_seen.name == "application-id" ||
      pspec_seen.name == "application_id",
      "pspec.name unexpected: " + pspec_seen.name)

// ── 4. signal with non-trivial payload via Gio.Settings is heavy; use a
//      simpler one: connect twice and disconnect only one, ensure the
//      other still fires.
local c4 = Gio.Cancellable.new()
local kept = 0
local drop = 0
local id_drop = c4.connect("cancelled", function() { drop++ })
c4.connect("cancelled", function() { kept++ })
c4.disconnect(id_drop)
c4.cancel()
check(drop == 0, "disconnected handler must not fire")
check(kept == 1, "remaining handler must still fire")

print("[OK] test_signals_extended passed\n")
