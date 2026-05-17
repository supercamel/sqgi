# Chapter 4 - Control Flow, Functions, and Closures

So far every example has been a straight line of statements. Real programs need to **make decisions**, **repeat work**, and **package logic for reuse**. That's what this chapter covers.

## 4.1 Conditionals: `if` / `else if` / `else`

```squirrel
if (score >= 90) {
    print("A\n")
} else if (score >= 80) {
    print("B\n")
} else if (score >= 70) {
    print("C\n")
} else {
    print("below C\n")
}
```

Rules:

1. The condition in parentheses must evaluate to a boolean (or a value that converts to boolean — see chapter 2 on truthiness).
2. Braces `{ ... }` are optional for single statements but **always include them**. They prevent a whole category of "I added a line and it broke" bugs.
3. `else if` is just `else` followed by another `if`; it's a chain, not a special construct.

### Conditional expression

For simple either/or values, the ternary operator is concise:

```squirrel
local label = (score >= 60) ? "pass" : "fail"
```

Read it: "is `score >= 60`? if yes, `pass`, otherwise `fail`."

## 4.2 Loops

### While loop

Repeat as long as the condition holds.

```squirrel
local i = 0
while (i < 3) {
    print(i + "\n")
    i++
}
// prints 0, 1, 2
```

### Do-while loop

Like `while`, but the body always runs at least once.

```squirrel
local n
do {
    n = read_input_somehow()
} while (n == null)
```

### For loop

Combines initialization, condition, and step:

```squirrel
for (local i = 0; i < 5; i++) {
    print(i + "\n")
}
```

Read it as "starting with `i = 0`, while `i < 5`, increment `i` each iteration". This is the right shape when you need an index.

### Foreach loop

Walks through a collection without exposing the index machinery:

```squirrel
foreach (v in [10, 20, 30]) {
    print(v + "\n")
}

foreach (i, v in [10, 20, 30]) {
    print(i + "=" + v + "\n")
}
```

Use `foreach` whenever possible — it's clearer and avoids off-by-one errors.

### Breaking and continuing

`break` exits the innermost loop immediately:

```squirrel
foreach (v in xs) {
    if (v < 0) break
    print(v + "\n")
}
```

`continue` skips to the next iteration:

```squirrel
foreach (v in xs) {
    if (v % 2 != 0) continue
    print(v + "\n")  // even values only
}
```

### Switch statement

Useful when you're branching on one value with many cases:

```squirrel
switch (level) {
    case "error":
        print("RED\n")
        break
    case "warn":
        print("YELLOW\n")
        break
    case "info":
        print("GREEN\n")
        break
    default:
        print("?\n")
}
```

Remember the `break` at the end of each `case`; without it, execution falls through to the next case (same behavior as C).

## 4.3 Functions

A function is a reusable chunk of code with a name, optional parameters, and an optional return value.

```squirrel
function add(a, b) {
    return a + b
}

local sum = add(2, 3)
print(sum + "\n")  // 5
```

Rules:

1. Parameters are local to the function body.
2. `return value` exits the function and produces `value` as the call result.
3. A function without an explicit `return` returns `null`.

### Default parameter values

Provide a default after `=` in the parameter list:

```squirrel
function greet(name, greeting = "hello") {
    print(greeting + " " + name + "\n")
}

greet("ada")             // hello ada
greet("ada", "hi")       // hi ada
```

Defaults must come after all non-default parameters.

### Returning multiple values

Squirrel returns one value. To return several, bundle them in an array or table:

```squirrel
function divmod(a, b) {
    return { quotient = a / b, remainder = a % b }
}

local r = divmod(17, 5)
print(r.quotient + " r " + r.remainder + "\n")  // 3 r 2
```

### Anonymous functions

You can define a function value inline:

```squirrel
local square = function(x) { return x * x }
print(square(4) + "\n")  // 16
```

These are the same as named functions, just stored in a variable.

### Arrow-style short closures

For one-expression closures, `@(args) expr` is a shorthand:

```squirrel
local inc = @(x) x + 1
print(inc(10) + "\n")  // 11
```

This is the same as `function(x) { return x + 1 }`, just shorter. You'll see it constantly in callback-heavy code.

## 4.4 Variadic functions (`vargv`)

Inside a function, the special identifier `vargv` is an array of *extra* arguments beyond the declared parameters. You also see it at the top level of a script, where it's the command-line args.

```squirrel
function log(level) {
    local msg = ""
    foreach (a in vargv) msg += " " + a.tostring()
    print("[" + level + "]" + msg + "\n")
}

log("info", "starting", "process", 42)
// → [info] starting process 42
```

## 4.5 Scope and lexical capture (closures)

Variables declared with `local` are visible from their declaration to the end of the enclosing `{ ... }`. When a function is *defined inside another function*, the inner function "captures" the outer locals it references. This is called a **closure**.

```squirrel
function make_counter(start) {
    local n = start
    return function() {
        n++
        return n
    }
}

local next_id = make_counter(100)
print(next_id() + "\n")  // 101
print(next_id() + "\n")  // 102
print(next_id() + "\n")  // 103
```

What happened:

1. `make_counter(100)` started with `n = 100`.
2. It returned a function. That function still holds a reference to `n`.
3. Every time we call the returned function, it sees the same `n` and updates it.

Closures are the foundation of callback-heavy code: every time you write a signal handler, a timer callback, or an async completion, you are creating a closure over the locals that were in scope at the time.

## 4.6 First-class functions

Functions are values, just like numbers and strings. You can:

1. Store them in variables (done).
2. Pass them as arguments.
3. Return them from other functions (done above).
4. Store them in tables and arrays.

Passing as argument:

```squirrel
function apply_twice(fn, x) {
    return fn(fn(x))
}

print(apply_twice(@(n) n + 1, 5) + "\n")  // 7
```

This is the model SQGI uses for callbacks everywhere.

## 4.7 Worked example: retry with backoff

```squirrel
function retry(attempts, fn) {
    for (local i = 0; i < attempts; i++) {
        try {
            return fn()
        } catch (e) {
            print("attempt " + (i + 1) + " failed: " + e + "\n")
        }
    }
    throw "gave up after " + attempts + " attempts"
}

local result = retry(3, function() {
    // some flaky operation
    throw "timeout"
})
```

`try`/`catch` is covered formally in chapter 6, but you can guess what it does: try the body, and if it throws, jump to the catch with the error.

## 4.8 Worked example: closure-based rate limiter

```squirrel
function make_limiter(min_interval_ms) {
    local last_call_ms = 0
    return function() {
        local GLib = import("GLib")
        local now_ms = GLib.get_monotonic_time() / 1000
        if (now_ms - last_call_ms < min_interval_ms) return false
        last_call_ms = now_ms
        return true
    }
}

local can_call = make_limiter(500)
// Only allows a true return every 500 ms.
```

Note how `last_call_ms` is *private* to each limiter you create. That's a closure giving you encapsulation without classes.

## 4.9 Exercises

1. Write `clamp(x, lo, hi)` that returns `x` clamped to `[lo, hi]`.
2. Write `times(n, fn)` that calls `fn(i)` for each `i` in `0..n-1`.
3. Write `compose(f, g)` so that `compose(f, g)(x)` is `f(g(x))`.
4. Convert your chapter 3 arg parser into a function that returns `{ opts, positional }`.

## 4.10 What's next

You can now structure logic. Chapter 5 introduces classes — a way to bundle related state and behavior together, which is also how SQGI talks to GObject types.
