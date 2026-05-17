# Chapter 3 - Strings, Arrays, and Tables

Real programs work on *collections* of values, not single values. This chapter teaches the three workhorses: strings as sequences of characters, arrays as ordered lists, and tables as named key/value stores.

If you remember only one thing: **arrays are for ordered data, tables are for named data**.

## 3.1 Strings revisited

Strings were introduced in chapter 2. Here is the complete list of built-in methods Squirrel provides on every string:

| Method | What it returns | Example |
|---|---|---|
| `len()` | Length in bytes | `"hello".len()` → `5` |
| `tointeger()` | String parsed as integer | `"42".tointeger()` → `42` |
| `tofloat()` | String parsed as float | `"3.14".tofloat()` → `3.14` |
| `tostring()` | The string itself | `"x".tostring()` → `"x"` |
| `slice(start, end)` | Substring from `start` up to `end` (exclusive) | `"hello".slice(1, 4)` → `"ell"` |
| `slice(start)` | Substring from `start` to end | `"hello".slice(2)` → `"llo"` |
| `find(sub)` | Index of first occurrence, or `null` | `"hello".find("ll")` → `2` |
| `find(sub, from)` | As above, starting at `from` | `"hello".find("l", 3)` → `3` |
| `tolower()` | Lowercase copy | `"HELLO".tolower()` → `"hello"` |
| `toupper()` | Uppercase copy | `"hello".toupper()` → `"HELLO"` |

**That's the complete list of core string methods.** Squirrel does not have `strip()`, `split()`, `replace()`, or `startswith()` built in. You build those out of `find` and `slice`, or you call into native libraries via GI when you need heavier string processing.

### Building common operations

**Starts-with**:

```squirrel
function starts_with(s, prefix) {
    return s.find(prefix) == 0
}
```

**Ends-with**:

```squirrel
function ends_with(s, suffix) {
    if (s.len() < suffix.len()) return false
    return s.slice(s.len() - suffix.len()) == suffix
}
```

**Split on a single character**:

```squirrel
function split_char(s, ch) {
    local out = []
    local start = 0
    for (local i = 0; i < s.len(); i++) {
        if (s.slice(i, i + 1) == ch) {
            out.append(s.slice(start, i))
            start = i + 1
        }
    }
    out.append(s.slice(start))
    return out
}

local parts = split_char("a,b,c", ",")  // ["a", "b", "c"]
```

You'll see these helper functions used throughout demos.

## 3.2 Arrays

An **array** is an ordered list of values, indexed from `0`.

```squirrel
local xs = [10, 20, 30]
print(xs[0] + "\n")    // 10
print(xs[2] + "\n")    // 30
print(xs.len() + "\n") // 3
```

Arrays can hold mixed types if you want, although homogeneous arrays are usually clearer:

```squirrel
local mixed = ["a", 1, true, null]
```

### Array methods

| Method | Effect |
|---|---|
| `len()` | Number of elements |
| `append(x)` / `push(x)` | Add `x` to end |
| `pop()` | Remove and return last element |
| `top()` | Return last element without removing |
| `insert(i, x)` | Insert `x` at index `i` |
| `remove(i)` | Remove element at index `i` |
| `resize(n)` | Grow or shrink to `n` slots |
| `reverse()` | Reverse in place |
| `sort()` | Sort in place |
| `sort(cmp)` | Sort with comparator `cmp(a, b)` returning -1, 0, or 1 |
| `slice(start, end)` | Sub-array |
| `extend(other)` | Append all elements of another array |
| `map(fn)` | New array of `fn(element)` for each |
| `apply(fn)` | Like `map` but in place |
| `reduce(fn)` | Fold to single value |
| `filter(fn)` | New array of elements where `fn(i, v)` is true |
| `find(value)` | Index of `value`, or `null` |
| `clear()` | Remove everything |

### Iteration patterns

Loop by value:

```squirrel
foreach (v in xs) {
    print(v + "\n")
}
```

Loop with index:

```squirrel
foreach (i, v in xs) {
    print(format("%d -> %s\n", i, v.tostring()))
}
```

Classic indexed loop:

```squirrel
for (local i = 0; i < xs.len(); i++) {
    print(xs[i] + "\n")
}
```

Prefer `foreach` unless you specifically need the index or want to walk in reverse.

### Functional style

`map`, `filter`, `reduce` let you write transformations without explicit loops:

```squirrel
local doubled = [1, 2, 3].map(function(i, v) { return v * 2 })
// doubled == [2, 4, 6]

local big = [1, 9, 4, 7].filter(function(i, v) { return v > 5 })
// big == [9, 7]

local sum = [1, 2, 3, 4].reduce(function(acc, v) { return acc + v }, 0)
// sum == 10
```

