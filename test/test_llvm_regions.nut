// Exercise promoted ordinary loops, including guards that leave partially updated locals.
function check(ok,msg){if(!ok)throw "FAIL: "+msg;}
function result(fn,a,n,b){try{return [true,fn(a,n,b)];}catch(e){return [false,e.tostring()];}}
local cases=[
    "local s=a;for(local i=0;i<n;i++)s+=i*2;return s;",
    "local s=a;for(local i=0;i<n;i++)s+=i*b;return s;",
    "local s=a;for(local i=0;i<n;i++)s=s*b+0.125;return s;",
    "local s=a;for(local i=0;i<n;i++){if(i<5)s+=i;else s-=i;}return s;",
    "local s=a;for(local i=0;i<n;i++){if(i>=3)s=0.5;s+=i;}return s;",
    "local s=a;for(local i=0;i<n;i++){local old=s++;s=old+b;}return s;"
];
local nan=0.0/0.0,inf=1.0/0.0;
foreach(body in cases){
    local source="return function(a,n,b){"+body+"};",plain=compilestring(source)(),fast=sqgi.llvm.compile(compilestring(source)());
    for(local warm=0;warm<3;warm++)check(fast(1,10,2)==plain(1,10,2),"warmup");
    check(sqgi.llvm.info(fast).fused_entries>0,"ordinary loop did not promote");
    foreach(n in [-1,0,1,2,7,10,100,3.5])foreach(a in [0,1,-7,0.5,-0.0,nan,inf,-inf,"s",null])foreach(b in [2,-1,0.9999]){
        local expected=result(plain,a,n,b),actual=result(fast,a,n,b);
        check(expected[0]==actual[0],"error status");
        local x=expected[1],y=actual[1];
        check(typeof x==typeof y && (x==y || (typeof x=="float" && x!=x && y!=y)),"differential value/error");
        if(typeof x=="float" && x==0.0)check(1.0/x==1.0/y,"signed zero");
    }
}
local effects=0;
class Seed {function _add(x){effects++;collectgarbage();return x+10;}}
local fn=sqgi.llvm.compile(function(a,n){local s=a;for(local i=0;i<n;i++)s+=i;return s;});
for(local j=0;j<3;j++)check(fn(0,10)==45,"seed warmup");
local before=sqgi.llvm.info(fn).fused_entries;
check(fn(Seed(),10)==55 && effects==1,"GC/metamethod after promotion");
check(sqgi.llvm.info(fn).fused_entries>before,"managed seed did not exit promoted region");
local wrap=sqgi.llvm.compile(function(a,n){local s=a;for(local i=0;i<n;i++)s+=1;return s;});
for(local j=0;j<3;j++)wrap(0,10);
check(wrap(9223372036854775807,1)==(-9223372036854775807-1),"wrapping arithmetic");
// Mutating parameters invalidates the proof that they own all managed locals.
local changed=sqgi.llvm.compile(function(a,n){for(local i=0;i<n;i++)a+=i;return a;});
for(local j=0;j<3;j++)check(changed(0,10)==45,"mutable parameter fallback");
check(sqgi.llvm.info(changed).fused_entries==0,"mutable parameter promoted");
print("promoted ordinary loops and side exits passed\n");
