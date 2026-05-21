local GLib = import("GLib")

local Core = import("../sqgipkg_lib/core.nut")
local Options = import("../sqgipkg_lib/options.nut")
local Manifest = import("../sqgipkg_lib/manifest.nut")
local Linux = import("../sqgipkg_lib/linux_deps.nut")
local AppImage = import("../sqgipkg_lib/appimage.nut")
local Build = import("../sqgipkg_lib/build.nut")
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
local module_host_arch = core.normalize_appimage_arch(core.machine_arch())
local shell_arch = core.elf_appimage_arch("/bin/sh")
check("core elf arch detects host shell", shell_arch == null || shell_arch == module_host_arch)
if (shell_arch != null) {
    local wrong_arch = module_host_arch == "aarch64" ? "x86_64" : "aarch64"
    expect_error("core elf arch mismatch error", function() {
        core.require_elf_appimage_arch("/bin/sh", wrong_arch, "test binary")
    }, "test binary has ELF architecture")
}

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
local forced_download_opts = manifest.new_options()
forced_download_opts.linux.deb.download = false
forced_download_opts.linux.deb.download_forced = false
manifest.apply_linux_manifest(forced_download_opts, "/tmp/project", { deb = { download = true } })
check("manifest keeps no linux deb download override", forced_download_opts.linux.deb.download == false)
local linux_sysroot_opts = manifest.new_options()
linux_sysroot_opts.target = "linux-sysroot"
manifest.validate_options(linux_sysroot_opts)
check("manifest linux-sysroot does not require script", true)

local linux = Linux.SqgiPkgLinuxDeps()
check("linux system library filter", linux.linux_system_library("libc.so.6"))
check("linux keeps gtk library", !linux.linux_system_library("libgtk-4.so.1"))
check("linux gobject introspection dev package", linux.linux_pkg_config_module_package("gobject-introspection-1.0") == "libgirepository-1.0-dev")
linux.apt_depends_cache = {}
linux.apt_depends_cache["cachedpkg:arm64"] <- "cached depends\n"
check("linux apt depends cache hit", linux.linux_apt_package_depends("cachedpkg:arm64") == "cached depends\n")
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
local available_alternatives = {}
available_alternatives["python3:arm64"] <- true
available_alternatives["qemu-user:arm64"] <- true
available_alternatives["zlib1g:arm64"] <- true
local alternative_deps = linux.linux_deb_dependency_packages_from_output(dep_opts,
    "demo\n" +
    " |Depends: python3\n" +
    "  Depends: qemu-user\n" +
    "  Depends: zlib1g\n",
    available_alternatives)
check("linux deb parser keeps first available alternative",
    alternative_deps.len() == 2 && alternative_deps[0] == "python3:arm64" && alternative_deps[1] == "zlib1g:arm64")
local available_fallback_alternatives = {}
available_fallback_alternatives["qemu-user:arm64"] <- true
available_fallback_alternatives["zlib1g:arm64"] <- true
local alternative_fallback_deps = linux.linux_deb_dependency_packages_from_output(dep_opts,
    "demo\n" +
    " |Depends: python3\n" +
    "  Depends: qemu-user\n" +
    "  Depends: zlib1g\n",
    available_fallback_alternatives)
check("linux deb parser falls back to available alternative",
    alternative_fallback_deps.len() == 2 && alternative_fallback_deps[0] == "qemu-user:arm64" && alternative_fallback_deps[1] == "zlib1g:arm64")
local available_inline_alternatives = {}
available_inline_alternatives["libbar:arm64"] <- true
local inline_alternative_deps = linux.linux_deb_dependency_packages_from_output(dep_opts,
    "demo\n" +
    "  Depends: libfoo:i386 | libbar\n",
    available_inline_alternatives)
check("linux deb parser handles inline alternatives", inline_alternative_deps.len() == 1 && inline_alternative_deps[0] == "libbar:arm64")
local available_virtual_alternatives = {}
available_virtual_alternatives["debconf:arm64"] <- true
available_virtual_alternatives["cdebconf:arm64"] <- true
available_virtual_alternatives["zlib1g:arm64"] <- true
local virtual_alternative_deps = linux.linux_deb_dependency_packages_from_output(dep_opts,
    "demo\n" +
    " |Depends: debconf\n" +
    "  Depends: <debconf-2.0>\n" +
    "    cdebconf\n" +
    "    debconf\n" +
    "  Depends: zlib1g\n",
    available_virtual_alternatives)
