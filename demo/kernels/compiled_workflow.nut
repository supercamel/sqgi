local D=import("demo/kernels/support.nut"), m=D.load("compiled_workflow");
foreach(steps in [0,1,3,4,5,16,256,4096]) {
    local x=1.0,v=0.0,recent=array(4,0.0),cursor=0;
    for(local i=0;i<steps;i++) {
        v-=x*0.125;x+=v*0.125;recent[cursor]=x;cursor=(cursor+1)%4;
    }
    local expected=(recent[0]+recent[1]+recent[2]+recent[3])*0.25;
    D.near(m.simulate(steps,0.125),expected,"fully compiled simulation");
    local persistent=m.Oscillator();persistent.position=1.0;
    D.near(persistent.run(steps,0.125),expected,"persistent object workflow");
    D.near(persistent.position,x,"persistent position");
    D.near(persistent.velocity,v,"persistent velocity");
}
print("compiled workflow: single-object simulation with local objects and scratch arrays checked\n");
