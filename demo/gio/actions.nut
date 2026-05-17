/**
 * demo/gio/actions.nut
 *
 * GAction / GApplication demo: register a couple of actions on a stub
 * Application, activate them by name, and print parameter values received
 * via the action's GVariant payload.
 *
 * Exercises:
 *   - Gio.Application (custom application-id, non-unique)
 *   - Gio.SimpleAction with and without a parameter type
 *   - GLib.VariantType.new + GLib.Variant.new_string / new_int32
 *   - GAction "activate" signal carrying a GVariant payload
 *   - app.activate_action(name, parameter)
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local app = sqgi.new_object(Gio.Application, {
    "application-id":  "io.sqgi.demo.actions",
    "flags":           Gio.ApplicationFlags.flags_none,
})

// --- action 1: "hello" — no parameter ----------------------------------
local act_hello = Gio.SimpleAction.new("hello", null)
act_hello.connect("activate", function(param) {
    print("[hello] activated\n")
})
app.add_action(act_hello)

// --- action 2: "greet <name:s>" — string parameter ---------------------
// Note: the signal handler receives the GVariant payload already unwrapped
// to its native Squirrel type (string here, integer below).
local s_type     = GLib.VariantType.new("s")
local act_greet  = Gio.SimpleAction.new("greet", s_type)
act_greet.connect("activate", function(name) {
    print("[greet] hello, " + name + "!\n")
})
app.add_action(act_greet)

// --- action 3: "add <n:i>" — int32 parameter ---------------------------
local i_type     = GLib.VariantType.new("i")
local counter    = { total = 0 }
local act_add    = Gio.SimpleAction.new("add", i_type)
act_add.connect("activate", function(n) {
    counter.total += n
    print("[add] +" + n + " → total=" + counter.total + "\n")
})
app.add_action(act_add)

// Register with the session bus (or do a no-op local registration). Without
// this g_application_list_actions errors out with a critical assertion.
app.register(null)

// Inspect registered actions.
local names = app.list_actions()
local joined = ""
for (local i = 0; i < names.len(); i++)
    joined += (i ? ", " : "") + names[i]
print("registered actions: [" + joined + "]\n")

// Trigger them.
app.activate_action("hello", null)
app.activate_action("greet", GLib.Variant.new_string("Squirrel"))
app.activate_action("add",   GLib.Variant.new_int32(5))
app.activate_action("add",   GLib.Variant.new_int32(7))

print(format("final total = %d\n", counter.total))
