// C-EDIT-02/06: edit one declared application recipe without resolving builds.
local D = import("document.nut")
function read(value) {
    if (!("entry" in value) || typeof(value.entry) != "table") return null
    local entry = value.entry
    if (!("type" in entry) || entry.type != "native" || "script" in value) return null
    foreach (key in ["project", "executable"])
        if (!(key in entry) || typeof(entry[key]) != "string") return null
    foreach (key in ["path", "linux", "windows", "script"]) if (key in entry) return null
    if (!("native" in value) || typeof(value.native) != "array") return null
    local index = null
    foreach (i, recipe in value.native) {
        if (typeof(recipe) != "table" || !("name" in recipe) || recipe.name != entry.project) continue
        if (index != null || !("dir" in recipe) || typeof(recipe.dir) != "string" ||
                !("build_system" in recipe) || ["meson", "cmake"].find(recipe.build_system) == null) return null
        index = i
    }
    if (index == null) return null
    return { index = index, executable = entry.executable, dir = value.native[index].dir,
        build_system = value.native[index].build_system, project = entry.project }
}
function write(value, executable, directory, build_system) {
    local current = read(value)
    if (current == null) throw "This native application uses custom entry paths or recipes. Edit its configuration in Advanced."
    if (executable == "" || directory == "") throw "Enter the built executable name and source directory."
    if (["meson", "cmake"].find(build_system) == null) throw "Choose Meson or CMake."
    local normalized = ""
    foreach (ch in executable) normalized += ch == 92 ? "/" : ch.tochar()
    if (normalized.slice(0, 1) == "/" || normalized.find(":") != null ||
            normalized == "." || ("/" + normalized + "/").find("/../") != null)
        throw "Enter an executable relative to the build directory, such as verminal or src/verminal."
    local next = D.copy_value(value)
    next.entry.executable = executable
    next.native[current.index].dir = directory
    next.native[current.index].build_system = build_system
    return next
}
return { read = read, write = write }