check("linux deb parser skips virtual providers after chosen alternative",
    virtual_alternative_deps.len() == 2 && virtual_alternative_deps[0] == "debconf:arm64" && virtual_alternative_deps[1] == "zlib1g:arm64")
local available_virtual_fallback = {}
available_virtual_fallback["cdebconf:arm64"] <- true
available_virtual_fallback["zlib1g:arm64"] <- true
local virtual_fallback_deps = linux.linux_deb_dependency_packages_from_output(dep_opts,
    "demo\n" +
    " |Depends: debconf\n" +
    "  Depends: <debconf-2.0>\n" +
    "    cdebconf\n" +
    "    debconf\n" +
    "  Depends: zlib1g\n",
    available_virtual_fallback)
check("linux deb parser uses virtual provider fallback",
    virtual_fallback_deps.len() == 2 && virtual_fallback_deps[0] == "cdebconf:arm64" && virtual_fallback_deps[1] == "zlib1g:arm64")
local stanza_deps = linux.linux_deb_package_depends_from_stanza(
    "Package: demo\n" +
    "Architecture: amd64\n" +
    "Pre-Depends: libc6 (>= 2.38)\n" +
    "Depends: zlib1g (>= 1:1.2.11), libfoo | libbar,\n" +
    " libbaz\n")
check("linux repo stanza dependencies become apt-cache shape",
    stanza_deps.find("Depends: libc6 (>= 2.38)") != null &&
    stanza_deps.find("Depends: zlib1g (>= 1:1.2.11)") != null &&
    stanza_deps.find("Depends: libfoo | libbar") != null &&
    stanza_deps.find("Depends: libbaz") != null)
check("linux repo archive url", linux.linux_deb_archive_url_from_output(
    "Package: zlib1g\n" +
    "Filename: pool/main/z/zlib/zlib1g_1.3.dfsg-3_amd64.deb\n" +
    "SqgiPkg-Repo-URI: http://archive.ubuntu.com/ubuntu\n") ==
    "http://archive.ubuntu.com/ubuntu/pool/main/z/zlib/zlib1g_1.3.dfsg-3_amd64.deb")
local repo_metadata = linux.linux_deb_archive_metadata_from_output("zlib1g:amd64",
    "Package: zlib1g\n" +
    "Version: 1:1.3.dfsg-3\n" +
    "Architecture: amd64\n" +
    "Filename: pool/main/z/zlib/zlib1g_1.3.dfsg-3_amd64.deb\n" +
    "SqgiPkg-Repo-URI: http://archive.ubuntu.com/ubuntu\n")
check("linux repo metadata records package version and source",
    repo_metadata.basename == "zlib1g_1%3a1.3.dfsg-3_amd64.deb" &&
    repo_metadata.package_name == "zlib1g" &&
    repo_metadata.version == "1:1.3.dfsg-3" &&
    repo_metadata.architecture == "amd64" &&
    repo_metadata.download_url == "http://archive.ubuntu.com/ubuntu/pool/main/z/zlib/zlib1g_1.3.dfsg-3_amd64.deb")
local repo_target_opts = linux.new_options()
repo_target_opts.appimage_arch = "x86_64"
local repo_targets = linux.linux_deb_repo_targets(repo_target_opts)
check("linux repo targets use archive for amd64", repo_targets.len() == 16 && repo_targets[0].uri == "http://archive.ubuntu.com/ubuntu")
repo_target_opts.appimage_arch = "aarch64"
repo_targets = linux.linux_deb_repo_targets(repo_target_opts)
check("linux repo targets use ports for arm64", repo_targets.len() == 16 && repo_targets[0].uri == "http://ports.ubuntu.com/ubuntu-ports")
local repo_fixture_dir = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-repo-fixture-" + GLib.get_monotonic_time()])
linux.mkdir_p(repo_fixture_dir)
local repo_fixture = GLib.build_filenamev([repo_fixture_dir, "Packages"])
linux.write_file(repo_fixture,
    "Package: libglib2.0-0t64\n" +
    "Architecture: amd64\n" +
    "Version: 2.80.0-6ubuntu1\n" +
    "Provides: libgio-2.0-0 (= 2.80.0-6ubuntu1), libglib2.0-0 (= 2.80.0-6ubuntu1),\n" +
    " libgobject-2.0-0 (= 2.80.0-6ubuntu1)\n" +
    "Filename: pool/main/g/glib2.0/libglib2.0-0t64_2.80.0-6ubuntu1_amd64.deb\n\n")
