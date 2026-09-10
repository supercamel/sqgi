function route_g(r,a,b) { r.count=r.count+1; if(a>b) return 11; return 22; }
function route_ge(r,a,b) { r.count=r.count+1; if(a>=b) return 11; return 22; }
function route_l(r,a,b) { r.count=r.count+1; if(a<b) return 11; return 22; }
function route_le(r,a,b) { r.count=r.count+1; if(a<=b) return 11; return 22; }
local functions=[route_g,route_ge,route_l,route_le];
local pairs=[[-2000000000,2000000000],[2000000000,-2000000000],[-2000000000,-2000000000],[2000000000,2000000000],[-1,0],[0,-1],[0,0],[1,0],[0,1],[-0.5,0]];
local record={count=0};local calls=0;
for(local relation=0;relation<4;++relation) foreach(pair in pairs) {
 local a=pair[0],b=pair[1];local truth=relation==0 ? a>b : relation==1 ? a>=b : relation==2 ? a<b : a<=b;
 local actual=functions[relation](record,a,b);
 if(actual!=(truth ? 11 : 22)) throw "comparison route result";
 ++calls;
}
if(calls!=40 || record.count!=40) throw "comparison route prefix";
print("COMPARISON_ROUTE_OK 40\n");
