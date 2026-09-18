function check(ok,msg){if(!ok)throw "FAIL: "+msg;}
function failure(fn){try{fn();}catch(e){return e.tostring();}throw "expected error";}
local k=sqgi.kernel.compile(@"
export i64 twice(i64 x){return x*2;}
export i64 affine(i64 x){return x*3+1;}
export i64 negate(i64 x){return -x;}
export bool positive(i64 x){return x>0;}
export i64 four(i64 a,i64 b,i64 c,i64 d){return (a+b)*(c-d);}
export i64 checked(i64 x){require(x<50);return x;}
export f64 real(f64 x){return x*2.0;}
export void nothing(i64 x){return;}
","inline.sqk");
local source="return function(fn,n,seed){local s=seed;for(local i=0;i<n;i++)s+=fn(i);return s;};";
local plain=compilestring(source)(),fast=sqgi.llvm.compile(compilestring(source)());
for(local j=0;j<4;j++)check(fast(k.twice,100,0)==9900,"warmup");
check(sqgi.llvm.info(fast).inlined_calls>0,"kernel did not inline");
foreach(n in [-7,0,1,2,3,3.5,7,33,128,1000])foreach(seed in [0,7,-31,0.5])
    check(fast(k.twice,n,seed)==plain(k.twice,n,seed),"trip count and scalar seed");
check(fast(null,0,7)==7,"zero-trip loop must not validate an unused callee");
check(fast(k.twice,3,"s")=="s024","string side exit");
// A different closure, function/module or bound environment must guard out.
local before=sqgi.llvm.info(fast).inlined_calls;
check(fast(k.affine,100,0)==14950,"different native callee");
local other=sqgi.kernel.compile("export i64 twice(i64 x){return x*4;}");
check(fast(other.twice,100,0)==19800,"different module");
check(fast(k.twice.bindenv({}),100,0)==9900,"bound callee");
check(fast(function(x){return x*5;},100,0)==24750,"ordinary callee");
check(sqgi.llvm.info(fast).inlined_calls==before,"callee guards bypassed");
check(fast(k.twice,100,0)==9900 && sqgi.llvm.info(fast).inlined_calls>before,"original target resumes fusion");
// Materialize the sum, loop counter and call temporaries before a metamethod.
local effects=0;
class Seed {
    function _add(x){effects++;collectgarbage();return x+7;}
}
before=sqgi.llvm.info(fast).inlined_calls;
check(fast(k.twice,10,Seed())==97 && effects==1,"metamethod handoff/replay");
check(sqgi.llvm.info(fast).inlined_calls>before,"metamethod test did not exercise fused exit");
// Mid-loop strict-type failure after successful inlined calls.
local mixed=sqgi.llvm.compile(function(fn,n){local s=0;for(local i=0;i<n;i++){local x=i;if(i>=5)x=0.5;s+=fn(x);}return s;});
for(local j=0;j<12;j++)check(mixed(k.twice,4)==12,"short warmup");
before=sqgi.llvm.info(mixed).inlined_calls;
check(failure(function(){mixed(k.twice,10);}).find("i64 integer")!=null,"strict argument error");
check(sqgi.llvm.info(mixed).inlined_calls>=before+5,"mid-loop exit did not follow inlined calls");
// Callee changes inside the loop require a fully materialized managed temporary.
local switcher=sqgi.llvm.compile(function(fn,other,n){local current=fn,s=0;for(local i=0;i<n;i++){if(i>=5)current=other;s+=current(i);}return s;});
local switches=0,alternative=function(x){switches++;collectgarbage();return x*3;};
for(local j=0;j<12;j++)check(switcher(k.twice,alternative,4)==12,"callee switch warmup");
before=sqgi.llvm.info(switcher).inlined_calls;
check(switcher(k.twice,alternative,10)==125 && switches==5,"mid-loop callee switch replay/state");
check(sqgi.llvm.info(switcher).inlined_calls>=before+5,"callee switch did not exit fused code");
// Multiple callees and signed arithmetic/comparison IR.
local two=sqgi.llvm.compile(function(a,b,n){local s=0;for(local i=0;i<n;i++)s+=a(i)+b(i);return s;});
for(local j=0;j<4;j++)check(two(k.twice,k.negate,100)==4950,"two call sites");
check(sqgi.llvm.info(two).inlined_calls>0,"two sites not inlined");
local pred=sqgi.llvm.compile(function(fn,n){local s=0;for(local i=0;i<n;i++)if(fn(i))s+=i;return s;});
for(local j=0;j<4;j++)check(pred(k.positive,100)==4950,"bool return");
check(sqgi.llvm.info(pred).inlined_calls>0,"comparison kernel not inlined");
local four=sqgi.llvm.compile(function(fn,n){local s=0;for(local i=0;i<n;i++)s+=fn(i,2,5,3);return s;});
for(local j=0;j<4;j++)check(four(k.four,100)==10300,"four argument kernel");
check(sqgi.llvm.info(four).inlined_calls>0,"four arguments not inlined");
local discard=sqgi.llvm.compile(function(fn,n){for(local i=0;i<n;i++)fn(i);return n;});
for(local j=0;j<4;j++)check(discard(k.nothing,100)==100,"void kernel");
// Checks/effects/floating kernels cannot use this pure-integer tier.
local checked=sqgi.llvm.compile(compilestring(source)());
for(local j=0;j<4;j++)check(checked(k.checked,40,0)==780,"require warmup");
check(sqgi.llvm.info(checked).fused_entries==0,"require incorrectly inlined");
check(failure(function(){checked(k.checked,100,0);}).find("require failed")!=null,"require error");
local real=sqgi.llvm.compile(function(fn,n,x){local s=0.0;for(local i=0;i<n;i++)s+=fn(x);return s;});
for(local j=0;j<4;j++)check(real(k.real,100,1.0)==200.0,"float fallback");
check(sqgi.llvm.info(real).fused_entries==0,"floating kernel incorrectly inlined");
// Debug hooks still see normal VM execution.
before=sqgi.llvm.info(fast).inlined_calls;
setdebughook(function(...){ });check(fast(k.twice,100,0)==9900,"debug hook");setdebughook(null);
check(sqgi.llvm.info(fast).inlined_calls==before,"debug bypass failed");
// Keep the VM callable alive independently of its module table.
local retained=k.twice;k=null;collectgarbage();
check(fast(retained,100,0)==9900,"profile/code lifetime");
// Drop the profiled callable itself; new holders must not inherit its identity.
local churn=sqgi.llvm.compile(compilestring(source)());
local old=sqgi.kernel.compile("export i64 value(i64 x){return x*2;}");
for(local j=0;j<4;j++)check(churn(old.value,100,0)==9900,"churn warmup");
check(sqgi.llvm.info(churn).inlined_calls>0,"churn did not specialize");
old=null;collectgarbage();before=sqgi.llvm.info(churn).inlined_calls;
for(local j=0;j<20;j++){
    local replacement=sqgi.kernel.compile("export i64 value(i64 x){return x*3;}");
    check(churn(replacement.value,100,0)==14850,"replacement callable identity");
    replacement=null;collectgarbage();
}
check(sqgi.llvm.info(churn).inlined_calls==before,"replacement matched stale profile");
print("LLVM kernel inlining and materialized exits passed\n");
