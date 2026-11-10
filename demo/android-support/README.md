# SqAndroid demo support

A small C GObject library shared by the Phone Sensors and Pocket Camera demos.
Meson installs `libsqandroid-1.0.so`, `SqAndroid-1.0.gir` and its target-built
typelib. Import it with `import("SqAndroid", "1.0")`.

`SqAndroid.Sensors` owns an NDK sensor queue on a worker thread. Its collection
contains `SqAndroid.Sensor` objects with typed GI methods for names, vendor,
sensor type, values, resolution, wake-up status and reading age. It pauses when
the supplied GDK surface loses focus. Stop it explicitly when the app shuts
down; disposing the collection joins the worker and releases the queue.

```squirrel
local Android = import("SqAndroid", "1.0")
local sensors = Android.Sensors.new(window.get_surface(), app.get_application_id())
sensors.start()
foreach (sensor in sensors.get_items()) {
    print(sensor.get_name() + ": " + sensor.get_state() + "\n")
}
```

Create the objects after presenting the GTK window. `get_values()` returns an
array of numbers; it is empty until a reading arrives. Units follow Android's
sensor types. `get_heading()` returns magnetic heading in degrees or `-1`
when a heading cannot be calculated.

`SqAndroid.Device` handles camera permission/enumeration and foreground
location. Its private Java helper uses Android framework APIs and lifecycle
callbacks; sensor acquisition and compass mathematics remain in C. Camera IDs
match GStreamer's `ahcsrc`. `cameras()` and `snapshot()` return JSON for the small
camera/location records. The helper requests only permissions declared by the
calling app and starts location updates only after an explicit request.

The native recipe installs framework callback sources beneath
`share/sqgi-android/java/`. `sqgipkg` compiles them into the APK alongside GTK's
Android support. SQGI applications call the C/GI API directly.
