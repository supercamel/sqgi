# Chapter 12 - GVariant and GValue Interop

Two value containers show up constantly in the GNOME platform: **GValue**, the generic boxed-value type used for properties and signals, and **GVariant**, the typed payload used by D-Bus, GSettings, GAction, and many newer APIs. This chapter shows how SQGI marshals between Squirrel values and these C types.

## 12.1 GValue: usually invisible

You almost never construct a `GValue` by hand. SQGI wraps and unwraps them automatically:

- When you set a GObject property, your Squirrel value gets boxed into a GValue.
- When you read a property, the GValue gets unwrapped to a Squirrel value.
- When a signal handler receives parameters, they arrive as Squirrel values.

The implication: when you use `sqgi.new_object(klass, {...})` or `obj["prop-name"] = x`, you can pass plain Squirrel values (`true`, integers, strings, arrays, etc.) and SQGI handles the boxing. Property type mismatches throw a clear error.

If you ever need to introspect or construct one explicitly (rare), look at `src/sqgi_marshal.c` for the supported type mappings.

## 12.2 GVariant: typed payloads

A `GVariant` is more strict than a GValue. Each variant has both a *value* and a **type signature** — a small string like `"s"`, `"i"`, `"as"`, `"(si)"`, or `"a{sv}"` — that describes the shape exactly.

Why bother? Because variants are designed for **serialization**: D-Bus messages, GSettings storage, action parameters. The type signature ensures both sides agree on the layout.

| Signature | Meaning |
|---|---|
| `b` | boolean |
| `y` | byte |
| `n` / `q` | int16 / uint16 |
| `i` / `u` | int32 / uint32 |
| `x` / `t` | int64 / uint64 |
| `d` | double |
| `s` | string |
| `o` | object path |
| `v` | variant (nested) |
| `ay` | byte array |
| `as` | string array |
| `(si)` | tuple of string and int32 |
| `a{sv}` | dictionary of string → variant |

## 12.3 Building variants

The constructors live on `GLib.Variant`:

```squirrel
local GLib = import("GLib")

local v_bool = GLib.Variant.new_boolean(true)
local v_int  = GLib.Variant.new_int32(42)
local v_str  = GLib.Variant.new_string("hello")
local v_dbl  = GLib.Variant.new_double(3.14)
```

For composite types you'll usually use a type-aware builder:

```squirrel
local strs = GLib.Variant.new_strv(["alpha", "beta", "gamma"])
// signature: "as"
```

Or parse a literal:

```squirrel
local v = GLib.Variant.parse(null, "(\"hello\", 42)", null, null)
// signature: "(si)"
```

`GLib.Variant.parse` accepts the textual variant syntax (the same one `gdbus call` uses). It's the easiest way to build complex variants by hand.

## 12.4 Reading variants

Type-specific getters return the inner value:

```squirrel
print(v_int.get_int32() + "\n")    // 42
print(v_str.get_string()[0] + "\n") // "hello"   (string getters return [str, length])
```

To inspect signature and type:

```squirrel
print(v.get_type_string() + "\n")   // "(si)"
print(v.is_of_type(GLib.VariantType.new("i")) + "\n")
```

For containers, iterate with `n_children` + `get_child_value(i)`:

```squirrel
for (local i = 0; i < v.n_children(); i++) {
    local child = v.get_child_value(i)
    print(i + ": " + child.print(true) + "\n")
}
```

`variant.print(true)` returns a textual rendering — handy for debugging.

## 12.5 Why this matters in practice

Three places you'll meet variants regularly:

1. **GSettings**:

   ```squirrel
   local Gio = import("Gio")
   local s = Gio.Settings.new("org.gnome.desktop.interface")
   local v = s.get_value("text-scaling-factor")
   print(v.get_double() + "\n")
   s.set_value("text-scaling-factor", GLib.Variant.new_double(1.1))
   ```

2. **GAction parameters and state**:

   ```squirrel
   local action = Gio.SimpleAction.new_stateful(
       "theme",
       GLib.VariantType.new("s"),
       GLib.Variant.new_string("light")
   )
   action.connect("change-state", function(self, value) {
       print("new theme: " + value.get_string()[0] + "\n")
       self.set_state(value)
   })
   ```

3. **D-Bus method calls**:

   ```squirrel
   local args = GLib.Variant.parse(null, "(\"hello\", 42)", null, null)
   bus.call("org.example.Service",
            "/org/example/Path",
            "org.example.Iface",
            "Method",
            args,
            null,            // expected reply type
            Gio.DBusCallFlags.NONE,
            -1, null)
   ```

## 12.6 Building a dictionary variant

Dictionaries (`a{sv}`) are the most common composite. The idiomatic pattern is to use `GLib.VariantBuilder`:

```squirrel
local builder = GLib.VariantBuilder.new(GLib.VariantType.new("a{sv}"))
builder.add_value(GLib.Variant.parse(null, "{\"name\": <\"ada\">}", null, null))
builder.add_value(GLib.Variant.parse(null, "{\"age\":  <30>}",     null, null))
local dict = builder.end()
```

Or, simpler when feasible, build the entire literal and parse it:

```squirrel
local dict = GLib.Variant.parse(
    null,
    "{ \"name\": <\"ada\">, \"age\": <30> }",
    null, null
)
```

Note how each value in an `a{sv}` is itself a variant — that's what `v` means in the signature, and why each entry is wrapped in `<...>` in the textual form.

## 12.7 Choosing the right tool

| If you want | Use |
|---|---|
| A property on a GObject | Plain Squirrel value, SQGI marshals |
| A signal handler arg | Plain Squirrel value, SQGI unmarshals |
| A GSettings value | `GLib.Variant.new_*` then `set_value` |
| A GAction payload | `GLib.Variant` matching the action's signature |
| A D-Bus argument tuple | `GLib.Variant.parse` from textual literal |
| To serialize structured data | `GLib.Variant` then `get_data_as_bytes` |

For pure script-to-script data interchange, use `sqgi.json` (see chapter 7 era code in `src/sqgi_json.c`). Variants are for talking to the GNOME platform, not for general object storage.

## 12.8 Worked example: changing a GAction

```squirrel
local GLib = import("GLib")
local Gio  = import("Gio")

local action = Gio.SimpleAction.new(
    "say-hello",
    GLib.VariantType.new("s")   // takes one string argument
)
action.connect("activate", function(self, parameter) {
    local name = parameter.get_string()[0]
    print("hello, " + name + "\n")
})

// Activating with a parameter:
action.activate(GLib.Variant.new_string("ada"))
```

Output:

```
hello, ada
```

This pattern — typed-parameter actions — drives menu items in GTK applications, system services, and more.

## 12.9 Exercises

1. Read your `org.gnome.desktop.interface text-scaling-factor` GSettings value and print it.
2. Build an `a{sv}` variant representing a person record and parse it back.
3. Define a `Gio.SimpleAction` with `(si)` payload and activate it.
4. Read `test/test_gvariant_classes.nut` to see the full marshal coverage.

## 12.10 You're done

That's the end of the tutorial. You now have the language, the runtime, and the platform glue to write substantial SQGI programs. The next step is exploring the demos in `demo/` and the test suite in `test/` — both are full of patterns you can repurpose.

If you want a reference card, every chapter ends with a "What's next" pointer and the chapter map (`00-chapter-map.md`) is your index. Good hacking.
