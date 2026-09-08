local GLib=import("GLib")
// Batch invocations so microsecond clock resolution and scheduling dominate less.
local repetitions=vargv.len() ? vargv[0].tointeger() : 10
if(repetitions<1 || repetitions>1000) throw "repetitions must be in 1..1000"
function repeated(v,n) { for(local i=0;i<n;i++) v[i%8]=i; return v[0] }
function distinct(v,n) { for(local i=0;i<n;i++) v[i]=i; return v[n-1] }
repeated(array(8,0),8)
distinct(array(8,0),8)
foreach(n in [1000,8000,16000]) {
    foreach(pair in [["repeated",repeated],["distinct",distinct]]) {
        local v=array(n,0)
        local start=GLib.get_monotonic_time()
        local result=0
        for(local run=0;run<repetitions;run++) result+=pair[1](v,n)
        local elapsed=GLib.get_monotonic_time()-start
        local expected=pair[0]=="distinct" ? n-1 : n-8
        if(result!=expected*repetitions) throw "write shape checksum"
        print(format("WRITE\t%s\t%d\t%.3f\n",pair[0],n,elapsed.tofloat()/repetitions))
    }
}
