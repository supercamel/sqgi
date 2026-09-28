// C-EDIT-06: offline guidance; opening this guide never writes project files.
local Gtk = import("Gtk", "4.0")
local W = import("widgets.nut")
local examples = {
    ["counter.vala"] = @"namespace StudyNative {
    public class Counter : GLib.Object {
        public int value { get; set; default = 0; }
        public signal void changed (int value);
        public int add (int amount) {
            value += amount;
            changed (value);
            return value;
        }
    }
}
",
    ["meson.build"] = @"project('study-native', 'c', 'vala')
library_file = host_machine.system() == 'windows' ? 'libstudy-native.dll' : 'libstudy-native.so'
library = shared_library('study-native', 'counter.vala',
  dependencies: dependency('gobject-2.0'),
  vala_header: 'study-native.h',
  vala_vapi: 'study-native.vapi',
  vala_gir: 'StudyNative-1.0.gir',
  vala_args: ['--shared-library=' + library_file],
  install: true)
custom_target('study-native-typelib',
  depends: library,
  output: 'StudyNative-1.0.typelib',
  command: [find_program('g-ir-compiler'),
    meson.current_build_dir() / 'StudyNative-1.0.gir', '--output', '@OUTPUT@'],
  build_by_default: true)
",
    ["main.nut"] = @"local Native = import(""StudyNative"", ""1.0"")
local counter = Native.Counter.new()
local received = 0
counter.connect(""changed"", function(value) { received = value })
counter.set_value(4)
assert(counter.add(3) == 7)
assert(counter.get_value() == 7 && received == 7)
print(""Native counter passed\n"")
"
}
local function open(parent, widgets) {
    local dialog = Gtk.Dialog.new(); dialog.set_title("Create a native module")
    dialog.set_transient_for(parent); dialog.set_modal(true); dialog.set_default_size(720, 650)
    local body = W.padded(W.box()), scroll = W.scroll(body); dialog.get_content_area().append(scroll)
    body.append(W.heading("Start with a small GObject library"))
    body.append(W.label("This Vala example exposes a property, method and signal to Squirrel. Create the files in your source editor; this guide only shows an example and does not create files or change your manifest."))
    body.append(W.heading("1. Prepare the build dependencies"))
    body.append(W.label("The example needs Meson, Ninja, a C compiler, valac, GLib/GObject development files and g-ir-compiler. Development files (headers and package metadata) let a compiler build your library. Runtime libraries (.so or .dll) are what your packaged app loads. Adding a runtime package alone may not provide the development files."))
    body.append(W.heading("2. Create the library source"))
    body.append(W.label("Put these two files in a native/ folder beside your manifest. Build it locally first to catch source errors before packaging."))
    foreach (name in ["counter.vala", "meson.build"]) {
        body.append(W.heading("native/" + name)); body.append(W.textview(examples[name]))
    }
    body.append(W.heading("3. Add the packaging recipe"))
    body.append(W.label("Return to Add native library. Name: study-native; source: Local folder; folder: native; build system: Meson. Enable Prepare GObject introspection metadata. Namespace: StudyNative; API version: 1.0; Meson library target: study-native."))
    body.append(W.label("Each selected CPU needs a matching compiler and target development dependencies. Host metadata generation also needs host dependencies and the same public API. Custom dependency installation and recipe options are in Advanced. For an existing library such as gserial, the Linux and Windows Ooblerg pickers can independently replace its source build. Leave them blank to build locally or from Git. Linux bundles use Ubuntu 24.04 (noble)."))
    body.append(W.heading("4. Call it from your app")); body.append(W.textview(examples["main.nut"]))
    body.append(W.label("Use this as a Squirrel entry script. The library does not provide the SQGI interpreter: in Runtime/native code, choose a SQGI source build for your selected targets, or supply existing matching runtimes. Windows can use the separate prebuilt SQGI runtime choice. Save the manifest, then Check project and Build selected packages in Review. Test the packaged import and behavior on every selected target; a successful build alone is not enough."))
    local close = dialog.add_button("Back to library", Gtk.ResponseType.close)
    dialog.connect("response", function(_) { dialog.destroy() })
    widgets["library.guide.close"] <- close; widgets["library.guide.body"] <- body
    widgets["library.guide.scroll"] <- scroll
    dialog.present()
}
return { open = open, examples = examples }
