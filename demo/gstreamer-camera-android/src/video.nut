local Gst=import("Gst", "1.0"), GstApp=import("GstApp", "1.0")
local GLib=import("GLib"), Gdk=import("Gdk", "4.0"), Pb=import("GdkPixbuf", "2.0")
Gst.init(null)
local M={}
M.open <- function(camera) {
    local pipeline=Gst.parse_launch("ahcsrc device="+camera+" ! videoconvert ! videoscale ! "+
        "video/x-raw,format=RGBA,width=640,height=480 ! appsink name=preview max-buffers=1 drop=true sync=false")
    try {
        if(pipeline.set_state(Gst.State.playing)==Gst.StateChangeReturn.failure) throw "Camera could not start"
        return {pipeline=pipeline,sink=pipeline.get_by_name("preview"),bus=pipeline.get_bus()}
    } catch(error) { pipeline.set_state(Gst.State["null"]); throw error }
}
M.close <- function(stream) { if(stream!=null) stream.pipeline.set_state(Gst.State["null"]) }
M.frame <- function(stream, rotation) {
    local message=stream.bus.timed_pop_filtered(0,Gst.MessageType.error+Gst.MessageType.eos)
    if(message!=null) {
        if(message.type==Gst.MessageType.eos) throw "Camera stream ended"
        local error=message.parse_error(); throw error[0].tostring()
    }
    local sample=stream.sink.try_pull_sample(0)
    if(sample==null) return null
    local caps=sample.get_caps().get_structure(0), width=caps.get_int("width"), height=caps.get_int("height")
    local buffer=sample.get_buffer(), bytes=GLib.Bytes.new(buffer.extract_dup(0,buffer.get_size()))
    local pixels=Pb.Pixbuf.new_from_bytes(bytes,Pb.Colorspace.rgb,true,8,width,height,width*4)
    if(rotation!=0) pixels=pixels.rotate_simple(rotation==90 ? Pb.PixbufRotation.clockwise :
        (rotation==180 ? Pb.PixbufRotation.upsidedown : Pb.PixbufRotation.counterclockwise))
    return Gdk.Texture.new_for_pixbuf(pixels)
}
return M
