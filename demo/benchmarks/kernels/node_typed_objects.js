'use strict';
const assert = require('node:assert/strict');
class Controller {
    constructor() {
        this.target=20; this.gain=0.5; this.integral=0; this.integral_gain=0.125;
        this.samples=0; this.enabled=true;
    }
    advance(measured,dt) {
        if(!(dt>0)) throw Error('invalid timestep');
        if(!this.enabled) return 0;
        const error=this.target-measured;
        this.integral+=error*dt;
        this.samples++;
        return error*this.gain+this.integral*this.integral_gain;
    }
    process(input,output,dt) {
        if(input.length!==output.length) throw Error('length mismatch');
        for(let i=0;i<input.length;i++) output[i]=this.advance(input[i],dt);
    }
}
const cases=[];
for(const count of [1,16,256,4096]) {
    for(const kind of count===1?['driver','scalar']:['driver']) {
        if(process.argv[2] && process.argv[2]!==`${kind}/${count}`) continue;
        const c=new Controller(), input=new Float64Array(count), output=new Float64Array(count);
        let errorSum=0, result=0;
        for(let i=0;i<count;i++){input[i]=18+(i%5);errorSum+=20-input[i];}
        const repeats=Math.floor(4000000/count), timings=[];
        const invoke=kind==='driver'?()=>c.process(input,output,0.25):()=>{result=c.advance(18,0.25);};
        function batch() {
            c.integral=0;c.samples=0;
            const start=process.cpuUsage();
            for(let i=0;i<repeats;i++) invoke();
            const elapsed=process.cpuUsage(start);
            assert.equal(c.samples,count*repeats);
            assert.equal(c.integral,errorSum*0.25*repeats);
            let integral=errorSum*0.25*(repeats-1);
            for(let i=0;i<count;i++) {
                const error=20-input[i];integral+=error*0.25;
                assert.equal(kind==='driver'?output[i]:result,error*0.5+integral*0.125);
            }
            return (elapsed.user+elapsed.system)*1000/repeats;
        }
        // Let V8 optimize both methods and the driver before collecting samples.
        const warm=process.hrtime.bigint();
        do {batch();} while(process.hrtime.bigint()-warm<100000000n);
        for(let sample=0;sample<9;sample++) timings.push(batch());
        cases.push({kind,size:count,repeats,timings_ns:timings,integral:c.integral,
            count:c.samples,output:kind==='driver'?Array.from(output):[result]});
    }
}
console.log(JSON.stringify({node:process.version,v8:process.versions.v8,storage:'Float64Array',cases}));
