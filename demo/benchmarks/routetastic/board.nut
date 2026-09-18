// Execute unchanged RouteTastic modules. No GUI, board writes or hardware access.
local GLib=import("GLib"), started=GLib.get_monotonic_time();
local KiCad=import("src/kicad.nut"), Rules=import("src/rules.nut");
local Connectivity=import("src/connectivity.nut"), Drc=import("src/drc.nut"), Native=import("src/native.nut");
local imports=GLib.get_monotonic_time()-started;
local path=vargv[0], repeats=vargv[1].tointeger(), rows=[];
for(local repeat=0;repeat<repeats;repeat++) {
    local begin=GLib.get_monotonic_time(), design=KiCad.load(path);
    Rules.make_rules(design);design.exhaustive_drc<-false;
    local loaded=GLib.get_monotonic_time(), missing=Connectivity.missing_connections(design);
    local connected=GLib.get_monotonic_time(), report=Drc.generate_report(design,path);
    local finished=GLib.get_monotonic_time(), board=design.board;
    rows.append({ repeat=repeat, import_s=(loaded-begin)/1000000.0,
        connectivity_s=(connected-loaded)/1000000.0, drc_s=(finished-connected)/1000000.0,
        total_s=(finished-begin)/1000000.0,
        result={layers=board.layers.len(),pads=board.pads.len(),segments=board.segments.len(),vias=board.vias.len(),
            missing=missing,violations=report.violations,violation_count=report.violation_count,
            import_diagnostics=board.import_diagnostics} });
}
print("RESULT "+sqgi.json.stringify({backend=Native.backend(),module_import_s=imports/1000000.0,rows=rows})+"\n");
