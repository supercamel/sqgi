// test/test_new_object.nut
//
// Verifies sqgi.new_object(Class, {prop=value, ...}) — constructs a GObject
// via g_object_new_with_properties.

local Gio = import("Gio")
local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── 1. Empty property bag works (no-arg construction) ────────────────────
{
    local c = sqgi.new_object(Gio.Cancellable, {})
    check(c.is_cancelled() == false, "fresh cancellable should not be cancelled")
    c.cancel()
    check(c.is_cancelled() == true, "cancel() should set cancelled state")
}

// ── 2. Construct-time properties are applied ─────────────────────────────
{
    local app = sqgi.new_object(Gio.Application, {
        "application-id": "org.example.sqgi.newobj"
    })
    check(app.application_id == "org.example.sqgi.newobj",
          "application-id not applied; got: " + app.application_id)
}

// ── 3. Unknown property throws ───────────────────────────────────────────
{
    local threw = false
    try {
        sqgi.new_object(Gio.Cancellable, { "does-not-exist": 1 })
    } catch (e) {
        threw = true
    }
    check(threw, "unknown property should throw")
}

// ── 4. Non-class arg throws ──────────────────────────────────────────────
{
    local threw = false
    try { sqgi.new_object("not a class", {}) } catch (e) { threw = true }
    check(threw, "non-class arg should throw")
}

print("OK\n")
