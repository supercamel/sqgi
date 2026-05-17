/**
 * demo/gio/run.nut
 *
 * Spawn a child process and capture its output via temp files.
 *
 * Includes both sync and async variants so behavior can be compared directly.
 *
 * Usage:
 *   sqgi demo/gio/run.nut [--sync|--async|--both] [SHELL-COMMAND]
 *
 * Exercises:
 *   - GLib.spawn_command_line_sync (blocking variant)
 *   - await GLib.spawn_command_line_async (non-blocking launch variant)
 *   - Gio.File.load_contents (reading captured outputs)
 *   - sqgi.sleep polling to await async completion marker
 *
 * This demo intentionally uses shell redirection to show wait-status decoding
 * and deterministic stdout/stderr capture as regular files.
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local mode = "both"
local cmd_parts = []
foreach (a in vargv) {
    if (a == "--sync") mode = "sync"
    else if (a == "--async") mode = "async"
    else if (a == "--both") mode = "both"
    else if (a == "--help" || a == "-h") {
        print("Usage: sqgi demo/gio/run.nut [--sync|--async|--both] [SHELL-COMMAND]\n")
        return
    } else {
        cmd_parts.append(a)
    }
}

local user_cmd = (cmd_parts.len() > 0)
    ? " ".join(cmd_parts)
    : "echo hello from child; echo something wrong >&2; exit 3"

function read_file(p) {
    local f = Gio.File.new_for_path(p)
    local r = f.load_contents(null)
    return (typeof(r) == "array") ? r[0] : r
}

function maybe_delete(p) {
    local f = Gio.File.new_for_path(p)
    if (f.query_exists(null)) f.delete(null)
}

function print_result(tag, status, out_path, err_path) {
    print("\n== " + tag + " ==\n")
    print(format("wait_status=0x%x\n", status))
    print("--- stdout ---\n" + read_file(out_path))
    print("--- stderr ---\n" + read_file(err_path))

    if ((status & 0x7F) == 0)
        print(format("--- exit status: %d ---\n", (status >> 8) & 0xFF))
    else
        print(format("--- killed by signal %d ---\n", status & 0x7F))
}

function run_sync_once(cmd, stamp) {
    local out_path = "/tmp/sqgi_run_out.sync." + stamp
    local err_path = "/tmp/sqgi_run_err.sync." + stamp
    local shell_script = "( " + cmd + " ) >" + out_path + " 2>" + err_path
    local cmdline = "/bin/sh -c \"" + shell_script + "\""

    print("[sync] running: " + cmdline + "\n")
    local res = GLib.spawn_command_line_sync(cmdline)
    local status = res[2]

    print_result("sync", status, out_path, err_path)
    maybe_delete(out_path)
    maybe_delete(err_path)
}

async function wait_for_file(path, timeout_ms) {
    local deadline_us = GLib.get_monotonic_time() + timeout_ms * 1000
    local f = Gio.File.new_for_path(path)
    while (GLib.get_monotonic_time() < deadline_us) {
        if (f.query_exists(null)) return true
        await sqgi.sleep(15)
    }
    return f.query_exists(null)
}

async function run_async_once(cmd, stamp) {
    local out_path = "/tmp/sqgi_run_out.async." + stamp
    local err_path = "/tmp/sqgi_run_err.async." + stamp
    local st_path  = "/tmp/sqgi_run_status.async." + stamp

    // Write wait-status to st_path when child shell command completes.
    local shell_script = "( " + cmd + " ) >" + out_path + " 2>" + err_path +
                         "; printf '%d' $? >" + st_path
    local cmdline = "/bin/sh -c \"" + shell_script + "\""

    print("[async] launching: " + cmdline + "\n")
    local ok = await GLib.spawn_command_line_async(cmdline)
    if (!ok) throw "spawn_command_line_async returned false"

    if (!await wait_for_file(st_path, 10000))
        throw "timed out waiting for async status file"

    local exit_code = read_file(st_path).tointeger()
    local status = (exit_code & 0xFF) << 8
    print_result("async", status, out_path, err_path)

    maybe_delete(out_path)
    maybe_delete(err_path)
    maybe_delete(st_path)
}

local loop = GLib.MainLoop.new(null, false)

async function main() {
    local stamp = GLib.get_monotonic_time().tostring()
    if (mode == "sync" || mode == "both")
        run_sync_once(user_cmd, stamp)
    if (mode == "async" || mode == "both")
        await run_async_once(user_cmd, stamp)
}

main().then(@(_) loop.quit(),
            function(e) { ::print("error: " + e + "\n"); loop.quit() })
loop.run()
