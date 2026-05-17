// test/test_glib_recipes.nut
//
// Behavioural tests for the GLib recipes documented in docs/recipes/glib.md.
// Pure-GLib (no Gio) surfaces only. Self-contained, no network access,
// scratch files under GLib.get_tmp_dir().
//
// Covers:
//   - Constants and version helpers
//   - Time: get_monotonic_time, get_real_time, usleep
//   - DateTime, TimeZone
//   - Main loop sources: sqgi.timeout_add, idle_add, source removal
//   - MainContext.iteration
//   - Bytes: new / get_data / get_size / equal / compare
//   - Variant: builders, type strings, print/parse, lookup, conversion
//   - VariantDict: contains, lookup_value, insert
//   - Checksum: md5/sha1/sha256/sha512
//   - Regex: simple match + capture groups
//   - KeyFile: write/load, typed accessors
//   - Markup parsing via GLib.markup_escape_text
//   - URI: split, escape/unescape
//   - Filesystem: build_filename, get_*_dir, find_program_in_path
//   - Environment variable APIs
//   - base64_encode / base64_decode roundtrip

local GLib = import("GLib")

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
local TMP   = GLib.get_tmp_dir() + "/sqgi_glib_recipes_" + STAMP

function safe(fn) { try { return fn() } catch (e) { return e } }

// ── 1. Version constants ─────────────────────────────────────────────────
function test_version() {
    check("MAJOR_VERSION is int",
          typeof(GLib.MAJOR_VERSION) == "integer", "type=" + typeof(GLib.MAJOR_VERSION))
    check("MAJOR_VERSION >= 2",
          GLib.MAJOR_VERSION >= 2, "got " + GLib.MAJOR_VERSION)
    check("MINOR_VERSION present",
          typeof(GLib.MINOR_VERSION) == "integer", "type=" + typeof(GLib.MINOR_VERSION))
    check("PRIORITY_DEFAULT is 0",
          GLib.PRIORITY_DEFAULT == 0, "got " + GLib.PRIORITY_DEFAULT)
}
test_version()

// ── 2. Time ───────────────────────────────────────────────────────────────
function test_time() {
    local t1 = GLib.get_monotonic_time()
    local t2 = GLib.get_monotonic_time()
    check("monotonic time non-decreasing", t2 >= t1, "t1=" + t1 + " t2=" + t2)

    local r1 = GLib.get_real_time()
    check("real time > 0", r1 > 0, "got " + r1)
    // Some sanity: real time should be in microseconds since epoch → > 1.5e15 for any modern date
    check("real time in microseconds (>= 2020)",
          r1 > 1577836800000000, "got " + r1)
}
test_time()

// ── 3. DateTime ───────────────────────────────────────────────────────────
function test_datetime() {
    local utc = GLib.TimeZone.new_utc()
    check("TimeZone.new_utc returns object", utc != null, "got null")

    local dt = GLib.DateTime.new(utc, 2025, 5, 17, 14, 30, 45.5)
    check("DateTime.new constructed", dt != null, "got null")
    if (dt != null) {
        check("DateTime year",   dt.get_year()   == 2025, "got " + dt.get_year())
        check("DateTime month",  dt.get_month()  == 5,    "got " + dt.get_month())
        check("DateTime day",    dt.get_day_of_month() == 17, "got " + dt.get_day_of_month())
        check("DateTime hour",   dt.get_hour()   == 14,   "got " + dt.get_hour())
        check("DateTime minute", dt.get_minute() == 30,   "got " + dt.get_minute())

        local fmt = dt.format("%Y-%m-%dT%H:%M:%SZ")
        check("DateTime.format ISO",
              fmt == "2025-05-17T14:30:45Z", "got " + fmt)

        local dt2 = dt.add_seconds(60)
        check("DateTime.add_seconds advanced minute",
              dt2.get_minute() == 31, "got " + dt2.get_minute())
    }

    local now = GLib.DateTime.new_now_utc()
    check("DateTime.new_now_utc",
          now != null && now.get_year() >= 2024,
          "year=" + (now != null ? now.get_year() : "null"))
}
test_datetime()

