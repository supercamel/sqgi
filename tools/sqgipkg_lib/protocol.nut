// C-PKG: structured access uses the same resolver and recipes as human output.
local GLib = import("GLib")
local Base = import("build.nut")
local data_dir = GLib.path_get_dirname(GLib.path_get_dirname(GLib.canonicalize_filename(__FILE__, null)))

class SqgiPkgProtocol extends Base.SqgiPkgBuild {
    function describe() {
        local templates = {}
        foreach (name in ["simple", "gtk4", "gtk4-gstreamer", "native-gobject", "native-vala"])
            templates[name] <- sqgi.json.parse(this.template_manifest(name))
        local options = []
        foreach (entry in this.option_entries) options.push({ name = entry.name,
            kind = entry.kind == GLib.OptionArg.none ? "boolean" : entry.kind == GLib.OptionArg.string_array ? "array" : "string",
            description = entry.description, value_name = entry.value_name })
        local runtime = clone import("system").runtime
        runtime.kernels <- "kernel" in sqgi
        runtime.kernel_backend <- runtime.kernels ? sqgi.kernel.backend : null
        return { protocol_version = 1, ok = true,
            schema = sqgi.json.parse(this.read_file(GLib.build_filenamev([data_dir, "sqgipkg.schema.json"]))),
            templates = templates, options = options, runtime = runtime,
            host = this.host_windows() ? "windows" : "linux",
            targets = this.host_windows() ? ["win-dir", "win-nsis", "win-sysroot"] : ["appimage", "linux-sysroot", "win-dir", "win-nsis", "win-sysroot", "all"] }
    }

    function stdin_manifest() {
        // The Squirrel stream readblob uses file length and cannot read a pipe.
        local chunks = [], chunk = "", count = 0
        while (true) {
            local byte = null
            try { byte = stdin.readn('b') } catch (e) { if (stdin.eos()) break; throw e }
            if (++count > 16777216) this.fail("stdin manifest exceeds 16 MiB")
            chunk += format("%c", byte)
            if (chunk.len() >= 4096) { chunks.push(chunk); chunk = "" }
        }
        chunks.push(chunk)
        local input = ""
        foreach (part in chunks) input += part
        return sqgi.json.parse(input)
    }

    function execute_json(args, options) {
        machine_output = true; diagnostics = []; current_error_path = null
        local result = { protocol_version = 1, ok = false, diagnostics = diagnostics, configurations = [] }
        try {
            if (this.option_present(options, "describe")) {
                print(sqgi.json.stringify(this.describe()) + "\n")
                return 0
            }
            local check = this.option_present(options, "doctor")
            if (!check && !this.option_present(options, "explain"))
                this.fail("--json requires check, explain or describe")
            foreach (flag in ["clean", "init", "write-lock", "locked"])
                if (this.option_present(options, flag)) this.fail("inspection cannot use --" + flag)
            if (this.option_value(options, "manifest") == "-") {
                local base_dir = this.option_value(options, "base-dir")
                if (base_dir == null || !GLib.path_is_absolute(base_dir)) this.fail("stdin inspection requires an absolute --base-dir")
                authored_base_dir = base_dir; authored_manifest = this.stdin_manifest()
            }
            local opts = this.parse_args(args, options)
            foreach (config in this.selected_configurations(opts)) {
                diagnostic_target = config.target + ":" + config.appimage_arch
                if (check) { this.validate_doctor_options(config); this.doctor(config) }
                result.configurations.push(this.resolved_plan(config))
            }
            result.ok = true
            foreach (item in diagnostics) if (item.severity == "error") result.ok = false
        } catch (e) { this.diagnostic("error", e.tostring(), current_error_path, "resolution") }
        print(sqgi.json.stringify(result) + "\n")
        return result.ok ? 0 : 1
    }
}
return { SqgiPkgProtocol = SqgiPkgProtocol }