local provider_record = linux.linux_repo_find_provider_record_in_files([
        { path = repo_fixture, uri = "http://archive.ubuntu.com/ubuntu" }
    ], "libglib2.0-0", "amd64")
check("linux repo provider lookup handles t64 renamed packages",
    provider_record != null &&
    provider_record.find("Package: libglib2.0-0t64") != null &&
    provider_record.find("SqgiPkg-Repo-URI: http://archive.ubuntu.com/ubuntu") != null)
system("rm -rf " + linux.shell_quote(repo_fixture_dir))
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
local compat_sysroot_opts = linux.new_options()
compat_sysroot_opts.linux.sysroot = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-compat-sysroot-" + GLib.get_monotonic_time()])
linux.mkdir_p(GLib.build_filenamev([compat_sysroot_opts.linux.sysroot, "usr", "lib64"]))
linux.ensure_linux_sysroot_compat_links(compat_sysroot_opts)
local compat_link_output = linux.run_shell_output("readlink " + linux.shell_quote(GLib.build_filenamev([compat_sysroot_opts.linux.sysroot, "lib64"])))
check("linux sysroot creates lib64 compatibility link",
    compat_link_output != null && linux.split_lines(compat_link_output)[0] == "usr/lib64")
system("rm -rf " + linux.shell_quote(compat_sysroot_opts.linux.sysroot))
local loader_sysroot_opts = linux.new_options()
loader_sysroot_opts.appimage_arch = "aarch64"
loader_sysroot_opts.linux.sysroot = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-loader-sysroot-" + GLib.get_monotonic_time()])
linux.mkdir_p(GLib.build_filenamev([loader_sysroot_opts.linux.sysroot, "usr", "lib"]))
linux.write_file(GLib.build_filenamev([loader_sysroot_opts.linux.sysroot, "usr", "lib", "ld-linux-aarch64.so.1"]), "")
linux.ensure_linux_sysroot_compat_links(loader_sysroot_opts)
local loader_link_output = linux.run_shell_output("readlink " + linux.shell_quote(GLib.build_filenamev([loader_sysroot_opts.linux.sysroot, "lib", "ld-linux-aarch64.so.1"])))
check("linux sysroot creates aarch64 loader compatibility link",
    loader_link_output != null && linux.split_lines(loader_link_output)[0] == "../usr/lib/ld-linux-aarch64.so.1")
system("rm -rf " + linux.shell_quote(loader_sysroot_opts.linux.sysroot))
local triplet_link_sysroot_opts = linux.new_options()
triplet_link_sysroot_opts.appimage_arch = "x86_64"
triplet_link_sysroot_opts.linux.sysroot = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-triplet-link-sysroot-" + GLib.get_monotonic_time()])
local triplet_link_dir = GLib.build_filenamev([triplet_link_sysroot_opts.linux.sysroot, "usr", "lib", "x86_64-linux-gnu"])
linux.mkdir_p(triplet_link_dir)
linux.write_file(GLib.build_filenamev([triplet_link_dir, "libc.so.6"]), "")
linux.ensure_linux_sysroot_compat_links(triplet_link_sysroot_opts)
local triplet_libc_link_output = linux.run_shell_output("readlink " + linux.shell_quote(GLib.build_filenamev([triplet_link_sysroot_opts.linux.sysroot, "lib", "x86_64-linux-gnu", "libc.so.6"])))
check("linux sysroot creates triplet libc compatibility link",
    triplet_libc_link_output != null && linux.split_lines(triplet_libc_link_output)[0] == "../../usr/lib/x86_64-linux-gnu/libc.so.6")
