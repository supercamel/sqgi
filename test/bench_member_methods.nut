// Mutating member calls with varied owners and payloads. Excluded from PGO training.
local G=import("GLib")
local iterations=200000, warmups=5
foreach(arg in vargv) {
    if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger()
    if(arg.find("--warmups=")==0) warmups=arg.slice(10).tointeger()
}
if(iterations<=0 || warmups<0) throw "invalid benchmark arguments"
class MemberRecord { current=null; caption=null; count=0 }
class OtherRecord { padding=19; count=0; caption=null; current=null }
function transfer(a,b,caption,index,next) {
    local previous=a.current
    a.current=b.current; b.current=previous; a.caption=caption
    return a.current[index]+b.current[next]
}
function publish(a,input,caption,index,count) {
    a.current=input; a.caption=caption; a.count=count
    return a.current[index]+a.count
}
function members(n,width,layout,updates) {
    local pool=[], records=[], captions=["ready","busy","idle","retry","done"]
    for(local j=0;j<13;j++) {
        local payload=[]
        for(local k=0;k<11;k++) payload.append(j*11+k+1)
        pool.append(payload)
    }
    for(local j=0;j<width;j++) {
        local record
        if(layout==0) record={current=null,caption=null,count=0}
        else if(layout==1) record=MemberRecord()
        else if(j%3==0) record={count=0,caption=null,current=null}
        else if(j%3==1) record=MemberRecord()
        else record=OtherRecord()
        record.current=pool[j%13]; record.caption=captions[j%5]
        records.append(record)
    }
    local sum=0
    for(local i=0;i<n;i++) {
        local a=records[i%width], index=i%11
        if(updates) sum+=publish(a,pool[i%13],captions[i%5],index,i%101)
        else sum+=transfer(a,records[(i*7)%width],captions[i%5],index,(index+3)%11)
        sum=sum%1000003
    }
    foreach(record in records) sum+=record.current[0]+record.count+record.caption.len()
    return sum
}
foreach(updates in [false,true]) foreach(layout in [0,1,2]) {
    local width=updates?97:17
    local name=(updates?"publish":"transfer")+"_"+["table","class","mixed"][layout]
    local expected=members(iterations,width,layout,updates)
    for(local w=0;w<warmups;w++) if(members(iterations,width,layout,updates)!=expected) throw name+" warm checksum"
    local start=G.get_monotonic_time(), value=members(iterations,width,layout,updates)
    local elapsed=G.get_monotonic_time()-start
    if(value!=expected) throw name+" checksum"
    print(format("BENCH\t%s\t%d\t%.9f\t%.17g\n",name,iterations,elapsed.tofloat()/iterations,value.tofloat()))
}
