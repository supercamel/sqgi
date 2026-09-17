// Differential checks use distinct prototypes, so one always stays interpreted.
function pair(body) {
    local source="return function(a,b,c){"+body+"};";
    return [compilestring(source)(),sqgi.llvm.compile(compilestring(source)())];
}
function same(p,a,b,c=null) {
    local expected=null,actual=null,e1=null,e2=null;
    try{expected=p[0](a,b,c);}catch(e){e1=e.tostring();}
    try{actual=p[1](a,b,c);}catch(e){e2=e.tostring();}
    if(e1!=e2)throw "error mismatch: "+e1+" / "+e2;
    if(e1==null && (typeof expected!=typeof actual || (expected!=actual && !(expected!=expected && actual!=actual))))
        throw "value mismatch: "+expected+" / "+actual;
}
local count=0;
local values=[-100,-1,0,1,5,12345,-0.0,0.0,-1.25,3.5,1e100];
foreach(op in ["+","-","*","<","<=",">",">=","<=>"]){
    local p=pair("local value=a"+op+"b;return value;");
    foreach(a in values)foreach(b in values){same(p,a,b);count++;}
}
// Comparisons must preserve the runtime's NaN/infinity behavior, including its
// raw-value equality shortcut. Float comparisons deliberately use the VM.
local nan=0.0/0.0,inf=1.0/0.0;
foreach(op in ["+","-","*","<","<=",">",">=","<=>"]){
    local p=pair("local value=a"+op+"b;return value;");
    foreach(a in [nan,inf,-inf,0.0,-0.0])foreach(b in [nan,inf,-inf,0.0,-0.0]){same(p,a,b);count++;}
}
foreach(body in ["return !a;","if(a)return 1;return 0;","local x=a;local y=x++;return y*10+x;","local x=a;local y=x--;return y*10+x;"]){
    local p=pair(body);
    foreach(a in [null,false,true,0,1,-1,0.0,-0.0,1.5,"",[],{},nan]){same(p,a,null);count++;}
}
// Managed destinations must be released by the VM, never raw-overwritten.
foreach(body in ["local x=a;x=b+1;return x;","local x=a;x=7;return x;","local x=a;x=true;return x;","local x=a;x=b;return x;"]){
    local p=pair(body);
    for(local i=0;i<100;i++)same(p,{held=[1,2,3]},i);
}
local changing=pair("local sum=a;for(local i=0;i<b;i++){if(i==3)sum=0.5;sum+=i*2;}return sum;");
foreach(seed in [0,0.5,""]){same(changing,seed,10);count++;}
local signedZero=pair("local x=a*b;return 1.0/x;");
same(signedZero,-0.0,1.0);same(signedZero,-0.0,-1.0);
// Exact integer arithmetic across the 53-bit floating precision boundary.
foreach(op in ["+","-","*","<","<=",">",">=","<=>"]){
    local p=pair("local value=a"+op+"b;return value;");same(p,9007199254740993,1);same(p,-9007199254740993,-1);count+=2;
}
local add=pair("return a+b;")[1],mul=pair("return a*b;")[1];
if(add(9223372036854775807,1,null)!=(-9223372036854775807-1))throw "integer wrap add";
if(mul(9223372036854775807,2,null)!=-2)throw "integer wrap multiply";
// Metamethod writes happen once; the failed numeric guard cannot replay them.
local called=0;
class Number {
    function _add(n){called++;return n+10;}
}
local fn=sqgi.llvm.compile(function(a){local x=a+2;return x*3;});
if(fn(Number())!=36 || called!=1)throw "metamethod replay";
// Errors after native scalar writes must preserve the visible partial state.
local state={n=0};
local fail=sqgi.llvm.compile(function(t){local n=5;n+=2;t.n=n;return n+{};});
try{fail(state);}catch(e){}
if(state.n!=7)throw "partial state on error";
local stats=sqgi.llvm.info(changing[1]);
if(stats.direct<1 || stats.direct_operations<1)throw "direct LLVM path did not execute";
collectgarbage();
print("LLVM scalar differential cases: "+count+" plus managed lifetime and fallback checks\n");
