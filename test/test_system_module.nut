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
check(typeof(system.runtime.kernels) == "bool", "system.runtime.kernels bool")
check(system.runtime.kernels == ("kernel" in sqgi), "system.runtime.kernels matches VM capability")

if (system.os.name == "android") {
    check(system.os.family == "unix" && system.os.id == "android", "Android OS identity")
    check(system.os.pretty_name.find("Android") == 0, "Android readable name")
    check(typeof(system.android) == "table", "Android platform metadata")
    check(system.android.api_level == null || typeof(system.android.api_level) == "integer", "Android device API")
    check(typeof(system.android.min_api_level) == "integer", "Android build minimum API")
    local abis = { aarch64 = "arm64-v8a", x86_64 = "x86_64", armv7 = "armeabi-v7a", i686 = "x86" }
    check(system.cpu.arch in abis && system.android.abi == abis[system.cpu.arch], "Android process ABI")
    check(!system.runtime.jit && !system.runtime.kernels, "Android interpreter capabilities")
} else check(system.android == null, "Non-Android process has no Android platform metadata")

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

local original_share = system.env.get("SQGI_APP_SHARE")
local original_resources = system.env.get("SQGI_APP_RESOURCES")
GLib.setenv("SQGI_APP_SHARE", "/tmp/sqgi-app-share-test", true)
GLib.setenv("SQGI_APP_RESOURCES", "/tmp/sqgi-app-resources-test", true)
local packaged = import("system")
check(packaged.package.packaged, "system.package.packaged from SQGI_APP_*")
check(packaged.paths.app_share == "/tmp/sqgi-app-share-test",
      "system.paths.app_share from env")
check(packaged.paths.app_resources == "/tmp/sqgi-app-resources-test",
      "system.paths.app_resources from env")
if (original_share == null) GLib.unsetenv("SQGI_APP_SHARE")
else GLib.setenv("SQGI_APP_SHARE", original_share, true)
if (original_resources == null) GLib.unsetenv("SQGI_APP_RESOURCES")
else GLib.setenv("SQGI_APP_RESOURCES", original_resources, true)

print("[OK] test_system_module passed\n")

