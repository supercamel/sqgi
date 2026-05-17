# Chapter 2 - Values, Types, and Operators

This chapter is about the smallest building blocks of any Squirrel program: individual values, the operators that combine them, and the variables that hold them.

If you've never programmed before, read top to bottom and type each example into a `.nut` file as you go. If you've programmed before, skim the tables; the surprises are noted with **Note**.

## 2.1 What is a value?

A **value** is a single piece of data. `42` is a value. `"hello"` is a value. `true` is a value. Every expression in Squirrel produces a value.

Every value has a **type**. The type tells the runtime how to interpret the bytes and what operations are allowed. You can ask for the type at runtime with `typeof(...)`:

```squirrel
print(typeof(42) + "\n")        // integer
print(typeof(3.14) + "\n")      // float
print(typeof("hi") + "\n")      // string
print(typeof(true) + "\n")      // bool
print(typeof(null) + "\n")      // null
```

## 2.2 The core value types

| Type name | Example literal | Used for |
|---|---|---|
| `integer` | `42`, `-7`, `0` | Whole numbers (counts, indices, statuses) |
| `float` | `3.14`, `-0.5`, `1.0` | Numbers with fractional part |
| `string` | `"hello"` | Text and byte sequences |
| `bool` | `true`, `false` | Yes/no, on/off, success/failure |
| `null` | `null` | "No value" or "not set" |

There are other types you'll meet later (arrays, tables, classes, instances, closures). They are *composite* types built on top of the primitives.

**Note**: integer and float are distinct. `1` and `1.0` are different types. Most operators auto-promote integers to floats when the other operand is a float, but be aware of the distinction.

## 2.3 Variables: naming values

A variable is a name you attach to a value. Declare one with `local`:

```squirrel
local age = 30
local name = "ada"
local active = true
```

After a `local` declaration you can use the name in expressions:

```squirrel
print("hello " + name + "\n")
print("next year you'll be " + (age + 1) + "\n")
```

You can change what value a variable holds by assigning again:

```squirrel
age = 31
```

Three rules to follow:

1. **Always prefer `local`**. Without it, you create a global variable, which leaks into the rest of the program and is a common source of bugs.
2. **Use clear names**. `user_count` is better than `uc`.
3. **One thing per variable**. Don't reuse `x` for ten different meanings.

## 2.4 Arithmetic operators

| Operator | Meaning | Example | Result |
|---|---|---|---|
| `+` | Add | `2 + 3` | `5` |
| `-` | Subtract | `7 - 4` | `3` |
| `*` | Multiply | `6 * 5` | `30` |
| `/` | Divide | `7 / 2` | `3` (integer division!) |
| `/` | Divide | `7.0 / 2` | `3.5` |
| `%` | Remainder | `7 % 3` | `1` |
| `-x` | Negate | `-5` | `-5` |

**Note on division**: if *both* operands are integers, the result is also an integer (truncated toward zero). To force float division, write at least one operand as a float: `7 / 2.0` gives `3.5`.

Increment and decrement operators exist, postfix only:

```squirrel
local n = 0
n++           // adds 1
n--           // subtracts 1
```

They modify the variable in place. `n++` evaluates to the *old* value, which matches C/C++/Java behavior.

## 2.5 Comparison operators

These produce a `bool`.

| Operator | Meaning |
|---|---|
| `==` | Equal |
| `!=` | Not equal |
| `<` | Less than |
| `<=` | Less than or equal |
| `>` | Greater than |
| `>=` | Greater than or equal |

Examples:

```squirrel
print((1 == 1) + "\n")     // true
print((1 == "1") + "\n")   // false (different types)
print((2 < 5) + "\n")      // true
```

## 2.6 Logical operators

| Operator | Meaning |
|---|---|
| `&&` | Logical AND |
| `\|\|` | Logical OR |
| `!` | Logical NOT |

