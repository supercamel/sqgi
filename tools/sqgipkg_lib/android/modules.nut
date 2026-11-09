// Application packages belong to one immutable Android SDK generation.
local C = import("common.nut"), R = import("repository.nut"), E = import("elf.nut"), G = import("gir.nut")
local GLib = import("GLib"), Gio = import("Gio"), M = {}
M.compatibility <- function(sdk_base, sdk_id) {
    return { sdk_id = sdk_id, target = sdk_base.metadata.target, source_lock_sha256 = sdk_base.metadata.source_lock_sha256,
        producer_descriptor_sha256 = C.get(sdk_base.metadata, "producer_descriptor_sha256", sdk_base.sha256) }
}
M.validate_payload <- function(root, prepared, sdk_base, abi, readelf) {
    local files = {}, namespaces = clone sdk_base.metadata.namespaces
    foreach (package in prepared.packages) {
        local entry = package.metadata, module = entry.module, actual_files = clone package.files
        local runtime = C.get(C.get(C.get(module, "source"), "recipe"), "android_runtime_source")
        if (runtime != null && runtime != C.get(C.get(C.get(sdk_base.metadata, "runtime"), "source"), "sha256"))
            throw "Android module requires a different SQGI runtime source: " + entry.name
        C.sort_strings(actual_files)
        if (!C.equal(actual_files, C.keys(module.files))) throw "Android module archive inventory differs: " + entry.name
        foreach (name, expected in module.files) {
            if (name in files || name in sdk_base.metadata.files) throw "Android module conflicts with another module/base SDK file: " + name
            local path = root + "/" + R.relative_path(name, "usr")
            if (C.is_link(path) || !C.is_file(path) || C.file_hash(path) != C.get(expected, "sha256")) throw "Android module file hash differs: " + name
            local info = Gio.File.new_for_path(path).query_info("standard::size,unix::mode", Gio.FileQueryInfoFlags.nofollow_symlinks, null)
            if (("size" in expected && info.get_size() != expected.size) ||
                ("mode" in expected && (info.get_attribute_uint32("unix::mode") & 511) != expected.mode)) throw "Android module file size/mode differs: " + name
            files[name] <- expected
        }
        foreach (name, definition in module.namespaces) {
            if (name in namespaces || !(definition.typelib in module.files)) throw "Duplicate or unowned Android module namespace: " + name
            local path = root + "/usr/share/gir-1.0/" + name + ".gir"
            if (!C.is_file(path) || C.file_hash(path) != definition.gir_sha256) throw "Android module GIR hash differs: " + name
            local record = G.read(path), libraries = clone definition.libraries, includes = clone definition.includes
            record.libraries.sort(); record.includes.sort(); libraries.sort(); includes.sort()
            if (record.name != name || !C.equal(record.libraries, libraries) || !C.equal(record.includes, includes)) throw "Android module GIR identity/dependencies differ: " + name
            namespaces[name] <- definition
        }
        local libraries = [], names = [], expected_libraries = clone module.libraries
        foreach (name, unused in module.files) {
            if (C.starts(name, "usr/lib/") && C.ends(name, ".so")) libraries.push(GLib.path_get_basename(name))
            if (C.starts(name, "usr/lib/girepository-1.0/") && C.ends(name, ".typelib")) {
                local basename = GLib.path_get_basename(name); names.push(basename.slice(0, basename.len() - 8))
            }
        }
        libraries.sort(); names.sort(); expected_libraries.sort()
        if (!C.equal(libraries, expected_libraries) || !C.equal(names, C.keys(module.namespaces))) throw "Android module native exports differ: " + entry.name
    }
    local available = clone sdk_base.metadata.files
    foreach (name, record in files) available[name] <- record
    foreach (name, unused in files) {
        local path = root + "/" + name, elf = C.starts(C.read(path), "\x7fELF")
        if (!elf && C.starts(name, "usr/lib/") && GLib.path_get_basename(name).find(".so") != null) throw "Android module shared library is not ELF: " + name
        if (!elf) continue
        local record = E.inspect(path, abi, readelf)
        if (C.ends(name, ".so") && record.soname != GLib.path_get_basename(name)) throw "Android module SONAME mismatch: " + name
        foreach (dependency in record.needed) if (E.SYSTEM_LIBRARIES.find(dependency) == null && (dependency == "libz.so" || !("usr/lib/" + dependency in available)))
            throw "Missing/non-pinned Android module library: " + dependency
    }
    foreach (name, definition in namespaces) {
        foreach (dependency in definition.includes) if (!(dependency in namespaces)) throw "Incomplete Android module GI closure: " + name
        foreach (library in definition.libraries) if (library.find("/") != null || !("usr/lib/" + library in available)) throw "Missing Android module GI backing library: " + name
    }
}
M.resolve <- function(request, sdk_base, work, readelf) {
    local seed_set = {}
    foreach (project in request.native) if (C.get(project, "android_package", "") != "") seed_set[project.android_package] <- true
    local seeds = C.keys(seed_set)
    if (!seeds.len()) return null
    local release = C.get(request, "module_set", "applications-r1"), sdk_id = request.sdk_id, identifiers = clone seeds
    identifiers.extend([release, sdk_id])
    foreach (name in identifiers) if (!regexp("^[A-Za-z0-9][A-Za-z0-9+_.\\-]*$").match(name)) throw "Invalid Android module/package identifier"
    local target = sdk_base.metadata.target.triplet, origin = request.repository
    while (C.ends(origin, "/")) origin = origin.slice(0, origin.len() - 1)
    local url = origin + "/android/modules/" + sdk_id + "/" + release + "/" + target + "/v1"
    local repo = R.Repository(url, request.cache, !C.get(request, "offline", false), C.get(request, "refresh", false), target)
    local locked = C.get(request, "modules_lock"), checksum, index_path
    if (locked != null) {
        foreach (key, value in { repository = url, packages = seeds, target = target, release = release })
            if (!C.equal(C.get(locked, key), value)) throw "Android module lock differs: " + key
        checksum = C.get(locked, "sha256", "")
        if (!regexp("^[0-9a-f]{64}$").match(checksum)) throw "Invalid Android module catalog checksum"
        index_path = repo.cache + "/indexes/" + checksum + ".json"; repo.refresh = false
        repo.fetch("index.json", index_path, checksum)
    } else {
        repo.index(); local current = repo.cache + "/index.json"
        checksum = C.file_hash(current); index_path = repo.cache + "/indexes/" + checksum + ".json"
        C.atomic_bytes(index_path, C.read(current))
    }
    if (C.file_hash(index_path) != checksum) throw "Cached Android module catalog checksum mismatch"
    local index = sqgi.json.parse(C.read(index_path)), identity = M.compatibility(sdk_base, sdk_id)
    if (C.get(index, "schema") != 1 || C.get(index, "target") != target || C.get(index, "prefix") != "/usr" || C.get(index, "release") != release ||
        !C.equal(C.get(index, "android_module"), identity)) throw "Android module catalog is incompatible with selected SDK/ABI/NDK/baseline"
    local catalog = {}
    foreach (raw in index.packages) {
        local entry = R.validate_entry(raw)
        if (C.get(entry, "kind") == "meta" || !C.equal(C.get(entry, "android_module"), identity) || entry.name in catalog) throw "Mixed SDK or duplicate Android module package"
        if (typeof(C.get(C.get(entry, "module", {}), "files")) != "table" || !entry.module.files.len()) throw "Android module has no file inventory"
        catalog[entry.name] <- entry
    }
    R.closure(catalog, C.keys(catalog))
    local selection = R.closure(catalog, seeds)
    foreach (entry in selection) {
        local api = C.get(entry.module, "min_api")
        if (typeof(api) != "integer" || api < sdk_base.metadata.target.min_api || api > request.application.min_sdk)
            throw "Android module minimum API is missing or incompatible with application: " + entry.name
    }
    local pin = { repository = url, target = target, release = release, packages = seeds, sha256 = checksum }
    if (locked != null && !C.equal(locked, pin)) throw "Android module catalog differs from locked input"
    local root = work + "/module-packages", entries = []
    foreach (entry in selection) entries.push({ repository = url, target = target, metadata = entry, sha256 = entry.sha256 })
    local prepared = R.prepare({ repository = url, cache = request.cache, root = root, target = target,
        download = !C.get(request, "offline", false), refresh = false, packages = seeds, build_packages = [], locked = entries },
        function(directory, packages) { M.validate_payload(directory, packages, sdk_base, request.abi, readelf) })
    local packages = {}; foreach (package in prepared.packages) packages[package.metadata.name] <- package
    return { root = root, packages = packages, catalog = catalog, lock = pin }
}
return M
