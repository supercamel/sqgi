local H = import("HashFixture", "1.0")
function equal(a, b) { if (a != b) throw "hash result mismatch" }
function rejects(fn) { local caught=false; try { fn() } catch(e) { caught=true }; if(!caught) throw "expected rejection" }
for(local i=0;i<200;i++) {
    equal(H.borrow(null),999); equal(H.borrow({}),0)
    equal(H.borrow({a="b",c="d"}),2)
    equal(H.take({name="value"}),1)
    equal(H.enum_zero({zero=0,one=1}),true)
    equal(H.strings({name="café"}),true)
    rejects(function() { H.required(null) })
    rejects(function() { H.borrow([]) })
    rejects(function() { H.borrow({[1]="bad"}) })
    rejects(function() { H.borrow({ok="yes",bad=3}) })
    rejects(function() { H.borrow({bad=null}) })
    rejects(function() { H.borrow({bad="nul\0value"}) })
    rejects(function() { H.enum_zero({zero="0"}) })
    rejects(function() { H.enum_zero({zero=4294967296}) })
    rejects(function() { H.error({name="consumed on error"}) })
    rejects(function() { H.later({name="freed before native call"},"bad") })
    rejects(function() { H.container({a="b"}) })
    rejects(function() { H.unsupported({a=3}) })
    local original={name="café"}; H.hold(original); original.name="changed"; original=null
    collectgarbage(); equal(H.finish(),true)
}
print("PASS hash-table types, zero enum, transfer, rejection and cleanup\n")
