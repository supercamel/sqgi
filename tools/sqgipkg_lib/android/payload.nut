// Shared APK/AAB/split inventory contract. Every protected byte is hashed.
local C = import("common.nut"), S = import("sdk.nut"), A = import("archive.nut"), GLib = import("GLib")
local M = {}
M.inventory <- function(root) {
    local result = {}
    foreach (path in C.walk(root)) {
        local name = path.slice(root.len() + 1)
        if (name == ".prepared.json") continue
        if (C.is_link(path)) throw "Android prepared input contains a symlink: " + path
        result[name] <- C.file_hash(path)
    }
    return result
}
M.seal <- function(root, abi) {
    C.atomic_json(root + "/.prepared.json", { schema = 1, abi = abi, files = M.inventory(root) })
    return C.file_hash(root + "/.prepared.json")
}
M.validate_prepared <- function(root, checksum, abi) {
    if (C.file_hash(root + "/.prepared.json") != checksum) throw "Prepared Android input descriptor changed"
    local descriptor = sqgi.json.parse(C.read(root + "/.prepared.json"))
    if (C.get(descriptor, "schema") != 1 || C.get(descriptor, "abi") != abi || !C.equal(C.get(descriptor, "files"), M.inventory(root)))
        throw "Prepared Android input inventory/ABI changed"
}
M.protected <- function(name) {
    if (name.len() && name[name.len() - 1] != '/')
        foreach (prefix in ["lib/", "assets/runtime/", "assets/application/"])
            if (name.len() >= prefix.len() && name.slice(0, prefix.len()) == prefix) return true
    return false
}
M.verify_payload <- function(read, names, abis) {
    local index_path = "assets/runtime/index.json", index_bytes = read(index_path), index = sqgi.json.parse(index_bytes)
    if (C.get(index, "schema") != 2 || typeof(C.get(index, "abis")) != "table" || !index.abis.len()) throw "Invalid Android runtime ABI index"
    foreach (abi, unused in index.abis) if (!(abi in S.TARGETS)) throw "Invalid Android runtime ABI index"
    if (!abis.len()) throw "No selected Android ABI"
    foreach (abi in abis) if (!(abi in index.abis)) throw "Selected Android ABI lacks metadata"
    local expected = { [index_path] = C.digest(index_bytes) }, payloads = {}, application = null
    foreach (abi, checksum in index.abis) {
        local prefix = "assets/runtime/" + abi + "/", data = read(prefix + "provenance.json"), provenance = sqgi.json.parse(data)
        if (C.digest(data) != checksum) throw "Runtime provenance checksum differs for " + abi
        if (C.get(provenance, "schema") != 2 || C.get(provenance, "abi") != abi) throw "Runtime provenance ABI/schema differs"
        expected[prefix + "provenance.json"] <- checksum
        foreach (name, value in provenance.assets) expected[prefix + C.relative(name)] <- value
        if (abis.find(abi) != null) foreach (name, record in provenance.libraries) {
            if (GLib.path_get_basename(name) != name || name.len() < 3 || name.slice(name.len() - 3) != ".so") throw "Invalid packaged library path: " + name
            expected["lib/" + abi + "/" + name] <- record.sha256
        }
        if (application != null && !C.equal(provenance.application, application)) throw "Android ABI inputs contain different application snapshots"
        application = provenance.application; payloads[abi] <- provenance
    }
    expected["assets/application/project.json"] <- C.digest(C.encoded(application))
    foreach (name, checksum in application.files) expected["assets/application/source/" + C.relative(name)] <- checksum
    local protected_names = []
    foreach (name in names) if (M.protected(name)) protected_names.push(name)
    C.sort_strings(protected_names)
    if (!C.equal(protected_names, C.keys(expected))) throw "Packaged Android payload differs from audited inventory"
    foreach (name, checksum in expected) if (C.digest(read(name)) != checksum) throw "Packaged bytes differ from provenance: " + name
    return { abis = abis, metadata_abis = C.keys(index.abis), payloads = payloads }
}
M.verify_artifact <- function(path, abis) {
    local prefix = path.len() > 4 && path.slice(path.len() - 4) == ".aab" ? "base/" : ""
    if (typeof(abis) == "string") abis = [abis]
    local archive = A.Zip(path), names = []
    foreach (name, unused in archive.entries)
        if (name.len() >= prefix.len() && name.slice(0, prefix.len()) == prefix) names.push(name.slice(prefix.len()))
    return M.verify_payload(function(name) { return archive.read(prefix + name) }, names, abis)
}
M.verify_splits <- function(paths, abi) {
    local owners = {}
    foreach (path in paths) {
        local archive = A.Zip(path)
        foreach (name, unused in archive.entries) if (M.protected(name)) {
            if (name in owners) throw "Duplicate payload across Android splits: " + name
            owners[name] <- archive
        }
    }
    return M.verify_payload(function(name) {
        if (!(name in owners)) throw "Split payload is missing: " + name
        return owners[name].read(name)
    }, C.keys(owners), [abi])
}
return M
