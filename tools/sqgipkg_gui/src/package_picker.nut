// Explicit catalog browsing crosses the CLI boundary; no package installer here.
local Gtk = import("Gtk", "4.0")
local W = import("widgets.nut")
local B = import("backend.nut")

function matches(package, query) {
    local text = package.name
    foreach (key in ["summary", "description"]) if (key in package && typeof(package[key]) == "string") text += " " + package[key]
    if ("tags" in package) foreach (tag in package.tags) text += " " + tag
    return text.tolower().find(strip(query).tolower()) != null
}
function open(parent, directory, widgets, selected, context = "Add a dependency to the Windows package. Linux dependencies are configured separately.", target = "x86_64-w64-mingw32") {
    local dialog = Gtk.Dialog.new(); dialog.set_title("Find Ooblerg packages")
    dialog.set_transient_for(parent); dialog.set_modal(true); dialog.set_default_size(680, 640)
    local body = W.padded(W.box()); dialog.get_content_area().append(body)
    local platform = target == "x86_64-w64-mingw32" ? "Windows x86_64" : (target == "aarch64-linux-gnu" ? "Linux aarch64 · Ubuntu 24.04" : "Linux x86_64 · Ubuntu 24.04")
    body.append(W.heading("Ooblerg · " + platform)); body.append(W.label(context))
    if (target != "x86_64-w64-mingw32") body.append(W.label("This catalog is for the CPU shown above. Ubuntu supplies ordinary dependencies."))
    local search = W.entry(), label = W.label("Search by name or description")
    search.set_placeholder_text("For example: serial, 3D, video, GTK")
    label.set_mnemonic_widget(search); body.append(label); body.append(search)
    local status = W.label("Loading package catalog…"); body.append(status)
    local results = W.box(), scroll = W.scroll(results); scroll.set_min_content_height(170)
    scroll.set_policy(Gtk.PolicyType.never, Gtk.PolicyType.automatic); body.append(scroll)
    local details = W.label("Select a package to see its description and dependencies.")
    local detail_scroll = W.scroll(details); detail_scroll.set_min_content_height(110)
    detail_scroll.set_policy(Gtk.PolicyType.never, Gtk.PolicyType.automatic); body.append(detail_scroll)
    local cancel = dialog.add_button("Cancel", Gtk.ResponseType.cancel)
    local add = dialog.add_button("Add selected package", Gtk.ResponseType.accept); add.set_sensitive(false)
    local job = B.Inspection(), packages = [], choice = null, alive = true, cached = false, loaded = false
    local render = function() {
        W.clear(results); choice = null; add.set_sensitive(false)
        details.set_text("Select a package to see its description and dependencies.")
        local count = 0
        foreach (package in packages) {
            if (!matches(package, search.get_text())) continue
            local item = package
            local title = item.name + " · " + item.version
            if ("summary" in item) title += "\n" + item.summary
            local button = null
            button = W.button(title, function() {
                choice = item; add.set_sensitive(true)
                local row = results.get_first_child()
                while (row != null) { row.remove_css_class("suggested-action"); row = row.get_next_sibling() }
                button.add_css_class("suggested-action")
                local text = item.name + " " + item.version + "\n" + platform + "\n"
                text += "description" in item ? item.description : ("summary" in item ? item.summary : "No description supplied.")
                text += target == "x86_64-w64-mingw32" ? "\nDependencies: " : "\nOther Ooblerg packages: "
                if (!item.dependencies.len()) text += "none declared"
                foreach (i, dependency in item.dependencies) text += (i ? ", " : "") + dependency
                details.set_text(text)
            })
            button.set_child(W.label(title))
            results.append(button); widgets["packages.result." + item.name] <- button; count++
        }
        if (loaded) status.set_text(count == 0 ? "No matching packages. Try another name or description." :
            count + " package(s) · " + (cached ? "cached catalog; Refresh checks for updates" : "catalog fetched from Ooblerg"))
    }
    local refresh = null
    local load = function(force) {
        refresh.set_sensitive(false); search.set_sensitive(false); loaded = false
        packages = []; render(); status.set_text("Loading package catalog… No packages are being installed.")
        job.run("packages", "", directory, force, target).then(function(result) {
            if (!alive) return
            refresh.set_sensitive(true); search.set_sensitive(true)
            if (!result.ok) { status.set_text("Could not load the catalog: " + result.diagnostics[0].message + "\nUse Refresh to retry."); return }
            packages = result.packages; cached = result.cached; loaded = true; render(); search.grab_focus()
        }).catch(function(problem) {
            if (!alive) return
            refresh.set_sensitive(true); search.set_sensitive(true)
            status.set_text("Could not load the catalog: " + problem + "\nUse Refresh to retry.")
        })
    }
    refresh = W.button("Refresh catalog", function() { load(true) }); body.append(refresh)
    search.connect("changed", function() { if (loaded) render() })
    dialog.connect("response", function(response) {
        if (response == Gtk.ResponseType.accept && choice == null) return
        alive = false; job.cancel(); dialog.destroy()
        if (response == Gtk.ResponseType.accept) selected(choice.name)
    })
    foreach (key, widget in { search = search, status = status, details = details, add = add, cancel = cancel, refresh = refresh })
        widgets["packages." + key] <- widget
    dialog.connect("close-request", function() { alive = false; job.cancel(); return false })
    dialog.present(); load(false)
    return dialog
}
return { open = open, matches = matches }
