# SQGI API Reference

This is a flat reference for every runtime function and helper SQGI exposes on top of vanilla Squirrel. For tutorial-style introductions, see the [language tutorial](../language/).

Conventions in this document:

- **Signature** shows argument names; defaults are shown after `=`.
- **Returns** describes the value placed on the stack on success.
- **Throws** lists exception conditions. Anything not listed propagates from inner calls.
- **Calling context**: most functions must run on the main thread that owns the VM. Cross-thread calls into Squirrel are not supported and will crash.
- "Task" means an awaitable object created by `sqgi.Task` or one of the wrappers; see [Tasks](#tasks).

## Contents

- [Top-level builtins](#top-level-builtins)
  - [`import`](#import)
- [Async runtime: `sqgi.*`](#async-runtime-sqgi)
  - [`sqgi.Task`](#sqgitask)
  - [Task methods](#task-methods)
  - [`sqgi.sleep`](#sqgisleep)
  - [`sqgi.timeout_add`](#sqgitimeout_add)
  - [`sqgi.source_remove`](#sqgisource_remove)
  - [`sqgi.all`](#sqgiall)
  - [`sqgi.race`](#sqgirace)
  - [`sqgi.gio_async`](#sqgigio_async)
  - [`sqgi.socket_add_watch`](#sqgisocket_add_watch)
  - [`sqgi.bytes_to_array`](#sqgibytes_to_array)
  - [`sqgi.bytes_from_array`](#sqgibytes_from_array)
- [GObject helpers: `sqgi.*`](#gobject-helpers-sqgi)
  - [`sqgi.new_object`](#sqginew_object)
  - [`sqgi.register_class`](#sqgiregister_class)
  - [`sqgi.chain_up`](#sqgichain_up)
  - [`sqgi.GError`](#sqgigerror)
- [JSON: `sqgi.json.*`](#json-sqgijson)
  - [`sqgi.json.parse`](#sqgijsonparse)
  - [`sqgi.json.stringify`](#sqgijsonstringify)
  - [`_tojson` metamethod](#_tojson-metamethod)
- [Language extensions](#language-extensions)
  - [`async` functions](#async-functions)
  - [`await` expression](#await-expression)
  - [Cancellation marker](#cancellation-marker)
- [Auto-async GIO wrappers](#auto-async-gio-wrappers)

---

## Top-level builtins

### `import`

```squirrel
import(name)
import(name, version)
import("path/to/script.nut")
```

Load a GObject Introspection namespace, or execute another Squirrel script.
Relative `.nut` paths are resolved next to the module doing the import first,
then through the current working directory / packaged app script root fallback.

**Arguments**

- `name` (string): GI namespace name (`"Gio"`, `"GLib"`, `"Gtk"`, ...) **or** a path ending in `.nut`.
- `version` (string, optional): GI typelib version (`"2.0"`, `"4.0"`). Ignored when `name` ends in `.nut`.

**Returns**

- For GI imports: a **namespace table** whose slots are the public symbols (functions, classes, enums, constants) of the library.
- For `.nut` imports: the value returned by the script (executed in the root table).

**Throws**

- `"import: expected a string argument"` if `name` is missing or not a string.
- GI errors if the typelib can't be loaded or the version doesn't match.

**Examples**

```squirrel
local Gio  = import("Gio")
local Gtk  = import("Gtk", "4.0")
local help = import("test/helper.nut")
```

---

## Async runtime: `sqgi.*`

### `sqgi.Task`

```squirrel
sqgi.Task()
```

Create a new pending Task. The Task is a Squirrel table tagged with `__sqgi_task` and carrying the methods listed below.

**Returns**

A new pending Task.

**Notes**

A Task transitions exactly once: from pending → resolved or pending → rejected. Subsequent `resolve` / `reject` calls are ignored. Use `then` / `catch` to attach handlers; they fire on the next main-loop tick after settlement.

### Task methods

Given `local t = sqgi.Task()`:

#### `t.resolve(value)`

Fulfill the task with `value`. Wakes all attached `then` handlers and any `await` waiters. No-op if already settled.

#### `t.reject(error)`

Reject the task with `error`. Wakes all attached `catch` handlers. If no `catch` handler ever runs, an "unhandled rejection" is logged on the next tick. No-op if already settled.

#### `t.then(on_fulfilled)`

Register a continuation that runs when the task resolves. Returns a **derived Task** that resolves with whatever `on_fulfilled(value)` returns (or rejects if it throws). Rejection propagates through `then` to the derived task.

#### `t.catch(on_rejected)`

Register a rejection handler. Returns a derived Task. If `on_rejected(error)` returns normally, the derived task **resolves** with that value (turning a rejection into a success). If it re-throws, the derived task rejects.

#### `t.cancel(reason = null)`

Request cancellation. Two effects:

1. If the task was created via `sqgi.gio_async` (directly or via the auto-async wrapper), the underlying `Gio.Cancellable` is cancelled, so C-side work stops as soon as it checks the cancellable.
2. The task is rejected with `{ __cancelled = true, reason = reason }`.

Idempotent: cancelling an already-settled task is a no-op.

### `sqgi.sleep`

```squirrel
sqgi.sleep(ms)
```

Schedule a Task that resolves after `ms` milliseconds.

**Arguments**

- `ms` (integer): delay in milliseconds.

**Returns**

A Task that resolves with the actual elapsed milliseconds (an integer; close to `ms`, but limited by main-loop scheduling).

**Throws**

- `"sleep: expected integer ms"` if `ms` is not an integer.

**Notes**

Requires a running main loop. Cancellable: `task.cancel()` removes the underlying GLib timeout.

### `sqgi.timeout_add`

```squirrel
sqgi.timeout_add(ms, fn)
```

Schedule a GLib timeout. Lower-level than `sqgi.sleep`; does not return a Task.

**Arguments**

- `ms` (integer): interval in milliseconds.
- `fn` (function): called with no arguments each tick. Return `true` to keep firing, `false` to stop.

**Returns**

An integer source id, suitable for `sqgi.source_remove`.

**Throws**

- `"timeout_add: expected integer ms"`
- `"timeout_add: expected function"`

### `sqgi.source_remove`

```squirrel
sqgi.source_remove(id)
```

Remove a GLib source previously added by `sqgi.timeout_add` (or any GIO call that returned a source id).

**Arguments**

- `id` (integer): the source id.

**Returns**

`true` if the source was removed, `false` if it was not found.

### `sqgi.all`

```squirrel
sqgi.all(tasks)
```

Wait for an array of Tasks (or plain values). Resolves when every Task has resolved; rejects on the first rejection.

**Arguments**

- `tasks` (array): each element is a Task or a plain value (passed through unchanged).

**Returns**

A Task that resolves with an array of results, in input order.

**Notes**

If any element is rejected, the aggregate Task rejects with that error; other Tasks keep running but their results are discarded. To isolate per-item failures, have each Task catch its own errors and return a result record (see [end-to-end patterns and recipes](../language/11-end-to-end-patterns-and-recipes.md)).

### `sqgi.race`

```squirrel
sqgi.race(tasks)
```

Settle as soon as any input Task settles.

**Arguments**

- `tasks` (array): Tasks or plain values.

**Returns**

A Task that resolves or rejects with the first settled input.

**Notes**

The losing Tasks are **not** cancelled automatically. If you need that, cancel them explicitly. Plain (non-Task) values in `tasks` cause immediate resolution with the first such value.

### `sqgi.gio_async`

```squirrel
sqgi.gio_async(initiator, finisher)
```

Wrap a GIO `_async` / `_finish` pair as an awaitable Task. Most users should rely on the [auto-async wrappers](#auto-async-gio-wrappers) instead; use this directly for custom pairings.

**Arguments**

- `initiator(cancellable, ready_cb)` (function): calls the `_async` method with the supplied cancellable and ready callback.
- `finisher(async_result)` (function): calls the `_finish` method and returns the value (or array of values).

**Returns**

A Task whose resolved value is whatever `finisher` returned. Cancellable via `task.cancel(reason)`: a fresh `Gio.Cancellable` is allocated and bound to the Task.

**Example**

```squirrel
local Gio = import("Gio")
local f = Gio.File.new_for_path("/etc/hostname")
local task = sqgi.gio_async(
    @(c, cb) f.load_contents_async(c, cb),
    @(res)   f.load_contents_finish(res)
)
local result = await task
```

### `sqgi.socket_add_watch`

```squirrel
sqgi.socket_add_watch(socket, condition, fn, cancellable = null)
```

Attach a callback to a `Gio.Socket` condition (readable, writable, hangup).

**Arguments**

- `socket` (`Gio.Socket`): the socket to watch.
- `condition` (`Gio.IOCondition` flags): conditions to watch for.
- `fn(socket, condition)` (function): invoked when conditions are met. Return `true` to keep watching, `false` to remove.
- `cancellable` (`Gio.Cancellable`, optional): if cancelled, the watch is removed.

**Returns**

The created `GSource`. Use its `destroy()` to remove the watch (or rely on the cancellable).

### `sqgi.bytes_to_array`

```squirrel
sqgi.bytes_to_array(value)
```

Convert a Squirrel byte-string into an array of integers in `[0, 255]`. If `value` is already an array, it is returned as-is.

**Arguments**

- `value` (string or array).

**Returns**

An array of integers.

**Throws**

- `"bytes_to_array: missing argument"`
- `"bytes_to_array: expected string"` if `value` is not a string or array.

**Notes**

SQGI represents `GBytes` payloads as 8-bit-clean Squirrel strings for performance. Use this helper when you need numeric per-byte access.

### `sqgi.bytes_from_array`

```squirrel
sqgi.bytes_from_array(value)
```

Convert an array of integers (each in `[0, 255]`) into an 8-bit-clean Squirrel string. If `value` is already a string, it is returned as-is. Values outside `[0, 255]` are truncated to their low 8 bits.

**Throws**

- `"bytes_from_array: missing argument"`
- `"bytes_from_array: expected array"`
- `"bytes_from_array: non-integer element"`

---

## GObject helpers: `sqgi.*`

### `sqgi.new_object`

```squirrel
sqgi.new_object(klass, properties)
```

Construct a GObject instance with initial properties. Equivalent to `g_object_new_with_properties` in C.

**Arguments**

- `klass`: a GI-exposed class (e.g. `Gio.Application`) or a class returned by `sqgi.register_class`.
- `properties` (table): `"property-name" = value` pairs. Property names use hyphens, not underscores. Values are marshalled to `GValue` automatically.

**Returns**

A Squirrel instance wrapping the new GObject.

**Throws**

- `"new_object: expected class as first argument"`
- `"new_object: expected table as second argument"`
- `"new_object: class has no __gtype slot (not a GObject class?)"`
- `"new_object: unknown GType"`
- `"new_object: GType is not a GObject subtype"`
- `"new_object: unknown property"`
- `"new_object: failed to marshal property value"`
- `"new_object: g_object_new_with_properties returned NULL"`

### `sqgi.register_class`

```squirrel
sqgi.register_class({
    name      = "SqgiMyType",
    parent    = SomeGObjectClass,
    overrides = { vfunc_name = function(self, ...) { ... }, ... },
})
```

Register a new GObject subtype implemented in Squirrel.

**Arguments (table fields)**

- `name` (string): GType name. Must be unique within the process.
- `parent` (class): a GI-exposed GObject class to inherit from.
- `overrides` (table, optional): map of vfunc names to Squirrel functions. Each function receives `self` (the instance) followed by the vfunc's declared arguments.

**Returns**

A Squirrel class object that can be passed to `sqgi.new_object`.

**Threading**

vfunc overrides may only be invoked from the main thread (the thread owning the VM). vfuncs invoked from worker threads will crash.

**Example**

```squirrel
local Gio = import("Gio")
local MyApp = sqgi.register_class({
    name = "SqgiMyApp",
    parent = Gio.Application,
    overrides = {
        activate = function(self) { print("activated\n") },
        startup  = function(self) { sqgi.chain_up(); print("started\n") },
    },
})
local app = sqgi.new_object(MyApp, { "application-id" = "org.example.MyApp" })
app.run(vargv)
```

### `sqgi.chain_up`

```squirrel
sqgi.chain_up()
```

Inside a vfunc override, call the parent class's implementation of the same vfunc with the **same arguments** the override received. Has no return value (the parent's return is discarded by current bindings).

**Throws**

- `"chain_up: not inside a vfunc override"` if called from anywhere else.

**Notes**

Chain up when extending parent behavior (logging, additional setup) rather than replacing it. Forgetting to chain up in `startup`, `activate`, or `dispose` causes subtle initialization bugs.

### `sqgi.GError`

```squirrel
sqgi.GError(domain, code, message)
```

Construct a Squirrel instance representing a `GError`. SQGI also throws this class for failures in GIO/GLib calls.

**Fields**

- `domain` (string): error domain quark name, e.g. `"g-file-error"`.
- `code` (integer): error code within the domain.
- `message` (string): human-readable description.

**Metamethods**

- `_tostring`: returns `"<domain>:<code>: <message>"`.

**Usage**

```squirrel
try {
    f.load_contents(null)
} catch (e) {
    if (e instanceof sqgi.GError) {
        print(e.domain + " " + e.code + " " + e.message + "\n")
    }
}
```

---

## JSON: `sqgi.json.*`

### `sqgi.json.parse`

```squirrel
sqgi.json.parse(text)
```

Parse a JSON document into Squirrel values.

**Arguments**

- `text` (string): JSON-encoded data.

**Returns**

The decoded value:

| JSON | Squirrel |
|---|---|
| `null` | `null` |
| `true` / `false` | `true` / `false` |
| Number (integer literal, no `.` or `e`) | integer |
| Number (with `.` or exponent) | float |
| String | string |
| Array | array |
| Object | table |

**Throws**

- `"json.parse: expected a string"`
- `"json.parse: <reason> at line N, col M"` on syntax error.
- `"json.parse: trailing garbage at line N, col M"` if extra non-whitespace characters follow the value.
- `"json.parse: nesting too deep (cycle?)"` past 128 levels of nesting.

**Notes**

The parser is strict (no comments, trailing commas, or single-quoted strings). Surrogate pairs in `\uXXXX` escapes are decoded to UTF-8.

### `sqgi.json.stringify`

```squirrel
sqgi.json.stringify(value)
```

Serialize a Squirrel value to JSON.

**Arguments**

- `value`: any of `null`, bool, integer, float, string, array, table, or class instance with a `_tojson` metamethod.

**Returns**

A JSON-encoded string.

**Throws**

- `"json.stringify: missing value"`
- `"json.stringify: table key must be a string"` (tables with non-string keys cannot be represented in JSON).
- `"json.stringify: <type> is not representable in JSON"` for closures, threads, userdata, etc.
- `"json.stringify: nesting too deep (cycle?)"` past 128 levels.
- `"json.stringify: instance has no _tojson metamethod"`
- `"json.stringify: _tojson threw"` if a user-defined metamethod raises.

**Notes**

Floats use a locale-safe `g`-style format. `NaN` and `±Inf` are not representable in JSON; serializing them throws.

### `_tojson` metamethod

To make a class serializable, implement `_tojson()` returning a JSON-encodable value (typically a plain table):

```squirrel
class User {
    name = null
    age = 0

    constructor(name, age) {
        this.name = name
        this.age = age
    }

    function _tojson() {
        return { name = this.name, age = this.age }
    }
}

print(sqgi.json.stringify(User("ada", 30)) + "\n")
// {"name":"ada","age":30}
```

`_tojson` may itself return another instance; the encoder recurses until it reaches a serializable value or hits the depth limit.

---

## Language extensions

SQGI adds two compiler keywords to Squirrel.

### `async` functions

```squirrel
async function name(args) { ... }
async function(args) { ... }   // anonymous
```

Marks a function as asynchronous. Calling it:

1. Allocates a new VM thread for the function body.
2. Returns a Task that settles when the body returns (resolved) or throws (rejected).
3. Begins executing the body until it hits the first `await` or returns.

The returned Task can be `await`ed, chained with `then`/`catch`, or cancelled.

### `await` expression

```squirrel
await expression
```

Only valid inside an `async` function. Evaluates `expression`:

- If it is a Task, suspend the async function until the Task settles. The expression evaluates to the resolved value, or **throws** the rejection.
- If it is not a Task, evaluate to that value (no suspension).

`await` releases the VM until the awaited Task settles, allowing the main loop to dispatch other work.

### Cancellation marker

When a Task is cancelled via `task.cancel(reason)`, the rejection value is:

```squirrel
{ __cancelled = true, reason = <reason> }
```

The recommended catch idiom:

```squirrel
try {
    await long_running()
} catch (e) {
    if (typeof(e) == "table" && ("__cancelled" in e) && e.__cancelled) {
        // cancellation: clean up, possibly rethrow
        return null
    }
    throw e
}
```

---

## Auto-async GIO wrappers

For any GI-exposed class that has both `foo_async(args..., cancellable, callback)` and `foo_finish(async_result)` methods, SQGI automatically adds a `foo_async(args...)` method that returns a Task.

This means GIO calls can be awaited directly without writing `sqgi.gio_async` by hand:

```squirrel
local f = Gio.File.new_for_path("/etc/hostname")
local result = await f.load_contents_async(null)
// result is [contents, etag]
```

Under the hood the wrapper:

1. Allocates a `Gio.Cancellable` and binds it to the Task (so `task.cancel()` propagates).
2. Calls `foo_async(args..., cancellable, ready_cb)`.
3. In `ready_cb`, calls `foo_finish` and resolves/rejects the Task.

The original C-level method is still accessible as `foo_async_raw` if you need to pass an explicit cancellable.

---

## See also

- [Language tutorial](../language/) — narrative tutorial.
- `demo/` — runnable examples per GI namespace.
- `test/` — exhaustive behavior tests.
- Source of truth: `src/sqgi_async.c`, `src/sqgi_gi_object.c`, `src/sqgi_subclass.c`, `src/sqgi_gerror.c`, `src/sqgi_json.c`, `src/sqgi_import.c`.
