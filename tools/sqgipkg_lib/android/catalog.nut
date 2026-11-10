// One catalog covers the SDK and all prebuilt application libraries.
local C = import("common.nut"), R = import("repository.nut"), S = import("sdk.nut"), GLib = import("GLib")
local M = {}
M.url <- function(origin, sdk_id, target, version = 2) {
    while (C.ends(origin, "/")) origin = origin.slice(0, origin.len() - 1)
    if (!regexp("^[a-z0-9][a-z0-9.\\-]*$").match(sdk_id) || !(target in R.TARGETS)) throw "Invalid Android catalog identity"
    return origin + "/android/" + sdk_id + "/" + target + "/v" + version
}
// Only an absent catalog permits legacy fallback. Network, JSON and integrity
// failures must remain errors rather than silently selecting older packages.
M.probe <- function(repo) {
    local path = repo.cache + "/index.json"
    if (C.exists(path) && (!repo.refresh || !repo.download)) return true
    if (!repo.download) return false
    local url = repo.url + "/index.json"
    if (C.starts(url, "file://") && !import("Gio").File.new_for_uri(url).query_exists(null)) return false
    C.mkdir(repo.cache)
    local temporary = path + "." + GLib.uuid_string_random(), error = null, found = false
    try {
        local status = strip(C.process(["curl", "--location", "--silent", "--show-error", "--connect-timeout", "15", "--max-time", "120",
            "--proto", "=http,https,file", "--proto-redir", "=http,https", "--output", temporary, "--write-out", "%{http_code}", url]))
        if (status == "200" || (status == "000" && C.starts(url, "file://"))) { C.move(temporary, path); found = true }
        else if (status != "404") throw "Android catalog download failed (HTTP " + status + "): " + url
    } catch (caught) { error = caught }
    C.remove(temporary)
    if (error != null) throw error
    return found
}
M.validate <- function(index, abi, sdk_id) {
    local target = S.TARGETS[abi], identity = C.get(index, "android", {}), schema = C.get(index, "schema")
    if ([1, 2].find(schema) == null || C.get(index, "target") != target || C.get(index, "prefix") != "/usr") throw "Android catalog target/prefix mismatch"
    foreach (key, value in { abi = abi, triplet = target, libc = "bionic", ndk = S.NDK_REVISION, baseline = "ubuntu-24.04", min_api = 31, sdk_id = sdk_id })
        if (C.get(identity, key) != value) throw "Incompatible Android catalog baseline/NDK/API/ABI"
    local contract = C.get(index, "android_module"), entries = {}
    if (schema == 2) {
        local expected_target = clone identity; delete expected_target.sdk_id; delete expected_target.source_lock_sha256
        if (C.get(contract, "sdk_id") != sdk_id || !C.equal(C.get(contract, "target"), expected_target) ||
            C.get(contract, "source_lock_sha256") != C.get(identity, "source_lock_sha256") ||
            !regexp("^[0-9a-f]{64}$").match(C.get(contract, "producer_descriptor_sha256", ""))) throw "Incompatible Android catalog module contract"
    }
    foreach (raw in index.packages) {
        local entry = R.validate_entry(raw)
        if (entry.name in entries || !C.equal(C.get(entry, "android"), identity)) throw "Mixed target/release or duplicate Android package: " + entry.name
        if ("module" in entry) {
            if (schema != 2 || C.get(entry, "kind") == "meta" || !C.equal(C.get(entry, "android_module"), contract)) throw "Mixed SDK in Android module package: " + entry.name
            if (typeof(C.get(entry.module, "files")) != "table" || !entry.module.files.len()) throw "Android module has no file inventory"
        } else if ("android_module" in entry) throw "Android module package has no payload inventory"
        entries[entry.name] <- entry
    }
    R.closure(entries, C.keys(entries))
    return entries
}
M.load <- function(request) {
    local target = S.TARGETS[request.abi], locked = C.get(request, "locked"), origin = request.repository
    local url = M.url(origin, request.sdk_id, target), legacy = M.url(origin, request.sdk_id, target, 1)
    local explicit_legacy = C.get(request, "module_set", "") != ""
    if (explicit_legacy) url = legacy
    if (locked != null) {
        if ([url, legacy].find(C.get(locked, "repository")) == null || C.get(locked, "target") != target || C.get(locked, "sdk_id") != request.sdk_id)
            throw "Android package lock differs: repository, target or SDK"
        url = locked.repository
    }
    local repo = R.Repository(url, request.cache, C.get(request, "download", true), C.get(request, "refresh", false), target)
    local checksum, path, cached = C.exists(repo.cache + "/index.json") && (!repo.refresh || !repo.download)
    if (locked != null) {
        checksum = C.get(locked, "sha256", "")
        if (!regexp("^[0-9a-f]{64}$").match(checksum)) throw "Invalid locked Android catalog checksum"
        path = repo.cache + "/indexes/" + checksum + ".json"; repo.refresh = false
        repo.fetch("index.json", path, checksum)
    } else {
        if (!M.probe(repo)) {
            repo = R.Repository(legacy, request.cache, repo.download, repo.refresh, target)
            cached = C.exists(repo.cache + "/index.json") && (!repo.refresh || !repo.download)
            repo.index()
        }
        checksum = C.file_hash(repo.cache + "/index.json")
        path = repo.cache + "/indexes/" + checksum + ".json"
        if (!C.exists(path)) C.atomic_bytes(path, C.read(repo.cache + "/index.json"))
    }
    if (C.file_hash(path) != checksum) throw "Cached Android catalog checksum mismatch"
    local index = sqgi.json.parse(C.read(path)), entries = M.validate(index, request.abi, request.sdk_id)
    if ((C.ends(repo.url, "/v2") ? 2 : 1) != index.schema) throw "Android catalog schema differs from repository version"
    return { repo = repo, index = index, entries = entries, sha256 = checksum, cached = cached }
}
return M
