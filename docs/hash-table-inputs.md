# Input hash tables and libsecret

SQGI now converts Squirrel tables to `GHashTable<utf8, utf8>` and
`GHashTable<utf8, Enum/Flags>` input arguments. Keys and string values are copied
into owned native allocations. Strings must be valid UTF-8 without embedded NUL.
Enum/flags values must be integers within their GI 32-bit storage range; zero is
a valid stored value. Null is accepted only when the callable annotation permits
it, and an empty table becomes a non-null empty native table.

Supported argument contracts are direction **in**, transfer **none** or **full**.
Borrowed tables are released after invocation. Fully transferred tables belong to
the callee once invoked, including native calls reporting a GError. Argument
conversion failures release tables already created, including partial entries.
An async callee receiving a full transfer can retain the table independently of
subsequent script mutation or garbage collection.

Other key/value types, container-only transfer, inout hash arguments and direct
hash-table field assignment are deliberately rejected. Those cases need separate
ownership rules; this change does not claim general arbitrary-object dictionary
support. Existing native-result hash conversion is unchanged.

## libsecret annotation compatibility

libsecret 0.21.4's `secret-password.c` marks the asynchronous `attributes`
arguments as transfer-full, but refs them into its task closure; its own C
convenience functions unref the caller's table after submission. The initial
annotation-faithful fix therefore leaked 334 bytes on the cancelled lookup.
SQGI corrects only the `attributes` argument of these exact Secret symbols:
`secret_password_storev`, `secret_password_storev_binary`,
`secret_password_lookupv`, `secret_password_clearv`, and
`secret_password_searchv`. They are borrowed inputs; the library owns its extra
reference. This does not change genuinely transfer-full fixture/API ownership.
Source: https://github.com/GNOME/libsecret/blob/0.21.4/libsecret/secret-password.c

This enables `Secret.Schema.new` (string/enum attributes) and libsecret's
string/string password attributes without application-specific marshalling.

## Verification

```sh
cmake --build build --target sqgi-bin
ctest --test-dir build -R 'sqgi_test_(ghash_inputs|secret_private)$' --output-on-failure
```

`test/ghash/run.py` creates a native library/typelib in a temporary directory and
checks real GI calls: borrowed/full transfer, null/empty input, enum zero,
UTF-8 strings, malformed entries, partial cleanup, failed later arguments,
callee GError after consuming a table, and retained inputs across mutation/GC.
The regression fails against the previous installed runtime.

`test/ghash/secret.py` uses a private D-Bus and temporary keyring directories.
It tests real libsecret schema creation, session-collection store/lookup/replace/
clear, repeated asynchronous store/lookup/clear across GC, cancelled asynchronous
lookup and unavailable-bus errors. It never uses
the desktop collection. Missing private-service tools cause CTest skip (77).
The Secret typelib must be installed for this integration test.

On Linux x86_64, both tests and five neighboring callback, array, argument-count,
GError and multi-output tests passed with the release build and a separate
`SQGI_ENABLE_ASAN=ON`, JIT/kernels-disabled debug build. Leak detection remained
enabled, with no suppression file. Cancellation/unavailable and nullability
extensions also passed in both builds.

This is binding and isolated-service evidence. It does not establish Windows
credential-store support, locked-collection prompting policy, desktop keyring
integration or an application's persistence/security design. No system installation was changed during verification.