```squirrel
local status = 200
local ok = (status >= 200 && status < 300)
if (!ok) print("request failed\n")
```

`&&` and `||` **short-circuit**: in `a && b`, if `a` is false, `b` is not evaluated. This is useful for guarding:

```squirrel
if (cfg != null && cfg.debug) print("debug on\n")
```

If `cfg` is `null`, the second part is never evaluated, so `cfg.debug` does not blow up.

## 2.7 String basics

A string is a sequence of bytes, typically interpreted as UTF-8 text. Create one with double quotes:

```squirrel
local greeting = "hello"
```

Common operations:

```squirrel
print("len: " + greeting.len() + "\n")       // 5
print("upper: " + greeting.toupper() + "\n") // HELLO
print("slice: " + greeting.slice(0, 3) + "\n") // hel
```

Concatenation uses `+`:

```squirrel
print("hello " + "world" + "\n")
```

When you `+` a non-string to a string, Squirrel converts the non-string to its `tostring()` representation:

```squirrel
print("count=" + 42 + "\n")  // count=42
```

Escape sequences inside string literals:

| Sequence | Meaning |
|---|---|
| `\n` | Newline |
| `\t` | Tab |
| `\"` | Literal double quote |
| `\\` | Literal backslash |

For formatted output, prefer `format(...)`:

```squirrel
local name = "ada"
local age = 30
print(format("name=%s age=%d\n", name, age))
```

Format specifiers follow `printf` conventions: `%s` for string, `%d` for integer, `%f` for float, `%x` for hex.

## 2.8 Booleans and truthiness

Booleans are written `true` and `false`. They are the only two `bool` values.

In `if` and `while` conditions, Squirrel converts other values to a boolean:

| Value | Treated as |
|---|---|
| `null` | false |
| `0`, `0.0` | false |
| `""` (empty string) | false in many places |
| Any other integer/float | true |
| Any non-empty string | true |
| Any object, array, table | true |

**Recommendation for beginners**: write explicit comparisons (`if (x != null)`, `if (n > 0)`) instead of relying on implicit conversions. It's easier to read.

## 2.9 Null

`null` is a distinct value that means "no value". Use it to indicate absence:

```squirrel
local cached = null

function lookup(key) {
    if (cached == null) {
        // ... fetch and store ...
    }
    return cached
}
```

`null` is not the same as `0` or `""`. Compare explicitly with `==` or `!=`.

## 2.10 Converting between types

| Conversion | Example |
|---|---|
| String → integer | `"42".tointeger()` → `42` |
| String → float | `"3.14".tofloat()` → `3.14` |
| Integer → string | `(42).tostring()` → `"42"` |
| Any → string for printing | `"" + x` or `x.tostring()` |

Conversions throw if the input doesn't make sense as the target type. Use a `try/catch` (chapter 6) if you cannot guarantee well-formed input.

## 2.11 A worked example

Here's a small program that reads two numbers from the command line, prints their sum and average. Save as `avg.nut`:

```squirrel
if (vargv.len() < 2) {
    print("usage: avg.nut A B\n")
    return
}

local a = vargv[0].tofloat()
local b = vargv[1].tofloat()

local sum = a + b
local avg = sum / 2.0

print(format("a=%g b=%g sum=%g avg=%g\n", a, b, sum, avg))
```

Run:

```sh
./build/sqgi avg.nut 3 5
```

Expected output:

```
a=3 b=5 sum=8 avg=4
```

`vargv` is a built-in array of command-line arguments passed to your script.

## 2.12 Exercises

1. Print a 5×5 multiplication table using nested loops (loops are chapter 4; for now just try the inner expression).
2. Write a script that prints whether the year `2024` is a leap year. Hint: `(y % 4 == 0 && y % 100 != 0) || y % 400 == 0`.
3. Take three numbers from `vargv` and print the largest.

## 2.13 What's next

You can now manipulate single values. Chapter 3 teaches you how to store collections of them.
