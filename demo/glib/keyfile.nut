/**
 * demo/glib/keyfile.nut
 *
 * Write an INI-style config file with GLib.KeyFile, then read it back.
 *
 * Usage: sqgi demo/glib/keyfile.nut
 *
 * Exercises:
 *   - GLib.KeyFile.new + typed setters
 *   - to_data() to render INI text
 *   - load_from_data + typed getters (round-trip)
 */

local GLib = import("GLib")

local kf = GLib.KeyFile.new()

kf.set_string("server",  "host",  "localhost")
kf.set_integer("server", "port",  8080)
kf.set_boolean("server", "tls",   false)
kf.set_double("server",  "ratio", 1.25)
kf.set_string_list("server", "tags", ["api", "internal", "v1"])

kf.set_string("logging", "level", "info")
kf.set_string("logging", "path",  "/var/log/app.log")

local text = kf.to_data()
if (typeof(text) == "array") text = text[0]
print("== rendered ini ==\n")
print(text)

local kf2 = GLib.KeyFile.new()
kf2.load_from_data(text, text.len(), GLib.KeyFileFlags.none)

print("\n== read back ==\n")
print("  host:  " + kf2.get_string("server",  "host")  + "\n")
print("  port:  " + kf2.get_integer("server", "port")  + "\n")
print("  tls:   " + kf2.get_boolean("server", "tls")   + "\n")
print("  ratio: " + kf2.get_double("server",  "ratio") + "\n")
foreach (s in kf2.get_groups()[0]) print("  group: " + s + "\n")
