function check(value, message) { if (!value) throw "FAIL: " + message; }
function fails(fn, text) {
    local message = null;
    try { fn(); } catch (e) { message = e.tostring(); }
    check(message != null && message.find(text) != null, "expected " + text + "; got " + message);
}
local source=@"
struct Pair { i64 x; f64 y; };
i64 sum(in i64 a[]) {
    i64 result=0;
    for (i64 i=0; i<a.len(); i+=1) { result+=a[i]; }
    return result;
}
void put(inout i64 a[], i64 i, i64 value) { a[i]=value; }
class Counter {
    i64 value;
    f64 scale;
    bool enabled;
    void add(i64 amount) {
        if (!this.enabled) { return; }
        this.value+=amount;
    }
    i64 consume(in i64 a[]) {
        for (i64 i=0; i<a.len(); i+=1) { this.add(a[i]); }
        return this.value;
    }
    f64 scaled(f64 x) { return x*this.scale; }
    void broken(inout i64 a[]) { this.value+=1; put(a,a.len(),99); }
    void spin() { while (true) { this.value+=1; } }
};
export i64 total(in i64 a[]) { return sum(a); }
export i64 fixed(in i64 a[3]) { return sum(a); }
export i64 run(inout Counter c, in i64 a[]) { return c.consume(a); }
export i64 read(in Counter c) { return c.value; }
export void write(inout i64 a[], i64 i, i64 v) { put(a,i,v); }
export i64 shared(in i64 a[], in i64 b[]) { return sum(a)+sum(b); }
export void copy(in i64 a[], inout i64 b[]) {
    require(a.len()==b.len());
    for (i64 i=0; i<a.len(); i+=1) { put(b,i,a[i]); }
}
export void pair(inout Pair a[]) { a[a.len()-1].y=2.5; }
export i64 inspect(in Counter a, in Counter b) { return a.value+b.value; }
export void transfer(inout Counter a, inout Counter b) { a.add(1); b.add(-1); }
";
local m=sqgi.kernel.compile(source,"typed-tests.sqk");
local a=m.array("i64",3), empty=m.array("i64",0), c=m.Counter();
check(a.len()==3 && empty.len()==0,"host runtime lengths");
check(c.value==0 && c.scale==0.0 && c.enabled==false,"typed zero initialization");
c.enabled=true; c.scale=2.5; c.value=7;
local alias=c;
a.set(0,2); a.set(1,3); a.set(2,5);
check(m.total(a)==10 && m.fixed(a)==10 && m.total(empty)==0,"array helper and fixed-to-dynamic conversion");
check(m.shared(a,a)==20,"readonly array alias");
check(m.run(c,a)==17 && alias.value==17,"persistent reference identity and compiled method chain");
c.add(3); check(c.value==20 && c.scaled(4.0)==10.0,"host method calls");
c.enabled=false; c.add(8); check(c.value==20,"early void return");
check(m.inspect(c,c)==40 && m.read(c)==20,"readonly instance borrows");
local d=m.Counter(); d.enabled=true; c.enabled=true;
m.transfer(c,d); check(c.value==21 && d.value==-1,"distinct mutable instances");
fails(function(){m.transfer(c,c);},"overlapping mutable");
fails(function(){c.value=1.5;},"expected i64");
fails(function(){c.scale=1;},"expected f64");
fails(function(){c.enabled=1;},"expected bool");
check(c.value==21 && c.scale==2.5 && c.enabled,"failed field writes do not change values");
fails(function(){local v=c.missing;},"unknown typed field");
fails(function(){c.missing=4;},"unknown typed field");
fails(function(){c.add(1.0);},"expected i64");
fails(function(){c.add();},"argument count");
fails(function(){c.add(1,2);},"argument count");
fails(function(){m.Counter(1);},"constructor expects");
fails(function(){m.array("Counter",2);},"class arrays");
fails(function(){m.total(c);},"schema/extent");
fails(function(){m.read(a);},"schema/extent");
fails(function(){m.read({value=4});},"typed handle");
fails(function(){m.copy(a,a);},"overlapping mutable");
fails(function(){m.fixed(empty);},"extent mismatch");
fails(function(){m.total(m.array("f64",3));},"schema/extent");
fails(function(){m.write(a,-1,8);},"out of bounds");
fails(function(){m.write(a,3,8);},"out of bounds");
fails(function(){m.write(empty,0,8);},"out of bounds");
check(a.get(0)==2 && a.get(2)==5,"failed bounds preserve contents");
fails(function(){c.broken(a);},"out of bounds");
check(c.value==22,"effects before error happen once");
local short=m.array("i64",1); short.set(0,73);
fails(function(){m.copy(a,short);},"require failed");
check(short.get(0)==73,"length requirement checked before writes");
// The host adapter also exercises all 32 hidden length arguments.
local manySource="export i64 many(", sumSource="", manyArgs=[m];
for(local i=0;i<32;i++) {
    if(i) {manySource+=",";sumSource+="+";}
    manySource+="in i64 a"+i+"[]";sumSource+="a"+i+".len()";
}
local many=sqgi.kernel.compile(manySource+"){ return "+sumSource+"; }");
manyArgs[0]=many;
for(local i=0;i<32;i++) manyArgs.append(many.array("i64",i));
check(many.many.acall(manyArgs)==496,"maximum host ABI with hidden lengths");
local pairs=m.array("Pair",2); m.pair(pairs);
check(pairs.get(0).y==0.0 && pairs.get(1).y==2.5,"runtime record array stride");
local other=sqgi.kernel.compile(source);
fails(function(){other.read(c);},"schema/extent");
fails(function(){other.total(a);},"schema/extent");
fails(function(){other.Counter().add.call(c,1);},"schema/extent");
// Bound native closures and debug hooks exercise the regular VM adapter too.
local bound=(function(receiver){ return function(n){receiver.add(n);}; })(c);
bound(2); check(c.value==24,"captured instance method");
check(m.total.bindenv({})(a)==10,"bound export fallback");
local hook=function(event,source,line,name) {};
setdebughook(hook); c.add(3); local got=m.total(a); setdebughook(null);
check(c.value==27 && got==10,"debug hook fallback");
local co=newthread(function(){c.add(4);return c.value;});
check(co.call()==31,"coroutine invocation");
// Every object and method closure owns the code and schema independently.
local read=m.read, add=c.add;
m=null; other=null; collectgarbage();
check(read(c)==31,"instance and function survive module table collection");
add.call(c,2); check(c.value==33,"extracted method with explicit receiver");
c=null; alias=null; collectgarbage();
bound(1); // bound closure retains receiver as well as executable code
fails(function(){d.spin();},"execution budget exceeded");
check(d.value==999999,"compiled method shares finite execution budget");
foreach (bad in [
    "class C { i64 x; }; export void f(in C c) { c.x=2; }",
    "class C { i64 x; void set() { this.x=2; } }; export void f(in C c) { c.set(); }",
    "void f(inout i64 a[]) { a[0]=1; } export void g(in i64 a[]) { f(a); }",
    "void f(inout i64 a[], in i64 b[]) {} export void g(inout i64 a[]) { f(a,a); }",
    "void f(in i64 a[2]) {} export void g(in i64 a[]) { f(a); }",
    "class C { i64 x; void a() {} i64 y; };",
    "class C { i64 x; i64 x; };",
    "class C { i64 x; void _get() {} };",
    "class C { i64 x; i64 x() { return 1; } };",
    "class C { i64 x; }; export void g(in C c[]) {}",
    "class C { i64 x; }; export void g(C c) {}",
    "class C { i64 x; i64 f() { return this.g(); } i64 g(){return 1;} };",
    "class C { i64 x; void f() { this.f(); } };",
    "void f() {} export i64 g() { return f(); }",
    "class C { i64 x; }; export i64 C() { return 1; }",
    "export i64 C() { return 1; } class C { i64 x; };"
]) {
    local rejected=false;
    try {sqgi.kernel.compile(bad);} catch(e) {rejected=true;}
    check(rejected,"invalid typed program rejected: "+bad);
}
local compatible=sqgi.kernel.compile("struct S { i64 _get; }; export i64 S(in S a[1]) {return a[0]._get;}");
local oldBuffer=compatible.array("S",1);oldBuffer.set(0,{_get=12});
check(compatible.S(oldBuffer)==12,"existing struct field and function namespaces preserved");
print("typed modules: classes, methods, dynamic arrays, lifetime, borrow checks and error paths passed\n");