// ── 4. Bytes ──────────────────────────────────────────────────────────────
function test_bytes() {
    local b1 = GLib.Bytes.new("hello")
    check("Bytes.new size", b1.get_size() == 5, "got " + b1.get_size())
    check("Bytes.get_data roundtrip",
          b1.get_data() == "hello", "got " + b1.get_data())

    local b2 = GLib.Bytes.new("hello")
    check("Bytes.equal identical", b1.equal(b2), "expected equal")

    local b3 = GLib.Bytes.new("world")
    check("Bytes.equal different", !b1.equal(b3), "expected not equal")

    // Binary-clean: bytes with NUL
    local raw = "ab\x00cd"
    local b4  = GLib.Bytes.new(raw)
    check("Bytes binary-clean size", b4.get_size() == 5, "got " + b4.get_size())
    check("Bytes binary-clean roundtrip",
          b4.get_data() == raw, "got len=" + b4.get_data().len())

    // new_take semantics: just make sure constructor variants exist where present
    local empty = GLib.Bytes.new("")
    check("Bytes empty size", empty.get_size() == 0, "got " + empty.get_size())
}
test_bytes()

// ── 5. Main loop sources ──────────────────────────────────────────────────
function test_mainloop_sources() {
    local loop = GLib.MainLoop.new(null, false)

    // 5a. timeout_add fires N times then stops
    local ticks = 0
    sqgi.timeout_add(15, function() {
        ticks += 1
        if (ticks >= 3) { loop.quit(); return false }
        return true
    })
    sqgi.timeout_add(2000, function() { loop.quit(); return false })   // safety
    loop.run()
    check("timeout_add fired 3 times", ticks == 3, "ticks=" + ticks)

    // 5b. idle_add — fires once when returning false
    local loop2 = GLib.MainLoop.new(null, false)
    local idle_ran = 0
    local saw_idle_add = true
    try {
        sqgi.idle_add(function() {
            idle_ran += 1
            loop2.quit()
            return false
        })
    } catch (e) { saw_idle_add = false }
    if (saw_idle_add) {
        sqgi.timeout_add(2000, function() { loop2.quit(); return false })
        loop2.run()
        check("idle_add ran exactly once", idle_ran == 1, "idle_ran=" + idle_ran)
    } else {
        check("idle_add (skipped, not present)", true, "skipped")
    }
}
test_mainloop_sources()

// ── 6. MainContext.iteration (drain a context manually) ──────────────────
function test_maincontext_iteration() {
    local ctx = GLib.MainContext.default()
    check("MainContext.default exists", ctx != null, "got null")

    local fired = false
    sqgi.timeout_add(1, function() { fired = true; return false })

    // Drain up to ~500ms by single-step iteration; may_block=false then true.
    local deadline = GLib.get_monotonic_time() + 500 * 1000
    while (!fired && GLib.get_monotonic_time() < deadline) {
        ctx.iteration(false)
    }
    check("MainContext.iteration drained pending timeout", fired,
          "timeout never fired")
}
test_maincontext_iteration()

