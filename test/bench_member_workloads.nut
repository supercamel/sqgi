// Independent workloads for member/indexed access changes. Keep these out of
// PGO training. The JavaScript port must perform the same work and allocations.
local G=import("GLib")
local iterations=200000, warmups=5
foreach(arg in vargv) {
    if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger()
    if(arg.find("--warmups=")==0) warmups=arg.slice(10).tointeger()
}
if(iterations<=0 || warmups<0) throw "invalid benchmark arguments"

class EventRecord {
    accepted=0; rejected=0; pending=0; bytes=0; samples=null
    constructor() { samples=array(13,0) }
    function apply(key,delta,index) {
        this[key]=(this[key]+delta)%65521
        this.samples[index]=(this.samples[index]+this[key])%997
        return this.samples[index]
    }
}
function table_apply(record,key,delta,index) {
    record[key]=(record[key]+delta)%65521
    record.samples[index]=(record.samples[index]+record[key])%997
    return record.samples[index]
}
function event_records(n,classes) {
    local records=[], keys=["accepted","rejected","pending","bytes"]
    for(local j=0;j<97;j++) {
        if(classes) records.append(EventRecord())
        else {
            local record={samples=array(13,0)}
            // Different insertion orders and unrelated fields exercise layout
            // variation without changing the event-processing calculation.
            for(local k=0;k<4;k++) record[keys[(k+j)%4]]<-0
            for(local k=0;k<j%19;k++) record[k]<-k
            records.append(record)
        }
    }
    local sum=0
    for(local i=0;i<n;i++) {
        local record=records[(i*17)%97], key=keys[i%4]
        local value=classes ? record.apply(key,i%101,i%13) : table_apply(record,key,i%101,i%13)
        sum=(sum+value)%1000003
    }
    foreach(record in records) sum+=record.accepted+record.rejected+record.pending+record.bytes
    return sum
}
function rotate_buffers(state,n,width) {
    local sum=0
    for(local i=0;i<n;i++) {
        local old=state.current; state.current=state.previous; state.previous=old
        state.caption=i%2==0 ? "available" : "in flight"
        local k=i%width
        state.current[k]=(state.current[k]+i+state.caption.len())%997
        sum=(sum+state.current[k]+state.previous[(k+1)%width])%1000003
    }
    return sum+state.current[0]+state.previous[0]
}
function buffers(n,width) {
    return rotate_buffers({current=array(width,1),previous=array(width,2),caption="idle"},n,width)
}
function calibrate(samples,n,width) {
    local sum=0.0
    for(local i=0;i<n;i++) {
        local k=i%width
        samples[k]=(i%101).tofloat()*0.125+(i%23).tofloat()*0.0625
        sum+=samples[k]*0.5+samples[(k+1)%width]*0.25
    }
    return sum
}
local cases=[
    ["table_events_97",function(n) { return event_records(n,false) }],
    ["class_events_97",function(n) { return event_records(n,true) }],
    ["buffers_7",function(n) { return buffers(n,7) }],
    ["buffers_31",function(n) { return buffers(n,31) }],
    ["calibrate_17",function(n) { return calibrate(array(17,0.0),n,17) }],
    ["calibrate_67",function(n) { return calibrate(array(67,0.0),n,67) }]
]
foreach(item in cases) {
    local name=item[0], fn=item[1], expected=fn(iterations)
    for(local w=0;w<warmups;w++) if(fn(iterations)!=expected) throw name+" warm checksum"
    local start=G.get_monotonic_time(), value=fn(iterations)
    local elapsed=G.get_monotonic_time()-start
    if(value!=expected) throw name+" checksum"
    print(format("BENCH\t%s\t%d\t%.9f\t%.17g\n",name,iterations,elapsed.tofloat()/iterations,value.tofloat()))
}
