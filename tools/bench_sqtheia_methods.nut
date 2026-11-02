// Exercise the original methods, including the Squirrel caller's loop overhead.
local root=getenv("SQTHEIA_ROOT")
local Vector=import(root+"/src/dynamics_vector.nut")
local Quaternion=import(root+"/src/dynamics_quaternion.nut")
local GLib=import("GLib")
local a=Vector(1.0,2.0,3.0),b=Vector(4.0,5.0,6.0),q=Quaternion(1.0,2.0,2.0,0.0)
local iterations=200000,passes=[]
for(local pass=0;pass<3;pass++) {
    local seconds={},checksums={},start=GLib.get_monotonic_time(),sum=0.0
    for(local n=0;n<iterations;n++)sum+=a.dot(b)
    seconds.dot<-(GLib.get_monotonic_time()-start)/1000000.0;checksums.dot<-sum
    start=GLib.get_monotonic_time();sum=0.0
    for(local n=0;n<iterations;n++)sum+=a.squared_norm()
    seconds.squared_norm<-(GLib.get_monotonic_time()-start)/1000000.0;checksums.squared_norm<-sum
    start=GLib.get_monotonic_time();sum=0.0
    for(local n=0;n<iterations;n++)sum+=a.magnitude()
    seconds.vector_magnitude<-(GLib.get_monotonic_time()-start)/1000000.0;checksums.vector_magnitude<-sum
    start=GLib.get_monotonic_time();sum=0.0
    for(local n=0;n<iterations;n++)sum+=q.magnitude()
    seconds.quaternion_magnitude<-(GLib.get_monotonic_time()-start)/1000000.0;checksums.quaternion_magnitude<-sum
    passes.append({seconds=seconds,checksums=checksums})
}
print("SQTHEIA_METHOD_BENCH "+sqgi.json.stringify({iterations=iterations,passes=passes})+"\n")
