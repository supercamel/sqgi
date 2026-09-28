// C-EDIT-06/07: presentation policy, never a second packaging resolver.
local targets = [
    { key = "appimage", label = "Linux AppImage", help = "One Linux application file for the selected CPU architecture." },
    { key = "win-dir", label = "Windows folder (x86_64)", help = "A folder for 64-bit Intel/AMD Windows containing the application and its dependencies. Share the whole folder." },
    { key = "win-nsis", label = "Windows installer (x86_64)", help = "An installer for 64-bit Intel/AMD Windows, built with NSIS. Building requires makensis; you can save a draft before installing it." },
    { key = "appimage-all", label = "Linux AppImages", help = "Builds the selected Linux architectures without a Windows package." },
    { key = "all", label = "Linux and Windows", help = "Builds the selected Linux AppImages and Windows x86_64 output. Select the combination in Targets." }
]
local templates = [
    { key = "simple", label = "Squirrel application", help = "Start with your script. Literal local imports are followed automatically. Add folders in Files for scripts selected dynamically." },
    { key = "gtk4", label = "GTK 4 desktop application", help = "Declares GTK 4 and its GUI dependencies. Choose this when your app uses GTK 4." },
    { key = "gtk4-gstreamer", label = "GTK 4 with audio or video", help = "Declares GTK 4 and GStreamer for a desktop application using multimedia." },
    { key = "native-gobject", label = "Squirrel with a native GObject library", help = "Adds a Meson library project in native/. Choose this only when your project contains that source directory." },
    { key = "native-vala", label = "Squirrel with a Vala library", help = "Adds a Meson library project in native/. Your main Squirrel script remains the entry point." },
    { key = "native-application", label = "Native application (Vala / C / C++)", help = "Builds an existing Meson or CMake application for each selected CPU and operating system. Your executable starts directly; no Squirrel script or SQGI runtime is needed." }
]
function target_label(key) {
    foreach (choice in targets) if (choice.key == key) return choice.label
    return key == null ? "Chosen by sqgipkg — resolve the plan to see the output" : "Custom target: " + key.tostring()
}
function current(record, document, base_dir) {
    return record != null && document.valid && record.text == document.text && record.base_dir == base_dir
}
function list_text(values, empty = "None declared") {
    if (values == null) return empty
    if (typeof(values) != "array") return values.tostring()
    local text = ""
    foreach (value in values) text += (text == "" ? "" : ", ") + value.tostring()
    return text == "" ? empty : text
}
function counts(result) {
    local count = { errors = 0, warnings = 0 }
    if (result != null && "diagnostics" in result) foreach (item in result.diagnostics) {
        if (item.severity == "error") count.errors++
        if (item.severity == "warning") count.warnings++
    }
    return count
}
function state(action, record, document, base_dir) {
    if (record == null) return action == "check" ? "Not checked" : "Plan not resolved"
    if (!current(record, document, base_dir)) return "Changed since inspection — " + (action == "check" ? "check again" : "resolve the plan again")
    if (record.pending) return action == "check" ? "Checking project…" : "Resolving plan…"
    if (record.error != null) return "Inspection did not finish: " + record.error
    local count = counts(record.result)
    if (!record.result.ok) return "Needs attention — " + count.errors + " error(s), " + count.warnings + " warning(s)"
    if (action == "explain") return "Plan resolved — this does not mean checks passed"
    return count.warnings ? "Checks passed with warnings — " + count.warnings : "Checks passed"
}
return { targets = targets, templates = templates, target_label = target_label, list_text = list_text,
    current = current, counts = counts, state = state }
