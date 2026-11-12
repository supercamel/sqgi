"""Test explicit application cleanup and Android's process exit boundary."""
import argparse
import json
import re
import subprocess
import time
from pathlib import Path

p = argparse.ArgumentParser(description=__doc__)
p.add_argument("apk", type=Path)
p.add_argument("output", type=Path)
p.add_argument("--serial", required=True)
p.add_argument("--adb", default="adb")
p.add_argument("--sqgipkg", default="sqgipkg")
p.add_argument("--arch", default="x86_64")
p.add_argument("--expect-original-failure", action="store_true")
a = p.parse_args()
a.output.mkdir(parents=True, exist_ok=True)
result_path = a.output / "result.json"
result_path.unlink(missing_ok=True)
adb = a.adb
package = "org.sqgi.NativeExit"

def call(*args, check=True):
    return subprocess.run([adb, "-s", a.serial, *args], capture_output=True, check=check, timeout=60)

call("install", "-r", str(a.apk))
call("shell", "am", "force-stop", package)
call("shell", "run-as", package, "rm", "-f", "files/data/global-exit.txt", "files/data/cleanup.json")
started = call("shell", "date", "+%m-%d\\ %H:%M:%S.000").stdout.decode().strip()
subprocess.run([a.sqgipkg, "run", "--manifest",
                str(Path(__file__).parent / "sqgipkg.json"), "--platform", "android",
                "--arch", a.arch, "--serial", a.serial], check=True, timeout=60)
session = json.loads(call("exec-out", "run-as", package, "cat", "files/runtime/session.json").stdout)
assert session["mode"] == "packaged" and session["abi"] == a.arch, session
assert session["entry_type"] == "native" and session["application_id"] == package, session
deadline = time.monotonic() + 20
while call("shell", "test", "-d", f"/proc/{session['pid']}", check=False).returncode == 0:
    assert time.monotonic() < deadline, "Application failed to exit"
    time.sleep(.1)
report = json.loads(call("exec-out", "run-as", package, "cat", "files/data/cleanup.json").stdout)
assert report == dict(result=0, gl=True, cleanup=True), report
status = call("exec-out", "run-as", package, "cat", "files/runtime/status.txt").stdout.strip()
assert status == b"exited", status
global_cleanup = call("shell", "run-as", package, "test", "-f", "files/data/global-exit.txt", check=False).returncode == 0
logs = call("logcat", "-d", "-b", "all", "-T", started).stdout.decode(errors="replace")
(a.output / "logcat.txt").write_text(logs)
pid = session["pid"]
failures = re.findall(rf"^\S+\s+\S+\s+{pid}\s+\d+\s+[EF]\s+[^:]+:\s+(?:Fatal signal|FORTIFY:|FATAL EXCEPTION).*$", logs, re.M)
failures += re.findall(rf"\bam_(?:anr|crash|kill)\s*:\s*\[\d+,{pid},[^\n]+", logs)
report.update(global_cleanup=global_cleanup, session=session, failures=failures)
report.update(passed=bool(global_cleanup or failures) == a.expect_original_failure,
              expected_original_failure=a.expect_original_failure)
result_path.write_text(json.dumps(report, indent=2))
assert report["passed"], report
print("PASS application cleanup and GL context; global exit handlers ran:", global_cleanup,
      "; process failures:", failures, "; expected original failure:", a.expect_original_failure)
