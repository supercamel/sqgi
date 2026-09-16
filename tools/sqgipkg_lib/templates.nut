local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("windows/nsis.nut")

class SqgiPkgTemplates extends Base.SqgiPkgWindowsNsis {
    function template_manifest(name) {
        local manifest = { schema_version = 2, script_dirs = ["."] }
        if (name == "simple") {}
        else if (name == "gtk4" || name == "gtk4-gstreamer") {
            manifest.features <- name == "gtk4" ? ["gtk4"] : ["gtk4", "gstreamer"]
        } else if (name == "native-gobject" || name == "native-vala") {
            manifest.native <- [{ dir = "native", build_system = "meson" }]
        } else this.fail("unknown template '" + name + "'; use simple, gtk4, gtk4-gstreamer, native-gobject, or native-vala")
        return sqgi.json.stringify(manifest) + "\n"
    }

    function init_manifest(name) {
        local path = "sqgipkg.json"
        if (this.path_exists(path)) this.fail("sqgipkg.json already exists")
        this.write_file(path, this.template_manifest(name))
        this.info("wrote sqgipkg.json from " + name + " template")
    }

}

return { SqgiPkgTemplates = SqgiPkgTemplates }
