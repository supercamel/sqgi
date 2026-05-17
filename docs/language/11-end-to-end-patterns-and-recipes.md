# Chapter 11 - End-to-End Patterns and Recipes

This chapter is a cookbook. Each recipe is a complete, runnable shape you can copy and adapt. The goal is to internalize the *shape* of common SQGI programs so you don't reinvent it each time.

## 11.1 The minimal async CLI

```squirrel
local GLib = import("GLib")

async function main(argv) {
    print("started with " + argv.len() + " args\n")
    await sqgi.sleep(200)
    print("done\n")
    return 0
}

local loop = GLib.MainLoop.new(null, false)
local exit_code = 0

main(vargv)
    .then(function(code) { exit_code = code; loop.quit() })
    .catch(function(e)   { print("error: " + e + "\n"); exit_code = 1; loop.quit() })

loop.run()
return exit_code
```

Skeleton to copy any time you need an async script with proper exit codes and error handling.

## 11.2 Parallel fan-out

Process N inputs concurrently and collect results, with per-item failure isolation.

```squirrel
local Gio = import("Gio")

async function load_one(path) {
    local f = Gio.File.new_for_path(path)
    try {
        local r = await f.load_contents_async(null)
        return { path = path, ok = true, size = r[0].len() }
    } catch (e) {
        return { path = path, ok = false, error = e.tostring() }
    }
}

async function load_all(paths) {
    local tasks = []
    foreach (p in paths) tasks.append(load_one(p))
    return await sqgi.all(tasks)
}
```

Each `load_one` swallows its own errors and returns a result record, so a single failure doesn't poison `sqgi.all`.

## 11.3 Race with timeout

```squirrel
async function with_timeout(make_task, ms) {
    local task = make_task()
    local timer = sqgi.sleep(ms)
    local winner = await sqgi.race([task, timer])

    // sqgi.race resolves with the first settled value. Both task and timer
    // resolve with a value (task with its own result, timer with elapsed ms).
    // The cleanest way to know who won is to track it explicitly.
    if (task.__done == false) {
        // timer won
        task.cancel("timeout after " + ms + " ms")
        throw "timeout"
    }
    return winner
}
```

Adapt as needed — many use sites can tell who won by inspecting the result shape, but tracking it explicitly is the safest pattern.

## 11.4 Retry with exponential backoff

```squirrel
async function with_retry(make_task, attempts, base_ms) {
    for (local i = 0; i < attempts; i++) {
        try {
            return await make_task()
        } catch (e) {
            if (typeof(e) == "table" && ("__cancelled" in e) && e.__cancelled) {
                throw e   // never retry on cancellation
            }
            if (i == attempts - 1) throw e
            local delay = base_ms * (1 << i)
            print("attempt " + (i + 1) + " failed (" + e + "); retrying in " + delay + " ms\n")
            await sqgi.sleep(delay)
        }
    }
}

// Usage:
local result = await with_retry(
    @() flaky_load("/tmp/x"),
    3, 250
)
```

Note that we accept a **task factory**, not a task: each retry needs a *fresh* task because tasks are one-shot.

## 11.5 GApplication-based CLI

For tools that benefit from desktop integration, accept signals, or use `command_line`:

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

local Cli = sqgi.register_class({
    name = "SqgiCli",
    parent = Gio.Application,
    overrides = {
        command_line = function(self, cmdline) {
            local args = cmdline.get_arguments()
            // do work synchronously, or kick off async and hold app
            self.hold()
            do_work_async(args)
                .then(function(_) { self.release() })
                .catch(function(e) {
                    print("error: " + e + "\n")
                    self.release()
                })
            return 0
        },
    },
})

async function do_work_async(args) {
    // your async logic here
}

local app = sqgi.new_object(Cli, {
    "application-id" = "org.example.Cli",
    "flags"          = Gio.ApplicationFlags.HANDLES_COMMAND_LINE,
})
return app.run(vargv)
```

`hold` / `release` keeps the application alive while async work is in flight.

## 11.6 Signal-driven monitor

Watch for an event and react. No `await` — just callbacks.

```squirrel
local Gio = import("Gio")

local file = Gio.File.new_for_path("/tmp/watch.txt")
local mon = file.monitor_file(Gio.FileMonitorFlags.NONE, null)

