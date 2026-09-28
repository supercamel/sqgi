// Read-only binding probe: the lookup is canceled before submission. No secret
// is stored, read or removed. Run with a deadline and without a desktop session.
local Secret=import("Secret","1")
local Gio=import("Gio")
local GLib=import("GLib")
local failures=0
try{
    local schema=Secret.Schema.new("org.sqtheia.Imagery",Secret.SchemaFlags.none,{reference=Secret.SchemaAttributeType.string})
    if(schema==null)throw "Schema constructor returned null"
    print("PASS: hash table with string keys and enum values\n")
}catch(e){failures++;print("FAIL: Secret.Schema.new: "+e+"\n")}
local cancellable=Gio.Cancellable.new();cancellable.cancel()
local loop=GLib.MainLoop.new(null,false);local finished=false
try{
    Secret.password_lookup(null,{["xdg:schema"]="org.sqtheia.Imagery",reference="00000000-0000-4000-8000-000000000000"},cancellable,function(source,result){
        try{Secret.password_lookup_finish(result)}catch(e){}
        finished=true;loop.quit()
    })
    if(!finished){
        local timeout=sqgi.timeout_add(2000,function(){loop.quit();return false});loop.run()
        if(finished)GLib.source_remove(timeout)
    }
    if(!finished)throw "Canceled lookup callback did not complete"
    print("PASS: transferred string/string hash table and async callback\n")
}catch(e){failures++;print("FAIL: Secret.password_lookup: "+e+"\n")}
if(failures>0)throw "SQGI Secret hash-table binding gaps: "+failures
print("PASS: SQGI Secret argument probe (not full secret-store qualification)\n")
