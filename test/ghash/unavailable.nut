local Secret=import("Secret","1")
local schema=Secret.Schema.new("org.sqgi.Test.PrivateHash",Secret.SchemaFlags.none,{reference=Secret.SchemaAttributeType.string})
local failed=false
try { Secret.password_lookup_sync(schema,{reference="unavailable-test-only"},null) } catch(e) { failed=true }
if(!failed) throw "Expected unavailable private bus error"
print("PASS unavailable Secret Service propagates error\n")
