local GLib = import("GLib")
local text = dofile(vargv[0] + ".nut")
local operation = vargv[1]
local n = vargv[2].tointeger()
local value = sqgi.json.parse(text)
local last = null
function batch(operation, n, text, value) {
    local checksum = 0
    local last = null
    if (operation == "parse") {
        for (local i = 0; i < n; i++) {
            last = sqgi.json.parse(text)
            checksum += last.marker
        }
    } else if (operation == "stringify") {
        for (local i = 0; i < n; i++) {
            last = sqgi.json.stringify(value)
            checksum += last.len()
        }
    } else {
        for (local i = 0; i < n; i++) {
            last = sqgi.json.parse(sqgi.json.stringify(value))
            checksum += last.marker
        }
    }
    return [checksum, last]
}
batch(operation, n, text, value)
local start = GLib.get_monotonic_time()
local result = batch(operation, n, text, value)
local elapsed = GLib.get_monotonic_time() - start
print(format("%.3f\t%d\n", elapsed.tofloat() * 1000.0 / n, result[0]))
print((operation == "stringify" ? result[1] : sqgi.json.stringify(result[1])) + "\n")
