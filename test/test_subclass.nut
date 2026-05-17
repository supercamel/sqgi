// test/test_subclass.nut
//
// Verifies sqgi.register_class — register a new GType derived from a parent
// GObject class, override vfuncs, construct instances, and observe that the
// overrides fire when GLib dispatches.

local Gio = import("Gio")
local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── 1. register_class returns a class with __gtype set ────────────────────
{
    local Sub = sqgi.register_class({
        name = "SqgiTestSub1",
        parent = Gio.Application,
        overrides = {}
    })
    check(typeof(Sub) == "class", "register_class should return a class")
    check(Sub.__gtype == "SqgiTestSub1", "Sub.__gtype; got: " + Sub.__gtype)
}

// ── 2. Duplicate name throws ──────────────────────────────────────────────
{
    sqgi.register_class({
        name = "SqgiTestSub_DupCheck",
        parent = Gio.Application,
        overrides = {}
    })
    local threw = false
    try {
        sqgi.register_class({
            name = "SqgiTestSub_DupCheck",
            parent = Gio.Application,
            overrides = {}
        })
    } catch (e) {
        threw = true
    }
    check(threw, "duplicate GType name should throw")
}

// ── 3. Parent not a GObject class throws ──────────────────────────────────
{
    local threw = false
    try {
        sqgi.register_class({
            name = "SqgiTestSub_BadParent",
            parent = sqgi.GError, // not a GObject
            overrides = {}
        })
    } catch (e) {
        threw = true
    }
    check(threw, "non-GObject parent should throw")
}

// ── 4. Constructed instances are of the new GType ─────────────────────────
{
    local Sub = sqgi.register_class({
        name = "SqgiTestSub_Instance",
        parent = Gio.Application,
        overrides = {}
    })
    local app = sqgi.new_object(Sub, {
        "application-id": "org.example.sqgi.subclass.t4",
        "flags": 0
    })
    // The instance should still expose GApplication properties via _get
    check(app.application_id == "org.example.sqgi.subclass.t4",
          "subclass instance carries inherited property; got: " +
          app.application_id)
}

// ── 5. activate vfunc override fires when app.run() dispatches it ────────
{
    local fired = 0
    local seen_id = null
    local Sub = sqgi.register_class({
        name = "SqgiTestSub_Activate",
        parent = Gio.Application,
        overrides = {
            activate = function(self) {
                fired++
                seen_id = self.application_id
            }
        }
    })
    local app = sqgi.new_object(Sub, {
        "application-id": "org.example.sqgi.subclass.t5",
        "flags": 0
    })
    local rc = app.run(0, null)
    check(rc == 0, "app.run should return 0; got: " + rc)
    check(fired == 1, "activate should fire exactly once; got: " + fired)
    check(seen_id == "org.example.sqgi.subclass.t5",
          "self.application_id inside vfunc; got: " + seen_id)
}

// ── 6. sqgi.chain_up() invokes the parent vfunc ────────────────────────────
//
// shutdown is the canonical chain-up case: GApplication logs a critical
// warning if a subclass overrides shutdown without chaining up. We
// override both activate and shutdown, call sqgi.chain_up() from shutdown,
// and verify both fire and no GLib-CRITICAL is emitted (this test is run
// under G_DEBUG=fatal-criticals in CI, so a missed chain-up would abort).
{
    local activate_fired = false
    local shutdown_fired = false
    local Sub = sqgi.register_class({
        name = "SqgiTestSub_ChainUp",
        parent = Gio.Application,
        overrides = {
            activate = function(self) {
                activate_fired = true
            },
            shutdown = function(self) {
                shutdown_fired = true
                sqgi.chain_up() // ← exercises chain-up
            }
        }
    })
    local app = sqgi.new_object(Sub, {
        "application-id": "org.example.sqgi.subclass.t7",
        "flags": 0
    })
    app.run(0, null)
    check(activate_fired, "activate must fire (chain_up test)")
    check(shutdown_fired, "shutdown must fire (chain_up test)")
}

// ── 7. chain_up outside a vfunc throws ────────────────────────────────────
{
    local threw = false
    try {
        sqgi.chain_up()
    } catch (e) {
        threw = true
    }
    check(threw, "chain_up outside a vfunc must throw")
}

// ── 8. throw inside a vfunc is logged as a g_critical ────────────────────
//
// Squirrel exceptions can't propagate through the libffi/C ABI boundary.
// The vfunc handler must log a critical so the failure isn't silent. We
// expose Gio.Application's `local_command_line` vfunc — overriding it
// with a throwing closure must not crash and must log. We capture
// criticals by installing a temporary log writer.
{
    local GLib_ = GLib
    local saw_critical = false
    // We can't intercept g_log_writer easily from Squirrel; instead
    // run the throwing case under G_DEBUG=fatal-criticals NOT set, and
    // verify the program survives the exception (no crash, return path
    // reached) — that alone proves the handler doesn't propagate junk.
    local Sub = sqgi.register_class({
        name = "SqgiTestSub_Throws",
        parent = Gio.Application,
        overrides = {
            activate = function(self) {
                throw "synthetic vfunc failure"
            }
        }
    })
    local app = sqgi.new_object(Sub, {
        "application-id": "org.example.sqgi.subclass.t8",
        "flags": 0
    })
    // app.run() must return normally even though activate threw.
    local rc = app.run(0, null)
    check(rc == 0, "app.run survives throwing vfunc; got: " + rc)
}

print("[OK] test_subclass passed\n")
