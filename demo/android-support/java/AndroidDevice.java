package org.sqgi.demo;

import android.Manifest;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.pm.PackageManager;
import android.hardware.Camera;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.ref.WeakReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Framework-only services; sensor acquisition and compass calculations live in C. */
public final class AndroidDevice implements LocationListener, Application.ActivityLifecycleCallbacks {
    private static AndroidDevice instance;
    private final Application application;
    private volatile WeakReference<Activity> activity;
    private final LocationManager locations;
    private boolean foreground = true, wantedLocation;
    private Location location;
    private String locationState = "Off";

    private AndroidDevice(Activity owner) {
        application = owner.getApplication(); activity = new WeakReference<>(owner);
        locations = (LocationManager)application.getSystemService(Context.LOCATION_SERVICE);
        application.registerActivityLifecycleCallbacks(this);
    }
    public static synchronized void initialize(Activity owner) {
        if (instance == null) instance = new AndroidDevice(owner);
        else instance.activity = new WeakReference<>(owner);
    }
    private static synchronized AndroidDevice device() {
        if (instance == null) throw new IllegalStateException("Present the GTK window before attaching AndroidDevice");
        return instance;
    }
    private boolean granted(String permission) {
        return application.checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED;
    }
    public static boolean hasCameraPermission() { return device().granted(Manifest.permission.CAMERA); }
    @SuppressWarnings("deprecation")
    public static String cameras() throws org.json.JSONException {
        JSONArray cameras = new JSONArray();
        for (int id = 0; id < Camera.getNumberOfCameras(); id++) {
            Camera.CameraInfo info = new Camera.CameraInfo(); Camera.getCameraInfo(id, info);
            JSONObject camera = new JSONObject(); camera.put("id", id);
            camera.put("facing", info.facing == Camera.CameraInfo.CAMERA_FACING_FRONT ? "Front" : "Rear");
            camera.put("orientation", info.orientation); cameras.put(camera);
        }
        return cameras.toString();
    }
    public static void requestCamera() {
        AndroidDevice self = device(); Activity owner = self.activity.get();
        if (owner != null) owner.runOnUiThread(() -> {
            if (!self.granted(Manifest.permission.CAMERA))
                owner.requestPermissions(new String[]{Manifest.permission.CAMERA}, 4201);
        });
    }
    public static void requestLocation() {
        AndroidDevice self = device(); Activity owner = self.activity.get();
        if (owner == null) return;
        owner.runOnUiThread(() -> {
            synchronized (self) {
                self.wantedLocation = true;
                if (!self.granted(Manifest.permission.ACCESS_COARSE_LOCATION)) {
                    self.locationState = "Waiting for permission";
                    owner.requestPermissions(new String[]{Manifest.permission.ACCESS_FINE_LOCATION,
                                                           Manifest.permission.ACCESS_COARSE_LOCATION}, 4202);
                } else self.resumeLocation();
            }
        });
    }
    public static void stopLocation() {
        AndroidDevice self = device(); Activity owner = self.activity.get();
        if (owner != null) owner.runOnUiThread(() -> {
            synchronized (self) {
                self.wantedLocation = false;
                if (self.locations != null) self.locations.removeUpdates(self);
                self.locationState = "Off"; self.location = null;
            }
        });
    }
    private synchronized void resumeLocation() {
        if (!foreground || !wantedLocation) return;
        if (locations == null) { locationState = "Location service unavailable"; return; }
        if (!granted(Manifest.permission.ACCESS_COARSE_LOCATION)) { locationState = "Location permission denied"; return; }
        boolean requested = false;
        try {
            locations.removeUpdates(this);
            for (String provider : new String[]{LocationManager.GPS_PROVIDER, LocationManager.NETWORK_PROVIDER}) {
                if (provider.equals(LocationManager.GPS_PROVIDER) && !granted(Manifest.permission.ACCESS_FINE_LOCATION)) continue;
                if (!locations.getAllProviders().contains(provider) || !locations.isProviderEnabled(provider)) continue;
                locations.requestLocationUpdates(provider, 1000, 0, this, Looper.getMainLooper()); requested = true;
            }
            locationState = requested ? "Waiting for a fix" : "No location provider enabled";
        } catch (SecurityException denied) { locationState = "Location permission denied"; }
    }
    private synchronized void pause() {
        if (locations != null) locations.removeUpdates(this);
        locationState = wantedLocation ? "Paused" : "Off";
    }
    @Override public synchronized void onLocationChanged(Location value) {
        if (foreground && wantedLocation) { location = new Location(value); locationState = "Live"; }
    }
    @Override public void onProviderEnabled(String provider) { resumeLocation(); }
    @Override public void onProviderDisabled(String provider) { resumeLocation(); }
    @Override public void onStatusChanged(String provider, int status, Bundle extras) {}

    public static String snapshot() throws org.json.JSONException { return device().readSnapshot(); }
    private synchronized String readSnapshot() throws org.json.JSONException {
        JSONObject fix = new JSONObject(); fix.put("state", locationState);
        fix.put("precise", granted(Manifest.permission.ACCESS_FINE_LOCATION));
        if (location != null) {
            fix.put("latitude", location.getLatitude()); fix.put("longitude", location.getLongitude());
            fix.put("accuracy", location.getAccuracy()); fix.put("provider", location.getProvider());
            fix.put("age_ms", (SystemClock.elapsedRealtimeNanos()-location.getElapsedRealtimeNanos())/1000000);
            if (location.hasAltitude()) fix.put("altitude", location.getAltitude());
            if (location.hasSpeed()) fix.put("speed", location.getSpeed());
        }
        JSONObject result = new JSONObject(); result.put("location", fix); return result.toString();
    }
    @Override public synchronized void onActivityResumed(Activity owner) {
        activity = new WeakReference<>(owner); foreground = true; resumeLocation();
    }
    @Override public synchronized void onActivityPaused(Activity owner) { foreground = false; pause(); }
    @Override public synchronized void onActivityDestroyed(Activity owner) {
        if (activity.get() == owner) { pause(); activity.clear(); }
    }
    @Override public void onActivityCreated(Activity owner, Bundle state) {}
    @Override public void onActivityStarted(Activity owner) {}
    @Override public void onActivityStopped(Activity owner) {}
    @Override public void onActivitySaveInstanceState(Activity owner, Bundle state) {}
}
