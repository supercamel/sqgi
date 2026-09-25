"""Check actual native execution with the default settings and runtime overrides."""
import os
import subprocess
import sys


script = '''
function jit_default_add(a, b) { return a + b }
local result = 0
for (local i = 0; i < 1200; i++) result = jit_default_add(i, 42)
assert(result == 1241)
print("jit-default-result=1241\\n")
'''
native_trace = "executed native proto 'jit_default_add'"
for setting in (None, "0", "1"):
    env = os.environ.copy()
    for name in list(env):
        if name.startswith("SQGI_JIT"):
            del env[name]
    env["SQGI_JIT_TRACE"] = "1"
    if setting is not None:
        env["SQGI_JIT"] = setting
    result = subprocess.run([*sys.argv[1:], "-e", script], env=env,
                            capture_output=True, text=True, timeout=15)
    output = result.stdout + result.stderr
    assert result.returncode == 0, output
    assert "jit-default-result=1241" in output, output
    assert (native_trace in output) == (setting != "0"), output
    print(f"PASS: SQGI_JIT={setting if setting is not None else '<unset>'}")