system("rm -rf " + linux.shell_quote(triplet_link_sysroot_opts.linux.sysroot))
local metadata_opts = linux.new_options()
metadata_opts.linux.sysroot = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-metadata-sysroot-" + GLib.get_monotonic_time()])
linux.write_linux_deb_sysroot_metadata(metadata_opts, "zlib1g:amd64", ["/usr/lib/libz.so.1"], repo_metadata)
local metadata_path = GLib.build_filenamev([metadata_opts.linux.sysroot, "var", "lib", "sqgipkg", "debs", "zlib1g:amd64", "metadata"])
local metadata_text = linux.read_file(metadata_path)
check("linux sysroot metadata records requested package", metadata_text.find("requested_package: zlib1g:amd64") != null)
check("linux sysroot metadata records archive source", metadata_text.find("download_url: http://archive.ubuntu.com/ubuntu/pool/main/z/zlib/zlib1g_1.3.dfsg-3_amd64.deb") != null)
system("rm -rf " + linux.shell_quote(metadata_opts.linux.sysroot))
local package_stage_opts = linux.new_options()
package_stage_opts.appimage_arch = "x86_64"
package_stage_opts.linux.deb.sysroot_cache = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-stage-sysroots-" + GLib.get_monotonic_time()])
local package_stage_sysroot = linux.linux_download_sysroot_root(package_stage_opts)
local package_stage_file = GLib.build_filenamev([package_stage_sysroot, "usr", "lib", "x86_64-linux-gnu", "libdemo.so.1"])
linux.mkdir_p(linux.dirname(package_stage_file))
linux.write_file(package_stage_file, "demo\n")
local package_stage_meta = clone repo_metadata
package_stage_meta.basename = "libdemo_1.0_amd64.deb"
package_stage_meta.package_name = "libdemo"
linux.write_linux_deb_sysroot_metadata(package_stage_opts, "libdemo:amd64",
    ["/./usr/lib/x86_64-linux-gnu/libdemo.so.1"], package_stage_meta)
local package_stage_appdir = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-stage-appdir-" + GLib.get_monotonic_time()])
linux.stage_linux_package(package_stage_opts, package_stage_appdir, "libdemo")
check("linux package staging copies from generated sysroot",
    linux.path_exists(GLib.build_filenamev([package_stage_appdir, "usr", "lib", "libdemo.so.1"])))
system("rm -rf " + linux.shell_quote(package_stage_opts.linux.sysroot) + " " + linux.shell_quote(package_stage_appdir))
local auto_runtime_opts = linux.new_options()
auto_runtime_opts.linux.deb.download = true
auto_runtime_opts.report.used_gtk = true
auto_runtime_opts.report.used_gst = true
auto_runtime_opts.report.used_gdk_pixbuf = true
auto_runtime_opts.report.used_soup = true
linux.apply_linux_package_defaults(auto_runtime_opts)
check("linux import defaults include GTK runtime packages",
    auto_runtime_opts.linux.deb.packages.find("libgtk-4-1") != null &&
    auto_runtime_opts.linux.deb.packages.find("gir1.2-gtk-4.0") != null)
check("linux import defaults include GStreamer runtime packages",
    auto_runtime_opts.linux.deb.packages.find("libgstreamer1.0-0") != null &&
    auto_runtime_opts.linux.deb.packages.find("gstreamer1.0-plugins-good") != null)
check("linux import defaults include Soup runtime packages",
    auto_runtime_opts.linux.deb.packages.find("libsoup-3.0-0") != null &&
    auto_runtime_opts.linux.deb.packages.find("gir1.2-soup-3.0") != null)
local host_arch = module_host_arch
local cross_arch = host_arch == "aarch64" ? "x86_64" : "aarch64"
local build = Build.SqgiPkgBuild()
check("build package path normalizes Debian dot entries",
    build.normalize_package_path("/./usr/lib/x86_64-linux-gnu/libdemo.so.1") ==
    "/usr/lib/x86_64-linux-gnu/libdemo.so.1")
local selected_cross_opts = build.new_options()
selected_cross_opts.appimage_arch = cross_arch
local selected_cross_config = build.normalize_linux_arch_config(selected_cross_opts, { arch = cross_arch })
local selected_cross_clone = build.clone_opts_for_linux_arch(selected_cross_opts, selected_cross_config, "/tmp/sqgipkg-selected-cross")
check("build selected cross arch uses target build dir",
    selected_cross_clone.build_dir == "build-" + cross_arch)
