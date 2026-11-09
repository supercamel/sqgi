// Parse GIR identities with the native libxml2 tool; orchestration stays in SQGI.
local C = import("common.nut"), GLib = import("GLib"), E = import("environment.nut")
local M = { CORE = "http://www.gtk.org/introspection/core/1.0" }
M.read <- function(path) {
    local program = E.xmllint()
    if (program == null || !C.is_file(program)) throw "Android native metadata requires libxml2-utils (xmllint); run sqgipkg setup --platform android --check"
    local element = function(name) { return "*[local-name()='" + name + "' and namespace-uri()='" + M.CORE + "']" }
    local root = "/" + element("repository"), namespace = root + "/" + element("namespace"), includes = root + "/" + element("include")
    local query = function(expression) { return C.process([program, "--nonet", "--xpath", expression, C.absolute(path)]) }
    local line = function(parts) { return "concat(" + C.concat(parts, ", '\n', ") + ", '\n')" }
    local values = split(strip(query(line(["count(" + namespace + ")", namespace + "/@name", namespace + "/@version",
        "count(" + includes + ")"]))), "\n")
    if (values.len() != 4 || values[0] != "1") throw "Android GIR must contain exactly one namespace: " + path
    local identity = function(name, version) {
        if (!regexp("^[A-Za-z_][A-Za-z0-9_]*$").match(name) || !regexp("^[0-9]+(\\.[0-9]+)*$").match(version))
            throw "Invalid Android GIR identity: " + path
        return name + "-" + version
    }
    local record = { name = identity(values[1], values[2]), includes = [], libraries = [] }
    local libraries = strip(query("string(" + namespace + "/@shared-library)"))
    if (libraries != "") record.libraries = split(libraries, ",")
    for (local i = 1; i <= values[3].tointeger(); i++) {
        local node = includes + "[" + i + "]", item = split(strip(query(line([node + "/@name", node + "/@version"]))), "\n")
        if (item.len() != 2) throw "Invalid Android GIR include: " + path
        record.includes.push(identity(item[0], item[1]))
    }
    return record
}
M.catalog <- function(prefix, trusted = null) {
    local result = {}
    foreach (item in C.children(prefix + "/lib/girepository-1.0")) {
        if (item.directory || !C.ends(item.name, ".typelib")) continue
        local name = item.name.slice(0, item.name.len() - 8), path = prefix + "/share/gir-1.0/" + name + ".gir", checksum = C.file_hash(path)
        if (trusted != null && name in trusted && C.get(trusted[name], "gir_sha256") == checksum) result[name] <- trusted[name]
        else {
            local record = M.read(path)
            if (record.name != name) throw "Native GIR/typelib identity mismatch: " + path
            result[name] <- { includes = record.includes, libraries = record.libraries,
                typelib = "usr/lib/girepository-1.0/" + item.name, gir_sha256 = checksum }
        }
    }
    foreach (name, record in result) {
        foreach (dependency in record.includes) if (!(dependency in result)) throw "Incomplete native GI dependencies: " + name
        foreach (library in record.libraries) if (library.find("/") != null || !C.ends(library, ".so") || !C.is_file(prefix + "/lib/" + library))
            throw "Invalid/missing Android GI backing library: " + name + ": " + library
    }
    return result
}
return M
