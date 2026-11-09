local GLib = import("GLib", "2.0");
entry_value <- GLib.get_monotonic_time() > 0 ? 42 : 0;
