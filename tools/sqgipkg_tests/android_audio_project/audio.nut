local Gst=import("Gst","1.0"),GLib=import("GLib")
Gst.init(null)
function complete(pipeline,checkSink=false){
    local start=GLib.get_monotonic_time(),result=null
    try{
        assert(pipeline.set_state(Gst.State.playing)!=Gst.StateChangeReturn.failure)
        local message=pipeline.get_bus().timed_pop_filtered(6000000000,Gst.MessageType.error|Gst.MessageType.warning|Gst.MessageType.eos)
        if(message==null)throw "Audio playback timed out"
        if(message.type!=Gst.MessageType.eos)throw "Audio pipeline failed: "+message.type
        local elapsed=(GLib.get_monotonic_time()-start)/1000
        result={eos=true,elapsed_ms=elapsed}
        if(checkSink){
            local sink=pipeline.get_by_name("output-actual-sink-opensles")
            assert(sink!=null)
            result.sink<-sink.get_factory().get_name()
            assert(result.sink=="openslessink" && elapsed>=500 && elapsed<6000)
        }
    }catch(error){pipeline.set_state(Gst.State.null);throw error}
    pipeline.set_state(Gst.State.null);return result
}
return {
    generate=function(path){
        local pipe=Gst.parse_launch("audiotestsrc num-buffers=30 samplesperbuffer=1024 volume=0.05 ! audio/x-raw,rate=48000,channels=1 ! wavenc ! filesink name=file")
        pipe.get_by_name("file").set_property("location",path);return complete(pipe)
    },
    play=function(path){
        local pipe=Gst.parse_launch("filesrc name=input ! wavparse ! audioconvert ! audioresample ! volume volume=0.1 ! autoaudiosink name=output sync=true")
        pipe.get_by_name("input").set_property("location",path);return complete(pipe,true)
    }
}
