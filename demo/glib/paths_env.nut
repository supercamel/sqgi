/**
 * demo/glib/paths_env.nut
 *
 * Tour of GLib's filesystem-path and environment helpers — the bits you
 * reach for every time you want to write portable, well-behaved Unix code.
 *
 * Usage: sqgi demo/glib/paths_env.nut
 *
 * Exercises:
 *   - get_tmp_dir / get_home_dir / get_current_dir / get_user_name
 *   - build_filenamev (variadic path join)
 *   - path_get_basename / path_get_dirname
 *   - find_program_in_path
 *   - setenv / getenv / unsetenv
 *   - markup_escape_text + Uri.escape_string
 */

local GLib = import("GLib")

print("== well-known directories ==\n")
print("  tmp:     " + GLib.get_tmp_dir()      + "\n")
print("  home:    " + GLib.get_home_dir()     + "\n")
print("  cwd:     " + GLib.get_current_dir()  + "\n")
print("  user:    " + GLib.get_user_name()    + "\n")
print("  real:    " + GLib.get_real_name()    + "\n")
print("  host:    " + GLib.get_host_name()    + "\n")

print("\n== path manipulation ==\n")
print("  build:   " + GLib.build_filenamev(["/var", "log", "app.log"]) + "\n")
print("  base:    " + GLib.path_get_basename("/tmp/foo/bar.txt") + "\n")
print("  dir:     " + GLib.path_get_dirname("/tmp/foo/bar.txt")  + "\n")

print("\n== PATH lookup ==\n")
foreach (p in ["sh", "ls", "this-does-not-exist"]) {
    local found = GLib.find_program_in_path(p)
    print("  " + p + " → " + (found != null ? found : "<not found>") + "\n")
}

print("\n== environment ==\n")
GLib.setenv("SQGI_DEMO_VAR", "hello!", true)
print("  set/get: " + GLib.getenv("SQGI_DEMO_VAR") + "\n")
GLib.unsetenv("SQGI_DEMO_VAR")
local gone = GLib.getenv("SQGI_DEMO_VAR")
print("  after unset: " + (gone == null ? "<unset>" : gone) + "\n")

print("\n== escaping ==\n")
print("  markup:  " + GLib.markup_escape_text("<a & b>", 7) + "\n")
print("  uri:     " + GLib.Uri.escape_string("a b/c?d=1", null, false) + "\n")
