// C-EDIT-06: preserve recipe overrides while editing common library fields.
local D = import("document.nut")
local GLib = import("GLib")
function application_recipe(value, recipe) {
    return "entry" in value && typeof(value.entry) == "table" &&
        "project" in value.entry && "name" in recipe && recipe.name == value.entry.project
}
local function pinned_commit(value) {
    if (typeof(value) != "string" || (value.len() != 40 && value.len() != 64)) return false
    foreach (ch in value.tolower()) if ("0123456789abcdef".find(ch.tochar()) == null) return false
    return true
}
function read(recipe) {
    if (typeof(recipe) != "table" || !("build_system" in recipe) || ["meson", "cmake"].find(recipe.build_system) == null) return null
    foreach (key in ["git", "tag", "branch", "commit"]) if (key in recipe) return null
    local remote = "repo" in recipe
    if (remote && (!("name" in recipe) || typeof(recipe.name) != "string" || recipe.name == "")) return null
    if (remote && (typeof(recipe.repo) != "string" || !("ref" in recipe) || !pinned_commit(recipe.ref))) return null
    if (!remote && ("ref" in recipe || !("dir" in recipe))) return null
    if ("dir" in recipe && typeof(recipe.dir) != "string") return null
    if ("name" in recipe && typeof(recipe.name) != "string") return null
    if ("windows_package" in recipe && typeof(recipe.windows_package) != "string") return null
    if ("linux_package" in recipe && typeof(recipe.linux_package) != "string") return null
    local gi = "gi" in recipe ? recipe.gi : null
    if (gi != null) {
        if (typeof(gi) != "table" || recipe.build_system != "meson") return null
        foreach (key in ["strategy", "namespace", "version", "library"])
            if (!(key in gi) || typeof(gi[key]) != "string") return null
        if (gi.strategy != "host" || gi.len() != 4) return null
    }
    return { linux_package = "linux_package" in recipe ? recipe.linux_package : "", windows_package = "windows_package" in recipe ? recipe.windows_package : "", name = "name" in recipe ? recipe.name : "", source = remote ? "git" : "local", repo = remote ? recipe.repo : "", ref = remote ? recipe.ref : "", dir = "dir" in recipe ? recipe.dir : "", build_system = recipe.build_system,
        introspection = gi != null, ns = gi == null ? "" : gi.namespace,
        version = gi == null ? "" : gi.version, library = gi == null ? "" : gi.library }
}
function effective_name(recipe) {
    return "name" in recipe ? recipe.name : ("dir" in recipe ? GLib.path_get_basename(recipe.dir) : "")
}
function write(value, index, fields) {
    if ("native" in value && typeof(value.native) != "array") throw "Custom native configuration is available in Advanced."
    local recipes = "native" in value ? value.native : []
    if (index != null && (index < 0 || index >= recipes.len() || read(recipes[index]) == null || application_recipe(value, recipes[index])))
        throw "This recipe needs its existing Application or Advanced editor."
    local remote = "source" in fields && fields.source == "git"
    if ((!remote && strip(fields.dir) == "") || (index == null && strip(fields.name) == "")) throw "Enter a library name and source folder."
    if (remote && strip(fields.name) == "") throw "Enter a library name for the managed Git checkout."
    if (remote && (!("repo" in fields) || strip(fields.repo) == "" || !("ref" in fields) || !pinned_commit(fields.ref)))
        throw "Enter a Git repository and its full commit hash (40 or 64 hexadecimal characters)."
    if (["meson", "cmake"].find(fields.build_system) == null) throw "Choose Meson or CMake."
    if (fields.name != "" && (fields.name == "." || fields.name == ".." || fields.name == "sqgi" || fields.name.find("/") != null || fields.name.find("\\") != null))
        throw "Use a library name without directory separators, other than the reserved name sqgi."
    if (fields.introspection) {
        if (fields.build_system != "meson") throw "Cross-platform GObject metadata currently needs a Meson project."
        if (strip(fields.ns) == "" || strip(fields.version) == "" || strip(fields.library) == "")
            throw "Enter the GObject namespace, API version and Meson library target."
    }
    local next = D.copy_value(value), recipe = index == null ? {} : next.native[index]
    if (fields.name != "") recipe.name <- fields.name
    else if ("name" in recipe) delete recipe.name
    if ("linux_package" in fields) {
        if (fields.linux_package != "") recipe.linux_package <- fields.linux_package
        else if ("linux_package" in recipe) delete recipe.linux_package
    }
    if ("windows_package" in fields) {
        if (fields.windows_package != "") recipe.windows_package <- fields.windows_package
        else if ("windows_package" in recipe) delete recipe.windows_package
    }
    if (remote) { recipe.repo <- strip(fields.repo); recipe.ref <- fields.ref }
    else { if ("repo" in recipe) delete recipe.repo; if ("ref" in recipe) delete recipe.ref }
    if (remote && fields.dir == "") { if ("dir" in recipe) delete recipe.dir }
    else recipe.dir <- fields.dir
    recipe.build_system <- fields.build_system
    if (fields.introspection) recipe.gi <- { strategy = "host", namespace = fields.ns, version = fields.version, library = fields.library }
    else if ("gi" in recipe && recipe.gi != null) delete recipe.gi
    local name = effective_name(recipe).tolower()
    foreach (i, other in recipes) {
        if (i == index || typeof(other) != "table") continue
        local other_name = effective_name(other).tolower()
        if (name == other_name || (fields.introspection && name + "-gi-host" == other_name) ||
            ("gi" in other && other.gi != null && other_name + "-gi-host" == name))
            throw "Choose a unique library name; it conflicts with another recipe or its host metadata build."
    }
    if (index == null) {
        if (!("native" in next)) next.native <- []
        local position = next.native.len()
        foreach (i, other in next.native) if (typeof(other) == "table" && application_recipe(next, other)) { position = i; break }
        next.native.insert(position, recipe)
    }
    return next
}
function remove(value, index) {
    if (!("native" in value) || typeof(value.native) != "array" || index < 0 || index >= value.native.len() ||
        read(value.native[index]) == null || application_recipe(value, value.native[index]))
        throw "This recipe cannot be removed as a native library."
    local next = D.copy_value(value); next.native.remove(index); return next
}
return { read = read, write = write, remove = remove, application_recipe = application_recipe, effective_name = effective_name }
