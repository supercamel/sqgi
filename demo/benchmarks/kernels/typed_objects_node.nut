// Companion to node_typed_objects.js; run via compare_typed_objects.py.
local D=import("demo/kernels/support.nut"), start=clock(), m=D.load("typed_objects");
local compile_ms=(clock()-start)*1000.0, cases=[];
foreach(count in [1,16,256,4096]) {
    foreach(kind in (count==1?["driver","scalar"]:["driver"])) {
        local c=m.Controller(); c.target=20.0;c.gain=0.5;c.integral_gain=0.125;c.enabled=true;
        local input=m.array("f64",count), output=m.array("f64",count), errorSum=0.0;
        for(local i=0;i<count;i++){local value=18.0+(i%5).tofloat();input.set(i,value);errorSum+=20.0-value;}
        local result=0.0, repeats=4000000/count, timings=[], values=[];
        local invoke=kind=="driver"?function(){m.process(c,input,output,0.25);}:function(){result=c.advance(18.0,0.25);};
        // One warm batch followed by nine timed batches; state reset is untimed.
        for(local sample=-1;sample<9;sample++) {
            c.integral=0.0;c.samples=0;
            local started=clock();
            for(local i=0;i<repeats;i++) invoke();
            local elapsed=(clock()-started)*1e9/repeats;
            if(sample>=0) timings.append(elapsed);
            D.check(c.samples==count*repeats,"sample count");
            D.near(c.integral,errorSum*0.25*repeats,"integral");
            // Independent closed-form result for the final iteration.
            local integral=errorSum*0.25*(repeats-1); values=[];
            for(local i=0;i<count;i++) {
                local error=20.0-input.get(i);integral+=error*0.25;
                local expected=error*0.5+integral*0.125;
                local actual=kind=="driver"?output.get(i):result;
                D.near(actual,expected,"output"); values.append(actual);
            }
        }
        cases.append({kind=kind,size=count,repeats=repeats,timings_ns=timings,
            integral=c.integral,count=c.samples,output=values});
    }
}
print(sqgi.json.stringify({backend=sqgi.kernel.backend,compile_ms=compile_ms,cases=cases})+"\n");
