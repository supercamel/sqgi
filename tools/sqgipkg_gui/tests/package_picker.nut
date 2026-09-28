// Focused asynchronous failure/retry/cancellation acceptance, without network.
local Gtk = import("Gtk", "4.0")
local Gio = import("Gio")
local Picker = import("../src/package_picker.nut")
local directory = vargv[0]
local app = Gtk.Application.new("org.sqgi.ManifestStudio.PackageTests", Gio.ApplicationFlags.non_unique)
local widgets = {}, added = [], dialog = null, step = 0, ticks = 0, failure = 0
function require(ok, message) { if (!ok) throw "FAIL: " + message }
function mode(value) { Gio.File.new_for_path(directory + "/mode").replace_contents(value, null, false, Gio.FileCreateFlags.none, null) }
app.connect("activate", function() {
    local window = Gtk.ApplicationWindow.new(app)
    window.set_title("Package picker acceptance"); window.set_default_size(800, 680); window.present()
    local open = function() { dialog = Picker.open(window, directory, widgets, function(name) { added.push(name) }) }
    local checks = [
        function() { mode("error"); open() },
        function() {
            if (widgets["packages.status"].get_text().find("Loading") != null) { step--; return }
            require(widgets["packages.status"].get_text().find("Use Refresh to retry") != null, "error explains recovery")
            require(!widgets["packages.add"].get_sensitive() && added.len() == 0, "failure cannot select or add")
            require(widgets["packages.refresh"].get_sensitive(), "retry available after failure")
            mode("ready"); widgets["packages.refresh"].activate()
        },
        function() {
            if (widgets["packages.status"].get_text().find("Loading") != null) { step--; return }
            require(widgets["packages.status"].get_text().find("catalog fetched") != null, "refresh succeeds: " + widgets["packages.status"].get_text())
            widgets["packages.search"].set_text("SERIAL")
            widgets["packages.result.gserial"].activate()
        },
        function() {
            require(widgets["packages.add"].get_sensitive(), "retried result can be selected")
            require(widgets["packages.details"].get_text().find("glib") != null, "dependency detail retained")
            widgets["packages.add"].activate()
        },
        function() {
            require(added.len() == 1 && added[0] == "gserial", "retry adds exactly once")
            print("PASS EDIT-package-search-retry\n")
            mode("slow"); open()
        },
        function() {
            require(widgets["packages.status"].get_text().find("Loading") != null, "slow request pending")
            widgets["packages.cancel"].activate()
        },
        function() { require(added.len() == 1, "cancel during fetch makes no change"); mode("ready"); open() },
        function() {
            if (widgets["packages.status"].get_text().find("Loading") != null) { step--; return }
            widgets["packages.search"].set_text("world")
            require(widgets["packages.status"].get_text().find("1 package") != null, "new picker works after cancellation")
            widgets["packages.result.gworldscene"].activate()
        },
        function() { widgets["packages.add"].activate() },
        function() {
            require(added.len() == 2 && added[1] == "gworldscene", "cancelled request cannot add stale package")
            print("PASS EDIT-package-search-cancel-fetch\n"); app.quit()
        }
    ]
    sqgi.timeout_add(400, function() {
        try {
            if (++ticks > 100) throw "FAIL: package picker timeout"
            if (step < checks.len()) checks[step++]()
            return step < checks.len()
        } catch (error) { print(error + "\n"); failure = 1; app.quit(); return false }
    })
})
app.run(0, null)
return failure
