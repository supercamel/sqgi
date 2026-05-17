/**
 * demo/gstreamer/info.nut
 *
 * Inspect the local GStreamer installation: list loaded plugins and the
 * element factories they ship, with metadata. Mirrors a slice of
 * `gst-inspect-1.0` functionality.
 *
 * Usage:
 *   ./build/sqgi demo/gstreamer/info.nut             # summary + sample plugins
 *   ./build/sqgi demo/gstreamer/info.nut <plugin>    # all factories of <plugin>
 *   ./build/sqgi demo/gstreamer/info.nut --element <name>   # one factory's detail
 *
 * Exercises:
 *   - Gst.Registry.get / get_plugin_list / get_feature_list_by_plugin
 *   - Gst.Plugin getters (name/description/version/filename)
 *   - Gst.ElementFactory.find / get_metadata
 *   - Iteration over a GList returned from GIR (auto-marshalled to a
 *     Squirrel array by the GSQ bindings)
 */

local Gst = import("Gst")

Gst.init(null)

// ── Parse CLI ───────────────────────────────────────────────────────────────

local plugin_filter  = null
local element_filter = null
foreach (i, a in vargv) {
    if (a == "--element" && i + 1 < vargv.len()) {
        element_filter = vargv[i + 1]
    } else if (a == "--help" || a == "-h") {
        print("Usage: sqgi demo/gstreamer/info.nut [<plugin>] [--element <name>]\n")
        return
    } else if (a.find("--") != 0 && plugin_filter == null && element_filter == null) {
        plugin_filter = a
    }
}

local reg = Gst.Registry.get()

// ── Single-element inspect ──────────────────────────────────────────────────

if (element_filter != null) {
    local fact = Gst.ElementFactory.find(element_filter)
    if (fact == null) {
        print("No such element factory: " + element_filter + "\n")
        return
    }
    print("Factory: " + element_filter + "\n")
    foreach (k in ["long-name", "klass", "description", "author"]) {
        local m = fact.get_metadata(k)
        if (m != null) print("  " + k + ": " + m + "\n")
    }
    // Build an instance to inspect properties
    local elem = fact.create(element_filter + "0")
    if (elem != null) {
        print("Instance: " + elem.get_name() + "\n")
        elem.set_state(Gst.State["null"])
    }
    return
}

// ── Plugin filter: show all factories of one plugin ─────────────────────────

if (plugin_filter != null) {
    local feats = reg.get_feature_list_by_plugin(plugin_filter)
    if (feats == null || feats.len() == 0) {
        print("No plugin or empty plugin: " + plugin_filter + "\n")
        return
    }
    print("Plugin '" + plugin_filter + "' provides " + feats.len() + " factories:\n")
    foreach (i, f in feats) {
        print("  " + f.get_name() + "\n")
    }
    return
}

// ── Summary listing ─────────────────────────────────────────────────────────

local plugins = reg.get_plugin_list()
print("GStreamer " + Gst.version_string() + "\n")
print("Loaded plugins: " + plugins.len() + "\n\n")

// Count total factories across plugins (small per-plugin GLists collapsed).
local total_factories = 0
foreach (i, p in plugins) {
    local feats = reg.get_feature_list_by_plugin(p.get_name())
    if (feats != null) total_factories += feats.len()
}
print("Total factories: " + total_factories + "\n\n")

// Show the first ten plugins as a sample.
local n = plugins.len() < 10 ? plugins.len() : 10
print("First " + n + " plugins:\n")
for (local i = 0; i < n; i++) {
    local p = plugins[i]
    print(format("  %-20s  v%-8s  %s\n",
                  p.get_name(), p.get_version(), p.get_description()))
}
print("\nTry: sqgi demo/gstreamer/info.nut coreelements\n")
print("     sqgi demo/gstreamer/info.nut --element fakesink\n")
