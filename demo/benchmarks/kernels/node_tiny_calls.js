'use strict';
// Match tiny_calls.nut's whole caller loop; JS may inline its same-language calls.
const fs=require('node:fs'),assert=require('node:assert/strict');
const source=fs.readFileSync(__dirname+'/node_typed_objects.js','utf8');
const Controller=Function(source.slice(source.indexOf('class Controller'),source.indexOf('const cases=[];'))+'return Controller;')();
const name=process.argv[2];
assert.ok(['integer_export','scalar_method'].includes(name));
const loop=name==='integer_export'
    ?function(m,c,n){let s=0;for(let i=0;i<n;i++)s+=m(i);return s;}
    :function(m,c,n){let s=0;for(let i=0;i<n;i++)s=c.advance(18,0.25);return s;};
const twice=x=>x*2,c=new Controller(),n=1000000;
const expected=name==='integer_export'?n*(n-1):1+n*0.0625;
function batch(){
    c.integral=0;c.samples=0;
    const start=process.cpuUsage(),result=loop(twice,c,n),elapsed=process.cpuUsage(start);
    assert.equal(result,expected);
    if(name==='scalar_method'){assert.equal(c.samples,n);assert.equal(c.integral,n*0.5);}
    return (elapsed.user+elapsed.system)*1000/n;
}
const warm=process.hrtime.bigint();do{batch();}while(process.hrtime.bigint()-warm<100000000n);
const samples=Array.from({length:11},batch).sort((a,b)=>a-b);
console.log(JSON.stringify({name,n,result:expected,node:process.version,ns:samples[5],samples_ns:samples}));