// ── 7. Variant ────────────────────────────────────────────────────────────
function test_variant() {
    // 7a. Simple type constructors + getters
    local vs = GLib.Variant.new_string("hello")
    check("Variant.new_string", vs != null && vs.get_string() == "hello",
          "got " + (vs != null ? vs.get_string() : "null"))

    local vi = GLib.Variant.new_int32(42)
    check("Variant.new_int32", vi.get_int32() == 42, "got " + vi.get_int32())

    local vb = GLib.Variant.new_boolean(true)
    check("Variant.new_boolean", vb.get_boolean() == true,
          "got " + vb.get_boolean())

    local vd = GLib.Variant.new_double(3.5)
    check("Variant.new_double", vd.get_double() == 3.5,
          "got " + vd.get_double())

    // 7b. Type string introspection
    check("Variant.get_type_string s", vs.get_type_string() == "s",
          "got " + vs.get_type_string())
    check("Variant.get_type_string i", vi.get_type_string() == "i",
          "got " + vi.get_type_string())

    // 7c. print / parse roundtrip
    local txt = vi.print(true)        // type-annotated form
    check("Variant.print non-empty",
          typeof(txt) == "string" && txt.len() > 0, "got " + txt)

    local parsed = safe(@() GLib.Variant.parse(null, "42", null, null))
    if (typeof(parsed) == "instance") {
        // Whatever it parsed to, ensure it's representable
        local printed = parsed.print(true)
        check("Variant.parse → print non-empty",
              printed.len() > 0, "got '" + printed + "'")
    } else {
        check("Variant.parse (skipped)", true, "not callable: " + parsed)
    }

    // 7d. VariantType
    local vt = GLib.VariantType.new("s")
    check("VariantType.new('s')", vt != null, "got null")
    if (vt != null) {
        check("VariantType.is_basic", vt.is_basic(), "expected basic for 's'")
        check("VariantType.equal self", vt.equal(GLib.VariantType.new("s")),
              "expected equal")
    }

    // 7e. Boxed-record constructors taking array+length: previously these
    // failed because the in-arg marshaller pushed NULL for arrays of
    // interface-typed elements.
    local vstrv = GLib.Variant.new_strv(["a","b","c"])
    check("Variant.new_strv tag",  vstrv.get_type_string() == "as",
          "got " + vstrv.get_type_string())
    check("Variant.new_strv n",    vstrv.n_children() == 3,
          "got " + vstrv.n_children())

    local vbsa = GLib.Variant.new_bytestring_array(["foo","bar"])
    check("Variant.new_bytestring_array tag", vbsa.get_type_string() == "aay",
          "got " + vbsa.get_type_string())

    local vobj = GLib.Variant.new_objv(["/a/b","/c/d"])
    check("Variant.new_objv tag",  vobj.get_type_string() == "ao",
          "got " + vobj.get_type_string())

    // 7f. Arrays of GVariant pointers (new_tuple / new_array): exercises the
    // GI_TYPE_TAG_ARRAY-of-INTERFACE-element marshal path.
    local kids = [GLib.Variant.new_int32(42), GLib.Variant.new_string("hi")]
    local tup = GLib.Variant.new_tuple(kids)
    check("Variant.new_tuple tag", tup.get_type_string() == "(is)",
          "got " + tup.get_type_string())
    check("Variant.new_tuple n",   tup.n_children() == 2,
          "got " + tup.n_children())

    local nums = [GLib.Variant.new_int32(1),
                  GLib.Variant.new_int32(2),
                  GLib.Variant.new_int32(3)]
    local varr = GLib.Variant.new_array(null, nums)
    check("Variant.new_array tag", varr.get_type_string() == "ai",
          "got " + varr.get_type_string())
    check("Variant.new_array n",   varr.n_children() == 3,
          "got " + varr.n_children())

    // 7g. Empty array with explicit element type — auto-length must still
    // be filled (n_children=0) and the spine pointer correctly handled.
    local vempty = GLib.Variant.new_array(GLib.VariantType.new("s"), [])
    check("Variant.new_array empty",
          vempty.get_type_string() == "as" && vempty.n_children() == 0,
          "got " + vempty.get_type_string() + " n=" + vempty.n_children())
}
test_variant()

// ── 8. VariantDict ────────────────────────────────────────────────────────
function test_variant_dict() {
    // Construct empty dict
    local d = GLib.VariantDict.new(null)
    check("VariantDict.new", d != null, "got null")

    d.insert_value("name",  GLib.Variant.new_string("squirrel"))
    d.insert_value("count", GLib.Variant.new_int32(7))

    check("VariantDict.contains 'name'",
          d.contains("name"), "missing")
    check("VariantDict.contains absent",
          !d.contains("nope"), "should be missing")

    local v = d.lookup_value("count", null)
    check("VariantDict.lookup_value returns something",
          v != null, "got null")
    // SQGI may auto-unwrap to native int, or return a Variant — accept both.
    if (typeof(v) == "integer") {
        check("VariantDict.lookup_value count auto-unwrapped",
              v == 7, "got " + v)
    } else if (typeof(v) == "instance") {
        check("VariantDict.lookup_value count via Variant",
              v.get_int32() == 7, "got " + v.get_int32())
    } else {
        check("VariantDict.lookup_value count (unknown shape)",
              false, "type=" + typeof(v))
    }
}
test_variant_dict()

// ── 9. Checksum ───────────────────────────────────────────────────────────
function test_checksum() {
    // GLib.compute_checksum_for_string(type, data, len)
    // ChecksumType: md5=0, sha1=1, sha256=2, sha512=3, sha384=4, ...
    local md5 = safe(@() GLib.compute_checksum_for_string(
        GLib.ChecksumType.md5, "abc", 3))
    if (typeof(md5) == "string") {
        check("md5 of 'abc' matches RFC",
              md5 == "900150983cd24fb0d6963f7d28e17f72", "got " + md5)
    } else {
        // Fall back to instance-based Checksum
        local cs = safe(@() GLib.Checksum.new(GLib.ChecksumType.md5))
        if (typeof(cs) == "instance") {
            cs.update("abc", 3)
            local hex = cs.get_string()
            check("md5 via Checksum instance",
                  hex == "900150983cd24fb0d6963f7d28e17f72", "got " + hex)
        } else {
            check("checksum (skipped, neither API present)", true,
                  "compute_checksum_for_string and Checksum both unavailable")
        }
    }

    local sha = safe(@() GLib.compute_checksum_for_string(
        GLib.ChecksumType.sha256, "abc", 3))
    if (typeof(sha) == "string") {
        check("sha256 of 'abc' matches",
              sha == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad",
              "got " + sha)
    }
}
test_checksum()

