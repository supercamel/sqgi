local D=import("demo/kernels/support.nut"),m=D.load("math");
D.near(m.wave(0.5,2.0),sin(0.5)*2.0,"wave");
D.near(m.length(3.0,4.0),5.0,"hypot");
D.check(m.valid_root(4.0) && !m.valid_root(-1.0),"domain result and bool predicate");
D.near(m.constant_workload(80),1161.3127449959120,"constant math benchmark checksum");
D.near(m.variable_workload(80),122.66761111643609,"variable math benchmark checksum");
D.near(m.constant_workload(0),0.0,"empty constant loop");
D.near(m.variable_workload(0),0.0,"empty variable loop");
local caught=false;
try {m.wave(1.0/0.0,2.0);} catch(e) {caught=(""+e).find("require failed")!=null;}
D.check(caught,"nonfinite input guard");
print("kernel math demo passed\n");
