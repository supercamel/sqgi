// C-EDIT-01: coverage is explicit; schema structure supplies editor types.
local GLib = import("GLib")
local D = import("document.nut")
local root = GLib.path_get_dirname(GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null)))
local metadata = sqgi.json.parse(D.read_file(root + "/catalog.json").text)
local schema = sqgi.json.parse(D.read_file(GLib.path_get_dirname(root) + "/sqgipkg.schema.json").text)
local sections = ["Application", "Files", "Targets", "Runtime/native code", "Appearance/installer", "Review", "Manifest"]
function resolve(spec) { return "$ref" in spec ? schema["$defs"][spec["$ref"].slice(8)] : spec }
function definition(spec) { return "$ref" in spec ? spec["$ref"].slice(8) : null }
function contains_definition(spec, name, depth = 0) {
    if (depth > 16) return false
    if (definition(spec) == name) return true
    spec = resolve(spec)
    if ("anyOf" in spec) foreach (part in spec.anyOf) if (contains_definition(part, name, depth + 1)) return true
    if ("items" in spec && contains_definition(spec.items, name, depth + 1)) return true
    if ("properties" in spec) foreach (_, part in spec.properties) if (contains_definition(part, name, depth + 1)) return true
    return false
}
function variants(spec) {
    spec = resolve(spec)
    local result = []
    if ("anyOf" in spec) foreach (child in spec.anyOf) foreach (part in variants(child)) result.push(part)
    else if ("type" in spec && typeof(spec.type) == "array") foreach (kind in spec.type) {
        local child = clone spec; child.type = kind; result.push(child)
    } else result.push(spec)
    return result
}
function kind(value) {
    local t = typeof(value)
    return t == "table" ? "object" : t == "bool" ? "boolean" : t == "float" ? "number" : t
}
function value_definition(spec, value) {
    if ("$ref" in spec) {
        foreach (part in variants(spec)) if ("type" in part && part.type == kind(value)) return definition(spec)
    }
    if ("anyOf" in spec) foreach (part in spec.anyOf) {
        local found = value_definition(part, value)
        if (found != null) return found
    }
    return null
}
function select(spec, value) {
    foreach (part in variants(spec)) if ("type" in part && (part.type == kind(value) || part.type == "number" && kind(value) == "integer")) return part
    return resolve(variants(spec)[0])
}
function initial(spec) {
    spec = resolve(variants(spec)[0])
    if ("enum" in spec) return spec.enum[0]
    local t = "type" in spec ? spec.type : "string"
    return t == "object" ? {} : t == "array" ? [] : t == "boolean" ? false : t == "integer" || t == "number" ? 0 : t == "null" ? null : ""
}
function info(def, key) {
    local id = def + "." + key
    return id in metadata.fields ? metadata.fields[id] : { label = key, help = key, common = true, section = "Application", alias = null }
}
function is_plugin_path(path) {
    return path.len() && (path.top() == "gstreamer_plugins" ||
        (typeof(path.top()) == "integer" && path.len() >= 2 && path[path.len() - 2] == "gstreamer_plugins"))
}
function is_input_path(path) {
    if (is_plugin_path(path)) return true
    if (!path.len() || typeof(path.top()) != "string") return false
    // Conservative: commands, destinations, names and arbitrary strings never get pickers.
    return ["path", "dir", "source", "desktop_icon", "icon", "entry", "script", "output", "build_dir", "sysroot", "license", "header_image", "welcome_image"].find(path.top()) != null
}
function path_schema(path) {
    local spec = { ["$ref"] = "#/$defs/manifest" }
    foreach (part in path) {
        local found = null
        foreach (candidate in variants(spec)) {
            candidate = resolve(candidate)
            if (typeof(part) == "integer" && "items" in candidate) found = candidate.items
            else if ("properties" in candidate && part in candidate.properties) found = candidate.properties[part]
            else if ("additionalProperties" in candidate && typeof(candidate.additionalProperties) == "table") found = candidate.additionalProperties
            if (found != null) break
        }
        spec = found == null ? {} : found
    }
    return spec
}
return { schema = schema, metadata = metadata, sections = sections, resolve = resolve, definition = definition, contains_definition = contains_definition,
    variants = variants, kind = kind, value_definition = value_definition, select = select, initial = initial, info = info, is_input_path = is_input_path, is_plugin_path = is_plugin_path, path_schema = path_schema }
