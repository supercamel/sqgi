# SQGI Language Tutorial

This folder is a full tutorial for Squirrel in SQGI, including the async runtime
and GObject integration layer.

## How to read this

- Read chapters in order once.
- Keep later chapters as references while building scripts and apps.
- Run examples with `./build/sqgi <path-to-script>.nut`.

## Chapters

| Chapter | File | Focus |
|---|---|---|
| 1 | `01-overview-and-setup.md` | Mental model, runtime, and first script |
| 2 | `02-values-types-and-operators.md` | Numbers, strings, booleans, null, operators |
| 3 | `03-strings-arrays-and-tables.md` | Core data structures and iteration |
| 4 | `04-control-flow-functions-and-closures.md` | Branching, loops, functions, lexical scope |
| 5 | `05-classes-and-inheritance.md` | Classes, constructors, methods, inheritance |
| 6 | `06-error-handling-and-debugging.md` | Exceptions, defensive coding, diagnostics |
| 7 | `07-gi-imports-and-gobject-basics.md` | `import`, typelibs, object creation, methods |
| 8 | `08-properties-signals-and-subclassing.md` | Property bags, signals, custom GObject types |
| 9 | `09-async-tasks-and-cancellation.md` | `async/await`, `sqgi.Task`, cancellation, composition |
| 10 | `10-main-loops-threading-and-event-model.md` | Main loop lifecycle, event timing, thread model |
| 11 | `11-end-to-end-patterns-and-recipes.md` | Practical recipes and architecture patterns |
| 12 | `12-gvariant-and-gvalue-interop.md` | Typed values (`GVariant`, `GValue`) and marshalling |

## Learning outcomes

After chapter 12, you should be able to:

1. Write idiomatic Squirrel code (data, classes, control flow).
2. Use GI libraries directly from script (`GLib`, `Gio`, `Gtk`, `Soup`, `Gst`).
3. Build robust async flows with cancellation and timeouts.
4. Integrate async work with the GLib main loop safely.
5. Design script and app structure that scales beyond toy examples.
