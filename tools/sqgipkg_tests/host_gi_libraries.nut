local recipes = import("../sqgipkg_lib/recipes.nut").SqgiPkgRecipes()

function check_mapping(declared, available, expected) {
    local actual = recipes.target_gi_libraries(declared, available)
    if (actual != expected)
        throw "Host GI mapping for " + declared + ": expected " + expected + ", got " + actual
}

function check_missing(declared, available) {
    local refused = false
    try { recipes.target_gi_libraries(declared, available) }
    catch (e) {
        if (e.tostring().find("GI target library not found") == null) throw e
        refused = true
    }
    if (!refused) throw "Host GI mapping accepted missing library: " + declared
}

local names = "libgworldscene-core-0.1.so.0,libgworldscene-gtk4-0.1.so.0"
check_mapping(names,
    ["/target/libgworldscene-gtk4-0.1-0.dll", "/target/libgworldscene-core-0.1-0.dll"],
    "libgworldscene-core-0.1-0.dll,libgworldscene-gtk4-0.1-0.dll")
check_mapping("libgapx-1.0.so", ["/target/libgapx-1.0.dll"], "libgapx-1.0.dll")

// Meson uses the declared soversion in Windows DLL filenames, including
// nonzero and dotted versions. Prefer that ABI over other available versions.
foreach (abi in ["3", "12", "3.2"]) {
    local dll = "libfoo-" + abi + ".dll"
    check_mapping("libfoo.so." + abi, ["/target/" + dll], dll)
    check_mapping("libfoo.so." + abi, ["/target/libfoo-0.dll", "/target/" + dll], dll)
}
check_mapping("libfoo.so", ["/target/libfoo-3.dll"], "libfoo-3.dll")
check_mapping("libfoo.so.3", ["/target/libfoo-4.dll"], "libfoo-4.dll")
check_mapping("libfoo.so.1", ["/target/libfoo.so", "/target/libfoo.so.1"], "libfoo.so.1")

check_missing(names, ["/target/libgworldscene-gtk4-0.1-0.dll"])
check_missing("libfoo.so.3", ["/target/libfoo-helper-3.dll", "/target/libfoo-3.dll.a"])
print("PASS host GI library mapping tests\n")
