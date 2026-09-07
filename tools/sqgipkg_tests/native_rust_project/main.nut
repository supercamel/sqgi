local system = import("system")

if (system.os.name != "linux") {
    print("native Rust GI demo skipped on " + system.os.name + "\n")
    return 0
}

local SqRust = import("SqRust", "1.0")

function require_true(condition, message) {
    if (!condition) throw message
}

local counter = SqRust.Counter.new()
local changed = []

counter.connect("changed", function(value) {
    changed.push(value)
})

require_true(counter.get_value() == 0, "initial counter value was not zero")
require_true(counter.add(7) == 7, "first add failed")
require_true(counter.add(35) == 42, "second add failed")
require_true(counter.get_value() == 42, "counter did not retain value")
require_true(counter.describe() == "RustCounter<42>", "describe returned unexpected text")
require_true(changed.len() == 2, "expected 2 changed signals")
require_true(changed[0] == 7 && changed[1] == 42, "changed signal payloads were wrong")

print("native Rust GI counter value=" + counter.get_value() +
    "; signals=" + changed.len() + "\n")
return 0
