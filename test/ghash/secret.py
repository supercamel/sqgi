"""Exercise only a private D-Bus and temporary keyring, never the desktop service."""
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

root=Path(__file__).resolve().parent
runtime=str(Path(sys.argv[1]).resolve())
if '--inside' not in sys.argv:
    if not all(shutil.which(p) for p in ['dbus-run-session','gnome-keyring-daemon','gdbus']):
        print('SKIP: private Secret Service tools unavailable');sys.exit(77)
    sys.exit(subprocess.run(['dbus-run-session','--',sys.executable,__file__,runtime,'--inside'],timeout=45).returncode)
with tempfile.TemporaryDirectory(prefix='sqgi-private-secret-') as directory:
    work=Path(directory);env=dict(os.environ)
    for key,name in [('XDG_DATA_HOME','data'),('XDG_CONFIG_HOME','config'),('XDG_RUNTIME_DIR','runtime')]:
        path=work/name;path.mkdir(mode=0o700);env[key]=str(path)
    env.pop('GNOME_KEYRING_CONTROL',None);env.pop('GNOME_KEYRING_PID',None)
    # These subprocesses cannot reach any session bus or activate a service.
    unavailable=dict(env,DBUS_SESSION_BUS_ADDRESS='unix:path='+str(work/'no-bus'))
    subprocess.run([runtime,str(root/'unavailable.nut')],env=unavailable,check=True,timeout=10)
    subprocess.run([runtime,str(root/'cancelled.nut')],env=unavailable,check=True,timeout=10)

    daemon=subprocess.Popen(['gnome-keyring-daemon','--foreground','--components=secrets','--unlock','--control-directory',str(work/'control')],stdin=subprocess.PIPE,stdout=subprocess.DEVNULL,stderr=subprocess.PIPE,env=env)
    try:
        daemon.stdin.write(b'private-test-password\n');daemon.stdin.close()
        subprocess.run(['gdbus','wait','--session','--timeout','10','org.freedesktop.secrets'],env=env,check=True,timeout=12)
        subprocess.run([runtime,str(root/'secret.nut')],env=env,check=True,timeout=15)
    finally:
        daemon.terminate()
        try:daemon.wait(timeout=5)
        except subprocess.TimeoutExpired:daemon.kill();daemon.wait()
