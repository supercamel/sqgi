"""Native PE launcher execution under Wine; not native-Windows release qualification."""
import json
import hashlib
import os
from pathlib import Path
import shutil
import struct
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
FIXTURES = Path(__file__).resolve().parent
SQGI = sys.argv[1] if len(sys.argv) > 1 else os.environ.get('SQGI', 'sqgi')

def build(output, native=False):
    subprocess.run([SQGI, str(FIXTURES / 'windows_launcher_build.nut'), str(output),
                    'native' if native else 'sqgi'], check=True, timeout=60)
    return {'backend': 'sqgipkg SQGI Windows launcher builder'}

def win(path):
    return "Z:" + str(Path(path).resolve()).replace("/", "\\")

def host(path, prefix):
    if path.startswith("Z:"):
        return Path(path[2:].replace("\\", "/"))
    assert path.startswith("C:\\"), path
    return prefix / "drive_c" / path[3:].replace("\\", "/")

def main():
    with tempfile.TemporaryDirectory(prefix="sqgipkg-win-launcher-") as temporary:
        base = Path(temporary)
        package = base / "portable 航 & ! % ^ (app)"
        package.mkdir()
        binary = package / "bin"; binary.mkdir()
        helper = binary / "sqgi.exe"
        subprocess.run(["x86_64-w64-mingw32-g++", "-std=c++17", "-O2", "-municode",
                        "-static-libgcc", "-static-libstdc++", str(FIXTURES / "windows_launcher_probe.cpp"),
                        "-o", str(helper)], check=True, timeout=60)
        shutil.copyfile(helper, binary / "gdk-pixbuf-query-loaders.exe")
        shutil.copyfile(helper, binary / "detached-launch.exe")
        script = package / "share/sqgi/app/main.nut"
        script.parent.mkdir(parents=True); script.write_text("// fixture\n")
        schemas = package / "share/glib-2.0/schemas/gschemas.compiled"
        schemas.parent.mkdir(parents=True); schemas.write_bytes(b"fixture")
        build_report = build(package)
        for name, subsystem in [("LauncherTest.exe", 2), ("LauncherTest-console.exe", 3)]:
            data = (package / name).read_bytes()
            pe = struct.unpack_from("<I", data, 0x3c)[0]
            assert struct.unpack_from("<H", data, pe + 24 + 68)[0] == subsystem
        # Moving the whole tree must not require recompiling/reconfiguring it.
        moved = base / "moved 航 & ! % ^ (package)"
        package.rename(moved); package = moved
        def package_hashes():
            return {str(p.relative_to(package)): hashlib.sha256(p.read_bytes()).hexdigest()
                    for p in package.rglob("*") if p.is_file()}
        original = package_hashes()
        cwd = base / "unrelated cwd"; cwd.mkdir()
        env = {k: v for k, v in os.environ.items() if not k.startswith(
            ("WINE", "GI_", "GIO_", "GTK_", "GDK_", "GST_", "SQGI", "GSETTINGS", "LD_LIBRARY"))}
        env.update(WINEPREFIX=str(base / "wineprefix"), WINEARCH="win64", WINEDEBUG="-all",
                   WINEDLLOVERRIDES="mscoree,mshtml=", GI_TYPELIB_PATH="wrong-development-typelibs",
                   SQGI="wrong-development-sqgi", GST_PLUGIN_PATH_1_0="wrong-development-plugins")
        log = base / "wine.log"
        def run(args, report, extra=None, gui=False):
            e = dict(env, SQGIPKG_TEST_REPORT=win(report)); e.update(extra or {})
            with log.open("ab") as output:
                p = subprocess.run(["wine", win(package / ("LauncherTest.exe" if gui else "LauncherTest-console.exe")), *args],
                                   cwd=cwd, env=e, stdout=output, stderr=subprocess.STDOUT, timeout=45)
            return p.returncode
        try:
            values = ["--data-dir", "relative 航 & ! % ^ (data)", "", 'a"b', "tail\\", "two\\\\\"quotes", "line\nbreak"]
            report = base / "arguments.json"
            assert run(values, report, {"SQGIPKG_TEST_EXIT": "37"}) == 37, log.read_text(errors="replace")
            observed = json.loads(report.read_text())
            assert observed["args"] == [win(package / "share/sqgi/app/main.nut"), *values], observed
            assert observed["cwd"] == win(cwd), observed
            assert observed["cache_present"] and not host(observed["cache"], base / "wineprefix").exists()
            assert observed["env"]["SQGI"] == win(package / "bin/sqgi.exe")
            assert observed["env"]["GI_TYPELIB_PATH"] == win(package / "lib/girepository-1.0")
            assert observed["env"]["GST_PLUGIN_PATH_1_0"] == win(package / "lib/gstreamer-1.0")
            assert observed["env"]["GDK_BACKEND"] == "win32"
            assert "wrong-development" not in json.dumps(observed)
            assert run([], base / "gui.json", gui=True) == 0
            assert (base / "gui.json").exists(), log.read_text(errors="replace")
            with log.open("ab") as output:
                detached = subprocess.run(["wine", win(package / "bin/detached-launch.exe"), win(package / "LauncherTest.exe")],
                                          cwd=cwd, env=dict(env, SQGIPKG_TEST_REPORT=win(base / "detached.json")),
                                          stdout=output, stderr=subprocess.STDOUT, timeout=45)
            assert detached.returncode == 0 and (base / "detached.json").exists()
            for setting in ["SQGIPKG_TEST_CACHE_FAIL", "SQGIPKG_TEST_CACHE_EMPTY", "SQGIPKG_TEST_CACHE_HANG"]:
                report = base / (setting + ".json")
                assert run([], report, {setting: "yes"}) == 1
                assert not report.exists(), "Application started after cache preparation failed"
            schema = package / "share/glib-2.0/schemas/gschemas.compiled"
            schema.rename(schema.with_suffix(".held"))
            assert run([], base / "missing.json") == 1
            assert not (base / "missing.json").exists()
            schema.with_suffix(".held").rename(schema)
            # Concurrent launches must never share/truncate the same loader cache.
            children = []
            with log.open("ab") as output:
                for i in range(2):
                    e = dict(env, SQGIPKG_TEST_REPORT=win(base / f"parallel{i}.json"), SQGIPKG_TEST_WAIT="yes")
                    children.append(subprocess.Popen(["wine", win(package / "LauncherTest-console.exe")],
                                                     cwd=cwd, env=e, stdout=output, stderr=subprocess.STDOUT))
                for child in children: assert child.wait(timeout=15) == 0
            results = [json.loads((base / f"parallel{i}.json").read_text()) for i in range(2)]
            assert results[0]["cache"] != results[1]["cache"]
            assert all(v["cache_present"] and not host(v["cache"], base / "wineprefix").exists() for v in results)
            assert not list(host(observed["cache"], base / "wineprefix").parent.glob("pix*.tmp"))
            assert package_hashes() == original, "Launcher changed package contents"
            # Native entrypoints and console-only SQGI programs need no GTK
            # schema, image-loader helper or even a SQGI runtime for native code.
            for native in (False, True):
                minimal = base / ('native 航' if native else 'minimal 航')
                (minimal / 'bin').mkdir(parents=True)
                shutil.copyfile(helper if helper.exists() else package / 'bin/sqgi.exe',
                                minimal / ('bin/native.exe' if native else 'bin/sqgi.exe'))
                if not native:
                    script = minimal / 'share/sqgi/app/main.nut'
                    script.parent.mkdir(parents=True); script.write_text('// fixture\n')
                build(minimal, native)
                report = base / ('native.json' if native else 'minimal.json')
                with log.open('ab') as output:
                    child = subprocess.run(['wine', win(minimal / 'LauncherTest-console.exe'), *values],
                                           env=dict(env, SQGIPKG_TEST_REPORT=win(report)), cwd=cwd,
                                           stdout=output, stderr=subprocess.STDOUT, timeout=45)
                assert child.returncode == 0, log.read_text(errors='replace')
                actual = json.loads(report.read_text())
                assert actual['args'] == ([] if native else [win(script)]) + values
                assert actual['cwd'] == win(cwd) and not actual['cache_present']
            evidence = {"execution": "Windows x86_64 PE binaries under Wine on Linux",
                        "native_windows_qualified": False, "build": build_report,
                        "wine_version": subprocess.check_output(["wine", "--version"], text=True).strip(),
                        "checks": ["GUI/console PE subsystems and detached GUI without inherited handles", "relocated Unicode and shell metacharacters",
                                   "exact argument forwarding and cwd", "bundled runtime environment",
                                   "child exit code", "helper error/empty-cache/30-second timeout",
                                   "missing schema refusal", "concurrent cache isolation and cleanup",
                                   "unchanged install files", "minimal SQGI and native entrypoints without GTK"]}
            (ROOT / "build").mkdir(exist_ok=True)
            (ROOT / "build/windows-launcher-evidence.json").write_text(json.dumps(evidence, indent=2) + "\n")
            print("PASS Windows PE launcher under Wine: moved Unicode/metacharacter path, exact arguments/cwd, runtime isolation, GUI/console, child status, cache failures, concurrent cache cleanup")
        finally:
            subprocess.run(["wineserver", "-k"], env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=10)
            if log.exists():
                (ROOT / "build").mkdir(exist_ok=True)
                shutil.copyfile(log, ROOT / "build/windows-launcher-wine.log")

if __name__ == "__main__":
    main()
