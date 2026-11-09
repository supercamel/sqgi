// Explicit Cargo/C-ABI recipe driven by sqgipkg's portable build context.
local GLib = import("GLib"), Gio = import("Gio")
local env = function(name) { local value = GLib.getenv(name); if (value == null) throw "Missing build context: " + name; return value }
local build = env("BUILD_DIR"), prefix = env("SQGI_NATIVE_SDK") + "/usr", install = env("DESTDIR") + "/usr"
local target = { x86_64 = "x86_64-linux-android", ["arm64-v8a"] = "aarch64-linux-android" }[env("ANDROID_ABI")]
local run = function(argv, variables = null) {
    local launcher = Gio.SubprocessLauncher.new(Gio.SubprocessFlags.none)
    if (variables != null) foreach (name, value in variables) {
        if (value == null) launcher.unsetenv(name)
        else launcher.setenv(name, value, true)
    }
    local child = launcher.spawnv(argv); child.wait(null)
    if (!child.get_successful()) throw "Native recipe command failed: " + argv[0]
}
local copy = function(source, destination) {
    if (GLib.mkdir_with_parents(GLib.path_get_dirname(destination), 493) != 0) throw "Cannot create native install directory"
    Gio.File.new_for_path(source).copy(Gio.File.new_for_path(destination), Gio.FileCopyFlags.overwrite, null, null)
}
local linker_key = "CARGO_TARGET_"
foreach (byte in target.toupper()) linker_key += byte == '-' ? "_" : format("%c", byte)
linker_key += "_LINKER"
local flags = ["-L", "native=" + prefix + "/lib", "-C", "link-arg=-Wl,-soname,libsqmobile-rust.so",
    "-C", "link-arg=-Wl,-z,max-page-size=16384", "-C", "link-arg=-Wl,-z,common-page-size=16384"], encoded = ""
foreach (i, value in flags) encoded += (i ? "\x1f" : "") + value
run([env("CARGO"), "build", "--locked", "--offline", "--release", "--target", target, "--target-dir", build + "/cargo"],
    { [linker_key] = env("CC"), RUSTFLAGS = null, CARGO_ENCODED_RUSTFLAGS = encoded })
local library = build + "/libsqmobile-rust.so", gir = build + "/SqMobileRust-1.0.gir", typelib = build + "/SqMobileRust-1.0.typelib"
copy(build + "/cargo/" + target + "/release/libsqmobile_rust.so", library)
run([env("GI_SCANNER"), "--namespace=SqMobileRust", "--nsversion=1.0", "--identifier-prefix=SqMobileRust", "--symbol-prefix=sq_mobile_rust",
    "--include=SqMobile-1.0", "--pkg=sqmobile-1.0", "--library=sqmobile-rust", "--library-path=" + build, "--output=" + gir, "sq-mobile-rust.h"])
run([env("GI_COMPILER"), gir, "--output=" + typelib])
copy(library, install + "/lib/libsqmobile-rust.so")
copy(gir, install + "/share/gir-1.0/SqMobileRust-1.0.gir")
copy(typelib, install + "/lib/girepository-1.0/SqMobileRust-1.0.typelib")
copy("sq-mobile-rust.h", install + "/include/sq-mobile-rust.h")
