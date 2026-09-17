// Port of the matrix row in the ordinary-Squirrel runtime comparison.
local G=import("GLib"), D=import("demo/kernels/support.nut");
local compile_start=G.get_monotonic_time(), m=D.load("matrix");
local compile_us=G.get_monotonic_time()-compile_start;
function matrix_reference(n) {
    local a = [
        [1.0, 0.5, -0.25],
        [-0.75, 1.25, 0.375],
        [0.625, -0.5, 1.5]
    ]
    local v = [1.0, -2.0, 0.75]
    local checksum = 0.0

    for (local i = 0; i < n; i++) {
        local x = a[0][0] * v[0] + a[0][1] * v[1] + a[0][2] * v[2]
        local y = a[1][0] * v[0] + a[1][1] * v[1] + a[1][2] * v[2]
        local z = a[2][0] * v[0] + a[2][1] * v[1] + a[2][2] * v[2]
        v[0] = x * 0.125 + ((i % 5).tofloat() - 2.0) * 0.01
        v[1] = y * 0.125 - ((i % 7).tofloat() - 3.0) * 0.015
        v[2] = z * 0.125 + ((i % 11).tofloat() - 5.0) * 0.005
        a[i % 3][(i + 1) % 3] = a[i % 3][(i + 1) % 3] * 0.99 + v[i % 3] * 0.001
        checksum = checksum + v[0] * 0.25 + v[1] * 0.5 - v[2] * 0.125
    }

    return checksum + v[0] * 3.0 + v[1] * 5.0 + v[2] * 7.0
}

function near(actual, expected, label) {
    if(!(fabs(actual-expected)<=1.0e-12*(1.0+fabs(expected)))) throw "matrix recurrence: "+label;
}
foreach(n in [0,1,2,3,4,5,6,7,10,11,12,31,32,64,127,200,255,256,1024,4096]) {
    near(m.recurrence(n),matrix_reference(n),"reference n="+n);
}
near(m.recurrence(0),-1.75,"zero iterations");
near(m.recurrence(200),-0.31467322972993278,"existing suite checksum");
for(local n=0;n<128;n++) near(m.recurrence(n),matrix_reference(n),"all short prefixes");
local rejected=false;
try {m.recurrence(-1);} catch(e) {rejected=e.tostring().find("require failed")!=null;}
D.check(rejected,"negative iteration count rejected");
near(m.recurrence(200),matrix_reference(200),"fresh scratch after failure");
local iterations=80000,warmups=5,bench=false,reverse=false;
foreach(arg in vargv) {
    if(arg=="--bench") bench=true;
    if(arg=="--reverse") reverse=true;
    if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger();
    if(arg.find("--warmups=")==0) warmups=arg.slice(10).tointeger();
}
D.check(iterations>0 && warmups>=0,"valid benchmark arguments");
if(bench) {
    local expected=matrix_reference(iterations);
    local paths=[["matrix_squirrel",matrix_reference],["matrix_kernel",function(n){return m.recurrence(n);}]];
    if(reverse) paths.reverse();
    foreach(path in paths) {
        local fn=path[1];
        for(local w=0;w<warmups;w++) near(fn(iterations),expected,"warm checksum");
        local start=G.get_monotonic_time(),value=fn(iterations);
        local elapsed=G.get_monotonic_time()-start;
        near(value,expected,"timed checksum");
        print(format("BENCH\t%s\t%d\t%.9f\t%.17g\n",path[0],iterations,elapsed.tofloat()/iterations,value));
    }
    print(format("matrix module compilation: %d us (excluded from timings)\n",compile_us));
} else print("matrix recurrence tests passed\n");
