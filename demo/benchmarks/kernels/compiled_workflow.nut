// Whole compiled workflow versus a Squirrel loop calling a typed method.
local D=import("demo/kernels/support.nut"),m=D.load("compiled_workflow");
function median(a){a.sort();return a[a.len()/2];}
foreach(steps in [1,16,256,4096]) {
    local body=m.Oscillator(),recent=array(4,0.0),result=0.0;
    local compiled=function(){result=m.simulate(steps,0.125);};
    local host=function(){
        body.position=1.0;body.velocity=0.0;
        for(local i=0;i<4;i++)recent[i]=0.0;
        local cursor=0;
        for(local i=0;i<steps;i++){
            recent[cursor]=body.advance(0.125);cursor=(cursor+1)%4;
        }
        result=(recent[0]+recent[1]+recent[2]+recent[3])*0.25;
    };
    compiled();local expected=result;host();D.near(result,expected,"equivalent workflow");
    local paths=[compiled,host],timings=[[],[]],repeats=200000/steps;
    for(local sample=0;sample<9;sample++) {
        for(local turn=0;turn<2;turn++) {
            local index=(sample+turn)%2,fn=paths[index],start=clock();
            for(local i=0;i<repeats;i++)fn();
            timings[index].append((clock()-start)*1e9/repeats);
            D.near(result,expected,"timed output");
        }
    }
    print(format("single_object/%d compiled_ns=%.1f host_loop_ns=%.1f speedup=%.2f\n",steps,
        median(timings[0]),median(timings[1]),median(timings[1])/median(timings[0])));
}
