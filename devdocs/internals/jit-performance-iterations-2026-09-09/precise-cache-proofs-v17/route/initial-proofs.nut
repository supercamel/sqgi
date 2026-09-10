function route_loop(r,c,key,source,n) { r.count=r.count+1; for(local i=0;i<n;i++) c[key]=source; return source; }
function route_straight(r,c,key,source) { r.count=r.count+1; c[key]=source; c[key]=source; return source; }
function route_key(r,c,key,next,source) { r.count=r.count+1; c[key]=source; key=next; c[key]=source; return source; }
function route_owner(r,c,next,key,source) { r.count=r.count+1; c[key]=source; c=next; c[key]=source; return source; }
function route_branch(r,c,key,source,side) { r.count=r.count+1; if(side<1) c[key]=source; else c[key]=source; return source; }
local r={count=0},payload=[7],live=payload.weakref(),dead=[11].weakref();
for(local shape=0;shape<2;shape++) for(local kind=0;kind<4;kind++) {
    local c=shape==0 ? [0] : {value=0},key=shape==0 ? 0 : "value";
    local source=kind==0 ? 1.5 : kind==1 ? payload : kind==2 ? live : dead;
    local result=route_loop(r,c,key,source,5);
    if(result!=source || typeof result!=typeof source) throw "loop result";
    c[key]=0; result=route_straight(r,c,key,source);
    if(result!=source || typeof result!=typeof source) throw "straight result";
}
local a={},b={value=0}; a[false]<-0; a[0]<-0;
if(route_key(r,a,false,0,payload)!=payload || a[false]!=payload || a[0]!=payload) throw "changed key";
a={value=0}; if(route_owner(r,a,b,"value",payload)!=payload || a.value!=payload || b.value!=payload) throw "changed owner";
for(local side=0;side<2;side++) { a.value=0; if(route_branch(r,a,"value",payload,side)!=payload || a.value!=payload) throw "conditional cache"; }
if(r.count!=20) throw "prefixes";
print("CACHE_PROOF_ROUTE_OK 20\n");
