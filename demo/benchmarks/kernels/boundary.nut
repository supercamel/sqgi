// Invoked by run.py with the native suite's exported fixture JSON.
local Gio=import("Gio"),D=import("demo/kernels/support.nut");
local loaded=Gio.File.new_for_path(vargv[0]).load_contents(null);
local fixtures=sqgi.json.parse(typeof(loaded)=="array"?loaded[0]:loaded);
local specs={
    astar={file="astar",types=["i64","Search","i64"],fields=["g","f","parent","status"]},
    geometry={file="geometry",types=["Vec3","Vec3"],fields=["x","y","z"]},
    sum={file="reductions",types=["f64"]},
    dot={file="reductions",types=["f64","f64"]},
    prefix={file="reductions",types=["f64","f64"]},
    particles={file="particles",types=["Particle"],fields=["x","y","vx","vy","active"]},
    image={file="image",types=["i64","i64"]},
    matrix={file="matrix",types=["f64","f64","f64"]},
    routing={file="routing",types=["Box","i64"],fields=["left","bottom","right","top"]},
    histogram={file="histogram",types=["i64","i64"]},
    stencil={file="stencil",types=["f64","f64"]}
};
function fields_for(spec,type){return type=="i64"||type=="f64"?null:spec.fields;}
function fill(buffers,spec,values) {
    foreach(index,buffer in buffers) {
        local type=spec.types[index],fields=fields_for(spec,type),data=values[index];
        if(fields==null){for(local i=0;i<data.len();i++)buffer.set(i,type=="f64"?data[i].tofloat():data[i].tointeger());}
        else for(local i=0;i<data.len()/fields.len();i++) {
            local record={};foreach(j,field in fields)record[field]<-(field=="active"||spec.file=="astar")?data[i*fields.len()+j].tointeger():data[i*fields.len()+j].tofloat();
            buffer.set(i,record);
        }
    }
}
function verify(buffers,spec,expected) {
    foreach(index,buffer in buffers) {
        local fields=fields_for(spec,spec.types[index]),data=expected[index];
        if(fields==null){for(local i=0;i<data.len();i++)D.check(buffer.get(i)==data[i],"scalar output mismatch");}
        else for(local i=0;i<data.len()/fields.len();i++) {
            local record=buffer.get(i);foreach(j,field in fields)D.check(record[field]==data[i*fields.len()+j],"struct output mismatch");
        }
    }
}
function make_call(name,m,b,n,pattern) {
    switch(name) {
        case "astar":return function(){return m.search(b[0],b[1],b[2],0,pattern=="same"?0:255);};
        case "geometry":return function(){return m.transform(b[0],b[1],n,1.5,2.0,-1.0,0.5);};
        case "sum":return function(){return m.sum(b[0],n);};
        case "dot":return function(){return m.dot(b[0],b[1],n);};
        case "prefix":return function(){return m.prefix(b[0],b[1],n);};
        case "particles":return function(){return m.step(b[0],n,0.125);};
        case "image":return function(){return m.threshold(b[0],b[1],n,16,128);};
        case "matrix":return function(){return m.multiply(b[0],b[1],b[2],n);};
        case "routing":return function(){return m.overlaps(b[0],b[1],n,4.0,4.0,8.0,8.0);};
        case "histogram":return function(){return m.histogram(b[0],b[1],n);};
        case "stencil":return function(){return m.diffuse(b[0],b[1],n);};
    }
    throw "unknown workload";
}
local modules={},cases=[];
foreach(test in fixtures.cases) {
    local spec=specs[test.workload];
    if(!(spec.file in modules))modules[spec.file]<-D.load(spec.file);
    local m=modules[spec.file],buffers=[];
    foreach(i,type in spec.types){local fields=fields_for(spec,type);buffers.append(m.array(type,test.initial[i].len()/(fields==null?1:fields.len())));}
    local fn=make_call(test.workload,m,buffers,test.size,test.pattern);
    fill(buffers,spec,test.initial);local result=fn();
    D.check(result==null?test.result==0:result==test.result,"return mismatch");verify(buffers,spec,test.expected);
    fill(buffers,spec,test.initial);for(local i=0;i<test.repetitions;i++)fn();verify(buffers,spec,test.repeated_expected);
    local times=[],repeats=test.timing_repetitions;
    for(local sample=0;sample<7;sample++) {
        fill(buffers,spec,test.initial);
        local start=clock();for(local i=0;i<repeats;i++)fn();
        times.append((clock()-start)*1e9/repeats);
    }
    times.sort();D.check(times[3]>0,"insufficient clock resolution");
    cases.append({workload=test.workload,size=test.size,pattern=test.pattern,repetitions=repeats,
        kernel_via_squirrel_ns=times[3],min_ns=times[0],max_ns=times[6],samples=7});
}
print(sqgi.json.stringify({backend=sqgi.kernel.backend,cases=cases})+"\n");
