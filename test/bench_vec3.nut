// Diagnostic Vec3 variants: identical numerical work, different representation/dispatch.
// --only=NAME selects one variant for perf; --iterations=N --warmups=N control runs.

class Vec_arrays_operators {
    values = null

    constructor(x = 0.0, y = 0.0, z = 0.0) {
        this.values = [x, y, z]
    }

    function get(i) {
        return this.values[i]
    }

    function set(i, v) {
        this.values[i] = v
        return v
    }

    function _add(o) {
        return Vec_arrays_operators(this.values[0] + o.values[0],
                    this.values[1] + o.values[1],
                    this.values[2] + o.values[2])
    }

    function _sub(o) {
        return Vec_arrays_operators(this.values[0] - o.values[0],
                    this.values[1] - o.values[1],
                    this.values[2] - o.values[2])
    }

    function _mul(s) {
        return Vec_arrays_operators(this.values[0] * s,
                    this.values[1] * s,
                    this.values[2] * s)
    }

    function dot(o) {
        return this.values[0] * o.values[0] +
               this.values[1] * o.values[1] +
               this.values[2] * o.values[2]
    }

    function cross(o) {
        return Vec_arrays_operators(this.values[1] * o.values[2] - this.values[2] * o.values[1],
                    this.values[2] * o.values[0] - this.values[0] * o.values[2],
                    this.values[0] * o.values[1] - this.values[1] * o.values[0])
    }
}


function arrays_operators(n) {
    local pos = Vec_arrays_operators(1.0, -2.0, 0.5)
    local vel = Vec_arrays_operators(0.125, -0.250, 0.375)
    local axis = Vec_arrays_operators(0.25, 0.5, -0.75)
    local checksum = 0.0

    for (local i = 0; i < n; i++) {
        local wind = Vec_arrays_operators(((i % 11).tofloat() - 5.0) * 0.01,
                          ((i % 7).tofloat() - 3.0) * 0.02,
                          ((i % 5).tofloat() - 2.0) * 0.015)
        local force = vel.cross(axis) + wind - pos * 0.0125
        pos = pos + force * 0.05
        vel = vel + pos.cross(force) * 0.0025

        local idx = i % 3
        local next = (idx + 1) % 3
        pos.set(next, pos.get(next) * 0.75 + pos.get(idx) * 0.125)
        checksum = checksum + pos.dot(vel) * 0.0001
    }

    return pos.dot(vel) + checksum
}


class Vec_arrays_methods {
    values = null

    constructor(x = 0.0, y = 0.0, z = 0.0) {
        this.values = [x, y, z]
    }

    function get(i) {
        return this.values[i]
    }

    function set(i, v) {
        this.values[i] = v
        return v
    }

    function add(o) {
        return Vec_arrays_methods(this.values[0] + o.values[0],
                    this.values[1] + o.values[1],
                    this.values[2] + o.values[2])
    }

    function sub(o) {
        return Vec_arrays_methods(this.values[0] - o.values[0],
                    this.values[1] - o.values[1],
                    this.values[2] - o.values[2])
    }

    function mul(s) {
        return Vec_arrays_methods(this.values[0] * s,
                    this.values[1] * s,
                    this.values[2] * s)
    }

    function dot(o) {
        return this.values[0] * o.values[0] +
               this.values[1] * o.values[1] +
               this.values[2] * o.values[2]
    }

    function cross(o) {
        return Vec_arrays_methods(this.values[1] * o.values[2] - this.values[2] * o.values[1],
                    this.values[2] * o.values[0] - this.values[0] * o.values[2],
                    this.values[0] * o.values[1] - this.values[1] * o.values[0])
    }
}


