// Run from the repository root. Measures warm calls; conversion is separate.
local start = clock();
local m = sqgi.kernel.compile(@"
export void transform(in f64 input[1024], inout f64 output[1024], i64 count, f64 scale) {
    require(count >= 0 && count <= 1024);
    for (i64 i = 0; i < count; i += 1) { output[i] = input[i] * scale + 1.0; }
}");
local compile_ms = (clock() - start) * 1000.0;
local input = m.array("f64", 1024), output = m.array("f64", 1024);
local a = array(1024, 0.0), b = array(1024, 0.0);
for (local i = 0; i < 1024; i++) a[i] = i.tofloat();
start = clock();
for (local i = 0; i < 1024; i++) input.set(i, a[i]);
local conversion_ms = (clock() - start) * 1000.0;
function squirrel_transform(a, b, count, scale) {
    for (local i = 0; i < count; i++) b[i] = a[i] * scale + 1.0;
}
local repeats = 3000;
start = clock();
for (local i = 0; i < repeats; i++) m.transform(input, output, 1024, 1.5);
local native_ms = (clock() - start) * 1000.0;
start = clock();
for (local i = 0; i < repeats; i++) squirrel_transform(a, b, 1024, 1.5);
local squirrel_ms = (clock() - start) * 1000.0;
if (output.get(1023) != b[1023]) throw "benchmark result mismatch";
print(format("compile_ms=%.3f conversion_ms=%.3f kernel_ms=%.3f squirrel_ms=%.3f speedup=%.2f\n",
    compile_ms, conversion_ms, native_ms, squirrel_ms, squirrel_ms / native_ms));
