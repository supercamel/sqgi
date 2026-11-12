package org.sqgi.worker;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/** Android owns process creation; the native module owns streams and execution. */
public final class WorkerBridge {
    static final String DESCRIPTOR = "org.sqgi.worker.ScriptWorker";
    static final int RUN = IBinder.FIRST_CALL_TRANSACTION;
    private static final Map<String, Binding> bindings = new HashMap<>();
    private static final Class<?>[] slots = {
        WorkerService.Slot0.class, WorkerService.Slot1.class,
        WorkerService.Slot2.class, WorkerService.Slot3.class,
        WorkerService.Slot4.class, WorkerService.Slot5.class,
        WorkerService.Slot6.class, WorkerService.Slot7.class
    };

    private static final class Binding implements ServiceConnection, IBinder.DeathRecipient {
        final Context context;
        final String token, directory;
        final String[] arguments, environment, unset;
        final int slot;
        final ParcelFileDescriptor[] descriptors = new ParcelFileDescriptor[4];
        final CountDownLatch dead = new CountDownLatch(1);
        IBinder binder;
        boolean bound, closing;

        Binding(Context context, String token, int slot, String directory,
                String[] arguments, String[] environment, String[] unset, int[] fds) throws IOException {
            this.context=context; this.token=token; this.slot=slot; this.directory=directory;
            this.arguments=arguments; this.environment=environment; this.unset=unset;
            try {
                for(int i=0;i<4;i++) descriptors[i]=ParcelFileDescriptor.fromFd(fds[i]);
            } catch(IOException error) { closeDescriptors(); throw error; }
        }
        void closeDescriptors() {
            for(int i=0;i<descriptors.length;i++) {
                if(descriptors[i]!=null) try { descriptors[i].close(); } catch(IOException ignored) { }
                descriptors[i]=null;
            }
        }
        void unbind() {
            if(bound) { bound=false; context.unbindService(this); }
        }
        void retire() {
            synchronized(bindings) {
                closing=true; closeDescriptors();
                if(bindings.get(token)==this) bindings.remove(token);
                unbind(); dead.countDown();
            }
        }
        @Override public void binderDied() { retire(); }
        @Override public void onServiceDisconnected(ComponentName name) { retire(); }
        @Override public void onBindingDied(ComponentName name) { retire(); }
        @Override public void onNullBinding(ComponentName name) { retire(); }
        @Override public void onServiceConnected(ComponentName name, IBinder service) {
            synchronized(bindings) {
                if(closing || bindings.get(token)!=this) { unbind(); return; }
                binder=service;
                Parcel input=Parcel.obtain(), reply=Parcel.obtain();
                try {
                    service.linkToDeath(this,0);
                    input.writeInterfaceToken(DESCRIPTOR);
                    input.writeString(directory); input.writeStringArray(arguments);
                    input.writeStringArray(environment); input.writeStringArray(unset);
                    // Binder transfers descriptors after binding. Intents contain no FDs.
                    for(ParcelFileDescriptor descriptor:descriptors) descriptor.writeToParcel(input,0);
                    if(!service.transact(RUN,input,reply,0)) throw new RemoteException("Worker rejected launch");
                    reply.readException();
                } catch(RemoteException | RuntimeException error) {
                    closing=true; unbind();
                } finally {
                    closeDescriptors(); input.recycle(); reply.recycle();
                }
            }
        }
    }

    public static void start(Context supplied, String token, String directory,
                             String[] arguments, String[] environment, String[] unset, int[] fds) {
        if(android.app.Application.getProcessName().startsWith(supplied.getPackageName()+":sqgi_worker_"))
            throw new IllegalStateException("Launch SQGI workers from the application process");
        if(fds==null || fds.length!=4 || arguments==null || arguments.length<2)
            throw new IllegalArgumentException("Invalid worker request");
        Context context=supplied.getApplicationContext();
        synchronized(bindings) {
            if(bindings.containsKey(token)) throw new IllegalArgumentException("Duplicate worker token");
            boolean[] used=new boolean[slots.length];
            for(Binding item:bindings.values()) used[item.slot]=true;
            int slot=0; while(slot<used.length && used[slot]) slot++;
            if(slot==used.length) throw new IllegalStateException("All eight SQGI worker processes are busy");
            Binding binding;
            try { binding=new Binding(context,token,slot,directory,arguments,environment,unset,fds); }
            catch(IOException error) { throw new IllegalStateException("Cannot transfer worker streams",error); }
            bindings.put(token,binding);
            try {
                binding.bound=context.bindService(new Intent(context,slots[slot]),binding,Context.BIND_AUTO_CREATE);
                if(!binding.bound) throw new IllegalStateException("Cannot bind SQGI worker service");
            } catch(RuntimeException error) { binding.retire(); throw error; }
        }
    }

    /** Called from the native monitor, never Android's application main thread. */
    public static void release(String token) {
        Binding binding;
        synchronized(bindings) {
            binding=bindings.get(token); if(binding==null)return;
            binding.closing=true; binding.closeDescriptors(); binding.unbind();
        }
        // Keep a slot reserved until Binder observes process death. A new job
        // must never inherit a service which is still retiring an older VM.
        try { if(!binding.dead.await(5,TimeUnit.SECONDS))return; }
        catch(InterruptedException error) { Thread.currentThread().interrupt(); }
        // A timeout leaves the slot reserved until a death callback arrives.
    }
}
