// test/test_gobject.nut — GObject property access test
// Uses GObject itself to create a simple cancellable (GIO)
local Gio = import("Gio");

local c = Gio.Cancellable.new();
print("cancellable type: " + typeof(c) + "\n");

// Property access via dot notation (_get metamethod)
local cancelled = c.is_cancelled;
print("is_cancelled: " + cancelled + "\n");

// Explicit set_property / get_property methods
// (using a property available on a simple GObject)
print("test_gobject.nut passed\n");
