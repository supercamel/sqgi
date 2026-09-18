local D=import("demo/kernels/support.nut"), m=D.load("histogram");
local values=m.array("i64",1024),bins=m.array("i64",16),expected=array(16,0);
for(local i=0;i<1003;i++){local bin=(i*i+3*i)%16;values.set(i,bin);expected[bin]++;}
m.histogram(values,bins,1003);
local text="histogram:";for(local i=0;i<16;i++){D.check(bins.get(i)==expected[i],"histogram bin");text+=" "+bins.get(i);}
print(text+"\n");
m.histogram(values,bins,0);for(local i=0;i<16;i++)D.check(bins.get(i)==0,"empty histogram resets bins");
