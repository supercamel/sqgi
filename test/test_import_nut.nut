// test/test_import_nut.nut — Import another .nut file
local result = import("test/helper.nut");
print("helper returned: " + result + "\n");
if (result == 42) {
    print("test_import_nut.nut passed\n");
} else {
    print("FAIL\n");
    return 1;
}
