local G=import("GLib"),D=import("demo/kernels/support.nut");
local started=G.get_monotonic_time(),m=D.load("math"),compile_us=G.get_monotonic_time()-started;
function intrinsic_reference(n) {
    local total = 0.0

    for (local i = 0; i < n; i++) {
        local x = ((i % 97) + 1).tofloat()
        total += sqrt(x) + sin(0.0) + cos(0.0)
        total += fabs(-3.5) + floor(1.75) + ceil(1.25)
        total += pow(1.0001, (i % 5).tofloat())
    }

    return total
}

// All arguments vary, so this also measures actual transcendental work.
function variable_reference(n) {
    local total = 0.0
    for (local i = 0; i < n; i++) {
        local x = ((i % 97) + 1).tofloat() * 0.01
        total += sqrt(x) + sin(x) + cos(x) + log(x) + atan2(x, 0.75) + pow(x, 1.125)
    }
    return total
}


function near(actual,expected,label) {
    if(!(fabs(actual-expected)<=1.0e-12*(1.0+fabs(expected)))) throw "math kernel: "+label;
}
local cases=[
    ["math_intrinsic",intrinsic_reference,function(n){return m.constant_workload(n);}],
    ["math_variable",variable_reference,function(n){return m.variable_workload(n);}]
];
foreach(c in cases) {
    foreach(n in [0,1,2,4,5,6,79,80,96,97,98,255,1024]) near(c[2](n),c[1](n),c[0]+" prefix "+n);
    local failed=false;try{c[2](-1);}catch(e){failed=e.tostring().find("require failed")!=null;}
    D.check(failed,"negative trip count");
    near(c[2](80),c[1](80),"fresh state after failure");
}
local iterations=80000,warmups=5,bench=false,reverse=false;
foreach(arg in vargv) {
    if(arg=="--bench")bench=true;
    if(arg=="--reverse")reverse=true;
    if(arg.find("--iterations=")==0)iterations=arg.slice(13).tointeger();
    if(arg.find("--warmups=")==0)warmups=arg.slice(10).tointeger();
}
D.check(iterations>0 && warmups>=0,"benchmark arguments");
if(bench)foreach(c in cases) {
    local expected=c[1](iterations),paths=[[c[0]+"_squirrel",c[1]],[c[0]+"_kernel",c[2]]];
    if(reverse)paths.reverse();
    foreach(p in paths) {
        for(local w=0;w<warmups;w++)near(p[1](iterations),expected,"warm checksum");
        local start=G.get_monotonic_time(),value=p[1](iterations),elapsed=G.get_monotonic_time()-start;
        near(value,expected,"timed checksum");
        print(format("BENCH\t%s\t%d\t%.9f\t%.17g\n",p[0],iterations,elapsed.tofloat()/iterations,value));
    }
}
if(bench)print(format("math module compilation: %d us (excluded)\n",compile_us));
else print("kernel math recurrence tests passed\n");
