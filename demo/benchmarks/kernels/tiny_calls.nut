// Equivalent ordinary caller loops: compile the whole loop, not only the kernel.
local D=import("demo/kernels/support.nut"),m=D.load("typed_objects");
local simple=sqgi.kernel.compile("export i64 twice(i64 x){return x*2;}");
local cases=[
    ["integer_export","return function(m,c,n){local s=0;for(local i=0;i<n;i++)s+=m(i);return s;};"],
    ["scalar_method","return function(m,c,n){local s=0.0;for(local i=0;i<n;i++)s=c.advance(18.0,0.25);return s;};"]
];
local results=[];
foreach(test in cases){
    local plain=compilestring(test[1])(),compiled=compilestring(test[1])();
    sqgi.llvm.compile(compiled);
    local paths=[plain,compiled],timings=[[],[]],n=1000000,c=m.Controller();
    c.target=20.0;c.gain=0.5;c.integral_gain=0.125;c.enabled=true;
    local expected=test[0]=="integer_export"?n*(n-1):1.0+n*0.0625;
    for(local sample=-2;sample<11;sample++)for(local turn=0;turn<2;turn++){
        local index=(sample+2+turn)%2;c.integral=0.0;c.samples=0;
        local start=clock(),value=paths[index](simple.twice,c,n),ns=(clock()-start)*1e9/n;
        if(value!=expected)throw "result mismatch";
        if(test[0]=="scalar_method" && (c.samples!=n || c.integral!=n*0.5))throw "state mismatch";
        if(sample>=0)timings[index].append(ns);
    }
    timings[0].sort();timings[1].sort();
    results.append({name=test[0],n=n,result=expected,interpreter_ns=timings[0][5],llvm_ns=timings[1][5],samples_ns=timings,stats=sqgi.llvm.info(compiled)});
}
print(sqgi.json.stringify({backend=sqgi.kernel.backend,cases=results})+"\n");
