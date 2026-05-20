// test/test_import_nut.nut — Import another .nut file
local result = import("test/helper.nut");
print("helper returned: " + result + "\n");

local nested = import("test/import_relative/child.nut")
print("relative child returned: " + nested + "\n")

local GLib = import("GLib")
GLib.setenv("SQGI_APP_SHARE", "test", true)

local app_share_result = import("helper.nut")
print("SQGI_APP_SHARE helper returned: " + app_share_result + "\n")

if (result == 42 && nested == "relative sibling" && app_share_result == 42) {
    print("test_import_nut.nut passed\n");
} else {
    print("FAIL\n");
    return 1;
}
