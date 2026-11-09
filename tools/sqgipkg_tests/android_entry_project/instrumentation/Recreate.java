package org.sqgi.android.entrytest;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.Process;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import org.json.JSONObject;

/** Test-only instrumentation: exercise Activity.recreate without product hooks. */
public final class Recreate extends Instrumentation {
    @Override public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        start();
    }
    private JSONObject read(File file) throws Exception {
        return new JSONObject(new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
    }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            Intent intent = new Intent(Intent.ACTION_MAIN);
            intent.setComponent(new ComponentName(getTargetContext().getPackageName(), "org.sqgi.android.GtkActivity"));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            Activity first = startActivitySync(intent);
            File data = new File(getTargetContext().getFilesDir(), "data");
            File telemetry = new File(data, "native-entry.json");
            Thread.sleep(1200);
            JSONObject before = read(telemetry);
            ActivityMonitor monitor = addMonitor("org.sqgi.android.GtkActivity", null, false);
            runOnMainSync(first::recreate);
            Activity second = waitForMonitorWithTimeout(monitor, 15000);
            removeMonitor(monitor);
            if (second == null || second == first) throw new AssertionError("Activity was not recreated");
            Thread.sleep(1200);
            JSONObject after = read(telemetry);
            if (before.getInt("pid") != Process.myPid() || after.getInt("pid") != Process.myPid() ||
                    after.getInt("entries") != 1 || after.getBoolean("vm_closed") ||
                    after.getInt("ticks") <= before.getInt("ticks"))
                throw new AssertionError("Native entry/VM did not survive Activity recreation");
            JSONObject evidence = new JSONObject();
            evidence.put("passed", true); evidence.put("pid", Process.myPid());
            evidence.put("activity_recreated", true); evidence.put("before", before); evidence.put("after", after);
            Files.write(new File(data, "activity-recreate.json").toPath(), evidence.toString().getBytes(StandardCharsets.UTF_8));
            result.putString("stream", "Native entry survived Activity.recreate\n");
            finish(Activity.RESULT_OK, result);
        } catch (Throwable error) {
            result.putString("stream", error.toString()); finish(Activity.RESULT_CANCELED, result);
        }
    }
}
