// test/test_system_module.nut
//
// Verifies the built-in import("system") module shape and read-only helpers.

function check(cond, msg) {
    if (!cond) throw "[FAIL] " + msg
}

function is_string_or_null(v) {
    return v == null || typeof(v) == "string"
}

local GLib = import("GLib")
local system = import("system")

check(typeof(system) == "table", "system module is table")

check(typeof(system.os) == "table", "system.os table")
check(typeof(system.os.name) == "string" && system.os.name.len() > 0,
      "system.os.name string")
check(typeof(system.os.family) == "string" && system.os.family.len() > 0,
      "system.os.family string")
check(typeof(system.os.pretty_name) == "string" && system.os.pretty_name.len() > 0,
      "system.os.pretty_name string")
check(is_string_or_null(system.os.version), "system.os.version string/null")
check(is_string_or_null(system.os.id), "system.os.id string/null")

check(typeof(system.cpu) == "table", "system.cpu table")
check(typeof(system.cpu.arch) == "string" && system.cpu.arch.len() > 0,
      "system.cpu.arch string")
check(system.cpu.endian == "little" || system.cpu.endian == "big" ||
      system.cpu.endian == "unknown", "system.cpu.endian value")

check(typeof(system.runtime) == "table", "system.runtime table")
check(typeof(system.runtime.sqgi_version) == "string" &&
      system.runtime.sqgi_version.len() > 0, "system.runtime.sqgi_version")
check(typeof(system.runtime.squirrel_version) == "string" &&
      system.runtime.squirrel_version.find("Squirrel") != null,
      "system.runtime.squirrel_version")
check(typeof(system.runtime.squirrel_version_number) == "integer",
      "system.runtime.squirrel_version_number")
check(typeof(system.runtime.jit) == "bool", "system.runtime.jit bool")
check(typeof(system.runtime.debug) == "bool", "system.runtime.debug bool")

check(typeof(system.paths) == "table", "system.paths table")
check(is_string_or_null(system.paths.home), "system.paths.home string/null")
check(typeof(system.paths.tmp) == "string" && system.paths.tmp.len() > 0,
      "system.paths.tmp string")
check(is_string_or_null(system.paths.config), "system.paths.config string/null")
check(is_string_or_null(system.paths.cache), "system.paths.cache string/null")
check(is_string_or_null(system.paths.data), "system.paths.data string/null")
check(typeof(system.paths.current) == "string" && system.paths.current.len() > 0,
      "system.paths.current string")
check(is_string_or_null(system.paths.app_share), "system.paths.app_share string/null")
check(is_string_or_null(system.paths.app_resources), "system.paths.app_resources string/null")

check(typeof(system.package) == "table", "system.package table")
check(typeof(system.package.packaged) == "bool", "system.package.packaged bool")
check(is_string_or_null(system.package.app_share), "system.package.app_share string/null")
check(is_string_or_null(system.package.resources), "system.package.resources string/null")

check(typeof(system.env) == "table", "system.env table")
check(typeof(system.env.get) == "function", "system.env.get function")
check(typeof(system.env.has) == "function", "system.env.has function")
check(typeof(system.env.all) == "function", "system.env.all function")

local key = "SQGI_TEST_SYSTEM_MODULE_VALUE"
GLib.setenv(key, "hello-system", true)
check(system.env.has(key), "system.env.has after setenv")
check(system.env.get(key) == "hello-system", "system.env.get after setenv")

local all = system.env.all()
check(typeof(all) == "table", "system.env.all table")
check(key in all && all[key] == "hello-system", "system.env.all contains key")

GLib.unsetenv(key)
check(!system.env.has(key), "system.env.has after unsetenv")
check(system.env.get(key) == null, "system.env.get missing returns null")

GLib.setenv("SQGI_APP_SHARE", "/tmp/sqgi-app-share-test", true)
GLib.setenv("SQGI_APP_RESOURCES", "/tmp/sqgi-app-resources-test", true)
local packaged = import("system")
check(packaged.package.packaged, "system.package.packaged from SQGI_APP_*")
check(packaged.paths.app_share == "/tmp/sqgi-app-share-test",
      "system.paths.app_share from env")
check(packaged.paths.app_resources == "/tmp/sqgi-app-resources-test",
      "system.paths.app_resources from env")

print("[OK] test_system_module passed\n")

