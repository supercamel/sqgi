/**
 * demo/gio/argp.nut
 *
 * Use Gio.Application's main-option machinery to parse command-line flags
 * like a proper Gtk application would. The actual option processing happens
 * inside the "command-line" signal handler, where we get a fully-wrapped
 * Gio.ApplicationCommandLine instance.
 *
 * Usage examples:
 *   sqgi demo/gio/argp.nut --verbose --name Alice --count 2
 *   sqgi demo/gio/argp.nut -v -n Bob -c 3
 *   sqgi demo/gio/argp.nut --help
 *
 * Exercises:
 *   - Gio.Application.add_main_option
 *   - "command-line" signal + Gio.ApplicationCommandLine.get_options_dict
 *   - GLib.VariantDict.lookup_value on a properly-typed instance
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local app = sqgi.new_object(Gio.Application, {
    "application-id": "io.sqgi.demo.argp",
    "flags":          Gio.ApplicationFlags.handles_command_line,
})

// add_main_option(long_name, short_name, flags, arg, description, arg_description)
// short_name is a char (integer codepoint); 0 = no short form.
app.add_main_option("verbose", 'v', 0, GLib.OptionArg.none,
                    "Enable verbose output", null)
app.add_main_option("name",    'n', 0, GLib.OptionArg.string,
                    "Greet someone by name", "NAME")
app.add_main_option("count",   'c', 0, GLib.OptionArg.int,
                    "Repeat count", "N")

app.connect("command-line", function(cmdline) {
    local opts = cmdline.get_options_dict()

    local verbose = false
    local name    = "world"
    local count   = 1

    // VariantDict.lookup_value returns either null or a native Squirrel value
    // (the marshaller unwraps the GVariant payload to a matching type).
    if (opts.lookup_value("verbose", null) != null) verbose = true

    local v = opts.lookup_value("name", null)
    if (v != null) name = v

    v = opts.lookup_value("count", null)
    if (v != null) count = v

    if (verbose)
        print(format("[parsed] verbose=true name=%s count=%d\n", name, count))

    for (local i = 0; i < count; i++)
        print("hello, " + name + "!\n")
    return 0
})

// Forward sqgi-level vargv as the application argv.
local argv = ["sqgi-argp"]
foreach (a in vargv) argv.append(a)

local rc = app.run(argv.len(), argv)
print(format("application exited with %d\n", rc))
