// test/test_subclass_vfuncs.nut
//
// Targets the non-void return-type branches in sqgi_subclass.c's vfunc
// trampoline by overriding vfuncs whose return tags differ from VOID.
//
//   handle_local_options → returns gint32   → INT32 branch
//   handler throws       → error path (memset ret to 0)

local Gio = import("Gio")
local GLib = import("GLib")

function check(c, m) { if (!c) throw "[FAIL] " + m }

// ── handle_local_options returns int32 ───────────────────────────────────
{
    local opts_fired = 0
    local Sub = sqgi.register_class({
        name = "SqgiVfuncRetInt",
        parent = Gio.Application,
        overrides = {
            activate = function(self) {},
            handle_local_options = function(self, options) {
                opts_fired++
                return -1  // -1 = continue normal processing
            }
        }
    })
    local app = sqgi.new_object(Sub, {
        "application-id": "org.example.sqgi.vfunc.ret.int",
        "flags": 0
    })
    local rc = app.run(0, null)
    check(rc == 0, "app.run rc=" + rc)
    check(opts_fired >= 1, "handle_local_options fired: " + opts_fired)
}

// ── vfunc handler that throws → exercises error path (memset 0) ──────────
{
    local fired = 0
    local Sub = sqgi.register_class({
        name = "SqgiVfuncThrow",
        parent = Gio.Application,
        overrides = {
            activate = function(self) {},
            handle_local_options = function(self, options) {
                fired++
                throw "intentional"  // exercise error path: critical + zeroed ret
            }
        }
    })
    local app = sqgi.new_object(Sub, {
        "application-id": "org.example.sqgi.vfunc.throw",
        "flags": 0
    })
    // We expect run to proceed (g_critical logs but doesn't abort by default).
    // The thrown error gets logged; run returns normally.
    local rc = app.run(0, null)
    check(fired >= 1, "throwing vfunc still fired: " + fired)
    check(typeof rc == "integer", "rc is int after throw: " + typeof rc)
}

print("[OK] test_subclass_vfuncs passed\n")
