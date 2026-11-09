local GLib = import("GLib", "2.0")
local Suite = import("checks.nut")
local loop = GLib.MainLoop.new(null, false), failure = null
Suite.run().then(function(result) {
    local text = sqgi.json.stringify(result)
    GLib.file_set_contents("native-result.json", text, -1)
    print("NATIVE_PASS " + text + "\n")
    loop.quit()
}).catch(function(error) { failure = error; loop.quit() })
loop.run()
if (failure != null) throw failure
return 0
