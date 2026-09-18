function check(ok,msg){if(!ok)throw "FAIL: "+msg;}
function failure(fn){try{fn();}catch(e){return e.tostring();}throw "expected error";}
function delegate(c){return {}.getdelegate.call(c);}
local m=sqgi.kernel.compile(@"
class State {
    i64 count;
    f64 total;
    f64 advance(f64 x,f64 dt){require(dt>0.0);this.count+=1;this.total+=x*dt;return this.total;}
    i64 checked(i64 limit){this.count+=1;require(this.count<=limit);return this.count;}
    bool flag(bool b){this.count+=1;return b;}
    void clear(){this.total=0.0;}
    i64 counted(i64 n){this.count+=1;i64 s=0;for(i64 i=0;i<n;i+=1){s+=i;}return s;}
    i64 divide(i64 n){this.count+=1;return 12/n;}
};
","methods.sqk");
local c=m.State();
local loop=sqgi.llvm.compile(function(c,n,x,dt){local s=0.0;for(local i=0;i<n;i++)s=c.advance(x,dt);return s;});
for(local j=0;j<3;j++){c.count=0;c.total=0.0;check(loop(c,100,2.0,0.25)==50.0,"warmup");}
check(sqgi.llvm.info(loop).prepared_calls>0,"method did not use prepared path");
foreach(n in [0,1,2,7,100,3.5]){
    c.count=0;c.total=0.0;local plain=function(c,n,x,dt){local s=0.0;for(local i=0;i<n;i++)s=c.advance(x,dt);return s;};
    local expected=plain(c,n,3.0,0.25),count=c.count,total=c.total;c.count=0;c.total=0.0;
    check(loop(c,n,3.0,0.25)==expected && c.count==count && c.total==total,"output/state");
}
check(loop(null,0,0,0)==0.0,"unused receiver/arguments");
c.count=0;c.total=0.0;
check(failure(function(){loop(c,10,2,0.25);}).find("f64 float")!=null && c.count==0,"strict argument type");
check(failure(function(){loop(c,10,2.0,0.0);}).find("require failed")!=null && c.count==0,"require before effects");
local checked=sqgi.llvm.compile(function(c,n,limit){local r=0;for(local i=0;i<n;i++)r=c.checked(limit);return r;});
for(local j=0;j<3;j++){c.count=0;check(checked(c,100,1000)==100,"checked warmup");}
c.count=0;local before=sqgi.llvm.info(checked).prepared_calls;
check(failure(function(){checked(c,100,5);}).find("methods.sqk:")!=null && c.count==6,"error after writes was replayed");
check(sqgi.llvm.info(checked).prepared_calls==before+6,"error did not come from prepared path");
// Different receivers and mutations to the same receiver's delegate must guard out.
local other=m.State();before=sqgi.llvm.info(loop).prepared_calls;
check(loop(other,10,2.0,0.25)==5.0 && other.count==10,"other receiver");
local d=delegate(c),original=d.advance;
d.advance=function(x,dt){this.count+=1;::collectgarbage();return 123.0;};c.count=0;
check(loop(c,10,2.0,0.25)==123.0 && c.count==10,"changed delegate/GC");
check(sqgi.llvm.info(loop).prepared_calls==before,"changed method matched profile");
d.advance=original;c.count=0;c.total=0.0;
check(loop(c,10,2.0,0.25)==5.0 && sqgi.llvm.info(loop).prepared_calls>before,"restored method");
d.advance=original.bindenv({});c.count=0;c.total=0.0;before=sqgi.llvm.info(loop).prepared_calls;
check(failure(function(){loop(c,10,2.0,0.25);}).find("typed handle")!=null && sqgi.llvm.info(loop).prepared_calls==before,"bound method fallback");
d.advance=original;
local switching=sqgi.llvm.compile(function(c,other,n){local current=c,r=0.0;for(local i=0;i<n;i++){if(i>=5)current=other;r=current.advance(2.0,0.25);}return r;});
for(local j=0;j<12;j++)switching(c,other,4);
c.count=0;c.total=0.0;other.count=0;other.total=0.0;before=sqgi.llvm.info(switching).prepared_calls;
check(switching(c,other,10)==2.5 && c.count==5 && other.count==5,"mid-loop receiver switch");
check(sqgi.llvm.info(switching).prepared_calls==before+5,"switch did not leave prepared region");
local types=sqgi.llvm.compile(function(c,n){local r=0.0;for(local i=0;i<n;i++){local dt=0.25;if(i>=5)dt=1;r=c.advance(2.0,dt);}return r;});
for(local j=0;j<12;j++)types(c,4);
c.count=0;c.total=0.0;before=sqgi.llvm.info(types).prepared_calls;
check(failure(function(){types(c,10);}).find("f64 float")!=null && c.count==5 && c.total==2.5,"mid-loop type error");
check(sqgi.llvm.info(types).prepared_calls==before+5,"type error did not leave prepared region");
local many=sqgi.llvm.compile(function(c,n){local r=false;for(local i=0;i<n;i++){c.clear();r=c.flag(true);}return r;});
for(local j=0;j<3;j++)check(many(c,100),"bool/void multiple methods");
check(sqgi.llvm.info(many).prepared_calls>0 && c.total==0.0,"multiple methods did not prepare");
local pair=sqgi.llvm.compile(function(a,b,n){local r=0.0;for(local i=0;i<n;i++){r=a.advance(2.0,0.25);r+=b.advance(3.0,0.25);}return r;});
for(local j=0;j<3;j++){c.total=0.0;other.total=0.0;check(pair(c,other,100)==125.0,"two receivers");}
check(sqgi.llvm.info(pair).prepared_calls>0,"two receiver pointers not prepared");
local budget=sqgi.llvm.compile(function(c,n,work){local r=0;for(local i=0;i<n;i++)r=c.counted(work);return r;});
for(local j=0;j<3;j++)check(budget(c,40,10)==45,"budget warmup");
check(budget(c,2,600000)==179999700000,"fuel not reset per call");
c.count=0;before=sqgi.llvm.info(budget).prepared_calls;
check(failure(function(){budget(c,2,2000000);}).find("budget")!=null && c.count==1,"fuel error replay");
check(sqgi.llvm.info(budget).prepared_calls==before+1,"budget did not use prepared path");
local divide=sqgi.llvm.compile(function(c,n,x){local r=0;for(local i=0;i<n;i++)r=c.divide(x);return r;});
for(local j=0;j<3;j++)check(divide(c,40,3)==4,"division warmup");
c.count=0;before=sqgi.llvm.info(divide).prepared_calls;
check(failure(function(){divide(c,2,0);}).find("division")!=null && c.count==1,"arithmetic error replay");
check(sqgi.llvm.info(divide).prepared_calls==before+1,"division did not use prepared path");
before=sqgi.llvm.info(loop).prepared_calls;c.total=0.0;
setdebughook(function(...){});check(loop(c,10,2.0,0.25)==5.0,"debug result");setdebughook(null);
check(sqgi.llvm.info(loop).prepared_calls==before,"debug bypass");
m=null;collectgarbage();c.total=0.0;
check(loop(c,10,2.0,0.25)==5.0,"module retained by instance/profile");
print("prepared stateful methods, guarded exits and exact errors passed\n");