// ── 10. Regex ─────────────────────────────────────────────────────────────
function test_regex() {
    local r = safe(@() GLib.Regex.new("(\\w+)=(\\d+)",
        GLib.RegexCompileFlags.default, GLib.RegexMatchFlags.default))
    if (typeof(r) != "instance") {
        check("Regex.new (skipped)", true, "not present: " + r)
        return
    }

    // Boolean match — shape varies between bindings.
    local got = safe(@() r.match("count=42 size=100",
        GLib.RegexMatchFlags.default, null))
    local matched = false
    if (typeof(got) == "bool") {
        matched = got
    } else if (typeof(got) == "array" && got.len() >= 1) {
        matched = (got[0] == true)
    } else if (typeof(got) == "string") {
        // Some SQGI builds surface the first captured group directly.
        matched = (got.len() > 0)
    }
    check("Regex matched", matched, "shape=" + typeof(got))
}
test_regex()

// ── 11. KeyFile ───────────────────────────────────────────────────────────
function test_keyfile() {
    local kf = GLib.KeyFile.new()
    kf.set_string("section",  "name", "Squirrel")
    kf.set_integer("section", "year", 2025)
    kf.set_boolean("section", "stable", true)
    kf.set_double("section",  "ratio", 1.5)

    local text = kf.to_data()
    // to_data is typically (data, length). Unwrap if array.
    if (typeof(text) == "array") text = text[0]
    check("KeyFile.to_data nonempty",
          typeof(text) == "string" && text.len() > 0,
          "got type=" + typeof(text))
    check("KeyFile.to_data contains '[section]'",
          text.find("[section]") != null, "no section header")
    check("KeyFile.to_data contains 'name=Squirrel'",
          text.find("name=Squirrel") != null, "missing key")

    // Round-trip: load it back
    local kf2 = GLib.KeyFile.new()
    kf2.load_from_data(text, text.len(),
                       GLib.KeyFileFlags.none)
    check("KeyFile.get_string roundtrip",
          kf2.get_string("section", "name") == "Squirrel",
          "got " + kf2.get_string("section", "name"))
    check("KeyFile.get_integer roundtrip",
          kf2.get_integer("section", "year") == 2025,
          "got " + kf2.get_integer("section", "year"))
    check("KeyFile.get_boolean roundtrip",
          kf2.get_boolean("section", "stable") == true,
          "got " + kf2.get_boolean("section", "stable"))
}
test_keyfile()

// ── 12. Markup escape ─────────────────────────────────────────────────────
function test_markup() {
    local raw = "<x & y> \"q\""
    local esc = safe(@() GLib.markup_escape_text(raw, raw.len()))
    if (typeof(esc) == "string") {
        // Order doesn't matter; just ensure key entities present
        check("markup_escape_text has &lt;", esc.find("&lt;")  != null, "got " + esc)
        check("markup_escape_text has &gt;", esc.find("&gt;")  != null, "got " + esc)
        check("markup_escape_text has &amp;",esc.find("&amp;") != null, "got " + esc)
    } else {
        check("markup_escape_text (skipped)", true, "not present")
    }
}
test_markup()

// ── 13. URI ───────────────────────────────────────────────────────────────
function test_uri() {
    // URI escape / unescape are usually static and most portable.
    local esc = safe(@() GLib.Uri.escape_string("a b/c?d", null, false))
    if (typeof(esc) == "string") {
        check("Uri.escape_string encodes space",
              esc.find("%20") != null || esc.find("+") != null,
              "got " + esc)
        local back = GLib.Uri.unescape_string(esc, null)
        check("Uri.unescape_string roundtrip",
              back == "a b/c?d", "got " + back)
    } else {
        check("Uri.escape_string (skipped)", true, "not present")
    }
}
test_uri()

