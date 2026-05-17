/**
 * demo/gtk4/widgets.nut
 *
 * Comprehensive GTK 4 widget gallery + signal exerciser.
 *
 * Builds a window holding most of the common widgets — Button, ToggleButton,
 * CheckButton, Entry, Switch, Scale, DropDown, ListBox, Notebook, TextView,
 * ProgressBar, Spinner — and connects to their canonical signals.
 *
 * Usage:
 *   sqgi demo/gtk4/widgets.nut             — interactive (close the window)
 *   sqgi demo/gtk4/widgets.nut --auto      — auto-drive each widget then quit
 *   sqgi demo/gtk4/widgets.nut --timeout=N — quit after N seconds regardless
 *
 * Signal hits are logged to stdout so the demo also serves as a headless
 * smoke test for the GObject signal bridge.
 */

local GLib = import("GLib")
local Gio  = import("Gio")
local Gtk  = import("Gtk", "4.0")

// ── CLI parsing ────────────────────────────────────────────────────────────
local auto_drive   = false
local hard_timeout = 0
foreach (a in vargv) {
    if (a == "--auto") auto_drive = true
    else if (a.find("--timeout=") == 0) hard_timeout = a.slice(10).tointeger()
}
if (auto_drive && hard_timeout == 0) hard_timeout = 8

// ── Signal hit counter ─────────────────────────────────────────────────────
local hits = {}
function hit(name) {
    hits[name] <- (name in hits ? hits[name] : 0) + 1
    print(format("  [signal] %-22s #%d\n", name, hits[name]))
}

// ── Application ───────────────────────────────────────────────────────────
local app = Gtk.Application.new("org.sqgi.gtk4.widgets",
                                 Gio.ApplicationFlags.flags_none)

// ── Widget handles + driver state captured in module-scope tables so
//    they survive across signal callbacks (Squirrel closures only capture
//    upvalues that are referenced at compile time within the same chain). ──
local W   = {}
local DRV = { i = 0, steps = null }

