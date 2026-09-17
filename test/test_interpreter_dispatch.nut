// Exercise dispatch across scope cleanup, frame changes and exceptional exits.
function check(value, message) { if(!value) throw message; }
function ephemeral(refs) {
    local owner={value=17};
    refs.append(owner.weakref());
    return function() { local keep=owner; return 17; };
}
function tail(f) { return f(); }
function invoke(refs) { local result=ephemeral(refs)(); return result; }
function invoke_tail(refs) { return tail(ephemeral(refs)); }
for(local i=0;i<20;i++) {
    local refs=[];
    local value=invoke(refs);
    local scratch={value=0}.value; // clear unrelated VM scratch ownership
    // CALL owns a temporary closure in C++. Dispatch must run its destructor;
    // after clearing VM scratch, its captured owner must have died.
    check(value==17 && refs[0]==null, "call temporary releases captured owner");
    refs=[];
    value=invoke_tail(refs);
    scratch={value=0}.value;
    check(value==17, "tail call result");
}
escaped <- null;
function throwing(refs) {
    local owner={value=42};
    refs.append(owner.weakref());
    escaped=function() { return owner.value; };
    throw "expected";
}
local refs=[], caught=false;
try { throwing(refs); } catch(e) { caught=(e=="expected"); }
check(caught && escaped()==42, "exception closes captured outer");
escaped=null;
local closures=[];
for(local i=0;i<8;i++) {
    local captured=i;
    closures.append(function() { return captured; });
}
foreach(i,f in closures) check(f()==i, "closed outer survives loop scope");
function squares(n) { for(local i=0;i<n;i++) yield i*i; }
local total=0;
foreach(value in squares(8)) total+=value;
check(total==140, "generator resume and return");
local worker=newthread(function() { local value=suspend(5); return value+7; });
check(worker.call()==5 && worker.wakeup(3)==10, "coroutine suspend and resume");
local hooks=0;
setdebughook(function(kind,source,line,name) { hooks++; });
check(tail(function() { return 19; })==19, "debugged calls");
setdebughook(null);
check(hooks>0, "debug hook still executes");
print("interpreter dispatch tests passed\n");

// Dynamic GET must retain a borrowed value before overwriting its receiver,
// unwrap weak slots, and preserve all general lookup fallback behavior.
function dynamic_read(owner,key) { return owner[key]; }
function overwrite_receiver(owner,key) { owner=owner[key]; return owner; }
class DynamicFields { value=23; function method(){return 29;} }
for(local pass=0;pass<40;pass++) {
    local table={value=[31]}, instance=DynamicFields();
    check(overwrite_receiver(table,"value")[0]==31,"read aliases receiver");
    check(dynamic_read(instance,"value")==23,"dynamic instance field");
    check(dynamic_read(instance,"method").call(instance)==29,"dynamic method fallback");
    table.setdelegate({inherited=37});
    check(dynamic_read(table,"inherited")==37,"dynamic delegate fallback");
    table.setdelegate({_get=function(key){if(key=="virtual")return 41;throw "missing";}});
    check(dynamic_read(table,"virtual")==41,"dynamic metamethod fallback");
    local missing=false;
    try {dynamic_read(table,"absent");} catch(e) {missing=true;}
    check(missing,"dynamic missing key raises");
    local referent={alive=43};
    table.weak <- referent.weakref();
    check(dynamic_read(table,"weak")==referent,"dynamic live weak slot");
    referent=null;
    // Flush scratch ownership of the previous referent before checking death.
    dynamic_read(table,"value");
    check(dynamic_read(table,"weak")==null,"dynamic dead weak slot");
    check(dynamic_read([47,53],1)==53,"integer array index");
    check(dynamic_read([47,53],1.0)==53,"float array index fallback");
    check(dynamic_read("abc",-1)==99,"negative string index fallback");
    for(local j=0;j<100;j++)table[j]<-j;
    check(dynamic_read(table,"value")[0]==31,"read after table rehash");
    delete table.value;
    table.value <- [59];
    check(dynamic_read(table,"value")[0]==59,"read after delete and reinsert");
}
print("dynamic object read tests passed\n");

