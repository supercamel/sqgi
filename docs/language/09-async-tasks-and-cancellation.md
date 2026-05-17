# Chapter 9 - Async, Tasks, and Cancellation

SQGI ships with first-class asynchronous programming: `async` functions, the `await` keyword, awaitable tasks, and structured cancellation. This chapter is the most important one for writing real GLib/GIO programs.

## 9.1 Why async?

Most useful work in a GUI or networked program **waits**: reading a file, fetching a URL, waiting for a timeout. If your code blocks the main thread while waiting, the UI freezes and other events can't be processed.

The classic answer is callbacks: "when the file is ready, call this function". Callbacks work but they fragment your logic. Async/await lets you **write linear code** that pauses at each `await` and resumes when the value is available, with the main loop still alive in the gaps.

```squirrel
// Looks sequential, but the main loop keeps running between awaits:
async function load_and_count(path) {
    local data = await file_load(path)
    local n    = await count_words(data)
    print(path + ": " + n + " words\n")
}
```

## 9.2 The mental model: tasks

Every awaitable thing in SQGI is a **Task**. A task is a small object with three possible states:

- **Pending** — no result yet.
- **Resolved** — has a value.
- **Rejected** — has an error.

When you `await task`, your code pauses until the task transitions out of "pending", then either yields the value (resolved) or throws the error (rejected).

You create tasks in a few ways:

| Source | What you get |
|---|---|
| `sqgi.Task()` | A new pending task you control |
| `sqgi.sleep(ms)` | Resolves with elapsed ms after `ms` milliseconds |
| `sqgi.timeout_add(ms, fn)` | Low-level GLib timer (returns source id, not a task) |
| `sqgi.gio_async(initiator, finisher)` | Wraps a GIO `_async/_finish` pair as a task |
| `await obj.method_async(...)` | Auto-wrapping of any GI async method |
| Calling an `async function(...)` | The call itself returns a Task |
| `sqgi.all(tasks)` / `sqgi.race(tasks)` | Combinator tasks |

## 9.3 The `async` and `await` keywords

`async` marks a function whose result is automatically a Task:

```squirrel
async function load_file(path) {
    local Gio = import("Gio")
    local f = Gio.File.new_for_path(path)
    return await f.load_contents_async(null)  // returns [contents, etag]
}
```

`await expr` evaluates `expr`. If it's a task, the function pauses until it settles, and the await expression evaluates to the resolved value (or throws the rejection). If it's a plain value, `await` just yields it as-is.

You can only use `await` inside an `async` function.

### Calling an async function

```squirrel
local task = load_file("/etc/hostname")  // returns a Task immediately
task.then(function(result) {
    print(result[0] + "\n")
})
```

…or from inside another async function:

```squirrel
async function main() {
    local result = await load_file("/etc/hostname")
    print(result[0] + "\n")
}
```

### Driving the main loop

Async only progresses when GLib's main loop is running. The shape of most async programs is:

```squirrel
local GLib = import("GLib")
local loop = GLib.MainLoop.new(null, false)

async function run() {
    // your async logic here
    loop.quit()
}

run().catch(function(e) {
    print("error: " + e + "\n")
    loop.quit()
})

loop.run()
```

We'll see this skeleton repeatedly.

## 9.4 Auto-async wrappers for GIO

Any GI method named `foo_async` paired with a `foo_finish` automatically gets exposed as a Task-returning method (`foo_async` will return a task). This means you can `await` GIO operations directly:

```squirrel
local Gio = import("Gio")
local f = Gio.File.new_for_path("/etc/hostname")
local result = await f.load_contents_async(null)
// result is [contents, etag]
```

Under the hood, this calls `sqgi.gio_async(initiator, finisher)` with the right pair. Cancellation works through a `Gio.Cancellable` the wrapper allocates for you.

If you ever need to wrap an async/finish pair manually:

```squirrel
local task = sqgi.gio_async(
    @(cancellable, cb) f.load_contents_async(cancellable, cb),
    @(res) f.load_contents_finish(res)
)
local result = await task
```

## 9.5 `sqgi.sleep`

```squirrel
async function tick(n) {
    for (local i = 0; i < n; i++) {
        print(i + "\n")
        await sqgi.sleep(500)  // pause 500 ms; resolves with elapsed ms
    }
}
```

`sqgi.sleep(ms)` returns a task that resolves with the elapsed milliseconds (close to `ms` but not exact, since the main loop scheduled it).

## 9.6 Combinators

### `sqgi.all` — wait for everything

