// Ooblerg Android transport. Wire/cache formats match the shared desktop helper.
local C = import("common.nut"), A = import("archive.nut"), GLib = import("GLib")
local M = { MARKER = ".sqgipkg-ooblerg.json", TARGETS = { ["x86_64-linux-android"] = 62, ["aarch64-linux-android"] = 183 } }
M.relative_path <- function(value, prefix = null) {
    if (typeof(value) != "string" || value.find(":") != null) throw "Invalid repository path"
    local path = C.relative(value)
    if (prefix != null && path != prefix && !C.starts(path, prefix + "/")) throw "Package path is outside " + prefix + ": " + value
    return path
}
M.validate_entry <- function(value) {
    local name = C.get(value, "name")
    if (typeof(name) != "string" || !regexp("^[A-Za-z0-9][A-Za-z0-9+_.\\-]*$").match(name)) throw "Invalid Ooblerg package name"
    if (typeof(C.get(value, "version")) != "string" || value.version == "") throw "Missing version for " + name
    local entry = clone value, deps = C.get(value, "dependencies", []), tags = C.get(value, "tags", [])
    if (typeof(deps) != "array" || typeof(tags) != "array") throw "Invalid Ooblerg dependencies/tags: " + name
    foreach (dep in deps) if (typeof(dep) != "string" || dep == "") throw "Invalid dependencies for " + name
    foreach (tag in tags) if (typeof(tag) != "string") throw "Invalid tags for " + name
    foreach (key in ["summary", "description"]) if (key in value && typeof(value[key]) != "string") throw "Invalid " + key + " for " + name
    if (C.get(value, "kind") == "meta") {
        if (C.get(value, "artifact", "") != "") throw "Meta package must not have an archive"
    } else {
        M.relative_path(C.get(value, "artifact"))
        if (typeof(C.get(value, "sha256")) != "string" || !regexp("^[0-9a-f]{64}$").match(value.sha256)) throw "Missing SHA-256 for " + name
    }
    entry.dependencies <- deps; entry.tags <- tags
    return entry
}
class Repository {
    url = null; cache = null; download = null; refresh = null; target = null
    constructor(origin, directory, allow_download = true, force_refresh = false, triplet = "x86_64-linux-android") {
        if (!(triplet in M.TARGETS)) throw "Unsupported Ooblerg target: " + triplet
        url = origin; while (C.ends(url, "/")) url = url.slice(0, url.len() - 1)
        if (!regexp("^(https?|file)://").search(url)) throw "Ooblerg repository requires an https, http or file URL"
        cache = C.absolute(directory) + "/" + C.digest(url).slice(0, 20)
        download = allow_download; refresh = force_refresh; target = triplet
    }
    function fetch(relative, destination, expected = null) {
        M.relative_path(relative)
        if (C.exists(destination) && (!refresh || !download)) {
            if (expected != null && C.file_hash(destination) != expected) throw "Ooblerg cached archive checksum mismatch: " + destination
            return true
        }
        if (!download) throw "Ooblerg downloads disabled; missing cached input: " + relative
        C.fetch(url + "/" + GLib.uri_escape_string(relative, "/+.-_", false), destination, expected)
        return false
    }
    function index() {
        local path = cache + "/index.json", cached = fetch("index.json", path), value = sqgi.json.parse(C.read(path))
        if (typeof(C.get(value, "packages")) != "array") throw "The Ooblerg catalog has no package list"
        if (C.get(value, "target") != target || C.get(value, "prefix") != "/usr") throw "Ooblerg repository must target " + target + " with /usr prefix"
        local entries = {}
        foreach (raw in value.packages) {
            local entry = M.validate_entry(raw)
            if (entry.name in entries) throw "Duplicate package: " + entry.name
            entries[entry.name] <- entry
        }
        return { entries = entries, cached = cached }
    }
}
M.Repository <- Repository
M.closure <- function(index, seeds) {
    local ordered = [], visited = {}, visit = null
    visit = function(name) {
        if (name in visited) return
        if (!(name in index)) throw "Ooblerg dependency not found: " + name
        visited[name] <- true
        local entry = M.validate_entry(index[name])
        foreach (dependency in entry.dependencies) visit(dependency)
        ordered.push(entry)
    }
    foreach (name in seeds) visit(name)
    return ordered
}
M.extract <- function(archive, root, owners, package, target) {
    local paths = [], links = {}
    A.tar_read(archive, function(member) {
        C.progress("extracting " + package + ": " + paths.len() + " files", true)
        if (member.type == '5' && (member.name == "." || member.name == "./")) return
        local path = M.relative_path(member.name, "usr")
        if (member.type == '2') {
            local link = member.link
            if (link == "" || link.find("\\") != null || link.find(":") != null) throw "Unsafe Android archive link: " + member.name
            for (local i = 0; i < link.len(); i++) if (link[i] == 0) throw "Unsafe Android archive link"
            local destination = M.relative_path(GLib.canonicalize_filename(link, "/" + GLib.path_get_dirname(path)).slice(1), "usr")
            if (path in links && links[path] != destination) throw "Conflicting Android archive links: " + path
            links[path] <- destination; return
        }
        if (member.type != '5' && member.type != '0' && member.type != 0) throw "Unsupported archive entry in " + package + ": " + member.name
        local destination = root + "/" + path
        if (member.type == '5') { C.mkdir(destination); return }
        if (path in owners) {
            if (C.file_hash(root + "/" + owners[path]) != C.digest(member.data)) throw "Conflicting Ooblerg package files: " + package + ": " + path
            paths.push(owners[path]); return
        }
        C.mkdir(GLib.path_get_dirname(destination)); C.write(destination, member.data)
        C.chmod(destination, member.mode & 73 ? 493 : 420)
        local data = member.data
        if (C.starts(data, "\x7fELF") && (data.len() < 20 || data.slice(4, 6) != "\x02\x01" || C.uint_le(data, 18, 2) != M.TARGETS[target]))
            throw "Wrong ELF architecture for " + target + ": " + path
        owners[path] <- path; paths.push(path)
    })
    while (links.len()) {
        local progressed = false
        foreach (path in C.keys(links)) {
            local destination = links[path]
            if (destination in links) continue
            if (paths.find(destination) == null) throw "Android archive link target is missing or outside this package: " + path
            if (path in owners) {
                if (C.file_hash(root + "/" + path) != C.file_hash(root + "/" + destination)) throw "Conflicting Android archive link: " + path
            } else { C.copy(root + "/" + destination, root + "/" + path); owners[path] <- path }
            if (paths.find(path) == null) paths.push(path)
            delete links[path]; progressed = true
        }
        if (!progressed) throw "Cyclic Android archive links"
    }
    return paths
}
M.prepare <- function(request, validate = null) {
    local repo = Repository(request.repository, request.cache, request.download, request.refresh, request.target), locked = C.get(request, "locked"), index = {}
    if (locked == null) index = repo.index().entries
    else foreach (item in locked) {
        if (item.repository != repo.url || item.target != repo.target) throw "Ooblerg lock repository or target does not match"
        local entry = M.validate_entry(item.metadata)
        if (item.sha256 != C.get(entry, "sha256")) throw "Ooblerg lock digest does not match metadata"
        if (entry.name in index) throw "Duplicate Ooblerg locked package: " + entry.name
        index[entry.name] <- entry
    }
    local runtime = M.closure(index, request.packages), seeds = clone request.build_packages
    seeds.extend(request.packages)
    local entries = M.closure(index, seeds), root = C.absolute(request.root)
    if (C.is_link(root) || (C.exists(root) && !C.is_file(root + "/" + M.MARKER))) throw "Refusing to replace a sysroot not owned by Ooblerg: " + root
    local staging = root + ".prepare-" + GLib.uuid_string_random(), prepared = [], owners = {}, result = null, error = null
    C.mkdir(staging)
    try {
        foreach (position, entry in entries) {
            local paths = []
            if (C.get(entry, "kind") != "meta") {
                local archive = repo.cache + "/packages/" + entry.sha256 + ".tar.gz"
                C.progress("fetching/verifying package " + entry.name + " (" + (position + 1) + "/" + entries.len() + ")")
                repo.fetch(entry.artifact, archive, entry.sha256)
                C.progress("extracting package " + entry.name)
                paths = M.extract(archive, staging, owners, entry.name, repo.target)
            }
            prepared.push({ repository = repo.url, target = repo.target, metadata = entry, sha256 = C.get(entry, "sha256"), files = paths })
        }
        local runtime_names = [], provided = {}, required = {}
        foreach (entry in runtime) runtime_names.push(entry.name)
        foreach (package in prepared) foreach (path in package.files) if (C.ends(path, ".pc")) {
            local name = GLib.path_get_basename(path); provided[name.slice(0, name.len() - 3)] <- true
            foreach (line in split(C.read(staging + "/" + path), "\n")) {
                if (C.starts(line, "Requires:") || C.starts(line, "Requires.private:"))
                    foreach (token in split(line.slice(line.find(":") + 1), " ,\t\r"))
                        if (regexp("^[A-Za-z_][A-Za-z0-9_.+\\-]*$").match(token)) required[token] <- true
                if (C.starts(line, "Libs.private:")) foreach (token in split(line, " \t\r"))
                    if (C.starts(token, "-l") && regexp("^[A-Za-z_][A-Za-z0-9_.+\\-]*$").match(token.slice(2))) required[token.slice(2)] <- true
            }
        }
        foreach (name in C.keys(required)) if (name in provided || ["m", "dl", "pthread"].find(name) != null) delete required[name]
        result = { packages = prepared, runtime_packages = runtime_names, required_modules = C.keys(required) }
        if (validate != null) validate(staging, result)
        C.atomic_json(staging + "/" + M.MARKER, result)
        local backup = root + ".previous-" + GLib.uuid_string_random(), had_previous = C.exists(root)
        if (had_previous) C.move(root, backup)
        try { C.move(staging, root) } catch (caught) { if (had_previous) C.move(backup, root); throw caught }
        if (had_previous) C.remove(backup)
    } catch (caught) { error = caught }
    C.remove(staging)
    if (error != null) throw error
    return result
}
return M
