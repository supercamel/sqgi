# Passing tables to native libraries

SQGI converts Squirrel tables to native `GHashTable<utf8, utf8>` and
`GHashTable<utf8, Enum/Flags>` input arguments. This supports APIs such as
`Secret.Schema.new` and libsecret password attributes without custom marshalling.

Keys and string values must be valid UTF-8 without embedded NUL. Enum and flags
values must be integers within their GI 32-bit storage range; zero is valid.
An empty Squirrel table becomes a non-null empty native table. Pass `null` only
when the callable's GI annotation permits it.

Supported arguments have direction `in` and transfer `none` or `full`. SQGI
copies keys and string values into native storage. Changes to the original
Squirrel table do not alter the native copy, including when an asynchronous
callee retains it. SQGI manages the native references according to the callable's
ownership contract; application code does not free the native hash table.

Other key/value types, container-only transfer, `inout` hash arguments and direct
hash-table field assignment are unsupported and raise a conversion error.
Check the library's GI reference for its expected key/value types and nullability.

For libsecret, install its typelib and ensure a Secret Service is available in
your session. Import the namespace with `import("Secret", "1")`. SQGI handles
libsecret's asynchronous attribute ownership; pass ordinary Squirrel tables.
