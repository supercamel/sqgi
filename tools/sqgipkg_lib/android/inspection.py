"""Pinned Bionic userspaces for desktop GI inspection; never APK payloads."""
import fcntl
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import urllib.request
import zipfile

from android_image import extract_system
from common import atomic_json, digest, encoded, file_hash

HERE = Path(__file__).resolve().parent
APEXES = {'com.android.runtime': 'com.android.runtime', 'com.android.i18n': 'com.android.i18n',
          'com.google.android.art': 'com.android.art'}
LINKER_CONFIG = '''dir.default = /
[default]
namespace.default.isolated = false
namespace.default.search.paths = /system/lib64:/apex/com.android.runtime/lib64/bionic:/apex/com.android.art/lib64:/apex/com.android.i18n/lib64
'''


def inventory(root):
    return {p.relative_to(root).as_posix(): ({'link': str(p.readlink())} if p.is_symlink() else
             {'sha256': file_hash(p), 'mode': p.stat().st_mode & 0o777})
            for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()}


class Inspection:
    def __init__(self, abi, location=None):
        self.abi = abi
        self.lock = json.loads((HERE / 'inspection.lock.json').read_text())
        self.identity = {'abi': abi, 'image': self.lock['images'][abi], 'qemu': self.lock['qemu'],
                         'recipes': {n: file_hash(HERE / n) for n in ['inspection.py', 'android_image.py']}}
        self.key = digest(encoded(self.identity))
        self.cache = Path(os.environ.get('XDG_CACHE_HOME', Path.home() / '.cache')) / 'sqgipkg/android'
        self.directory = Path(location).resolve() if location else self.cache / 'inspection' / abi / self.key
        self.root = self.directory / 'sysroot'
        self.program = 'qemu-aarch64' if abi == 'arm64-v8a' else 'qemu-x86_64'
        self.qemu = self.directory / 'host/usr/bin' / self.program
        self.manifest = self.directory / 'inspection.json'

    def validate(self):
        metadata = json.loads(self.manifest.read_text())
        if (metadata.get('identity') != self.identity or metadata.get('sysroot') != inventory(self.root) or
                metadata.get('qemu_sha256') != file_hash(self.qemu)):
            raise ValueError('Android inspection runtime is changed or incompatible: ' + str(self.directory))
        return self

    def fetch(self, record, offline):
        path = self.cache / 'inspection-downloads' / record['name']
        path.parent.mkdir(parents=True, exist_ok=True)
        if not path.exists():
            if offline:
                raise ValueError('Offline Android inspection requires cached ' + record['name'])
            temporary = path.with_suffix(path.suffix + '.download')
            try:
                print('sqgipkg: downloading inspection input ' + record['url'], flush=True)
                with urllib.request.urlopen(record['url'], timeout=90) as response, temporary.open('wb') as output:
                    shutil.copyfileobj(response, output, 1024 * 1024)
                if temporary.stat().st_size != record['size'] or file_hash(temporary) != record['sha256']:
                    raise ValueError('Android inspection download checksum mismatch: ' + path.name)
                temporary.replace(path)
            finally:
                temporary.unlink(missing_ok=True)
        if path.stat().st_size != record['size'] or file_hash(path) != record['sha256']:
            raise ValueError('Android inspection cache checksum mismatch: ' + path.name)
        return path

    def prepare(self, offline=False):
        self.directory.parent.mkdir(parents=True, exist_ok=True)
        # The downloads are shared across ABIs as well as projects.
        self.cache.mkdir(parents=True, exist_ok=True)
        with (self.cache / 'inspection.lock').open('a') as lock:
            fcntl.flock(lock, fcntl.LOCK_EX)
            if self.manifest.exists():
                return self.validate()
            if self.directory.exists():
                raise ValueError('Refusing to replace an unowned Android inspection directory')
            qemu = self.fetch(self.lock['qemu'], offline)
            image = self.fetch(self.lock['images'][self.abi], offline)
            temporary = Path(tempfile.mkdtemp(prefix='.inspection-', dir=self.directory.parent))
            try:
                root, work = temporary / 'sysroot', temporary / 'extract'
                root.mkdir(); work.mkdir()
                subprocess.run(['dpkg-deb', '-x', qemu, temporary / 'host'], check=True)
                with zipfile.ZipFile(image) as archive:
                    with archive.open(self.abi + '/system.img') as source, (work / 'system.img').open('wb') as output:
                        shutil.copyfileobj(source, output, 1024 * 1024)
                extract_system(work / 'system.img', work / 'system.ext4')
                log = work / 'debugfs.log'

                def debug(command, image=work / 'system.ext4', cwd=root):
                    with log.open('a') as output:
                        subprocess.run(['/usr/sbin/debugfs', '-R', command, image], cwd=cwd,
                                       stdout=output, stderr=subprocess.STDOUT, check=True)

                (root / 'system').mkdir()
                debug('rdump /system/lib64 system')
                for name, mount in APEXES.items():
                    debug('dump /system/apex/' + name + '.apex ' + name + '.apex', cwd=work)
                    with zipfile.ZipFile(work / (name + '.apex')) as archive:
                        with archive.open('apex_payload.img') as source, (work / (name + '.img')).open('wb') as output:
                            shutil.copyfileobj(source, output)
                    destination = root / 'apex' / mount
                    destination.mkdir(parents=True)
                    debug('rdump / .', image=work / (name + '.img'), cwd=destination)
                (root / 'system/bin').mkdir()
                (root / 'system/bin/linker64').symlink_to('../../apex/com.android.runtime/bin/linker64')
                for path in root.rglob('*'):
                    if path.is_symlink() and str(path.readlink()).startswith('/'):
                        target = root / str(path.readlink()).lstrip('/')
                        path.unlink(); path.symlink_to(os.path.relpath(target, path.parent))
                (root / 'linkerconfig').mkdir()
                (root / 'linkerconfig/ld.config.txt').write_text(LINKER_CONFIG)
                errors = [line for line in log.read_text().splitlines()
                          if line and not line.startswith('debugfs ') and
                          'Operation not permitted while changing ownership of ' not in line]
                if errors:
                    raise ValueError('Android userspace extraction failed: ' + '\n'.join(errors[-10:]))
                for name in ['system/bin/linker64', 'system/lib64/libandroid.so',
                             'apex/com.android.runtime/lib64/bionic/libc.so']:
                    if (root / name).read_bytes()[:4] != b'\x7fELF':
                        raise ValueError('Android inspection userspace lacks ' + name)
                atomic_json(temporary / 'inspection.json', {'identity': self.identity,
                    'qemu_sha256': file_hash(temporary / 'host/usr/bin' / self.program), 'sysroot': inventory(root)})
                shutil.rmtree(work)
                temporary.replace(self.directory)
            finally:
                if temporary.exists():
                    shutil.rmtree(temporary)
        return self.validate()

    def execute(self, binary, arguments, libraries, typelibs, env=None):
        # The caller validates permitted target build/SDK roots before this
        # method. QEMU itself must never inherit target library search paths.
        host_env = dict(os.environ if env is None else env)
        for key in ['LD_LIBRARY_PATH', 'LD_PRELOAD', 'GI_TYPELIB_PATH']:
            host_env.pop(key, None)
        libraries = [*libraries, self.root / 'system/lib64', self.root / 'apex/com.android.runtime/lib64/bionic',
                     self.root / 'apex/com.android.art/lib64', self.root / 'apex/com.android.i18n/lib64']
        command = [self.qemu, '-L', self.root, '-E', 'LD_LIBRARY_PATH=' + os.pathsep.join(map(str, libraries)),
                   '-E', 'GI_TYPELIB_PATH=' + os.pathsep.join(map(str, typelibs)), binary, *arguments]
        # API 31 userdebug linkers accept an explicit configuration. Generate
        # its directory routing per invocation, so the immutable userspace has
        # no producer/project path baked in and can run a binary at any prefix.
        parent = str(Path(binary).resolve().parent)
        if '\n' in parent or '\r' in parent:
            raise ValueError('Android execution paths cannot contain newlines')
        with tempfile.NamedTemporaryFile(mode='w', suffix='.ld.config.txt') as config:
            config.write(LINKER_CONFIG.replace('dir.default = /\n', 'dir.default = ' + parent + '\n'))
            config.flush()
            host_env['LD_CONFIG_FILE'] = config.name
            subprocess.run(command, env=host_env, check=True, timeout=120)
