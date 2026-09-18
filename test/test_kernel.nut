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
export void once(inout i64 a[4]) { a[0] += 1; a[4] = 7; }
export void spin() { while (true) { i64 x = 0; } }
", "integration.sqk");
check(numbers.add(20, 22) == 42, "scalar integer boundary");
check(numbers.invert(true) == false, "Boolean boundary");
check(numbers.invert(false) == true, "false Boolean boundary");
fails(function(){numbers.invert(1);},"expected bool");
fails(function(){numbers.add(true,1);},"expected i64");
fails(function(){numbers.add(1.0,1);},"expected i64");
fails(function(){numbers.add(null,1);},"expected i64");
local a = numbers.array("i64", 4);
a.set(0, 21);
check(numbers.same(a, a) == 42, "read-only alias permitted");
fails(function() { numbers.broken(a); }, "out of bounds");
check(a.get(0) == 42, "error preserves preceding writes without replay");
fails(function(){numbers.once(a);},"out of bounds");
check(a.get(0)==43,"leaf error writes exactly once");
local bound_add=numbers.add.bindenv({});
check(bound_add(20,22)==42,"bound kernel uses ordinary native frame");
local bound_once=numbers.once.bindenv({});
fails(function(){bound_once(a);},"out of bounds");
check(a.get(0)==44,"ordinary frame error writes exactly once");
local debug_calls=0;setdebughook(function(event,source,line,name){debug_calls++;});
check(numbers.add(20,22)==42,"kernel works under debug hook");
setdebughook(null);check(debug_calls>0,"debug hook ran");
fails(function() { numbers.spin(); }, "budget exceeded");
fails(function() { sqgi.kernel.compile("export i64 f() { return 1.0; }", "bad.sqk"); }, "bad.sqk:1:");
fails(function() { sqgi.kernel.load("test/kernel/does-not-exist.sqk"); }, "cannot open");
for (local i = 0; i < 50; i++) {
    local m = sqgi.kernel.compile("export i64 f(i64 x) { return x * 3; }");
    check(m.f(i) == i * 3, "repeated module creation");
}
// Exercise the full marshalling capacity, including the final argument and
// alias checks in both directions. Rejections must precede native execution.
local scalar_params="",read_params="",write_last_params="",write_first_params="";
for(local i=0;i<32;i++) {
    local comma=i==0?"":", ",name="a"+i;
    scalar_params+=comma+"i64 "+name;
    read_params+=comma+"in i64 "+name+"[1]";
    write_last_params+=comma+(i==31?"inout":"in")+" i64 "+name+"[1]";
    write_first_params+=comma+(i==0?"inout":"in")+" i64 "+name+"[1]";
}
local wide=sqgi.kernel.compile("export i64 scalars("+scalar_params+") { return a0 + a31; }\n"+
    "export i64 reads("+read_params+") { return a0[0] + a31[0]; }\n"+
    "export void last("+write_last_params+") { a31[0] = 99; }\n"+
    "export void first("+write_first_params+") { a0[0] = 99; }");
local scalar_args=[wide],buffer_args=[wide],shared=wide.array("i64",1),distinct=wide.array("i64",1);
shared.set(0,7);distinct.set(0,11);
for(local i=0;i<32;i++){scalar_args.append(i);buffer_args.append(shared);}
check(wide.scalars.acall(scalar_args)==31,"32 scalar arguments");
check(wide.reads.acall(buffer_args)==14,"32 read-only aliases");
fails(function(){wide.last.acall(buffer_args);},"overlapping");
fails(function(){wide.first.acall(buffer_args);},"overlapping");
check(shared.get(0)==7,"alias rejection has no native effects");
buffer_args[32]=distinct;wide.last.acall(buffer_args);
check(distinct.get(0)==99&&shared.get(0)==7,"last writable argument marshalled");
scalar_args[32]=31.0;
fails(function(){wide.scalars.acall(scalar_args);},"expected i64");
scalar_args.append(0);
fails(function(){wide.scalars.acall(scalar_args);},"argument count");
fails(function(){sqgi.kernel.compile("export i64 too_many("+scalar_params+", i64 extra) { return extra; }");},"parameter limit");
local long_type="RecordNameLongerThanSmallStringStorage";
local records=sqgi.kernel.compile("struct "+long_type+" { f64 x; }; struct DifferentRecord { f64 x; };\n"+
    "export f64 read(in "+long_type+" a[1]) { return a[0].x; }");
local record_buffer=records.array(long_type,1);record_buffer.set(0,{x=42.0});
check(records.read(record_buffer)==42.0,"long record schema name");
fails(function(){records.read(records.array("DifferentRecord",1));},"schema/extent mismatch");
collectgarbage();
print("kernel Squirrel integration tests passed\n");
