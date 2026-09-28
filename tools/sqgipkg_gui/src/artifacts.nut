// C-JOB-03: validate CLI result metadata and existing outputs, not runtime behavior.
local GLib = import("GLib")
local Gio = import("Gio")
function inspect_output(item) {
    local formats = { appimage = ["appimage", "Linux AppImage"],
        ["windows-directory"] = ["win-dir", "Windows folder"],
        ["nsis-installer"] = ["win-nsis", "Windows installer"],
        ["nsis-script"] = ["win-nsis", "NSIS script — not an installer"] }
    if (typeof(item) != "table") throw "Invalid output record"
    foreach (key in ["kind", "target", "architecture", "path"])
        if (!(key in item) || typeof(item[key]) != "string") throw "Invalid output " + key
    if (!(item.kind in formats) || item.target != formats[item.kind][0]) throw "Unknown output format"
    if (["x86_64", "aarch64"].find(item.architecture) == null || item.target != "appimage" && item.architecture != "x86_64")
        throw "Unknown output architecture"
    if (!GLib.path_is_absolute(item.path) || !("size" in item)) throw "Invalid output path or size"
    local file = Gio.File.new_for_path(item.path)
    local info = file.query_info("standard::type,standard::size", Gio.FileQueryInfoFlags.nofollow_symlinks, null)
    if (item.kind == "windows-directory") {
        if (item.size != null || info.get_file_type() != Gio.FileType.directory) throw "Output folder is missing"
        local children = file.enumerate_children("standard::name", Gio.FileQueryInfoFlags.none, null)
        local first = children.next_file(null); children.close(null)
        if (first == null) throw "Output folder is empty"
    } else if (typeof(item.size) != "integer" || item.size <= 0 || info.get_file_type() != Gio.FileType.regular || info.get_size() != item.size)
        throw "Output file is missing or its size changed: " + item.path
    local result = clone item
    result.label <- formats[item.kind][1] + " · " + item.architecture
    result.folder <- item.kind == "windows-directory" ? item.path : GLib.path_get_dirname(item.path)
    return result
}
function read_result(path, digest) {
    local file = Gio.File.new_for_path(path)
    if (file.query_info("standard::size", Gio.FileQueryInfoFlags.none, null).get_size() > 1048576) throw "Build result is too large"
    local result = sqgi.json.parse(file.load_contents(null)[0])
    if (typeof(result) != "table" || !("protocol_version" in result) || result.protocol_version != 1 ||
        !("status" in result) || ["running", "succeeded", "failed"].find(result.status) == null ||
        !("manifest_sha256" in result) || result.manifest_sha256 != digest ||
        !("expected_outputs" in result) || typeof(result.expected_outputs) != "integer" || result.expected_outputs <= 0 ||
        !("artifacts" in result) || typeof(result.artifacts) != "array") throw "Invalid or mismatched build result"
    if (result.artifacts.len() > result.expected_outputs) throw "Unexpected extra outputs"
    local outputs = [], paths = {}
    foreach (item in result.artifacts) {
        local output = inspect_output(item)
        if (output.path in paths) throw "Duplicate output path"
        paths[output.path] <- true; outputs.push(output)
    }
    return { outputs = outputs, complete = result.status == "succeeded" && outputs.len() == result.expected_outputs }
}
// A quiet producer can report progress without writing stdout. Do not inspect
// artifact files here: final result verification owns that separate decision.
local function read_progress(path, digest) {
    local file = Gio.File.new_for_path(path)
    if (file.query_info("standard::size", Gio.FileQueryInfoFlags.none, null).get_size() > 1048576) throw "Progress report is too large"
    local value = sqgi.json.parse(file.load_contents(null)[0])
    if (typeof(value) != "table" || !("protocol_version" in value) || value.protocol_version != 1 ||
        !("manifest_sha256" in value) || value.manifest_sha256 != digest || !("status" in value) || value.status != "running" ||
        !("expected_outputs" in value) || typeof(value.expected_outputs) != "integer" || value.expected_outputs <= 0 || !("progress" in value)) return null
    local p = value.progress, phases = { preparing = "Preparing dependencies", building = "Building application and libraries",
        collecting = "Collecting package files", packaging = "Creating package", verifying = "Checking output", complete = "Output ready" },
        targets = { appimage = "Linux AppImage", ["win-dir"] = "Windows folder", ["win-nsis"] = "Windows installer" }
    if (typeof(p) != "table") return null
    foreach (key in ["phase", "target", "architecture"]) if (!(key in p) || typeof(p[key]) != "string") return null
    if (!(p.phase in phases) || !(p.target in targets) || ["x86_64", "aarch64"].find(p.architecture) == null ||
        p.target != "appimage" && p.architecture != "x86_64" || !("completed" in p) || typeof(p.completed) != "integer" ||
        p.completed < 0 || p.completed > value.expected_outputs || p.phase == "complete" && p.completed == 0 ||
        p.phase != "complete" && p.completed == value.expected_outputs) return null
    local ordinal = p.completed + (p.phase == "complete" ? 0 : 1)
    return "Output " + ordinal + " of " + value.expected_outputs + " — " + targets[p.target] + " · " + p.architecture + " — " + phases[p.phase]
}
return { read_result = read_result, inspect_output = inspect_output, read_progress = read_progress }
