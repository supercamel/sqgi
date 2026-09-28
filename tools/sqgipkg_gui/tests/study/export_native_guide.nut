local Guide = import("../../src/native_guide.nut")
local GLib = import("GLib")
foreach (name, source in Guide.examples) GLib.file_set_contents(vargv[0] + "/" + name, source, -1)
