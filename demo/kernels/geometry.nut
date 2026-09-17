local D = import("demo/kernels/support.nut"), m = D.load("geometry");
local input = m.array("Vec3", 256), output = m.array("Vec3", 256);
// Process 600 vertices in fixed-capacity batches, including the final tail.
local processed = 0;
while (processed < 600) {
    local count = 600-processed < 256 ? 600-processed : 256;
    for (local i=0; i<count; i++) input.set(i, {x=(processed+i).tofloat(), y=2.0, z=-1.0});
    m.transform(input, output, count, 2.0, 1.0, -1.0, 3.0);
    for (local i=0; i<count; i++) {
        local p=output.get(i);
        D.near(p.x, (processed+i)*2.0+1.0, "x transform");
        D.near(p.y, 3.0, "y transform"); D.near(p.z, 1.0, "z transform");
    }
    processed += count;
}
print("geometry: transformed and checked 600 vertices in three batches\n");
