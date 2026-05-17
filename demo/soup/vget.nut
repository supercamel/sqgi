/**
 * demo/soup/vget.nut
 *
 * Practical Squirrel port of the provided Vala VGet structure.
 * It keeps the same app shape (Application + async methods + CLI options)
 * while using binding-safe APIs in this runtime.
 */

local GLib = import("GLib")
local Gio = import("Gio")
local Soup = import("Soup")

class VGet {
    app = null
    uri = null
    output_file = null

    constructor(args) {
        this.app = Gio.Application.new(
            "com.vala_example.vget",
            Gio.ApplicationFlags.handles_command_line
        )

        this.app.add_main_option("uri", 'd', 0, GLib.OptionArg.string,
            "A URI to download", "URI")
        this.app.add_main_option("output", 'o', 0, GLib.OptionArg.string,
            "The output file", "FILE")

        this.app.connect("command-line", function(command_line) {
            local opts = command_line.get_options_dict()

            this.uri = null
            this.output_file = null
            if (opts.contains("uri")) {
                this.uri = opts.lookup_value("uri", null)
            }
            if (opts.contains("output")) {
                this.output_file = opts.lookup_value("output", null)
            }

            if (this.uri != null && typeof this.uri != "string") {
                this.uri = null
            }
            if (this.output_file != null && typeof this.output_file != "string") {
                this.output_file = null
            }

            if (this.uri != null && this.output_file == null) {
                this.output_file = this.basename_from_uri(this.uri)
                if (this.output_file.len() == 0) this.output_file = "out"
            }
            if (this.output_file == null) this.output_file = "out"

            if (this.uri == null) {
                print("A valid URI is required. Run with --help for more information.\n")
                return 0
            }

            this.app.hold()

            this.download_file(command_line, this.uri, this.output_file)
                .then(function(ok) {
                    print(ok ? "Download complete.\n" : "Download failed.\n")
                })
                .catch(function(e) {
                    print("error: " + e + "\n")
                })
                .then(function(_) {
                    this.app.release()
                    this.app.quit()
                }.bindenv(this))

            return 0
        }.bindenv(this))
    }

    function basename_from_uri(uri) {
        if (uri == null) return "out"

        local last_slash = -1
        for (local i = 0; i < uri.len(); i += 1) {
            if (uri.slice(i, i + 1) == "/") {
                last_slash = i
            }
        }

        if (last_slash >= 0 && last_slash + 1 < uri.len()) {
            return uri.slice(last_slash + 1)
        }

        if (uri.len() > 0) return uri
        return "out"
    }

    function download_file(command_line, uri, output_file) {
        // Returns a Task that resolves to `true` on success.
        //
        // Implementation note: we drive the read/write loop from a single
        // `sqgi.timeout_add(0, ...)` source rather than `await`-ing between
        // chunks. Soup's input stream internally spins the main loop while
        // waiting for bytes, and dispatching another `await` wake during
        // that nested iteration causes re-entrancy crashes. A pure timer
        // source is dispatch-safe (GLib won't re-enter a running source).
        local task = sqgi.Task()

        local session = Soup.Session.new()
        local message = Soup.Message.new("GET", uri)
        local in_stream = session.send(message, null)

        local bytes_total = -1
        try {
            bytes_total = message.get_response_headers().get_content_length()
        } catch (e) {}

        local out_file = Gio.File.new_for_path(output_file)
        local out_stream = out_file.replace(null, false, Gio.FileCreateFlags.none, null)

        local CHUNKS_PER_TICK    = 8        // amortize main-loop overhead
        local CHUNK_SIZE         = 65536
        local PROGRESS_INTERVAL  = 1000000  // 1 second in µs

        local bytes_written = 0
        local last_report_us = GLib.get_monotonic_time()

        sqgi.timeout_add(0, function() {
            try {
                for (local i = 0; i < CHUNKS_PER_TICK; i++) {
                    local chunk = in_stream.read_bytes(CHUNK_SIZE, null)
                    local n = chunk.get_size()
                    if (n == 0) {
                        try { out_stream.close_sync(null) } catch (_) {}
                        try { in_stream.close_sync(null)  } catch (_) {}
                        print("Downloaded " + bytes_written + " of " +
                              (bytes_total >= 0 ? bytes_total : bytes_written) +
                              " bytes.\n")
                        print("Download finished.\n")
                        task.resolve(true)
                        return false  // remove source
                    }
                    out_stream.write_bytes(chunk, null)
                    bytes_written += n
                }

                local now_us = GLib.get_monotonic_time()
                if (now_us - last_report_us >= PROGRESS_INTERVAL) {
                    print("Downloaded " + bytes_written + " of " +
                          (bytes_total >= 0 ? bytes_total : "?") + " bytes.\n")
                    last_report_us = now_us
                }
                return true
            } catch (e) {
                try { out_stream.close_sync(null) } catch (_) {}
                try { in_stream.close_sync(null)  } catch (_) {}
                task.reject(e)
                return false
            }
        })

        return task
    }
    function run(args) {
        local argv = ["vget.nut"]
        foreach (i, a in args) {
            argv.push(a)
        }
        return this.app.run(argv.len(), argv)
    }
}

local vget = VGet(vargv)
local status = vget.run(vargv)
print("Application exited with status " + status + "\n")
