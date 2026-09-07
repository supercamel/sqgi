local Msys2 = import("../sqgipkg_lib/windows/msys2.nut")
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

local msys2 = Msys2.SqgiPkgWindowsMsys2()
check("windows host detection uses system module", msys2.is_windows_shell() == (RuntimeSystem.os.family == "windows"))

if (failures > 0) return 1

print("sqgipkg platform helper tests passed\n")
return 0
