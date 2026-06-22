/**
 * demo/gtk4/dialog.nut
 *
 * GTK 4 dialog response demo.
 *
 * Usage:
 *   sqgi demo/gtk4/dialog.nut
 *   sqgi demo/gtk4/dialog.nut --auto
 *   sqgi demo/gtk4/dialog.nut --timeout=5
 *
 * The important SQGI binding detail:
 * GtkDialog::response passes only the response id to the Squirrel callback.
 * Capture the dialog object from the surrounding scope if you need to close it.
 */

local GLib = import("GLib")
local Gio = import("Gio")
local Gtk = import("Gtk", "4.0")

local auto_drive = false
local hard_timeout = 0
foreach (a in vargv) {
    if (a == "--auto") auto_drive = true
    else if (a.find("--timeout=") == 0) hard_timeout = a.slice(10).tointeger()
}
if (auto_drive && hard_timeout == 0) hard_timeout = 8

local app = Gtk.Application.new("org.sqgi.gtk4.dialog",
    Gio.ApplicationFlags.flags_none)

local W = {}
local State = {
    apply_count = 0,
    close_count = 0,
    ok_count = 0,
    exit_code = 0,
    step = 0,
    steps = null,
}

function remember(key, value) {
    if (key in W) W[key] = value
    else W[key] <- value
    return value
}

function log(line) {
    print(line + "\n")
    if ("buffer" in W) {
        local iter = W.buffer.get_end_iter()
        W.buffer.insert(iter, line + "\n", -1)
    }
    if ("status" in W) W.status.set_text(line)
}

function response_name(response) {
    if (response == Gtk.ResponseType.apply) return "apply"
    if (response == Gtk.ResponseType.close) return "close"
    if (response == Gtk.ResponseType.cancel) return "cancel"
    if (response == Gtk.ResponseType.ok) return "ok"
    if (response == Gtk.ResponseType.delete_event) return "delete-event"
    return response.tostring()
}

function make_dialog(title) {
    local dialog = Gtk.Dialog.new()
    remember("dialog", dialog)
    dialog.set_title(title)
    dialog.set_modal(true)
    dialog.set_transient_for(W.win)
    dialog.set_default_size(420, 260)
    return dialog
}

function on_dialog_done(dialog, response, applied = false) {
    log("dialog response: " + response_name(response))
    if (response == Gtk.ResponseType.apply) State.apply_count++
    else if (response == Gtk.ResponseType.ok) State.ok_count++
    else State.close_count++

    if (applied) log("apply action ran: " + State.apply_count)
    dialog.close()
    W.dialog = null
}

function show_review_dialog() {
    local dialog = make_dialog("Review Transaction")
    local handled = false
    dialog.add_button("Close", Gtk.ResponseType.close)
    dialog.add_button("Apply", Gtk.ResponseType.apply)

    local area = dialog.get_content_area()
    local box = Gtk.Box.new(Gtk.Orientation.vertical, 8)
    box.set_margin_top(12)
    box.set_margin_bottom(12)
    box.set_margin_start(12)
    box.set_margin_end(12)

    local title = Gtk.Label.new("Install")
    title.set_xalign(0.0)
    box.append(title)

    local body = Gtk.Label.new("  demo-runtime 1.0 (dependency)\n  demo-app 1.0 (manual)")
    body.set_xalign(0.0)
    body.set_selectable(true)
    box.append(body)
    area.append(box)

    // GtkDialog::response (response_id: int)
    // SQGI does not pass the dialog instance as the first callback argument.
    dialog.connect("response", function(response) {
        if (handled) return
        handled = true
        on_dialog_done(dialog, response, response == Gtk.ResponseType.apply)
    })

    log("opened review dialog")
    dialog.present()
}

