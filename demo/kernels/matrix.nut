local D=import("demo/kernels/support.nut"), m=D.load("matrix");
local a=m.array("f64",256), b=m.array("f64",256), output=m.array("f64",256);
for(local i=0;i<256;i++){a.set(i,(i%7-3).tofloat());b.set(i,(i%5-2).tofloat());}
m.multiply(a,b,output,16);
for(local row=0;row<16;row++)for(local col=0;col<16;col++) {
    local expected=0.0;for(local k=0;k<16;k++) expected+=a.get(row*16+k)*b.get(k*16+col);
    D.near(output.get(row*16+col),expected,"matrix product");
}
print("matrix: checked every element of a 16x16 product\n");
