function route_owned(a,items,value) { a[0]=a[0]+1; value=items[0]; local next=items[1]; return next; }
local a=[0],items=[5,7],keeper=[99],observer=keeper.weakref();
for(local n=0;n<5;n++) if(route_owned(a,items,keeper)!=7 || observer.ref()!=keeper) throw "non-final temporary";
if(a[0]!=5 || keeper[0]!=99) throw "prefix and survivor";
print("OWNED_ROUTE_OK 5\n");
