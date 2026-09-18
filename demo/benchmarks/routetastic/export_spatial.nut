// Export the actual application's tree so every runtime traverses identical data.
local Spatial=import("src/spatial_index.nut"), GLib=import("GLib");
local index=Spatial.make(), seed=912673;
function random_coord(){seed=(seed*1664525+1013904223)&0x7fffffff;return (seed>>8)%10000/10.0;}
for(local i=0;i<4096;i++){
    local x=random_coord(),y=random_coord();
    Spatial.insert(index,0,i,{minx=x,miny=y,maxx=x+2.0,maxy=y+2.0});
}
Spatial.prepare(index);
local queries=[];
for(local i=0;i<4096;i++){local x=random_coord(),y=random_coord();queries.append({minx=x,miny=y,maxx=x+4.0,maxy=y+4.0});}
local checksum=0,matches=0;
foreach(box in queries)foreach(id in Spatial.query(index,0,box)){checksum=(checksum*31+id)&0x7fffffff;matches++;}
print(sqgi.json.stringify({tree=index.roots["0"].node,queries=queries,checksum=checksum,matches=matches})+"\n");
