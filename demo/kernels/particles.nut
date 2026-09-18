local D=import("demo/kernels/support.nut"), m=D.load("particles");
local particles=m.array("Particle",128), reference=[];
for(local i=0;i<128;i++) {
    local p={x=(i%11).tofloat(),y=(i%5).tofloat(),vx=(i%3-1).tofloat(),vy=0.0,active=i%4==0?0:1};
    particles.set(i,p); reference.append(p);
}
for(local frame=0;frame<120;frame++) {
    m.step(particles,128,0.125);
    foreach(p in reference) if(p.active!=0) {
        p.vy-=9.0*0.125; p.x+=p.vx*0.125; p.y+=p.vy*0.125;
        if(p.x<0.0){p.x=0.0;p.vx=-p.vx;} if(p.x>10.0){p.x=10.0;p.vx=-p.vx;}
        if(p.y<0.0){p.y=0.0;p.vy=-p.vy*0.8;}
    }
}
for(local i=0;i<128;i++) {
    local p=particles.get(i),r=reference[i];
    foreach(field in ["x","y","vx","vy"]) D.near(p[field],r[field],"particle "+field);
    D.check(p.active==r.active,"integer field preserved");
}
print("particles: checked 120 frames, collisions and inactive particles\n");
