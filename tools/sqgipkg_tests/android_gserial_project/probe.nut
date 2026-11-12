local Serial = import("GSerial", "1.0")
return { check = function() {
    local manager = Serial.DeviceManager.new(), devices = manager.list_devices()
    assert(devices == null || devices.len() == 0)
    local uri = "usb://ffff:ffff/sSQGI-NONEXISTENT/0", errors = []
    local reject = function(callback) {
        local message = null
        try { callback() } catch (error) { message = error.tostring() }
        assert(message != null && message.find("USB adapter is unavailable") != null)
        errors.append(message)
    }
    reject(function() { manager.lookup(uri) })
    reject(function() { manager.request_permission(uri) })
    manager.cancel_permission()
    local port = Serial.Port.new(); port.set_baud(57600)
    reject(function() { port.open_full(uri) })
    assert(!port.is_open()); port.close()
    return { devices = 0, rejected_operations = errors, closed = true, cancelled = true }
} }
