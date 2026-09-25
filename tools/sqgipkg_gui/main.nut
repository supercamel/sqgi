#!/usr/bin/env sqgi
local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local A = import("src/application.nut")
local filename = vargv.len() ? vargv[0] : null
if (filename == "--help" || filename == "-h") { print("Usage: sqgipkg-gui [manifest.json]\nCreate and edit manifests; run sqgipkg to produce packages.\n"); return 0 }
local app = Gtk.Application.new("org.sqgi.ManifestStudio", Gio.ApplicationFlags.non_unique)
local editor = null, failure = 0
app.connect("activate", function() {
    try { editor = A.Application(app, filename) }
    catch (e) { print("sqgipkg-gui: " + e + "\n"); failure = 1; app.quit() }
})
local result = app.run(0, null)
return failure ? failure : result
