// Multi-ABI composition and device split verification, orchestrated by SQGI.
local C = import("common.nut"), P = import("payload.nut"), S = import("sdk.nut"), Signing = import("signing.nut"), GLib = import("GLib")
local Environment = import("environment.nut")
local M = { VERSION = "1.18.3", SHA256 = "a099cfa1543f55593bc2ed16a70a7c67fe54b1747bb7301f37fdfd6d91028e29" }
M.tool <- function(offline = false) {
    local override = GLib.getenv("BUNDLETOOL_JAR")
    if (override != null && override != "") {
        if (C.file_hash(override) != M.SHA256) throw "BUNDLETOOL_JAR differs from pinned bundletool " + M.VERSION
        return C.absolute(override)
    }
    local cache = C.cache(), name = "bundletool-all-" + M.VERSION + ".jar", path = cache + "/" + name
    return C.locked(cache + "/bundletool.lock", function() {
        if (!C.is_file(path)) {
            if (offline) throw "Offline bundle verification needs cached bundletool " + M.VERSION
            C.fetch("https://github.com/google/bundletool/releases/download/" + M.VERSION + "/" + name, path, M.SHA256)
        }
        if (C.file_hash(path) != M.SHA256) throw "Cached bundletool checksum mismatch"
        return path
    })
}
M.verify <- function(path, abis, work, android, java, offline = false, signer = null) {
    local command = [java + "/bin/java", "-jar", M.tool(offline)]
    local run = function(arguments) { local argv = clone command; argv.extend(arguments); return C.process(argv, Signing.environment(java)) }
    run(["validate", "--bundle=" + path])
    local root = work + "/splits", reports = {}; C.mkdir(root)
    foreach (abi in abis) {
        local spec = root + "/" + abi + ".json", apks = root + "/" + abi + ".apks"
        C.atomic_json(spec, { supportedAbis = [abi], supportedLocales = ["en"], screenDensity = 420, sdkVersion = 35 })
        Signing.with_bundle_arguments(java, function(arguments) {
            local args = ["build-apks", "--bundle=" + path, "--output=" + apks, "--overwrite", "--device-spec=" + spec,
                          "--aapt2=" + Environment.packaging_tool("aapt2", android)]
            args.extend(arguments); run(args)
        })
        local selected = root + "/" + abi; C.remove(selected)
        run(["extract-apks", "--apks=" + apks, "--device-spec=" + spec, "--output-dir=" + selected])
        local paths = [], files = {}
        foreach (file in C.walk(selected)) if (C.ends(file, ".apk")) paths.push(file)
        if (!paths.len()) throw "bundletool produced no device APK splits: " + abi
        local verified = P.verify_splits(paths, abi)
        foreach (file in paths) { Signing.verify_apk(file, android, java, signer); files[file] <- C.file_hash(file) }
        reports[abi] <- { apks = apks, sha256 = C.file_hash(apks), files = files,
            metadata_abis = verified.metadata_abis, native_abis = verified.abis }
    }
    C.atomic_json(root + "/verification.json", { bundle_sha256 = C.file_hash(path), bundletool_version = M.VERSION,
        bundletool_sha256 = M.SHA256, splits = reports })
    return reports
}
M.combine <- function(inputs, destination) {
    local seen = {}
    if (!inputs.len()) throw "Bundle needs unique supported ABI inputs"
    foreach (item in inputs) {
        if (!(item.abi in S.TARGETS) || item.abi in seen) throw "Bundle needs unique supported ABI inputs"
        seen[item.abi] <- true
    }
    C.remove(destination); C.mkdir(destination)
    local common = null, wrappers = null, index = { schema = 2, abis = {} }
    foreach (item in inputs) {
        local root = item.prepared, abi = item.abi
        P.validate_prepared(root, item.prepared_sha256, abi)
        local files = P.inventory(root), shared = {}
        foreach (name, value in files) if (name == "project.json" || name == "AndroidManifest.xml" || C.starts(name, "res/") || C.starts(name, "java/") || C.starts(name, "assets/application/")) shared[name] <- value
        local provenance = sqgi.json.parse(C.read(root + "/assets/runtime/" + abi + "/provenance.json"))
        if ((common != null && !C.equal(shared, common)) || (wrappers != null && !C.equal(provenance.wrapper, wrappers)))
            throw "Bundle ABI inputs must share application sources, GTK Java glue and wrapper version"
        if (common == null) {
            foreach (name, unused in shared) C.copy(root + "/" + name, destination + "/" + name)
            common = shared; wrappers = provenance.wrapper
        }
        C.copy_tree(root + "/jniLibs/" + abi, destination + "/jniLibs/" + abi)
        C.copy_tree(root + "/assets/runtime/" + abi, destination + "/assets/runtime/" + abi)
        index.abis[abi] <- C.file_hash(root + "/assets/runtime/" + abi + "/provenance.json")
    }
    C.atomic_json(destination + "/assets/runtime/index.json", index)
    return destination
}
return M
