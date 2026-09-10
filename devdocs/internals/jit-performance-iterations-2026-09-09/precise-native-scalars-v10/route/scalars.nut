function route_add(a,x,y) { a[0]=a[0]+1; return x+y; }
function route_sub(a,x,y) { a[0]=a[0]+1; return x-y; }
function route_mul(a,x,y) { a[0]=a[0]+1; return x*y; }
function route_div(a,x,y) { a[0]=a[0]+1; return x/y; }
function route_get(a,x,y) { a[0]=a[0]+1; return x[y]; }
local a=[0], items=[17,-0.0,true];
for(local n=0;n<3;n++) {
    if(route_add(a,1.5,2)!=3.5 || route_sub(a,7,0.5)!=6.5 || route_mul(a,-3.5,2)!=-7.0 || route_div(a,7.0,2)!=3.5) throw "floating route";
    if(route_add(a,2,3)!=5 || route_get(a,items,0)!=17 || route_get(a,items,1)!=-0.0 || route_get(a,items,2)!=true) throw "scalar route";
}
if(a[0]!=24) throw "committed prefix";
print("SCALAR_ROUTE_OK 24\n");
