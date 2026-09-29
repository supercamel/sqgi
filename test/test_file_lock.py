"""Exercise real OS ownership through separate SQGI processes (also Windows)."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import time
import unittest

RUNTIME = str(Path(sys.argv.pop(1)).resolve())

class FileLocks(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='sqgi lock ü ')
        self.root = Path(self.temp.name)
        self.path = self.root / 'writer.lock'
        self.serial = 0

    def tearDown(self):
        self.temp.cleanup()

    def script(self, text):
        self.serial += 1
        script = self.root / f'probe{self.serial}.nut'
        script.write_text('local S=import("system");local G=import("GLib");\n'
                          + 'local path=' + json.dumps(str(self.path), ensure_ascii=False) + ';\n'
                          + text, encoding='utf-8')
        return [RUNTIME, str(script)]

    def run_nut(self, text):
        p = subprocess.run(self.script(text), capture_output=True, text=True, timeout=15)
        self.assertEqual(p.returncode, 0, p.stdout + p.stderr)
        self.assertNotIn('AN ERROR HAS OCCURRED', p.stdout + p.stderr)

    def test_close_gc_and_existing_contents(self):
        self.path.write_bytes(b'existing contents')
        self.run_nut('''
local a=S.try_file_lock(path);if(a==null)throw "first acquisition";
if(S.try_file_lock(path)!=null)throw "same process contention";
a.close();a.close();
local b=S.try_file_lock(path);if(b==null)throw "explicit release";
b=null;collectgarbage();
local c=S.try_file_lock(path);if(c==null)throw "GC release";c.close();
local invalid=["",123,"bad\\0path",path+"/missing"];
foreach(p in invalid){local failed=false;try{S.try_file_lock(p)}catch(e){failed=true};if(!failed)throw "invalid path accepted";}
''')
        self.assertEqual(self.path.read_bytes(), b'existing contents')

    def holder(self):
        ready = self.root / 'ready'
        child = subprocess.Popen(self.script('local lock=S.try_file_lock(path);if(lock==null)throw "busy";'
            + 'G.file_set_contents(' + json.dumps(str(ready)) + ',"ready",-1);'
            + 'while(true)G.usleep(10000);'), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        deadline = time.monotonic() + 10
        while not ready.exists():
            if child.poll() is not None or time.monotonic() > deadline:
                child.kill(); out, err = child.communicate()
                self.fail(f'Holder failed: {out!r} {err!r}')
            time.sleep(.02)
        return child

    def test_contention_and_crash_release(self):
        child = self.holder()
        try:
            self.run_nut('if(S.try_file_lock(path)!=null)throw "foreign writer admitted";')
        finally:
            child.kill();child.communicate(timeout=10)
        # Windows can briefly defer kernel lock cleanup after process termination.
        self.run_nut('''local lock=null;for(local i=0;i<100 && lock==null;i++){
lock=S.try_file_lock(path);if(lock==null)G.usleep(20000);}
if(lock==null)throw "crash left stale ownership";lock.close();''')
        self.assertTrue(self.path.exists())

    def test_normal_process_exit(self):
        self.run_nut('local held=S.try_file_lock(path);if(held==null)throw "acquire";')
        self.run_nut('local held=S.try_file_lock(path);if(held==null)throw "exit retained lock";held.close();')

    def test_simultaneous_contenders(self):
        ready = self.root / 'winner'
        code = ('local lock=S.try_file_lock(path);if(lock!=null){'
                + 'G.file_set_contents(' + json.dumps(str(ready)) + ',"ready",-1);'
                + 'while(true)G.usleep(10000);}')
        children = [subprocess.Popen(self.script(code), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                    for _ in range(6)]
        try:
            deadline = time.monotonic() + 10
            while time.monotonic() < deadline:
                if ready.exists() and sum(p.poll() is None for p in children) == 1:
                    break
                time.sleep(.02)
            self.assertTrue(ready.exists())
            self.assertEqual(sum(p.poll() is None for p in children), 1)
            for p in children:
                if p.poll() is not None:
                    out, err = p.communicate();self.assertEqual(p.returncode, 0, out + err)
        finally:
            for p in children:
                if p.poll() is None:p.kill()
                p.communicate(timeout=10)

    @unittest.skipIf(os.name == 'nt', 'Unix exec descriptor inheritance')
    def test_child_does_not_inherit_lock(self):
        ready = self.root / 'child-pid'
        code = ('local lock=S.try_file_lock(path);local Gio=import("Gio");'
                + 'local child=Gio.Subprocess.new([' + json.dumps(sys.executable)
                + ',"-c","import time; time.sleep(30)"],'
                + 'Gio.SubprocessFlags.inherit_fds|Gio.SubprocessFlags.stdout_silence|Gio.SubprocessFlags.stderr_silence);'
                + 'G.file_set_contents(' + json.dumps(str(ready)) + ',child.get_identifier(),-1);'
                + 'while(true)G.usleep(10000);')
        parent = subprocess.Popen(self.script(code), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        pid = None
        try:
            deadline = time.monotonic() + 10
            while not ready.exists() and time.monotonic() < deadline:time.sleep(.02)
            self.assertTrue(ready.exists());pid = int(ready.read_text())
            parent.kill();parent.communicate(timeout=10)
            os.kill(pid, 0)
            self.run_nut('local l=S.try_file_lock(path);if(l==null)throw "child inherited ownership";l.close();')
        finally:
            if parent.poll() is None:parent.kill()
            parent.communicate(timeout=10)
            if pid is not None:
                try:os.kill(pid, 9)
                except ProcessLookupError:pass

    @unittest.skipIf(os.name == 'nt', 'Unix symlink and FIFO safety')
    def test_nonregular(self):
        target = self.root / 'target';target.write_text('untouched')
        self.path.symlink_to(target)
        reject='local failed=false;try{S.try_file_lock(path)}catch(e){failed=true};if(!failed)throw "unsafe target";'
        self.run_nut(reject)
        self.assertEqual(target.read_text(), 'untouched')
        self.path.unlink();os.mkfifo(self.path);self.run_nut(reject)

if __name__ == '__main__':
    unittest.main()