function arrays_methods(n) {
    local pos = Vec_arrays_methods(1.0, -2.0, 0.5)
    local vel = Vec_arrays_methods(0.125, -0.250, 0.375)
    local axis = Vec_arrays_methods(0.25, 0.5, -0.75)
    local checksum = 0.0

    for (local i = 0; i < n; i++) {
        local wind = Vec_arrays_methods(((i % 11).tofloat() - 5.0) * 0.01,
                          ((i % 7).tofloat() - 3.0) * 0.02,
                          ((i % 5).tofloat() - 2.0) * 0.015)
        local force = vel.cross(axis).add(wind).sub(pos.mul(0.0125))
        pos = pos.add(force.mul(0.05))
        vel = vel.add(pos.cross(force).mul(0.0025))

        local idx = i % 3
        local next = (idx + 1) % 3
        pos.set(next, pos.get(next) * 0.75 + pos.get(idx) * 0.125)
        checksum = checksum + pos.dot(vel) * 0.0001
    }

    return pos.dot(vel) + checksum
}


class Vec_fields_operators {
    x = 0.0; y = 0.0; z = 0.0

    constructor(x = 0.0, y = 0.0, z = 0.0) {
        this.x=x; this.y=y; this.z=z
    }

    function get(i) {
        if(i==0) return this.x; if(i==1) return this.y; return this.z
    }

    function set(i, v) {
        if(i==0) this.x=v; else if(i==1) this.y=v; else this.z=v
        return v
    }

    function _add(o) {
        return Vec_fields_operators(this.x + o.x,
                    this.y + o.y,
                    this.z + o.z)
    }

    function _sub(o) {
        return Vec_fields_operators(this.x - o.x,
                    this.y - o.y,
                    this.z - o.z)
    }

    function _mul(s) {
        return Vec_fields_operators(this.x * s,
                    this.y * s,
                    this.z * s)
    }

    function dot(o) {
        return this.x * o.x +
               this.y * o.y +
               this.z * o.z
    }

    function cross(o) {
        return Vec_fields_operators(this.y * o.z - this.z * o.y,
                    this.z * o.x - this.x * o.z,
                    this.x * o.y - this.y * o.x)
    }
}


function fields_operators(n) {
    local pos = Vec_fields_operators(1.0, -2.0, 0.5)
    local vel = Vec_fields_operators(0.125, -0.250, 0.375)
    local axis = Vec_fields_operators(0.25, 0.5, -0.75)
    local checksum = 0.0

    for (local i = 0; i < n; i++) {
        local wind = Vec_fields_operators(((i % 11).tofloat() - 5.0) * 0.01,
                          ((i % 7).tofloat() - 3.0) * 0.02,
                          ((i % 5).tofloat() - 2.0) * 0.015)
        local force = vel.cross(axis) + wind - pos * 0.0125
        pos = pos + force * 0.05
        vel = vel + pos.cross(force) * 0.0025

        local idx = i % 3
        local next = (idx + 1) % 3
        pos.set(next, pos.get(next) * 0.75 + pos.get(idx) * 0.125)
        checksum = checksum + pos.dot(vel) * 0.0001
    }

    return pos.dot(vel) + checksum
}


class Vec_fields_methods {
    x = 0.0; y = 0.0; z = 0.0

    constructor(x = 0.0, y = 0.0, z = 0.0) {
        this.x=x; this.y=y; this.z=z
    }

    function get(i) {
        if(i==0) return this.x; if(i==1) return this.y; return this.z
    }

    function set(i, v) {
        if(i==0) this.x=v; else if(i==1) this.y=v; else this.z=v
        return v
    }

    function add(o) {
        return Vec_fields_methods(this.x + o.x,
                    this.y + o.y,
                    this.z + o.z)
    }

    function sub(o) {
        return Vec_fields_methods(this.x - o.x,
                    this.y - o.y,
                    this.z - o.z)
    }

    function mul(s) {
        return Vec_fields_methods(this.x * s,
                    this.y * s,
                    this.z * s)
    }

    function dot(o) {
        return this.x * o.x +
               this.y * o.y +
               this.z * o.z
    }

