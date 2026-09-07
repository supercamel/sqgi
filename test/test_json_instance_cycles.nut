class SelfJson { function _tojson() { return this } }
class LinkJson {
    next = null
    function _tojson() { return next }
}
local a = LinkJson()
local b = LinkJson()
a.next = b
b.next = a
foreach (value in [SelfJson(), a]) {
    local caught = false
    try { sqgi.json.stringify(value) }
    catch (e) { caught = e.find("nesting too deep") != null }
    if (!caught) throw "cyclic _tojson did not raise a bounded error"
}
class ValidJson { function _tojson() { return {value = 42} } }
if (sqgi.json.parse(sqgi.json.stringify(ValidJson())).value != 42)
    throw "valid _tojson stopped working"
print("test_json_instance_cycles.nut passed\n")
