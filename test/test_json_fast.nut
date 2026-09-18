local J = sqgi.json
function check(ok, message) { if (!ok) throw message }
function fails(text) {
    local rejected = false
    try { sqgi.json.parse(text) } catch (e) { rejected = true }
    check(rejected, "accepted malformed JSON: " + text)
}
foreach (s in ["0", "-1", "9223372036854775807", "-9223372036854775808"]) {
    local v = J.parse(s)
    check(typeof v == "integer" && J.stringify(v) == s, "integer boundary: " + s)
}
foreach (s in ["-0.0", "0.1", "1.0", "1e3", "5e-324", "2.2250738585072014e-308",
               "1.7976931348623157e308", "9223372036854775808", "-9223372036854775809"]) {
    local v = J.parse(s)
    local copy = J.parse(J.stringify(v))
    check(typeof v == "float" && typeof copy == "float" && copy == v, "float boundary: " + s)
}
check(J.stringify(J.parse("-0.0")) == "-0.0", "negative zero")
check(J.parse("{\"key\":1,\"key\":2}").key == 2, "duplicate keys")
foreach (s in ["01", "-01", "1.", "1e", "1e+", "+1", ".5", "[1,]", "{\"a\":1,}", "\v0", "\f0"]) fails(s)
for (local n=0; n<80; ++n) {
    local prefix = ""
    for (local i=0;i<n;++i) prefix += "x"
    local value = prefix + "\"\\\n\t\r\b\f" + "\x00" + "é漢😀"
    check(J.parse(J.stringify(value)) == value, "escape boundary")
    check(J.parse(" \n\r\t" + J.stringify(prefix) + " \t\n") == prefix, "whitespace")
    fails("\"" + prefix)
    fails("\"" + prefix + "\\")
    fails("\"" + prefix + "\n\"")
}
class ReentrantJson {
    parent = null
    constructor(p) { parent = p }
    function _tojson() {
        // Remove the only parent reference and move the array's backing store.
        parent.clear()
        for (local i=0;i<1024;++i) parent.append(i)
        collectgarbage()
        local nested = sqgi.json.parse(sqgi.json.stringify({alive=true}))
        return {answer=42, alive=nested.alive}
    }
}
local parent = []
parent.append(ReentrantJson(parent))
local result = J.parse(J.stringify(parent))
check(result.len() == 1 && result[0].answer == 42 && result[0].alive, "callback rooting/reentry")
class BadJson { function _tojson() { throw "expected failure" } }
local caught = false
try { J.stringify([BadJson()]) } catch (e) { caught = true }
check(caught && J.stringify([1,2]) == "[1,2]", "error recovery")
print("JSON fast-path integration passed\n")
