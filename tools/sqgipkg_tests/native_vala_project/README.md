# Native Vala Packaging Test

This project exercises packaging a Vala library with GObject Introspection.

The native library provides:

- a namespace function
- a `GObject.Object` subclass
- a property
- a signal
- async methods
- an async method that raises a `GError`

`main.nut` imports the generated `SqVala-1.0.typelib`, calls the sync API,
connects the signal, awaits Vala async methods directly, and checks the
expected async error path.

Build and run:

```sh
build/sqgi tools/sqgipkg \
  --manifest tools/sqgipkg_tests/native_vala_project/sqgipkg.json \
  --smoke-test ""
```

Most SQGI async code should use plain `await`. That works for SQGI tasks, GIO
async APIs, and Vala async methods that expose callback/user-data finish pairs:

```squirrel
local packaged_main = Gio.File.new_for_path(path)
local result = await packaged_main.load_contents_async(null)

await sqgi.sleep(1)

local greeting = await worker.greet_async("SQGI")
local sum = await worker.delayed_sum_async(19, 23)
```

The raw GI methods are still available as `greet_async_raw`,
`delayed_sum_async_raw`, and `fail_async_raw` for low-level tests or unusual
manual callback wiring.
