// Port of the vector row in the ordinary-Squirrel runtime comparison.
local G=import("GLib"), D=import("demo/kernels/support.nut");
local compile_start=G.get_monotonic_time(), m=D.load("vector");
local compile_us=G.get_monotonic_time()-compile_start;
class Vec3 {
    values = null

    constructor(x = 0.0, y = 0.0, z = 0.0) {
        this.values = [x, y, z]
    }

    function get(i) {
        return this.values[i]
    }

    function set(i, v) {
        this.values[i] = v
        return v
    }

    function _add(o) {
        return Vec3(this.values[0] + o.values[0],
                    this.values[1] + o.values[1],
                    this.values[2] + o.values[2])
    }

    function _sub(o) {
        return Vec3(this.values[0] - o.values[0],
                    this.values[1] - o.values[1],
                    this.values[2] - o.values[2])
    }

    function _mul(s) {
        return Vec3(this.values[0] * s,
                    this.values[1] * s,
                    this.values[2] * s)
    }

    function dot(o) {
        return this.values[0] * o.values[0] +
               this.values[1] * o.values[1] +
               this.values[2] * o.values[2]
    }

    function cross(o) {
        return Vec3(this.values[1] * o.values[2] - this.values[2] * o.values[1],
                    this.values[2] * o.values[0] - this.values[0] * o.values[2],
                    this.values[0] * o.values[1] - this.values[1] * o.values[0])
    }
}

function vector_reference(n) {
    local pos = Vec3(1.0, -2.0, 0.5)
    local vel = Vec3(0.125, -0.250, 0.375)
    local axis = Vec3(0.25, 0.5, -0.75)
    local checksum = 0.0

    for (local i = 0; i < n; i++) {
        local wind = Vec3(((i % 11).tofloat() - 5.0) * 0.01,
                          ((i % 7).tofloat() - 3.0) * 0.02,
                          ((i % 5).tofloat() - 2.0) * 0.015)
        local force = vel.cross(axis) + wind - pos * 0.0125
        pos = pos + force * 0.05
        vel = vel + pos.cross(force) * 0.0025

        local idx = i % 3
        local next = (idx + 1) % 3
        pos.set(next, pos.get(next) * 0.75 + pos.get(idx) * 0.125)
        checksum = checksum + pos.dot(vel) * 0.0001
    }

    return pos.dot(vel) + checksum
}

function near(actual, expected, label) {
    if(!(fabs(actual-expected)<=1.0e-12*(1.0+fabs(expected)))) throw "vector recurrence: "+label;
}
foreach(n in [0,1,2,3,4,5,6,7,10,11,12,31,32,64,127,200,255,256,1024,4096]) {
    near(m.recurrence(n),vector_reference(n),"reference n="+n);
}
near(m.recurrence(0),0.8125,"zero iterations");
near(m.recurrence(120),0.021712587807413163,"existing suite checksum");
for(local n=0;n<128;n++) near(m.recurrence(n),vector_reference(n),"all short prefixes");
local rejected=false;
try {m.recurrence(-1);} catch(e) {rejected=e.tostring().find("require failed")!=null;}
D.check(rejected,"negative iteration count rejected");
near(m.recurrence(200),vector_reference(200),"fresh scratch after failure");
local iterations=80000,warmups=5,bench=false,reverse=false;
foreach(arg in vargv) {
    if(arg=="--bench") bench=true;
    if(arg=="--reverse") reverse=true;
    if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger();
    if(arg.find("--warmups=")==0) warmups=arg.slice(10).tointeger();
}
D.check(iterations>0 && warmups>=0,"valid benchmark arguments");
if(bench) {
    local expected=vector_reference(iterations);
    local paths=[["vector_squirrel",vector_reference],["vector_kernel",function(n){return m.recurrence(n);}]];
    if(reverse) paths.reverse();
    foreach(path in paths) {
        local fn=path[1];
        for(local w=0;w<warmups;w++) near(fn(iterations),expected,"warm checksum");
        local start=G.get_monotonic_time(),value=fn(iterations);
        local elapsed=G.get_monotonic_time()-start;
        near(value,expected,"timed checksum");
        print(format("BENCH\t%s\t%d\t%.9f\t%.17g\n",path[0],iterations,elapsed.tofloat()/iterations,value));
    }
    print(format("vector module compilation: %d us (excluded from timings)\n",compile_us));
} else print("vector recurrence tests passed\n");
