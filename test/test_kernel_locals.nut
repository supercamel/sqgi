function check(ok,message) {if(!ok)throw "FAIL: "+message;}
function fails(fn,text) {
    local error=null;try{fn();}catch(e){error=e.tostring();}
    check(error!=null && error.find(text)!=null,"expected "+text+", got "+error);
}
local m=sqgi.kernel.compile(@"
struct Pair { i64 x; f64 y; };
class Counter {
    i64 value;
    f64 scale;
    bool enabled;
    i64 add(i64 amount) { if(this.enabled){this.value+=amount;} return this.value; }
};
void fill(inout i64 a[]) {for(i64 i=0;i<a.len();i+=1){a[i]=i+2;}}
i64 local_helper(i64 n) {Counter c; c.enabled=true;c.value=7;return c.add(n);}
i64 sum(in i64 a[]) {i64 total=0;for(i64 i=0;i<a.len();i+=1){total+=a[i];}return total;}
void change(inout Counter c) {c.enabled=true;c.add(4);}
export i64 objects(i64 seed) {
    Counter a; Counter b; a.enabled=true;
    require(a.value==0 && b.value==0 && a.scale==0.0 && !b.enabled);
    a.value=seed; b.value=1; change(b);
    return a.add(b.value)+local_helper(2)+local_helper(3);
}
export i64 scratch(i64 n) {
    i64 a[7]; i64 b[3];
    require(sum(a)==0 && sum(b)==0);
    fill(a); fill(b);
    return sum(a)+sum(b)+a[n];
}
export f64 records() {
    Pair a[3]; f64 b[4];
    require(a[2].x==0 && a[2].y==0.0 && b[3]==0.0);
    a[0].x=3;a[2].y=2.5;b[1]=1.25;
    return a[2].y+b[1];
}
export i64 reset(i64 n) {
    i64 total=0;
    for(i64 i=0;i<n;i+=1) {
        Counter c; i64 a[2];
        require(c.value==0 && !c.enabled && a[0]==0 && a[1]==0);
        c.enabled=true;c.add(i);a[0]=7;a[1]=9;total+=c.value;
    }
    return total;
}
export i64 shadow() {
    Counter c;c.value=12;
    {Counter c;c.value=23;require(c.value==23);}
    return c.value;
}
export void fail(inout i64 output[1],i64 n) {
    i64 local[2];output[0]+=1;local[n]=7;
}
export i64 type_name_variable() {
    Counter Counter;Counter.enabled=true;Counter.value=3;return Counter.add(2);
}
f64 mix(f64 x, f64 y) {
    Counter state; f64 a[2]; f64 b[2];
    a[0]=x;a[1]=y;b[0]=y;b[1]=x;
    state.scale=a[0]*b[0]+a[1]*b[1];return state.scale;
}
export f64 mixed_regions(inout f64 output[1],i64 stop) {
    Counter a;Counter b;f64 scratch[2];
    a.scale=1.0;b.scale=2.0;
    for(i64 i=0;i<4;i+=1) {
        scratch[0]=mix(a.scale,b.scale);scratch[1]=mix(b.scale,0.5);
        a.scale=scratch[0];b.scale=scratch[1];output[0]=a.scale+b.scale;
        require(i!=stop);
    }
    return a.scale+b.scale;
}
export i64 helper_shadow(i64 input) {
    i64 a[4];fill(a);return sum(a)+local_helper(input);
}
", "compiled-locals.sqk");
check(m.objects(10)==34,"independent objects and inlined local storage");
check(m.scratch(6)==52,"local arrays passed to runtime-length helpers");
check(m.records()==3.75,"contiguous struct/f64 storage");
check(m.reset(100)==4950,"loop-local declarations reset every iteration");
check(m.shadow()==12,"lexical storage identity");
check(m.type_name_variable()==5,"type-name variable is not confused with declaration");
check(m.helper_shadow(5)==26,"nested helper local relocation");
local floats=m.array("f64",1);
check(m.mixed_regions(floats,-1)==258.0 && floats.get(0)==258.0,"independent mixed floating storage regions");
fails(function(){m.mixed_regions(floats,1);},"require failed");
check(floats.get(0)==18.0,"promoted local state preserves writes before failure");
fails(function(){m.scratch(-1);},"out of bounds");
fails(function(){m.scratch(7);},"out of bounds");
local output=m.array("i64",1);
fails(function(){m.fail(output,2);},"out of bounds");
check(output.get(0)==1,"local failure preserves external write exactly once");
setdebughook(function(event,source,line,name){});
local value=m.objects(0);setdebughook(null);
check(value==24,"regular adapter with native local objects");
foreach(source in [
    "export void f(){i64 a[0];}",
    "export void f(i64 n){i64 a[n];}",
    "export void f(){f64 a[99999999999999999999];}",
    "export void f(){i64 a[8193];}",
    "export void f(){bool a[2];}",
    "class C{i64 x;};export void f(){C a[2];}",
    "class C{i64 x;};export i64 f(){C c;return c;}",
    "export i64 f(){i64 a[2];return a;}",
    "class C{i64 x;};export void f(){C c;C c;}",
    "class C{i64 x;};export i64 f(){{C c;}return c.x;}",
    "void g(inout i64 a[],in i64 b[]){} export void f(){i64 a[2];g(a,a);}",
    "void g(inout i64 a[]){} export void f(in i64 a[]){g(a);}",
    "struct S{i64 x;};export void f(){S s;}"
]) {
    local rejected=false;try{sqgi.kernel.compile(source);}catch(e){rejected=true;}
    check(rejected,"invalid local storage rejected: "+source);
}
print("compiled locals: objects, arrays, helper relocation, loop reset and failure checks passed\n");
