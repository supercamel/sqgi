local GLib = import("GLib")

local Core = import("../sqgipkg_lib/core.nut")
local Options = import("../sqgipkg_lib/options.nut")
local Manifest = import("../sqgipkg_lib/manifest.nut")
local Linux = import("../sqgipkg_lib/linux_deps.nut")
local Msys2 = import("../sqgipkg_lib/windows/msys2.nut")
local Nsis = import("../sqgipkg_lib/windows/nsis.nut")

local failures = 0

function check(name, ok) {
    if (ok) {
        print("PASS: " + name + "\n")
    } else {
        print("FAIL: " + name + "\n")
        failures++
    }
}

function expect_error(name, fn, needle) {
    try {
        fn()
        check(name, false)
    } catch (e) {
        check(name, ("" + e).find(needle) != null)
    }
}

local core = Core.SqgiPkgCore()
check("core split_once", core.split_once("src=dest", "=")[1] == "dest")
check("core appimage arch alias", core.normalize_appimage_arch("arm64") == "aarch64")
check("core deb arch alias", core.deb_arch_for_appimage_arch("x86_64") == "amd64")
check("core array_join", core.array_join(["a"], ["b"])[1] == "b")
check("core sanitize_id", core.sanitize_id("My App!") == "my-app")
check("core package_basename keeps printable names", core.package_basename("My/App") == "My-App")
check("core shell export expands in same command", core.run_shell_output(core.shell_export("SQGIPKG_TEST_VAR", "ok") + "printf '%s' \"$SQGIPKG_TEST_VAR\"") == "ok")

local options = Options.SqgiPkgOptions()
check("options positional script first", options.extract_script_arg(["main.nut", "--name", "Demo"]) == "main.nut")
check("options positional script after options", options.extract_script_arg(["--name", "Demo", "--target=appimage", "main.nut"]) == "main.nut")
check("options repeated value skip", options.extract_script_arg(["--script-dir", ".", "main.nut"]) == "main.nut")
expect_error("options rejects multiple scripts", function() {
    options.extract_script_arg(["a.nut", "b.nut"])
}, "only one script")

local manifest = Manifest.SqgiPkgManifest()
check("manifest string list scalar", manifest.manifest_string_list("gtk4")[0] == "gtk4")
check("manifest command list array", manifest.manifest_command_list(["ninja"])[0] == "ninja")
check("manifest relative path", manifest.manifest_path("/tmp/project", "data/file.txt") == "/tmp/project/data/file.txt")
local arch_config = manifest.manifest_linux_arch("/tmp/project", {
    arch = "arm64",
    cmake_toolchain = "cross/toolchain.cmake",
    meson_cross_file = "cross/aarch64.ini",
    deb = {
        download = true,
        package_cache = ".cache/debs",
        sysroot_cache = ".cache/sysroots",
        packages = ["zlib1g"]
    },
    inherit_native_projects = false,
    native_projects = [
        {
            dir = "native",
            build = ["ninja"],
            libraries = ["build/libdemo.so"]
        }
    ]
})
check("manifest linux arch alias", arch_config.arch == "arm64")
check("manifest linux arch cmake toolchain path", arch_config.cmake_toolchain == "/tmp/project/cross/toolchain.cmake")
check("manifest linux arch meson cross path", arch_config.meson_cross_file == "/tmp/project/cross/aarch64.ini")
check("manifest linux arch deb download flag", arch_config.deb_download == true)
check("manifest linux arch deb package cache path", arch_config.deb_package_cache == "/tmp/project/.cache/debs")
check("manifest linux arch deb sysroot cache path", arch_config.deb_sysroot_cache == "/tmp/project/.cache/sysroots")
check("manifest linux arch deb packages", arch_config.deb_packages[0] == "zlib1g")
check("manifest linux arch native inheritance flag", arch_config.inherit_native_projects == false)
check("manifest linux arch native project paths", arch_config.native_projects[0].libraries[0] == "/tmp/project/native/build/libdemo.so")

local linux = Linux.SqgiPkgLinuxDeps()
check("linux system library filter", linux.linux_system_library("libc.so.6"))
check("linux keeps gtk library", !linux.linux_system_library("libgtk-4.so.1"))
check("linux gobject introspection dev package", linux.linux_pkg_config_module_package("gobject-introspection-1.0") == "libgirepository-1.0-dev")
check("linux dependency strips arch any", linux.linux_dependency_package_name(linux.new_options(), "libc6:any (>= 2.14)") == "libc6:" + core.deb_arch_for_appimage_arch(core.machine_arch()))
local dep_opts = linux.new_options()
dep_opts.appimage_arch = "aarch64"
local direct_deps = linux.linux_deb_dependency_packages_from_output(dep_opts, "demo\n  Depends: libc6 (>= 2.14)\n", {})
check("linux deb direct dependency parse", direct_deps.len() == 1 && direct_deps[0] == "libc6:arm64")
local available_virtual = {}
available_virtual["x11proto-dev:arm64"] <- true
local virtual_deps = linux.linux_deb_dependency_packages_from_output(dep_opts,
    "demo\n" +
    "  Depends: <x11proto-render-dev:arm64>\n" +
    "    x11proto-dev\n" +
    "    x11proto-render-dev\n",
    available_virtual)
