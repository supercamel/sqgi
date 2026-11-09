// C-EDIT-06: manifest authoring for explicit output sets; sqgipkg resolves/builds them.
local D = import("document.nut")
function defaults(capabilities) {
    local linux = capabilities.targets.find("appimage") != null
    return normalize({ x86_64 = linux, aarch64 = linux, windows = true, format = "installer" })
}
function normalize(selection) {
    local result = { android_x86_64 = false, android_arm64 = false, android_format = "apk" }
    foreach (key, value in selection) result[key] <- value
    return result
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
        local selected = normalize({ x86_64 = false, aarch64 = false, windows = false, format = "installer" })
        local platforms = "platforms" in value ? value.platforms : {}
        if (typeof(platforms) != "table") throw "Custom platform settings are preserved in Advanced."
        local linux = "linux" in platforms ? platforms.linux : {}, windows = "windows" in platforms ? platforms.windows : {}, android = "android" in platforms ? platforms.android : {}
        if (typeof(linux) != "table" || typeof(windows) != "table" || typeof(android) != "table") throw "Custom platform settings are preserved in Advanced."
        foreach (settings in [linux, windows, android]) if ("enabled" in settings && typeof(settings.enabled) != "bool") throw "Platform enabled settings must be booleans."
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
            local enabled = value.target != "all" || !("enabled" in linux) || linux.enabled
            if (enabled && (!("architectures" in linux) || typeof(linux.architectures) != "array" || !linux.architectures.len()))
                throw "The Linux architecture matrix is automatic or custom. Resolve the plan or edit its platform settings in Advanced."
            if (enabled) matrix = linux.architectures
            selected.windows = value.target == "all" && (!("enabled" in windows) || windows.enabled)
        } else if (value.target == "win-nsis" || value.target == "win-dir") {
            selected.windows = true; selected.format = value.target == "win-dir" ? "directory" : "installer"
        } else if (value.target != "android-apk" && value.target != "android-aab") throw "This target uses custom configuration. It is preserved in Advanced."
        local direct_android = value.target == "android-apk" || value.target == "android-aab"
        if ("format" in android) selected.android_format = android.format
        if (direct_android) selected.android_format = value.target == "android-aab" ? "aab" : "apk"
        if (["apk", "aab"].find(selected.android_format) == null) throw "Custom Android format is preserved in Advanced."
        if (direct_android || value.target == "all" && "android" in platforms && (!("enabled" in android) || android.enabled)) {
            local abis = "architectures" in android ? android.architectures : ["arm64-v8a"]
            if (typeof(abis) != "array" || !abis.len()) throw "Choose at least one Android ABI in Advanced."
            foreach (abi in abis) {
                if (abi == "arm64-v8a" || abi == "arm64" || abi == "aarch64") selected.android_arm64 = true
                else if (abi == "x86_64") selected.android_x86_64 = true
                else throw "An existing Android ABI is outside the common choices. It is preserved in Advanced."
            }
        }
        foreach (arch in matrix) {
            local key = canonical(arch)
            if (key != "x86_64" && key != "aarch64") throw "An existing architecture is outside the common choices. It is preserved in Advanced."
            selected[key] = true
        }
        return { selection = selected, reason = null }
    } catch (e) { return { selection = null, reason = e.tostring() } }
}
function write(value, selected, capabilities) {
    selected = normalize(selected)
    local linux = arches(selected)
    local android = []
    if (selected.android_arm64) android.push("arm64-v8a")
    if (selected.android_x86_64) android.push("x86_64")
    if (!linux.len() && !selected.windows && !android.len()) throw "Select at least one output."
    if (selected.format != "installer" && selected.format != "directory") throw "Choose Windows installer or folder."
    if (["apk", "aab"].find(selected.android_format) == null) throw "Choose Android APK or App Bundle."
    local target = linux.len() ? (selected.windows ? "all" : linux.len() > 1 ? "appimage-all" : "appimage") : (selected.format == "installer" ? "win-nsis" : "win-dir")
    if (android.len()) target = linux.len() || selected.windows ? "all" : "android-" + selected.android_format
    if (capabilities.targets.find(target) == null) throw "This sqgipkg host does not support the selected output set: " + target
    if (android.len() && capabilities.targets.find("android-" + selected.android_format) == null) throw "Android packaging requires a supported Linux build host."
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
        if (linux.len() && !same) next.platforms.linux.architectures <- linux
        if (selected.windows) {
            if (!("windows" in next.platforms)) next.platforms.windows <- {}
            if (typeof(next.platforms.windows) != "table") throw "Correct custom Windows settings in Advanced first."
            next.platforms.windows.format <- selected.format
        }
    }
    if (target == "all") foreach (platform in ["linux", "windows"]) {
        if (!(platform in next.platforms)) next.platforms[platform] <- {}
        local enabled = platform == "linux" ? linux.len() > 0 : selected.windows
        if (!enabled || "enabled" in next.platforms[platform]) next.platforms[platform].enabled <- enabled
    }
    if (android.len() || "platforms" in next && "android" in next.platforms) {
        if (!("platforms" in next)) next.platforms <- {}
        if (!("android" in next.platforms)) next.platforms.android <- {}
        local settings = next.platforms.android
        if (typeof(settings) != "table") throw "Correct custom Android settings in Advanced first."
        if (android.len()) { settings.architectures <- android; settings.format <- selected.android_format }
        settings.enabled <- android.len() > 0
    }
    return next
}
function summary(selected) {
    local lines = []
    if (selected.x86_64) lines.push("Linux AppImage — x86_64 (Intel / AMD 64-bit)")
    if (selected.aarch64) lines.push("Linux AppImage — aarch64 (ARM 64-bit)")
    if (selected.windows) lines.push(selected.format == "installer" ? "Windows NSIS installer — x86_64" : "Windows folder — x86_64")
    selected = normalize(selected)
    if (selected.android_arm64 || selected.android_x86_64) {
        local abis = selected.android_arm64 ? "arm64-v8a" : ""
        if (selected.android_x86_64) abis += (abis == "" ? "" : ", ") + "x86_64"
        lines.push((selected.android_format == "aab" ? "Android App Bundle — " : "Android APKs — ") + abis)
    }
    local text = ""
    foreach (line in lines) text += (text == "" ? "" : "\n") + line
    return text
}
return { defaults = defaults, read = read, write = write, arches = arches, summary = summary, normalize = normalize }
