# GLib Cookbook

Recipes for the parts of GLib you reach for in every SQGI script that
isn't already covered by the [Gio](gio.md) or [GTK 4](gtk4.md) cookbooks:
the main loop, time, `GBytes`, `GVariant`, INI files, hashing, regex,
paths, and environment helpers.

Read [docs/language/](../language/) chapters 9–11 for the async model and
skim [docs/api/README.md](../api/README.md) for the `sqgi.*` surface
first.

Every snippet is runnable with:

```bash
./build/sqgi path/to/script.nut
```

Working scripts for each section live under `demo/glib/`.

## Contents

- [1. Setup and version](#1-setup-and-version)
- [2. Main loop, timeouts, idle sources](#2-main-loop-timeouts-idle-sources)
- [3. Pumping a `MainContext` by hand](#3-pumping-a-maincontext-by-hand)
- [4. Time: monotonic, wall, and `DateTime`](#4-time-monotonic-wall-and-datetime)
- [5. `GBytes`](#5-gbytes)
- [6. `GVariant`](#6-gvariant)
- [7. `GVariantDict`](#7-gvariantdict)
- [8. Checksums (md5, sha1, sha256, sha512)](#8-checksums-md5-sha1-sha256-sha512)
- [9. base64 encode and decode](#9-base64-encode-and-decode)
- [10. KeyFile (INI-style config)](#10-keyfile-ini-style-config)
- [11. Markup and URI escaping](#11-markup-and-uri-escaping)
- [12. Regex](#12-regex)
- [13. Filesystem paths](#13-filesystem-paths)
- [14. Environment variables](#14-environment-variables)
- [15. Common pitfalls](#15-common-pitfalls)

---

## 1. Setup and version

```squirrel
local GLib = import("GLib")

print("GLib " + GLib.MAJOR_VERSION + "." + GLib.MINOR_VERSION
    + "." + GLib.MICRO_VERSION + "\n")
print("default priority: " + GLib.PRIORITY_DEFAULT + "\n")
```

Useful constants:

| Constant | Typical value |
|---|---|
| `GLib.PRIORITY_HIGH` | -100 |
| `GLib.PRIORITY_DEFAULT` | 0 |
| `GLib.PRIORITY_HIGH_IDLE` | 100 |
| `GLib.PRIORITY_DEFAULT_IDLE` | 200 |
| `GLib.PRIORITY_LOW` | 300 |

Lower numbers run first.

---

## 2. Main loop, timeouts, idle sources

`GLib.MainLoop` is the heart of every long-running SQGI program. Without
one, nothing async ever resolves.

```squirrel
local loop = GLib.MainLoop.new(null, false)
local ticks = 0

sqgi.timeout_add(200, function() {
    ticks += 1
    print("tick " + ticks + "\n")
    if (ticks >= 5) { loop.quit(); return false }
    return true              // true ⇒ fire again, false ⇒ remove source
})

loop.run()
```

- `sqgi.timeout_add(ms, callback)` is the recommended wrapper. It attaches
  a Squirrel callback to a `GSource` on the default context. The callback's
  return value decides whether the source persists.
- Returning `false` (or no value) detaches the source — the closure stops
  being called.
- For one-shot delays inside an `async` function, use `await sqgi.sleep(ms)`
  instead — it's just a `timeout_add` that resolves a Task once.

> **Note.** This SQGI build doesn't expose `sqgi.idle_add` directly. For
> "run as soon as the loop is idle", schedule a `timeout_add(0, …)` — it
> behaves the same in practice.

---

## 3. Pumping a `MainContext` by hand

You normally hand the loop control with `loop.run()`. When you can't —
embedding GLib inside another framework, or in tests that need
deterministic step-by-step dispatch — pump the context directly:

```squirrel
local ctx = GLib.MainContext.default()

sqgi.timeout_add(1, function() { print("fired\n"); return false })

while (some_condition) {
    ctx.iteration(true)      // true: block until one source is ready
}
```

`ctx.iteration(may_block)` runs **one** dispatch cycle. Pass `false` for a
strict non-blocking drain (returns immediately if nothing is ready), or
`true` to block until at least one source fires.

See [demo/glib/idle_drain.nut](../../demo/glib/idle_drain.nut).

---

## 4. Time: monotonic, wall, and `DateTime`

Three different clocks, three different uses:

```squirrel
local t_mono = GLib.get_monotonic_time()    // microseconds, monotonic, no clock-jumps
local t_wall = GLib.get_real_time()         // microseconds since epoch (UTC)

print("mono us:    " + t_mono + "\n")
print("real us:    " + t_wall + "\n")
print("real sec:   " + (t_wall / 1000000) + "\n")
```

Use `get_monotonic_time` for measuring durations (deadlines, profiling).
Use `get_real_time` only when you actually need a calendar timestamp.

### `DateTime` and `TimeZone`

```squirrel
local utc = GLib.TimeZone.new_utc()
local dt  = GLib.DateTime.new(utc, 2025, 5, 17, 14, 30, 45.5)

print(dt.format("%Y-%m-%dT%H:%M:%SZ") + "\n")       // ISO 8601
print(dt.format("%a, %d %b %Y %H:%M:%S %z") + "\n") // RFC 2822-ish
print("unix sec:   " + dt.to_unix() + "\n")         // seconds since epoch
```

Arithmetic returns a fresh `DateTime`:

```squirrel
local later = dt.add_hours(1)
local span_us = later.difference(dt)        // microseconds between two times
```

`new_now_utc()` / `new_now_local()` give "now" in the appropriate zone.

See [demo/glib/datetime.nut](../../demo/glib/datetime.nut).

---

## 5. `GBytes`

`GLib.Bytes` is the immutable, ref-counted, length-prefixed byte buffer
that all of GIO, libsoup, and GStreamer pass around. SQGI's accessor
`get_data()` returns an 8-bit-clean Squirrel string — perfect for binary
payloads with embedded NULs.

```squirrel
local b = GLib.Bytes.new("hello")
print(b.get_size() + " B  data=" + b.get_data() + "\n")

// Binary-clean: a NUL in the middle is fine.
local raw = "ab\x00cd"
local b2  = GLib.Bytes.new(raw)
print("size: " + b2.get_size() + "\n")              // 5

// Equality compares contents.
print(b.equal(GLib.Bytes.new("hello")) + "\n")      // true
```

You'll see `GLib.Bytes.new(payload)` everywhere a GIO/libsoup async write
needs raw bytes — see the [Gio](gio.md) and [Soup](soup.md) cookbooks.

See [demo/glib/bytes_checksum.nut](../../demo/glib/bytes_checksum.nut).

---

## 6. `GVariant`

`GVariant` is GNOME's tagged value type — used by `GAction` parameters,
`GSettings`, `Gio.Application` command-line dictionaries, and D-Bus.
Construct one with a type-specific factory; introspect with
`get_type_string()` and a matching getter:

```squirrel
local vs = GLib.Variant.new_string("squirrel")
local vi = GLib.Variant.new_int32(42)
local vb = GLib.Variant.new_boolean(true)
local vd = GLib.Variant.new_double(2.71828)

print(vs.get_type_string() + " → " + vs.get_string() + "\n")  // s → squirrel
print(vi.get_type_string() + " → " + vi.get_int32()  + "\n")  // i → 42
print(vb.print(true) + "\n")                                  // true
```

`.print(type_annotate)` renders any Variant to GVariant text format.

### `GVariantType`

```squirrel
local s_type = GLib.VariantType.new("s")
local i_type = GLib.VariantType.new("i")

print(s_type.is_basic() + "\n")                       // true
print(s_type.equal(GLib.VariantType.new("s")) + "\n") // true
print(s_type.equal(i_type) + "\n")                    // false
```

The type-string mini-language is GVariant's signature alphabet:

| Code | Meaning |
|---|---|
| `s` / `o` / `g` | string / object-path / signature |
| `i` / `u` / `x` / `t` | int32 / uint32 / int64 / uint64 |
| `b` | boolean |
| `d` | double |
| `y` / `n` / `q` / `h` | byte / int16 / uint16 / file-handle |
| `as` | array of strings |
| `a{ss}` | dictionary string → string |
| `v` | nested variant |

For containers, pair `VariantType.new("as")` with
`GLib.VariantBuilder.new(type)` (when available in your binding) — see
the [Gio cookbook § Actions](gio.md#13-actions-gaction) for use sites.

---

## 7. `GVariantDict`

A mutable string→Variant map. Used for parsed command-line options and
`Gio.Application.command-line` payloads:

```squirrel
local d = GLib.VariantDict.new(null)
d.insert_value("name",    GLib.Variant.new_string("sqgi"))
d.insert_value("count",   GLib.Variant.new_int32(7))
d.insert_value("enabled", GLib.Variant.new_boolean(true))

if (d.contains("count")) {
    local v = d.lookup_value("count", null)
    print("count = " + v + "\n")             // 7
}
```

> **Auto-unwrap.** SQGI's `lookup_value` returns the *already-unwrapped*
> native value (int, string, bool, …) when the dict was populated via
> `insert_value` with a basic-typed Variant — not a Variant wrapper.
> Treat it as the underlying Squirrel value. Test the type before
> dereferencing if you want to be defensive.

See [demo/glib/variant.nut](../../demo/glib/variant.nut).

---

## 8. Checksums (md5, sha1, sha256, sha512)

The fastest, most portable interface is the one-shot string helper:

```squirrel
local payload = "abc"
print(GLib.compute_checksum_for_string(
    GLib.ChecksumType.md5,    payload, payload.len()) + "\n")
print(GLib.compute_checksum_for_string(
    GLib.ChecksumType.sha256, payload, payload.len()) + "\n")
```

Verified outputs for `"abc"`:

- md5    → `900150983cd24fb0d6963f7d28e17f72`
- sha256 → `ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad`

`GLib.ChecksumType` enum members: `md5`, `sha1`, `sha256`, `sha384`,
`sha512`.

For streaming a large file: construct `GLib.Checksum.new(type)`, call
`.update(data, len)` repeatedly, then `.get_string()` once at the end.

See [demo/glib/bytes_checksum.nut](../../demo/glib/bytes_checksum.nut).

---

## 9. base64 encode and decode

```squirrel
local payload = "Hello, GLib!"
local enc = GLib.base64_encode(payload, payload.len())
print(enc + "\n")                                  // SGVsbG8sIEdMaWIh

local out = GLib.base64_decode(enc)
// base64_decode return shape varies — normalise:
if (typeof(out) == "array")     out = out[0]
if (typeof(out) == "instance")  out = out.get_data()
print(out + "\n")
```

The decode call may return a string, an `[string, length]` array, or a
`GLib.Bytes` depending on binding generation. The normalisation block
above covers all three. If you see trailing NULs, strip them — the buffer
is sized to the decoded length but the string view doesn't carry the
exact count.

---

## 10. KeyFile (INI-style config)

```squirrel
local kf = GLib.KeyFile.new()

kf.set_string("server",  "host",  "localhost")
kf.set_integer("server", "port",  8080)
kf.set_boolean("server", "tls",   false)
kf.set_double("server",  "ratio", 1.25)
kf.set_string_list("server", "tags", ["api", "internal", "v1"])

// Render as INI text:
local text = kf.to_data()
if (typeof(text) == "array") text = text[0]
print(text)
```

…produces:

```ini
[server]
host=localhost
port=8080
tls=false
ratio=1.25
tags=api;internal;v1;
```

Round-trip:

```squirrel
local kf2 = GLib.KeyFile.new()
kf2.load_from_data(text, text.len(), GLib.KeyFileFlags.none)
print(kf2.get_string("server", "host"))    // localhost
print(kf2.get_integer("server", "port"))   // 8080
```

`kf.get_groups()` returns `[group_array, length]`. Iterate `[0]`:

```squirrel
foreach (g in kf.get_groups()[0]) print(g + "\n")
```

`KeyFileFlags` of interest:

| Flag | Effect |
|---|---|
| `none` | strict parsing |
| `keep_comments` | preserve `#` comments when re-rendering |
| `keep_translations` | preserve locale-tagged keys like `name[de]` |

See [demo/glib/keyfile.nut](../../demo/glib/keyfile.nut).

---

## 11. Markup and URI escaping

For Pango / GtkLabel / `Gio.Notification` body text — escape the
five XML-significant characters:

```squirrel
local safe = GLib.markup_escape_text("<a & b>", 7)
// → "&lt;a &amp; b&gt;"
```

For percent-encoding query-string components:

```squirrel
local enc = GLib.Uri.escape_string("a b/c?d=1", null, false)
// → "a%20b%2Fc%3Fd%3D1"
local dec = GLib.Uri.unescape_string(enc, null)
// → "a b/c?d=1"
```

The second argument to `escape_string` is a string of bytes to leave
*unescaped* (or `null` for "encode everything reserved"). The third
toggles `+`-vs-`%20` for spaces.

---

## 12. Regex

```squirrel
local r = GLib.Regex.new("(\\w+)=(\\d+)",
    GLib.RegexCompileFlags.default,
    GLib.RegexMatchFlags.default)

local matched = r.match("count=42 size=100",
    GLib.RegexMatchFlags.default, null)
```

The return shape varies between bindings — sometimes `bool`, sometimes
`[matched, GMatchInfo]`. Normalise like so:

```squirrel
if (typeof(matched) == "array") matched = matched[0]
```

For capture groups, prefer `r.split` or pair the match with a
`GLib.MatchInfo` (when exposed) and iterate `.fetch(i)` / `.next()`.

> Heads-up: backslashes in Squirrel string literals need escaping (`"\\w"`).

---

## 13. Filesystem paths

Portable, pure-string path manipulation that doesn't touch the disk:

```squirrel
print(GLib.get_tmp_dir()                     + "\n")  // /tmp
print(GLib.get_home_dir()                    + "\n")  // /home/sam
print(GLib.get_current_dir()                 + "\n")  // process cwd
print(GLib.get_user_name()                   + "\n")  // sam
print(GLib.get_host_name()                   + "\n")  // hostname

print(GLib.build_filenamev(["a", "b", "c"])  + "\n")  // a/b/c
print(GLib.path_get_basename("/x/y/z.txt")   + "\n")  // z.txt
print(GLib.path_get_dirname ("/x/y/z.txt")   + "\n")  // /x/y

print(GLib.find_program_in_path("sh"))                // /usr/bin/sh
```

`find_program_in_path(name)` returns `null` when the name isn't on `PATH`.

XDG-style user directories: `get_user_config_dir`, `get_user_data_dir`,
`get_user_cache_dir`, `get_user_runtime_dir` (when available in your
GLib build).

See [demo/glib/paths_env.nut](../../demo/glib/paths_env.nut).

---

## 14. Environment variables

```squirrel
GLib.setenv("MY_VAR", "hello", true)         // overwrite=true
print(GLib.getenv("MY_VAR") + "\n")          // hello

GLib.unsetenv("MY_VAR")
print(GLib.getenv("MY_VAR") + "\n")          // null
```

`getenv` returns `null` when the variable is unset. `setenv`'s third
argument controls whether an existing value is overwritten.

Use these over `os.getenv` (when present) so behaviour stays consistent
across GTK / GIO calls that read the same variables.

---

## 15. Common pitfalls

| Symptom | Cause | Fix |
|---|---|---|
| Script exits immediately, no callbacks fire | No main loop running | `local loop = GLib.MainLoop.new(null, false); …; loop.run()` |
| `timeout_add` callback only fires once even though I want it to repeat | The callback returned no value (i.e. `null`) | Explicitly `return true` to keep firing |
| `sqgi.idle_add` throws "the index 'idle_add' does not exist" | This SQGI build doesn't expose it | Use `sqgi.timeout_add(0, fn)` instead |
| `the index 'get_int32' does not exist` on `lookup_value` | SQGI auto-unwrapped the Variant to a native int | Treat it as the unwrapped value, or check `typeof()` and branch |
| `KeyFile.to_data` "compared a string and an array" | `to_data` returns `[text, length]` on some bindings | `if (typeof(text) == "array") text = text[0]` |
| `KeyFile.load_from_data` rejects a string with embedded newlines | Length parameter mismatched | Pass `text.len()` explicitly, not `-1` |
| `base64_decode` produces junk at end of string | Trailing NULs in the buffer view | `while (s.len() > 0 && s[s.len()-1] == 0) s = s.slice(0, s.len()-1)` |
| `Regex.match` returns an array, not a bool | Multi-out finish from the C `match_full` signature | `if (typeof(r) == "array") r = r[0]` |
| `DateTime.to_unix` looks ~6 orders of magnitude smaller than `get_real_time` | They use different units. `to_unix()` is **seconds**, `get_real_time()` is **microseconds** | Multiply or divide by 10⁶ as appropriate |
| `local base = …` rejected by the parser | `base` is a reserved keyword in Squirrel (class base reference) | Rename the local variable |
| `local dir = …` *also* rejected | Some Squirrel builds treat `dir` as reserved | Rename to `dirpath` or similar |

---

## Further reading

- [demo/glib/](../../demo/glib/) — six runnable scripts mirroring the recipes
  here (`mainloop_timer`, `datetime`, `bytes_checksum`, `variant`,
  `keyfile`, `paths_env`, `idle_drain`).
- [test/test_glib_recipes.nut](../../test/test_glib_recipes.nut) — 70-check
  behavioural test that pins down every API used here.
- [docs/recipes/gio.md](gio.md) — picks up where this leaves off: files,
  streams, sockets, applications.
- [docs/api/README.md](../api/README.md) — `sqgi.timeout_add`, `sqgi.sleep`,
  `sqgi.Task`, etc.
- Upstream reference: <https://docs.gtk.org/glib/>.
