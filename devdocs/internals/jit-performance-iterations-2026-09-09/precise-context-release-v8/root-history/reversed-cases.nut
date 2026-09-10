// Mutable shared state reached from methods, excluded from PGO training.
// Keep root fallback costs visible alongside ordinary receiver-field writes.
local G=import("GLib"), iterations=200000, warmups=5;
foreach(arg in vargv) {
    if(arg.find("--iterations=")==0) iterations=arg.slice(13).tointeger();
    if(arg.find("--warmups=")==0) warmups=arg.slice(10).tointeger();
}
if(iterations<=0 || warmups<0) throw "invalid benchmark arguments";
root_numeric <- 0; root_payload <- null;
class OwnCounter {
    value=0;
    function update(next) { value=next; return next; }
}
class RootCounter {
    function update(next) { root_numeric=next; return next; }
}
class RootTransform {
    function update(next) { root_numeric=next; return next+1; }
}
class RootPublisher {
    function update(next) { root_payload=next; return next[0]; }
}
function counter_work(n,shared) {
    root_numeric=0;
    local receiver=shared ? RootCounter() : OwnCounter(), sum=0;
    for(local i=0;i<n;i++) sum=(sum+receiver.update((i*13+7)%997))%1000003;
    return sum+(shared ? root_numeric : receiver.value);
}
function reference_work(n) {
    root_payload=null;
    local receiver=RootPublisher(), pool=[], sum=0;
    for(local j=0;j<17;j++) pool.append([j*23+5]);
    for(local i=0;i<n;i++) sum=(sum+receiver.update(pool[i%17]))%1000003;
    return sum+root_payload[0];
}
function transformed_work(n) {
    root_numeric=0;
    local receiver=RootTransform(), sum=0;
    for(local i=0;i<n;i++) sum=(sum+receiver.update((i*13+7)%997))%1000003;
    return sum+root_numeric;
}
local cases=[
    ["receiver_integer",function(n){return counter_work(n,false)}],
    ["root_integer",function(n){return counter_work(n,true)}],
    ["root_reference",reference_work],
    ["root_integer_result",transformed_work]
];
cases.reverse();
foreach(item in cases) {
    local name=item[0], f=item[1], expected=f(iterations);
    for(local w=0;w<warmups;w++) if(f(iterations)!=expected) throw name+" warm checksum";
    local start=G.get_monotonic_time(), value=f(iterations), elapsed=G.get_monotonic_time()-start;
    if(value!=expected) throw name+" checksum";
    print(format("BENCH\t%s\t%d\t%.9f\t%d\n",name,iterations,elapsed.tofloat()/iterations,value));
}
