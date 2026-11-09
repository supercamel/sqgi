// Shared CLI workflows. Android uses the same manifest resolver and payload staging as build.
local Base = import("build.nut"), C = import("android/common.nut"), D = import("android/device.nut"), GLib = import("GLib")
class SqgiPkgDevelopment extends Base.SqgiPkgBuild {
    function development_action(opts, action, options, reload) {
        if (!this.is_android(opts)) this.fail(action + " currently requires --platform android")
        this.validate_android(opts)
        if (this.option_present(options, "artifact") && action != "install") this.fail("--artifact is only available for install")
        if (this.option_present(options, "logs-once") && action != "logs") this.fail("--logs-once is only available for logs")
        if (action == "preview") {
            if (opts.entry_type == "native") this.fail("Native entry preview requires a desktop build of its executable")
            local self = this
            return C.temporary(function(root) {
                local staged = self.android_stage_application(opts, root)
                local data = opts.manifest_dir + "/.sqgipkg/preview/" + opts.app_id, env = {}
                foreach (key, name in { XDG_DATA_HOME = "data", XDG_CONFIG_HOME = "config", XDG_CACHE_HOME = "cache" }) {
                    C.mkdir(data + "/" + name); env[key] <- data + "/" + name
                }
                self.info("desktop preview using host SQGI/GI; private data: " + data)
                C.process([GLib.file_read_link("/proc/self/exe"), staged.source + "/" + staged.project.entry], env, false, staged.source)
                return 0
            })
        }
        if (["sync", "watch", "reset"].find(action) != null && opts.android.variant != "debug")
            this.fail(action + " requires a debug application; release builds disable source overrides")
        local device = D.Device(opts.android.architectures, opts.android.min_sdk, opts.android.serial)
        this.info("Android " + device.serial + ": " + device.abi + ", API " + device.info.api)
        if (action == "logs") { device.logs(opts.app_id, this.option_present(options, "logs-once")); return 0 }
        if (action == "watch") return this.watch_android(opts, device, reload)
        if (action == "sync") { this.sync_android(opts, device); return 0 }
        if (action == "reset") { this.android_session(device.reset(opts.app_id)); return 0 }
        if (action == "run") { this.android_session(device.launch(opts.app_id, opts.android.variant == "debug")); return 0 }
        local config = null
        foreach (selected in this.selected_configurations(opts))
            if (opts.target == "android-aab" || selected.android.abi == device.abi) { config = selected; break }
        if (config == null) this.fail("No build configuration matches the selected Android device")
        if (action == "deploy") this.build_android(config)
        local artifact = this.abs_path(config.output_dir) + "/" + config.app_id + "-" + config.android.abi + "-" + config.android.variant + "." + config.android.format
        if (this.option_present(options, "artifact")) artifact = this.abs_path(this.option_value(options, "artifact"))
        if (!C.is_file(artifact)) this.fail("Android artifact is missing; run sqgipkg build or deploy: " + artifact)
        local result = device.install(artifact, { offline = !opts.android.download, application_id = opts.app_id })
        C.atomic_json(opts.manifest_dir + "/.sqgipkg/android/devices/" + C.digest(device.serial) + "/install.json", result)
        this.info("installed " + result.artifact)
        if (action == "deploy") this.android_session(device.launch(opts.app_id, result.variant == "debug"))
        return 0
    }
    function android_session(session) {
        this.info(session.mode + " source, process " + session.pid + ", ABI " + session.abi)
    }
    function sync_android(opts, device) {
        local self = this
        return C.temporary(function(root) {
            local staged = self.android_stage_application(opts, root)
            local session = device.sync(opts.app_id, staged.source, staged.project)
            self.android_session(session)
            return session
        })
    }
    function watch_android(opts, device, reload) {
        local previous = null, last_error = null, self = this
        this.info("Watching scripts/assets; updates restart the Android process. Ctrl-C stops watching.")
        while (true) {
            try {
                local current = reload()
                if (current.app_id != opts.app_id || current.android.variant != "debug") throw "Application identity/variant changed; stop watching and deploy again"
                this.validate_android(current)
                C.temporary(function(root) {
                    local staged = self.android_stage_application(current, root), snapshot = D.snapshot(staged.source, staged.project, "")
                    local identity = C.digest(C.encoded(snapshot))
                    if (identity != previous) {
                        // Debounce by staging again on the next iteration, including manifest edits.
                        if (last_error != "pending:" + identity) { last_error = "pending:" + identity; return }
                        previous = identity
                        self.android_session(device.sync(current.app_id, staged.source, staged.project))
                    }
                    last_error = null
                })
            } catch (caught) {
                if (last_error != caught.tostring()) this.info("Update pending: " + caught)
                last_error = caught.tostring()
            }
            GLib.usleep(500000)
        }
    }
}
return { SqgiPkgDevelopment = SqgiPkgDevelopment }
