local D=import("demo/kernels/support.nut"), m=D.load("reductions");
local a=m.array("f64",1024), b=m.array("f64",1024), prefix=m.array("f64",1024);
local sum=0.0, dot=0.0;
for(local i=0;i<1000;i++) {local x=(i%17-8).tofloat();a.set(i,x);b.set(i,0.5);sum+=x;dot+=x*0.5;}
D.near(m.sum(a,1000),sum,"sum"); D.near(m.dot(a,b,1000),dot,"dot");
m.prefix(a,prefix,1000);
local running=0.0;
for(local i=0;i<1000;i++) {running+=a.get(i);D.near(prefix.get(i),running,"prefix");}
D.check(prefix.get(1000)==0.0,"unused tail"); D.check(m.sum(a,0)==0.0,"empty reduction");
print(format("reductions: sum=%.1f dot=%.1f; all 1000 prefix values checked\n",sum,dot));