    function cross(o) {
        return Vec_fields_methods(this.y * o.z - this.z * o.y,
                    this.z * o.x - this.x * o.z,
                    this.x * o.y - this.y * o.x)
    }
}


function fields_methods(n) {
    local pos = Vec_fields_methods(1.0, -2.0, 0.5)
    local vel = Vec_fields_methods(0.125, -0.250, 0.375)
    local axis = Vec_fields_methods(0.25, 0.5, -0.75)
    local checksum = 0.0

    for (local i = 0; i < n; i++) {
        local wind = Vec_fields_methods(((i % 11).tofloat() - 5.0) * 0.01,
                          ((i % 7).tofloat() - 3.0) * 0.02,
                          ((i % 5).tofloat() - 2.0) * 0.015)
        local force = vel.cross(axis).add(wind).sub(pos.mul(0.0125))
        pos = pos.add(force.mul(0.05))
        vel = vel.add(pos.cross(force).mul(0.0025))

        local idx = i % 3
        local next = (idx + 1) % 3
        pos.set(next, pos.get(next) * 0.75 + pos.get(idx) * 0.125)
        checksum = checksum + pos.dot(vel) * 0.0001
    }

    return pos.dot(vel) + checksum
}


class Vec_reused {
    values=null
    constructor(x=0.0,y=0.0,z=0.0) { this.values=[x,y,z] }
    function init(x,y,z) { this.values[0]=x; this.values[1]=y; this.values[2]=z }
    function get(i) { return this.values[i] }
    function set(i,v) { this.values[i]=v; return v }
    function add(a,b) { this.values[0]=a.values[0]+b.values[0]; this.values[1]=a.values[1]+b.values[1]; this.values[2]=a.values[2]+b.values[2] }
    function sub(a,b) { this.values[0]=a.values[0]-b.values[0]; this.values[1]=a.values[1]-b.values[1]; this.values[2]=a.values[2]-b.values[2] }
    function mul(a,s) { this.values[0]=a.values[0]*s; this.values[1]=a.values[1]*s; this.values[2]=a.values[2]*s }
    function cross(a,b) {
        this.values[0]=a.values[1]*b.values[2]-a.values[2]*b.values[1]
        this.values[1]=a.values[2]*b.values[0]-a.values[0]*b.values[2]
        this.values[2]=a.values[0]*b.values[1]-a.values[1]*b.values[0]
    }
    function dot(o) { return this.values[0]*o.values[0]+this.values[1]*o.values[1]+this.values[2]*o.values[2] }
}
function reuse_methods(n) {
    local pos=Vec_reused(1.0,-2.0,0.5),vel=Vec_reused(0.125,-0.250,0.375),axis=Vec_reused(0.25,0.5,-0.75)
    local wind=Vec_reused(),force=Vec_reused(),t1=Vec_reused(),t2=Vec_reused(),checksum=0.0
    for(local i=0;i<n;i++) {
        wind.init(((i%11).tofloat()-5.0)*0.01,((i%7).tofloat()-3.0)*0.02,((i%5).tofloat()-2.0)*0.015)
        t1.cross(vel,axis); t2.add(t1,wind); t1.mul(pos,0.0125); force.sub(t2,t1)
        t1.mul(force,0.05); pos.add(pos,t1)
        t1.cross(pos,force); t2.mul(t1,0.0025); vel.add(vel,t2)
        local idx=i%3,next=(idx+1)%3
        pos.set(next,pos.get(next)*0.75+pos.get(idx)*0.125)
        checksum=checksum+pos.dot(vel)*0.0001
    }
    return pos.dot(vel)+checksum
}

