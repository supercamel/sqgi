'use strict';
// Exact algorithm port of test/bench_member_workloads.nut.
const iterations=Number(process.argv[2] || 200000), warmups=Number(process.argv[3] || 5);
if(!Number.isSafeInteger(iterations) || iterations<=0 || !Number.isInteger(warmups) || warmups<0)
  throw new Error('invalid benchmark arguments');
class EventRecord {
  constructor() { this.accepted=0; this.rejected=0; this.pending=0; this.bytes=0; this.samples=Array(13).fill(0); }
  apply(key,delta,index) {
    this[key]=(this[key]+delta)%65521;
    this.samples[index]=(this.samples[index]+this[key])%997;
    return this.samples[index];
  }
}
function table_apply(record,key,delta,index) {
  record[key]=(record[key]+delta)%65521;
  record.samples[index]=(record.samples[index]+record[key])%997;
  return record.samples[index];
}
function event_records(n,classes) {
  const records=[], keys=['accepted','rejected','pending','bytes'];
  for(let j=0;j<97;j++) {
    if(classes) records.push(new EventRecord());
    else {
      const record={samples:Array(13).fill(0)};
      for(let k=0;k<4;k++) record[keys[(k+j)%4]]=0;
      for(let k=0;k<j%19;k++) record[k]=k;
      records.push(record);
    }
  }
  let sum=0;
  for(let i=0;i<n;i++) {
    const record=records[(i*17)%97], key=keys[i%4];
    const value=classes ? record.apply(key,i%101,i%13) : table_apply(record,key,i%101,i%13);
    sum=(sum+value)%1000003;
  }
  for(const record of records) sum+=record.accepted+record.rejected+record.pending+record.bytes;
  return sum;
}
function rotate_buffers(state,n,width) {
  let sum=0;
  for(let i=0;i<n;i++) {
    const old=state.current; state.current=state.previous; state.previous=old;
    state.caption=i%2===0 ? 'available' : 'in flight';
    const k=i%width;
    state.current[k]=(state.current[k]+i+state.caption.length)%997;
    sum=(sum+state.current[k]+state.previous[(k+1)%width])%1000003;
  }
  return sum+state.current[0]+state.previous[0];
}
function buffers(n,width) {
  return rotate_buffers({current:Array(width).fill(1),previous:Array(width).fill(2),caption:'idle'},n,width);
}
function calibrate(samples,n,width) {
  let sum=0;
  for(let i=0;i<n;i++) {
    const k=i%width;
    samples[k]=(i%101)*0.125+(i%23)*0.0625;
    sum+=samples[k]*0.5+samples[(k+1)%width]*0.25;
  }
  return sum;
}
const cases=[
  ['table_events_97',n=>event_records(n,false)], ['class_events_97',n=>event_records(n,true)],
  ['buffers_7',n=>buffers(n,7)], ['buffers_31',n=>buffers(n,31)],
  ['calibrate_17',n=>calibrate(Array(17).fill(0),n,17)], ['calibrate_67',n=>calibrate(Array(67).fill(0),n,67)]
];
for(const [name,fn] of cases) {
  const expected=fn(iterations);
  for(let w=0;w<warmups;w++) if(fn(iterations)!==expected) throw new Error(name+' warm checksum');
  const start=process.hrtime.bigint(), value=fn(iterations), elapsed=Number(process.hrtime.bigint()-start)/1000;
  if(value!==expected) throw new Error(name+' checksum');
  console.log(`BENCH\t${name}\t${iterations}\t${(elapsed/iterations).toFixed(9)}\t${value}`);
}
