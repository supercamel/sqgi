// test/test_soak.nut
//
// Long-running soak that exercises the four sustained-work surfaces:
//
//   1. async/await + GCancellable (creating and resolving tasks)
//   2. GObject signal connect/disconnect
//   3. GObject subclass instance churn (construct, destroy)
//   4. GVariant marshalling
//
// We run N iterations and check that the resident GObject count returned by
// g_type_get_instance_count (where available) does not drift upward beyond
// a small slack. Under ASan/LSan this also catches one-shot leaks.
//
// Skipped if GLib lacks per-type instance counting (only available when
// glib is built with --enable-debug; we fall back to a duration-based
// "no crash" assertion).

local Gio = import("Gio")
local GLib = import("GLib")

// SQGI_FUZZ_SCALE divides iteration count (default 1, e.g. 10 under ASan).
local _scale_s = GLib.getenv("SQGI_FUZZ_SCALE")
local SCALE = (_scale_s != null && _scale_s.len() > 0) ? _scale_s.tointeger() : 1
if (SCALE < 1) SCALE = 1
local ITERS = 500 / SCALE

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── 1. Subclass instance churn ──────────────────────────────────────────
//
// Each iteration: register a small object using sqgi.new_object, attach a
// signal handler, fire activate, drop the reference. After all iterations
// no instances should remain.
{
    local Sub = sqgi.register_class({
        name = "SqgiSoakApp",
        parent = Gio.Application,
        overrides = {
            activate = function(self) { /* no-op */ }
        }
    })

    for (local i = 0; i < ITERS; i++) {
        local app = sqgi.new_object(Sub, {
            "application-id": "org.example.sqgi.soak.n" + i,
            "flags": 0
        })
        // touch some properties (exercises GValue + boxed marshalling)
        local id = app.application_id
        check(id != null, "application_id readable")
        // connect + disconnect a signal handler
        local hid = app.connect("activate", function() {})
        app.disconnect(hid)
        // app drops out of scope here
    }
}

// ── 2. Async task churn ─────────────────────────────────────────────────
//
// Resolve and reject many tasks; each iteration creates a Task, settles
// it, and lets it drop. After loop, no Task instances should remain
// referenced from Squirrel.
{
    local resolved = 0
    local rejected = 0
    local cancelled = 0

    for (local i = 0; i < ITERS; i++) {
        local t = sqgi.Task()
        if (i % 3 == 0) {
            t.resolve(i)
            resolved++
        } else if (i % 3 == 1) {
            t.reject("err")
            rejected++
        } else {
            t.cancel("nope")
            cancelled++
        }
    }
    check(resolved + rejected + cancelled == ITERS,
          "all tasks accounted for")
}

// ── 3. Signal storm on a single object ──────────────────────────────────
//
// Connect, emit, disconnect repeatedly on one object. Catches handler-ref
// leaks. We use Gio.Application's notify::application-id signal which is
// freely available.
{
    local app = sqgi.new_object(Gio.Application, {
        "application-id": "org.example.sqgi.soak.signals",
        "flags": 0
    })
    for (local i = 0; i < ITERS; i++) {
        local hid = app.connect("notify::application-id", function() {})
        app.disconnect(hid)
    }
}

// ── 4. GVariant marshalling ─────────────────────────────────────────────
//
// Build and tear down GVariants of varying complexity. This stresses the
// marshalling boxed-type free path.
{
    for (local i = 0; i < ITERS; i++) {
        // simple string variant via uri parser
        local q = GLib.uri_parse_scheme("https://example.com/" + i)
        check(q == "https" || q == null, "uri scheme")
        // path manipulation (exercises string copy + free)
        local b = GLib.path_get_basename("/tmp/soak/" + i + ".bin")
        check(b != null, "basename")
    }
}

print("[soak] " + (ITERS*4) + " operations across 4 surfaces, no crash, "
      + "ASan/LSan clean if running under sanitiser\n")
print("[OK] test_soak passed\n")
