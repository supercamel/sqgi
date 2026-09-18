// Full application routing pipeline on a fresh in-memory copy; never exports a board.
local GLib=import("GLib"), started=GLib.get_monotonic_time();
local KiCad=import("src/kicad.nut"), Rules=import("src/rules.nut"), Router=import("src/autoroute.nut");
local Connectivity=import("src/connectivity.nut"), Native=import("src/native.nut");
local imports=GLib.get_monotonic_time()-started, rows=[];
for(local repeat=0;repeat<vargv[1].tointeger();repeat++){
    local begin=GLib.get_monotonic_time(), design=KiCad.load(vargv[0]);Rules.make_rules(design);
    local loaded=GLib.get_monotonic_time(), route=Router.route_all(design,{cell=0.5,max_steps=5000});
    local routed=GLib.get_monotonic_time(), missing=Connectivity.missing_connections(design);
    if(route.failed!=0 || missing.len()!=0)throw "autoroute did not connect both nets";
    local segments=[], vias=[];
    foreach(s in design.board.generated_segments)segments.append({start=s.start,end=s.end,net=s.net,width=s.width,layer=s.layer});
    foreach(v in design.board.generated_vias)vias.append({at=v.at,net=v.net,size=v.size,drill=v.drill,from_layer=v.from_layer,to_layer=v.to_layer});
    rows.append({repeat=repeat,total_s=(GLib.get_monotonic_time()-begin)/1000000.0,
        import_s=(loaded-begin)/1000000.0,route_s=(routed-loaded)/1000000.0,
        result={routed=route.routed,failed=route.failed,remaining=missing.len(),segments=segments,vias=vias}});
}
print("RESULT "+sqgi.json.stringify({backend=Native.backend(),module_import_s=imports/1000000.0,rows=rows})+"\n");
