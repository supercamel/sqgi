// Read the unmodified SQTheia modules. The Python runner selects JIT/kernel
// modes in fresh processes and compares every returned aircraft state.
local root = getenv("SQTHEIA_ROOT")
local D = import(root + "/src/flight_dynamics.nut")
local K = import(root + "/src/dynamics_kernels.nut")
local GLib = import("GLib")
local steps = getenv("SQTHEIA_AUDIT_STEPS") == null ? 1000 : getenv("SQTHEIA_AUDIT_STEPS").tointeger()

function setup(name) {
    local p = D.PlaneSim(root + "/resources/simulation/" + name + ".json")
    p.set_ned_reference(-35.12,147.3,0)
    p.set_position(-35.12,147.3,120)
    p.set_euler(35,4,-7)
    p.set_body_velocity(18,0.4,1.2)
    p.set_angular_rates(0.01,-0.02,0.015)
    p.env.set_wind_speed_and_direction(3,275)
    foreach(m in p.motors()) m.slew_pitch_tilt(0.2,8,0.7853981633974483)
    p.set_controls(0.035,-0.07,0.02)
    foreach(b in p.power_system) b.set_throttle(0.55)
    return p
}

function state(p) {
    local motors=[]
    foreach(m in p.motors()) motors.append({rpm=m.get_rpm(),current=m.get_current(),thrust=m.thrust,torque=m.torque})
    return {position=[p.get_latitude(),p.get_longitude(),p.get_altitude()],velocity=p.local_velocity.array(),
        rates=p.angular_velocity.array(),q=p.orientation.to_vector().array(),alpha=p.alpha,beta=p.beta,motors=motors}
}

local passes=[]
for(local pass=0;pass<3;pass++) {
    local times={},states={}
    foreach(name in ["trainer","optera","cotesia","sc1"]) {
        local p=setup(name),start=GLib.get_monotonic_time()
        for(local i=0;i<steps;i++) p.step(0.001)
        times[name]<-(GLib.get_monotonic_time()-start)/1000000.0
        states[name]<-state(p)
    }
    passes.append({seconds=times,states=states})
}
print("SQTHEIA_BENCH "+sqgi.json.stringify({stepsPerModel=steps,passes=passes,kernels=K.status()})+"\n")
