// test/test_glib.nut — Basic GLib import and function call
local GLib = import("GLib");
print("GLib version: " + GLib.MAJOR_VERSION + "." + GLib.MINOR_VERSION + "\n");

local t = GLib.get_monotonic_time();
print("Monotonic time: " + t + "\n");

print("test_glib.nut passed\n");
