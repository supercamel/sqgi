// Common Android settings; the CLI owns SDK resolution and compatibility checks.
local W = import("widgets.nut"), D = import("document.nut")
local defaults = { min_sdk = 31, version_code = 1, version_name = "0.1.0", sdk = "noble-android-r4",
    repository = "https://ooblerg.xyz", module_set = "", namespaces = ["Gtk-4.0"], variant = "debug", runtime = "auto",
    permissions = [], icon = "", packages = [], profile = "auto" }
local function read(value) {
    local settings = "platforms" in value && "android" in value.platforms ? value.platforms.android : {}
    local result = clone defaults
    foreach (key, setting in settings) result[key] <- setting
    return result
}
local function write(value, fields) {
    local next = D.copy_value(value)
    if (!("platforms" in next)) next.platforms <- {}
    if (!("android" in next.platforms)) next.platforms.android <- {}
    local settings = next.platforms.android
    foreach (key, setting in fields) {
        if (key == "runtime") {
            if (["auto", "package", "source"].find(setting) == null) throw "Choose automatic, package or source runtime"
            if (setting == "auto") { if ("runtime" in settings) delete settings.runtime }
            else settings.runtime <- setting
            continue
        }
        if (key == "min_sdk" || key == "version_code") {
            if (!regexp("^[0-9]+$").match(setting)) throw key + " must be a positive integer"
            setting = setting.tointeger()
            if (key == "min_sdk" ? setting < 31 : setting < 1 || setting > 2100000000) throw "Invalid " + key
        } else if (key == "packages") {
            setting = split(setting, ", \t\n", true)
            local seen = {}
            foreach (name in setting) {
                if (!regexp("^[a-z0-9][a-z0-9+.\\-]*$").match(name)) throw "Invalid Android package name"
                if (name in seen) throw "Duplicate Android package: " + name
                seen[name] <- true
            }
        } else if (key == "profile") {
            if (["auto", "runtime", "sdk", "tools", "complete"].find(setting) == null) throw "Choose a supported Android SDK profile"
        } else if (key == "permissions") {
            setting = split(setting, ", \t\n", true)
            local seen = {}
            foreach (name in setting) {
                if (!regexp("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$").match(name)) throw "Use fully qualified Android permission names"
                if (name in seen) throw "Duplicate Android permission: " + name
                seen[name] <- true
            }
        } else if ((key == "icon" || key == "module_set") && strip(setting) == "") {
            if ("icon" in settings) delete settings.icon
            continue
        } else if (key == "namespaces") {
            setting = split(setting, ", \t\n", true)
            if (!setting.len()) throw "Declare at least one GI namespace"
            foreach (name in setting) if (!regexp("^[A-Za-z_][A-Za-z0-9_]*-[0-9]+(\\.[0-9]+)*$").match(name)) throw "Use namespace-version, for example Gtk-4.0"
        } else if (strip(setting) == "") throw key + " cannot be empty"
        if (!(key in defaults)) throw "Unsupported Android setting: " + key
        settings[key] <- setting
    }
    return next
}
local function render(editor) {
    local value = editor.document.get([])
    if (!("platforms" in value) || typeof(value.platforms) != "table" || !("android" in value.platforms) || typeof(value.platforms.android) != "table") return
    local settings = read(value), controls = {}, body = W.box(), supported = true
    foreach (key, initial in defaults) if (typeof(settings[key]) != typeof(initial)) supported = false
    if (typeof(settings.namespaces) == "array") foreach (name in settings.namespaces) if (typeof(name) != "string") supported = false
    if (typeof(settings.permissions) == "array") foreach (name in settings.permissions) if (typeof(name) != "string") supported = false
    if (typeof(settings.packages) == "array") foreach (name in settings.packages) if (typeof(name) != "string") supported = false
    if (["auto", "runtime", "sdk", "tools", "complete"].find(settings.profile) == null) supported = false
    if (["debug", "release"].find(settings.variant) == null) supported = false
    if (["auto", "package", "source"].find(settings.runtime) == null) supported = false
    if (!supported) {
        body.append(W.label("Android settings contain custom or invalid values. Use Advanced to review them without changing their types."))
        body.append(W.button("Edit Android settings…", function() { editor.fields.edit(["platforms", "android"]) }))
        editor.content.append(body); return
    }
    body.append(W.heading("Android application and SDK"))
    body.append(W.label("Application ID is shared with desktop in Application. API 31 is the minimum for this pinned GTK stack. Signing credentials come from your build environment."))
    foreach (item in [["min_sdk", "Minimum Android API"], ["version_code", "Version code"], ["version_name", "Version name"],
                     ["sdk", "Pinned SDK release"], ["repository", "Ooblerg repository"], ["namespaces", "GI namespaces (comma-separated)"],
                     ["packages", "Android packages (comma-separated)"],
                     ["permissions", "Additional permissions (comma-separated)"], ["icon", "Android icon image (blank uses the shared icon)"]]) {
        local key = item[0], text = settings[key].tostring()
        if (key == "namespaces" || key == "permissions" || key == "packages") { text = ""; foreach (name in settings[key]) text += (text == "" ? "" : ", ") + name }
        local input = W.entry(text), label = W.label(item[1]); label.set_mnemonic_widget(input)
        body.append(label); body.append(input); controls[key] <- input; editor.widgets["android." + key] <- input
    }
    local variant = W.dropdown(["Debug — source updates enabled", "Release — external signing required"])
    variant.set_selected(settings.variant == "release" ? 1 : 0); body.append(W.label("Build variant")); body.append(variant)
    editor.widgets["android.variant"] <- variant
    local profile_values = ["auto", "runtime", "sdk", "tools", "complete"]
    local profile = W.dropdown(["Automatic", "Runtime", "SDK headers and metadata", "SDK and target tools", "Complete SDK"])
    profile.set_selected(profile_values.find(settings.profile)); body.append(W.label("Minimum SDK profile")); body.append(profile)
    editor.widgets["android.profile"] <- profile
    local runtime_values = ["auto", "package", "source"], runtime = W.dropdown(["Follow shared runtime choice", "Use pinned SDK runtime", "Build selected SQGI sources"])
    runtime.set_selected(runtime_values.find(settings.runtime))
    local runtime_label = W.label("SQGI runtime for Android"); runtime_label.set_mnemonic_widget(runtime)
    body.append(runtime_label); body.append(runtime); editor.widgets["android.runtime"] <- runtime
    body.append(W.label("Select a source checkout or revision in Runtime/native code. Android source builds keep the pinned GNOME libraries and disable JIT and typed kernels."))
    local apply = W.button("Apply Android settings", function() { editor.safe(function() {
        local fields = {}; foreach (key, input in controls) fields[key] <- input.get_text()
        fields.variant <- variant.get_selected() == 0 ? "debug" : "release"
        fields.profile <- profile_values[profile.get_selected()]
        fields.runtime <- runtime_values[runtime.get_selected()]
        editor.document.set([], write(editor.document.get([]), fields)); editor.refresh()
    }) })
    body.append(apply); editor.widgets["android.apply"] <- apply
    body.append(W.label("Local SDK paths, native entry symbols and GI runner settings remain available in Advanced. The standard path uses prebuilt Ooblerg packages."))
    editor.content.append(body)
}
return { read = read, write = write, render = render }
