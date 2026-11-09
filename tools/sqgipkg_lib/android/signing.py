"""External signing configuration; never serialize passwords into build inputs."""
from contextlib import contextmanager
import fcntl
import hashlib
import os
from pathlib import Path
import re
import subprocess
import shutil
import tempfile

VARIABLES = ['SQGI_ANDROID_KEYSTORE', 'SQGI_ANDROID_KEY_ALIAS',
             'SQGI_ANDROID_STORE_PASSWORD', 'SQGI_ANDROID_KEY_PASSWORD']


def configured(variant):
    if variant not in ('debug', 'release'):
        raise ValueError('Android variant must be debug or release')
    supplied = any(os.environ.get(name) for name in VARIABLES)
    if supplied or variant == 'release':
        missing = [name for name in VARIABLES if not os.environ.get(name)]
        if missing:
            raise ValueError('Android signing requires external environment settings: ' + ', '.join(missing))
        if not Path(os.environ[VARIABLES[0]]).is_file():
            raise ValueError('SQGI_ANDROID_KEYSTORE must identify an existing keystore')
    return supplied


def environment(java):
    env = dict(os.environ, JAVA_HOME=str(java), LC_ALL='C.UTF-8', LANG='C.UTF-8')
    if env.get('SQGI_ANDROID_KEYSTORE'):
        env['SQGI_ANDROID_KEYSTORE'] = str(Path(env['SQGI_ANDROID_KEYSTORE']).resolve())
    return env


def signing_environment(java):
    env = environment(java)
    if not configured('debug'):
        env.update(SQGI_ANDROID_KEYSTORE=str(Path.home() / '.android/debug.keystore'),
                   SQGI_ANDROID_KEY_ALIAS='androiddebugkey', SQGI_ANDROID_STORE_PASSWORD='android',
                   SQGI_ANDROID_KEY_PASSWORD='android')
    return env


def prepare_debug_key(java):
    if configured('debug'):
        return
    env = signing_environment(java)
    path = Path(env['SQGI_ANDROID_KEYSTORE'])
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.with_suffix('.sqgipkg.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX)
        if not path.exists():
            subprocess.run([java / 'bin/keytool', '-genkeypair', '-keystore', path,
                '-alias', env['SQGI_ANDROID_KEY_ALIAS'], '-storepass:env', 'SQGI_ANDROID_STORE_PASSWORD',
                '-keypass:env', 'SQGI_ANDROID_KEY_PASSWORD', '-keyalg', 'RSA', '-keysize', '2048',
                '-validity', '10000', '-dname', 'CN=Android Debug,O=Android,C=US'], env=env, check=True)
            path.chmod(0o600)


def expected_certificate(java):
    env = signing_environment(java)
    certificate = subprocess.check_output([java / 'bin/keytool', '-exportcert',
        '-keystore', env['SQGI_ANDROID_KEYSTORE'], '-alias', env['SQGI_ANDROID_KEY_ALIAS'],
        '-storepass:env', 'SQGI_ANDROID_STORE_PASSWORD'], env=env, stderr=subprocess.PIPE)
    return hashlib.sha256(certificate).hexdigest()


def sign_debug_bundle(source, destination, java):
    # AGP 8.7.1 intentionally skips signing debuggable bundles. Sign a copy so
    # Gradle's incremental output remains intact, using the APK/split identity.
    env = signing_environment(java)
    shutil.copy2(source, destination)
    subprocess.run([java / 'bin/jarsigner', '-keystore', env['SQGI_ANDROID_KEYSTORE'],
        '-storepass:env', 'SQGI_ANDROID_STORE_PASSWORD', '-keypass:env', 'SQGI_ANDROID_KEY_PASSWORD',
        '-digestalg', 'SHA-256', destination, env['SQGI_ANDROID_KEY_ALIAS']],
        env=env, check=True)
    return destination


def verify_apk(path, android_sdk, java, expected=None):
    output = subprocess.check_output([android_sdk / 'build-tools/35.0.0/apksigner', 'verify', '--print-certs', path],
                                     env=environment(java), text=True)
    signers = re.findall(r'Signer #\d+ certificate SHA-256 digest: ([0-9a-fA-F]+)', output)
    if len(signers) != 1 or len(signers[0]) != 64 or (expected and signers[0].lower() != expected):
        raise ValueError('APK signing certificate differs from selected signing identity')
    subprocess.run([android_sdk / 'build-tools/35.0.0/zipalign', '-c', '-P', '16', '4', path], check=True)
    return signers[0].lower()


def verify_aab(path, java, expected=None):
    output = subprocess.check_output([java / 'bin/jarsigner', '-verify', path], env=environment(java), text=True)
    if 'jar verified.' not in output:
        raise ValueError('Android bundle has no verified JAR signature')
    certificates = subprocess.check_output([java / 'bin/keytool', '-printcert', '-jarfile', path],
                                           env=environment(java), text=True, stderr=subprocess.PIPE)
    checksums = re.findall(r'SHA256:\s*([0-9A-Fa-f:]+)', certificates)
    if not checksums or len(re.findall(r'Signer #\d+:', certificates)) != 1:
        raise ValueError('Android bundle must have one signing certificate')
    checksum = checksums[0].replace(':', '').lower()
    if len(checksum) != 64 or (expected and checksum != expected):
        raise ValueError('Bundle signing certificate differs from selected signing identity')
    return checksum


@contextmanager
def bundle_arguments(java):
    env = signing_environment(java)
    # bundletool supports password files. Keep them outside the build/project
    # tree, mode 0600, and remove them immediately after the signing subprocess.
    with tempfile.TemporaryDirectory(prefix='sqgipkg-sign-') as temporary:
        root = Path(temporary)
        for name, variable in [('store', 'SQGI_ANDROID_STORE_PASSWORD'), ('key', 'SQGI_ANDROID_KEY_PASSWORD')]:
            with (root / name).open('x') as stream:
                (root / name).chmod(0o600)
                stream.write(env[variable])
        yield ['--ks=' + str(Path(env['SQGI_ANDROID_KEYSTORE']).resolve()),
               '--ks-key-alias=' + env['SQGI_ANDROID_KEY_ALIAS'],
               '--ks-pass=file:' + str(root / 'store'), '--key-pass=file:' + str(root / 'key')]
