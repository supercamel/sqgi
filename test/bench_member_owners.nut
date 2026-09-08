// Independent owner-working-set workloads. Excluded from PGO training.
local G=import("GLib")
local iterations=200000, warmups=5
foreach(arg in vargv) {
    if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger()
    if(arg.find("--warmups=")==0) warmups=arg.slice(10).tointeger()
}
if(iterations<=0 || warmups<0) throw "invalid benchmark arguments"
class OwnerRecord { current=null; epoch=0; scale=0.0 }
function recycle(record,pool,n,width) {
    local sum=0.0
    for(local i=0;i<n;i++) {
        local old=record.current
        record.current=pool[i%width]
        record.current[0]=(old[0]+i)%997
        record.epoch=i; record.scale=record.scale+0.25
        sum+=record.current[0]+record.epoch%17+record.scale
    }
    return sum
}
function owners(n,width,classes) {
    local pool=[]
    for(local j=0;j<width;j++) pool.append([j+1])
    local record=classes ? OwnerRecord() : {current=null,epoch=0,scale=0.0}
    record.current=pool[width-1]
    local sum=recycle(record,pool,n,width)
    foreach(value in pool) sum+=value[0]
    return sum+record.epoch+record.scale
}
foreach(classes in [false,true]) foreach(width in [1,2,5,19,257]) {
    local name=(classes?"class":"table")+"_owners_"+width, expected=owners(iterations,width,classes)
    for(local w=0;w<warmups;w++) if(owners(iterations,width,classes)!=expected) throw name+" warm checksum"
    local start=G.get_monotonic_time(), value=owners(iterations,width,classes)
    local elapsed=G.get_monotonic_time()-start
    if(value!=expected) throw name+" checksum"
    print(format("BENCH\t%s\t%d\t%.9f\t%.17g\n",name,iterations,elapsed.tofloat()/iterations,value.tofloat()))
}
