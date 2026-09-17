// Actual RouteSearch.Engine with deterministic, multilayer obstacle fixtures.
local GLib=import("GLib"), started=GLib.get_monotonic_time();
local Search=import("src/route_search.nut"), Native=import("src/native.nut");
local imports=GLib.get_monotonic_time()-started, repeats=vargv[0].tointeger(), rows=[];
for(local repeat=0;repeat<repeats;repeat++) {
    local begin=GLib.get_monotonic_time(), results=[];
    for(local fixture=0;fixture<4;fixture++) {
        local config={ minx=0,maxx=48,miny=0,maxy=36,layers=2,
            sources=[{x=1,y=2+fixture*7,layer=0,heading=8,cost=0.0}],
            targets=[{x=47,y=33-fixture*6,layer=fixture%2,heading=8,cost=0.0}],
            via_cost=6.0,bend_cost=0.25,max_steps=50000,max_queue=200000,max_states=150000 };
        config.stop_requested<-function(){return false;};
        config.edge_clear<-function(from,x,y,layer){
            if(x>0 && x<48 && x%8==0){local gap=(x*3+layer*11+fixture*5)%29+3;return y>=gap && y<=gap+3;}
            return true;
        };
        config.accept<-function(node,target){
            local path=[];
            while(node!=null){path.append([node.x,node.y,node.layer,node.heading]);node=node.parent;}
            path.reverse();return {path=path};
        };
        local engine=Search.Engine(config);
        while(engine.status=="searching")engine.advance(128);
        if(engine.status!="found")throw "search fixture did not find a route";
        local result=engine.metrics();result.path<-engine.solution.path;results.append(result);
    }
    rows.append({repeat=repeat,total_s=(GLib.get_monotonic_time()-begin)/1000000.0,result=results});
}
print("RESULT "+sqgi.json.stringify({backend=Native.backend(),module_import_s=imports/1000000.0,rows=rows})+"\n");
