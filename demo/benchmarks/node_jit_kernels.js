'use strict';
// Direct algorithm ports of test/test_jit_perf_correctness.nut.
// Shared by Node and GJS; retain this filename for existing runner compatibility.
function scalar_step(acc, a, b) {
  return (acc * 33 + a * 17 - b * 9 + 97) % 1000003;
}
function direct_call_kernel(n) {
  let acc = 7;
  for (let i = 0; i < n; i++) acc = scalar_step(acc, i % 251, i % 127);
  return acc;
}
function scalar_branch_step(acc, i) {
  let delta = 0;
  if (i % 2 === 0) delta = i % 17;
  else delta = 0 - (i % 13);
  return (acc + delta + 97) % 1000003;
}
function branch_call_kernel(n) {
  let acc = 7;
  for (let i = 0; i < n; i++) acc = scalar_branch_step(acc, i);
  return acc;
}
function scalar_float_step(x, y) { return x * 0.5 + y; }
function float_call_kernel(n) {
  let value = 0.0;
  for (let i = 0; i < n; i++) value = scalar_float_step(value, i % 7);
  return value;
}
function numeric_loop_kernel(n) {
  let acc = 13;
  for (let i = 0; i < n; i++) acc = (acc + (i % 997) * 31 + (acc % 17) * 7 + 11) % 1000000007;
  return acc;
}
class Vec3 {
  constructor(x=0.0,y=0.0,z=0.0) { this.values=[x,y,z]; }
  get(i) { return this.values[i]; }
  set(i,v) { this.values[i]=v; return v; }
  add(o) { return new Vec3(this.values[0]+o.values[0],this.values[1]+o.values[1],this.values[2]+o.values[2]); }
  sub(o) { return new Vec3(this.values[0]-o.values[0],this.values[1]-o.values[1],this.values[2]-o.values[2]); }
  mul(s) { return new Vec3(this.values[0]*s,this.values[1]*s,this.values[2]*s); }
  dot(o) { return this.values[0]*o.values[0]+this.values[1]*o.values[1]+this.values[2]*o.values[2]; }
  cross(o) { return new Vec3(this.values[1]*o.values[2]-this.values[2]*o.values[1],this.values[2]*o.values[0]-this.values[0]*o.values[2],this.values[0]*o.values[1]-this.values[1]*o.values[0]); }
}
function vector_kernel(n) {
  let pos=new Vec3(1.0,-2.0,0.5),vel=new Vec3(0.125,-0.250,0.375),axis=new Vec3(0.25,0.5,-0.75),checksum=0.0;
  for(let i=0;i<n;i++) {
    const wind=new Vec3(((i%11)-5.0)*0.01,((i%7)-3.0)*0.02,((i%5)-2.0)*0.015);
    const force=vel.cross(axis).add(wind).sub(pos.mul(0.0125));
    pos=pos.add(force.mul(0.05));
    vel=vel.add(pos.cross(force).mul(0.0025));
    const idx=i%3,next=(idx+1)%3;
    pos.set(next,pos.get(next)*0.75+pos.get(idx)*0.125);
    checksum=checksum+pos.dot(vel)*0.0001;
  }
  return pos.dot(vel)+checksum;
}
class PayloadBox {
  constructor(payload,label) { this.payload=payload; this.label=label; }
  swap_with(other,label) {
    const previous=this.payload; this.payload=other.payload; this.label=label; other.payload=previous;
    return this.payload[0]+other.payload[1];
  }
}
function dynamic_member_kernel(n) {
  const keys=['x','y','z'],state={x:3,y:5,z:7,active:null,label:'init'};
  const boxes=[new PayloadBox([1,2,3],'a'),new PayloadBox([4,5,6],'b')];
  let sum=0;
  for(let i=0;i<n;i++) {
    const key=keys[i%3],old=state[key];
    state[key]=old+(i%17); state.active=boxes[i%2]; state.label=key;
    const box=state.active;
    sum=(sum+box.swap_with(boxes[(i+1)%2],key))%1000003;
    box.payload[i%3]=(box.payload[i%3]+state[key]+i)%997;
    sum=(sum+box.payload[(i+2)%3]+state[key])%1000003;
  }
  return sum+state.x*3+state.y*5+state.z*7+boxes[0].payload[0]*11+boxes[1].payload[2]*13;
}
function dynamic_key_get_set_kernel(n) {
  const keys=['a','b','c','d'],state={a:1,b:2,c:3,d:4}; let acc=0;
  for(let i=0;i<n;i++) {
    const key=keys[i%4],next_key=keys[(i+1)%4],current=state[key];
    const next_value=(current+i*3+7)%1000003;
    state[key]=next_value; acc=(acc+state[next_key]+next_value)%1000003;
  }
  return acc+state.a*3+state.b*5+state.c*7+state.d*11;
}
function object_member_write_fallback_kernel(n) {
  const state={active:[1,2,3],spare:[4,5,6],label:'init'}; let sum=0;
  for(let i=0;i<n;i++) {
    const previous=state.active; state.active=state.spare; state.spare=previous;
    state.label=(i%2)===0?'even':'odd';
    state.active[i%3]=(state.active[i%3]+i+state.label.length)%997;
    sum=(sum+state.active[(i+1)%3]+state.spare[(i+2)%3])%1000003;
  }
  return sum+state.active[0]*3+state.active[1]*5+state.spare[2]*7+state.label.length;
}
function array_append_kernel(n) {
  const values=[];
  for(let i=0;i<n;i++) values.push(i%251);
  let sum=0;
  for(let i=0;i<n;i++) sum=(sum+values[i]*((i%7)+1))%1000003;
  return sum+values.length*13;
}
function array_write_kernel(n) {
  const values=[0,0,0,0,0,0,0,0];
  for(let i=0;i<n;i++) { const slot=i%8; values[slot]=(values[slot]+i*5+slot)%1000003; }
  let sum=0;
  for(let i=0;i<8;i++) sum=(sum+values[i]*(i+3))%1000003;
  return sum;
}
function math_intrinsic_kernel(n) {
  let total=0.0;
  for(let i=0;i<n;i++) {
    const x=(i%97)+1;
    total+=Math.sqrt(x)+Math.sin(0.0)+Math.cos(0.0);
    total+=Math.abs(-3.5)+Math.floor(1.75)+Math.ceil(1.25);
    total+=Math.pow(1.0001,i%5);
  }
  return total;
}
function math_variable_kernel(n) {
  let total=0.0;
  for(let i=0;i<n;i++) {
    const x=((i%97)+1)*0.01;
    total+=Math.sqrt(x)+Math.sin(x)+Math.cos(x)+Math.log(x)+Math.atan2(x,0.75)+Math.pow(x,1.125);
  }
  return total;
}
function matrix_kernel(n) {
  const a=[[1.0,0.5,-0.25],[-0.75,1.25,0.375],[0.625,-0.5,1.5]],v=[1.0,-2.0,0.75];
  let checksum=0.0;
  for(let i=0;i<n;i++) {
    const x=a[0][0]*v[0]+a[0][1]*v[1]+a[0][2]*v[2];
    const y=a[1][0]*v[0]+a[1][1]*v[1]+a[1][2]*v[2];
    const z=a[2][0]*v[0]+a[2][1]*v[1]+a[2][2]*v[2];
    v[0]=x*0.125+((i%5)-2.0)*0.01;
    v[1]=y*0.125-((i%7)-3.0)*0.015;
    v[2]=z*0.125+((i%11)-5.0)*0.005;
    a[i%3][(i+1)%3]=a[i%3][(i+1)%3]*0.99+v[i%3]*0.001;
    checksum=checksum+v[0]*0.25+v[1]*0.5-v[2]*0.125;
  }
  return checksum+v[0]*3.0+v[1]*5.0+v[2]*7.0;
}
function array_read_kernel(n) {
  const a=[1,2,3,4]; let sum=0;
  for(let i=0;i<n;i++) sum+=a[i%4];
  return sum;
}
function array_float_kernel(n) {
  const a=[0.5,1.5,2.5,3.5]; let sum=0.0;
  for(let i=0;i<n;i++) sum+=a[i%4];
  return sum;
}
const checks=[['array_read',200,500,0],['array_float',200,400,0.0005],['direct_call',400,193938,0],['branch_call',400,39196,0],['float_call',400,5.0551181102362204,1e-12],['numeric_loop',400,2500508,0],['vector',120,0.021712587807413163,1e-12],['dynamic_member',160,186190,0],['dynamic_key_get_set',200,470622,0],['object_member_write_fallback',120,82710,0],['array_append',300,134408,0],['array_write',300,461837,0],['math_intrinsic',80,1161.3127449959120,1e-9],['math_variable',80,122.66761111643609,1e-9],['matrix',200,-0.31467322972993278,1e-12]];
const kernels={direct_call:direct_call_kernel,branch_call:branch_call_kernel,float_call:float_call_kernel,numeric_loop:numeric_loop_kernel,vector:vector_kernel,dynamic_member:dynamic_member_kernel,dynamic_key_get_set:dynamic_key_get_set_kernel,object_member_write_fallback:object_member_write_fallback_kernel,array_append:array_append_kernel,array_write:array_write_kernel,array_read:array_read_kernel,array_float:array_float_kernel,math_intrinsic:math_intrinsic_kernel,math_variable:math_variable_kernel,matrix:matrix_kernel};
for(const [name,n,expected,epsilon] of checks) {
  const actual=kernels[name](n);
  if(!Number.isFinite(actual)||Math.abs(actual-expected)>epsilon) throw new Error(`${name}: ${actual} expected ${expected}`);
}
const isNode=typeof process !== 'undefined' && !!process.versions.node;
const args=isNode?process.argv.slice(2):ARGV;
const glib=isNode?null:imports.gi.GLib;
const now=isNode?()=>process.hrtime.bigint():()=>glib.get_monotonic_time();
const elapsedUs=isNode?(start)=>Number(now()-start)/1000:(start)=>now()-start;
const emit=isNode?(line)=>console.log(line):(line)=>print(line);
const iterations=Number(args[0]||80000), warmups=Number(args[1]||5);
if(!Number.isSafeInteger(iterations)||iterations<=0||!Number.isSafeInteger(warmups)||warmups<0)
  throw new Error('iterations must be positive and warmups nonnegative integers');
let sink=0;
for(const [name,fn] of Object.entries(kernels)) {
  const n=iterations*(['direct_call','branch_call','float_call','numeric_loop','array_read','array_float'].includes(name)?20:1);
  for(let w=0;w<warmups;w++) sink+=fn(n);
  const start=now(),checksum=fn(n),elapsed=elapsedUs(start);
  emit(`BENCH\t${name}\t${n}\t${(elapsed/n).toFixed(9)}\t${checksum}`);
}
emit(`SINK\t${sink}`);
