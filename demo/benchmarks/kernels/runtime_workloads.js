// Shared Node/GJS harness: identical source, Float64Array fixtures, wall clock.
'use strict';
const isNode=typeof process!=='undefined';
const GLib=isNode?null:imports.gi.GLib;
const read=isNode?p=>require('node:fs').readFileSync(p,'utf8'):p=>imports.byteArray.toString(GLib.file_get_contents(p)[1]);
const args=isNode?process.argv.slice(2):ARGV;
const now=isNode?()=>Number(process.hrtime.bigint()):()=>GLib.get_monotonic_time()*1000;
const output=isNode?s=>console.log(s):s=>print(s);
const base=args[1];
const integers32=args[2]==='int32';
const source=read(base+'/node_workloads.js');
const operations=Function(source.slice(source.indexOf('const operations ='),source.indexOf('let sink=0;'))+'return operations;')();
const astar=read(base+'/node_astar.js');
operations.astar=Function('const N=256;'+astar.slice(astar.indexOf('function distance'),astar.indexOf('function bfs'))+'return (b,n,pattern)=>search(b[0],b[1],b[2],0,pattern==="same"?0:255);')();
let sink=0;
function assert(ok,message){if(!ok)throw Error(message);}
function measure(invoke,reset){
    let reps=1;
    function batch(n){reset();const start=now();for(let i=0;i<n;i++)sink=invoke();return now()-start;}
    while(reps<100000){const elapsed=batch(reps);if(elapsed>=5000000)break;reps=Math.min(100000,reps*2);}
    const warm=now();do{batch(reps);}while(now()-warm<100000000);
    const samples=Array.from({length:9},()=>batch(reps)/reps).sort((a,b)=>a-b);
    return {ns:samples[4],min_ns:samples[0],max_ns:samples[8],repetitions:reps,samples_ns:samples};
}
const cases=[];
for(const test of JSON.parse(read(args[0])).cases){
    if(integers32 && !['image','histogram','routing','astar'].includes(test.workload))continue;
    const storage=i=>integers32 && (test.workload!=='routing'||i===1)?Int32Array:Float64Array;
    const op=operations[test.workload];let buffers;
    const reset=()=>{buffers=test.initial.map((b,i)=>storage(i).from(b));};
    const invoke=()=>op(buffers,test.size,test.pattern);
    function check(expected){for(let b=0;b<buffers.length;b++)for(let i=0;i<buffers[b].length;i++)assert(buffers[b][i]===(storage(b)===Int32Array?(expected[b][i]|0):expected[b][i]),`${test.workload}/${test.size}/${test.pattern}: ${b}/${i}`);}
    reset();assert(invoke()===test.result,'result mismatch');check(test.expected);
    reset();for(let i=0;i<test.repetitions;i++)invoke();check(test.repeated_expected);
    cases.push({workload:test.workload,size:test.size,pattern:test.pattern,...measure(invoke,reset)});
}
// Ordinary Squirrel's new LLVM tier: matching source-level arithmetic/calls.
const ordinary={
    arithmetic(n){let s=0;for(let i=0;i<n;i++)s+=i*2;return s;},
    float_arithmetic(n){let s=0.5;for(let i=0;i<n;i++)s+=i*0.5;return s;},
    float_recurrence(n){let s=0.5;for(let i=0;i<n;i++)s=s*0.9999+0.125;return s;},
    branches(n){let s=0;for(let i=0;i<n;i++){if(i<500000)s+=i;else s-=i;}return s;},
    kernel_calls(n){const twice=x=>x*2;let s=0;for(let i=0;i<n;i++)s+=twice(i);return s;}
};
for(const [name,fn] of integers32?[]:Object.entries(ordinary)){
    const n=1000000,expected=fn(n);assert(Number.isFinite(expected),'ordinary result');
    const timings=measure(()=>fn(n),()=>{});
    assert(sink===expected,'ordinary checksum');
    cases.push({workload:'ordinary/'+name,size:n,pattern:'',result:expected,...timings,ns:timings.ns/n});
}
output(JSON.stringify({runtime:isNode?'node':'gjs',version:isNode?process.version:imports.system.version,clock:'monotonic wall',storage:integers32?'Int32Array integer buffers':'Float64Array',cases,sink}));
