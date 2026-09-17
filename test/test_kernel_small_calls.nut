function check(ok,msg){if(!ok)throw msg;}
function fails(fn,text){local e=null;try{fn();}catch(x){e=x.tostring();}check(e!=null && e.find(text)!=null,"expected "+text+", got "+e);}
local source=@"
class C {
    i64 n;
    i64 get(){return this.n;}
    i64 add(i64 a){this.n+=a;return this.n;}
    f64 mix(f64 a,bool b){if(b){this.n+=1;}return a*0.5;}
    i64 three(i64 a,bool b,f64 c){if(b && c>0.0){this.n+=a;}return this.n;}
    i64 four(i64 a,i64 b,i64 c,i64 d){return this.n+a+b+c+d;}
    void fail(i64 a){this.n+=a;require(false);}
};
export i64 zero(){return 7;}
export i64 one(i64 a){return a+1;}
export f64 two(f64 a,f64 b){return a+b;}
export bool three(bool a,i64 b,f64 c){return a && b>0 && c>0.0;}
export i64 four(i64 a,i64 b,i64 c,i64 d){return a+b+c+d;}
export i64 five(i64 a,i64 b,i64 c,i64 d,i64 e){return a+b+c+d+e;}
export void nothing(){return;}
export i64 fail(i64 a){require(a>0);return a;}
";
local m=sqgi.kernel.compile(source,"small.sqk");
check(m.zero()==7 && m.one(41)==42 && m.two(1.25,2.5)==3.75,"scalar results");
check(m.three(true,1,1.0) && !m.three(false,1,1.0),"bool arguments/result");
check(m.four(1,2,3,4)==10 && m.five(1,2,3,4,5)==15 && m.nothing()==null,"arity specializations/generic fallback");
fails(function(){m.zero(1);},"argument count");fails(function(){m.one();},"argument count");
fails(function(){m.one(1.0);},"i64 integer");fails(function(){m.two(1,2.0);},"f64 float");
fails(function(){m.three(1,1,1.0);},"bool");fails(function(){m.four(1,2,3,"4");},"i64 integer");
fails(function(){m.fail(0);},"small.sqk:");
local c=m.C();check(c.get()==0 && c.add(3)==3 && c.mix(4.0,true)==2.0 && c.n==4,"method specialization");
fails(function(){c.fail(2);},"require failed");check(c.n==6,"failed method must not replay");
local foreign=sqgi.kernel.compile(source).C();
fails(function(){c.add.call(foreign,1);},"schema/extent mismatch");
fails(function(){c.add.call({},1);},"typed handle");
fails(function(){c.add(1.0);},"i64 integer");
check(c.n==6 && foreign.n==0,"bad calls must not mutate receivers");
local bound=m.one.bindenv({});check(bound(8)==9,"bound environment fallback");
setdebughook(function(...){ });check(m.one(4)==5 && c.add(1)==7,"debug fallback");setdebughook(null);
if("llvm" in sqgi){
    local run=function(m,c){local s=0;for(local i=0;i<10;i++)s+=m.one(i)+c.add(1);return s;};
    sqgi.llvm.compile(run);check(run(m,c)==180 && c.n==17,"compiled caller integration");
}
local extra=m.C();check(extra.three(2,true,1.0)==2 && extra.four(1,2,3,4)==12,"three/four argument methods");
fails(function(){extra.three(2,1,1.0);},"bool");check(extra.n==2,"invalid method arguments have no effects");
local retained=m.one;m=null;collectgarbage();check(retained(9)==10,"prepared entry owner lifetime");
print("small kernel adapters passed\n");
