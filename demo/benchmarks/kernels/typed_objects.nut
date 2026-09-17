// Run from repository root. Measures steady-state calls with reusable storage.
local D=import("demo/kernels/support.nut"), started=clock(), m=D.load("typed_objects");
print(format("backend=%s compile_ms=%.3f\n",sqgi.kernel.backend,(clock()-started)*1000.0));
class ScriptController {
    target=20.0; gain=0.5; integral=0.0; integral_gain=0.125; samples=0; enabled=true;
    function advance(measured,dt) {
        if(dt<=0.0) throw "invalid timestep";
        if(!enabled) return 0.0;
        local error=target-measured;
        integral+=error*dt; samples++;
        return error*gain+integral*integral_gain;
    }
    function process(input,output,dt) {
        if(input.len()!=output.len()) throw "length mismatch";
        for(local i=0;i<input.len();i++) output[i]=advance(input[i],dt);
    }
}
function controller(m) {
    local c=m.Controller(); c.target=20.0; c.gain=0.5; c.integral_gain=0.125; c.enabled=true; return c;
}
function median(values) {values.sort();return values[values.len()/2];}
foreach(count in [1,16,256,4096]) {
    local input=m.array("f64",count), output=m.array("f64",count), values=[], expected=array(count,0.0);
    for(local i=0;i<count;i++) {local v=18.0+(i%5).tofloat();input.set(i,v);values.append(v);}
    local c=controller(m), scalar=controller(m), script=ScriptController(), checksum=0.0;
    local paths=[
        function(){m.process(c,input,output,0.25);},
        function(){for(local i=0;i<count;i++)checksum=scalar.advance(values[i],0.25);},
        function(){script.process(values,expected,0.25);}
    ];
    local timings=[[],[],[]], repeats=200000/count;
    for(local sample=0;sample<7;sample++) {
        // Rotate order and reset outside timing. No allocation, compilation or
        // array.set/get conversion is included in measured calls.
        c.integral=0.0;c.samples=0;scalar.integral=0.0;scalar.samples=0;
        script.integral=0.0;script.samples=0;
        for(local turn=0;turn<3;turn++) {
            local index=(sample+turn)%3, fn=paths[index], start=clock();
            for(local j=0;j<repeats;j++) fn();
            timings[index].append((clock()-start)*1e9/repeats);
        }
        D.check(c.samples==script.samples && scalar.samples==script.samples,"sample counts");
        D.near(c.integral,script.integral,"compiled driver state");
        D.near(scalar.integral,script.integral,"scalar method state");
        D.near(checksum,expected[count-1],"scalar method result");
        for(local i=0;i<count;i++) D.near(output.get(i),expected[i],"compiled driver output");
    }
    print(format("controller/%d repeats=%d compiled_driver_ns=%.1f host_method_loop_ns=%.1f squirrel_class_ns=%.1f\n",
        count,repeats,median(timings[0]),median(timings[1]),median(timings[2])));
}
