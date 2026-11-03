local Packages = import("../sqgipkg_lib/windows/packages.nut")
local RuntimeSystem = import("system")

local failures = 0

function check(name, ok) {
    if (ok) {
        print("PASS: " + name + "\n")
    } else {
        print("FAIL: " + name + "\n")
        failures++
    }
}

local packages = Packages.SqgiPkgWindowsPackages()
check("windows host detection uses system module", packages.is_windows_shell() == (RuntimeSystem.os.family == "windows"))

if (failures > 0) return 1

print("sqgipkg platform helper tests passed\n")
return 0
