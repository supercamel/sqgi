package org.sqgi.android;

import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

public final class GtkActivity extends org.gtk.android.ToplevelActivity {
    @Override protected void onActivityResult(int request, int result, Intent data) {
        if (result == RESULT_OK && data != null &&
                (data.getFlags() & Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION) != 0) {
            int flags = data.getFlags() & (Intent.FLAG_GRANT_READ_URI_PERMISSION |
                                          Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
            if (data.getData() != null) persist(data.getData(), flags);
            ClipData files = data.getClipData();
            if (files != null) {
                for (int i = 0; i < files.getItemCount(); i++)
                    persist(files.getItemAt(i).getUri(), flags);
            }
        }
        super.onActivityResult(request, result, data);
    }

    private void persist(Uri uri, int flags) {
        if (uri == null || flags == 0) return;
        try {
            getContentResolver().takePersistableUriPermission(uri, flags);
        } catch (SecurityException error) {
            // The selected document remains usable for its temporary grant.
            Log.w("SqgiAndroid", "Document provider did not retain access", error);
        }
    }
}
