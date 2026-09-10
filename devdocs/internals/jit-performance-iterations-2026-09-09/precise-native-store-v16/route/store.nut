class StoreRouteBox { value=0; }
function route_store(r,c,key,source) {
    r.count=r.count+1;
    c[key]=source;
    c[key]=source;
    return source;
}
local r={count=0}, payload=[7], live=payload.weakref(), dead=[11].weakref();
for(local shape=0;shape<3;shape++) {
    local c=shape==0 ? [0] : shape==1 ? {value=0} : StoreRouteBox();
    local key=shape==0 ? 0 : "value";
    for(local kind=0;kind<4;kind++) {
        local source=kind==0 ? 1.5 : kind==1 ? payload : kind==2 ? live : dead;
        local result=route_store(r,c,key,source);
        if(result!=source || typeof result!=typeof source) throw "store route source";
        if(kind>1 && typeof result!="weakref") throw "store route raw weak";
        c[key]=0;
    }
}
if(r.count!=12) throw "store route prefixes";
print("STORE_ROUTE_OK 12\n");
