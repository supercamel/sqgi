// demo/gstreamer/transcode.nut
//
// Decode any input the system can understand and re-encode it.
//
// Pipeline (audio-only example):
//   filesrc ! decodebin ! audioconvert ! audioresample !
//   <encoder> ! <muxer> ! filesink
//
// Container is chosen from --out=…:
//     .wav  → wavenc                    (no muxer)
//     .ogg  → vorbisenc ! oggmux
//     .mp3  → lamemp3enc                (if installed) else error
//     .m4a  → avenc_aac    ! mp4mux     (if installed)
//
// Flags:
//     --in=FILE     input file (default: synthesised 3 s sine sweep)
//     --out=FILE    output file (extension picks container)
//     --duration=N  when synthesising, seconds of audio (default: 3)

local Gst  = import("Gst")
local GLib = import("GLib")
local Gio  = import("Gio")

Gst.init(null)

local input = null
local output = "/tmp/sqgi-transcode-out.ogg"
local duration = 3
foreach (a in vargv) {
    if      (a.find("--in=")       == 0) input    = a.slice(5)
    else if (a.find("--out=")      == 0) output   = a.slice(6)
    else if (a.find("--duration=") == 0) duration = a.slice(11).tointeger()
}

local ext = output.slice(output.len() - 4)
local enc_chain = null
if      (output.slice(output.len() - 4) == ".wav") enc_chain = "wavenc"
else if (output.slice(output.len() - 4) == ".ogg") enc_chain = "vorbisenc ! oggmux"
else if (output.slice(output.len() - 4) == ".mp3") enc_chain = "lamemp3enc"
else if (output.slice(output.len() - 4) == ".m4a") enc_chain = "avenc_aac ! mp4mux"
else { print("unknown extension on '" + output + "'\n"); return }

local source
if (input == null) {
    local nb = duration * 100
    source = "audiotestsrc num-buffers=" + nb + " freq=440 wave=sine"
    print("(synthesising " + duration + "s sine wave)\n")
} else {
    if (!Gio.File.new_for_path(input).query_exists(null)) {
        print("input not found: " + input + "\n")
        return
    }
    source = "filesrc location=" + input + " ! decodebin"
}

local desc = source + " ! audioconvert ! audioresample ! " +
             enc_chain + " ! filesink location=" + output

print("pipeline: " + desc + "\n")
local pipe = Gst.parse_launch(desc)
if (pipe == null) { print("parse_launch failed\n"); return }

pipe.set_state(Gst.State.playing)
local bus  = pipe.get_bus()
local mask = Gst.MessageType.eos + Gst.MessageType.error
while (true) {
    local msg = bus.timed_pop_filtered(GLib.MAXINT64, mask)
    if (msg == null) continue
    if (msg.type == Gst.MessageType.eos) { print("[eos]\n"); break }
    if (msg.type == Gst.MessageType.error) {
        local r = msg.parse_error()
        print("[error] " + r[0] + "\n")
        if (r.len() > 1) print("        debug: " + r[1] + "\n")
        break
    }
}
pipe.set_state(Gst.State["null"])

local f = Gio.File.new_for_path(output)
if (f.query_exists(null)) {
    local info = f.query_info("standard::size", 0, null)
    print("wrote " + output + " (" + info.get_size() + " bytes)\n")
}
