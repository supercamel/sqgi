local Gtk = import("Gtk", "4.0"), Gio = import("Gio"), GLib = import("GLib")
local Scanner = import("scanner.nut")
local app = Gtk.Application.new("org.sqgi.demo.ipscanner", Gio.ApplicationFlags.non_unique)
local window = null, scan = null, service = null
function box(vertical, gap=10) { return Gtk.Box.new(vertical ? Gtk.Orientation.vertical : Gtk.Orientation.horizontal, gap) }
function label(text, style=null) {
    local item = Gtk.Label.new(text); item.set_xalign(0); item.set_wrap(true)
    if (style != null) item.add_css_class(style)
    return item
}
app.connect("activate", function() {
    if (window != null) { window.present(); return }
    window = Gtk.ApplicationWindow.new(app); window.set_title("IP Scanner"); window.set_default_size(420, 780)
    local css = Gtk.CssProvider.new(); css.load_from_path("style.css")
    Gtk.StyleContext.add_provider_for_display(window.get_display(), css, 600)
    local root = box(true, 14); root.add_css_class("page")
    root.append(label("IP SCANNER", "eyebrow")); root.append(label("Find what's listening.", "title"))
    root.append(label("Scan an IPv4 address or subnet for open TCP ports.", "muted"))
    local fields = box(true, 7); fields.add_css_class("card")
    fields.append(label("IP address / subnet", "caption"))
    local target = Gtk.Entry.new(); target.set_text("192.168.1.0/24"); fields.append(target)
    fields.append(label("TCP ports", "caption"))
    local ports = Gtk.Entry.new(); ports.set_text("22, 80, 443, 8080"); fields.append(ports)
    local actions = box(false, 8)
    local start = Gtk.Button.new_with_label("Scan"), stop = Gtk.Button.new_with_label("Stop")
    start.add_css_class("suggested-action"); start.set_hexpand(true); stop.set_sensitive(false)
    actions.append(start); actions.append(stop); fields.append(actions)
    local local_demo = Gtk.Button.new_with_label("Try a local demo"); fields.append(local_demo); root.append(fields)
    local status = label("Ready", "status"), progress = Gtk.ProgressBar.new()
    root.append(status); root.append(progress)
    local results = box(true, 7); root.append(results)
    root.append(label("A successful TCP connection confirms an open port. A device may be online even when none of these ports respond.", "muted"))
    local rows = {}, count = 0
    local busy = function(value) {
        start.set_sensitive(!value); stop.set_sensitive(value); local_demo.set_sensitive(!value)
        target.set_sensitive(!value); ports.set_sensitive(!value)
    }
    local begin = function() {
        if (scan != null) return
        local hosts, selected
        try { hosts = Scanner.addresses(target.get_text()); selected = Scanner.ports(ports.get_text()) }
        catch (error) { status.set_label(error.tostring()); return }
        local child
        while ((child = results.get_first_child()) != null) results.remove(child)
        rows.clear(); count = 0; progress.set_fraction(0); busy(true)
        status.set_label("Scanning " + hosts.len() + " addresses…")
        scan = Scanner.start(hosts, selected, function(host, port, latency) {
            count++
            if (!(host in rows)) {
                local card = box(true, 3); card.add_css_class("result")
                card.append(label(host, "host")); local detail = label("", "muted"); card.append(detail)
                results.append(card); rows[host] <- {detail=detail, text=""}
            }
            local row = rows[host]
            row.text += (row.text == "" ? "" : "\n") + format("TCP %d · %.1f ms", port, latency)
            row.detail.set_label(row.text)
        }, function(done, total) {
            progress.set_fraction(done.tofloat()/total)
            status.set_label(format("%d / %d checks · %d open ports", done, total, count))
        }, function(cancelled) {
            scan = null; busy(false)
            status.set_label((cancelled ? "Stopped" : "Complete") + " · " + rows.len() +
                (rows.len()==1 ? " host with " : " hosts with ") + count + (count==1 ? " open port" : " open ports"))
            print("IP Scanner: " + status.get_label() + "\n")
        })
    }
    start.connect("clicked", begin)
    stop.connect("clicked", function() { if (scan != null) { scan.cancel(); status.set_label("Stopping…") } })
    local_demo.connect("clicked", function() {
        try {
            if (service != null) { service.stop(); service.close() }
            service = Gio.SocketService.new()
            local address = Gio.InetSocketAddress.new(Gio.InetAddress.new_loopback(Gio.SocketFamily.ipv4), 0)
            local bound = service.add_address(address, Gio.SocketType.stream, Gio.SocketProtocol.tcp, null)
            service.connect("incoming", function(connection, source) { connection.close(null); return true })
            service.start(); target.set_text("127.0.0.1/32"); ports.set_text(bound.get_port().tostring()); begin()
        } catch (error) { status.set_label(error.tostring()) }
    })
    local scroll=Gtk.ScrolledWindow.new(); scroll.set_policy(Gtk.PolicyType.never,Gtk.PolicyType.automatic)
    scroll.set_child(root); window.set_child(scroll); window.present()
})
app.connect("shutdown", function() {
    if (scan != null) scan.cancel()
    if (service != null) { service.stop(); service.close() }
})
app.run(0, null)
