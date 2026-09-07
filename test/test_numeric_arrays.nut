local GLib = import("GLib")
function check_equal(actual, expected) {
    if (actual.len() != expected.len()) throw "array length mismatch"
    foreach (i, value in expected) {
        if (actual[i] != value) throw "array element mismatch at " + i
    }
}
local key = GLib.KeyFile.new()
foreach (values in [[], [7], [1, -2, 3], [1, 2, 3, 4, 5, 6, 7]]) {
    key.set_integer_list("group", "ints", values)
    check_equal(key.get_integer_list("group", "ints"), values)
}
key.set_double_list("group", "doubles", [0.5, -1.25, 100.0])
check_equal(key.get_double_list("group", "doubles"), [0.5, -1.25, 100.0])
key.set_string_list("group", "strings", ["one", "two", "three", "four"])
check_equal(key.get_string_list("group", "strings"), ["one", "two", "three", "four"])
local env = GLib.environ_setenv(["SQGI_A=one"], "SQGI_B", "two", true)
check_equal(env, ["SQGI_A=one", "SQGI_B=two"])
print("test_numeric_arrays.nut passed\n")
