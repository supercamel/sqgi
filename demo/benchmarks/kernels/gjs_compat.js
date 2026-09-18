// Run the existing class benchmarks unchanged in GJS. CPU time is unavailable
// through GLib, so this adapter explicitly reports monotonic wall time.
const GLib=imports.gi.GLib;
const script=ARGV[0];
const process={argv:['gjs',script,...ARGV.slice(1)],version:'GJS '+imports.system.version,versions:{v8:'SpiderMonkey'},
    hrtime:{bigint:()=>BigInt(GLib.get_monotonic_time())*1000n},
    cpuUsage(previous){const user=GLib.get_monotonic_time();return {user:previous?user-previous.user:user,system:0};}};
function require(name){if(name!=='node:assert/strict')throw Error(name);return {
    ok(value,message){if(!value)throw Error(message||'assertion failed');},
    equal(a,b,message){if(!Object.is(a,b))throw Error(message||`${a} != ${b}`);}};}
const console={log:print};
eval(imports.byteArray.toString(GLib.file_get_contents(script)[1]));
