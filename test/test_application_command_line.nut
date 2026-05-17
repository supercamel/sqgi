// test/test_application_command_line.nut
// Regression test: Gio.Application command-line signal receives argv from run(argc, argv).

local Gio = import("Gio")
local GLib = import("GLib")

local app = Gio.Application.new("org.sqgi.test.commandline", Gio.ApplicationFlags.handles_command_line)
app.add_main_option("uri", 'd', 0, GLib.OptionArg.string, "A URI to download", "URI")

local fired = false
local saw_uri = false
local argc_ok = false

app.connect("command-line", function(command_line) {
    fired = true

    local opts = command_line.get_options_dict()
    argc_ok = (opts != null)
    if (opts != null && opts.contains("uri")) {
        // With native GVariant unwrap, lookup_value returns the inner
        // string directly rather than an opaque GVariant wrapper.
        local v = opts.lookup_value("uri", null)
        saw_uri = (typeof v == "string" && v == "https://example.com/")
    }

    app.quit()
    return 0
})

local argv = ["test_application_command_line.nut", "--uri", "https://example.com/"]
local rc = app.run(argv.len(), argv)

if (rc != 0) throw "[FAIL] app.run returned non-zero"
if (!fired) throw "[FAIL] command-line signal did not fire"
if (!argc_ok) throw "[FAIL] command-line args were missing"
if (!saw_uri) throw "[FAIL] expected --uri in command-line args"

print("test_application_command_line.nut passed\n")
