// SQGI-only reproduction of common table predicates; no SqLegends imports.
local GLib=import("GLib")
function is_alive(entity) { return entity != null && entity.alive && entity.hp > 0.0 }
local entities=[{alive=true,hp=100.0},{alive=false},{alive=true,hp=0.0},null,{alive=true,hp=75}]
local total=0
for(local i=0;i<2000;i++)if(is_alive(entities[i%entities.len()]))total++
local start=GLib.get_monotonic_time()
for(local i=0;i<1000000;i++)if(is_alive(entities[i%entities.len()]))total++
print(format("TABLE us=%d checksum=%d\n",GLib.get_monotonic_time()-start,total))
