package org.sqgi.worker;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.os.RemoteException;
import java.util.concurrent.atomic.AtomicBoolean;

public class WorkerService extends Service {
    private final AtomicBoolean claimed=new AtomicBoolean();
    private static native void run(String directory, String[] arguments,
                                   String[] environment, String[] unset, int[] descriptors);
    private final Binder binder=new Binder() {
        @Override protected boolean onTransact(int code, Parcel input, Parcel reply, int flags) throws RemoteException {
            if(code!=WorkerBridge.RUN)return super.onTransact(code,input,reply,flags);
            input.enforceInterface(WorkerBridge.DESCRIPTOR);
            if(Binder.getCallingUid()!=Process.myUid())throw new SecurityException("Worker belongs to another application");
            if(!claimed.compareAndSet(false,true))throw new IllegalStateException("Worker already claimed");
            int[] fds={-1,-1,-1,-1};
            try {
                String directory=input.readString(); String[] arguments=input.createStringArray();
                String[] environment=input.createStringArray(), unset=input.createStringArray();
                for(int i=0;i<fds.length;i++)fds[i]=ParcelFileDescriptor.CREATOR.createFromParcel(input).detachFd();
                new Thread(() -> run(directory,arguments,environment,unset,fds),"SQGI worker").start();
                reply.writeNoException(); return true;
            } catch(RuntimeException error) {
                for(int fd:fds) if(fd>=0) try { ParcelFileDescriptor.adoptFd(fd).close(); } catch(Exception ignored) { }
                throw error;
            }
        }
    };
    @Override public IBinder onBind(Intent intent) { return binder; }
    @Override public void onDestroy() {
        // Unbinding after parent death also terminates a blocked native worker.
        Process.killProcess(Process.myPid());
        super.onDestroy();
    }
    public static final class Slot0 extends WorkerService { }
    public static final class Slot1 extends WorkerService { }
    public static final class Slot2 extends WorkerService { }
    public static final class Slot3 extends WorkerService { }
    public static final class Slot4 extends WorkerService { }
    public static final class Slot5 extends WorkerService { }
    public static final class Slot6 extends WorkerService { }
    public static final class Slot7 extends WorkerService { }
}