function scalars(n) {
    local px=1.0,py=-2.0,pz=0.5,vx=0.125,vy=-0.250,vz=0.375,checksum=0.0
    for(local i=0;i<n;i++) {
        local wx=((i%11).tofloat()-5.0)*0.01,wy=((i%7).tofloat()-3.0)*0.02,wz=((i%5).tofloat()-2.0)*0.015
        local fx=(vy*(-0.75)-vz*0.5)+wx-px*0.0125
        local fy=(vz*0.25-vx*(-0.75))+wy-py*0.0125
        local fz=(vx*0.5-vy*0.25)+wz-pz*0.0125
        px=px+fx*0.05; py=py+fy*0.05; pz=pz+fz*0.05
        vx=vx+(py*fz-pz*fy)*0.0025; vy=vy+(pz*fx-px*fz)*0.0025; vz=vz+(px*fy-py*fx)*0.0025
        local idx=i%3
        if(idx==0) py=py*0.75+px*0.125
        else if(idx==1) pz=pz*0.75+py*0.125
        else px=px*0.75+pz*0.125
        checksum=checksum+(px*vx+py*vy+pz*vz)*0.0001
    }
    return (px*vx+py*vy+pz*vz)+checksum
}

function arrays_reused(n) {
    local p=[1.0,-2.0,0.5],v=[0.125,-0.250,0.375],checksum=0.0
    for(local i=0;i<n;i++) {
        local wx=((i%11).tofloat()-5.0)*0.01,wy=((i%7).tofloat()-3.0)*0.02,wz=((i%5).tofloat()-2.0)*0.015
        local fx=(v[1]*(-0.75)-v[2]*0.5)+wx-p[0]*0.0125
        local fy=(v[2]*0.25-v[0]*(-0.75))+wy-p[1]*0.0125
        local fz=(v[0]*0.5-v[1]*0.25)+wz-p[2]*0.0125
        p[0]=p[0]+fx*0.05; p[1]=p[1]+fy*0.05; p[2]=p[2]+fz*0.05
        v[0]=v[0]+(p[1]*fz-p[2]*fy)*0.0025; v[1]=v[1]+(p[2]*fx-p[0]*fz)*0.0025; v[2]=v[2]+(p[0]*fy-p[1]*fx)*0.0025
        local idx=i%3
        if(idx==0) p[1]=p[1]*0.75+p[0]*0.125
        else if(idx==1) p[2]=p[2]*0.75+p[1]*0.125
        else p[0]=p[0]*0.75+p[2]*0.125
        checksum=checksum+(p[0]*v[0]+p[1]*v[1]+p[2]*v[2])*0.0001
    }
    return (p[0]*v[0]+p[1]*v[1]+p[2]*v[2])+checksum
}

// The observer loads the definitions above this harness marker.
{
    local G=import("GLib"),iterations=80000,warmups=5,only=""
    foreach(arg in vargv) {
        if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger()
        if(arg.find("--warmups=")==0) warmups=arg.slice(10).tointeger()
        if(arg.find("--only=")==0) only=arg.slice(7)
    }
    if(iterations<=0 || warmups<0) throw "invalid iteration/warmup count"
    local names=["arrays_operators","arrays_methods","fields_operators","fields_methods","reuse_methods","arrays_reused","scalars"]
    if(only!="" && names.find(only)==null) throw "unknown variant: "+only
    local reference=null
    foreach(name in names) {
        if(only!="" && only!=name) continue
        local fn=getroottable()[name]
        local tiny=fn(120)
        if(!(tiny==tiny) || fabs(tiny-0.021712587807413163)>1e-12) throw name+" reference checksum"
        for(local w=0;w<warmups;w++) fn(iterations)
        local start=G.get_monotonic_time(),value=fn(iterations),elapsed=G.get_monotonic_time()-start
        if(!(value==value)) throw name+" invalid value"
        if(reference==null) reference=value
        else if(fabs(value-reference)>1e-10) throw name+" cross-variant checksum"
        print(format("BENCH\t%s\t%d\t%.9f\t%.17g\n",name,iterations,elapsed.tofloat()/iterations,value))
    }
}
