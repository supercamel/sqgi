/**
 * test_application.nut
 *
 * Tests Gio.Application construction and core API surface that does not
 * require entering g_application_run().
 */

local Gio = import("Gio")

local passed = 0
local failed = 0

function check(name, cond) {
    if (cond) {
        print("[PASS] " + name)
        passed++
    } else {
        print("[FAIL] " + name)
        failed++
    }
}

// Validate static helper
check("Application.id_is_valid(valid)", Gio.Application.id_is_valid("org.sqgi.test.app"))
check("Application.id_is_valid(invalid)", !Gio.Application.id_is_valid("bad id"))

// Create app instance
local app = Gio.Application.new("org.sqgi.test.application", Gio.ApplicationFlags.flags_none)
check("Application created", app != null)
check("Application id getter", app.get_application_id() == "org.sqgi.test.application")

// Flags round-trip
app.set_flags(Gio.ApplicationFlags.handles_open)
check("Application flags setter/getter", app.get_flags() == Gio.ApplicationFlags.handles_open)

// Inactivity timeout round-trip
app.set_inactivity_timeout(250)
check("Application inactivity timeout", app.get_inactivity_timeout() == 250)

// Register without entering run() and verify state flips
check("Application starts unregistered", !app.get_is_registered())
check("Application register(null)", app.register(null))
check("Application registered state", app.get_is_registered())

// Busy state and hold/release APIs
check("Application starts not busy", !app.get_is_busy())
app.mark_busy()
check("Application mark_busy", app.get_is_busy())
app.unmark_busy()
check("Application unmark_busy", !app.get_is_busy())
app.hold()
app.release()
check("Application hold/release callable", true)

// Run lifecycle: verify signal callback + clean shutdown through app.run().
local activated = false
app.connect("activate", function() {
    activated = true
    app.quit()
})
local run_ret = app.run(0, null)
check("Application activate signal fired", activated)
check("Application run returns 0", run_ret == 0)

print("")
print("Results: " + passed + " passed, " + failed + " failed")
if (failed > 0) {
    print("FAILED")
    ::exit(1)
}
print("ALL TESTS PASSED")
