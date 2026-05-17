// test/test_signals.nut — Signal connect / disconnect test
local GLib = import("GLib");
local Gio  = import("Gio");

// GFileMonitor emits "changed"; use a MemoryOutputStream as a simpler target.
// We'll use GObject "notify" signal on a Cancellable instead since every
// GObject supports it.
local c = Gio.Cancellable.new();

local fired = false;
local handler_id = c.connect("cancelled", function() {
    fired = true;
    print("signal 'cancelled' fired!\n");
});

print("handler id: " + handler_id + "\n");

// Trigger the signal
c.cancel();

if (fired) {
    print("test_signals.nut passed\n");
} else {
    print("FAIL: signal did not fire\n");
    return 1;
}
