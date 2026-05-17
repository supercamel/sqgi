# Chapter 10 - Main Loops, Threading, and the Event Model

This chapter answers the question every newcomer eventually asks: *how does my SQGI script actually run?* Understanding the event model fixes a whole class of bugs ("why isn't my callback firing?") that otherwise feel mysterious.

## 10.1 What is a main loop?

A **main loop** is a long-running piece of code that repeatedly:

1. Looks at all the things it might do (timers ready to fire, file descriptors with data, signals to deliver, async tasks to resume).
2. Picks one and runs its callback.
3. Returns to step 1.

That's it. There's no magic. The loop drives **everything** that isn't sequential script execution.

SQGI uses GLib's main loop (`GMainContext`/`GMainLoop`), the same one GTK, GIO, GStreamer, and libsoup use. You start it with `loop.run()`, and it returns when someone calls `loop.quit()`.

```squirrel
local GLib = import("GLib")
local loop = GLib.MainLoop.new(null, false)

sqgi.timeout_add(1000, function() {
    print("tick\n")
    return true   // return true to keep firing, false to stop
})

sqgi.timeout_add(5000, function() {
    print("done\n")
    loop.quit()
    return false
})

loop.run()   // blocks until quit
```

Run this and you'll see "tick" four times, then "done", then the script ends.

## 10.2 Two phases of a typical SQGI program

Most non-trivial scripts have a clear shape:

```
Phase 1: Setup
  - import namespaces
  - construct objects (sqgi.new_object)
  - wire up signals (connect)
  - register classes (sqgi.register_class)
  - kick off the first async task

Phase 2: Loop
  - loop.run() — everything happens here as callbacks
```

Once `loop.run()` is called, your top-level script is paused. Every line of "active" code is some callback the loop chose to invoke.

## 10.3 Single-threaded VM rule

**There is exactly one Squirrel VM thread**: the one running the main loop. All callbacks, all `async` resumption, all signal handlers — they all run on this single thread.

Why does that matter?

1. You **don't need locks** in Squirrel code. Two callbacks never run at the same time.
2. **Don't call back into the VM from a worker thread**. If a GObject signal happens to fire from a thread other than the main one, calling a Squirrel function from there will crash.
3. **Don't run CPU-heavy work inline**. If your callback takes 5 seconds, the main loop is frozen for 5 seconds — nothing else fires, the UI hangs, network I/O sits unread.

For CPU-heavy work, push it off to a `GSubprocess`, a GIO async operation that runs in C, or break it into small chunks separated by `sqgi.sleep(0)` so other events can be serviced.

## 10.4 The `GApplication` lifecycle

If you build on top of `Gio.Application` (or `Gtk.Application`), you usually don't manage the main loop yourself. `application.run(args)` runs the loop for you and quits when the app exits.

```squirrel
local MyApp = sqgi.register_class({
    name   = "SqgiMyApp",
    parent = Gio.Application,
    overrides = {
        activate = function(self) { print("activated\n") },
    },
})
local app = sqgi.new_object(MyApp, { "application-id" = "org.example.MyApp" })
return app.run(vargv)
```

GApplication holds a reference while it's running and releases it when nothing keeps it alive. For one-shot CLI tools, set `Gio.ApplicationFlags.HANDLES_COMMAND_LINE` and do the work in the `command_line` override.

## 10.5 Timers

`sqgi.timeout_add(ms, fn)` schedules `fn` to run every `ms` milliseconds. The callback's **return value matters**:

- `true` — keep firing
- `false` — remove the timer

To run something once after a delay:

```squirrel
sqgi.timeout_add(500, function() {
    print("hello after 500 ms\n")
    return false
})
```

To run forever (until you remove it manually):

```squirrel
local id = sqgi.timeout_add(1000, function() {
    print("tick\n")
    return true
})

// Later:
sqgi.source_remove(id)
```

## 10.6 Idle work

If you want a callback to run "as soon as the loop is free", use a zero-millisecond timeout:

```squirrel
sqgi.timeout_add(0, function() {
    do_one_chunk_of_work()
    return more_work_remaining()
})
```

This is the standard way to break long work into cooperative chunks.

## 10.7 Async resumption and the loop

When you `await` something, the following happens conceptually:

1. The async function captures its execution state and **returns control to the loop**.
2. The loop continues servicing other events.
3. When the awaited task settles, GLib queues a "wake up that coroutine" job.
4. The loop picks up the job, restores state, and resumes the function.

This is why every async program needs a running main loop. Without it, the wake-up job never gets executed and your script silently hangs.

## 10.8 File descriptors and sockets

GIO covers most network I/O via async methods. If you need raw FD watches, `sqgi.socket_add_watch(socket, condition, fn, cancellable)` lets you await a GSocket condition (readable, writable, hangup). See `src/sqgi_async.c` and the GIO docs for details.

## 10.9 Quitting cleanly

`loop.quit()` exits the loop the next time it runs the dispatch step. It doesn't kill in-flight callbacks; the current callback finishes, and then the loop returns.

Best practice: hook quit-on-error at the top level so a thrown exception in an async function doesn't leave the loop running forever.

```squirrel
async function main() { /* ... */ }

main()
    .then(function(_) { loop.quit() })
    .catch(function(e) {
        print("fatal: " + e + "\n")
        loop.quit()
    })

loop.run()
```

## 10.10 Threading: the rare case you do need it

If you really need a background thread (compression, image processing), the right move is to call into a C library that does the threading for you. GIO and GStreamer both have async APIs that internally use worker threads but deliver completion callbacks on the main loop — exactly what you want.

Spawning a raw thread from Squirrel that calls back into Squirrel will crash. Don't do it.

For shelling out heavy work, `GSubprocess` is reliable:

```squirrel
local Gio = import("Gio")
local proc = sqgi.new_object(Gio.Subprocess, {
    "argv" = ["sha256sum", "/big/file"],
    "flags" = Gio.SubprocessFlags.STDOUT_PIPE,
})
local out = await proc.communicate_utf8_async(null, null)
print(out[1] + "\n")
```

The child does the CPU work; you wait on it from the main loop without blocking.

## 10.11 Diagnosing "nothing is happening"

When events don't fire:

1. **Is the loop running?** No `loop.run()` → no events.
2. **Did you `return true`** from a repeating timer? Otherwise it only fires once.
3. **Did you keep a reference** to the source? Some sources cancel themselves when their last reference drops.
4. **Are you blocking the loop** in a previous callback? Add a `print` at the top of each callback to see scheduling.
5. **Did the async chain reject silently?** Always add `.catch(...)`.

## 10.12 Exercises

1. Write a 1-Hz heartbeat that prints monotonic time, plus a one-shot 10-second timer that quits the loop.
2. Spawn `ls -la /etc` via GSubprocess and print its output via async.
3. Build a "burst" CPU job using `sqgi.timeout_add(0, ...)` that does 1000 units of work split across the loop.
4. Trace the order of callbacks in `demo/gio/run.nut` when you run with `--both`.

## 10.13 What's next

Chapter 11 stitches the previous chapters together into end-to-end recipes: a CLI tool, a fan-out worker, a timeout wrapper, and a signal-driven monitor.
