// C-EDIT-06: manifest authoring for explicit output sets; sqgipkg resolves/builds them.
local D = import("document.nut")
function defaults(capabilities) {
    local linux = capabilities.targets.find("appimage") != null
    return { x86_64 = linux, aarch64 = linux, windows = true, format = "installer" }
}
function arches(selection) {
    local result = []
    foreach (arch in ["x86_64", "aarch64"]) if (selection[arch]) result.push(arch)
    return result
}
function canonical(arch) {
    if (arch == "arm64") return "aarch64"
    if (arch == "amd64" || arch == "x64") return "x86_64"
    return arch
}
function read(value) {
    try {
        if (!("target" in value)) throw "The package target is automatic. Resolve the plan to see the effective outputs, or configure it in Advanced."
        local selected = { x86_64 = false, aarch64 = false, windows = false, format = "installer" }
        local platforms = "platforms" in value ? value.platforms : {}
        if (typeof(platforms) != "table") throw "Custom platform settings are preserved in Advanced."
        local linux = "linux" in platforms ? platforms.linux : {}, windows = "windows" in platforms ? platforms.windows : {}
        if (typeof(linux) != "table" || typeof(windows) != "table") throw "Custom platform settings are preserved in Advanced."
        if ("linux_arches" in value || "linux" in value && (typeof(value.linux) != "table" || "arches" in value.linux))
            throw "This manifest uses legacy architecture lists or build overrides. Use Advanced to change its output matrix without losing those recipes."
        if ("format" in windows) selected.format = windows.format
        if (selected.format != "installer" && selected.format != "directory") throw "Custom Windows format is preserved in Advanced."
        local matrix = []
        if (value.target == "appimage") {
            if (!("appimage_arch" in value) || value.appimage_arch == null || value.appimage_arch == "")
                throw "AppImage architecture is automatic. Resolve the plan to see it, or set appimage_arch in Advanced."
            matrix = [value.appimage_arch]
        } else if (value.target == "all" || value.target == "appimage-all") {
            if (!("architectures" in linux) || typeof(linux.architectures) != "array" || !linux.architectures.len())
                throw "The Linux architecture matrix is automatic or custom. Resolve the plan or edit its platform settings in Advanced."
            matrix = linux.architectures
            selected.windows = value.target == "all"
        } else if (value.target == "win-nsis" || value.target == "win-dir") {
            selected.windows = true; selected.format = value.target == "win-dir" ? "directory" : "installer"
        } else throw "This target uses custom configuration. It is preserved in Advanced."
        foreach (arch in matrix) {
            local key = canonical(arch)
            if (key != "x86_64" && key != "aarch64") throw "An existing architecture is outside the common choices. It is preserved in Advanced."
            selected[key] = true
        }
        return { selection = selected, reason = null }
    } catch (e) { return { selection = null, reason = e.tostring() } }
}
function write(value, selected, capabilities) {
    local linux = arches(selected)
    if (!linux.len() && !selected.windows) throw "Select at least one output."
    if (selected.format != "installer" && selected.format != "directory") throw "Choose Windows installer or folder."
    local target = linux.len() ? (selected.windows ? "all" : linux.len() > 1 ? "appimage-all" : "appimage") : (selected.format == "installer" ? "win-nsis" : "win-dir")
    if (capabilities.targets.find(target) == null) throw "This sqgipkg host does not support the selected output set: " + target
    local existing = read(value)
    if (existing.selection != null && D.pretty(existing.selection) == D.pretty(selected)) return D.copy_value(value)
    // Callers only offer these controls for representable existing documents or a new template.
    if ("target" in value && existing.selection == null) throw existing.reason
    local next = D.copy_value(value); next.target <- target
    if (target == "appimage") next.appimage_arch <- linux[0]
    if (target == "all" || target == "appimage-all") {
        if (!("platforms" in next)) next.platforms <- {}
        if (typeof(next.platforms) != "table") throw "Correct custom platform settings in Advanced first."
        if (!("linux" in next.platforms)) next.platforms.linux <- {}
        if (typeof(next.platforms.linux) != "table") throw "Correct custom Linux settings in Advanced first."
        // Retain alias spellings when the existing matrix already means this selection.
        local same = "architectures" in next.platforms.linux && typeof(next.platforms.linux.architectures) == "array" && next.platforms.linux.architectures.len() == linux.len()
        if (same) foreach (arch in next.platforms.linux.architectures) if (linux.find(canonical(arch)) == null) same = false
        if (!same) next.platforms.linux.architectures <- linux
        if (selected.windows) {
            if (!("windows" in next.platforms)) next.platforms.windows <- {}
            if (typeof(next.platforms.windows) != "table") throw "Correct custom Windows settings in Advanced first."
            next.platforms.windows.format <- selected.format
        }
    }
    return next
}
function summary(selected) {
    local lines = []
    if (selected.x86_64) lines.push("Linux AppImage — x86_64 (Intel / AMD 64-bit)")
    if (selected.aarch64) lines.push("Linux AppImage — aarch64 (ARM 64-bit)")
    if (selected.windows) lines.push(selected.format == "installer" ? "Windows NSIS installer — x86_64" : "Windows folder — x86_64")
    local text = ""
    foreach (line in lines) text += (text == "" ? "" : "\n") + line
    return text
}
return { defaults = defaults, read = read, write = write, arches = arches, summary = summary }
