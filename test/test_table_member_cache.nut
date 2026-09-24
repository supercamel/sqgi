// Regression: filling a four-slot table moves cached members during
// rehash. Keep these keys and the reads between insertions from the report.
local t = {}
function read() { return t.ap_telem.value.modelId }
t.ap_telem <- { value = { modelId = 2 } }
if (read() != 2) throw "initial member lookup"
t.gps_telem <- { value = { latitude = 1 } }
t.home_coordinates <- { value = { lat = 1 } }
if (read() != 2) throw "member lookup before growth"
t.telemetry <- { value = { airspeed = 4 } }
if (read() != 2) throw "member lookup after growth"

// PREPCALLK uses the same cache for methods. A stale hit here must not call
// another closure that happens to occupy the method's former slot.
local methods = {}
function invoke() { return methods.ap_telem() }
methods.ap_telem <- function() { return 2 }
if (invoke() != 2) throw "initial method lookup"
methods.gps_telem <- function() { return 3 }
methods.home_coordinates <- function() { return 4 }
if (invoke() != 2) throw "method lookup before growth"
methods.telemetry <- function() { return 5 }
if (invoke() != 2) throw "method lookup after growth"

// Reuse the warmed access sites through further growth and value replacement.
for (local i = 0; i < 128; i++) {
    t[i] <- { value = { modelId = -1 } }
    methods[i] <- function() { return -1 }
    if (read() != 2 || invoke() != 2) throw "cached lookup during growth"
}
t.ap_telem = { value = { modelId = 7 } }
methods.ap_telem = function() { return 7 }
if (read() != 7 || invoke() != 7) throw "cached lookup after replacement"

print("table member cache tests passed\n")
