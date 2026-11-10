"""Installed-command onboarding contracts; no network or real devices."""
import hashlib
import json
import os
import platform
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[2]
SQGI = Path(sys.argv.pop(1)).resolve() if len(sys.argv) > 1 else ROOT / "build/sqgi"


class AndroidSetup(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="sqgi setup ")
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.env = dict(os.environ)
        for name in ["JAVA_HOME", "ANDROID_SDK_ROOT", "ANDROID_HOME", "ANDROID_NDK_HOME", "ADB", "SQGI_ANDROID_AAPT2", "SQGI_ANDROID_ZIPALIGN"]:
            self.env.pop(name, None)
        for name, directory in [("XDG_CONFIG_HOME", "config"), ("XDG_DATA_HOME", "data"), ("XDG_CACHE_HOME", "cache")]:
            self.env[name] = str(self.root / directory)
        self.java = self.root / "jdk"
        self.sdk = self.root / "sdk"
        self.program(self.java / "bin/javac", "printf 'javac 21.0.8\\n'\n")
        self.program(self.java / "bin/java", "exit 0\n")
        self.env["JAVA_HOME"] = str(self.java)
        self.env["ANDROID_SDK_ROOT"] = str(self.sdk)

    def program(self, path, text):
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text("#!/bin/sh\n" + text)
        path.chmod(0o755)

    def cli(self, *args):
        return subprocess.run([SQGI, ROOT / "tools/sqgipkg", *args], env=self.env,
                              cwd=self.root, text=True, capture_output=True, timeout=15)

    def bridge(self, operation, **values):
        request = self.root / "request.json"
        request.write_text(json.dumps(dict(operation=operation, **values)))
        result = subprocess.run([SQGI, ROOT / "tools/sqgipkg_tests/android_backend_test.nut", request],
                                env=self.env, text=True, capture_output=True, timeout=15)
        return json.loads(result.stdout)

    def test_read_only_report_works_without_a_manifest_and_writes_nothing(self):
        before = sorted(str(p) for p in self.root.rglob("*"))
        result = self.cli("setup", "--platform", "android", "--check", "--json")
        self.assertEqual(result.returncode, 1, result.stderr)
        report = json.loads(result.stdout)
        self.assertFalse(report["ok"])
        checks = {c["id"]: c for c in report["checks"]}
        self.assertTrue(checks["jdk"]["ok"])
        self.assertNotIn("ndk", checks)
        self.assertFalse(checks["platform"]["ok"])
        self.assertIn("accept-licenses", checks["platform"]["remedy"])
        self.assertEqual(before, sorted(str(p) for p in self.root.rglob("*")))

    def test_native_setup_explicitly_checks_the_ndk(self):
        report = json.loads(self.cli("setup", "--platform", "android", "--native-tools", "--check", "--json").stdout)
        check = next(c for c in report["checks"] if c["id"] == "ndk")
        self.assertFalse(check["ok"])
        self.assertIn("accept-licenses", check["remedy"])

    def test_arm_prebuilt_packaging_needs_no_ndk_but_sources_do(self):
        sdk = self.root / "runtime"
        sdk.mkdir()
        metadata = dict(application_wrapper=dict(schema=1, package="sqgi-android-wrapper", sources={
            name: hashlib.sha256((ROOT / "tools/sqgipkg_lib/android" / name).read_bytes()).hexdigest()
            for name in ["platform.c", "native_entry.c", "sqgi_android_entry.h"]}),
            files={"usr/lib/libsqgi-platform.so": {}, "usr/lib/libsqgi-entry.so": {}})
        (sdk / "sqgi-android-sdk.json").write_text(json.dumps(metadata))
        for name in ["aapt2", "zipalign"]:
            path = self.root / "host tools" / name
            self.program(path, "exit 0\n")
            self.env["SQGI_ANDROID_" + name.upper()] = str(path)
        request = dict(host_arch="aarch64", sdk=str(sdk), ndk=str(self.root / "missing ndk"),
                       application={"native_entry": {"library": "libapp.so"}},
                       native=[{"android_package": "extras-fixture"}])
        result = self.bridge("resolve-toolchain", **request)
        self.assertTrue(result["ok"], result)
        self.assertIsNone(result["result"]["ndk"])
        for changes in [dict(native=[{}]), dict(runtime_source={})]:
            result = self.bridge("resolve-toolchain", **dict(request, **changes))
            self.assertFalse(result["ok"])
            self.assertIn("prebuilt native packages", result["error"])
        metadata["application_wrapper"]["sources"]["native_entry.c"] = "f" * 64
        (sdk / "sqgi-android-sdk.json").write_text(json.dumps(metadata))
        result = self.bridge("resolve-toolchain", **request)
        self.assertIn("native compiler", result["error"])

    def test_arm_missing_packaging_tools_has_setup_diagnostic(self):
        result = self.bridge("resolve-toolchain", host_arch="aarch64")
        self.assertFalse(result["ok"])
        self.assertIn("setup --platform android", result["error"])

    @unittest.skipUnless(platform.machine() == "aarch64", "ARM host diagnostic")
    def test_arm_emulator_command_explains_host_requirement(self):
        result = self.cli("emulator")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("requires Linux x86_64", result.stdout)
        self.assertFalse(self.sdk.exists())

    def test_saved_paths_work_without_environment_and_explicit_overrides_win(self):
        config = self.root / "config/sqgipkg/android.json"
        config.parent.mkdir(parents=True)
        config.write_text(json.dumps(dict(schema=1, java=str(self.java), android_sdk=str(self.sdk),
                                         ndk=str(self.root / "external ndk"))))
        self.env.pop("JAVA_HOME")
        self.env.pop("ANDROID_SDK_ROOT")
        result = json.loads(self.cli("setup", "--platform", "android", "--check", "--json").stdout)
        self.assertEqual(result["paths"]["java"], str(self.java))
        self.assertEqual(result["paths"]["ndk"], str(self.root / "external ndk"))
        self.env["ANDROID_SDK_ROOT"] = str(self.root / "other sdk")
        result = json.loads(self.cli("setup", "--platform", "android", "--check", "--json").stdout)
        self.assertEqual(result["paths"]["ndk"], str(self.root / "other sdk/ndk/28.2.13676358"))
        result = json.loads(self.cli("setup", "--platform", "android", "--check", "--json",
                                    "--java-home", str(self.root / "override")).stdout)
        self.assertEqual(result["paths"]["java"], str(self.root / "override"))

    def test_licence_gate_precedes_any_download_or_sdk_creation(self):
        result = self.cli("setup", "--platform", "android")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("--accept-licenses", result.stdout)
        self.assertFalse(self.sdk.exists())
        self.assertFalse((self.root / "cache").exists())
        self.assertFalse((self.root / "data").exists())
        self.assertFalse((self.root / "config").exists())

    def test_incomplete_or_wrong_jdk_has_actionable_diagnostic(self):
        self.program(self.java / "bin/javac", "printf 'javac 11.0.2\\n'\n")
        report = json.loads(self.cli("setup", "--platform", "android", "--check", "--json").stdout)
        check = next(c for c in report["checks"] if c["id"] == "jdk")
        self.assertFalse(check["ok"])
        self.assertIn("openjdk-21-jdk", check["remedy"])

    def test_command_scopes_reject_ignored_or_mutating_options(self):
        for arguments in [
            ["setup", "--platform", "windows"],
            ["setup", "--platform", "android", "--check", "--accept-licenses"],
            ["setup", "--platform", "android", "--manifest", "missing.json"],
            ["setup", "--platform", "android", "--json"],
            ["build", "--headless"],
            ["emulator", "--port", "5555"],
            ["emulator", "--port", "5554; touch surprise"],
        ]:
            with self.subTest(arguments=arguments):
                self.assertNotEqual(self.cli(*arguments).returncode, 0)
        self.assertFalse((self.root / "surprise").exists())

    def test_graphics_selection_preserves_other_apps_and_is_idempotent(self):
        result = self.bridge("angle-selection", packages="org.other.app,org.demo.app",
                             drivers="native,default", package="org.demo.app")["result"]
        self.assertEqual(result, dict(packages="org.other.app,org.demo.app", drivers="native,angle"))
        self.assertEqual(self.bridge("angle-selection", package="org.demo.app", **result)["result"], result)
        self.assertFalse(self.bridge("angle-selection", packages="org.other.app",
                                    drivers="native,angle", package="org.demo.app")["ok"])
        self.assertEqual(self.bridge("angle-selection", packages="null", drivers="null",
                                     package="org.demo.app")["result"]["drivers"], "angle")

    def test_native_environment_preserves_selected_xml_tool_after_path_cleanup(self):
        tool = self.root / "user tools/xmllint"
        self.program(tool, "exit 0\n")
        self.env["SQGI_ANDROID_XMLLINT"] = str(tool)
        result = self.bridge("native-clean-environment")["result"]
        self.assertEqual(result["path"], "/usr/bin:/bin")
        self.assertEqual(result["xmllint"], str(tool))

    def test_ndk_switch_discards_stale_compiler_cache_but_preserves_sources(self):
        directory = self.root / "native/module"
        source = self.root / "sources/module.c"
        source.parent.mkdir()
        source.write_text("source stays intact")
        directory.mkdir(parents=True)
        stale = directory / "CMakeCache.txt"
        stale.write_text("compiler from an old unmarked build")
        context = dict(ndk="/first/ndk", source=str(source.parent))
        self.assertTrue(self.bridge("native-build-directory", directory=str(directory), context=context)["ok"])
        self.assertFalse(stale.exists())
        stale.write_text("current compiler")
        self.bridge("native-build-directory", directory=str(directory), context=context)
        self.assertTrue(stale.exists(), "unchanged toolchains retain incremental outputs")
        context["ndk"] = "/second/ndk"
        self.bridge("native-build-directory", directory=str(directory), context=context)
        self.assertFalse(stale.exists())
        self.assertEqual(source.read_text(), "source stays intact")

    @unittest.skipUnless(platform.machine() == "x86_64", "bundled emulator requires x86_64")
    def test_emulator_stop_refuses_an_unrelated_device(self):
        log = self.root / "adb.log"
        self.program(self.sdk / "platform-tools/adb",
                     'printf "%s\\n" "$*" >> "' + str(log) + '"\n'
                     'case "$*" in *get-state) echo device;; *"avd name") printf "Users_AVD\\nOK\\n";; esac\n')
        result = self.cli("emulator", "--port", "5564", "--stop")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("another emulator", result.stdout)
        self.assertNotIn("emu kill", log.read_text())

    def test_emulator_command_keeps_paths_as_arguments_and_supports_arm_translation(self):
        result = self.bridge("emulator-command", paths=dict(emulator="/a path/emulator"),
                             port="5564", headless=True)["result"]
        self.assertIn("/a path/emulator", result)
        self.assertIn("-no-window", result)
        self.assertEqual(result[-3:], ["-qemu", "-cpu", "host"])

    @unittest.skipUnless(platform.machine() == "x86_64", "bundled emulator requires x86_64")
    def test_stop_waits_for_adb_to_drop_the_stopped_device(self):
        marker, count = self.root / "stopped", self.root / "polls"
        self.program(self.sdk / "platform-tools/adb",
                     'case "$*" in\n'
                     ' *get-state)\n'
                     '  if [ -f "' + str(marker) + '" ]; then\n'
                     '   n=$(cat "' + str(count) + '" 2>/dev/null || echo 0)\n'
                     '   n=$((n+1)); echo "$n" > "' + str(count) + '"\n'
                     '   [ "$n" -lt 3 ] || exit 1\n'
                     '  fi; echo device;;\n'
                     ' *"avd name") printf "SQGI_API_36\\nOK\\n";;\n'
                     ' *"emu kill") touch "' + str(marker) + '";;\nesac\n')
        result = self.cli("emulator", "--stop")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(count.read_text().strip(), "3")

    def test_offline_tool_extract_checks_hash_and_refuses_unowned_directories(self):
        downloads = self.root / "cache/sqgipkg/android/downloads"
        downloads.mkdir(parents=True)
        archive = downloads / "fixture.zip"
        with zipfile.ZipFile(archive, "w") as output:
            output.writestr("tool/program", "fixture")
        record = dict(name=archive.name, url="https://invalid.example/fixture.zip",
                      sha256=hashlib.sha256(archive.read_bytes()).hexdigest(), size=archive.stat().st_size,
                      directory="fixture", probe="tool/program")
        good = self.bridge("provision-tool", input=record, offline=True)
        self.assertTrue(good["ok"], good)
        self.assertEqual((Path(good["result"]) / "tool/program").read_text(), "fixture")
        record["directory"] = "corrupt"
        archive.write_bytes(b"corrupt")
        rejected = self.bridge("provision-tool", input=record, offline=True)
        self.assertFalse(rejected["ok"])
        self.assertIn("checksum mismatch", rejected["error"])
        unowned = self.root / "data/sqgipkg/android/tools/unowned"
        unowned.mkdir()
        record["directory"] = "unowned"
        rejected = self.bridge("provision-tool", input=record, offline=True)
        self.assertFalse(rejected["ok"])
        self.assertTrue(unowned.exists())


if __name__ == "__main__":
    unittest.main()
