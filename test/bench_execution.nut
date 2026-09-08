// Focused execution benchmarks. No timings are included in correctness tests.
local G = import("GLib")
local iterations = 100000
foreach(arg in vargv) if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger()

function gi_scalar(n) {
    local G=import("GLib")
    local sum=0
    for(local i=0;i<n;i++) sum+=G.ascii_tolower(65)
    return sum
}
function gi_clock(n) {
    local G=import("GLib")
    local sum=0
    for(local i=0;i<n;i++) if(G.get_monotonic_time()>0) sum++
    return sum
}
function parameter_reads(a,n) {
    local sum=0
    for(local i=0;i<n;i++) sum+=a[i%4]
    return sum
}
function array_guards(n) { return parameter_reads([1,2,3,4],n) }
function temporary_arrays(n) {
    local sum=0.0
    for(local i=0;i<n;i++) {
        local pair=[i*0.5,i*0.25]
        sum+=pair[0]+pair[1]
    }
    return sum
}
if(iterations<=0 || iterations%4!=0) throw "iterations must be a positive multiple of four"
foreach(name, fn in {gi_scalar=gi_scalar, gi_clock=gi_clock,
    array_guards=array_guards, temporary_arrays=temporary_arrays}) {
    local expected=name=="gi_scalar"?97*iterations:name=="gi_clock"?iterations:
        name=="array_guards"?iterations/4*10:0.375*iterations*(iterations-1)
    for(local w=0;w<5;w++) if(fn(iterations)!=expected) throw name+" warm checksum"
    local start=G.get_monotonic_time()
    local value=fn(iterations)
    local elapsed=G.get_monotonic_time()-start
    if(value!=expected) throw name+" checksum"
    print(format("BENCH\t%s\t%d\t%.6f\t%.17g\n",name,iterations,elapsed.tofloat()/iterations,value.tofloat()))
}
