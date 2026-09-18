// Same ordinary bytecode with and without the experimental LLVM block tier.
local m=sqgi.kernel.compile("export i64 twice(i64 x){return x*2;}");
local workloads=[
    ["arithmetic", "return function(fn,n){local s=0;for(local i=0;i<n;i++)s+=i*2;return s;};"],
    ["float_arithmetic", "return function(fn,n){local s=0.5;for(local i=0;i<n;i++)s+=i*0.5;return s;};"],
    ["float_recurrence", "return function(fn,n){local s=0.5;for(local i=0;i<n;i++)s=s*0.9999+0.125;return s;};"],
    ["branches", "return function(fn,n){local s=0;for(local i=0;i<n;i++){if(i<500000)s+=i;else s-=i;}return s;};"],
    ["kernel_calls", "return function(fn,n){local s=0;for(local i=0;i<n;i++)s+=fn(i);return s;};"]
];
local report=[];
local json_output=vargv.len()>0 && vargv[0]=="--json";
foreach(w in workloads){
    local interpreted=compilestring(w[1])(),compiled=compilestring(w[1])();
    local start=clock();sqgi.llvm.compile(compiled);local compile_ms=(clock()-start)*1000;
    local n=1000000,expected=interpreted(m.twice,n),samples=[[],[]],paths=[interpreted,compiled];
    if((w[0]=="arithmetic"||w[0]=="kernel_calls") && expected!=n*(n-1))throw "reference checksum";
    if(w[0]=="float_arithmetic" && expected!=0.5+0.25*n*(n-1))throw "float reference checksum";
    if(w[0]=="branches" && expected!=-250000000000)throw "branch reference checksum";
    // First call collects targets; the second can compile the specialized loop.
    // Keep both executions outside steady-state timing.
    local warm_start=clock();
    for(local warm=0;warm<2;warm++)foreach(fn in paths)if(fn(m.twice,n)!=expected)throw "warmup checksum";
    local warmup_ms=(clock()-warm_start)*1000;
    for(local sample=0;sample<11;sample++)for(local turn=0;turn<2;turn++){
        local index=(sample+turn)%2;start=clock();local result=paths[index](m.twice,n);
        samples[index].append((clock()-start)*1e9/n);
        if(result!=expected)throw "timed checksum";
    }
    samples[0].sort();samples[1].sort();local stats=sqgi.llvm.info(compiled);
    report.append({name=w[0],n=n,result=expected,interpreter_ns=samples[0][5],llvm_ns=samples[1][5],
        samples_ns=samples,compile_ms=compile_ms,warmup_ms=warmup_ms,stats=stats});
    if(!json_output)print(format("%s interpreter_ns=%.2f llvm_ns=%.2f speedup=%.2f compile_ms=%.2f lowered=%d/%d direct=%d leaf_calls=%d\n",
        w[0],samples[0][5],samples[1][5],samples[0][5]/samples[1][5],compile_ms,stats.lowered,stats.instructions,stats.direct,stats.leaf_calls));
}
if(json_output)print(sqgi.json.stringify({clock="process CPU",cases=report})+"\n");
