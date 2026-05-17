# Chapter 6 - Error Handling and Debugging

Programs that ignore errors crash in confusing ways. This chapter shows the building blocks SQGI gives you to detect problems, react to them, and report them clearly.

## 6.1 The exception model in one paragraph

In Squirrel, when something goes wrong you **throw** a value. That value travels up the call stack until a `try { } catch (e) { }` block catches it. If nothing catches it, the script terminates with an uncaught-exception message. Any value can be thrown — strings, tables, instances of classes — though it's good practice to throw something descriptive.

## 6.2 `try` / `catch`

```squirrel
try {
    risky_operation()
    print("ok\n")
} catch (e) {
    print("failed: " + e + "\n")
}
```

If `risky_operation()` throws, the `print("ok")` is skipped and control jumps to the `catch` block. `e` is bound to whatever was thrown.

Squirrel does **not** have a `finally` clause. If you need cleanup that runs whether or not an error occurred, rethrow at the end of the catch:

```squirrel
local resource = acquire()
try {
    use(resource)
} catch (e) {
    release(resource)
    throw e        // re-raise
}
release(resource)  // happy-path cleanup
```

(Or factor the cleanup into a helper function.)

## 6.3 `throw`

You can throw any value:

```squirrel
if (n < 0) throw "n must be non-negative"
if (n > 100) throw { code = "out_of_range", value = n }
```

A common idiom is to throw a table so the catcher can inspect structured fields. Even more common is to throw an instance of a class — your own, or `sqgi.GError`.

## 6.4 `sqgi.GError`

GLib and GIO operations report failures via `GError`, a structure with three fields:

| Field | Meaning |
|---|---|
| `domain` | A string identifying the error category (`g-file-error`, `g-io-error-quark`, ...) |
| `code` | An integer code within that domain |
| `message` | A human-readable string |

When a GI call fails, SQGI throws a `sqgi.GError` instance with those fields populated. You can also construct your own when implementing functions that mimic the GIO style.

```squirrel
local Gio = import("Gio")
try {
    local f = Gio.File.new_for_path("/no/such/file")
    f.load_contents(null)
} catch (e) {
    if (e instanceof sqgi.GError) {
        print("domain=" + e.domain + "\n")
        print("code=" + e.code + "\n")
        print("message=" + e.message + "\n")
    } else {
        throw e
    }
}
```

When you `print` a `sqgi.GError`, it formats itself as `domain:code: message` thanks to its `_tostring` metamethod.

### Constructing one

```squirrel
throw sqgi.GError("myapp", 42, "something specific went wrong")
```

## 6.5 Cancellation: a special kind of error

Async tasks (chapter 9) can be **cancelled**. Cancellation propagates as a thrown value with a distinctive shape:

```squirrel
{ __cancelled = true, reason = <whatever you passed to cancel()> }
```

Catch it explicitly to distinguish "user cancelled me" from "something blew up":

```squirrel
try {
    await long_running()
} catch (e) {
    if (typeof(e) == "table" && ("__cancelled" in e) && e.__cancelled) {
        print("operation cancelled, reason=" + e.reason + "\n")
    } else {
        throw e   // unexpected error; let it propagate
    }
}
```

The pattern "catch, identify, rethrow if not yours" is fundamental to robust async code.

## 6.6 Letting errors propagate

Sometimes you should **not** catch. If a function can't do its job, throwing is the right answer; callers higher up have more context to decide what to do.

```squirrel
function load_config(path) {
    local Gio = import("Gio")
    local f = Gio.File.new_for_path(path)
    return f.load_contents(null)   // let GError propagate
}
```

Catching errors too eagerly (`catch (e) { /* nothing */ }`) is one of the most common bugs in scripted programs. Don't swallow errors silently.

## 6.7 Assertions

For "this should never happen" checks during development, throw a string with context:

```squirrel
function pop(stack) {
    if (stack.len() == 0) throw "pop on empty stack"
    return stack.pop()
}
```

If you find yourself writing the same check repeatedly, factor a helper:

```squirrel
function require(cond, msg) {
    if (!cond) throw msg
}
```

## 6.8 Debugging tips

### Print everything

The unsophisticated tool is the right tool. Add `print` statements liberally. Convert structured values with `format`:

```squirrel
print(format("user=%s balance=%d at line=%d\n", u.name, u.balance, __LINE__))
```

(`__LINE__` and `__FILE__` are baked-in identifiers Squirrel sets for you.)

### Stack traces

When an uncaught exception terminates the script, SQGI prints a stack trace showing the call chain and line numbers. That trace is usually enough to pinpoint the bug.

If you want a stack trace at a specific point without dying, throw and immediately catch:

```squirrel
try { throw "debug" } catch (e) { /* trace printed to stderr automatically? - or use sqgi.print_stack() if available */ }
```

(Behavior here depends on your build; the most reliable approach is to log identifying values as you go.)

### Build with ASan when chasing native crashes

The repo has `build-asan/` configured for AddressSanitizer:

```bash
./build-asan/sqgi script.nut
```

If you suspect a native-side bug, this build will catch use-after-free and similar issues with a detailed report.

### Run tests

`test/run_tests.sh` exercises every public surface. If you break something, the regression usually shows up there. Adding a focused `test_my_feature.nut` is the cheapest way to investigate.

## 6.9 A robust pattern: classify, log, decide

```squirrel
function safely(label, fn) {
    try {
        return fn()
    } catch (e) {
        if (typeof(e) == "table" && ("__cancelled" in e) && e.__cancelled) {
            print("[" + label + "] cancelled\n")
            throw e   // propagate cancellation
        } else if (e instanceof sqgi.GError) {
            print("[" + label + "] GError " + e + "\n")
            return null
        } else {
            print("[" + label + "] unexpected: " + e + "\n")
            throw e
        }
    }
}

local data = safely("load", function() {
    return load_config("/etc/myapp.conf")
})
```

This wrapper:

- Re-throws cancellation so the caller's task machinery still works.
- Logs and downgrades GErrors to `null`.
- Re-throws genuinely unexpected exceptions so they can't hide.

## 6.10 Exercises

1. Wrap `Gio.File.new_for_path(...).load_contents(null)` in a function that returns `null` on missing-file errors and rethrows everything else.
2. Write `assert_eq(a, b)` that throws a descriptive message on mismatch.
3. Add a `safely` wrapper that converts thrown strings into `sqgi.GError` instances.
4. Read `test/test_subclass_errors.nut` and explain what each `try` is protecting.

## 6.11 What's next

You've now seen the core language. Chapter 7 starts using SQGI as an introspection runtime: importing GObject namespaces, calling methods, and reading enums.
