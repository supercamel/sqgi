function check(value, message) { if (!value) throw "FAIL: " + message; }
function fails(fn, text) {
    local message = null;
    try { fn(); } catch (e) { message = e.tostring(); }
    check(message != null && message.find(text) != null, "expected error: " + text + "; got " + message);
}
check(sqgi.kernel.available, "native backend available");
check(sqgi.kernel.backend == "llvm" || sqgi.kernel.backend == "native", "selected compiler backend");
local k = sqgi.kernel.load("test/kernel/geometry.sqk");
local input = k.array("Point", 8);
local output = k.array("Point", 8);
input.set(0, { x = 3.0, y = 4.0 });
input.set(1, { x = 1.0, y = 2.0 });
check(k.sum_squared(input, 2) == 30.0, "struct helper reduction");
k.transform(input, output, 2, 2.0);
check(output.get(0).x == 6.0 && output.get(0).y == 8.0, "native transform");
check(output.get(2).x == 0.0, "tail remains zero initialized");
fails(function() { k.transform(input, input, 2, 2.0); }, "overlapping");
fails(function() { k.transform(input, output, 9, 2.0); }, "require failed");
fails(function() { k.transform(input, output, 2, 2); }, "expected f64");
fails(function() { k.sum_squared(k.array("Point", 7), 2); }, "extent mismatch");
fails(function() { k.sum_squared(k.array("f64", 8), 2); }, "schema/extent mismatch");
fails(function() { k.sum_squared([], 2); }, "typed handle");
fails(function() { k.sum_squared(input); }, "argument count");
fails(function() { input.get(-1); }, "out of bounds");
fails(function() { input.set(8, { x=1.0, y=2.0 }); }, "out of bounds");
fails(function() { input.set(0, { x=999.0, y=2 }); }, "expected f64");
check(input.get(0).x == 3.0, "failed struct setter is atomic");
fails(function() { k.array("Point", -1); }, "allocation limit");
fails(function() { k.array("unknown", 8); }, "unknown array");
local other = sqgi.kernel.load("test/kernel/geometry.sqk");
fails(function() { other.sum_squared(input, 2); }, "schema/extent mismatch");
// Export closure and buffers keep code/schema alive without the module table.
local sum = k.sum_squared;
k = null;
collectgarbage();
check(sum(input, 2) == 30.0, "retained closure owns native module");
local numbers = sqgi.kernel.compile(@"
export i64 add(i64 x, i64 y) { return x + y; }
export bool invert(bool b) { return !b; }
export i64 same(in i64 a[4], in i64 b[4]) { return a[0] + b[0]; }
export void broken(inout i64 a[4]) { a[0] = 42; a[4] = 7; }
export void spin() { while (true) { i64 x = 0; } }
", "integration.sqk");
check(numbers.add(20, 22) == 42, "scalar integer boundary");
check(numbers.invert(true) == false, "Boolean boundary");
local a = numbers.array("i64", 4);
a.set(0, 21);
check(numbers.same(a, a) == 42, "read-only alias permitted");
fails(function() { numbers.broken(a); }, "out of bounds");
check(a.get(0) == 42, "error preserves preceding writes without replay");
fails(function() { numbers.spin(); }, "budget exceeded");
fails(function() { sqgi.kernel.compile("export i64 f() { return 1.0; }", "bad.sqk"); }, "bad.sqk:1:");
fails(function() { sqgi.kernel.load("test/kernel/does-not-exist.sqk"); }, "cannot open");
for (local i = 0; i < 50; i++) {
    local m = sqgi.kernel.compile("export i64 f(i64 x) { return x * 3; }");
    check(m.f(i) == i * 3, "repeated module creation");
}
collectgarbage();
print("kernel Squirrel integration tests passed\n");
