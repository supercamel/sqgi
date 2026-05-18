local GLib = import("GLib")
local Gio = import("Gio")
local SqVala = import("SqVala", "1.0")

local loop = GLib.MainLoop.new(null, false)

function require_true(condition, message) {
    if (!condition) throw message
}

async function run() {
    local worker = SqVala.Worker.new("vala")
    local progress = []

    worker.connect("progressed", function(step, message) {
        progress.push(step + ":" + message)
    })

    require_true(SqVala.triple(14) == 42, "triple failed")
    require_true(worker.multiply(6, 7) == 42, "multiply failed")
    require_true(worker.describe() == "Worker<vala>", "describe failed")

    worker["label"] = "async vala"
    worker.emit_progress(9)

    local app_share = GLib.getenv("SQGI_APP_SHARE")
    if (app_share == null || app_share == "") {
        app_share = GLib.build_filenamev([
            GLib.get_current_dir(),
            "tools",
            "sqgipkg_tests",
            "native_vala_project"
        ])
    }
    local packaged_main = Gio.File.new_for_path(GLib.build_filenamev([app_share, "main.nut"]))
    local packaged_main_contents = await packaged_main.load_contents_async(null)
    require_true(packaged_main_contents[0].len() > 0, "direct await load_contents_async returned no data")

    await sqgi.sleep(1)

    local greeting = await worker.greet_async("SQGI")
    local sum = await worker.delayed_sum_async(19, 23)

    local failed = false
    try {
        await worker.fail_async()
    } catch (e) {
        failed = true
        print("caught expected Vala async error: " + e + "\n")
    }

    require_true(failed, "fail_async unexpectedly succeeded")
    require_true(greeting == "async vala greets SQGI", "greet_async returned " + greeting)
    require_true(sum == 42, "delayed_sum_async returned " + sum)
    require_true(progress.len() == 3, "expected 3 progress signals, got " + progress.len())

    print(greeting + "; sum=" + sum + "; progress=" + progress.len() + "\n")
    loop.quit()
}

run().catch(function(e) {
    print("native Vala test failed: " + e + "\n")
    loop.quit()
})

loop.run()
return 0
