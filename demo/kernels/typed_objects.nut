local D=import("demo/kernels/support.nut"), m=D.load("typed_objects");
local controller=m.Controller();
controller.target=20.0;
controller.gain=0.5;
controller.integral_gain=0.125;
controller.enabled=true;
D.near(controller.advance(18.0,0.25),1.0625,"single sample method");
local integral=0.5, samples=1;
foreach(count in [0,1,7,128]) {
    local input=m.array("f64",count), output=m.array("f64",count);
    for(local i=0;i<count;i++) input.set(i,18.0+(i%5).tofloat());
    m.process(controller,input,output,0.25);
    for(local i=0;i<count;i++) {
        local error=20.0-input.get(i); integral+=error*0.25; samples++;
        D.near(output.get(i),error*0.5+integral*0.125,"controller output");
    }
    D.near(controller.integral,integral,"persistent integral");
    D.check(controller.samples==samples,"persistent count");
}
local same=controller;
same.enabled=false;
D.near(controller.advance(100.0,0.25),0.0,"shared instance reference");
D.check(controller.samples==samples,"disabled controller does not update");
print("typed objects: persistent controller, compiled method chains and runtime arrays checked\n");
