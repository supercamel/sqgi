// Untimed diagnostic: isolate kernel-call loops from setup/validation loops.
// Run with SQGI_JIT=1 SQGI_JIT_TRACE=stats (or 1 for full trace).
local m=sqgi.kernel.load("demo/kernels/compiled_workflow.sqk");
function kernel_call_driver(module,repeats) {
    local sum=0.0;
    for(local i=0;i<repeats;i++)sum+=module.simulate(16,0.125);
    return sum;
}
function native_method_driver(body,repeats) {
    local sum=0.0;
    for(local i=0;i<repeats;i++)sum+=body.advance(0.125);
    return sum;
}
local result=kernel_call_driver(m,10000),expected=0.0;
for(local i=0;i<10000;i++)expected+=m.simulate(16,0.125);
if(result!=expected)throw "kernel call probe mismatch";
local body=m.Oscillator();body.position=1.0;
result=native_method_driver(body,10000);
body.position=1.0;body.velocity=0.0;expected=0.0;
for(local i=0;i<10000;i++)expected+=body.advance(0.125);
if(result!=expected)throw "method call probe mismatch";
print("kernel call probe passed\n");
