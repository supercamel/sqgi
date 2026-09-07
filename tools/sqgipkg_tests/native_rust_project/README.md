# Native Rust GI Test Project

This fixture builds a tiny Rust `cdylib` that implements a `SqRust.Counter`
GObject type with the Rust `glib` crate's `ObjectSubclass` API. A small public C
header exposes the GI-facing ABI that gobject-introspection scans, then
`main.nut` imports the generated `SqRust-1.0` typelib through SQGI.

The Rust code deliberately keeps the raw C ABI surface at the edge; the object,
state, methods, and signal are implemented using normal gtk-rs subclassing
patterns.

The Rust GI module is Linux-only for this fixture. Windows packaging still builds
the SQGI runtime so `--target all` can complete, but `main.nut` uses
`import("system")` and skips the Rust GI import on non-Linux hosts.