mon.connect("changed", function(self, f, other, event_type) {
    print(format("event %d on %s\n", event_type, f.get_path()))
})

local GLib = import("GLib")
local loop = GLib.MainLoop.new(null, false)
loop.run()
```

Touch `/tmp/watch.txt` in another shell to see callbacks fire.

## 11.7 Mixing sync and async

You can offer both modes from a single program by selecting at runtime:

```squirrel
local mode = "sync"
foreach (a in vargv) {
    if (a == "--async") mode = "async"
}

if (mode == "sync") {
    do_sync()
} else {
    local GLib = import("GLib")
    local loop = GLib.MainLoop.new(null, false)
    do_async().then(function(_) { loop.quit() })
              .catch(function(e) { print("err: " + e + "\n"); loop.quit() })
    loop.run()
}
```

See `demo/gio/run.nut` for a worked example using `--sync|--async|--both`.

## 11.8 Producer / consumer with a queue

Multiple producers feed a queue; one consumer drains it. Useful when async work arrives faster than it can be processed.

```squirrel
class Queue {
    items = null
    waiter = null

    constructor() {
        this.items = []
    }

    function push(x) {
        this.items.append(x)
        if (this.waiter != null) {
            local w = this.waiter
            this.waiter = null
            w.resolve(true)
        }
    }

    function pop() {
        if (this.items.len() > 0) return this.items.remove(0)
        // No items: hand back a task to await on.
        if (this.waiter == null) this.waiter = sqgi.Task()
        return this.waiter
    }
}

async function consume(q) {
    while (true) {
        local item = q.pop()
        if (typeof(item) == "table" && ("__sqgi_task" in item)) {
            await item
            continue   // wake up; try again
        }
        process(item)
    }
}
```

Adapt as needed. Real systems wrap this with cancellation and bounded sizes.

## 11.9 Configurable logger

A common refactor as a script grows:

```squirrel
class Logger {
    level = "info"
    static LEVELS = { error = 0, warn = 1, info = 2, debug = 3 }

    constructor(level = "info") {
        this.level = level
    }

    function log(lvl, msg) {
        if (Logger.LEVELS[lvl] > Logger.LEVELS[this.level]) return
        print("[" + lvl + "] " + msg + "\n")
    }

    function error(m) { this.log("error", m) }
    function warn(m)  { this.log("warn",  m) }
    function info(m)  { this.log("info",  m) }
    function debug(m) { this.log("debug", m) }
}

local log = Logger("debug")
log.info("started")
log.debug("verbose detail")
```

## 11.10 Putting it together: a fetch-and-summarize tool

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

async function load_one(path) {
    local f = Gio.File.new_for_path(path)
    try {
        local r = await f.load_contents_async(null)
        return { path = path, ok = true, bytes = r[0].len() }
    } catch (e) {
        return { path = path, ok = false, error = e.tostring() }
    }
}

async function main(paths) {
    if (paths.len() == 0) {
        print("usage: summarize FILE [FILE ...]\n")
        return 1
    }
    local tasks = paths.map(@(_, p) load_one(p))
    local results = await sqgi.all(tasks)
    foreach (r in results) {
        if (r.ok) print(format("%-30s %d bytes\n", r.path, r.bytes))
        else      print(format("%-30s ERROR: %s\n", r.path, r.error))
    }
    return 0
}

local loop = GLib.MainLoop.new(null, false)
local code = 0
main(vargv).then(function(c) { code = c; loop.quit() })
           .catch(function(e) { print("fatal: " + e + "\n"); code = 1; loop.quit() })
loop.run()
return code
```

This single script exercises imports, async functions, error isolation, `sqgi.all`, `array.map` with a short-closure, and a clean exit-code flow.

## 11.11 Exercises

1. Add a `--concurrency N` flag to the summarize tool that processes at most N files at a time.
2. Turn the file monitor recipe into an async function that resolves on the first change event.
3. Write a `Queue` with bounded size that blocks producers via a Task.
4. Adapt the retry recipe to log each attempt with the logger from 11.9.

## 11.12 What's next

Chapter 12 covers GVariant — the typed payload format used by D-Bus, GSettings, and GAction. It's the last big runtime concept you'll meet often.
