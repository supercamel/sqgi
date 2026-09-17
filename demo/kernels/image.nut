local D=import("demo/kernels/support.nut"), m=D.load("image");
local pixels=m.array("i64",1024), output=m.array("i64",1024);
for(local i=0;i<1024;i++) pixels.set(i,(i%32)*8);
m.threshold(pixels,output,1024,16,128);
for(local i=0;i<1024;i++) {
    local adjusted=pixels.get(i)+16; if(adjusted>255) adjusted=255;
    D.check(output.get(i)==(adjusted>=128?255:0),"threshold pixel");
}
local row="";for(local x=0;x<32;x++) row+=output.get(x)==0?".":"#";
print("image: "+row+" (1024 pixels checked; i64 grayscale storage)\n");
