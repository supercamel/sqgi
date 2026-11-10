local Gio = import("Gio"), GLib = import("GLib")

function addresses(text) {
    local parts = split(strip(text), "/")
    if (!regexp("^[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+(/[0-9]+)?$").match(strip(text)))
        throw "Enter an IPv4 address or a subnet such as 192.168.1.0/24."
    local prefix = parts.len() == 2 ? parts[1].tointeger() : 32
    if (prefix < 24 || prefix > 32) throw "Choose a subnet from /24 to /32 (at most 256 addresses)."
    local number = 0
    foreach (part in split(parts[0], ".")) {
        local value = part.tointeger()
        if (value < 0 || value > 255) throw "Each IPv4 number must be between 0 and 255."
        number = (number << 8) | value
    }
    local size = 1 << (32 - prefix), first = number & (0xffffffff << (32 - prefix)), result = []
    for (local offset = size > 2 ? 1 : 0; offset < size - (size > 2 ? 1 : 0); offset++) {
        local ip = first + offset
        result.push(format("%d.%d.%d.%d", (ip >> 24) & 255, (ip >> 16) & 255, (ip >> 8) & 255, ip & 255))
    }
    return result
}
function ports(text) {
    if (!regexp("^ *[0-9]+ *(, *[0-9]+ *)*$").match(text)) throw "Enter TCP ports separated by commas."
    local result = []
    foreach (part in split(text, ",")) {
        local value = strip(part)
        if (!regexp("^[0-9]+$").match(value)) throw "Every TCP port must be a number."
        local port = value.tointeger()
        if (port < 1 || port > 65535) throw "TCP ports must be between 1 and 65535."
        if (result.find(port) == null) result.push(port)
    }
    if (!result.len() || result.len() > 16) throw "Choose between 1 and 16 TCP ports."
    return result
}
function start(hosts, ports, on_result, on_progress, on_done) {
    local state = {cancelled=false, active=0, next=0, complete=0, total=hosts.len()*ports.len(), tokens={}}
    local pump = null
    local cancel = function() {
        if (state.cancelled) return
        state.cancelled = true
        foreach (id, token in state.tokens) token.cancel()
    }
    pump = function() {
        while (!state.cancelled && state.active < 8 && state.next < state.total) {
            local id = state.next++, host = hosts[id / ports.len()], port = ports[id % ports.len()]
            local token = Gio.Cancellable.new(), client = Gio.SocketClient.new()
            client.set_enable_proxy(false); client.set_timeout(1)
            state.tokens[id] <- token; state.active++
            local started = GLib.get_monotonic_time()
            client.connect_to_host_async(host, port, token, function(source, result) {
                local latency = null
                try {
                    local connection = source.connect_to_host_finish(result)
                    latency = (GLib.get_monotonic_time() - started) / 1000.0
                    connection.close(null)
                } catch (unused) {}
                delete state.tokens[id]; state.active--; state.complete++
                if (!state.cancelled) {
                    if (latency != null) on_result(host, port, latency)
                    on_progress(state.complete, state.total)
                }
                pump()
            })
        }
        if (!state.active && (state.cancelled || state.next == state.total)) on_done(state.cancelled)
    }
    pump()
    return {cancel=cancel, state=state}
}
return {addresses=addresses, ports=ports, start=start}
