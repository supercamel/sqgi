function route_cached(o,n) { o.marker=1; local sum=0; for(local i=0;i<n;i++) sum+=o.value; return sum; }
function route_dynamic(o,key,n) { o.marker=1; local sum=0; for(local i=0;i<n;i++) sum+=o[key]; return sum; }
function route_owned(o,value) { o.marker=1; local first=o.value; value=o.value; local next=o.value; return next; }
function route_keys(o,keys,n) { o.marker=1; local sum=0; for(local i=0;i<n;i++) {local k=keys[i%2];sum+=o[k];sum+=o[k];} return sum; }
local o={marker=0,value=7},keeper=[99],keys=[false,0];o[false]<-3;o[0]<-11;
for(local j=0;j<3;j++) {
 if(route_cached(o,10)!=70 || route_dynamic(o,"value",10)!=70 || route_owned(o,keeper)!=7 || route_keys(o,keys,10)!=140) throw "cached scalar route";
}
if(keeper[0]!=99 || o.marker!=1) throw "cached owner lifetime";
print("CACHE_ROUTE_OK 12\n");