// Gio.Application::activate has no extra args.
app.connect("activate", function() {
    hit("app.activate")

    local win = Gtk.ApplicationWindow.new(app)
    win.set_title("SQGI — GTK 4 Widget Gallery")
    win.set_default_size(520, 600)
    W.win <- win

    // HeaderBar with title
    local header = Gtk.HeaderBar.new()
    header.set_title_widget(Gtk.Label.new("Widget Gallery"))
    win.set_titlebar(header)

    // Root vertical box
    local root = Gtk.Box.new(Gtk.Orientation.vertical, 8)
    root.set_margin_top(8); root.set_margin_bottom(8)
    root.set_margin_start(8); root.set_margin_end(8)
    win.set_child(root)

    // ── Notebook splits the gallery into pages ────────────────────────────
    local nb = Gtk.Notebook.new()
    // GtkNotebook::switch-page (page: GtkWidget, page_num: guint)
    nb.connect("switch-page", function(page, page_num) {
        hit("notebook.switch-page")
        print("      page_num=" + page_num + "\n")
    })
    root.append(nb)
    W.notebook <- nb

    // ── Page 1: Buttons ───────────────────────────────────────────────────
    local p1 = Gtk.Box.new(Gtk.Orientation.vertical, 6)
    p1.set_margin_top(8); p1.set_margin_start(8); p1.set_margin_end(8)

    local status = Gtk.Label.new("ready")
    status.set_xalign(0.0)
    W.status <- status
    p1.append(status)

    local btn = Gtk.Button.new_with_label("Click me")
    // GtkButton::clicked has no extra args.
    btn.connect("clicked", function() {
        hit("button.clicked")
        status.set_text("button clicked " + hits["button.clicked"] + "x")
    })
    p1.append(btn)
    W.btn <- btn

    local tog = Gtk.ToggleButton.new_with_label("Toggle me")
    // GtkToggleButton::toggled has no extra args.
    tog.connect("toggled", function() {
        hit("toggle.toggled")
        status.set_text("toggled active=" + tog.get_active())
    })
    p1.append(tog)
    W.tog <- tog

    local chk = Gtk.CheckButton.new_with_label("Enable feature")
    // GtkCheckButton::toggled has no extra args.
    chk.connect("toggled", function() {
        hit("check.toggled")
        status.set_text("check active=" + chk.get_active())
    })
    p1.append(chk)
    W.chk <- chk

    local sw_row = Gtk.Box.new(Gtk.Orientation.horizontal, 6)
    sw_row.append(Gtk.Label.new("Switch:"))
    local sw = Gtk.Switch.new()
    // GtkSwitch::state-set (state: gboolean) -> gboolean (true = handled).
    sw.connect("state-set", function(state) {
        hit("switch.state-set")
        status.set_text("switch state=" + state)
        return false // let default handler update the visual state
    })
    sw_row.append(sw)
    p1.append(sw_row)
    W.sw <- sw

    nb.append_page(p1, Gtk.Label.new("Buttons"))

    // ── Page 2: Inputs ────────────────────────────────────────────────────
    local p2 = Gtk.Box.new(Gtk.Orientation.vertical, 6)
    p2.set_margin_top(8); p2.set_margin_start(8); p2.set_margin_end(8)

    local entry = Gtk.Entry.new()
    entry.set_placeholder_text("type and press Enter")
    // GtkEditable::changed and GtkEntry::activate carry no extra args.
    entry.connect("changed",  function() { hit("entry.changed") })
    entry.connect("activate", function() {
        hit("entry.activate")
        status.set_text("entry: " + entry.get_text())
    })
    p2.append(entry)
    W.entry <- entry

    local adj = Gtk.Adjustment.new(50.0, 0.0, 100.0, 1.0, 10.0, 0.0)
    local scale = Gtk.Scale.new(Gtk.Orientation.horizontal, adj)
    scale.set_hexpand(true)
    scale.set_draw_value(true)
    // GtkAdjustment::value-changed has no extra args.
    adj.connect("value-changed", function() {
        hit("adjustment.value-changed")
        status.set_text("scale = " + adj.get_value())
    })
    p2.append(scale)
    W.adj <- adj

    // Spin button
    local spin_adj = Gtk.Adjustment.new(1.0, 0.0, 10.0, 1.0, 1.0, 0.0)
    local spin = Gtk.SpinButton.new(spin_adj, 1.0, 0)
    // GtkSpinButton::value-changed has no extra args.
    spin.connect("value-changed", function() {
        hit("spin.value-changed")
        status.set_text("spin = " + spin.get_value())
    })
    p2.append(spin)
    W.spin <- spin

    // DropDown — Gtk.StringList → Gtk.DropDown
    local sl = Gtk.StringList.new(["Apple", "Banana", "Cherry", "Date"])
    local dd = Gtk.DropDown.new(sl, null)
    // GObject::notify (pspec: table with name/nick/blurb).
    dd.connect("notify::selected", function(pspec) {
        hit("dropdown.selected")
        status.set_text("dropdown idx=" + dd.get_selected() +
                        " (prop=" + pspec.name + ")")
    })
    p2.append(dd)
    W.dd <- dd

    nb.append_page(p2, Gtk.Label.new("Inputs"))

    // ── Page 3: Lists & text ──────────────────────────────────────────────
    local p3 = Gtk.Box.new(Gtk.Orientation.vertical, 6)
    p3.set_margin_top(8); p3.set_margin_start(8); p3.set_margin_end(8)

    local lb = Gtk.ListBox.new()
    lb.set_selection_mode(Gtk.SelectionMode.single)
    foreach (label in ["Alpha", "Bravo", "Charlie", "Delta"]) {
        local row = Gtk.ListBoxRow.new()
        row.set_child(Gtk.Label.new(label))
        lb.append(row)
    }
    // GtkListBox::row-activated (row: GtkListBoxRow)
    lb.connect("row-activated", function(row) {
        hit("listbox.row-activated")
        print("      row index=" + row.get_index() + "\n")
    })
    // GtkListBox::row-selected (row: GtkListBoxRow, may be null)
    lb.connect("row-selected", function(row) {
        hit("listbox.row-selected")
        print("      row=" + (row == null ? "<none>" : row.get_index()) + "\n")
    })

    local scrolled = Gtk.ScrolledWindow.new()
    scrolled.set_min_content_height(160)
    scrolled.set_child(lb)
    p3.append(scrolled)
    W.lb <- lb

    // Text view inside its own scroller
    local tv = Gtk.TextView.new()
    tv.set_wrap_mode(Gtk.WrapMode.word)
    local buf = tv.get_buffer()
    buf.set_text("Edit this text…\n", -1)
    // GtkTextBuffer::changed has no extra args.
    buf.connect("changed", function() { hit("textbuffer.changed") })
    local tv_scroll = Gtk.ScrolledWindow.new()
    tv_scroll.set_min_content_height(120)
    tv_scroll.set_child(tv)
    p3.append(tv_scroll)
    W.buf <- buf

    nb.append_page(p3, Gtk.Label.new("Lists/Text"))

    // ── Page 4: Progress + Spinner ────────────────────────────────────────
    local p4 = Gtk.Box.new(Gtk.Orientation.vertical, 6)
    p4.set_margin_top(8); p4.set_margin_start(8); p4.set_margin_end(8)

    local pb = Gtk.ProgressBar.new()
    pb.set_show_text(true)
    pb.set_text("0%")
    pb.set_fraction(0.0)
    p4.append(pb)
    W.pb <- pb

    local sp = Gtk.Spinner.new()
    sp.start()
    p4.append(sp)
    W.sp <- sp

    local hbox = Gtk.Box.new(Gtk.Orientation.horizontal, 6)
    local quit_btn = Gtk.Button.new_with_label("Quit")
    quit_btn.connect("clicked", function() {
        hit("quit.clicked")
        app.quit()
    })
    hbox.append(quit_btn)
    p4.append(hbox)
    W.quit_btn <- quit_btn

    nb.append_page(p4, Gtk.Label.new("Status"))

    win.present()
    hit("window.present")

    // ── Auto-drive ────────────────────────────────────────────────────────
    if (auto_drive) {
        DRV.steps = [
            function() { print("\n→ Step 1: click button\n"); W.btn.activate() },
            function() { print("\n→ Step 2: toggle button\n"); W.tog.set_active(true) },
            function() { print("\n→ Step 3: check box\n"); W.chk.set_active(true) },
            function() { print("\n→ Step 4: flip switch\n"); W.sw.set_active(true) },
            function() { print("\n→ Step 5: type into entry\n"); W.entry.set_text("hello sqgi") },
            function() { print("\n→ Step 6: entry activate\n"); W.entry.activate() },
            function() { print("\n→ Step 7: move slider\n"); W.adj.set_value(72.5) },
            function() { print("\n→ Step 8: spin to 5\n"); W.spin.set_value(5.0) },
            function() { print("\n→ Step 9: select dropdown 2\n"); W.dd.set_selected(2) },
            function() { print("\n→ Step 10: edit textview\n"); W.buf.set_text("driven content", -1) },
            function() { print("\n→ Step 11: switch notebook page 2\n"); W.notebook.set_current_page(2) },
            function() { print("\n→ Step 12: select listbox row 1\n");
                         W.lb.select_row(W.lb.get_row_at_index(1)) },
            function() { print("\n→ Step 13: activate listbox row 2\n");
                         W.lb.get_row_at_index(2).activate() },
            function() { print("\n→ Step 14: switch to status page\n"); W.notebook.set_current_page(3) },
            function() { print("\n→ Step 15: progress 100%\n"); W.pb.set_fraction(1.0); W.pb.set_text("100%") },
            function() { print("\n→ Step 16: quit\n"); W.quit_btn.activate() },
        ]
        // sqgi.timeout_add callbacks receive no args; return true to repeat.
        sqgi.timeout_add(150, function() {
            if (DRV.i >= DRV.steps.len()) return false
            DRV.steps[DRV.i]()
            DRV.i++
            return true
        })
    } else if (hard_timeout > 0) {
        sqgi.timeout_add(hard_timeout * 1000, function() {
            print("\n[timeout reached, quitting]\n")
            app.quit()
            return false
        })
    }
})

print("starting Gtk4 widget gallery (auto=" + auto_drive +
      ", timeout=" + hard_timeout + "s)\n")
local ret = app.run(0, null)
print("\nGtk Application exited with code " + ret + "\n")

print("\n── signal hit summary ─────────────────────────────────────────\n")
local total = 0
foreach (k, v in hits) { print(format("  %-26s %d\n", k, v)); total += v }
print(format("  TOTAL                      %d signal callbacks\n", total))
