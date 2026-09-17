'use strict';
const assert=require('node:assert/strict');
const storage=process.argv[3] || 'float64';
assert.ok(storage==='array' || storage==='float64');
class Oscillator {
    constructor(){this.position=0;this.velocity=0;}
    advance(dt){
        if(!(dt>0))throw Error('invalid timestep');
        this.velocity-=this.position*dt;
        this.position+=this.velocity*dt;
        return this.position;
    }
    run(steps,dt){
        if(!(steps>=0 && steps<=100000))throw Error('invalid steps');
        const recent=storage==='array'?[0,0,0,0]:new Float64Array(4);
        let cursor=0;
        for(let i=0;i<steps;i++){
            recent[cursor]=this.advance(dt);
            cursor++;
            if(cursor===4)cursor=0;
        }
        return (recent[0]+recent[1]+recent[2]+recent[3])*0.25;
    }
}
function simulate(steps,dt){
    const body=new Oscillator();
    body.position=1;
    return body.run(steps,dt);
}
function reference(steps,dt){
    let x=1,v=0;const recent=[0,0,0,0];
    for(let i=0;i<steps;i++){v-=x*dt;x+=v*dt;recent[i%4]=x;}
    return (recent[0]+recent[1]+recent[2]+recent[3])*0.25;
}
const cases=[];
for(const steps of [1,16,256,4096]){
    if(process.argv[2] && process.argv[2]!==`workflow/${steps}`)continue;
    const repeats=Math.floor(4000000/steps),results=[],checksums=[],timings=[];
    for(const dt of [0.125,0.0625]){
        const expected=reference(steps,dt);let sum=0;
        for(let i=0;i<repeats;i++)sum+=expected;
        results.push(expected);checksums.push(sum);
    }
    function batch(index){
        const dt=index===0?0.125:0.0625;
        let sum=0,result=0;
        const start=process.cpuUsage();
        for(let i=0;i<repeats;i++){result=simulate(steps,dt);sum+=result;}
        const elapsed=process.cpuUsage(start);
        assert.equal(result,results[index]);assert.equal(sum,checksums[index]);
        return (elapsed.user+elapsed.system)*1000/repeats;
    }
    const warm=process.hrtime.bigint();let iteration=0;
    do{batch(iteration++%2);}while(process.hrtime.bigint()-warm<100000000n);
    for(let sample=0;sample<9;sample++)timings.push(batch(sample%2));
    cases.push({kind:'workflow',size:steps,repeats,timings_ns:timings,output:results,checksums});
}
console.log(JSON.stringify({node:process.version,v8:process.versions.v8,storage,cases}));