check("linux deb virtual dependency provider parse", virtual_deps.len() == 1 && virtual_deps[0] == "x11proto-dev:arm64")
local available_arch_provider = {}
available_arch_provider["gir1.2-freedesktop-dev:arm64"] <- true
local arch_provider_deps = linux.linux_deb_dependency_packages_from_output(dep_opts,
    "demo\n" +
    "  Depends: <gir1.2-cairo-1.0-dev:arm64>\n" +
    "    gir1.2-freedesktop-dev:arm64\n",
    available_arch_provider)
check("linux deb provider keeps explicit arch", arch_provider_deps.len() == 1 && arch_provider_deps[0] == "gir1.2-freedesktop-dev:arm64")
local wrong_arch_deps = linux.linux_deb_dependency_packages_from_output(dep_opts,
    "demo\n" +
    "  Depends: libitm1:i386\n" +
    "  Depends: libgcc-s1:arm64\n",
    {})
check("linux deb parser skips non-target explicit arch", wrong_arch_deps.len() == 1 && wrong_arch_deps[0] == "libgcc-s1:arm64")
check("linux deb archive basename keeps epoch encoding",
    linux.linux_deb_archive_basename_from_output("Package: zlib1g\nVersion: 1:1.3.dfsg-3\nArchitecture: amd64\nFilename: pool/main/z/zlib/zlib1g_1.3.dfsg-3_amd64.deb\n") == "zlib1g_1%3a1.3.dfsg-3_amd64.deb")
local deb_cache = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-deb-cache-" + GLib.get_monotonic_time()])
local deb_file = GLib.build_filenamev([deb_cache, "x11proto-dev_2023.2-1_all.deb"])
system("rm -rf " + linux.shell_quote(deb_cache) + " && mkdir -p " + linux.shell_quote(deb_cache) + " && touch " + linux.shell_quote(deb_file))
check("linux deb cache accepts arch all package", linux.linux_find_cached_deb(deb_cache, "x11proto-dev:arm64", "arm64", "missing.deb") == deb_file)
system("rm -rf " + linux.shell_quote(deb_cache))
local sysroot_opts = linux.new_options()
sysroot_opts.output_dir = "relative-linux-out"
local generated_sysroot = linux.linux_download_sysroot_root(sysroot_opts)
check("linux generated sysroot is absolute", GLib.path_is_absolute(generated_sysroot))
check("linux generated sysroot uses user cache", linux.starts_with(generated_sysroot, linux.default_linux_sysroot_cache_dir()))
local custom_sysroot_opts = linux.new_options()
custom_sysroot_opts.linux.deb.sysroot_cache = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-sysroots"])
check("linux generated sysroot honors custom cache", linux.starts_with(linux.linux_download_sysroot_root(custom_sysroot_opts), custom_sysroot_opts.linux.deb.sysroot_cache))
local explicit_sysroot_opts = linux.new_options()
explicit_sysroot_opts.linux.sysroot = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-explicit-sysroot"])
check("linux explicit sysroot bypasses cache", linux.linux_download_sysroot_root(explicit_sysroot_opts) == explicit_sysroot_opts.linux.sysroot)
local host_arch = core.normalize_appimage_arch(core.machine_arch())
local cross_arch = host_arch == "aarch64" ? "x86_64" : "aarch64"
local linux_opts = linux.new_options()
linux_opts.output_dir = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-module-cross-" + GLib.get_monotonic_time()])
linux_opts.appimage_arch = cross_arch
linux_opts.linux_current <- {
    arch = cross_arch,
    package_arch = "",
    build_dir = "",
    output = "",
    sysroot = "",
    cmake_toolchain = "",
    meson_cross_file = ""
}
linux.prepare_linux_build_environment(linux_opts)
local generated_toolchain = linux.linux_cmake_toolchain_path(linux_opts)
local generated_cross_file = linux.linux_meson_cross_file_path(linux_opts)
check("linux generated cmake toolchain", linux.path_exists(generated_toolchain))
check("linux generated meson cross file", linux.path_exists(generated_cross_file))
check("linux build env exposes generated toolchain", linux.linux_build_env_prefix(linux_opts).find("SQGI_LINUX_CMAKE_TOOLCHAIN=") != null)
check("linux build env exposes build dir", linux.linux_build_env_prefix(linux_opts).find("SQGI_LINUX_BUILD_DIR=") != null)
check("linux cmake toolchain uses target triplet", linux.read_file(generated_toolchain).find(linux.linux_current_triplet(linux_opts) + "-gcc") != null)
system("rm -rf " + linux.shell_quote(linux_opts.output_dir))

local msys2 = Msys2.SqgiPkgWindowsMsys2()
check("msys2 dependency version strip", msys2.strip_dependency_version("mingw-w64-x86_64-glib2>=2.80") == "mingw-w64-x86_64-glib2")
check("msys2 url basename", msys2.url_basename("https://example.invalid/repo/pkg.tar.zst") == "pkg.tar.zst")

local nsis = Nsis.SqgiPkgWindowsNsis()
check("nsis escape quotes", nsis.nsis_escape("a\"b") == "a$\\\"b")
check("nsis keep vars", nsis.nsis_escape_keep_vars("$LOCALAPPDATA\\App") == "$LOCALAPPDATA\\App")

if (failures != 0) {
    print("sqgipkg module tests failed: " + failures + "\n")
    return 1
}

print("sqgipkg module tests passed\n")
