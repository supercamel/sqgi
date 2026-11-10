local Gtk = import("Gtk", "4.0"), Gio = import("Gio"), GLib = import("GLib")
local Android = import("SqAndroid", "1.0")
local app = Gtk.Application.new("org.sqgi.demo.sensors", Gio.ApplicationFlags.non_unique)
local window = null, device = null, sensors = null, items = [], alive = true
local units = {[1]="m/s²", [2]="µT", [4]="rad/s", [5]="lx", [6]="hPa", [8]="cm",
    [9]="m/s²", [10]="m/s²", [12]="%", [13]="°C", [14]="µT", [16]="rad/s", [19]="steps"}
function box(vertical, gap=10) { return Gtk.Box.new(vertical ? Gtk.Orientation.vertical : Gtk.Orientation.horizontal, gap) }
function label(text, style=null) {
    local item = Gtk.Label.new(text); item.set_xalign(0); item.set_wrap(true)
    if (style != null) item.add_css_class(style)
    return item
}
function values(reading) {
    local state = reading.get_state(), data = reading.get_values(), type = reading.get_sensor_type()
    if (state != "Live" || !data.len()) return state
    local text = "", axes = ["X", "Y", "Z"]
    foreach (i, value in data) {
        if (i) text += " · "
        text += (data.len() > 1 && i < 3 ? axes[i] + " " : "") + format("%.3f", value)
    }
    return text + (type in units ? " " + units[type] : "")
}
app.connect("activate", function() {
    if (window != null) { window.present(); return }
    window = Gtk.ApplicationWindow.new(app); window.set_title("Phone Sensors"); window.set_default_size(430, 820)
    local css = Gtk.CssProvider.new(); css.load_from_path("style.css")
    Gtk.StyleContext.add_provider_for_display(window.get_display(), css, 600)
    local page = box(true, 14); page.add_css_class("page")
    page.append(label("PHONE SENSORS", "eyebrow")); page.append(label("Motion. Direction. Position.", "title"))
    local status = label("Connecting to Android sensors…", "muted"); page.append(status)
    local compass_card = box(true, 5); compass_card.add_css_class("card")
    local direction = label("Magnetic heading · waiting", "heading"); compass_card.append(direction)
    local compass = Gtk.DrawingArea.new(); compass.set_content_height(160); compass.set_hexpand(true)
    local heading = null
    compass.set_draw_func(function(widget, cr, width, height) {
        local x = width/2.0, y = height/2.0, r = height*0.39
        cr.set_source_rgba(0.25, 0.37, 0.39, 1); cr.set_line_width(2); cr.arc(x, y, r, 0, 6.283185); cr.stroke()
        for (local i=0; i<12; i++) {
            local angle=i*6.283185/12
            cr.move_to(x+sin(angle)*r*0.9, y-cos(angle)*r*0.9)
            cr.line_to(x+sin(angle)*r, y-cos(angle)*r); cr.stroke()
        }
        if (heading == null) return
        cr.save(); cr.translate(x, y); cr.rotate(-heading*3.14159265/180)
        cr.set_source_rgba(0.96, 0.66, 0.40, 1)
        cr.move_to(0,-r*0.85); cr.line_to(-r*0.15,r*0.25); cr.line_to(r*0.15,r*0.25); cr.close_path(); cr.fill()
        cr.set_source_rgba(0.53, 0.80, 0.72, 1)
        cr.move_to(0,r*0.75); cr.line_to(-r*0.15,r*0.25); cr.line_to(r*0.15,r*0.25); cr.close_path(); cr.fill(); cr.restore()
    }, null, function(unused){})
    compass_card.append(compass); compass_card.append(label("Heading of the phone’s top edge · keep away from magnets", "muted")); page.append(compass_card)
    local readings = {}
    foreach (spec in [[1,"Accelerometer"], [4,"Gyroscope"], [2,"Magnetic field"], [5,"Ambient light"], [8,"Proximity"], [6,"Pressure"]]) {
        local card=box(true,4); card.add_css_class("card"); card.append(label(spec[1],"heading"))
        local value=label("Unavailable on this device","reading"); card.append(value); page.append(card); readings[spec[0]] <- value
    }
    local gps=box(true,7); gps.add_css_class("card"); gps.append(label("GPS / location","heading"))
    local position=label("Off · enable to request foreground location access","reading"); gps.append(position)
    local gps_actions=box(false,8), enable=Gtk.Button.new_with_label("Enable location"), disable=Gtk.Button.new_with_label("Stop")
    enable.set_hexpand(true); enable.connect("clicked",function(){ if(device!=null) device.request_location() })
    disable.connect("clicked",function(){ if(device!=null) device.stop_location() })
    gps_actions.append(enable); gps_actions.append(disable); gps.append(gps_actions); page.append(gps)
    local expand=Gtk.Expander.new("All sensors"), details=box(true,8), all=[]
    expand.set_child(details); page.append(expand)
    page.append(label("Device axes: X points right, Y toward the top, Z out of the screen. Readings and location stay in this app.","muted"))
    local scroll=Gtk.ScrolledWindow.new(); scroll.set_policy(Gtk.PolicyType.never,Gtk.PolicyType.automatic); scroll.set_child(page)
    window.set_child(scroll); window.present()
    GLib.timeout_add(GLib.PRIORITY_DEFAULT,200,function(){
        if(!alive) return false
        try {
            if(device==null) device=Android.Device.new(window.get_surface())
            if(sensors==null) {
                sensors=Android.Sensors.new(window.get_surface(),app.get_application_id())
                items=sensors.get_items(); sensors.start()
            }
            local snapshot=sqgi.json.parse(device.snapshot()), seen={}
            status.set_label(items.len()+" sensors reported by Android"+(sensors.is_active()?" · Live":" · Paused"))
            if(!all.len()) foreach(sensor in items) {
                local item=label("","reading"); item.add_css_class("card"); details.append(item); all.push(item)
            }
            foreach(i,sensor in items) {
                local type=sensor.get_sensor_type()
                if(type in readings && !(type in seen)) { readings[type].set_label(values(sensor)); seen[type] <- true }
                all[i].set_label(sensor.get_name()+"\n"+sensor.get_vendor()+" · "+sensor.get_kind()+"\n"+values(sensor)+
                    format("\nResolution %.6f · %s",sensor.get_resolution(),sensor.is_wake_up()?"Wake-up sensor":"Non-wake-up sensor"))
            }
            heading=sensors.get_heading(); if(heading<0) heading=null
            direction.set_label(heading==null?"Magnetic heading · unavailable":format("Magnetic heading · %.0f°",heading)); compass.queue_draw()
            local fix=snapshot.location, text=fix.state
            if("latitude" in fix) {
                text+=format("\n%.6f°, %.6f°\nAccuracy ±%.0f m · %s · %.0f s ago",fix.latitude,fix.longitude,
                    fix.accuracy,fix.provider,fix.age_ms/1000.0)
                if("altitude" in fix) text+=format("\nAltitude %.1f m",fix.altitude)
            }
            if(fix.state!="Off" && !fix.precise) text+="\nApproximate location access"
            position.set_label(text)
        } catch(error) { status.set_label(error.tostring()) }
        return true
    })
})
app.connect("shutdown",function(){ alive=false; if(sensors!=null) sensors.stop(); if(device!=null) device.stop_location() })
app.run(0,null)
