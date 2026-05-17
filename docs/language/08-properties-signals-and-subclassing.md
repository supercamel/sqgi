# Chapter 8 - Properties, Signals, and Subclassing

Objects you import via GI are not passive bags of data. They have **properties** you can read and write, they **emit signals** when interesting things happen, and you can **subclass** them in Squirrel to plug in custom behavior. This chapter walks through all three.

## 8.1 Properties

Every GObject type has a fixed set of typed property slots. Use bracket syntax with the property name:

```squirrel
local Gio = import("Gio")
local app = sqgi.new_object(Gio.Application, { "application-id" = "org.example.App" })

print(app["application-id"] + "\n")  // read
app["flags"] = Gio.ApplicationFlags.HANDLES_OPEN  // write
```

Property names use hyphens (`application-id`), not underscores. You always need quotes because of the hyphen.

### Setting properties at construction time

`sqgi.new_object(klass, props)` is the idiomatic constructor. It takes the class and a table of `"name" = value` pairs:

```squirrel
local app = sqgi.new_object(Gio.Application, {
    "application-id" = "org.example.App",
    "flags"          = Gio.ApplicationFlags.FLAGS_NONE,
})
```

This is preferred over assigning property by property after construction; many objects expect to be fully configured before they "wake up".

### `notify::property-name`

When a property changes, the object emits a `notify` signal with a detail equal to the property name. Subscribe to learn when something changes:

```squirrel
app.connect("notify::application-id", function(self, pspec) {
    print("id is now " + self["application-id"] + "\n")
})
```

## 8.2 Signals

A **signal** is a named broadcast event. Other code can connect a callback that runs each time the signal fires.

### Connecting

```squirrel
local id = app.connect("activate", function(self) {
    print("app activated\n")
})
```

`connect(signal_name, handler)` returns an integer **handler ID** you can later pass to `disconnect` to remove it.

The handler receives the emitting object as its first argument (`self`), followed by whatever the signal declares. Always check the documentation for signal-specific arguments.

### Disconnecting

```squirrel
app.disconnect(id)
```

### Emitting from your own subclasses

Custom signals are defined when you register your class (next section).

## 8.3 Writing a subclass: `sqgi.register_class`

You can create a brand-new GObject type from Squirrel. The runtime takes care of the C-side registration; you write the Squirrel.

```squirrel
local Gio = import("Gio")

local MyApp = sqgi.register_class({
    name   = "SqgiMyApp",          // GType name (must be unique)
    parent = Gio.Application,      // any GObject class

    overrides = {
        activate = function(self) {
            print("MyApp activated\n")
        },
        startup = function(self) {
            sqgi.chain_up()        // call parent startup first
            print("MyApp starting up\n")
        },
    },
})

local app = sqgi.new_object(MyApp, { "application-id" = "org.example.MyApp" })
app.run([])
```

What's happening:

- `name` is the GType name (think of it as the class's identity in the GObject world). Must not collide with an existing type.
- `parent` is the class you inherit from.
- `overrides` is a table of vfunc names to Squirrel functions. The names map to the parent's vfunc table (`activate`, `startup`, `command_line`, `dispose`, ...).
- Each override's first parameter is `self` — the instance.

`sqgi.register_class` returns a Squirrel class object you can pass to `sqgi.new_object`.

### Chaining up to the parent: `sqgi.chain_up`

Inside an override, calling `sqgi.chain_up()` invokes the **parent class's** version of the same vfunc with the same arguments. Use it whenever you want to extend behavior instead of replace it.

```squirrel
overrides = {
    startup = function(self) {
        sqgi.chain_up()           // GApplication still needs to initialize
        my_extra_setup(self)
    }
}
```

Forgetting to chain up is a common cause of subtle bugs — the parent's setup never runs.

## 8.4 Threading constraint

Overrides run on the GLib main thread (the same thread that owns the Squirrel VM). If a GObject calls a vfunc from a worker thread, the runtime will crash. This matches SQGI's overall single-threaded VM policy and is rarely a problem in practice — almost all GIO/GTK callbacks fire on the main thread.

## 8.5 A complete pattern: a GApplication subclass

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

local TodoApp = sqgi.register_class({
    name   = "SqgiTodoApp",
    parent = Gio.Application,
    overrides = {
        startup = function(self) {
            sqgi.chain_up()
            self.items <- []
            print("[todo] ready\n")
        },
        activate = function(self) {
            print("[todo] " + self.items.len() + " items\n")
        },
        command_line = function(self, cmdline) {
            local args = cmdline.get_arguments()
            // args[0] is argv[0]
            for (local i = 1; i < args.len(); i++) {
                self.items.append(args[i])
            }
            self.activate()
            return 0
        },
    },
})

local app = sqgi.new_object(TodoApp, {
    "application-id" = "org.example.Todo",
    "flags"          = Gio.ApplicationFlags.HANDLES_COMMAND_LINE,
})

return app.run(vargv)
```

This builds a fully working GApplication that accepts command-line arguments, stores them on `self`, and prints a summary.

Notes:

- `self.items <- []` uses the `<-` insertion operator from chapter 3 because the slot doesn't exist yet on `self`.
- We forward `vargv` to `app.run(...)`. GApplication's main loop will dispatch to our overrides.
- We declare `HANDLES_COMMAND_LINE` so the `command_line` override fires.

## 8.6 Signal handler patterns

### Disconnecting after first use

```squirrel
local id
id = obj.connect("ready", function(self) {
    print("first ready\n")
    obj.disconnect(id)
})
```

### Using closures to hold state

```squirrel
function make_counter_logger() {
    local n = 0
    return function(self) {
        n++
        print("activate #" + n + "\n")
    }
}

app.connect("activate", make_counter_logger())
```

This is exactly the closure pattern from chapter 4, applied to signal handlers.

### Awaiting a signal as if it were async

You can await on a one-shot signal using `sqgi.Task`. See chapter 9 for the async story; the pattern is:

```squirrel
function wait_for_activate(app) {
    local task = sqgi.Task()
    local id
    id = app.connect("activate", function(self) {
        app.disconnect(id)
        task.resolve(true)
    })
    return task
}

// somewhere async:
await wait_for_activate(app)
```

## 8.7 Exercises

1. Subclass `GObject.Object` to add an integer counter property. Connect to `notify::counter` to log changes.
2. Build a `Clock` subclass that emits a custom `tick` signal once per second (you'll combine `sqgi.timeout_add` from chapter 9).
3. Override `Gio.Application.shutdown` to log a goodbye message; remember to chain up.
4. Read `demo/gtk4/` for a real GTK subclass example.

## 8.8 What's next

Chapter 9 introduces SQGI's async runtime: tasks, `await`, and cancellation — the model that makes all this signal-driven code feel sequential.
