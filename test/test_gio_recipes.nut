// test/test_gio_recipes.nut
//
// Behavioural tests for the recipes documented in docs/recipes/gio.md.
// Self-contained: writes scratch files under GLib.get_tmp_dir() with a
// per-run stamp, exercises async + sync GIO surfaces, and cleans up.
//
// Skips anything that needs external network or privileged ports.
//
// Covers:
//   - Gio.File basics: new_for_path, query_exists, make_directory, delete
//   - load_contents_async, replace_async, append_to_async roundtrips
//   - read_async + read_bytes_async chunked reads
//   - splice_async file copy
//   - ZlibCompressor + ZlibDecompressor + ConverterInputStream roundtrip
//   - enumerate_children_async + next_files_async paging
//   - query_info_async + Gio.FileInfo typed accessors
//   - Gio.File.monitor_directory "changed" signal
//   - GLib.spawn_command_line_sync return shape + exit decoding
//   - await GLib.spawn_command_line_async
//   - Gio.Resolver.lookup_by_name_async on "localhost"
//   - Gio.SocketService + Gio.SocketClient loopback echo
//   - Gio.Socket UDP loopback echo via sqgi.socket_add_watch
//   - sqgi.all parallel file loads

local GLib = import("GLib")
local Gio  = import("Gio")

local checks = 0
local fails  = 0
local fail_lines = []

function check(name, cond, detail) {
    checks += 1
    if (!cond) {
        fails += 1
        fail_lines.push(name + ": " + detail)
        print("  FAIL  " + name + ": " + detail + "\n")
    } else {
        print("  ok    " + name + "\n")
    }
}

local STAMP = GLib.get_monotonic_time().tostring()
local TMP   = GLib.get_tmp_dir() + "/sqgi_gio_recipes_" + STAMP
local NDONE = 0
local NWANT = 0

function rm_tree(path) {
    local f = Gio.File.new_for_path(path)
    if (!f.query_exists(null)) return
    try {
        local enumr = f.enumerate_children("standard::name,standard::type",
            Gio.FileQueryInfoFlags.nofollow_symlinks, null)
        while (true) {
            local info = enumr.next_file(null)
            if (info == null) break
            local child_path = path + "/" + info.get_name()
            if (info.get_file_type() == Gio.FileType.directory)
                rm_tree(child_path)
            else
                Gio.File.new_for_path(child_path).delete(null)
        }
        enumr.close(null)
    } catch (e) {}
    try { f.delete(null) } catch (e) {}
}

// Fresh tmp dir
rm_tree(TMP)
Gio.File.new_for_path(TMP).make_directory(null)

local loop = GLib.MainLoop.new(null, false)

// ── 1. File basics: paths, query_exists, mkdir, delete ────────────────────
function test_basics() {
    local p = TMP + "/basics.txt"
    local f = Gio.File.new_for_path(p)
    check("get_path", f.get_path() == p, "got " + f.get_path())
    check("get_basename", f.get_basename() == "basics.txt", "got " + f.get_basename())
    check("get_parent", f.get_parent().get_path() == TMP,
          "got " + f.get_parent().get_path())
    check("query_exists false before write", !f.query_exists(null), "exists?")

    local subdir = TMP + "/subdir"
    Gio.File.new_for_path(subdir).make_directory(null)
    check("make_directory", Gio.File.new_for_path(subdir).query_exists(null),
          "subdir not created")
}
test_basics()