`map` and `filter` pass `(index, value)` to your callback. `reduce` passes `(accumulator, value)`.

## 3.3 Tables

A **table** is a collection of named slots, like a JSON object or a Python dictionary. Each slot has a string (or other) key and any value.

```squirrel
local user = {
    name = "ada",
    age = 30,
    active = true,
}
```

Access slot values with `.` (when the key is a fixed identifier):

```squirrel
print(user.name + "\n")
print(user.age + "\n")
```

Or with `[ ... ]` (for dynamic keys):

```squirrel
local field = "name"
print(user[field] + "\n")
```

### Reading vs. writing existing slots vs. adding new slots

This is the most common confusion for newcomers.

```squirrel
local t = { a = 1 }

t.a = 2          // OK: 'a' already exists, this updates it
t.b = 3          // ERROR: 'b' does not exist yet

t.b <- 3         // OK: '<-' creates the new slot
t["c"] <- 4      // OK with bracket syntax too
```

**Rule**: use `=` to update an existing slot, and `<-` to create a new one.

If you only use `=` and forget `<-`, you'll get an error like `the index 'b' does not exist`. Switch to `<-` for the assignment that creates the slot, and you're done.

### Table methods

| Method | Effect |
|---|---|
| `len()` | Number of slots |
| `keys()` | Array of keys |
| `values()` | Array of values |
| `rawget(k)` | Get without invoking delegates |
| `rawset(k, v)` | Set without invoking delegates |
| `rawdelete(k)` | Remove a slot |
| `filter(fn)` | New table of slots where `fn` is true |
| `map(fn)` | New table with values transformed |

### Membership test

Use `in` to check whether a key exists:

```squirrel
if ("name" in user) {
    print("we have a name: " + user.name + "\n")
}
```

### Iteration

`foreach (k, v in tbl) { ... }` walks key-value pairs. Iteration order is not guaranteed.

```squirrel
foreach (k, v in user) {
    print(k + " = " + v + "\n")
}
```

## 3.4 Arrays vs. tables: a decision guide

| Need | Use |
|---|---|
| Ordered sequence of items | Array |
| Named fields on a single record | Table |
| Quick lookup by string key | Table |
| Index-based processing | Array |
| "Set of strings" (no values) | Table with `key <- true` |
| Configuration data | Table |
| Function arguments grouped | Table |

When in doubt, sketch what your data looks like in plain text. If you say "the third item", you want an array. If you say "the user's email", you want a table.

## 3.5 Worked example: argument parsing

A typical CLI tool parses both flags and positional args. Here's a small idiomatic parser:

```squirrel
local opts = {
    verbose = false,
    retries = 3,
    url     = null,
}
local positional = []

foreach (a in vargv) {
    if (a == "--verbose" || a == "-v") {
        opts.verbose = true
    } else if (a.find("--retries=") == 0) {
        opts.retries = a.slice(10).tointeger()
    } else if (a.find("--url=") == 0) {
        opts.url = a.slice(6)
    } else if (a.find("--") == 0) {
        print("unknown flag: " + a + "\n")
        return
    } else {
        positional.append(a)
    }
}

print("verbose=" + opts.verbose + "\n")
print("retries=" + opts.retries + "\n")
print("url=" + opts.url + "\n")
print("positional=" + positional.len() + " args\n")
```

Notice:

- We initialize `opts` with default values, so the rest of the program doesn't need to check for missing keys.
- We use `a.find("--url=") == 0` to detect a prefix, since `startswith` doesn't exist.
- Positional args are collected separately.

## 3.6 Worked example: grouping by category

Counting words by their first letter:

```squirrel
function group_by_first(words) {
    local groups = {}
    foreach (w in words) {
        local letter = w.slice(0, 1)
        if (!(letter in groups)) groups[letter] <- []
        groups[letter].append(w)
    }
    return groups
}

local result = group_by_first(["apple", "ant", "banana", "cat", "carrot"])
foreach (k, v in result) {
    print(k + ": " + v.len() + " words\n")
}
```

Expected output (order may vary):

```
a: 2 words
b: 1 words
c: 2 words
```

## 3.7 Exercises

1. Build a word-frequency table from an array of strings.
2. Implement `chunk(arr, n)` that splits an array into sub-arrays of size `n` each.
3. Parse `--key=value` style args into a single table.
4. Reverse an array without using `reverse()`.

## 3.8 What's next

Now that you can store data, chapter 4 teaches you how to control the flow of execution: conditions, loops, and reusable functions.
