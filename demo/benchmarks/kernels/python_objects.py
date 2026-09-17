#!/usr/bin/env python3
"""Class/workflow counterparts to node_typed_objects and node_compiled_workflow."""
import json,sys
from python_workloads import measure

class Controller:
    def __init__(self):
        self.target=20.;self.gain=.5;self.integral=0.;self.integral_gain=.125;self.samples=0;self.enabled=True
    def advance(self,measured,dt):
        if not dt>0:raise ValueError('invalid timestep')
        if not self.enabled:return 0
        error=self.target-measured;self.integral+=error*dt;self.samples+=1
        return error*self.gain+self.integral*self.integral_gain
    def process(self,inputs,output,dt):
        if len(inputs)!=len(output):raise ValueError('length mismatch')
        for i in range(len(inputs)):output[i]=self.advance(inputs[i],dt)

class Oscillator:
    def __init__(self):self.position=0.;self.velocity=0.
    def advance(self,dt):
        if not dt>0:raise ValueError('invalid timestep')
        self.velocity-=self.position*dt;self.position+=self.velocity*dt
        return self.position
    def run(self,steps,dt):
        if not 0<=steps<=100000:raise ValueError('invalid steps')
        recent=[0.,0.,0.,0.];cursor=0
        for _ in range(steps):
            recent[cursor]=self.advance(dt);cursor+=1
            if cursor==4:cursor=0
        return (recent[0]+recent[1]+recent[2]+recent[3])*.25

def simulate(n,dt):
    body=Oscillator();body.position=1.
    return body.run(n,dt)

def reference(n,dt):
    x=1.;v=0.;recent=[0.]*4
    for i in range(n):v-=x*dt;x+=v*dt;recent[i%4]=x
    return (recent[0]+recent[1]+recent[2]+recent[3])*.25

cases=[]
for n in [1,16,256,4096]:
    for kind in (['driver','scalar'] if n==1 else ['driver']):
        c=Controller();inputs=[18.+i%5 for i in range(n)];output=[0.]*n
        def reset():c.integral=0.;c.samples=0
        def invoke():return c.process(inputs,output,.25) if kind=='driver' else c.advance(18.,.25)
        reset();result=invoke();running=0.
        for i,x in enumerate(inputs):
            running+=(20-x)*.25
            assert (output[i] if kind=='driver' else result)==(20-x)*.5+running*.125
        timing=measure(invoke,reset);reps=timing['repetitions']
        assert c.samples==n*reps and c.integral==sum(20-x for x in inputs)*.25*reps
        if kind=='driver':
            running=sum(20-x for x in inputs)*.25*(reps-1)
            for i,x in enumerate(inputs):
                running+=(20-x)*.25;assert output[i]==(20-x)*.5+running*.125
        cases.append(dict(kind=kind,size=n,**timing))
for n in [1,16,256,4096]:
    for dt in [.125,.0625]:assert simulate(n,dt)==reference(n,dt)
    # Alternate timestep per batch, matching the other workflow runners.
    state=[0]
    def reset():state[0]^=1
    def invoke():return simulate(n,.125 if state[0]==0 else .0625)
    cases.append(dict(kind='workflow',size=n,output=[reference(n,dt) for dt in [.125,.0625]],**measure(invoke,reset)))
print(json.dumps(dict(runtime='python',version=sys.version,cases=cases)))
