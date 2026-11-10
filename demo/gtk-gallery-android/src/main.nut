local Gtk = import("Gtk", "4.0");
local Gio = import("Gio", "2.0");
local GLib = import("GLib", "2.0");
local app = Gtk.Application.new("org.sqgi.demo.widgets", Gio.ApplicationFlags.non_unique);
local window = null, stack = null, feedback = null;
local style_provider = null, stylesheet = null;
local palette_names = ["Forest", "Ocean", "Sunset", "Lavender"];
local palette_keys = ["background", "text", "muted", "accent", "strong", "soft", "border", "field", "navigation", "progress", "label"];
local palettes = [
    ["#f2f5f1", "#20382c", "#69796e", "#2e7651", "#215a3d", "#d7e6d1", "#dce5d5", "#f7f9f4", "#e4eae2", "#82ad5e", "#425b49"],
    ["#edf5fa", "#20384c", "#60798c", "#206d99", "#185270", "#d2e7f3", "#d4e4ee", "#f4f9fc", "#e0edf4", "#51a6ce", "#425d71"],
    ["#fff3ec", "#4a2d25", "#8b6d60", "#ad4f2e", "#863a22", "#f7d9c9", "#efd9cd", "#fff8f3", "#f5e3d8", "#e39a54", "#765243"],
    ["#f5f1fa", "#362a4c", "#796b8b", "#7952a3", "#5c3c80", "#e5d7f0", "#e1d6eb", "#faf6fd", "#eae1f2", "#b28bce", "#615071"]
];
local tabs = {};
local page_name = "controls", count = 0, enabled = true, progress = 42, selected = "Buttons";

function label(text, style = null) {
    local w = Gtk.Label.new(text); w.set_xalign(0.0); w.set_wrap(true);
    if (style != null) w.add_css_class(style);
    return w;
}
function column(gap = 12) { return Gtk.Box.new(Gtk.Orientation.vertical, gap); }
function row(gap = 12) { return Gtk.Box.new(Gtk.Orientation.horizontal, gap); }
function card(title, caption = null) {
    local box = column(); box.add_css_class("card");
    local heading = column(3); heading.append(label(title, "card-title"));
    if (caption != null) heading.append(label(caption, "caption"));
    box.append(heading); return box;
}
function field(title, widget) {
    local box = column(6); box.append(label(title, "field-label"));
    widget.set_hexpand(true); box.append(widget); return box;
}
function say(message) { feedback.set_label(message); }
function apply_palette(index) {
    if (index < 0 || index >= palettes.len()) return;
    local definitions = "";
    foreach (i, key in palette_keys)
        definitions += "@define-color gallery_" + key + " " + palettes[index][i] + ";\n";
    style_provider.load_from_string(definitions + stylesheet);
}

