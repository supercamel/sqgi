local D=import("demo/kernels/support.nut"), m=D.load("routing");
local boxes=m.array("Box",256), hits=m.array("i64",256);
for(local i=0;i<256;i++){local x=(i%16).tofloat(),y=(i/16).tofloat();boxes.set(i,{left=x,bottom=y,right=x+0.75,top=y+0.75});}
local found=m.overlaps(boxes,hits,256,4.0,5.0,8.0,9.0),expected=0;
for(local i=0;i<256;i++) {
    local b=boxes.get(i),hit=b.right>=4.0&&b.left<=8.0&&b.top>=5.0&&b.bottom<=9.0;
    D.check(hits.get(i)==(hit?1:0),"obstacle classification");if(hit)expected++;
}
D.check(found==expected,"intersection count");
print("routing: "+found+" inclusive AABB intersections among 256 obstacles\n");
