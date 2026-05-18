# GTK 4 Cookbook

Practical recipes for building GTK 4 user interfaces from SQGI. This document
assumes you've read at least chapters 7–10 of `docs/language/`.

All examples here are runnable with:

```bash
./build/sqgi path/to/script.nut
```

See `demo/gtk4/` for fuller working scripts that exercise the same APIs.

## Contents

- [1. Hello world skeleton](#1-hello-world-skeleton)
- [2. Application lifecycle](#2-application-lifecycle)
- [3. Layouts: boxes, grids, margins](#3-layouts-boxes-grids-margins)
- [4. Common widgets](#4-common-widgets)
- [5. Signal patterns](#5-signal-patterns)
- [6. Lists and selection](#6-lists-and-selection)
- [7. Text input](#7-text-input)
- [8. Multi-page layouts](#8-multi-page-layouts)
- [9. Custom drawing with Cairo](#9-custom-drawing-with-cairo)
- [10. Animation: tick callbacks](#10-animation-tick-callbacks)
- [11. Doing async work without freezing the UI](#11-doing-async-work-without-freezing-the-ui)
- [12. Subclassing widgets](#12-subclassing-widgets)
- [13. Common pitfalls](#13-common-pitfalls)

---

## 1. Hello world skeleton

The minimum viable GTK 4 program:

```squirrel
local Gtk = import("Gtk", "4.0")

local app = Gtk.Application.new("com.example.sqgi.hello", 0)

app.connect("activate", function() {
    local win = Gtk.ApplicationWindow.new(app)
    win.set_title("Hello")
    win.set_default_size(360, 180)
    win.set_child(Gtk.Label.new("Hello from SQGI + GTK 4"))
    win.present()
})

local status = app.run(0, null)
print("exited " + status + "\n")
```

Three things are happening:

1. Construct a `Gtk.Application` with a reverse-DNS app id and flags (`0` = `flags_none`).
2. Connect `activate` — fired when the app becomes the active instance. Build your UI here.
3. `app.run(argc, argv)` runs the GTK main loop until the last window closes.

`app.run(0, null)` is the simplest form. Pass `vargv.len(), vargv` only if you've also requested `HANDLES_COMMAND_LINE` (see [§2](#2-application-lifecycle)).

## 2. Application lifecycle

### Flags

```squirrel
local Gio = import("Gio")
local Gtk = import("Gtk", "4.0")

local app = Gtk.Application.new(
    "com.example.sqgi.app",
    Gio.ApplicationFlags.flags_none
)
```

Both `0` and `Gio.ApplicationFlags.flags_none` are equivalent. Use the enum
when you want named flags like `HANDLES_OPEN` or `HANDLES_COMMAND_LINE`.

### The signals you'll typically connect

| Signal | When it fires | Use for |
|---|---|---|
| `activate` | Primary instance starts and no other entry point ran | Build UI |
| `startup` | Very early; before `activate` | One-time setup |
| `shutdown` | Just before exit | Save state |
| `open` | App receives files (needs `HANDLES_OPEN`) | Open documents |
| `command-line` | App receives argv (needs `HANDLES_COMMAND_LINE`) | CLI handling |

### Quitting

```squirrel
app.quit()           // schedule shutdown
```

Or simply close the last window — the app exits automatically.

### Keeping the app alive during async work

```squirrel
app.hold()
do_work_async().then(function(_) { app.release() })
               .catch(function(e) { print("err: " + e + "\n"); app.release() })
```

`hold`/`release` add a refcount so the app doesn't quit while background work
is in flight. Always pair them.

## 3. Layouts: boxes, grids, margins

### Vertical/horizontal boxes

```squirrel
local box = Gtk.Box.new(Gtk.Orientation.vertical, 12)   // 12 px spacing
box.set_margin_top(16)
box.set_margin_bottom(16)
box.set_margin_start(16)
box.set_margin_end(16)

box.append(Gtk.Label.new("Top"))
box.append(Gtk.Label.new("Middle"))
box.append(Gtk.Label.new("Bottom"))

window.set_child(box)
```

`set_child` replaces whatever was there. To add many children to a window,
put them in a `Gtk.Box` (or `Gtk.Grid`, `Gtk.Stack`, ...) first.

### Grid

```squirrel
local grid = Gtk.Grid.new()
grid.set_column_spacing(8)
grid.set_row_spacing(4)

// attach(child, column, row, width, height)
grid.attach(Gtk.Label.new("Name"), 0, 0, 1, 1)
grid.attach(Gtk.Entry.new(),       1, 0, 1, 1)
grid.attach(Gtk.Label.new("Age"),  0, 1, 1, 1)
grid.attach(Gtk.Entry.new(),       1, 1, 1, 1)
```

### Expansion and alignment

```squirrel
widget.set_hexpand(true)      // grow horizontally to fill
widget.set_vexpand(true)
widget.set_halign(Gtk.Align.start)
widget.set_valign(Gtk.Align.center)
```

### HeaderBar

```squirrel
local header = Gtk.HeaderBar.new()
header.set_title_widget(Gtk.Label.new("My App"))
win.set_titlebar(header)
```

Add buttons or menus to the header with `header.pack_start(widget)` and
`header.pack_end(widget)`.

## 4. Common widgets

### Buttons

```squirrel
local btn = Gtk.Button.new_with_label("Click me")
btn.connect("clicked", function() {
    print("clicked\n")
})
```

Variants: `Gtk.Button.new()`, `new_from_icon_name("document-open-symbolic")`,
`new_with_mnemonic("_Open")`.

### Toggle / check / switch

```squirrel
local toggle = Gtk.ToggleButton.new_with_label("Bold")
toggle.connect("toggled", function() {
    print("bold=" + toggle.get_active() + "\n")
})

local check = Gtk.CheckButton.new_with_label("Send anonymous stats")
check.connect("toggled", function() {
    print("checked=" + check.get_active() + "\n")
})

local sw = Gtk.Switch.new()
sw.connect("state-set", function(state) {
    print("switch state=" + state + "\n")
    return false   // false = accept default visual update; true = handled
})
```

### Labels

```squirrel
local lbl = Gtk.Label.new("Status: ready")
lbl.set_xalign(0.0)              // left-align
lbl.set_wrap(true)
lbl.set_markup("<b>Bold</b> and <i>italic</i> via Pango markup")
```

### Numeric input

```squirrel
local adj = Gtk.Adjustment.new(50.0, 0.0, 100.0, 1.0, 10.0, 0.0)
//                              ^val  ^lo   ^hi   ^step ^page ^pgsize

local scale = Gtk.Scale.new(Gtk.Orientation.horizontal, adj)
scale.set_hexpand(true)
scale.set_draw_value(true)

adj.connect("value-changed", function() {
    print("value=" + adj.get_value() + "\n")
})

local spin = Gtk.SpinButton.new(adj, 1.0, 0)   // climb_rate, digits
```

### DropDown

```squirrel
local items = Gtk.StringList.new(["Apple", "Banana", "Cherry"])
local dd    = Gtk.DropDown.new(items, null)

dd.connect("notify::selected", function(pspec) {
    print("idx=" + dd.get_selected() + "\n")
})
```

DropDown reports selection via `notify::selected`, not a custom signal.

## 5. Signal patterns

### Connecting

```squirrel
local handler_id = widget.connect("signal-name", function(args...) { ... })
```

The handler's first parameter is the emitting object **only when** GI delivers
it; in practice, SQGI delivers signal arguments **without** the emitter, since
you already have a reference to it through your closure. (You'll see this
shape in every `demo/gtk4/` script.)

Examples of argument counts:

| Signal | Handler shape |
|---|---|
| `clicked` (button) | `function() { ... }` |
| `toggled` | `function() { ... }` |
| `value-changed` | `function() { ... }` |
| `changed` (entry) | `function() { ... }` |
| `activate` (entry) | `function() { ... }` |
| `state-set` (switch) | `function(state) { return false }` |
| `row-activated` (listbox) | `function(row) { ... }` |
| `row-selected` (listbox) | `function(row) { ... }` *(`row` may be null)* |
| `switch-page` (notebook) | `function(page, page_num) { ... }` |
| `notify::<prop>` | `function(pspec) { ... }` *(pspec has `.name`)* |

Always check the GTK docs to confirm a specific signal's signature.

### Disconnecting

```squirrel
widget.disconnect(handler_id)
```

### Property-change listeners

```squirrel
widget.connect("notify::sensitive", function(pspec) {
    print("sensitive=" + widget.get_sensitive() + "\n")
})
```

`notify::<prop>` fires on every property change, including programmatic ones.

### Holding closure state

Squirrel closures capture upvalues by reference. To accumulate state across
callback firings:

```squirrel
local count = 0
btn.connect("clicked", function() {
    count = count + 1
    label.set_label("Count: " + count)
})
```

For state that needs to outlive the activate handler (across multiple
signals), use a module-level table (`local W = {}`) and write to it with
`<-` — see `demo/gtk4/widgets.nut` for an example.

## 6. Lists and selection

### ListBox

```squirrel
local list = Gtk.ListBox.new()
list.set_selection_mode(Gtk.SelectionMode.single)

foreach (text in ["Alpha", "Bravo", "Charlie", "Delta"]) {
    local row = Gtk.ListBoxRow.new()
    row.set_child(Gtk.Label.new(text))
    list.append(row)
}

list.connect("row-activated", function(row) {
    print("activated index=" + row.get_index() + "\n")
})

list.connect("row-selected", function(row) {
    if (row == null) {
        print("nothing selected\n")
    } else {
        print("selected index=" + row.get_index() + "\n")
    }
})
```

Wrap it in a `Gtk.ScrolledWindow` if it might grow:

```squirrel
local scrolled = Gtk.ScrolledWindow.new()
scrolled.set_min_content_height(200)
scrolled.set_child(list)
```

### Programmatic selection

```squirrel
list.select_row(list.get_row_at_index(2))
```

## 7. Text input

### Entry (single line)

```squirrel
local entry = Gtk.Entry.new()
entry.set_placeholder_text("type and press Enter")

entry.connect("changed",  function() { print("now: " + entry.get_text() + "\n") })
entry.connect("activate", function() { print("submitted: " + entry.get_text() + "\n") })
```

### TextView (multi-line)

```squirrel
local view = Gtk.TextView.new()
view.set_wrap_mode(Gtk.WrapMode.word)

local buf = view.get_buffer()
buf.set_text("Edit this text…\n", -1)   // -1 = null-terminated

buf.connect("changed", function() {
    print("buffer len now " + buf.get_char_count() + "\n")
})

// Read the whole buffer:
local start = buf.get_start_iter()
local end   = buf.get_end_iter()
local text  = buf.get_text(start, end, false)
```

## 8. Multi-page layouts

### Notebook (tabs)

```squirrel
local nb = Gtk.Notebook.new()

local page1 = Gtk.Label.new("First page")
nb.append_page(page1, Gtk.Label.new("One"))

local page2 = Gtk.Label.new("Second page")
nb.append_page(page2, Gtk.Label.new("Two"))

nb.connect("switch-page", function(page, page_num) {
    print("now on page " + page_num + "\n")
})

win.set_child(nb)
```

### Stack + StackSwitcher (modern alternative)

```squirrel
local stack = Gtk.Stack.new()
stack.add_titled(make_view1(), "view1", "Overview")
stack.add_titled(make_view2(), "view2", "Details")

local switcher = Gtk.StackSwitcher.new()
switcher.set_stack(stack)

local outer = Gtk.Box.new(Gtk.Orientation.vertical, 0)
outer.append(switcher)
outer.append(stack)
win.set_child(outer)
```

## 9. Custom drawing with Cairo

`Gtk.DrawingArea` lets you paint anything. SQGI wraps the `cairo_t*` GTK
passes in as a real `cairo.Context`, so you can issue draw commands directly.

```squirrel
local cairo = import("cairo")
local area  = Gtk.DrawingArea.new()
area.set_size_request(400, 240)

area.set_draw_func(function(widget, cr, w, h) {
    // Background.
    cr.set_source_rgba(0.1, 0.1, 0.15, 1.0)
    cr.rectangle(0, 0, w, h)
    cr.fill()

    // A circle.
    cr.set_source_rgba(1.0, 0.6, 0.2, 1.0)
    cr.arc(w / 2.0, h / 2.0, 60, 0, 6.28318530718)
    cr.fill()

    // Text on top.
    cr.set_source_rgba(1, 1, 1, 0.85)
    cr.select_font_face("Sans", 0, 1)   // slant=normal, weight=bold
    cr.set_font_size(14)
    cr.move_to(12, 22)
    cr.show_text("Hello, Cairo")
}, null, function(_) {})

win.set_child(area)
```

`set_draw_func(fn, user_data, destroy_notify)`. Pass `null` for `user_data`
and a no-op closure such as `function(_) {}` for `destroy_notify` unless you
have C-side context to share.

### Gradients

```squirrel
local g = cairo.Pattern.create_linear(0, 0, 0, h)
g.add_color_stop_rgba(0.0, 0.06, 0.07, 0.12, 1.0)
g.add_color_stop_rgba(1.0, 0.02, 0.03, 0.06, 1.0)
cr.set_source(g)
cr.rectangle(0, 0, w, h)
cr.fill()
```

Radial gradients use `cairo.Pattern.create_radial(cx0, cy0, r0, cx1, cy1, r1)`.

## 10. Animation: tick callbacks

Don't use `sqgi.timeout_add` for animation — it isn't synced to frames. Use
`add_tick_callback` on the widget you're animating:

```squirrel
local state = { x = 60.0, vx = 220.0, last_us = -1 }

area.add_tick_callback(function(widget, clock) {
    local now = clock.get_frame_time()   // µs since epoch
    local dt  = (state.last_us < 0) ? 0.016 : ((now - state.last_us) / 1000000.0)
    state.last_us = now
    if (dt > 0.1) dt = 0.1   // clamp on stalls (e.g. window minimized)

    state.x = state.x + state.vx * dt

    local W = widget.get_allocated_width().tofloat()
    if (state.x < 0 || state.x > W) state.vx = -state.vx

    widget.queue_draw()
    return true   // G_SOURCE_CONTINUE — return false to stop the animation
}, null, null)
```

The pattern:

1. Compute `dt` from the supplied frame clock. Don't assume a fixed timestep.
2. Update state.
3. Call `widget.queue_draw()` to invalidate; the draw callback fires on the
   next frame and renders the new state.
4. Return `true` to keep going.

See `demo/gtk4/bouncing_ball.nut` for a full worked example.

## 11. Doing async work without freezing the UI

If a `clicked` handler runs for 5 seconds, your window freezes for 5
seconds. Use SQGI's async runtime to keep the UI responsive.

### Loading a file when a button is clicked

```squirrel
local Gio  = import("Gio")
local Gtk  = import("Gtk", "4.0")

local app = Gtk.Application.new("com.example.sqgi.loader", 0)

app.connect("activate", function() {
    local win   = Gtk.ApplicationWindow.new(app)
    local box   = Gtk.Box.new(Gtk.Orientation.vertical, 8)
    local btn   = Gtk.Button.new_with_label("Load /etc/hostname")
    local label = Gtk.Label.new("(idle)")

    box.append(btn)
    box.append(label)
    win.set_child(box)

    // An async function returns a Task. We don't need to await it from
    // the signal handler — we just kick it off and let .then/.catch run
    // on the main loop when it settles.
    local load = async function() {
        label.set_label("loading…")
        local f      = Gio.File.new_for_path("/etc/hostname")
        local result = await f.load_contents_async(null)
        label.set_label(result[1])   // contents
    }

    btn.connect("clicked", function() {
        load().catch(function(e) {
            label.set_label("error: " + e)
        })
    })

    win.set_default_size(360, 120)
    win.present()
})

app.run(0, null)
```

The GTK main loop is what drives `await` resumption, so this Just Works
inside a GTK app — no extra `GLib.MainLoop` setup required.

### Cancelling on window close

```squirrel
local in_flight = null

btn.connect("clicked", function() {
    in_flight = load()
    in_flight.catch(function(e) {
        if (typeof(e) == "table" && ("__cancelled" in e) && e.__cancelled) {
            label.set_label("cancelled")
        } else {
            label.set_label("error: " + e)
        }
    })
})

win.connect("close-request", function() {
    if (in_flight != null) in_flight.cancel("window closed")
    return false   // allow close
})
```

## 12. Subclassing widgets

For composite widgets and stateful components, `sqgi.register_class` is the
idiomatic tool. See chapter 8 of the language tutorial for the full story.

A minimal example: subclassing `Gtk.Application` to centralize setup:

```squirrel
local Gio = import("Gio")
local Gtk = import("Gtk", "4.0")

local MyApp = sqgi.register_class({
    name   = "SqgiMyApp",
    parent = Gtk.Application,
    overrides = {
        startup = function(self) {
            sqgi.chain_up()
            print("[startup]\n")
        },
        activate = function(self) {
            local win = Gtk.ApplicationWindow.new(self)
            win.set_title("Subclassed App")
            win.set_default_size(360, 160)
            win.set_child(Gtk.Label.new("Hello from MyApp"))
            win.present()
        },
    },
})

local app = sqgi.new_object(MyApp, {
    "application-id" = "com.example.sqgi.myapp",
})
app.run(0, null)
```

**Always `sqgi.chain_up()` in `startup`** — GApplication does important setup
there.

## 13. Common pitfalls

| Symptom | Cause | Fix |
|---|---|---|
| Window never appears | Forgot `win.present()` | Add it |
| Crash on second window | Holding stale refs to widgets from a previous activate | Rebuild UI on each activate, or guard with module-level state |
| UI freezes for seconds | Synchronous I/O in a signal handler | Use `await` on an async GIO method |
| `the index 'foo' does not exist` on a state table | Used `=` to add a new slot | Use `<-` for first assignment |
| Animation stutters | Used `sqgi.timeout_add` instead of `add_tick_callback` | Switch to tick callback |
| `notify::selected` never fires | Property name typo (e.g. underscore vs hyphen) | Property names use hyphens |
| `state-set` doesn't update the switch | Returned `true` (handled) | Return `false` to allow default visual update |
| Closure sees `null` for a widget | Widget was declared with `local` *after* the closure | Declare it before, or use a module-level table |
| Exit hangs | Background Task still running | `app.release()`, or cancel the task on close |

## Further reading

- `demo/gtk4/hello_world.nut` — minimal app
- `demo/gtk4/counter.nut` — closure-captured state
- `demo/gtk4/widgets.nut` — exhaustive widget gallery
- `demo/gtk4/bouncing_ball.nut` — Cairo + tick callbacks
- [GTK 4 reference](https://docs.gtk.org/gtk4/) — translate symbols via `docs/language/07-gi-imports-and-gobject-basics.md`.
