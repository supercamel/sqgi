import GLib from 'gi://GLib';
const process = {argv: ['gjs', 'module', ...ARGV], hrtime: {bigint: () => BigInt(GLib.get_monotonic_time()) * 1000n}};
const console = {log: print};
'use strict';
// Algorithm and evaluation order match test/bench_float_workloads.nut.
const iterations=Number(process.argv[2] || 200000), warmups=Number(process.argv[3] || 5);
if(!Number.isSafeInteger(iterations) || iterations<=0 || !Number.isInteger(warmups) || warmups<0)
  throw new Error('invalid benchmark arguments');
function smooth(previous,sample,weight) { return previous*weight+sample*(1.0-weight); }
function acceleration(position,velocity) { return velocity*0.99609375-position*0.015625; }
function selected(x,y,flag) { if(flag) return x*0.75-y*0.125; return y+x*0.25; }
function pair(x,y) { return (x-y)*0.125; }
function filter(n) {
  let x=0.125;
  for(let i=0;i<n;i++) x=smooth(x,i%23,0.875);
  return x;
}
function channels(n) {
  let a=0.125,b=0.25,c=0.375,d=0.5;
  for(let i=0;i<n;i++) {
    const sample=i%23;
    a=smooth(a,sample,0.875); b=smooth(b,sample,0.75);
    c=smooth(c,sample,0.625); d=smooth(d,sample,0.5);
  }
  return a+b*0.5+c*0.25+d*0.125;
}
function pressure(n) {
  let a=0.125,b=0.25,c=0.375,d=0.5,e=0.625,f=0.75,g=0.875,h=1.0;
  for(let i=0;i<n;i++) {
    a=smooth(a,i%23,0.875); b=smooth(b,a,0.75);
    c=smooth(c,b,0.625); d=smooth(d,c,0.5);
    e=smooth(e,d,0.875); f=smooth(f,e,0.75);
    g=smooth(g,f,0.625); h=smooth(h,g,0.5);
  }
  return a+b*0.5+c*0.25+d*0.125+e*0.0625+f*0.03125+g*0.015625+h;
}
function integration(n) {
  let x=1.0,v=0.0,sum=0.0;
  for(let i=0;i<n;i++) {
    v=acceleration(x,v)+(i%17)*0.0009765625;
    x=x+v*0.125; sum+=x*0.015625;
  }
  return sum+x+v;
}
function retained(n) {
  let x=0.125,sum=0.0;
  for(let i=0;i<n;i++) {
    const y=(i%17)*0.125,old=x,delta=pair(x,y);
    sum+=x+old+delta;
    x=smooth(x,y,0.75);
  }
  return sum+x;
}
function branching(n) {
  let x=0.125;
  for(let i=0;i<n;i++) x=selected(x,(i%17)*0.125,i%3===0);
  return x;
}
function helper_control(n) {
  let x=0.125;
  for(let i=0;i<n;i++) x=smooth(x,Math.sqrt((i%31)+1.0),0.875);
  return x;
}
const cases=[
  ['filter',filter],['channels_4',channels],['pressure_8',pressure],
  ['integration',integration],['retained_input',retained],
  ['branching',branching],['helper_control',helper_control]
];
for(const [name,fn] of cases) {
  const expected=fn(iterations);
  for(let w=0;w<warmups;w++) if(fn(iterations)!==expected) throw new Error(name+' warm checksum');
  const start=process.hrtime.bigint(),value=fn(iterations),elapsed=Number(process.hrtime.bigint()-start)/1000;
  if(value!==expected) throw new Error(name+' checksum');
  console.log('BENCH\t'+name+'\t'+iterations+'\t'+(elapsed/iterations).toFixed(9)+'\t'+value);
}