function show_info_dialog() {
    local dialog = make_dialog("Information")
    local handled = false
    dialog.add_button("OK", Gtk.ResponseType.ok)

    local area = dialog.get_content_area()
    local label = Gtk.Label.new("This dialog exists to show the OK response path.")
    label.set_margin_top(12)
    label.set_margin_bottom(12)
    label.set_margin_start(12)
    label.set_margin_end(12)
    area.append(label)

    dialog.connect("response", function(response) {
        if (handled) return
        handled = true
        on_dialog_done(dialog, response)
    })

    log("opened info dialog")
    dialog.present()
}

function require_dialog(message) {
    if (!("dialog" in W) || W.dialog == null) {
        State.exit_code = 1
        throw message
    }
}

function verify_auto() {
    if (State.apply_count != 1 || State.ok_count != 1 || State.close_count < 1) {
        State.exit_code = 1
        throw "unexpected response counts: apply=" + State.apply_count +
            " ok=" + State.ok_count + " close=" + State.close_count
    }
    log("[OK] dialog response demo auto-drive passed")
}

function build_window() {
    local win = Gtk.ApplicationWindow.new(app)
    win.set_title("SQGI GTK 4 Dialog Demo")
    win.set_default_size(520, 360)
    remember("win", win)

    local root = Gtk.Box.new(Gtk.Orientation.vertical, 8)
    root.set_margin_top(12)
    root.set_margin_bottom(12)
    root.set_margin_start(12)
    root.set_margin_end(12)
    win.set_child(root)

    local status = Gtk.Label.new("Ready")
    status.set_xalign(0.0)
    remember("status", status)
    root.append(status)

    local buttons = Gtk.Box.new(Gtk.Orientation.horizontal, 8)
    local review = Gtk.Button.new_with_label("Open Review Dialog")
    review.connect("clicked", function() { show_review_dialog() })
    remember("review", review)
    buttons.append(review)

    local info = Gtk.Button.new_with_label("Open Info Dialog")
    info.connect("clicked", function() { show_info_dialog() })
    remember("info", info)
    buttons.append(info)

    local quit = Gtk.Button.new_with_label("Quit")
    quit.connect("clicked", function() { app.quit() })
    remember("quit", quit)
    buttons.append(quit)
    root.append(buttons)

    local view = Gtk.TextView.new()
    view.set_editable(false)
    view.set_cursor_visible(false)
    view.set_monospace(true)
    remember("buffer", view.get_buffer())
    local scroll = Gtk.ScrolledWindow.new()
    scroll.set_hexpand(true)
    scroll.set_vexpand(true)
    scroll.set_child(view)
    root.append(scroll)

    win.present()
    log("window presented")
}

function setup_auto_drive() {
    State.steps = [
        function() { show_review_dialog() },
        function() { require_dialog("review dialog did not open"); W.dialog.response(Gtk.ResponseType.close) },
        function() { show_review_dialog() },
        function() { require_dialog("review dialog did not reopen"); W.dialog.response(Gtk.ResponseType.apply) },
        function() { show_info_dialog() },
        function() { require_dialog("info dialog did not open"); W.dialog.response(Gtk.ResponseType.ok) },
        function() { verify_auto(); app.quit() },
    ]

    sqgi.timeout_add(150, function() {
        try {
            if (State.step >= State.steps.len()) return false
            State.steps[State.step]()
            State.step++
            return true
        } catch (e) {
            log("[FAIL] " + e)
            State.exit_code = 1
            app.quit()
            return false
        }
    })
}

app.connect("activate", function() {
    build_window()
    if (auto_drive) setup_auto_drive()
    else if (hard_timeout > 0) {
        sqgi.timeout_add(hard_timeout * 1000, function() {
            log("[timeout reached, quitting]")
            app.quit()
            return false
        })
    }
})

print("starting Gtk4 dialog demo (auto=" + auto_drive +
    ", timeout=" + hard_timeout + "s)\n")
local status = app.run(0, null)
print("Gtk Application exited with status " + status + "\n")
if (status != 0) return status
return State.exit_code
