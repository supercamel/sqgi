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
print("test_callback_async_lifetime.nut passed\n")
