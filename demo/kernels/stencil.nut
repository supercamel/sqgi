local D=import("demo/kernels/support.nut"),m=D.load("stencil");
local input=m.array("f64",1024),output=m.array("f64",1024),reference=array(1024,0.0);
for(local x=0;x<32;x++){input.set(x,100.0);reference[x]=100.0;}
for(local step=0;step<20;step++) {
    m.diffuse(input,output,32);
    local next=clone reference;
    for(local row=1;row<31;row++)for(local col=1;col<31;col++) {
        local i=row*32+col;next[i]=(reference[i-1]+reference[i+1]+reference[i-32]+reference[i+32])*0.25;
    }
    reference=next;local previous=input;input=output;output=previous;
}
for(local i=0;i<1024;i++)D.near(input.get(i),reference[i],"diffusion cell");
print(format("stencil: checked 20 ping-pong steps; temperature below hot edge = %.3f\n",input.get(48)));
