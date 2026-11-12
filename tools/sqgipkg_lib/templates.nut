local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("windows/nsis.nut")
local AndroidProject = import("android/project.nut")
local template_root = GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null))
local function substitute(text, token, value) {
    local result = "", offset = 0, found
    while ((found = text.find(token, offset)) != null) { result += text.slice(offset, found) + value; offset = found + token.len() }
    return result + text.slice(offset)
}

class SqgiPkgTemplates extends Base.SqgiPkgWindowsNsis {
    function template_manifest(name) {
        local manifest = { schema_version = 2 }
        if (name == "simple") {}
        else if (name == "android-gtk4") {
            manifest.name <- "SQGI Application"; manifest.app_id <- "org.example.sqgiapp"
            manifest.target <- "android-apk"; manifest.compile_scripts <- false; manifest.features <- ["gtk4"]
            manifest.entry <- { type = "sqgi", script = "src/main.nut", source_root = "src" }
            manifest.script_dirs <- ["src"]
            manifest.files <- [{ from = "src", to = "usr/share/sqgi/app", exclude = ["**/.git/**", "**/__pycache__/**"] }]
            manifest.windows <- { files = [{ from = "src", to = "share/sqgi/app", exclude = ["**/.git/**", "**/__pycache__/**"] }] }
            manifest.platforms <- { android = { architectures = ["arm64-v8a", "x86_64"], format = "apk",
                sdk = "noble-android-r6", min_sdk = 31, namespaces = ["Gtk-4.0"] } }
        }
        else if (name == "gtk4" || name == "gtk4-gstreamer") {
            manifest.features <- name == "gtk4" ? ["gtk4"] : ["gtk4", "gstreamer"]
        } else if (name == "native-gobject" || name == "native-vala") {
            manifest.native <- [{ dir = "native", build_system = "meson" }]
        } else if (name == "native-application") {
            manifest.entry <- { type = "native", project = "app", executable = "my-app" }
            manifest.native <- [{ name = "app", dir = ".", build_system = "meson" }]
        } else this.fail("unknown template '" + name + "'; use simple, gtk4, gtk4-gstreamer, native-gobject, native-vala, native-application, or android-gtk4")
        return sqgi.json.stringify(manifest) + "\n"
    }

    function init_manifest(name, opts = null) {
        local path = "sqgipkg.json"
        if (this.path_exists(path)) this.fail("sqgipkg.json already exists")
        if (name == "android-gtk4") {
            local manifest = sqgi.json.parse(this.template_manifest(name))
            if (opts != null) {
                if (opts.app_id != "") manifest.app_id = opts.app_id
                if (opts.name != "") manifest.name = opts.name
            }
            if (!regexp("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$").match(manifest.app_id)) this.fail("Android template requires a valid --app-id")
            if (this.path_exists("src") && !this.is_directory("src")) this.fail("src must be a directory")
            foreach (file in ["src/main.nut", "src/message.txt"]) if (this.path_exists(file) && this.is_directory(file)) this.fail(file + " must be a file")
            this.mkdir_p("src")
            if (!this.path_exists("src/main.nut")) {
                local template = this.read_file(template_root + "/android/templates/main.nut")
                template = substitute(template, "@APPLICATION_ID@", sqgi.json.stringify(manifest.app_id))
                template = substitute(template, "@NAME@", sqgi.json.stringify(manifest.name))
                AndroidProject.create_file("src/main.nut", template)
            }
            if (!this.path_exists("src/message.txt")) AndroidProject.create_file("src/message.txt", "Edit src/main.nut or this message, then use sqgipkg sync --platform android.\n")
            AndroidProject.create_file(path, sqgi.json.stringify(manifest) + "\n")
            this.info("created Android GTK project; use sqgipkg preview --platform android or sqgipkg deploy --platform android")
            return
        }
        this.write_file(path, this.template_manifest(name))
        this.info("wrote sqgipkg.json from " + name + " template")
    }

}

return { SqgiPkgTemplates = SqgiPkgTemplates }