if (build.executable_available("git")) {
    local previous_sqgi_source_dir = GLib.getenv("SQGI_SOURCE_DIR")
    GLib.setenv("SQGI_SOURCE_DIR", "", true)
    local source_fixture = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-source-fixture-" + GLib.get_monotonic_time()])
    local source_repo = GLib.build_filenamev([source_fixture, "src"])
    local source_bare = GLib.build_filenamev([source_fixture, "sqgi.git"])
    local source_cache = GLib.build_filenamev([source_fixture, "cache"])
    build.mkdir_p(source_repo)
    build.write_file(GLib.build_filenamev([source_repo, "CMakeLists.txt"]), "cmake_minimum_required(VERSION 3.16)\nproject(fake_sqgi)\n")
    build.run_shell(
        "git -C " + build.shell_quote(source_repo) + " init -q && " +
        "git -C " + build.shell_quote(source_repo) + " checkout -q -B main && " +
        "git -C " + build.shell_quote(source_repo) + " add CMakeLists.txt && " +
        "git -C " + build.shell_quote(source_repo) +
            " -c user.name='sqgipkg test' -c user.email='sqgipkg@example.invalid' commit -q -m initial && " +
        "git clone -q --bare " + build.shell_quote(source_repo) + " " + build.shell_quote(source_bare),
        "creating SQGI source fixture"
    )
    local source_opts = build.new_options()
    source_opts.sqgi_source.repo = "file://" + source_bare
    source_opts.sqgi_source.branch = "main"
    source_opts.sqgi_source.cache = source_cache
    local cloned_source = build.ensure_sqgi_source(source_opts)
    check("sqgi source clones from configured repo",
        build.starts_with(cloned_source, source_cache) &&
        build.path_exists(GLib.build_filenamev([cloned_source, "CMakeLists.txt"])))
    check("linux build env exports sqgi source on demand",
        build.linux_build_env_prefix(source_opts, true).find("SQGI_SOURCE_DIR=") != null)
    local bad_source_opts = build.new_options()
    bad_source_opts.sqgi_source.dir = GLib.build_filenamev([source_fixture, "missing"])
    local rejected_bad_source_dir = false
    try {
        build.ensure_sqgi_source(bad_source_opts)
    } catch (e) {
        rejected_bad_source_dir = true
    }
    check("explicit sqgi source dir must exist",
        rejected_bad_source_dir)
    system("rm -rf " + build.shell_quote(source_fixture))
    if (previous_sqgi_source_dir != null)
        GLib.setenv("SQGI_SOURCE_DIR", previous_sqgi_source_dir, true)
} else {
    print("SKIP: sqgi source clone test (missing git)\n")
}
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
local message = linux.linux_cross_requirement_message(
    linux_opts,
    ["missing-tool"],
    [],
    [],
    [],
    [],
    ["zlib1g:" + linux.linux_current_deb_arch(linux_opts)],
    true,
    ["zlib1g:" + linux.linux_current_deb_arch(linux_opts)]
)
check("linux cross message includes pkg-config sysroot", message.find("PKG_CONFIG_SYSROOT_DIR:") != null)
if (host_arch == "aarch64")
    check("linux cross message guides amd64 apt on arm64 host", message.find("Ubuntu arm64 hosts") != null)
local stale_dir = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-stale-build-" + GLib.get_monotonic_time()])
linux.mkdir_p(stale_dir)
local stale_opts = linux.new_options()
stale_opts.build_dir = stale_dir
stale_opts.output_dir = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-stale-out-" + GLib.get_monotonic_time()])
stale_opts.appimage_arch = cross_arch
stale_opts.linux_current <- {
    arch = cross_arch,
    package_arch = "",
    build_dir = "",
    output = "",
    sysroot = "",
    cmake_toolchain = "",
    meson_cross_file = ""
}
local host_triplet = linux.linux_triplet_for_appimage_arch(host_arch)
local target_triplet = linux.linux_triplet_for_appimage_arch(cross_arch)
linux.write_file(GLib.build_filenamev([stale_dir, "CMakeCache.txt"]),
    "CMAKE_C_COMPILER:FILEPATH=/usr/bin/" + host_triplet + "-gcc\n" +
    "CMAKE_CXX_COMPILER:FILEPATH=/usr/bin/" + host_triplet + "-g++\n")
