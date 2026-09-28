local Gtk = import("Gtk", "4.0")
local GLib = import("GLib")
local Gio = import("Gio")
local World = import("GWorldSceneGtk4", "0.1")
local system = import("system")
local checks = [], failures = 0
function check(name, ok, observed) {
    checks.push({ name = name, ok = ok, observed = observed })
    if (!ok) failures++
    print((ok ? "PASS " : "FAIL ") + name + ": " + sqgi.json.stringify(observed) + "\n")
}
local server = GLib.getenv("SQGI_STUDY_SCENE_BASE_URL")
if (server == null) throw "Start the study's local imagery/terrain server first"
Gtk.init()
local window = Gtk.Window.new(), view = World.SceneView.new()
local loop = GLib.MainLoop.new(null, false), frames = 0, ticks = 0, finished = false
window.set_title("Packaging study — local scene")
window.set_default_size(800, 600)
view.set_cache_directory(GLib.get_user_cache_dir() + "/sqgi-study-scene")
view.set_terrain_server(server + "terrain/{tile}.hgt")
view.set_map_tile_url_template(server + "tiles/{z}/{x}/{y}.png")
view.set_water_enabled(false); view.set_atmosphere_enabled(false); view.set_fog_enabled(false)
view.set_free_camera_position(0.5, 0.5, 1000.0)
view.set_free_camera_orientation(0.0, -89.0)
view.set_sun_position(90.0, 60.0)
local cube = view.add_cube(0.5, 0.5, 250.0, 400.0, 400.0, 400.0)
cube.set_color(1.0, 0.0, 0.0)
cube.set_roughness(0.75)
check("scene node identity", cube.get_id() > 0, cube.get_id())
check("material round trip", cube.get_roughness() == 0.75, cube.get_roughness())
local position = cube.get_position()
check("position round trip", typeof(position) == "array" && position.len() == 3 && position[0] == 0.5 && position[1] == 0.5 && position[2] == 250.0, position)
print("STUDY_ENV " + sqgi.json.stringify({ architecture = system.cpu.arch,
    packaged = system.package.packaged, runtime = system.runtime,
    local_server = server, typelib_path = GLib.getenv("GI_TYPELIB_PATH"),
    library_path = GLib.getenv("LD_LIBRARY_PATH") }) + "\n")
window.set_child(view); window.present()
// The widget handles GLArea::render before ordinary handlers. Observe completed
// frame-clock paints instead; the runner independently checks rendered pixels.
view.get_frame_clock().connect("after-paint", function() { frames++ })
window.connect("close-request", function() { loop.quit(); return false })
sqgi.timeout_add(500, function() {
    ticks++
    local height = view.sample_terrain_altitude(0.5, 0.5)
    if (!finished && ((frames > 2 && height == 100.0 && ticks >= 8) || ticks >= 40)) {
        finished = true
        check("GL context", view.get_context() != null && view.get_error() == null, view.get_error() == null ? "no GL error" : "GL error")
        check("rendered frames", frames > 2, frames)
        check("local terrain height", height == 100.0, height)
        print("STUDY_RESULT " + sqgi.json.stringify({ failures = failures, checks = checks }) + "\n")
        local ready = GLib.getenv("SQGI_STUDY_READY")
        if (ready != null) Gio.File.new_for_path(ready).replace_contents("ready", null, false, Gio.FileCreateFlags.none, null)
        sqgi.timeout_add(2000, function() { loop.quit(); return false })
    }
    return !finished
})
loop.run(); window.destroy()
if (!finished || failures) throw "Scene consumer failed or ended before its checks"
