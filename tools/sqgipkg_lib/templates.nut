local GLib = import("GLib")
local Gio = import("Gio")
local Base = import("windows/nsis.nut")

class SqgiPkgTemplates extends Base.SqgiPkgWindowsNsis {
    function template_manifest(name) {
        if (name == "simple") {
            return @"{
  ""script_dirs"": [
    "".""
  ]
}
"
        }

        if (name == "gtk4") {
            return @"{
  ""script_dirs"": [
    "".""
  ],
  ""windows"": {
    ""gdk_backend"": ""win32""
  }
}
"
        }

        if (name == "gtk4-gstreamer") {
            return @"{
  ""script_dirs"": [
    "".""
  ],
  ""windows"": {
    ""msys2_prefix"": ""mingw64"",
    ""gdk_backend"": ""win32"",
    ""packages"": [
      ""mingw-w64-x86_64-gst-plugin-gtk""
    ]
  }
}
"
        }

        if (name == "native-gobject") {
            return @"{
  ""name"": ""MyNativeApp"",
  ""script_dirs"": [
    "".""
  ],
  ""native_projects"": [
    {
      ""dir"": ""native"",
      ""build"": [
        ""meson setup build --wipe || meson setup build"",
        ""meson compile -C build""
      ],
      ""libraries"": [
        ""build/libmynative-1.0.so""
      ],
      ""typelibs"": [
        ""build/MyNative-1.0.typelib""
      ]
    }
  ]
}
"
        }

        if (name == "native-vala") {
            return @"{
  ""name"": ""MyValaApp"",
  ""script_dirs"": [
    "".""
  ],
  ""native_projects"": [
    {
      ""dir"": ""native"",
      ""build"": [
        ""meson setup build --wipe || meson setup build"",
        ""meson compile -C build"",
        ""g-ir-compiler build/MyVala-1.0.gir --output build/MyVala-1.0.typelib""
      ],
      ""libraries"": [
        ""build/libmyvala-1.0.so""
      ],
      ""typelibs"": [
        ""build/MyVala-1.0.typelib""
      ]
    }
  ]
}
"
        }

        this.fail("unknown template '" + name + "'; use simple, gtk4, gtk4-gstreamer, native-gobject, or native-vala")
    }

    function init_manifest(name) {
        local path = "sqgipkg.json"
        if (this.path_exists(path)) this.fail("sqgipkg.json already exists")
        this.write_file(path, this.template_manifest(name))
        this.info("wrote sqgipkg.json from " + name + " template")
    }

}

return { SqgiPkgTemplates = SqgiPkgTemplates }