expect_error("linux stale CMake build dir", function() {
    linux.validate_linux_build_dir_state(stale_opts)
}, "stale CMake build directory")
linux.write_file(GLib.build_filenamev([stale_dir, "CMakeCache.txt"]),
    "CMAKE_C_COMPILER:FILEPATH=/usr/bin/" + target_triplet + "-gcc\n" +
    "CMAKE_CXX_COMPILER:FILEPATH=/usr/bin/" + target_triplet + "-g++\n")
linux.mkdir_p(GLib.build_filenamev([stale_dir, "meson-info"]))
linux.write_file(GLib.build_filenamev([stale_dir, "meson-info", "intro-machines.json"]),
    "{\"host\":{\"system\":\"linux\",\"cpu_family\":\"" + host_arch + "\",\"cpu\":\"" + host_arch + "\",\"endian\":\"little\"}}\n")
expect_error("linux stale Meson build dir", function() {
    linux.validate_linux_build_dir_state(stale_opts)
}, "stale Meson build directory")
linux.write_file(GLib.build_filenamev([stale_dir, "meson-info", "intro-machines.json"]),
    "{\"host\":{\"system\":\"linux\",\"cpu_family\":\"" + cross_arch + "\",\"cpu\":\"" + cross_arch + "\",\"endian\":\"little\"}}\n")
linux.validate_linux_build_dir_state(stale_opts)
system("rm -rf " + linux.shell_quote(stale_dir) + " " + linux.shell_quote(stale_opts.output_dir))
linux.prepare_linux_build_environment(linux_opts)
local generated_toolchain = linux.linux_cmake_toolchain_path(linux_opts)
local generated_cross_file = linux.linux_meson_cross_file_path(linux_opts)
check("linux generated cmake toolchain", linux.path_exists(generated_toolchain))
check("linux generated meson cross file", linux.path_exists(generated_cross_file))
check("linux build env exposes generated toolchain", linux.linux_build_env_prefix(linux_opts).find("SQGI_LINUX_CMAKE_TOOLCHAIN=") != null)
check("linux build env exposes build dir", linux.linux_build_env_prefix(linux_opts).find("SQGI_LINUX_BUILD_DIR=") != null)
check("linux cmake toolchain uses target triplet", linux.read_file(generated_toolchain).find(linux.linux_current_triplet(linux_opts) + "-gcc") != null)
system("rm -rf " + linux.shell_quote(linux_opts.output_dir))
local sysrooted_cross_opts = linux.new_options()
sysrooted_cross_opts.output_dir = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-module-sysroot-cross-" + GLib.get_monotonic_time()])
sysrooted_cross_opts.appimage_arch = cross_arch
sysrooted_cross_opts.linux.sysroot = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-module-sysroot-" + GLib.get_monotonic_time()])
sysrooted_cross_opts.linux_current <- {
    arch = cross_arch,
    package_arch = "",
    build_dir = "",
    output = "",
    sysroot = sysrooted_cross_opts.linux.sysroot,
    cmake_toolchain = "",
    meson_cross_file = ""
}
linux.prepare_linux_build_environment(sysrooted_cross_opts)
local sysrooted_cross_text = linux.read_file(linux.linux_meson_cross_file_path(sysrooted_cross_opts))
local sysrooted_triplet = linux.linux_current_triplet(sysrooted_cross_opts)
check("linux meson cross uses sysrooted c compiler",
    sysrooted_cross_text.find("c = ['" + sysrooted_triplet + "-gcc', '--sysroot=" + linux.linux_current_sysroot(sysrooted_cross_opts) + "']") != null)
check("linux meson cross uses sysrooted c++ compiler",
    sysrooted_cross_text.find("cpp = ['" + sysrooted_triplet + "-g++', '--sysroot=" + linux.linux_current_sysroot(sysrooted_cross_opts) + "']") != null)
check("linux meson cross pins host g-ir-compiler when available",
    linux.executable_path("g-ir-compiler") == null || sysrooted_cross_text.find("g-ir-compiler = '") != null)
check("linux meson cross uses qemu exe wrapper when available",
    !linux.qemu_user_available(cross_arch) ||
        (sysrooted_cross_text.find("exe_wrapper = '") != null &&
         sysrooted_cross_text.find(linux.qemu_user_binary_name(cross_arch) + "-wrapper.sh") != null))
