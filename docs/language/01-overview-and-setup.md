# Chapter 1 - Overview and Setup

Welcome. This chapter answers four questions before you write any code:

1. What is SQGI?
2. What does a SQGI program look like at a high level?
3. How do you build and run it on your machine?
4. What basic vocabulary will the rest of the tutorial assume?

If you have never programmed before, read every section. If you have programming experience but are new to Squirrel and GLib, you can skim sections 1 and 4 and focus on 2 and 3.

## 1.1 What is SQGI?

SQGI is three things layered on top of each other:

1. **A scripting language** called Squirrel. It looks like a mix of JavaScript and Lua, with classes, tables, closures, and exceptions.
2. **A bridge to native GLib/GObject libraries** (GLib, Gio, GTK, libsoup, GStreamer, …). You can call almost any function from those libraries directly from your script.
3. **An async runtime**. It adds `async` functions, `await`, and a promise-like `sqgi.Task` type so you can write non-blocking code that reads like normal sequential code.

Concretely, you write a file ending in `.nut` and run it with the `sqgi` binary:

```sh
./build/sqgi my_script.nut
```

You do not need to compile your script. You do not need to install a toolchain on top of the build. Run the binary; it executes the script.

## 1.2 Vocabulary you will need

| Word | Meaning in this tutorial |
|---|---|
| **Script** | A `.nut` text file containing Squirrel code |
| **Statement** | A single instruction (e.g. `print("hi\n")`) |
| **Expression** | A piece of code that produces a value (e.g. `2 + 3`) |
| **Value** | A piece of data the program manipulates (number, string, etc.) |
| **Variable** | A named slot holding a value |
| **Function** | A reusable named (or unnamed) block of code |
| **Library** | A collection of functionality you can use (`GLib`, `Gio`, …) |
| **Main loop** | A piece of plumbing that waits for events and dispatches callbacks |
| **Async function** | A function that may pause and resume without blocking the program |
| **Task** | An object representing a future result of an async operation |

Do not memorize this table. Refer back to it when terms feel unclear.

## 1.3 The mental model of a SQGI program

A running SQGI program has one execution thread for your script. Roughly:

1. Your script begins executing top to bottom.
2. It usually creates a `GLib.MainLoop` if it needs async or signal-driven behavior.
3. The main loop waits for "things to happen": a timer fires, a file finishes reading, a socket has data, a user clicks a button.
4. When something happens, the main loop calls back into your script to handle it.
5. The program exits when the main loop is stopped, or when the script ends without starting one.

This is the same model as Node.js or a GTK application written in C, just in a higher-level language.

## 1.4 Building SQGI

You only build SQGI itself once. After that, just edit and run scripts.

Required packages (Debian/Ubuntu names):

- `cmake`, a C/C++ toolchain
- `libglib2.0-dev`
- `libgirepository1.0-dev`
- `libffi-dev`
- `pkg-config`

From the project root:

```sh
cmake -S . -B build
cmake --build build -j
```

Confirm it works:

```sh
./build/sqgi --version
```

You should see a version string. If you instead see `command not found` or library errors, the build didn't complete; rerun the `cmake --build` step and read the output for missing packages.

## 1.5 Your first script

Create a file called `hello.nut` somewhere convenient and put this in it:

```squirrel
print("hello from sqgi\n")
```

Run it:

```sh
./build/sqgi hello.nut
```

Expected output:

```
hello from sqgi
```

Notes for newcomers:

1. `print(...)` writes text to the terminal.
2. The `\n` inside the string is a *newline*. Without it, the next thing you print would be on the same line.
3. There is no semicolon at the end. Squirrel allows them but does not require them; both styles are accepted.

## 1.6 Loading libraries

To use a library you `import` it. The result is a namespace you store in a local variable:

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")
```

Some libraries have multiple versions installed (notably GTK), so you can pin a version:

```squirrel
local Gtk = import("Gtk", "4.0")
```

If the import fails because the library is not installed, you will get a clear error. Install the corresponding `gir1.2-*` package (for example, `gir1.2-gtk-4.0`) and try again.

## 1.7 A script that uses the main loop

Here is the smallest program that demonstrates the event-loop pattern. Save it as `tick.nut`:

```squirrel
local GLib = import("GLib")

local loop = GLib.MainLoop.new(null, false)

sqgi.timeout_add(300, function() {
    print("tick\n")
    loop.quit()
    return false
})

loop.run()
```

Run it:

```sh
./build/sqgi tick.nut
```

Expected output, about 300 milliseconds after launch:

```
tick
```

Walkthrough:

1. We import `GLib` to get the main loop type.
2. We create a main loop. `null` means "use the default context"; `false` means "don't start running yet".
3. `sqgi.timeout_add(300, fn)` says "in 300 ms, call `fn`".
4. The callback prints a message, asks the loop to stop, and returns `false` (which tells the timer "don't fire again").
5. `loop.run()` blocks until something calls `loop.quit()`.

You will see this exact shape over and over throughout the tutorial.

## 1.8 Common first-week mistakes

| Mistake | Symptom | Fix |
|---|---|---|
| Forgot to start a main loop | Async code prints nothing | Create a `GLib.MainLoop` and call `.run()` |
| Forgot to stop the main loop | Program hangs forever | Call `loop.quit()` when done |
| Treated error objects as strings | Lost useful information | Inspect `sqgi.GError` fields explicitly (see chapter 6) |
| Did not `import` a namespace | `the index 'GLib' does not exist` | Add `local GLib = import("GLib")` at the top |

## 1.9 What's next

You now have a working SQGI install and a feel for what a program looks like. Chapter 2 starts at the bottom: the basic types of values you can store and manipulate.
