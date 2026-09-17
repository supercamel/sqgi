// Pure kernel calls fused into ordinary Squirrel loops. No hand-written batch kernel.
local m=sqgi.kernel.compile(@"
export i64 twice(i64 x){return x*2;}
export i64 affine(i64 x){return x*3+7;}
export i64 square(i64 x){return x*x;}
");
local name=vargv.len()?vargv[0]:"twice",n=name=="square"?10000:1000000,repeats=10000000/n;
local expected=name=="twice"?n*(n-1):name=="affine"?3*n*(n-1)/2+7*n:n*(n-1)*(2*n-1)/6;
local fn=compilestring("return function(kernel,n,seed){local sum=seed;for(local i=0;i<n;i++)sum+=kernel(i);return sum;};")();
local start=clock();sqgi.llvm.compile(fn);
local initial_compile_ms=(clock()-start)*1000.0;
start=clock();for(local warm=0;warm<3;warm++)if(fn(m[name],n,0)!=expected)throw "warmup result";
local warmup_ms=(clock()-start)*1000.0,timings=[],checksums=[];
for(local sample=0;sample<11;sample++){
    local seed=sample%2?7:0,sum=0;
    start=clock();for(local i=0;i<repeats;i++)sum+=fn(m[name],n,seed);
    timings.append((clock()-start)*1e9/(n*repeats));checksums.append(sum);
    if(sum!=(expected+seed)*repeats)throw "timed checksum";
}
timings.sort();local stats=sqgi.llvm.info(fn);
if(stats.inlined_calls==0)throw "benchmark did not exercise kernel inlining";
print(sqgi.json.stringify({name=name,n=n,repeats=repeats,expected=expected,checksums=checksums,
    ns=timings[5],samples_ns=timings,initial_compile_ms=initial_compile_ms,warmup_ms=warmup_ms,stats=stats})+"\n");
