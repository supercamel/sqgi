// Independent floating workloads. Exclude this suite from PGO training.
local G=import("GLib")
local iterations=200000, warmups=5
foreach(arg in vargv) {
    if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger()
    if(arg.find("--warmups=")==0) warmups=arg.slice(10).tointeger()
}
if(iterations<=0 || warmups<0) throw "invalid benchmark arguments"

function smooth(previous,sample,weight) { return previous*weight+sample*(1.0-weight) }
function acceleration(position,velocity) { return velocity*0.99609375-position*0.015625 }
function selected(x,y,flag) { if(flag) return x*0.75-y*0.125; return y+x*0.25 }
function pair(x,y) { return (x-y)*0.125 }
function filter(n) {
    local x=0.125
    for(local i=0;i<n;i++) x=smooth(x,i%23,0.875)
    return x
}
function channels(n) {
    local a=0.125,b=0.25,c=0.375,d=0.5
    for(local i=0;i<n;i++) {
        local sample=i%23
        a=smooth(a,sample,0.875); b=smooth(b,sample,0.75)
        c=smooth(c,sample,0.625); d=smooth(d,sample,0.5)
    }
    return a+b*0.5+c*0.25+d*0.125
}
function pressure(n) {
    local a=0.125,b=0.25,c=0.375,d=0.5,e=0.625,f=0.75,g=0.875,h=1.0
    for(local i=0;i<n;i++) {
        a=smooth(a,i%23,0.875); b=smooth(b,a,0.75)
        c=smooth(c,b,0.625); d=smooth(d,c,0.5)
        e=smooth(e,d,0.875); f=smooth(f,e,0.75)
        g=smooth(g,f,0.625); h=smooth(h,g,0.5)
    }
    return a+b*0.5+c*0.25+d*0.125+e*0.0625+f*0.03125+g*0.015625+h
}
function integration(n) {
    local x=1.0,v=0.0,sum=0.0
    for(local i=0;i<n;i++) {
        v=acceleration(x,v)+(i%17)*0.0009765625
        x=x+v*0.125; sum+=x*0.015625
    }
    return sum+x+v
}
function retained(n) {
    local x=0.125,sum=0.0
    for(local i=0;i<n;i++) {
        local y=(i%17)*0.125, old=x, delta=pair(x,y)
        sum+=x+old+delta
        x=smooth(x,y,0.75)
    }
    return sum+x
}
function branching(n) {
    local x=0.125
    for(local i=0;i<n;i++) x=selected(x,(i%17)*0.125,i%3==0)
    return x
}
function helper_control(n) {
    local x=0.125
    for(local i=0;i<n;i++) x=smooth(x,sqrt((i%31)+1.0),0.875)
    return x
}
local cases=[
    ["filter",filter],["channels_4",channels],["pressure_8",pressure],
    ["integration",integration],["retained_input",retained],
    ["branching",branching],["helper_control",helper_control]
]
foreach(item in cases) {
    local name=item[0],fn=item[1],expected=fn(iterations)
    for(local w=0;w<warmups;w++) if(fn(iterations)!=expected) throw name+" warm checksum"
    local start=G.get_monotonic_time(),value=fn(iterations),elapsed=G.get_monotonic_time()-start
    if(value!=expected) throw name+" checksum"
    print(format("BENCH\t%s\t%d\t%.9f\t%.17g\n",name,iterations,elapsed.tofloat()/iterations,value))
}
