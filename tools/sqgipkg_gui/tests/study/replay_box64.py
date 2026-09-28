#!/usr/bin/env python3
"""Diagnostic replay of a recorded private Wine command with Box64."""
import argparse
import hashlib
import json
import os
import re
from pathlib import Path
import subprocess
import shutil
import shlex
import stat
import time
from runner_support import crash_diagnostics, network_peer_files, software_gl_files
from isolated_linux import dependencies

p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--record',type=Path,required=True)
p.add_argument('--prefix',type=Path,required=True)
p.add_argument('--output',type=Path,required=True)
p.add_argument('--emulator',type=Path,default=Path('/usr/bin/box64'))
p.add_argument('--appdir',type=Path)
p.add_argument('--scene-checks',action='store_true')
p.add_argument('--network-checks',action='store_true')
p.add_argument('--serial-from-env',action='store_true')
p.add_argument('--native-software-gl',action='store_true',help='Explicit native Mesa wrapper closure for graphics comparison')
p.add_argument('--wait-wineserver',help='Explicit namespace path to wineserver; keep namespace alive for spawned installer processes')
p.add_argument('--display-session',type=Path)
p.add_argument('--timeout',type=int,default=40)
p.add_argument('--native-font-wrappers',action='store_true',help='Diagnostic native font-library comparison')
a=p.parse_args()
emulator=a.emulator.resolve(strict=True)
assert not a.output.exists() and not a.output.with_suffix('.txt').exists()
assert not a.prefix.exists(), 'Use a fresh private comparison prefix'
baseline=json.loads(a.record.read_text())
assert baseline['scope']=='Private Wine under QEMU; no native Windows result'
display = None
if baseline.get('display'):
    assert a.display_session, 'Graphical replay requires a newly verified private display'
if a.display_session:
    state=json.loads((a.display_session / 'display.json').read_text())
    for key in ['supervisor_pid','xvfb_pid']: os.kill(state[key],0)
    display=state['display']
    assert re.fullmatch(r':[0-9]+',display) and int(display[1:])>1
    assert Path('/proc',str(state['xvfb_pid']),'exe').resolve().name=='Xvfb'
    assert 'headless.py' in Path('/proc',str(state['supervisor_pid']),'cmdline').read_text()
    assert baseline.get('display'), 'Use a graphical baseline to retain its runner libraries'
if a.scene_checks and a.network_checks: raise SystemExit('Choose one peer fixture')
if (a.scene_checks or a.network_checks) and not display: raise SystemExit('Scene checks require a verified private display')
appdir=a.appdir.resolve(strict=True) if a.appdir else None
subprocess.run(['cp','-a','--reflink=auto',baseline['prefix'],str(a.prefix)],check=True)
argv=baseline['argv'][:]
for i,value in enumerate(argv):
    if i and argv[i-1]=='--ro-bind' and value=='/usr/bin/qemu-x86_64':
        argv[i]=str(emulator)
    if value==baseline['prefix'] and i and argv[i-1]=='--bind':
        argv[i]=str(a.prefix.resolve())
if appdir:
    matches=[i for i in range(1,len(argv)-1) if argv[i-1]=='--ro-bind' and argv[i+1]=='/app']
    assert len(matches)==1
    argv[matches[0]]=str(appdir)
if display:
    old_socket='/tmp/.X11-unix/X'+baseline['display'][1:]
    new_socket='/tmp/.X11-unix/X'+display[1:]
    argv=[new_socket if value==old_socket else value for value in argv]
    for i in range(2,len(argv)):
        if argv[i-2:i]==['--setenv','DISPLAY']: argv[i]=display
split=argv.index('--')
serial_device=None
if a.serial_from_env:
    serial_device=os.environ.get('SQGI_STUDY_SERIAL_DEVICE','')
    if not re.fullmatch(r'/dev/pts/[0-9]+',serial_device) or not stat.S_ISCHR(os.stat(serial_device).st_mode):
        raise SystemExit('Expected the private serial peer PTY')
    if '/dev/study-serial' in argv or 'SQGI_STUDY_SERIAL_DEVICE' in argv:
        raise SystemExit('Refusing an inherited serial binding')
    com=a.prefix / 'dosdevices/com1'
    com.parent.mkdir(parents=True,exist_ok=True)
    if com.is_symlink():
        if os.readlink(com) != '/dev/study-serial':
            raise SystemExit('Refusing to change an existing Wine COM1 mapping')
    elif com.exists():
        raise SystemExit('Refusing to replace an existing Wine COM1 file')
    else:
        com.symlink_to('/dev/study-serial')
    argv[split:split]=['--dev-bind',serial_device,'/dev/study-serial',
                       '--setenv','SQGI_STUDY_SERIAL_DEVICE','COM1']
    split=argv.index('--')
extra={}
for name in ['libresolv.so.2','libdl.so.2','libpthread.so.0','libutil.so.1','librt.so.1','liblzma.so.5']:
    extra['/lib/aarch64-linux-gnu/'+name]=str(Path('/usr/lib/aarch64-linux-gnu',name).resolve(strict=True))
