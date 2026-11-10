// Ordered native recipes share one private target SDK.
local C = import("common.nut"), S = import("sdk.nut"), R = import("repository.nut")
local Packages = import("modules.nut"), Exports = import("exports.nut"), GIR = import("gir.nut")
local Source = import("source.nut"), Inspection = import("inspection.nut"), GLib = import("GLib")
local M = {}
local Environment = import("environment.nut")
M.ordered <- function(projects) {
    local names = {}, result = [], state = {}, visit = null
    foreach (project in projects) {
        local name = project.name
        if (!regexp("^[A-Za-z0-9_][A-Za-z0-9_.+\\-]*$").match(name) || name in names || name == "sqgi") throw "Invalid or duplicate native recipe name: " + name
        names[name] <- project
    }
    visit = function(name) {
        if (!(name in names)) throw "Unknown native recipe dependency: " + name
        if (C.get(state, name) == "visiting") throw "Native recipe dependency cycle: " + name
        if (C.get(state, name) == "done") return
        state[name] <- "visiting"
        foreach (dependency in C.get(names[name], "depends_on", [])) visit(dependency)
        result.push(names[name]); state[name] = "done"
    }
    foreach (project in projects) visit(project.name)
    return result
}
M.build <- function(request, sdk_base, work, tools) {
    request = clone request
    if (C.get(request, "adb", "") == "") request.adb <- Environment.adb()
    local authored = C.get(request, "native", []), recipes = [], selected = {}
    foreach (recipe in authored) if (C.get(recipe, "android_package", "") != "") selected[recipe.android_package] <- true
    foreach (package in C.get(request, "module_packages", [])) if (!(package in selected))
        recipes.push({ name = "ooblerg-" + package, android_package = package, gi = null, depends_on = [], stage = true })
    recipes.extend(authored)
    local projects = M.ordered(recipes)
    request.native <- projects
    if (!projects.len()) return { sdk = sdk_base, libraries = [], namespaces = [], evidence = {} }
    foreach (project in projects) {
        if (C.get(project, "files", []).len()) throw "Android native files rules are not yet supported; install SDK exports under /usr and use application files for assets: " + project.name
        if (C.get(C.get(project, "gi"), "strategy") == "host") throw "Android requires gi.strategy auto or target; host metadata is not portable: " + project.name
    }
    local modules = Packages.resolve(request, sdk_base, work, tools.readelf)
    local sources = []; foreach (project in projects) if (C.get(project, "android_package", "") == "") sources.push(project)
    if (sources.len() && strip(C.process(["/usr/bin/g-ir-scanner", "--version"], Source.clean_environment())) != "g-ir-scanner 1.80.1")
        throw "Android native metadata requires pinned host g-ir-scanner 1.80.1"
    local runner = C.get(request, "runner", "auto")
    if (["auto", "qemu", "adb"].find(runner) == null) throw "Android GI runner must be auto, qemu or adb"
    local runner_metadata = { method = "prebuilt", abi = request.abi }, inspection = null
    if (sources.len()) {
        if (runner != "adb") {
            inspection = Inspection.Inspection(request.abi, C.get(request, "inspection_root"))
            if (C.get(request, "inspection_root", "") != "") inspection.validate()
            else inspection.prepare(C.get(request, "offline", false))
            runner_metadata = { method = "qemu-user", abi = request.abi, manifest_sha256 = C.file_hash(inspection.manifest), inputs = inspection.identity }
        } else {
            local adb = [C.get(request, "adb", "adb")]
            if (C.get(request, "serial", "") != "") adb.extend(["-s", request.serial])
            runner_metadata = { method = "adb", abi = request.abi, properties = {} }
            foreach (key in ["ro.build.fingerprint", "ro.product.cpu.abilist", "ro.dalvik.vm.native.bridge"]) {
                local command = clone adb; command.extend(["shell", "getprop", key])
                runner_metadata.properties[key] <- strip(C.process(command))
            }
            if (split(runner_metadata.properties["ro.product.cpu.abilist"], ",")[0] != request.abi) throw "ADB GI probes require the device native ABI; use qemu for " + request.abi
        }
    }
    local inspection_sha256 = C.digest(C.encoded(runner_metadata))
    if (C.get(request, "inspection_sha256", "") != "" && request.inspection_sha256 != inspection_sha256) throw "Android inspection runtime differs from the locked input"
    local root = work + "/native-sdk"
    Exports.initialize(sdk_base.root, root)
    if (sources.len() && !C.is_file(root + "/usr/bin/g-ir-compiler")) throw "Android native recipes require the SDK tools profile"
    local shims = sources.len() ? Source.shims(work) : null
    local results = [], libraries = [], namespaces = [], exported = {}
    foreach (project in projects) {
        if (C.get(project, "android_package", "") == "") {
            local result = Source.build(project, request, sdk_base, root, work, tools, inspection, shims)
            if (C.get(project, "stage", true)) { libraries.extend(result.libraries); namespaces.extend(result.namespaces) }
            results.push(result); continue
        }
        local name = project.name, package = project.android_package, selected = modules.packages[package].metadata.module
        foreach (entry in R.closure(modules.catalog, [package])) {
            if (entry.name in exported) continue
            exported[entry.name] <- true
            local installed = {}
            foreach (path, unused in entry.module.files) installed[modules.root + "/" + path] <- "/" + path
            Exports.export_files(root, entry.name == package ? name : "ooblerg:" + entry.name, installed)
        }
        local gi = C.get(project, "gi")
        if (gi != null && !(gi.namespace + "-" + gi.version in selected.namespaces)) throw "Prebuilt Android package lacks the declared namespace: " + name
        if (C.get(project, "stage", true)) foreach (dependency in R.closure(modules.catalog, [package])) {
            // Authored runtime dependencies can include dynamically loaded GIO
            // modules which are absent from the selected library's DT_NEEDED.
            libraries.extend(dependency.module.libraries)
            namespaces.extend(C.keys(dependency.module.namespaces))
        }
        results.push({ name = name, build_system = "package", package = package, min_api = selected.min_api,
            depends_on = C.get(project, "depends_on", []), source = selected.source, libraries = selected.libraries, namespaces = C.keys(selected.namespaces) })
    }
    local metadata = clone sdk_base.metadata, files = {}
    foreach (name, record in Exports.inventory(root + "/usr")) files["usr/" + name] <- record
    metadata.base_sdk_sha256 <- sdk_base.sha256; metadata.native <- results; metadata.files <- files
    metadata.namespaces <- GIR.catalog(root + "/usr", sdk_base.metadata.namespaces)
    C.atomic_json(root + "/" + S.DESCRIPTOR, metadata)
    local composed = S.SDK(root, request.abi, request.application.min_sdk).validate()
    return { sdk = composed, libraries = libraries, namespaces = namespaces,
        evidence = { projects = results, base_sdk_sha256 = sdk_base.sha256, sdk_sha256 = composed.sha256,
            runner = runner_metadata, inspection_sha256 = inspection_sha256, modules_lock = modules == null ? null : modules.lock } }
}
return M
