// Companion to node_compiled_workflow.js. Initialization is timed on both sides.
local D=import("demo/kernels/support.nut"),start=clock(),m=D.load("compiled_workflow");
local compile_ms=(clock()-start)*1000.0,cases=[];
function reference(steps,dt) {
    local x=1.0,v=0.0,recent=array(4,0.0);
    for(local i=0;i<steps;i++){v-=x*dt;x+=v*dt;recent[i%4]=x;}
    return (recent[0]+recent[1]+recent[2]+recent[3])*0.25;
}
foreach(steps in [1,16,256,4096]) {
    local repeats=4000000/steps,timings=[],results=[],checksums=[];
    foreach(dt in [0.125,0.0625]) {
        local expected=reference(steps,dt),sum=0.0;
        for(local i=0;i<repeats;i++)sum+=expected;
        results.append(expected);checksums.append(sum);
    }
    for(local sample=-1;sample<9;sample++) {
        local index=sample<0?0:sample%2,dt=index==0?0.125:0.0625;
        local sum=0.0,result=0.0,started=clock();
        for(local i=0;i<repeats;i++){result=m.simulate(steps,dt);sum+=result;}
        local elapsed=(clock()-started)*1e9/repeats;
        D.check(result==results[index] && sum==checksums[index],"simulation result and checksum");
        if(sample>=0)timings.append(elapsed);
    }
    cases.append({kind="workflow",size=steps,repeats=repeats,timings_ns=timings,output=results,checksums=checksums});
}
print(sqgi.json.stringify({backend=sqgi.kernel.backend,compile_ms=compile_ms,cases=cases})+"\n");