if display and a.native_font_wrappers:
    for name in ['libfreetype.so.6','libfontconfig.so.1','libz.so.1','libbz2.so.1.0','libbrotlidec.so.1','libexpat.so.1']:
        source=Path('/usr/lib/aarch64-linux-gnu',name).resolve(strict=True)
        extra['/lib/aarch64-linux-gnu/'+name]=str(source)
        for library in dependencies(str(source)):
            extra[library]=str(Path(library).resolve())
for name in ['lscpu','grep','sed']:
    source=str(Path(shutil.which(name)).resolve())
    extra['/usr/bin/'+name]=source
    for library in dependencies(source):
        extra[library]=str(Path(library).resolve())
if a.scene_checks or a.network_checks:
    network_inputs=network_peer_files()
    extra.update(network_inputs)
    extra['/runner/scene_http_peer.py']=str(Path(__file__).with_name('scene_http_peer.py').resolve())
    for path in [Path('/usr/bin/python3').resolve(), *[Path(value) for value in network_inputs.values() if value.endswith('.so')]]:
        for dependency in dependencies(path): extra[dependency]=str(Path(dependency).resolve())
if a.native_software_gl:
    if not display: raise SystemExit('Native GL comparison requires private display')
    extra.update(software_gl_files(Path('/'),'aarch64',appdir or Path('/nonexistent-study-app')))
mounts=[]
for dest,source in extra.items():
    mounts += ['--ro-bind',source,dest]
argv[split:split]=[*mounts,
    '--setenv','BOX64_LD_LIBRARY_PATH','/target/usr/lib/x86_64-linux-gnu:/target/lib/x86_64-linux-gnu',
    '--setenv','BOX64_PATH','/usr/bin:/usr/lib/wine:/opt/wine-stable/bin']
if a.native_software_gl:
    split=argv.index('--')
    argv[split:split]=['--setenv','LIBGL_DRIVERS_PATH','/usr/lib/aarch64-linux-gnu/dri',
                      '--setenv','__EGL_VENDOR_LIBRARY_FILENAMES','/runner/50_mesa.json']
if a.wait_wineserver:
    split=argv.index('--')
    command=argv[split+1:]
    script=shlex.join(command)+'; study_status=$?; '+shlex.join(['/usr/bin/qemu-x86_64',a.wait_wineserver,'-w'])+'; study_wait=$?; if [ "$study_status" -ne 0 ]; then exit "$study_status"; fi; exit "$study_wait"'
    argv[split+1:]=['/usr/bin/bash','-c',script]
scene_directory=None
if a.scene_checks:
    scene_directory=a.output.with_suffix('').with_name(a.output.stem+'-scene').resolve()
    scene_directory.mkdir(exist_ok=False)
    split=argv.index('--')
    command=argv[split+1:]
    argv[split:]=['--bind',str(scene_directory),'/evidence','--','/usr/bin/study-python',
        '/runner/scene_http_peer.py','--evidence','/evidence','--timeout',str(a.timeout-5),'--',*command]
network_directory=None
if a.network_checks:
    network_directory=a.output.with_suffix('').with_name(a.output.stem+'-network').resolve()
    network_directory.mkdir(exist_ok=False)
    split=argv.index('--'); command=argv[split+1:]
    argv[split:]=['--bind',str(network_directory),'/evidence','--','/usr/bin/study-python',
        '/runner/network_peer.py','--report','/evidence/network.json',
        '--tcp-expect','6c696e652d746573740d0a','--tcp-expect','000141ff',
        '--udp-expect','7564702d746573740a','--udp-expect','ff007f20',
        '--timeout',str(a.timeout-5),'--',*command]
meta=dict(argv=argv,baseline_record=str(a.record),prefix=str(a.prefix),started=time.time(),
    serial_device=serial_device,
    scope='Box64 diagnostic; isolated alternate emulator, no native Windows result',
    display=display, appdir=str(appdir) if appdir else None, scene_directory=str(scene_directory) if scene_directory else None, network_directory=str(network_directory) if network_directory else None,
    emulator_version=subprocess.check_output([str(emulator),'--version'],text=True),
    emulator_sha256=hashlib.sha256(emulator.read_bytes()).hexdigest(),
    extra_runner_files={dest:{'source':source,'sha256':hashlib.sha256(Path(source).read_bytes()).hexdigest()} for dest,source in extra.items()})
a.output.write_text(json.dumps(meta,indent=2)+'\n')
with a.output.with_suffix('.txt').open('w') as log:
    try:status=subprocess.run(argv,stdout=log,stderr=subprocess.STDOUT,timeout=a.timeout).returncode
    except subprocess.TimeoutExpired:status=124
out=a.output.with_suffix('.txt').read_text(errors='replace')
markers=baseline.get('required_markers',[])
fatal=crash_diagnostics(out)+[line for line in out.splitlines() if any(s in line.lower() for s in ['segmentation fault','sigsegv','sigabrt','illegal instruction'])]
passed=status==0 and not fatal and all(s in out for s in markers)
meta.update(exit_status=status,finished=time.time(),fatal_diagnostics=fatal,missing_markers=[s for s in markers if s not in out],acceptance='pass' if passed else 'fail')
a.output.write_text(json.dumps(meta,indent=2)+'\n')
print(status,meta['acceptance']);print(out[-1800:])
raise SystemExit(0 if passed else (status or 1))
