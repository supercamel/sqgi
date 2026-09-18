'use strict';
// Numeric counterparts to the demo kernels. Fixtures and expected outputs are
// exported by the native suite, so both runtimes use precisely the same data.
const fs = require('node:fs');
const assert = require('node:assert/strict');
const operations = {
    geometry(b,n) {
        const a=b[0],o=b[1];
        for(let i=0;i<n;++i){o[3*i]=a[3*i]*1.5+2;o[3*i+1]=a[3*i+1]*1.5-1;o[3*i+2]=a[3*i+2]*1.5+0.5;}
        return 0;
    },
    sum(b,n) {const a=b[0];let sum=0;for(let i=0;i<n;++i)sum+=a[i];return sum;},
    dot(b,n) {const a=b[0],c=b[1];let sum=0;for(let i=0;i<n;++i)sum+=a[i]*c[i];return sum;},
    prefix(b,n) {const a=b[0],o=b[1];let sum=0;for(let i=0;i<n;++i){sum+=a[i];o[i]=sum;}return 0;},
    particles(b,n) {
        const p=b[0];
        for(let i=0;i<n;++i)if(p[5*i+4]!==0){
            let x=p[5*i],y=p[5*i+1],vx=p[5*i+2],vy=p[5*i+3];
            vy-=9*0.125;x+=vx*0.125;y+=vy*0.125;
            if(x<0){x=0;vx=-vx;}if(x>10){x=10;vx=-vx;}if(y<0){y=0;vy=-vy*0.8;}
            p[5*i]=x;p[5*i+1]=y;p[5*i+2]=vx;p[5*i+3]=vy;
        }
        return 0;
    },
    image(b,n) {
        const a=b[0],o=b[1];
        for(let i=0;i<n;++i)o[i]=Math.min(255,Math.max(0,a[i]+16))>=128?255:0;
        return 0;
    },
    matrix(b,n) {
        const a=b[0],c=b[1],o=b[2];
        for(let r=0;r<n;++r)for(let col=0;col<n;++col){let sum=0;for(let k=0;k<n;++k)sum+=a[r*16+k]*c[k*16+col];o[r*16+col]=sum;}
        return 0;
    },
    routing(b,n) {
        const a=b[0],o=b[1];let total=0;
        for(let i=0;i<n;++i){const hit=a[4*i+2]>=4&&a[4*i]<=8&&a[4*i+3]>=4&&a[4*i+1]<=8;o[i]=hit?1:0;total+=hit?1:0;}
        return total;
    },
    histogram(b,n) {
        const a=b[0],o=b[1];
        for(let i=0;i<16;++i)o[i]=0;
        for(let i=0;i<n;++i)++o[a[i]];
        return 0;
    },
    stencil(b,n) {
        const a=b[0],o=b[1];
        for(let i=0;i<n*n;++i)o[i]=a[i];
        for(let r=1;r<n-1;++r)for(let c=1;c<n-1;++c){const i=r*n+c;o[i]=(a[i-1]+a[i+1]+a[i-n]+a[i+n])*0.25;}
        return 0;
    }
};
let sink=0;
const fixtures=JSON.parse(fs.readFileSync(process.argv[2],'utf8'));
const cases=[];
const integers32=process.argv[3]==='int32';
for(const test of fixtures.cases) {
    if(integers32&&!['image','histogram','routing'].includes(test.workload))continue;
    if(test.workload==='astar')continue; // Separate A* runner includes BFS.
    const operation=operations[test.workload];assert.ok(operation);
    let buffers;
    const storage=index=>integers32&&(test.workload!=='routing'||index===1)?Int32Array:Float64Array;
    const reset=()=>{buffers=test.initial.map((b,i)=>storage(i).from(b));};
    const check=expected=>{
        for(let b=0;b<buffers.length;++b)for(let i=0;i<buffers[b].length;++i)
            assert.equal(buffers[b][i],storage(b)===Int32Array?(expected[b][i]|0):expected[b][i],`${test.workload}/${test.size}/${test.pattern} buffer ${b} cell ${i}`);
    };
    reset();assert.equal(operation(buffers,test.size),test.result);check(test.expected);
    reset();for(let i=0;i<test.repetitions;++i)operation(buffers,test.size);check(test.repeated_expected);
    function batch(repetitions) {
        reset(); // Same starting state for each sample; allocation is untimed.
        const start=process.hrtime.bigint();
        for(let i=0;i<repetitions;++i)sink=operation(buffers,test.size)+buffers[buffers.length-1][0];
        return Number(process.hrtime.bigint()-start)/repetitions;
    }
    const repetitions=test.timing_repetitions;
    assert.ok(Number.isInteger(repetitions)&&repetitions>0);
    const warmStart=process.hrtime.bigint();
    do {batch(repetitions);} while(process.hrtime.bigint()-warmStart<100000000n);
    const samples=Array.from({length:9},()=>batch(repetitions)).sort((a,b)=>a-b);
    cases.push({workload:test.workload,size:test.size,pattern:test.pattern,repetitions,
        node_ns:samples[4],min_ns:samples[0],max_ns:samples[8],samples:9});
}
console.log(JSON.stringify({node:process.version,v8:process.versions.v8,storage:integers32?'Int32Array integer buffers':'Float64Array',cases,sink},null,2));
