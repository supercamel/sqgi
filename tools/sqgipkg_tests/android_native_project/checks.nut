local GLib = import("GLib", "2.0")
local Mobile = import("SqMobile", "1.0")
local Cpp = import("SqMobileCpp", "1.0")
local Vala = import("SqMobileVala", "1.0")
local Rust = import("SqMobileRust", "1.0")

function check(condition, message) { if (!condition) throw message }

async function check_c_worker() {
    local worker = Mobile.Worker.new("C worker"), c_signals = []
    check(worker["label"] == "C worker", "C GObject property getter")
    worker["label"] = "updated"
    check(worker["label"] == "updated", "C GObject property setter")
    local handler = worker.connect("progressed", function(value) { c_signals.push(value) })
    worker.emit_progress(7)
    local c_result = await worker.sum_async(19, 23, null)
    check(c_result == 42 && c_signals.len() == 2 && c_signals[1] == 42, "C async and signal callback")
    local c_error = false
    try { await worker.sum_async(-1, 1, null) } catch (e) { c_error = true }
    check(c_error, "C async GError")
    worker.disconnect(handler)
    return { signals = c_signals.len(), result = c_result }
}

async function run_checks() {
    check(Mobile.sum(19, 23) == 42, "C call")
    check(Cpp.sum(20, 22) == 42, "C++ dependency call")
    check(Cpp.contains_exception(), "C++ exception boundary")
    check(Rust.sum(21, 21) == 42 && Rust.width() == 8, "Rust C ABI/dependency")
    local abi = Mobile.abi(), layout = Mobile.Layout()
    layout.marker = 7; layout.value = 123456789
    check(layout.read() == 123456789, "target-specific record field offset")
    local expected_size = abi == "arm64-v8a" ? 32 : 24
    check(Mobile.Layout.size() == expected_size, "target-specific record size")
    local before = Mobile.alive_count(), c = await check_c_worker()
    await sqgi.sleep(1)
    collectgarbage()
    check(Mobile.alive_count() == before, "C GObject finalization: " + Mobile.alive_count() + " != " + before)
    local vala = Vala.Worker.new("Vala worker"), vala_signals = []
    vala.connect("progressed", function(value) { vala_signals.push(value) })
    check(vala["label"] == "Vala worker", "Vala property")
    local vala_result = await vala.sum_async(18, 24)
    check(vala_result == 42 && vala_signals.len() == 1, "Vala async/dependent VAPI/signal")
    local vala_error = false
    try { await vala.sum_async(-1, 1) } catch (e) { vala_error = true }
    check(vala_error, "Vala async GError")
    return { passed = true, abi = abi, layout_size = expected_size, c_signals = c.signals,
        vala_signals = vala_signals.len(), c_finalized = true, cpp_exception_contained = true,
        rust_pointer_size = Rust.width(), c_async = c.result, vala_async = vala_result }
}
return { run = run_checks }
