local Secret=import("Secret","1")
local schema=Secret.Schema.new("org.sqgi.Test.PrivateHash",Secret.SchemaFlags.none,{reference=Secret.SchemaAttributeType.string})
local attrs={reference="isolated-test-only"}
if(!Secret.password_store_sync(schema,attrs,"session","SQGI isolated test","first",null)) throw "store failed"
if(Secret.password_lookup_sync(schema,attrs,null)!="first") throw "lookup failed"
if(!Secret.password_store_sync(schema,attrs,"session","SQGI isolated test","replacement",null)) throw "replace failed"
if(Secret.password_lookup_sync(schema,attrs,null)!="replacement") throw "replacement lookup failed"
if(!Secret.password_clear_sync(schema,attrs,null)) throw "clear failed"
if(Secret.password_lookup_sync(schema,attrs,null)!=null) throw "secret remains after clear"
print("PASS private Secret Service store, lookup, replacement and clear\n")

local GLib=import("GLib")
function await_call(start, finish) {
    local loop=GLib.MainLoop.new(null,false), done=false, value=null, failure=null
    local timer=sqgi.timeout_add(3000,function(){loop.quit();return false})
    start(function(source,result) {
        try { value=finish(result) } catch(e) { failure=e }
        done=true; loop.quit()
    })
    collectgarbage()
    if(!done) loop.run()
    if(done) GLib.source_remove(timer)
    else throw "async Secret operation timed out"
    if(failure!=null) throw failure
    return value
}
for(local i=0;i<10;i++) {
    if(!await_call(function(cb) { Secret.password_store(schema,{reference="async"},"session","Async test","async-value",null,cb) },function(result) { return Secret.password_store_finish(result) })) throw "async store"
    if(await_call(function(cb) { Secret.password_lookup(schema,{reference="async"},null,cb) },function(result) { return Secret.password_lookup_finish(result) })!="async-value") throw "async lookup"
    if(!await_call(function(cb) { Secret.password_clear(schema,{reference="async"},null,cb) },function(result) { return Secret.password_clear_finish(result) })) throw "async clear"
}
print("PASS repeated asynchronous Secret store, lookup and clear across GC\n")
