// Resolve a pinned SDK catalog and validate the private tree before promotion.
local C = import("common.nut"), S = import("sdk.nut"), R = import("repository.nut")
local Catalog = import("catalog.nut"), M = {}
M.select_profile <- function(index, catalog, minimum, packages) {
    local profiles = ["runtime", "sdk", "tools", "complete"], required = {}
    local profile_packages = {}
    foreach (name, profile in index.sdk_profiles) profile_packages[profile.package] <- true
    // Profiles are alternative metapackages: sdk includes runtime's files,
    // without necessarily depending on the runtime metapackage itself.
    foreach (entry in R.closure(catalog, packages))
        if (!("module" in entry) && !(C.get(entry, "kind") == "meta" && entry.name in profile_packages)) required[entry.name] <- true
    for (local i = profiles.find(minimum); i < profiles.len(); i++) {
        local name = profiles[i]
        if (!(name in index.sdk_profiles)) continue
        local available = {}
        foreach (entry in R.closure(catalog, [index.sdk_profiles[name].package])) available[entry.name] <- true
        local included = true
        foreach (package, unused in required) if (!(package in available)) included = false
        if (included) return name
    }
    throw "Requested Android packages are not covered by a validated SDK profile"
}
M.resolve <- function(request) {
    local abi = request.abi, sdk_id = request.sdk_id
    if (!(abi in S.TARGETS) || !regexp("^[a-z0-9][a-z0-9.\\-]*$").match(sdk_id)) throw "Invalid Android ABI or SDK release"
    local target = S.TARGETS[abi], profile = C.get(request, "profile", "runtime")
    if (["runtime", "sdk", "tools", "complete"].find(profile) == null) throw "Unsupported Android SDK profile"
    local loaded = Catalog.load(request), repo = loaded.repo, url = repo.url, checksum = loaded.sha256
    local locked = C.get(request, "locked"), index = loaded.index, identity = index.android, catalog = loaded.entries
    local expected = { abi = abi, triplet = target, libc = "bionic", ndk = S.NDK_REVISION, baseline = "ubuntu-24.04", min_api = 31, sdk_id = sdk_id }
    local requested_profile = profile, additional = clone C.get(request, "packages", [])
    C.sort_strings(additional)
    local seeds = clone additional
    if (index.schema == 2) foreach (name in C.get(request, "native_packages", [])) seeds.push(name)
    // Native composition validates the complete GIR graph, including the base
    // namespaces. The SDK profile supplies those GIR files and development data.
    foreach (entry in R.closure(catalog, seeds)) if ("module" in entry && profile == "runtime") profile = "sdk"
    profile = M.select_profile(index, catalog, profile, seeds)
    if (locked != null && (C.get(locked, "profile") != profile || !C.equal(C.get(locked, "packages", []), additional) ||
        (additional.len() && C.get(locked, "minimum_profile") != requested_profile)))
        throw "Android package selection differs from locked catalog"
    local descriptor = index.sdk_profiles[profile]
    if (!regexp("^[0-9a-f]{64}$").match(C.get(descriptor, "sha256", ""))) throw "Missing Android SDK descriptor checksum"
    local descriptor_path = repo.cache + "/descriptors/" + descriptor.sha256 + ".json"
    repo.fetch(descriptor.artifact, descriptor_path, descriptor.sha256)
    local metadata = sqgi.json.parse(C.read(descriptor_path)), expected_target = {}
    foreach (key, unused in expected) if (key != "sdk_id") expected_target[key] <- identity[key]
    if (C.get(metadata, "sdk_id") != sdk_id || C.get(metadata, "profile") != profile || !C.equal(C.get(metadata, "target"), expected_target) ||
        C.get(metadata, "source_lock_sha256") != C.get(identity, "source_lock_sha256")) throw "Android descriptor differs from catalog identity"
    if (index.schema == 2 && C.get(metadata, "producer_descriptor_sha256", descriptor.sha256) != index.android_module.producer_descriptor_sha256)
        throw "Android SDK descriptor differs from module contract"
    local selection = R.closure(catalog, [descriptor.package])
    foreach (entry in selection) if ("module" in entry) throw "Android SDK profile contains an application module"
    local pin = { sha256 = checksum, repository = url, target = target, sdk_id = sdk_id, profile = profile, descriptor_sha256 = descriptor.sha256 }
    if (additional.len()) { pin.packages <- additional; pin.minimum_profile <- requested_profile }
    if (locked != null && !C.equal(pin, locked)) throw "Android SDK descriptor differs from locked catalog"
    local validate = function(root, prepared) {
        C.copy(descriptor_path, root + "/" + S.DESCRIPTOR)
        local sdk = S.SDK(root, abi, request.min_api).validate(), owners = {}
        foreach (package in prepared.packages) foreach (name in package.files) {
            if (name in owners) throw "Overlapping Android package ownership: " + name
            owners[name] <- package.metadata.name
        }
        if (!C.equal(owners, C.get(sdk.metadata, "file_owners"))) throw "Android package ownership differs from SDK descriptor"
    }
    local root = C.absolute(request.root), entries = []
    foreach (entry in selection) entries.push({ repository = url, target = target, metadata = entry, sha256 = C.get(entry, "sha256") })
    local prepared = C.locked(root + ".lock", function() {
        return R.prepare({ repository = url, cache = request.cache, target = target, download = C.get(request, "download", true),
            refresh = false, root = root, packages = [descriptor.package], build_packages = [], locked = entries }, validate)
    })
    local packages = []; foreach (package in prepared.packages) packages.push(package.metadata.name)
    local module_packages = []
    foreach (name in additional) if ("module" in catalog[name]) module_packages.push(name)
    return { sdk = root, sdk_sha256 = descriptor.sha256, lock = pin, packages = packages, module_packages = module_packages }
}
return M
