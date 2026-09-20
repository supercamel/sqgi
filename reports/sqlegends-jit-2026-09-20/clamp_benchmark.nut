// Run from SqLegends. Measures the real helper with a stable numeric signature.
local Math = import("src/engine/math.nut")
local GLib = import("GLib")
local total = 0.0
for(local i=0; i<2000; i++) total += Math.clamp(i*0.001, 0.0, 1.0)
local start = GLib.get_monotonic_time()
for(local i=0; i<1000000; i++) total += Math.clamp((i%2000)*0.001, 0.0, 1.0)
print(format("CLAMP us=%d checksum=%.3f\n", GLib.get_monotonic_time()-start, total))
