local Gtk = import("Gtk", "4.0"), Gdk = import("Gdk", "4.0")
local GLib = import("GLib"), Gio = import("Gio")
local World = import("world.nut")
local app = Gtk.Application.new("org.sqgi.demo.alpine", Gio.ApplicationFlags.non_unique)
local window = null, world = null

function label(text, style) {
    local w = Gtk.Label.new(text); w.set_xalign(0); w.set_wrap(true); w.add_css_class(style); return w
}
function box(vertical, gap = 8) { return Gtk.Box.new(vertical ? Gtk.Orientation.vertical : Gtk.Orientation.horizontal, gap) }
function margins(widget, amount) {
    foreach (edge in ["top", "bottom", "start", "end"]) widget["set_margin_" + edge](amount)
}
function button(text, action, style = null) {
    local w = Gtk.Button.new_with_label(text)
    if (style != null) w.add_css_class(style)
    w.connect("clicked", action); return w
}
function selected(buttons, index) {
    foreach (i, item in buttons) {
        if (i == index) item.add_css_class("selected")
        else item.remove_css_class("selected")
    }
}

app.connect("activate", function() {
    if (window != null) { window.present(); return }
    local css = Gtk.CssProvider.new()
    css.load_from_path("assets/style.css")
    Gtk.StyleContext.add_provider_for_display(Gdk.Display.get_default(), css, 600)
    window = Gtk.ApplicationWindow.new(app)
    window.set_title("Alpine · Mont Blanc"); window.set_default_size(480, 820)
    world = World.create()
    local view = world.view
    view.set_hexpand(true); view.set_vexpand(true)
    local overlay = Gtk.Overlay.new(); overlay.set_child(view)

    local header = box(false, 12); header.add_css_class("masthead")
    header.set_valign(Gtk.Align.start); margins(header, 14)
    local logo = Gtk.DrawingArea.new(); logo.set_content_width(40); logo.set_content_height(40)
    logo.set_draw_func(function(widget, cr, width, height) {
        cr.set_source_rgba(0.89, 0.74, 0.47, 1)
        cr.arc(31, 9, 5, 0, 6.283185); cr.fill()
        cr.set_source_rgba(0.94, 0.94, 0.90, 1)
        cr.move_to(1, 33); cr.line_to(16, 6); cr.line_to(25, 23)
        cr.line_to(30, 17); cr.line_to(40, 33); cr.close_path(); cr.fill()
        cr.set_source_rgba(0.54, 0.70, 0.65, 1)
        cr.move_to(16, 6); cr.line_to(20, 33); cr.line_to(40, 33)
        cr.line_to(25, 23); cr.close_path(); cr.fill()
    }, null, function(unused) {})
    header.append(logo)
    local brand = box(true, 1); brand.set_hexpand(true)
    brand.append(label("ALPINE", "brand"))
    brand.append(label("MONT BLANC MASSIF", "eyebrow")); header.append(brand)
    overlay.add_overlay(header)

    local tools = box(true, 8)
    tools.set_halign(Gtk.Align.end); tools.set_valign(Gtk.Align.center); tools.set_margin_end(16)
    local zoom_in = button("+", function() { world.zoom(0.85) }, "zoom")
    zoom_in.set_tooltip_text("Move closer")
    local zoom_out = button("−", function() { world.zoom(1.18) }, "zoom")
    zoom_out.set_tooltip_text("Move higher")
    local reset = button("Reset", function() { world.show(world.state.preset) }, "zoom")
    reset.add_css_class("reset")
    tools.append(zoom_in); tools.append(zoom_out); tools.append(reset); overlay.add_overlay(tools)

    local sheet = box(true, 10); sheet.add_css_class("sheet")
    sheet.set_valign(Gtk.Align.end); margins(sheet, 12)
    local title = label("Mont Blanc", "place")
    local detail = label("French Alps · SRTM terrain + satellite imagery", "detail"); detail.set_wrap(true)
    sheet.append(title); sheet.append(detail)
    local destinations = box(false, 6), places = []
    foreach (i, preset in world.presets) {
        local index = i
        local item = button(preset.button, function() {
            world.show(index); title.set_label(world.presets[index].name)
            detail.set_label("French Alps · SRTM terrain + satellite imagery")
            selected(places, index)
        })
        item.set_hexpand(true); destinations.append(item); places.push(item)
    }
    selected(places, 0); sheet.append(destinations)
    local sunlight = box(false, 6), lights = []
    foreach (i, choice in [["Daylight", 13.0], ["Golden hour", 17.5]]) {
        local index = i, hour = choice[1]
        local item = button(choice[0], function() { view.set_sun_time_of_day(hour); selected(lights, index) }, "sun")
        item.set_hexpand(true); sunlight.append(item); lights.push(item)
    }
    selected(lights, 0); sheet.append(sunlight)
    local hint = label("Drag to look around · Tap terrain to read its elevation", "hint")
    sheet.append(hint)
    local loading = box(false, 8), status = label("Loading satellite imagery…", "status")
    status.set_hexpand(true); status.set_wrap(true); loading.append(status)
    local retry = button("Retry", function() { world.retry() }, "retry")
    retry.set_visible(false); loading.append(retry); sheet.append(loading)
    local credits = label("Imagery © Esri, Vantor, Earthstar Geographics & the GIS User Community\nElevation: SRTM / ooblerg.xyz", "credit")
    credits.set_wrap(true); sheet.append(credits)
    overlay.add_overlay(sheet)
    view.connect("ground-clicked", function(latitude, longitude, altitude, mouse_button) {
        detail.set_label(format("%.4f°, %.4f° · %.0f m elevation", latitude, longitude, altitude))
    })
    local layout = null
    GLib.timeout_add(GLib.PRIORITY_DEFAULT, 500, function() {
        local wide = window.get_width() > window.get_height()
        local compact = wide && window.get_height() < 480
        local next_layout = compact ? "compact" : (wide ? "wide" : "portrait")
        if (next_layout != layout) {
            layout = next_layout
            header.set_halign(compact ? Gtk.Align.end : (wide ? Gtk.Align.start : Gtk.Align.fill))
            header.set_size_request(wide ? (compact ? 220 : 310) : -1, -1)
            sheet.set_halign(wide ? Gtk.Align.start : Gtk.Align.fill)
            sheet.set_size_request(wide ? 310 : -1, -1)
            sheet.set_spacing(compact ? 5 : 10)
            hint.set_visible(!compact)
            if (compact) { header.add_css_class("compact"); sheet.add_css_class("compact") }
            else { header.remove_css_class("compact"); sheet.remove_css_class("compact") }
        }
        local error = view.get_error()
        if (error != null) {
            status.set_label("Graphics unavailable: " + error.message); return true
        }
        local progress = world.progress(), ready = view.get_imagery_ready()
        if (ready) {
            status.set_label("●  Satellite imagery ready")
            if (!world.state.ready) print("Alpine: satellite imagery ready, " + progress[0] + " tiles\n")
        } else if (world.state.failed > 0) status.set_label("Some imagery is unavailable. Check your connection.")
        else status.set_label(progress[1] > 0 ? format("Loading satellite imagery · %d%%", progress[0] * 100 / progress[1]) : "Loading satellite imagery…")
        retry.set_visible(!ready && world.state.failed > 0)
        world.state.ready = ready
        return true
    })
    window.set_child(overlay); window.present()
})
app.connect("shutdown", function() { if (world != null) world.close() })
app.run(0, null)
