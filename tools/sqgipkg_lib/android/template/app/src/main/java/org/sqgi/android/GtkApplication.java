package org.sqgi.android;

import android.app.Application;
import android.os.Process;
import android.util.Log;
import java.io.File;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;
import org.gtk.android.GlueLibraryContext;

public final class GtkApplication extends Application {
    private static native String runtimeAbi();
    private static native void configurePaths(Application application, String home, String source, String runtime, String libraries);
    private static native void loadGioModule(String filename);
    private static native void loadGStreamerPlugin(String filename, String cache);
    private static native void configure(String runtime, String libraries, String cache,
                                         String source, String entry);
    private static native void configureNative(String runtime, String libraries, String cache,
        String source, String script, String applicationId, String library,
        String symbol, String shutdown);

    @Override public void onCreate() {
        super.onCreate();
        File runtime = new File(getFilesDir(), "runtime");
        File application = new File(getFilesDir(), "application");
        try {
            System.loadLibrary("sqgi-platform");
            String abi = runtimeAbi();
            JSONObject index;
            try (InputStream input = getAssets().open("runtime/index.json")) {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int size;
                while ((size = input.read(buffer)) != -1) bytes.write(buffer, 0, size);
                index = new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
            }
            if (index.getInt("schema") != 2 || !index.getJSONObject("abis").has(abi))
                throw new IOException("No SQGI metadata for loaded ABI " + abi);
            installAssets("runtime/" + abi, runtime);
            installAssets("application", application);
            String baseId = hash(new File(runtime, "provenance.json"));
            if (!baseId.equals(index.getJSONObject("abis").getString(abi)))
                throw new IOException("SQGI runtime provenance differs for " + abi);
            JSONObject provenance = new JSONObject(readText(new File(runtime, "provenance.json")));
            if (!abi.equals(provenance.getString("abi")))
                throw new IOException("SQGI runtime metadata has the wrong ABI");
            File selected = application;
            String mode = "packaged";
            // Only adb/run-as can activate overrides; release builds ignore them.
            File active = new File(getFilesDir(), "development/active");
            if (BuildConfig.DEBUG && active.isFile()) {
                try {
                    String id = readText(active).trim();
                    if (!id.matches("[a-f0-9]{64}")) throw new IOException("Invalid source snapshot ID");
                    File snapshot = new File(getFilesDir(), "development/snapshots/" + id);
                    File metadataFile = new File(snapshot, "project.json");
                    if (!hash(metadataFile).equals(id)) throw new IOException("Source snapshot metadata changed");
                    JSONObject metadata = metadata(snapshot);
                    if (!baseId.equals(metadata.getString("base_id")))
                        throw new IOException("Source snapshot belongs to another APK build; sync again");
                    validate(snapshot, metadata);
                    selected = snapshot;
                    mode = "development";
                } catch (IOException | JSONException error) {
                    Log.w("SqgiAndroid", "Ignoring development snapshot: " + error.getMessage());
                }
            }
            JSONObject metadata = metadata(selected);
            validate(selected, metadata);
            JSONObject project = metadata.getJSONObject("project");
            String entry = project.getString("entry");
            JSONObject nativeEntry = project.optJSONObject("native_entry");
            File source = new File(selected, "source");
            JSONObject session = new JSONObject();
            session.put("pid", Process.myPid());
            session.put("abi", abi);
            session.put("mode", mode);
            session.put("application_id", getPackageName());
            session.put("apk_path", getApplicationInfo().sourceDir);
            session.put("source_path", getFilesDir().toPath().relativize(source.toPath()).toString());
            session.put("entry", entry);
            session.put("entry_type", nativeEntry == null ? "sqgi" : "native");
            session.put("snapshot", hash(new File(selected, "project.json")));
            session.put("base_id", baseId);
            Files.write(new File(runtime, "session.json").toPath(), session.toString().getBytes(StandardCharsets.UTF_8));
            String glue = nativeEntry == null ? "sqgi-gtk" : "sqgi-entry";
            // Set application paths before GLib caches process directories.
            // The same payload root is used for packaged and development code.
            configurePaths(this, getFilesDir().getAbsolutePath(), source.getAbsolutePath(),
                           runtime.getAbsolutePath(), getApplicationInfo().nativeLibraryDir);
            System.loadLibrary(glue);
            File modules = new File(runtime, "share/gio-modules.list");
            if (modules.isFile()) {
                for (String line : Files.readAllLines(modules.toPath(), StandardCharsets.UTF_8)) {
                    String module = line.trim();
                    if (module.isEmpty()) continue;
                    if (!module.matches("lib[A-Za-z0-9_.-]+\\.so"))
                        throw new IOException("Invalid packaged GIO module name");
                    loadGioModule(new File(getApplicationInfo().nativeLibraryDir, module).getAbsolutePath());
                }
            }
            File plugins = new File(runtime, "share/gstreamer-plugins");
            File[] lists = plugins.listFiles();
            if (lists != null) {
                java.util.Arrays.sort(lists);
                for (File list : lists) {
                    if (!list.isFile() || !list.getName().endsWith(".list"))
                        throw new IOException("Invalid GStreamer plugin list");
                    for (String line : Files.readAllLines(list.toPath(), StandardCharsets.UTF_8)) {
                        String plugin = line.trim();
                        if (plugin.isEmpty()) continue;
                        if (!plugin.matches("libgst[A-Za-z0-9_.+\\-]+\\.so"))
                            throw new IOException("Invalid packaged GStreamer plugin name");
                        loadGStreamerPlugin(new File(getApplicationInfo().nativeLibraryDir, plugin).getAbsolutePath(),
                                            getCacheDir().getAbsolutePath());
                    }
                }
            }
            if (nativeEntry == null) {
                configure(runtime.getAbsolutePath(), getApplicationInfo().nativeLibraryDir,
                          getCacheDir().getAbsolutePath(), source.getAbsolutePath(), entry);
            } else {
                configureNative(runtime.getAbsolutePath(), getApplicationInfo().nativeLibraryDir,
                    getCacheDir().getAbsolutePath(), source.getAbsolutePath(),
                    entry.isEmpty() ? null : entry, getPackageName(), nativeEntry.getString("library"),
                    nativeEntry.getString("symbol"), nativeEntry.has("shutdown") ? nativeEntry.getString("shutdown") : null);
            }
            GlueLibraryContext.setGlueLibraryProvider(() -> glue);
            Log.i("SqgiAndroid", "Starting " + mode + " source " + entry);
        } catch (IOException | JSONException error) {
            throw new IllegalStateException("Cannot install SQGI application assets", error);
        }
    }

