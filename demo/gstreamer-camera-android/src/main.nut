local Gtk=import("Gtk", "4.0"), Gio=import("Gio"), GLib=import("GLib")
local Android=import("SqAndroid", "1.0"), Video=import("video.nut")
local app=Gtk.Application.new("org.sqgi.demo.camera",Gio.ApplicationFlags.non_unique)
local window=null, device=null, stream=null, alive=true
function box(vertical,gap=10) { return Gtk.Box.new(vertical?Gtk.Orientation.vertical:Gtk.Orientation.horizontal,gap) }
function label(text,style=null) {
    local widget=Gtk.Label.new(text); widget.set_xalign(0); widget.set_wrap(true)
    if(style!=null) widget.add_css_class(style)
    return widget
}
app.connect("activate",function(){
    if(window!=null) { window.present(); return }
    window=Gtk.ApplicationWindow.new(app); window.set_title("Pocket Camera"); window.set_default_size(430,820)
    local css=Gtk.CssProvider.new(); css.load_from_path("style.css")
    Gtk.StyleContext.add_provider_for_display(window.get_display(),css,600)
    local page=box(true,14); page.add_css_class("page")
    page.append(label("POCKET CAMERA","eyebrow")); page.append(label("A little window into your world.","title"))
    page.append(label("Live from your phone’s camera, through GStreamer.","muted"))
    local preview=Gtk.Picture.new(); preview.set_can_shrink(true); preview.set_content_fit(Gtk.ContentFit.contain)
    preview.set_hexpand(true); preview.set_vexpand(true)
    local viewport=Gtk.Overlay.new(), area=Gtk.DrawingArea.new(); area.set_content_height(320)
    viewport.set_child(area); viewport.add_overlay(preview); viewport.set_measure_overlay(preview,false)
    viewport.add_css_class("preview"); page.append(viewport)
    local status=label("Preparing camera controls…","status"); page.append(status)
    local cameras=[], selected=0, choices=box(false,8)
    page.append(choices)
    local controls=box(false,8), start=Gtk.Button.new_with_label("Start"), stop=Gtk.Button.new_with_label("Stop")
    start.add_css_class("suggested-action"); start.set_hexpand(true); stop.set_hexpand(true)
    start.set_sensitive(false); stop.set_sensitive(false)
    controls.append(start); controls.append(stop); page.append(controls)
    local rotate=Gtk.Button.new_with_label("Rotate preview"), rotation=0, frames=0, since=0, report=0
    rotate.connect("clicked",function(){ rotation=(rotation+90)%360 }); page.append(rotate)
    page.append(label("Preview only · nothing is recorded or uploaded. The camera stops when you leave this app.","muted"))
    local close=function(text) {
        Video.close(stream); stream=null; preview.set_paintable(null)
        status.set_label(text); start.set_sensitive(cameras.len()>0); stop.set_sensitive(false)
    }
    local open=function(){
        try {
            if(device==null || !cameras.len()) return
            if(!device.has_camera_permission()) { device.request_camera(); status.set_label("Allow camera access, then tap Start."); return }
            Video.close(stream); stream=null; preview.set_paintable(null)
            local camera=cameras[selected]
            stream=Video.open(camera.id); rotation=camera.orientation; frames=0
            since=GLib.get_monotonic_time(); report=since
            start.set_sensitive(false); stop.set_sensitive(true)
            status.set_label("Opening "+camera.facing.tolower()+" camera…")
            print("Pocket Camera: opened "+camera.facing+" camera "+camera.id+"\n")
        } catch(error) { close(error.tostring()); print("Pocket Camera: "+error+"\n") }
    }
    start.connect("clicked",open)
    stop.connect("clicked",function(){ close("Camera stopped") })
    window.connect("notify::is-active",function(_property){ if(!window.is_active() && stream!=null) close("Camera paused · tap Start to resume") })
    local scroll=Gtk.ScrolledWindow.new(); scroll.set_policy(Gtk.PolicyType.never,Gtk.PolicyType.automatic); scroll.set_child(page)
    window.set_child(scroll); window.present()
    GLib.timeout_add(GLib.PRIORITY_DEFAULT,50,function(){
        if(!alive) return false
        try {
            if(device==null) {
                device=Android.Device.new(window.get_surface()); cameras=sqgi.json.parse(device.cameras())
                local group=null, counts={}
                foreach(camera in cameras) counts[camera.facing] <- (camera.facing in counts ? counts[camera.facing] : 0)+1
                foreach(i,camera in cameras) {
                    local index=i, button=Gtk.ToggleButton.new_with_label(camera.facing+(counts[camera.facing]>1?" "+camera.id:""))
                    button.set_hexpand(true); if(group!=null) button.set_group(group); else group=button
                    button.connect("toggled",function(){
                        if(!button.get_active() || selected==index) return
                        selected=index
                        if(stream!=null) open()
                        else status.set_label(cameras[selected].facing+" selected · tap Start")
                    })
                    choices.append(button); if(i==0) button.set_active(true)
                }
                start.set_sensitive(cameras.len()>0)
                status.set_label(cameras.len()?"Ready · choose a camera and tap Start":"No cameras reported by Android")
            }
            if(stream==null) return true
            local texture=Video.frame(stream,rotation), now=GLib.get_monotonic_time()
            if(texture!=null) { preview.set_paintable(texture); frames++ }
            if(!frames && now-since>10000000) { close("No frames received · try another camera"); return true }
            if(now-report>1000000) {
                local text=format("%s live · %d frames · %.1f fps",cameras[selected].facing,frames,frames*1000000.0/(now-since))
                status.set_label(text); report=now
                if(frames>0 && frames<40) print("Pocket Camera: "+text+"\n")
            }
        } catch(error) { close(error.tostring()); print("Pocket Camera: "+error+"\n") }
        return true
    })
})
app.connect("shutdown",function(){ alive=false; Video.close(stream); stream=null })
app.run(0,null)
