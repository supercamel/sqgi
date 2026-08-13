// Regression test for intermediate sq_wakeupvm return values accumulating on
// an async coroutine's stack. Each successful wake that suspends at the next
// await must discard that intermediate value; otherwise enough sequential
// awaits overflow the fixed-size thread stack and crash in SQVM::Push.

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

local AWAIT_PAIRS = 2048
local loop = GLib.MainLoop.new(null, false)
local result = null
local err = null

async function many_sequential_awaits() {
    for (local i = 0; i < AWAIT_PAIRS; i++) {
        // Task settlement resumes through sqgi_wake_idle_cb.
        local task_elapsed = await sqgi.sleep(0)
        check(task_elapsed >= 0, "sqgi.sleep returned a negative duration")

        // Awaiting an integer resumes through sqgi_await_timeout_cb.
        local timeout_elapsed = await 0
        check(timeout_elapsed >= 0, "integer await returned a negative duration")
    }
    return AWAIT_PAIRS * 2
}

many_sequential_awaits().then(
    function(value) {
        result = value
        loop.quit()
    },
    function(error) {
        err = error
        loop.quit()
    }
)

loop.run()

check(err == null, "sequential awaits rejected: " + err)
check(result == AWAIT_PAIRS * 2,
      "wrong final result: got " + result +
      ", expected " + (AWAIT_PAIRS * 2))

print("test_async_stack_balance.nut passed (" + result +
      " sequential awaits)\n")
