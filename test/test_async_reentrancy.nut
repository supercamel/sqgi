// test/test_async_reentrancy.nut
//
// Runtime regression test for the "nested main-loop dispatch during pending
// async wake" crash. See demo/soup/vget.nut for the original symptom: a
// blocking C call (Soup's HTTPS read_bytes) spins a nested main-loop
// iteration internally while waiting for I/O. During that nested
// iteration, GLib happily dispatches any source whose ready-time has
// arrived — including the `g_idle_add` waker that our `await sqgi.sleep`
// uses. Naively waking the Squirrel thread (re-entering sq_wakeupvm while
// the thread is still on the C stack of the outer call) corrupts the VM
// and segfaults.
//
// This test exercises the exact pattern in pure Squirrel + GLib so it
// catches regressions independently of Soup, TLS, or any network state:
//
//   1. An async body runs. It launches several concurrent async siblings,
//      each with their own pending `sqgi.sleep(...)` wakes.
//   2. The body then spins the default `MainContext` in a synchronous
//      drain loop — this is what Soup does inside a blocking read.
//   3. During the drain, every sibling's timeout fires, every sibling's
//      then-handler dispatches, every then-handler may itself await.
//   4. We do this many times to stress GC / waiter-table / coroutine-state
//      interactions.
//
// If the runtime mishandles a wake delivered during nested iteration,
// this test will SIGSEGV. If it stays correct, all siblings resolve and
// the test prints a single success line.

local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

local ITERS    = 40   // outer iterations
local SIBLINGS = 8    // concurrent awaits per iteration
local ctx      = GLib.MainContext.default()

// Drain all currently-pending sources on the default context. This is the
// closest analogue to what a blocking C call (Soup, GnuTLS, etc.) does
// while waiting for I/O.
function drain_loop_nonblocking() {
    local pumped = 0
    while (ctx.iteration(false)) {
        pumped++
        if (pumped > 10000) break  // safety
    }
}

async function sibling(id, ms) {
    await sqgi.sleep(ms)
    return id
}

async function stress_iteration(iter_index) {
    // Kick off SIBLINGS concurrent async tasks with staggered wakes.
    local tasks = []
    for (local i = 0; i < SIBLINGS; i++) {
        tasks.push(sibling(iter_index * 100 + i, i + 1))  // 1..SIBLINGS ms
    }

    // Force nested-loop iteration BEFORE awaiting — this is the danger
    // window where Soup-style callers would normally segfault.
    drain_loop_nonblocking()

    // Now collect every sibling's result. Each `await` may re-enter the
    // dispatch path, settle a downstream Task, and fire more idle callbacks.
    local sum = 0
    foreach (t in tasks) {
        sum += await t
    }
    return sum
}

local L = GLib.MainLoop.new(null, false)

async function driver() {
    local total = 0
    for (local k = 0; k < ITERS; k++) {
        total += await stress_iteration(k)
        // Periodically force another drain mid-driver too.
        if ((k % 5) == 0) drain_loop_nonblocking()
    }
    return total
}

local result = null
local err = null
driver()
    .then(function(v) { result = v; L.quit() })
    .catch(function(e) { err = e; L.quit() })

L.run()

check(err == null, "driver rejected: " + err)

// Expected: each iteration sums siblings 0..(SIBLINGS-1) offset by k*100.
local expected = 0
for (local k = 0; k < ITERS; k++) {
    for (local i = 0; i < SIBLINGS; i++) expected += k * 100 + i
}
check(result == expected,
      "result mismatch: got " + result + " expected " + expected)

print("test_async_reentrancy.nut passed (" +
      ITERS + " iters × " + SIBLINGS + " siblings = " +
      (ITERS * SIBLINGS) + " interleaved awaits across nested iterations)\n")
