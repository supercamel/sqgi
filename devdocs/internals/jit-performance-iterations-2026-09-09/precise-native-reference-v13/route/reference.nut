function route_ref_array(items) { items[1]=1; local a=items[0]; local b=items[0]; return items[0]; }
function route_ref_cache(o) { o.marker=1; local a=o.value; local b=o.value; return o.value; }
function route_ref_weak(o) { o.marker=1; local a=o.value; local b=o.value; return o.value; }
local keeper=[7], items=[keeper,0], o={marker=0,value=keeper}, live={marker=0,value=keeper.weakref()}, dead={marker=0,value=[9].weakref()};
for(local j=0;j<3;j++) if(route_ref_array(items)!=keeper || route_ref_cache(o)!=keeper || route_ref_weak(live)!=keeper || route_ref_weak(dead)!=null) throw "reference route mismatch";
if(keeper[0]!=7 || items[1]!=1 || o.marker!=1 || live.marker!=1 || dead.marker!=1) throw "reference prefix mismatch";
print("REFERENCE_ROUTE_OK 12\n");