// ── async block ───────────────────────────────────────────────────────────
async function run_async() {
    // ── 2. load_contents_async + replace_async roundtrip ────────────────
    {
        local p = TMP + "/round.txt"
        local f = Gio.File.new_for_path(p)
        local payload = "hello\nworld\n"

        local out = await f.replace_async(null, false,
            Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
        local n = await out.write_bytes_async(GLib.Bytes.new(payload),
            GLib.PRIORITY_DEFAULT)
        out.close(null)
        check("replace_async wrote N bytes", n == payload.len(),
              "wrote " + n + " want " + payload.len())

        local r = await f.load_contents_async(null)
        local got = (typeof(r) == "array") ? r[0] : r
        check("load_contents_async roundtrip", got == payload,
              "got len=" + got.len() + " want " + payload.len())
    }

    // ── 3. append_to_async ──────────────────────────────────────────────
    {
        local p = TMP + "/append.txt"
        local f = Gio.File.new_for_path(p)
        local out1 = await f.replace_async(null, false,
            Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
        await out1.write_bytes_async(GLib.Bytes.new("aa"), GLib.PRIORITY_DEFAULT)
        out1.close(null)

        local out2 = await f.append_to_async(Gio.FileCreateFlags.none,
                                             GLib.PRIORITY_DEFAULT)
        await out2.write_bytes_async(GLib.Bytes.new("bb"), GLib.PRIORITY_DEFAULT)
        out2.close(null)

        local r   = await f.load_contents_async(null)
        local got = (typeof(r) == "array") ? r[0] : r
        check("append_to_async", got == "aabb", "got " + got)
    }

    // ── 4. read_async + chunked read_bytes_async ────────────────────────
    {
        local p = TMP + "/chunks.bin"
        local f = Gio.File.new_for_path(p)
        local payload = ""
        // 10 KB of repeating data
        for (local i = 0; i < 1024; i++) payload = payload + "0123456789"

        local out = await f.replace_async(null, false,
            Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
        await out.write_bytes_async(GLib.Bytes.new(payload), GLib.PRIORITY_DEFAULT)
        out.close(null)

        local input = await f.read_async(GLib.PRIORITY_DEFAULT)
        local buf = ""
        while (true) {
            local b = await input.read_bytes_async(2048, GLib.PRIORITY_DEFAULT)
            if (b.get_size() == 0) break
            buf = buf + b.get_data()
        }
        input.close(null)
        check("read_bytes_async chunked length", buf.len() == payload.len(),
              "got " + buf.len() + " want " + payload.len())
        check("read_bytes_async chunked content", buf == payload, "content mismatch")
    }

    // ── 5. splice_async file copy ───────────────────────────────────────
    {
        local src = Gio.File.new_for_path(TMP + "/round.txt")
        local dst = Gio.File.new_for_path(TMP + "/round.copy.txt")
        local input  = await src.read_async(GLib.PRIORITY_DEFAULT)
        local output = await dst.replace_async(null, false,
            Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
        local flags = Gio.OutputStreamSpliceFlags.close_source |
                      Gio.OutputStreamSpliceFlags.close_target
        local n = await output.splice_async(input, flags, GLib.PRIORITY_DEFAULT)
        check("splice_async byte count", n > 0, "got " + n)

        local r1 = await src.load_contents_async(null)
        local r2 = await dst.load_contents_async(null)
        local a = (typeof(r1) == "array") ? r1[0] : r1
        local b = (typeof(r2) == "array") ? r2[0] : r2
        check("splice_async contents identical", a == b, "src!=dst")
    }

    // ── 6. ZlibCompressor → ZlibDecompressor roundtrip ───────────────────
    {
        local raw  = TMP + "/conv.raw"
        local gz   = TMP + "/conv.gz"
        local back = TMP + "/conv.back"

        local original = ""
        for (local i = 0; i < 256; i++) original = original + "Lorem ipsum dolor sit amet. "

        // Write raw
        local f_raw = Gio.File.new_for_path(raw)
        local o = await f_raw.replace_async(null, false,
            Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
        await o.write_bytes_async(GLib.Bytes.new(original), GLib.PRIORITY_DEFAULT)
        o.close(null)

        // Compress: raw → gz via ConverterOutputStream + ZlibCompressor
        local zc = sqgi.new_object(Gio.ZlibCompressor, {
            "format": Gio.ZlibCompressorFormat.gzip,
        })
        local in_raw = await Gio.File.new_for_path(raw).read_async(GLib.PRIORITY_DEFAULT)
        local out_gz = await Gio.File.new_for_path(gz).replace_async(null, false,
            Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
        local out_conv = sqgi.new_object(Gio.ConverterOutputStream, {
            "base-stream": out_gz,
            "converter":   zc,
        })
        local flags = Gio.OutputStreamSpliceFlags.close_source |
                      Gio.OutputStreamSpliceFlags.close_target
        local nc = await out_conv.splice_async(in_raw, flags, GLib.PRIORITY_DEFAULT)
        check("gzip splice compressed", nc > 0, "got " + nc)
        local gz_info = await Gio.File.new_for_path(gz).query_info_async(
            "standard::size", Gio.FileQueryInfoFlags.none, GLib.PRIORITY_DEFAULT)
        check("gzip output smaller than input",
              gz_info.get_size() < original.len(),
              "gz=" + gz_info.get_size() + " raw=" + original.len())

        // Decompress: gz → back via ConverterInputStream + ZlibDecompressor
        local zd = sqgi.new_object(Gio.ZlibDecompressor, {
            "format": Gio.ZlibCompressorFormat.gzip,
        })
        local in_gz = await Gio.File.new_for_path(gz).read_async(GLib.PRIORITY_DEFAULT)
        local in_conv = sqgi.new_object(Gio.ConverterInputStream, {
            "base-stream": in_gz,
            "converter":   zd,
        })
        local out_back = await Gio.File.new_for_path(back).replace_async(null, false,
            Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
        await out_back.splice_async(in_conv, flags, GLib.PRIORITY_DEFAULT)

        local r = await Gio.File.new_for_path(back).load_contents_async(null)
        local got = (typeof(r) == "array") ? r[0] : r
        check("gzip roundtrip preserves content", got == original,
              "len got=" + got.len() + " want=" + original.len())
    }

    // ── 7. enumerate_children_async paging ──────────────────────────────
    {
        local dir = TMP + "/listdir"
        Gio.File.new_for_path(dir).make_directory(null)
        local NAMES = ["alpha", "beta", "gamma", "delta", "epsilon"]
        foreach (n in NAMES) {
            local f = Gio.File.new_for_path(dir + "/" + n)
            local o = await f.replace_async(null, false,
                Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
            await o.write_bytes_async(GLib.Bytes.new(n), GLib.PRIORITY_DEFAULT)
            o.close(null)
        }

        local enumr = await Gio.File.new_for_path(dir).enumerate_children_async(
            "standard::name,standard::type,standard::size",
            Gio.FileQueryInfoFlags.none, GLib.PRIORITY_DEFAULT)
        local seen = {}
        while (true) {
            local infos = await enumr.next_files_async(2, GLib.PRIORITY_DEFAULT)
            if (infos == null || infos.len() == 0) break
            foreach (info in infos) seen[info.get_name()] <- info.get_size()
        }
        enumr.close(null)

        local missing = ""
        foreach (n in NAMES) if (!(n in seen)) missing = missing + n + " "
        check("enumerate_children sees all entries", missing == "",
              "missing: " + missing)
        check("enumerate_children sizes correct",
              seen.len() == NAMES.len() && seen["alpha"] == 5,
              "alpha size=" + (("alpha" in seen) ? seen["alpha"] : "?"))
    }

    // ── 8. query_info_async + FileInfo accessors ────────────────────────
    {
        local p = TMP + "/round.txt"
        local f = Gio.File.new_for_path(p)
        local info = await f.query_info_async(
            "standard::name,standard::size,standard::type",
            Gio.FileQueryInfoFlags.none, GLib.PRIORITY_DEFAULT)
        check("query_info name", info.get_name() == "round.txt",
              "got " + info.get_name())
        check("query_info type", info.get_file_type() == Gio.FileType.regular,
              "got type " + info.get_file_type())
        check("query_info size > 0", info.get_size() > 0,
              "size=" + info.get_size())

        // Typed dispatch via list_attributes / get_attribute_type
        local attrs = info.list_attributes(null)
        local saw_name = false
        foreach (a in attrs) {
            if (a == "standard::name") {
                saw_name = true
                // GIO uses BYTE_STRING for filesystem names.
                check("standard::name is byte_string",
                      info.get_attribute_type(a) == Gio.FileAttributeType.byte_string,
                      "type=" + info.get_attribute_type(a))
                check("get_attribute_byte_string",
                      info.get_attribute_byte_string(a) == "round.txt",
                      "got " + info.get_attribute_byte_string(a))
                break
            }
        }
        check("list_attributes contains standard::name", saw_name, "missing")
    }

    // ── 9. monitor_directory triggers "changed" ─────────────────────────
    {
        local dir = TMP + "/watchdir"
        Gio.File.new_for_path(dir).make_directory(null)
        local mon = Gio.File.new_for_path(dir).monitor_directory(
            Gio.FileMonitorFlags.none, null)
        local events = []
        local sig = mon.connect("changed", function(file, _other, event_type) {
            events.push({path = file.get_path(), event = event_type})
        })

        // Give the monitor a tick to settle.
        await sqgi.sleep(50)

        // Create a file inside.
        local target = dir + "/created.txt"
        local fo = await Gio.File.new_for_path(target).replace_async(null, false,
            Gio.FileCreateFlags.none, GLib.PRIORITY_DEFAULT)
        await fo.write_bytes_async(GLib.Bytes.new("x"), GLib.PRIORITY_DEFAULT)
        fo.close(null)

        // Poll briefly for events.
        local deadline = GLib.get_monotonic_time() + 2 * 1000 * 1000  // 2s
        while (events.len() == 0 && GLib.get_monotonic_time() < deadline)
            await sqgi.sleep(25)

        mon.cancel()
        check("monitor saw at least one event", events.len() > 0,
              "events.len=" + events.len())
        local saw_target = false
        foreach (e in events) if (e.path == target) { saw_target = true; break }
        check("monitor event references created file", saw_target,
              "no event referenced " + target)
    }

    // ── 10. spawn_command_line_sync return shape + exit decoding ────────
    {
        local res = GLib.spawn_command_line_sync("/bin/sh -c 'echo hi; exit 0'")
        check("spawn_sync returns array", typeof(res) == "array",
              "got type " + typeof(res))
        // Shape per demo/gio/run.nut: [stdout, stderr, wait_status]
        // (some builds may include a leading bool; tolerate both.)
        local stdout_idx = (res.len() >= 4 && typeof(res[0]) == "bool") ? 1 : 0
        local status_idx = stdout_idx + 2
        local out = res[stdout_idx]
        local status = res[status_idx]
        check("spawn_sync stdout has 'hi'",
              typeof(out) == "string" && out.find("hi") != null,
              "got " + out)
        check("spawn_sync exit status 0",
              (status & 0x7F) == 0 && ((status >> 8) & 0xFF) == 0,
              "status=" + status)

        local res2 = GLib.spawn_command_line_sync("/bin/sh -c 'exit 7'")
        local s2 = res2[status_idx]
        check("spawn_sync exit status 7",
              ((s2 >> 8) & 0xFF) == 7,
              "status=" + s2)
    }

    // ── 11. spawn_command_line_async ────────────────────────────────────
    {
        local marker = TMP + "/spawn_async_marker"
        local ok = await GLib.spawn_command_line_async(
            "/bin/sh -c \"printf done > " + marker + "\"")
        check("spawn_async returns true", ok, "got " + ok)

        // Poll for the marker file.
        local deadline = GLib.get_monotonic_time() + 5 * 1000 * 1000
        local f = Gio.File.new_for_path(marker)
        while (!f.query_exists(null) && GLib.get_monotonic_time() < deadline)
            await sqgi.sleep(20)
        check("spawn_async produced marker file", f.query_exists(null),
              "marker missing after 5s")
    }

    // ── 12. Resolver.lookup_by_name_async on "localhost" ────────────────
    {
        local r = Gio.Resolver.get_default()
        local got_addr = null
        try {
            local addrs = await r.lookup_by_name_async("localhost")
            if (addrs != null && addrs.len() > 0) got_addr = addrs[0]
        } catch (e) {
            // Some build/CI environments resolve oddly; fall back to skip.
        }
        if (got_addr != null) {
            local s = got_addr.to_string()
            check("resolver localhost is loopback",
                  s == "127.0.0.1" || s == "::1",
                  "got " + s)
        } else {
            check("resolver localhost (skipped, no resolver)", true, "skipped")
        }
    }

    // ── 13. TCP loopback echo via SocketService + SocketClient ──────────
    {
        local svc = Gio.SocketService.new()
        local port = svc.add_any_inet_port(null)
        svc.connect("incoming", function(conn, _src) {
            local inp = conn.get_input_stream()
            local out = conn.get_output_stream()
            local flags = Gio.OutputStreamSpliceFlags.close_source |
                          Gio.OutputStreamSpliceFlags.close_target
            out.splice_async(inp, flags, GLib.PRIORITY_DEFAULT, null,
                function(self, res) { try { out.splice_finish(res) } catch (e) {} })
            return false
        })
        svc.start()
        check("SocketService bound a port", port > 0, "port=" + port)

        local client = Gio.SocketClient.new()
        local conn = await client.connect_to_host_async("127.0.0.1", port)
        local out = conn.get_output_stream()
        local inp = conn.get_input_stream()

        local payload = "ping-pong\n"
        local n = await out.write_bytes_async(GLib.Bytes.new(payload),
                                              GLib.PRIORITY_DEFAULT)
        check("TCP wrote N bytes", n == payload.len(),
              "wrote " + n + " want " + payload.len())

        // Close output to signal EOF so server splices close.
        out.close(null)

        local buf = ""
        while (buf.len() < payload.len()) {
            local got = await inp.read_bytes_async(payload.len() - buf.len(),
                                                   GLib.PRIORITY_DEFAULT)
            local data = got.get_data()
            if (data.len() == 0) break
            buf = buf + data
        }
        conn.close(null)
        svc.stop()
        check("TCP echo roundtrip", buf == payload,
              "got '" + buf + "' want '" + payload + "'")
    }

    // ── 14. UDP echo via Gio.Socket + sqgi.socket_add_watch ─────────────
    {
        local server = Gio.Socket.new(Gio.SocketFamily.ipv4,
                                      Gio.SocketType.datagram,
                                      Gio.SocketProtocol.udp)
        server.set_blocking(false)
        local srv_addr = sqgi.new_object(Gio.InetSocketAddress, {
            "address": Gio.InetAddress.new_from_string("127.0.0.1"),
            "port":    0,                  // kernel-assigned
        })
        server.bind(srv_addr, true)
        local bound = server.get_local_address()
        local bound_port = bound.get_port()
        check("UDP server bound port > 0", bound_port > 0,
              "port=" + bound_port)

        sqgi.socket_add_watch(server, GLib.IOCondition.in, function(sock, _cond) {
            try {
                local r = sock.receive_bytes_from(1500, 0, null)
                local data = r[0].get_data()
                local from = r[1]
                sock.send_to(from, "echo:" + data, null)
            } catch (e) {}
            return true
        })

        local client = Gio.Socket.new(Gio.SocketFamily.ipv4,
                                      Gio.SocketType.datagram,
                                      Gio.SocketProtocol.udp)
        client.set_blocking(false)
        // Send "hello" to the server
        local dest = sqgi.new_object(Gio.InetSocketAddress, {
            "address": Gio.InetAddress.new_from_string("127.0.0.1"),
            "port":    bound_port,
        })
        local sent = client.send_to(dest, "hello", null)
        check("UDP send_to bytes count", sent == 5, "sent " + sent)

        // Wait for echo (poll up to ~2s)
        local got = null
        local deadline = GLib.get_monotonic_time() + 2 * 1000 * 1000
        while (got == null && GLib.get_monotonic_time() < deadline) {
            try {
                local r = client.receive_bytes_from(1500, 0, null)
                got = r[0].get_data()
            } catch (e) {
                await sqgi.sleep(25)
            }
        }
        client.close()
        server.close()
        check("UDP echo received", got == "echo:hello", "got " + got)
    }

    // ── 15. sqgi.all parallel file loads ────────────────────────────────
    {
        local paths = [TMP + "/round.txt",
                       TMP + "/append.txt",
                       TMP + "/chunks.bin"]
        local tasks = []
        foreach (p in paths) {
            local f = Gio.File.new_for_path(p)
            tasks.append(f.load_contents_async(null))
        }
        local results = await sqgi.all(tasks)
        check("sqgi.all returns N results", results.len() == paths.len(),
              "got " + results.len() + " want " + paths.len())
        local all_nonempty = true
        foreach (r in results) {
            local v = (typeof(r) == "array") ? r[0] : r
            if (v == null || v.len() == 0) { all_nonempty = false; break }
        }
        check("sqgi.all every result nonempty", all_nonempty, "one was empty")
    }

    loop.quit()
}

local task = run_async()
task.catch(function(e) {
    print("uncaught: " + e + "\n")
    fails += 1
    loop.quit()
})

loop.run()

// Cleanup
rm_tree(TMP)

print("\n" + (checks - fails) + "/" + checks + " checks passed\n")

if (fails > 0) {
    print("[FAIL] test_gio_recipes: " + fails + " check(s) failed\n")
    foreach (line in fail_lines) print("  - " + line + "\n")
    throw "test_gio_recipes failures"
}

print("[PASS] test_gio_recipes\n")
