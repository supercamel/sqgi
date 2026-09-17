'use strict';
const assert=require('node:assert/strict');
const kernels={twice:x=>x*2,affine:x=>x*3+7,square:x=>x*x};
const name=process.argv[2]||'twice';assert.ok(name in kernels);
const kernel=kernels[name],n=name==='square'?10000:1000000,repeats=10000000/n;
const expected=name==='twice'?n*(n-1):name==='affine'?3*n*(n-1)/2+7*n:n*(n-1)*(2*n-1)/6;
function loop(kernel,n,seed){let sum=seed;for(let i=0;i<n;i++)sum+=kernel(i);return sum;}
function batch(sample){
    const seed=sample%2?7:0;let sum=0;
    const start=process.cpuUsage();for(let i=0;i<repeats;i++)sum+=loop(kernel,n,seed);
    const elapsed=process.cpuUsage(start);
    assert.equal(sum,(expected+seed)*repeats);assert.ok(Number.isSafeInteger(sum));
    return {ns:(elapsed.user+elapsed.system)*1000/(n*repeats),sum};
}
const warm=process.hrtime.bigint();let round=0;do{batch(round++);}while(process.hrtime.bigint()-warm<100000000n);
const cases=Array.from({length:11},(_,i)=>batch(i));
const samples=cases.map(c=>c.ns).sort((a,b)=>a-b);
console.log(JSON.stringify({name,n,repeats,expected,checksums:cases.map(c=>c.sum),ns:samples[5],samples_ns:samples,node:process.version}));
