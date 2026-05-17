// test/test_gerror.nut
//
// Verifies that GError values surfaced from GI calls arrive as instances of
// sqgi.GError with structured {domain, code, message} fields, and that
// catch blocks can branch on them.

local Gio = import("Gio")
local GLib = import("GLib")

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

// ── 1. sqgi.GError class is exposed and constructible ──────────────────────
{
    check("GError" in sqgi, "sqgi.GError should exist")
    local e = sqgi.GError("test-domain", 42, "hello")
    check(e.domain == "test-domain", "domain field; got: " + e.domain)
    check(e.code == 42, "code field; got: " + e.code)
    check(e.message == "hello", "message field; got: " + e.message)

    local s = e.tostring()
    check(s == "test-domain:42: hello", "_tostring format; got: " + s)
}

// ── 2. GError thrown from a failing GI call carries structured fields ─────
//
// g_file_get_contents on a missing path raises G_FILE_ERROR / G_FILE_ERROR_NOENT.
{
    local f = Gio.File.new_for_path("/this/path/does/not/exist/sqgi-test")
    local caught = null
    try {
        f.load_contents(null)   // throws GError on failure
    } catch (e) {
        caught = e
    }
    check(caught != null, "load_contents on missing path should throw")
    check(typeof caught == "instance",
          "thrown error should be an instance, got: " + typeof caught)
    check(caught instanceof sqgi.GError,
          "thrown error should be a sqgi.GError instance")
    check(typeof caught.domain == "string" && caught.domain.len() > 0,
          "GError.domain should be a non-empty string; got: " + caught.domain)
    check(typeof caught.code == "integer",
          "GError.code should be integer; got: " + typeof caught.code)
    check(typeof caught.message == "string" && caught.message.len() > 0,
          "GError.message should be non-empty; got: " + caught.message)
}

// ── 3. Branching on domain works for retry-style logic ────────────────────
{
    local f = Gio.File.new_for_path("/this/also/missing")
    local handled_by_domain = false
    try {
        f.load_contents(null)
    } catch (e) {
        if (e instanceof sqgi.GError && e.domain == "g-io-error-quark") {
            handled_by_domain = true
        } else if (e instanceof sqgi.GError && e.domain == "g-file-error") {
            handled_by_domain = true
        }
    }
    check(handled_by_domain,
          "should match either g-io-error-quark or g-file-error domain")
}

// ── 4. Unknown-namespace load throws a GError too ─────────────────────────
{
    local caught = null
    try {
        import("ThisNamespaceDoesNotExistAnywhere")
    } catch (e) {
        caught = e
    }
    check(caught != null, "loading nonexistent namespace should throw")
    // Namespace load failures come back via the repository, which throws a
    // GError. Don't assert exact domain — implementations vary across
    // gobject-introspection versions — just check structure.
    check(caught instanceof sqgi.GError,
          "namespace load failure should be a sqgi.GError; got: " +
          typeof caught + " " + caught)
}

print("[OK] test_gerror passed\n")
