local GSerial = import("GSerial", "1.0")
local GLib = import("GLib")
local system = import("system")
local checks = [], failures = 0
function check(name, ok, observed) {
    checks.push({ name = name, ok = ok, observed = observed })
    if (!ok) failures++
    print((ok ? "PASS " : "FAIL ") + name + ": " + observed.tostring() + "\n")
}
local device = GLib.getenv("SQGI_STUDY_SERIAL_DEVICE")
if (device == null || device == "") throw "Set SQGI_STUDY_SERIAL_DEVICE to the study-owned serial endpoint"
print("STUDY_ENV " + sqgi.json.stringify({ architecture = system.cpu.arch,
    packaged = system.package.packaged, runtime = system.runtime,
    device = device, typelib_path = GLib.getenv("GI_TYPELIB_PATH"),
    library_path = GLib.getenv("LD_LIBRARY_PATH") }) + "\n")
local port = GSerial.Port.new(), connected = 0, disconnected = 0, data_signals = 0
local received = "", timed_out = false, loop = GLib.MainLoop.new(null, false)
port.connect("connected", function() { connected++ })
port.connect("disconnected", function() { disconnected++ })
port.connect("on-data", function(available) {
    data_signals++
    received += port.read_string(available)
    if (received.find("peer-pong\n") != null) loop.quit()
})
try {
    check("starts closed", !port.is_open(), port.is_open())
    port.set_baud(115200); port.set_timeout(100)
    check("baud setting", port.get_baud() == 115200, port.get_baud())
    check("open endpoint", port.open(device), port.is_open())
    check("connected signal", connected == 1, connected)
    local payload = "sqgi-ping\n", written = port.write_string(payload)
    check("write byte count", written == payload.len(), written)
    sqgi.timeout_add(5000, function() { timed_out = true; loop.quit(); return false })
    loop.run()
    check("read within deadline", !timed_out, timed_out)
    check("data signal", data_signals > 0, data_signals)
    check("peer response", received == "peer-pong\n", received)
    port.close()
    check("closed endpoint", !port.is_open(), port.is_open())
    check("disconnected signal", disconnected == 1, disconnected)
} catch (e) { check("serial invocation", false, e.tostring()); if (port.is_open()) port.close() }
print("STUDY_RESULT " + sqgi.json.stringify({ failures = failures, checks = checks }) + "\n")
if (failures) throw "Serial consumer failed " + failures + " checks"
