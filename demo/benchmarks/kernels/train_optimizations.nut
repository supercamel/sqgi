// Short PGO training workload; accompany with demos and correctness tests.
local D=import("demo/kernels/support.nut");
local simulation=D.load("compiled_workflow"), controller=D.load("typed_objects");
foreach(steps in [1,16,256,4096]) {
    local expected=simulation.simulate(steps,0.125), result=0.0;
    for(local i=0;i<20000/steps+1;i++)result=simulation.simulate(steps,0.125);
    D.near(result,expected,"simulation training");
    local c=controller.Controller(),input=controller.array("f64",steps),output=controller.array("f64",steps);
    c.target=20.0;c.gain=0.5;c.integral_gain=0.125;c.enabled=true;
    for(local i=0;i<steps;i++)input.set(i,20.0);
    for(local i=0;i<20000/steps+1;i++)controller.process(c,input,output,0.25);
    D.check(c.samples==(20000/steps+1)*steps && c.integral==0.0,"controller training");
    D.near(c.advance(20.0,0.25),0.0,"scalar method training");
}
print("optimization training passed\n");