check("linux build env exposes qemu loader prefix for cross sysroot",
    linux.linux_build_env_prefix(sysrooted_cross_opts).find("QEMU_LD_PREFIX=") != null)
system("rm -rf " + linux.shell_quote(sysrooted_cross_opts.output_dir) + " " + linux.shell_quote(sysrooted_cross_opts.linux.sysroot))

local appimage = AppImage.SqgiPkgAppImage()
check("appimage qemu binary for x86_64", appimage.qemu_user_binary_name("x86_64") == "qemu-x86_64")
check("appimage qemu binary for aarch64", appimage.qemu_user_binary_name("arm64") == "qemu-aarch64")
local smoke_opts = appimage.new_options()
smoke_opts.appimage_arch = "x86_64"
smoke_opts.linux.sysroot = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-smoke-sysroot-" + GLib.get_monotonic_time()])
local smoke_appdir = GLib.build_filenamev([GLib.get_tmp_dir(), "sqgipkg-smoke-appdir-" + GLib.get_monotonic_time()])
appimage.mkdir_p(GLib.build_filenamev([smoke_opts.linux.sysroot, "lib", "x86_64-linux-gnu"]))
appimage.mkdir_p(GLib.build_filenamev([smoke_opts.linux.sysroot, "usr", "lib", "x86_64-linux-gnu", "girepository-1.0"]))
appimage.mkdir_p(GLib.build_filenamev([smoke_opts.linux.sysroot, "usr", "lib", "x86_64-linux-gnu", "gstreamer-1.0"]))
appimage.mkdir_p(GLib.build_filenamev([smoke_opts.linux.sysroot, "usr", "share"]))
appimage.mkdir_p(GLib.build_filenamev([smoke_opts.linux.sysroot, "etc", "xdg"]))
appimage.mkdir_p(smoke_appdir)
local smoke_command = appimage.cross_smoke_test_command(smoke_opts, smoke_appdir, "--analyse --timeout=2", false)
check("appimage cross smoke uses qemu sysroot",
    smoke_command.find("QEMU_LD_PREFIX=") != null &&
    smoke_command.find(smoke_opts.linux.sysroot) != null &&
    smoke_command.find("LD_LIBRARY_PATH=") != null &&
    smoke_command.find("GI_TYPELIB_PATH=") != null &&
    smoke_command.find("GST_PLUGIN_PATH=") != null &&
    smoke_command.find("AppRun") != null &&
    smoke_command.find("--analyse --timeout=2") != null)
local isolated_smoke_command = appimage.cross_smoke_test_command(smoke_opts, smoke_appdir, "", true)
check("appimage isolated cross smoke blanks gstreamer system path",
    isolated_smoke_command.find("GST_PLUGIN_SYSTEM_PATH=''") != null &&
    isolated_smoke_command.find("GST_REGISTRY_FORK='no'") != null)
system("rm -rf " + appimage.shell_quote(smoke_opts.linux.sysroot) + " " + appimage.shell_quote(smoke_appdir))

local msys2 = Msys2.SqgiPkgWindowsMsys2()
check("msys2 dependency version strip", msys2.strip_dependency_version("mingw-w64-x86_64-glib2>=2.80") == "mingw-w64-x86_64-glib2")
check("msys2 url basename", msys2.url_basename("https://example.invalid/repo/pkg.tar.zst") == "pkg.tar.zst")
local win_opts = msys2.new_options()
check("windows cross tools target x64", msys2.windows_cross_tool_names(win_opts)[0] == "x86_64-w64-mingw32-gcc")
check("windows cross tool packages mention mingw64", msys2.windows_cross_tool_package_names(win_opts)[0] == "gcc-mingw-w64-x86-64")
check("windows classifies dwrite as system dll", msys2.windows_system_dll("DWrite.dll"))
check("windows classifies bcryptprimitives as system dll", msys2.windows_system_dll("bcryptprimitives.dll"))

local nsis = Nsis.SqgiPkgWindowsNsis()
check("nsis escape quotes", nsis.nsis_escape("a\"b") == "a$\\\"b")
check("nsis keep vars", nsis.nsis_escape_keep_vars("$LOCALAPPDATA\\App") == "$LOCALAPPDATA\\App")

if (failures != 0) {
    print("sqgipkg module tests failed: " + failures + "\n")
    return 1
}

print("sqgipkg module tests passed\n")
