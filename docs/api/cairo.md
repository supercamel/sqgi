# Native Cairo wrappers

`import("cairo")` provides native `Context`, `Surface` and `Pattern` classes.
Enums such as `Format.argb32` and `Extend.pad` come from the Cairo typelib.
The runtime and static checker share the method declarations in
[`src/sqgi_cairo_api.def`](../../src/sqgi_cairo_api.def).

```squirrel
local C = import("cairo")
local s = C.image_surface_create(C.Format.argb32, 256, 256)
local cr = C.Context.create(s)
cr.set_source_surface(someSourceSurface, 0, 0)
local pattern = cr.get_source()
pattern.set_extend(C.Extend.pad)
cr.paint()
```

| Method | Result and contract |
| --- | --- |
| `Context.get_source()` | Returns the actual current `Pattern` with its own native reference. Mutations affect drawing by the context. The wrapper remains valid after source replacement or context collection. |
| `Pattern.set_extend(mode)` | Sets the extension mode and returns `null`. Accepts integer `Extend.none` (0), `repeat` (1), `reflect` (2), or `pad` (3). |
| `Pattern.get_extend()` | Returns the current integer extension mode. |
| `Context.get_target()` | Returns a `Surface` with its own native reference. |

`none` makes samples beyond the source transparent; `pad` repeats the nearest
edge pixel; `repeat` tiles the source; `reflect` tiles mirrored copies. PAD is
useful when scaling cropped map tiles, together with a destination clip.

Wrappers delivered through GTK drawing callbacks or Cairo boxed GValues use
the same classes and reference ownership as factory-created wrappers. Dropping
a wrapper releases only its own reference.

Calls reject incorrectly typed or uninitialized wrappers with a Squirrel
exception, including Cairo arguments passed through GI (for example,
`Gdk.cairo_set_source_pixbuf`). Native methods validate argument counts.
`set_dash(dashes, offset = 0)` and its `set_dashes` alias accept one or two
arguments. Integer arguments reject floats and booleans; surface dimensions
must be nonnegative and fit a native signed integer. Invalid extension values
are rejected before changing the pattern.

## Regression tests

Run `ctest --test-dir build -R 'cairo|sqgicheck' --output-on-failure` after
building. Tests cover wrong wrapper types, argument validation, source sharing,
native reference counts, all four extension modes with distinct pixel colors,
GdkPixbuf scaling/alpha/clipping, Cairo boxed values, and checker diagnostics.
The GTK draw callback test is registered when `xvfb-run` is available; it
requires GTK 4 and asserts that at least two callbacks complete.

The standard and ASan shell runners include Cairo tests. Sanitizer builds can
also run these CTest cases directly. The tests use unique temporary paths.
The GTK test suppresses Fontconfig's process-lifetime `FcInit` allocations;
the native Cairo reference-count and pixel tests have no leak suppressions.
Both compact and legacy explicit callback-registration forms are exercised;
unused legacy destroy-callback wrappers are released when registration returns.
