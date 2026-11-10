// Consume resolved inputs. Manifest/source selection remains in sqgipkg.
local C = import("common.nut"), S = import("sdk.nut"), E = import("elf.nut"), T = import("toolchain.nut")
local P = import("payload.nut"), Signing = import("signing.nut"), B = import("bundle.nut"), GLib = import("GLib")
local N = import("native.nut")
local Entry = import("entry.nut")
local Runtime = import("runtime.nut")
local Resources = import("resources.nut")
local Wrapper = import("wrapper.nut")
local HERE = GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null))
local M = {}
M.native_java <- function(sdk, destination) {
    // Compile only inventoried companion sources from native packages.
    local prefix = "usr/share/sqgi-android/java/"
    foreach (name, unused in sdk.metadata.files) if (C.starts(name, prefix)) {
        local relative = C.relative(name.slice(prefix.len()))
        if (!C.ends(relative, ".java") || C.starts(relative, "org/gtk/") || C.starts(relative, "org/sqgi/android/"))
            throw "Invalid or reserved native Java export: " + name
        local target = destination + "/" + relative
        if (C.exists(target)) throw "Native Java export conflicts with a wrapper source: " + name
        C.copy(sdk.root + "/" + name, target)
    }
}
M.metadata_closure <- function(roots, catalog) {
    if (typeof(catalog) != "table") throw "Android SDK has no GI namespace catalog"
    local pending = clone roots, found = {}, libraries = []
    while (pending.len()) {
        local name = pending.pop()
        if (name in found) continue
        if (!(name in catalog)) throw "SDK has no GI namespace: " + name
        found[name] <- true; pending.extend(catalog[name].includes); libraries.extend(catalog[name].libraries)
    }
    return { namespaces = C.keys(found), libraries = libraries }
}
M.prepare <- function(request, sdk, work, tools) {
    local abi = request.abi, config = request.application, namespaces = ["Gtk-4.0"]
    namespaces.extend(config.namespaces); namespaces.extend(C.get(request, "native_namespaces", []))
    local metadata = M.metadata_closure(namespaces, C.get(sdk.metadata, "namespaces")), roots = [], entry = null
    if (C.get(config, "native_entry") != null) {
        entry = Entry.prepare(request, sdk, work, tools)
        roots.extend(entry.record.needed); roots.push(config.native_entry.library)
    } else roots.push("libsqgi-gtk.so")
    roots.extend(metadata.libraries); roots.extend(C.get(request, "native_libraries", []))
    local libraries = E.closure(sdk.prefix, abi, roots, tools.readelf)
    local destination = C.get(request, "prepared", work + "/input"), native = destination + "/jniLibs/" + abi
    local assets = destination + "/assets/runtime/" + abi
    C.remove(destination); C.mkdir(native); C.mkdir(assets + "/typelib")
    foreach (name, unused in libraries) {
        if (!("usr/lib/" + name in sdk.metadata.files)) throw "Untracked SDK library: " + name
        C.copy(sdk.prefix + "/lib/" + name, native + "/" + name)
    }
    if (entry != null) { C.copy(entry.path, native + "/libsqgi-entry.so"); libraries["libsqgi-entry.so"] <- entry.record }
    local platform = native + "/libsqgi-platform.so"
    if (Wrapper.available(sdk.metadata, "platform")) C.copy(sdk.prefix + "/lib/libsqgi-platform.so", platform)
    else {
        local compiler = tools.ndk + "/toolchains/llvm/prebuilt/linux-x86_64/bin/" + S.TARGETS[abi] + config.min_sdk + "-clang"
        C.process([compiler, "-shared", "-fPIC", "-O2", "-Wl,-soname,libsqgi-platform.so", "-Wl,-z,max-page-size=16384",
            "-Wl,-z,common-page-size=16384", "-Wl,-z,global", HERE + "/platform.c", "-ldl", "-llog", "-o", platform])
    }
    libraries["libsqgi-platform.so"] <- E.inspect(platform, abi, tools.readelf)
    foreach (namespace in metadata.namespaces)
        C.copy(sdk.prefix + "/lib/girepository-1.0/" + namespace + ".typelib", assets + "/typelib/" + namespace + ".typelib")
    local application = destination + "/assets/application", source = request.source, files = {}
    foreach (path in C.walk(source)) {
        if (C.is_link(path)) throw "Android application payload cannot contain symlinks: " + path
        local name = path.slice(source.len() + 1)
        files[name] <- C.file_hash(path); C.copy(path, application + "/source/" + name)
    }
    if (!(config.entry in files) && !(config.entry == "" && entry != null)) throw "Staged application entry is missing"
    local snapshot = { schema = 1, project = config, files = files }
    C.atomic_json(application + "/project.json", snapshot); C.atomic_json(destination + "/project.json", config)
    Resources.prepare(destination, config, C.get(request, "icon", ""))
    C.copy(HERE + "/fonts.conf", assets + "/fonts.conf")
    local schemas = assets + "/share/glib-2.0/schemas"; C.mkdir(schemas)
    foreach (item in C.children(sdk.prefix + "/share/glib-2.0/schemas"))
        if (!item.directory && C.ends(item.name, ".xml")) C.copy(item.path, schemas + "/" + item.name)
    C.process(["/usr/bin/glib-compile-schemas", "--strict", schemas])
    // Native packages may export runtime data separately from their headers,
    // build metadata and documentation. Include only inventoried SDK files.
    local data_prefix = "usr/share/sqgi-android/runtime/"
    foreach (name, unused in sdk.metadata.files) if (C.starts(name, data_prefix)) {
        local target = assets + "/share/" + C.relative(name.slice(data_prefix.len()))
        if (C.exists(target)) throw "Native runtime data conflicts with a wrapper asset: " + name
        C.copy(sdk.root + "/" + name, target)
    }
    C.copy_tree(sdk.prefix + "/share/gtk4/android/java", destination + "/java")
    M.native_java(sdk, destination + "/java")
    local provenance = { schema = 2, abi = abi, profile = "gui", variant = C.get(request, "variant", "debug"),
        sdk_sha256 = sdk.sha256, sdk_target = sdk.metadata.target, base_sdk_sha256 = C.get(sdk.metadata, "base_sdk_sha256", sdk.sha256),
        native = C.get(request, "native_evidence", {}), libraries = libraries, typelibs = metadata.namespaces,
        application = snapshot, assets = P.inventory(assets), wrapper = {} }
    if ("runtime_build" in sdk.metadata) provenance.runtime_build <- sdk.metadata.runtime_build
    if ("host_tools" in request) provenance.host_tools <- request.host_tools
    foreach (path in C.walk(HERE + "/template")) provenance.wrapper[path.slice(HERE.len() + 1)] <- C.file_hash(path)
    provenance.wrapper["platform.c"] <- C.file_hash(HERE + "/platform.c")
    provenance.wrapper["resources.nut"] <- C.file_hash(HERE + "/resources.nut")
    if (entry != null) foreach (name in ["native_entry.c", "sqgi_android_entry.h"]) provenance.wrapper[name] <- C.file_hash(HERE + "/" + name)
    C.atomic_json(assets + "/provenance.json", provenance)
    C.atomic_json(destination + "/assets/runtime/index.json", { schema = 2, abis = { [abi] = C.file_hash(assets + "/provenance.json") } })
    return destination
}
M.package <- function(request, prepared, work, abis, tools = null) {
    if (tools == null) tools = T.resolve(request)
    local variant = C.get(request, "variant", "debug"), java = tools.java
    Signing.configured(variant)
    if (variant == "debug") Signing.prepare_debug_key(java)
    local expected = Signing.expected_certificate(java), project = work + "/gradle"
    C.remove(project + "/app/src"); C.copy_tree(HERE + "/template", project)
    local env = Signing.signing_environment(java)
    env.ANDROID_HOME <- tools.android_sdk; env.ANDROID_SDK_ROOT <- tools.android_sdk; env.PATH <- java + "/bin:/usr/bin:/bin"
    local task = (request.format == "apk" ? "assemble" : "bundle") + (variant == "debug" ? "Debug" : "Release")
    local command = [T.gradle(C.get(request, "offline", false)), "--no-daemon", "--console=plain", "--no-configuration-cache", "--dependency-verification=strict"]
    if (tools.aapt2 != null) command.push("-Pandroid.aapt2FromMavenOverride=" + tools.aapt2)
    if (C.get(request, "offline", false)) command.push("--offline")
    command.extend(["-p", project, "-PruntimeAbis=" + C.concat(abis), "-PruntimeInput=" + prepared, ":app:" + task])
    C.process(command, env, false)
    local suffix = request.format, output = project + "/app/build/outputs/" + (suffix == "apk" ? "apk" : "bundle") + "/" + variant + "/app-" + variant + "." + suffix
    if (suffix == "aab" && variant == "debug") output = Signing.sign_debug_bundle(output, work + "/app-debug-signed.aab", java)
    local verification = P.verify_artifact(output, abis), splits = {}, signer
    if (suffix == "aab") {
        signer = Signing.verify_aab(output, java, expected)
        splits = B.verify(output, abis, work, tools.android_sdk, java, C.get(request, "offline", false), signer)
    } else signer = Signing.verify_apk(output, tools.android_sdk, java, expected)
    local destination = request.artifact, temporary = destination + ".tmp"
    C.copy(output, temporary); C.move(temporary, destination)
    delete verification.payloads
    return { artifact = destination, sha256 = C.file_hash(destination), abis = abis, splits = splits,
        variant = variant, signer_sha256 = signer, verification = verification }
}
M.build <- function(request) {
    local tools = T.resolve(request); Signing.configured(C.get(request, "variant", "debug"))
    local sdk = S.SDK(request.sdk, request.abi, request.application.min_sdk).validate()
    if (sdk.sha256 != request.sdk_sha256) throw "Android SDK descriptor changed after input resolution"
    sdk.resolve_namespaces()
    local work = C.absolute(request.work)
    return C.locked(work + "/build.lock", function() {
        local runtime = Runtime.build(request, sdk, work, tools)
        sdk = runtime.sdk
        local native = N.build(request, sdk, work, tools), options = clone request
        sdk = native.sdk; options.native_libraries <- native.libraries; options.native_namespaces <- native.namespaces; options.native_evidence <- native.evidence
        local prepared = M.prepare(options, sdk, work, tools)
        local result = { prepared = prepared, prepared_sha256 = P.seal(prepared, request.abi),
            sdk_sha256 = sdk.sha256, runtime = sdk.metadata.runtime, runtime_build = runtime.evidence, abi = request.abi, native = native.evidence }
        if (request.operation != "prepare") foreach (key, value in M.package(request, prepared, work, [request.abi], tools)) result[key] <- value
        return result
    })
}
M.build_bundle <- function(request) {
    local work = C.absolute(request.work)
    return C.locked(work + "/build.lock", function() {
        local prepared = B.combine(request.inputs, work + "/input"), abis = [], options = clone request
        foreach (item in request.inputs) abis.push(item.abi)
        options.format <- "aab"
        return M.package(options, prepared, work, abis)
    })
}
return M