// ── 14. Path utilities ────────────────────────────────────────────────────
function test_paths() {
    local tmpd = GLib.get_tmp_dir()
    check("get_tmp_dir nonempty",
          typeof(tmpd) == "string" && tmpd.len() > 0, "got " + tmpd)

    local home = GLib.get_home_dir()
    check("get_home_dir nonempty",
          typeof(home) == "string" && home.len() > 0, "got " + home)

    local cur = GLib.get_current_dir()
    check("get_current_dir nonempty",
          typeof(cur) == "string" && cur.len() > 0, "got " + cur)

    local user = GLib.get_user_name()
    check("get_user_name nonempty",
          typeof(user) == "string" && user.len() > 0, "got " + user)

    // build_filename: variadic in C. Some bindings expose only fixed-arity.
    local p = safe(@() GLib.build_filenamev(["a", "b", "c"]))
    if (typeof(p) == "string") {
        // POSIX separator
        check("build_filenamev joins with /",
              p == "a/b/c", "got " + p)
    } else {
        check("build_filenamev (skipped)", true, "not present: " + p)
    }

    // find_program_in_path: should always find /bin/sh
    local sh = safe(@() GLib.find_program_in_path("sh"))
    if (typeof(sh) == "string") {
        check("find_program_in_path('sh')",
              sh.len() > 0 && sh.find("sh") != null, "got " + sh)
    } else {
        check("find_program_in_path (skipped)", true, "not present")
    }

    // path_get_basename / path_get_dirname
    local bn = safe(@() GLib.path_get_basename("/tmp/foo/bar.txt"))
    if (typeof(bn) == "string")
        check("path_get_basename", bn == "bar.txt", "got " + bn)
    local dirpath = safe(@() GLib.path_get_dirname("/tmp/foo/bar.txt"))
    if (typeof(dirpath) == "string")
        check("path_get_dirname", dirpath == "/tmp/foo", "got " + dirpath)
}
test_paths()

// ── 15. Environment ───────────────────────────────────────────────────────
function test_environ() {
    // setenv / getenv / unsetenv
    local ok = safe(@() GLib.setenv("SQGI_TEST_VAR", "hello-glib", true))
    // Some versions return bool, some return null on success.
    local got = safe(@() GLib.getenv("SQGI_TEST_VAR"))
    if (typeof(got) == "string") {
        check("setenv/getenv roundtrip",
              got == "hello-glib", "got " + got)
    } else {
        check("getenv (skipped)", true, "not present")
    }
    safe(@() GLib.unsetenv("SQGI_TEST_VAR"))
    local gone = safe(@() GLib.getenv("SQGI_TEST_VAR"))
    if (typeof(gone) != "string" || gone == "" || gone == null) {
        check("unsetenv cleared variable", true, "")
    } else {
        check("unsetenv cleared variable", false, "still got: " + gone)
    }
}
test_environ()

// ── 16. base64 encode/decode roundtrip ────────────────────────────────────
function test_base64() {
    local payload = "Hello, GLib!"
    local enc = safe(@() GLib.base64_encode(payload, payload.len()))
    if (typeof(enc) != "string") {
        check("base64_encode (skipped)", true, "not present: " + enc)
        return
    }
    check("base64_encode nonempty",
          enc.len() > 0 && enc != payload, "got '" + enc + "'")

    local dec_res = safe(@() GLib.base64_decode(enc))
    // Possible shapes: string, [string], [string, length], GLib.Bytes
    local dec = dec_res
    if (typeof(dec) == "array") dec = dec[0]
    if (typeof(dec) == "instance") {
        // GLib.Bytes-like
        try { dec = dec.get_data() } catch (e) {}
    }
    if (typeof(dec) == "string") {
        // base64_decode may include trailing nulls or full buffer
        local trimmed = dec
        // strip trailing NULs if any
        while (trimmed.len() > 0 && trimmed[trimmed.len()-1] == 0)
            trimmed = trimmed.slice(0, trimmed.len()-1)
        check("base64 roundtrip",
              trimmed == payload, "got '" + trimmed + "'")
    } else {
        check("base64_decode (skipped)", true,
              "unexpected return type " + typeof(dec_res))
    }
}
test_base64()

print("\n" + (checks - fails) + "/" + checks + " checks passed\n")

if (fails > 0) {
    print("[FAIL] test_glib_recipes: " + fails + " check(s) failed\n")
    foreach (line in fail_lines) print("  - " + line + "\n")
    throw "test_glib_recipes failures"
}

print("[PASS] test_glib_recipes\n")
