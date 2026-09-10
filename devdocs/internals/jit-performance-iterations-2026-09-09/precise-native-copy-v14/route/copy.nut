function route_copy_move(r,value,source) { r.marker=1; value=source; return value; }
function route_copy_literal(r,value) { r.marker=1; value="copy-pinned"; return value; }
function route_copy_integer(r,value) { r.marker=1; value=1007; return value; }
function route_copy_float(r,value) { r.marker=1; value=1.5; return value; }
function route_copy_bool(r,value) { r.marker=1; value=true; return value; }
local r={marker=0},a=[7],b=[11],sources=[b,b.weakref(),[9].weakref()];
for(local j=0;j<3;j++) if(route_copy_move(r,a,sources[j])!=sources[j] || route_copy_literal(r,a)!="copy-pinned" || route_copy_integer(r,a)!=1007 || route_copy_float(r,a)!=1.5 || route_copy_bool(r,a)!=true) throw "copy route mismatch";
if(r.marker!=1 || a[0]!=7 || b[0]!=11) throw "copy prefix or owner mismatch";
print("COPY_ROUTE_OK 15\n");
