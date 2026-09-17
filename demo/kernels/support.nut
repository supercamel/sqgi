function check(ok, message) { if (!ok) throw "kernel demo: " + message; }
function near(a, b, message) { check(fabs(a-b) <= 1.0e-10 * (1.0 + fabs(b)), message); }
function load(name) {
    check("kernel" in sqgi && sqgi.kernel.available, "build SQGI with SQGI_ENABLE_KERNELS=ON");
    return sqgi.kernel.load("demo/kernels/" + name + ".sqk");
}
return { check = check, near = near, load = load };
