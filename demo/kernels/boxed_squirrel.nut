// Ordinary boxed Squirrel and typed native kernels, in the same VM frame.
local m=sqgi.kernel.compile(@"
class Counter { i64 value; i64 add(i64 n){this.value+=n;return this.value;} };
");
local run=function(counter,n){
    local total=0;
    for(local i=0;i<n;i++)total+=counter.add(1);
    return {total=total,value=counter.value};
};
sqgi.llvm.compile(run);
local result=run(m.Counter(),100),stats=sqgi.llvm.info(run);
assert(result.total==5050 && result.value==100 && stats.leaf_calls==100);
print(format("total=%d value=%d native kernel calls=%d\n",result.total,result.value,stats.leaf_calls));
