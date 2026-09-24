// A native callback must outlive the coroutine that registered it.
local GLib = import("GLib")
local called = 0
async function install_callback() {
    GLib.idle_add(0, function() { called++; return false })
}
install_callback()
collectgarbage()
collectgarbage()
GLib.MainContext.default().iteration(false)
if (called != 1) throw "native callback did not run after async completion"

// Legacy calls may supply closure data and a destroy callback explicitly.
// The binding replaces the destroy notifier to manage its own callback data;
// the unused script closure must be released when registration returns.
local legacy_called = 0
function install_legacy_callback() {
    local marker = {}
    local weak = marker.weakref()
    GLib.idle_add(0, function() { legacy_called++; return false },
                  null, function(_) { return marker })
    return weak
}
local unused = install_legacy_callback()
collectgarbage()
assert(unused.ref() == null, "overridden destroy callback must not retain its closure")
GLib.MainContext.default().iteration(false)
assert(legacy_called == 1, "legacy callback did not run")
print("test_callback_async_lifetime.nut passed\n")
