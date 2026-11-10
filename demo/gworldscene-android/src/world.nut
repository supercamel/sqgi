// Terrain and imagery are supplied through GWorldScene's public GI API.
local World = import("GWorldSceneGtk4", "0.1")
local Gdk = import("Gdk", "4.0"), Gio = import("Gio"), GLib = import("GLib")
local Pixbuf = import("GdkPixbuf", "2.0"), Soup = import("Soup", "3.0")

function create() {
    local view = World.SceneView.new()
    view.set_allowed_apis(Gdk.GLAPI.gles)
    view.set_shadows_enabled(false)
    view.set_water_enabled(false)
    view.set_cache_enabled(false)

    local terrain = World.SceneTerrainSource.new()
    local bytes = Gio.File.new_for_path("assets/terrain/N45E006.hgt").load_bytes(null)[0]
    if (!terrain.put_tile(45, 6, 1201, bytes)) throw "Unable to load the Mont Blanc elevation tile"
    view.set_terrain_source(terrain)

    local presets = [
        {name="Mont Blanc", button="Summit", latitude=45.79, longitude=6.81, altitude=6800, heading=43, pitch=-25},
        {name="Above the massif", button="Panorama", latitude=45.79, longitude=6.81, altitude=10000, heading=43, pitch=-35},
        {name="Chamonix valley", button="Valley", latitude=45.91, longitude=6.92, altitude=6500, heading=210, pitch=-38}
    ]
    local state = {preset=0, failed=0, closed=false, ready=false}
    local session = Soup.Session.new(); session.timeout = 20
    session.set_property("user-agent", "SQGI-Alpine/1.0")
    local pending = {}, provider = null

    local cancel_requests = function() {
        foreach (id, token in pending) token.cancel()
        pending.clear()
        if (provider != null) provider.close()
    }
    local start_imagery = function() {
        cancel_requests()
        state.failed = 0; state.ready = false
        local current = World.SceneTileProvider.new(0, 18, 256)
        provider = current
        current.connect("tile-requested", function(id, z, x, y) {
            local token = Gio.Cancellable.new(); pending[id] <- token
            local url = format("https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/%d/%d/%d", z, y, x)
            local message = Soup.Message.new("GET", url)
            session.send_and_read_async(message, GLib.PRIORITY_DEFAULT, token, function(source, result) {
                try {
                    local data = source.send_and_read_finish(result)
                    if (state.closed || current != provider || !(id in pending)) return
                    if (message.get_status() != 200 || data.get_size() > 2097152) throw "Imagery request failed"
                    local stream = Gio.MemoryInputStream.new_from_bytes(data)
                    local pixels = Pixbuf.Pixbuf.new_from_stream(stream, null); stream.close(null)
                    if (pixels.get_width() != 256 || pixels.get_height() != 256) throw "Unexpected imagery dimensions"
                    current.complete_tile(id, pixels)
                } catch (error) {
                    if (!state.closed && current == provider && id in pending) {
                        state.failed++; current.complete_tile(id, null)
                    }
                }
                if (current == provider && id in pending) delete pending[id]
            })
        })
        current.connect("tile-released", function(id) {
            if (current == provider && id in pending) { pending[id].cancel(); delete pending[id] }
        })
        view.set_tile_provider(current)
    }
    local show = function(index) {
        local p = presets[index]; state.preset = index
        view.set_camera(p.latitude, p.longitude, p.altitude)
        view.set_camera_orientation(p.heading, p.pitch)
        print("Alpine: viewpoint " + p.name + "\n")
    }
    local zoom = function(factor) {
        local p = view.get_camera(), floor = 1500.0
        try { floor = terrain.get_altitude(p[0], p[1]) + 700.0 } catch (unused) {}
        local altitude = p[2] * factor
        if (altitude < floor) altitude = floor
        if (altitude > 18000) altitude = 18000
        view.set_camera(p[0], p[1], altitude)
    }
    start_imagery(); show(0); view.set_sun_time_of_day(13.0)
    return {
        view=view, terrain=terrain, presets=presets, state=state, show=show, zoom=zoom,
        retry=start_imagery,
        progress=function() { return [provider.get_ready_count(), provider.get_tile_count()] },
        close=function() { state.closed = true; cancel_requests(); session.abort() }
    }
}
return {create=create}
