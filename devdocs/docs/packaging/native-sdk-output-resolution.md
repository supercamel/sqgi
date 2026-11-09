# Cross-build SDK output resolution

Native Meson recipes must export target library aliases and generated GI metadata
into the private SDK without looking in the invoking process's working directory.
Meson may report a versioned-library alias as a basename. Resolve it uniquely
within the recipe build tree and reject traversal, ambiguity or a symlink escaping
that tree. Never substitute a host shared library for a missing target library.

Host-GI recipes generate target GIR/typelib metadata at the build root even when
Meson's install plan names a subdirectory. Resolve these missing metadata outputs
within the target build tree. Existing host fallback remains limited to Vala
`.vapi`/`.deps` text. Missing or ambiguous target outputs remain errors.

Host-GI metadata preserves every declared shared library in namespace order.
Library mapping prefers the exact SONAME or matching Windows ABI suffix, including
nonzero and dotted Meson `soversion` values such as `libfoo-3.dll` and
`libfoo-3.2.dll`. When the target uses a different ABI suffix, resolve its available
library without matching unrelated helper libraries or import archives.

Regression: `python3 tools/sqgipkg_tests/test_native_sdk.py`, including a real
versioned-library symlink, relocated target metadata, duplicate-name rejection,
traversal rejection and the existing host-library substitution rejection.
The GI mapping regression runs as CTest `sqgi_test_host_gi_libraries` and in
`tools/sqgipkg_tests/run_tests.sh`; it can also be run directly with
`build/sqgi tools/sqgipkg_tests/host_gi_libraries.nut`.