function controls_page() {
    local page = column(14);
    local buttons = card("Buttons & actions", "A little feedback goes a long way.");
    local actions = row(10);
    local tap = Gtk.Button.new_with_label("Tap me  ·  0");
    tap.add_css_class("suggested-action"); tap.set_hexpand(true);
    local reset = Gtk.Button.new_with_label("Reset");
    tap.connect("clicked", function() {
        count++; tap.set_label("Tap me  ·  " + count);
        say(count == 1 ? "One tap. One GTK signal." : count + " taps, and counting.");
    });
    reset.connect("clicked", function() { count = 0; tap.set_label("Tap me  ·  0"); say("Fresh start. Try another widget."); });
    actions.append(tap); actions.append(reset); buttons.append(actions);
    local pin = Gtk.ToggleButton.new_with_label("Pin this sample");
    pin.connect("toggled", function() {
        pin.set_label(pin.get_active() ? "Sample pinned" : "Pin this sample");
        say(pin.get_active() ? "ToggleButton is active." : "ToggleButton is inactive.");
    });
    buttons.append(pin); page.append(buttons);
    local choices = card("Switches & choices");
    local switch_row = row(), switch_label = label("Enable notifications"); switch_label.set_hexpand(true);
    local toggle = Gtk.Switch.new(); toggle.set_active(true); toggle.set_valign(Gtk.Align.center);
    toggle.connect("notify::active", function(_property) {
        enabled = toggle.get_active(); say(enabled ? "Notifications enabled." : "A little peace and quiet.");
    });
    switch_row.append(switch_label); switch_row.append(toggle); choices.append(switch_row);
    local wifi = Gtk.CheckButton.new_with_label("Only sync over Wi-Fi"); wifi.set_active(true);
    choices.append(wifi); choices.append(Gtk.CheckButton.new_with_label("Keep a local copy")); page.append(choices);
    local levels = card("A sense of progress");
    local meter = Gtk.ProgressBar.new(); meter.set_fraction(0.42);
    local value = label("42% complete", "field-label");
    local slider = Gtk.Scale.new_with_range(Gtk.Orientation.horizontal, 0.0, 100.0, 1.0);
    slider.set_draw_value(false); slider.set_value(42.0);
    slider.connect("value-changed", function() {
        progress = slider.get_value().tointeger(); meter.set_fraction(progress / 100.0);
        value.set_label(progress + "% complete"); say("Scale and ProgressBar stay in sync.");
    });
    levels.append(value); levels.append(meter); levels.append(slider); page.append(levels);
    return page;
}
function forms_page() {
    local page = column(14), text = card("Make it your own", "Real text fields, ready for your ideas.");
    local entry = Gtk.Entry.new(); entry.set_text("Hello, Android"); entry.set_placeholder_text("Your greeting");
    text.append(field("Greeting", entry));
    local password = Gtk.PasswordEntry.new(); password.set_show_peek_icon(true); password.set_text("squirrel");
    text.append(field("Password", password));
    local search = Gtk.SearchEntry.new(); search.set_placeholder_text("Find a widget…"); text.append(search); page.append(text);
    local preferences = card("Choose your defaults");
    local palette = Gtk.DropDown.new_from_strings(palette_names);
    palette.connect("notify::selected", function(_property) {
        local index = palette.get_selected();
        if (index >= palettes.len()) return;
        apply_palette(index); say(palette_names[index] + " palette · a fresh coat of colour.");
    });
    preferences.append(field("Colour palette", palette));
    local numbers = row(), caption = label("Items per group"); caption.set_hexpand(true);
    local spin = Gtk.SpinButton.new_with_range(1.0, 12.0, 1.0); spin.set_value(3.0);
    numbers.append(caption); numbers.append(spin); preferences.append(numbers); page.append(preferences);
    local notes = card("Room for a thought"), editor = Gtk.TextView.new(); editor.add_css_class("note");
    editor.set_wrap_mode(Gtk.WrapMode.word_char); editor.set_size_request(-1, 90);
    editor.set_top_margin(12); editor.set_bottom_margin(12); editor.set_left_margin(12); editor.set_right_margin(12);
    editor.get_buffer().set_text("GTK widgets.\nSquirrel code.\nOne small Android app.", -1);
    notes.append(editor); page.append(notes); return page;
}
function collections_page() {
    local page = column(14), collection = card("A toolkit to explore", "Select a row to see its widget family.");
    local list = Gtk.ListBox.new(); list.add_css_class("widget-list"); list.set_selection_mode(Gtk.SelectionMode.single);
    local families = [["Buttons", "Actions, toggles and choices", "01"], ["Inputs", "Text, numbers and selections", "02"], ["Containers", "A place for every widget", "03"]];
    foreach (i, family in families) {
        local item = Gtk.ListBoxRow.new(), body = row(12); body.append(label(family[2], "row-number"));
        local copy = column(3); copy.set_hexpand(true); copy.append(label(family[0], "field-label")); copy.append(label(family[1], "caption"));
        body.append(copy); body.append(label("›", "chevron")); item.set_child(body); list.append(item);
    }
    list.select_row(list.get_row_at_index(0));
    list.connect("row-selected", function(item) {
        if (item == null) return;
        selected = families[item.get_index()][0]; say("Exploring " + selected.tolower() + ".");
    });
    collection.append(list); page.append(collection);
    local dates = card("Save the date"), calendar = Gtk.Calendar.new(); calendar.set_hexpand(true);
    calendar.select_day(GLib.DateTime.new_now_local()); dates.append(calendar); page.append(dates);
    local extra = Gtk.Expander.new("One more thing…"); extra.add_css_class("disclosure");
    local detail = label("This is a GTK application running on Android. Every control on these pages is a real GTK widget.", "caption");
    detail.set_margin_top(12); extra.set_child(detail); page.append(extra); return page;
}
app.connect("activate", function() {
    if (window != null) { window.present(); return; }
    window = Gtk.ApplicationWindow.new(app); window.set_title("GTK Gallery"); window.set_default_size(411, 880);
    stylesheet = GLib.file_get_contents("style.css"); style_provider = Gtk.CssProvider.new(); apply_palette(0);
    Gtk.StyleContext.add_provider_for_display(window.get_display(), style_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
    local root = column(0), header = column(8); header.add_css_class("masthead");
    local brand = row(), wordmark = label("GTK GALLERY", "wordmark"); wordmark.set_hexpand(true);
    brand.append(wordmark); brand.append(label("ANDROID", "platform-badge")); header.append(brand);
    header.append(label("A pocketful of widgets.", "headline")); header.append(label("Tap, type and explore.", "subtitle")); root.append(header);
    local navigation = row(4); navigation.set_homogeneous(true); navigation.add_css_class("navigation");
    stack = Gtk.Stack.new(); stack.set_vhomogeneous(false);
    foreach (spec in [["controls", "Controls"], ["forms", "Forms"], ["collections", "Collections"]]) {
        local name = spec[0], button = Gtk.ToggleButton.new_with_label(spec[1]); tabs[name] <- button;
        button.connect("clicked", function() {
            page_name = name; stack.set_visible_child_name(name);
            foreach (key, tab in tabs) tab.set_active(key == name);
            say(name == "controls" ? "Go on. Give something a tap." : name == "forms" ? "A place for words, numbers and ideas." : "Lists, dates and a little discovery.");
        });
        navigation.append(button);
    }
    root.append(navigation); feedback = label("Go on. Give something a tap.", "feedback");
    foreach (spec in [["controls", controls_page()], ["forms", forms_page()], ["collections", collections_page()]]) {
        local body = spec[1]; body.add_css_class("page"); local scroll = Gtk.ScrolledWindow.new();
        local viewport = Gtk.Viewport.new(null, null); viewport.set_child(body);
        scroll.set_policy(Gtk.PolicyType.never, Gtk.PolicyType.automatic); scroll.set_child(viewport); stack.add_named(scroll, spec[0]);
        // The Android keyboard resizes the viewport without changing focus.
        // Keep the focused input visible after the new allocation settles.
        local pending = false;
        scroll.get_vadjustment().connect("changed", function() {
            if (pending) return;
            pending = true;
            GLib.idle_add(GLib.PRIORITY_DEFAULT_IDLE, function() {
                pending = false;
                if (window == null) return false;
                local focused = window.get_focus();
                if (focused != null && focused.is_ancestor(viewport)) viewport.scroll_to(focused, null);
                return false;
            });
        });
    }
    stack.set_vexpand(true); stack.set_visible_child_name("controls"); tabs.controls.set_active(true);
    root.append(stack); root.append(feedback); window.set_child(root);
    window.connect("close-request", function() { window = null; return false; }); window.present();
    print("GTK Gallery ready\n");
});
app.run(0, null);
