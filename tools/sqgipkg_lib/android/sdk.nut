local C = import("common.nut"), E = import("elf.nut"), GIR = import("gir.nut"), GLib = import("GLib")
local TARGETS = { ["arm64-v8a"] = "aarch64-linux-android", x86_64 = "x86_64-linux-android" }
local Wrapper = import("wrapper.nut")
local DESCRIPTOR = "sqgi-android-sdk.json", NDK_REVISION = "28.2.13676358"
class SDK {
    root = null; prefix = null; metadata = null; sha256 = null; abi = null
    constructor(location, target_abi, min_api) {
        root = C.realpath(location)
        if (!C.is_file(root + "/" + DESCRIPTOR)) root += "/" + target_abi
        metadata = sqgi.json.parse(C.read(root + "/" + DESCRIPTOR)); sha256 = C.file_hash(root + "/" + DESCRIPTOR)
        local m = metadata, t = C.get(m, "target", {})
        if (C.get(m, "schema") != 1 || C.get(m, "prefix") != "usr") throw "Unsupported Android SDK descriptor"
        if (!(target_abi in TARGETS) || C.get(t, "abi") != target_abi || C.get(t, "triplet") != TARGETS[target_abi] ||
            C.get(t, "libc") != "bionic" || C.get(t, "baseline") != "ubuntu-24.04" || C.get(t, "ndk") != NDK_REVISION)
            throw "Android SDK target/baseline/NDK mismatch for " + target_abi
        if (typeof(C.get(t, "min_api")) != "integer" || t.min_api < 31) throw "Invalid Android SDK minimum API"
        if (typeof(min_api) != "integer" || min_api < t.min_api) throw "Application minimum API is below the SDK minimum"
        if (C.get(m, "wrapper_abi") != 1) throw "Android SDK requires another application wrapper ABI"
        local runtime = C.get(m, "runtime", {})
        foreach (feature in ["jit", "kernels"])
            if (typeof(C.get(runtime, feature)) != "bool") throw "Invalid Android SQGI runtime capability: " + feature
        if (runtime.jit || runtime.kernels) {
            local compiler = C.get(runtime, "compiler", {})
            if (C.get(compiler, "name") != "LLVM" || C.get(compiler, "version") != "18.1.3" ||
                C.get(compiler, "library") != "libLLVM.so" || !("usr/lib/libLLVM.so" in C.get(m, "files", {})))
                throw "Android SQGI compiler capabilities require inventoried Ubuntu 24.04 LLVM 18.1.3"
        }
        if ("min_api" in runtime && (typeof(runtime.min_api) != "integer" || min_api < runtime.min_api)) throw "Application minimum API is below the SQGI runtime minimum"
        prefix = root + "/usr"; abi = target_abi
    }
    function resolve_namespaces() {
        // Source SDK exports predate the compact catalog included in Ooblerg
        // runtime packages. Derive it from the validated, inventoried target GIR;
        // this never loads host typelibs or requires the producer checkout.
        if (!("namespaces" in metadata)) metadata.namespaces <- GIR.catalog(prefix)
        return this
    }
    function validate() {
        local files = C.get(metadata, "files")
        if (typeof(files) != "table" || !files.len()) throw "Android SDK has no file inventory"
        if ("application_wrapper" in metadata) {
            Wrapper.validate(metadata.application_wrapper)
            foreach (kind, library in Wrapper.libraries)
                if (!("usr/lib/" + library in metadata.files)) throw "Android SDK is missing its declared application wrapper: " + library
        }
        if (C.is_link(prefix)) throw "Android SDK prefix must not be a symlink"
        C.progress("validating Android SDK: " + files.len() + " files")
        local actual = []; foreach (path in C.walk(prefix)) actual.push(path.slice(root.len() + 1))
        if (!C.equal(actual, C.keys(files))) throw "Android SDK file inventory differs from its descriptor"
        local verified = 0
        foreach (name, record in files) {
            C.progress("validating Android SDK: " + verified++ + "/" + files.len() + " files", true)
            if (typeof(record) != "table") throw "Invalid Android SDK file record: " + name
            local normalized = C.relative(name), path = root + "/" + normalized
            if (normalized != name || name.len() < 4 || name.slice(0, 4) != "usr/") throw "SDK file escapes the target prefix: " + name
            if ("link" in record) {
                if (!C.within(C.realpath(path), prefix)) throw "SDK file escapes the target prefix: " + name
                if (!C.is_link(path) || GLib.file_read_link(path) != record.link || !C.is_file(path))
                    throw "SDK link differs from its descriptor: " + name
            } else if (C.is_link(path) || !C.is_file(path) || C.file_hash(path) != C.get(record, "sha256"))
                throw "SDK file differs from its descriptor: " + name
            local stream = file(path, "rb"), magic = stream.len() >= 4 ? stream.readblob(4) : null; stream.close()
            if (magic != null && magic[0] == 127 && magic[1] == 'E' && magic[2] == 'L' && magic[3] == 'F') {
                local elf = E.inspect(path, abi)
                foreach (library in elf.needed)
                    if (E.SYSTEM_LIBRARIES.find(library) == null && (library == "libz.so" || !("usr/lib/" + library in files)))
                        throw "Missing/non-pinned Android ELF dependency: " + name + ": " + library
            }
        }
        foreach (name in ["lib/libsqgi.so", "lib/libsqgi-gtk.so", "lib/libc++_shared.so", "lib/girepository-1.0/Gtk-4.0.typelib"])
            if (!("usr/" + name in files)) throw "Android GTK SDK lacks " + name
        return this
    }
}
return { SDK = SDK, DESCRIPTOR = DESCRIPTOR, NDK_REVISION = NDK_REVISION, TARGETS = TARGETS }