```squirrel
local results = await sqgi.all([
    load_file("/etc/hostname"),
    load_file("/etc/os-release"),
    sqgi.sleep(100),
])
// results[0], results[1], results[2]
```

If any task rejects, `sqgi.all` rejects with that error.

### `sqgi.race` — first one wins

```squirrel
local winner = await sqgi.race([
    slow_network_request(),
    sqgi.sleep(2000),    // timeout
])
```

This is the canonical pattern for "do X, but give up after 2 seconds". Whichever task settles first determines the result.

## 9.7 Creating your own tasks

When no GIO call matches what you need, build a task manually:

```squirrel
function wait_for_button(button) {
    local task = sqgi.Task()
    local id
    id = button.connect("clicked", function(self) {
        button.disconnect(id)
        task.resolve(true)
    })
    return task
}

async function ask_user(button) {
    await wait_for_button(button)
    print("clicked!\n")
}
```

Notice the pattern:

1. Create a task.
2. Set up the trigger (signal connection, file watch, whatever).
3. In the callback, disconnect/cleanup, then `task.resolve(value)` or `task.reject(error)`.
4. Return the task to the caller, who awaits it.

## 9.8 Cancellation

Long-running operations should be cancellable. SQGI models cancellation as **a special kind of rejection** with a known shape.

### Cancelling

```squirrel
local task = load_file("/var/log/big.log")
task.cancel("user pressed escape")
```

`cancel(reason)` does two things:

1. Triggers the underlying `Gio.Cancellable`, if any (so the C side stops as soon as it can).
2. Rejects the task with `{ __cancelled = true, reason = "user pressed escape" }`.

### Handling cancellation

The pattern from chapter 6 applies:

```squirrel
async function attempt() {
    try {
        await long_op()
    } catch (e) {
        if (typeof(e) == "table" && ("__cancelled" in e) && e.__cancelled) {
            print("cancelled: " + e.reason + "\n")
            return null
        }
        throw e
    }
}
```

### Combining with `sqgi.race`

`race` plus `cancel` is a clean way to add timeouts:

```squirrel
async function with_timeout(task, ms) {
    local timer = sqgi.sleep(ms)
    local winner = await sqgi.race([task, timer])
    // If the timer won, the original task is still running. Cancel it.
    if (winner == ms || winner.tointeger() == ms) {
        task.cancel("timeout")
        throw "timeout"
    }
    return winner
}
```

Note: this leaks slightly because if `task` wins, the timer is still scheduled. In real code you'd cancel the loser explicitly.

## 9.9 A complete async demo

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

async function load_summary(paths) {
    local tasks = []
    foreach (p in paths) {
        tasks.append(load_one(p))
    }
    return await sqgi.all(tasks)
}

async function load_one(path) {
    local f = Gio.File.new_for_path(path)
    try {
        local r = await f.load_contents_async(null)
        return { path = path, ok = true, bytes = r[0].len() }
    } catch (e) {
        return { path = path, ok = false, error = e.tostring() }
    }
}

local loop = GLib.MainLoop.new(null, false)
load_summary(["/etc/hostname", "/etc/os-release", "/no/such/file"])
    .then(function(results) {
        foreach (r in results) print(r.path + " ok=" + r.ok + "\n")
        loop.quit()
    })
    .catch(function(e) {
        print("fatal: " + e + "\n")
        loop.quit()
    })

loop.run()
```

Key takeaways:

- `load_summary` and `load_one` are both `async`, so calling them yields tasks.
- Each `load_one` catches its own errors so a single failure doesn't kill `sqgi.all`.
- The main script wires up `then`/`catch` and runs the loop.

## 9.10 Common mistakes

| Mistake | Symptom | Fix |
|---|---|---|
| Using `await` outside an `async` function | Compile error | Make the enclosing function `async` |
| Forgetting to run the main loop | Script exits immediately | Add `loop.run()` |
| Swallowing rejection (`task.then(...)` with no `.catch`) | Silent failure | Always add `.catch(...)` at the top level |
| Re-using a resolved task | Always returns the same value | Tasks are one-shot; create a new one |
| Not cancelling the loser in a `race` | Resource leak | Track and cancel explicitly |

## 9.11 Exercises

1. Write `delay(ms, value)` that returns a task resolving with `value` after `ms`.
2. Build `with_timeout(task, ms)` that rejects with `"timeout"` if `task` doesn't settle in time.
3. Reimplement `sqgi.all` using only `sqgi.Task`, `then`, `catch` (for understanding).
4. Read `demo/gio/run.nut` and identify every Task in flight.

## 9.12 What's next

Chapter 10 zooms out to the runtime context: main loops, threading rules, and how events get scheduled in SQGI.