    private JSONObject metadata(File directory) throws IOException, JSONException {
        return new JSONObject(readText(new File(directory, "project.json")));
    }

    private static String readText(File file) throws IOException {
        return new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
    }

    private void validate(File directory, JSONObject metadata) throws IOException, JSONException {
        JSONObject project = metadata.getJSONObject("project");
        if (metadata.getInt("schema") != 1 || !getPackageName().equals(project.getString("application_id")))
            throw new IOException("Source snapshot belongs to a different application");
        JSONObject files = metadata.getJSONObject("files");
        String entry = project.getString("entry");
        JSONObject nativeEntry = project.optJSONObject("native_entry");
        if ((!entry.isEmpty() || nativeEntry == null) && !files.has(entry)) throw new IOException("Entry script is missing");
        if (nativeEntry != null && (nativeEntry.getInt("abi_version") != 1 ||
                !nativeEntry.getString("library").matches("lib[A-Za-z0-9_.+\\-]+\\.so") ||
                !nativeEntry.getString("symbol").matches("[A-Za-z_][A-Za-z0-9_]*") ||
                (nativeEntry.has("shutdown") && !nativeEntry.getString("shutdown").matches("[A-Za-z_][A-Za-z0-9_]*"))))
            throw new IOException("Invalid Android native entry selector");
        File source = new File(directory, "source").getCanonicalFile();
        for (Iterator<String> names = files.keys(); names.hasNext();) {
            String name = names.next();
            File file = new File(source, name).getCanonicalFile();
            if (!file.toPath().startsWith(source.toPath()) || !file.isFile() || !hash(file).equals(files.getString(name)))
                throw new IOException("Source snapshot file is invalid: " + name);
        }
    }

    private static String hash(File file) throws IOException {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            try (InputStream input = Files.newInputStream(file.toPath())) {
                byte[] buffer = new byte[65536];
                int size;
                while ((size = input.read(buffer)) != -1) digest.update(buffer, 0, size);
            }
            StringBuilder result = new StringBuilder();
            for (byte value : digest.digest()) result.append(String.format("%02x", value & 255));
            return result.toString();
        } catch (NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }

    private void installAssets(String asset, File destination) throws IOException {
        File temporary = new File(destination.getPath() + ".install");
        remove(temporary);
        copyAssets(asset, temporary);
        remove(destination);
        if (!temporary.renameTo(destination)) throw new IOException("Cannot install " + destination);
    }

    private static void remove(File file) throws IOException {
        if (!Files.isSymbolicLink(file.toPath()) && file.isDirectory()) {
            File[] children = file.listFiles();
            if (children == null) throw new IOException("Cannot list " + file);
            for (File child : children) remove(child);
        }
        Files.deleteIfExists(file.toPath());
    }

    private void copyAssets(String asset, File destination) throws IOException {
        String[] children = getAssets().list(asset);
        if (children != null && children.length > 0) {
            if (!destination.isDirectory() && !destination.mkdirs())
                throw new IOException("Cannot create " + destination);
            for (String child : children) copyAssets(asset + "/" + child, new File(destination, child));
        } else {
            try (InputStream input = getAssets().open(asset);
                 FileOutputStream output = new FileOutputStream(destination)) {
                byte[] buffer = new byte[65536];
                int size;
                while ((size = input.read(buffer)) != -1) output.write(buffer, 0, size);
            }
        }
    }
}
