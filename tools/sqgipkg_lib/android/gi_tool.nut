local GI = import("gi.nut")
try {
    if (!vargv.len()) throw "Expected scan, compile, exec or ldd"
    local context = GI.Context()
    context.run(vargv[0], vargv.slice(1))
} catch (caught) {
    error("sqgipkg Android GI: " + caught.tostring() + "\n")
    return 1
}
return 0
