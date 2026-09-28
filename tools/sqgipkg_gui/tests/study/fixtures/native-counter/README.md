# Native counter study fixture

This is source for track C1, not a pre-authored packaging manifest. Copy it to
the study workspace, build `native/` with Meson, and use that build directory
in `GI_TYPELIB_PATH` and `LD_LIBRARY_PATH` for the source baseline. Create the
packaging manifest through the real GUI, including its native Meson recipe.

The SQGI consumer checks construction, a read/write property, the `add(2)`
method returning 42, a signal with one integer argument, and a compiled source
revision. Any failed assertion exits nonzero. It has no desktop dependency.

For the rebuild variant, change the return value in
`study_counter_get_revision()` from 42 to 43 in the workspace source copy;
run with `SQGI_STUDY_EXPECT_REVISION=43`. Retain initial/rebuilt artifact hashes
and target architectures. Reusing an old library must fail this assertion.

The native API is deliberately identical on Linux and Windows, making explicit
host GI generation a valid candidate to test. A successful host source run is
not proof that target metadata, target DLL/ELF files, or packaged imports work.
