/**
 * test_application_run_crash_regression.nut
 *
 * Regression test for the closure/ref-lifetime crash seen when running a
 * Gio.Application with an activate signal callback.
 */

local Gio = import("Gio")

local app = Gio.Application.new("org.sqgi.test.crashreg", Gio.ApplicationFlags.flags_none)

local activated = false
local handler_id = app.connect("activate", function() {
    activated = true
    app.quit()
})

if (typeof handler_id != "integer" || handler_id <= 0) {
    print("[FAIL] connect() did not return a valid handler id")
    ::exit(1)
}

local ret = app.run(0, null)
if (!activated) {
    print("[FAIL] activate callback did not run")
    ::exit(1)
}

if (ret != 0) {
    print("[FAIL] app.run() returned non-zero")
    ::exit(1)
}

print("test_application_run_crash_regression.nut passed")
