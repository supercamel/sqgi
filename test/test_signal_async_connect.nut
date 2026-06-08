// test/test_signal_async_connect.nut
//
// Regression test: a signal handler connected from inside an `async function`
// must keep working after the async coroutine thread that registered it has
// finished and been garbage-collected.
//
// `async function` bodies run on a fresh Squirrel coroutine thread (sq_newthread).
// sqgi_signal_connect used to stash that calling HSQUIRRELVM in the GClosure.
// Once the coroutine completed and was collected, a later signal emit (or
// disconnect) dispatched the marshal against the freed thread VM, causing a
// use-after-free / segfault. The connect path must anchor to the long-lived
// root VM instead.

local Gio = import("Gio")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

fired <- 0

local c = Gio.Cancellable.new()

// Connect the handler from within an async coroutine thread.
async function install_handler() {
    c.connect("cancelled", function() { ::fired += 1 })
}

install_handler()

// Force the async coroutine thread to be torn down so a stale VM pointer
// would now dangle.
collectgarbage()
collectgarbage()

// Emit the signal from the main VM thread. Pre-fix this dereferenced the
// freed coroutine VM stored in the closure and crashed.
c.cancel()

check(fired == 1, "handler connected from async thread must fire, fired=" + fired)

print("test_signal_async_connect.nut passed\n")
