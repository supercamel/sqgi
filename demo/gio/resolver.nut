/**
 * demo/gio/resolver.nut
 *
 * Async DNS resolution via Gio.Resolver. Resolves several names in parallel
 * with sqgi.all, prints addresses, then does a reverse lookup on each.
 *
 * Usage:
 *   sqgi demo/gio/resolver.nut [HOST...]
 *
 * Exercises:
 *   - Gio.Resolver.get_default + lookup_by_name_async / _finish
 *   - sqgi.all to fan out multiple async lookups in parallel
 *   - lookup_by_address_async for reverse lookups
 *   - GInetAddress.to_string formatting
 */

local GLib = import("GLib")
local Gio  = import("Gio")

local hosts = (vargv.len() > 0) ? vargv : ["example.com", "iana.org", "localhost"]

local loop = GLib.MainLoop.new(null, false)
local r    = Gio.Resolver.get_default()

async function resolve_one(name) {
    local addrs = await r.lookup_by_name_async(name)
    return [name, addrs]
}

async function reverse(addr) {
    try {
        local name = await r.lookup_by_address_async(addr)
        return name
    } catch (e) {
        return "(reverse failed: " + e + ")"
    }
}

async function run() {
    local tasks = []
    foreach (h in hosts) tasks.append(resolve_one(h))
    local results = await sqgi.all(tasks)
    foreach (r2 in results) {
        local name  = r2[0]
        local addrs = r2[1]
        print(name + ":\n")
        foreach (a in addrs) {
            local rev = await reverse(a)
            print(format("  %-40s  rev=%s\n", a.to_string(), rev))
        }
    }
}

run().then(@(_) loop.quit(),
           function(e) { ::print("error: " + e + "\n"); loop.quit() })
sqgi.timeout_add(15000, function() { print("deadline\n"); loop.quit(); return false })
loop.run()
