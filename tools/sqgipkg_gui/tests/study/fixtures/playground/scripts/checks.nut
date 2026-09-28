function kernel_sum() {
    local module = sqgi.kernel.load("kernels/buffers.sqk")
    local values = module.array("f64", 4)
    for (local i = 0; i < 4; i++) values.set(i, (i + 1).tofloat())
    return module.sum_squared(values)
}
return { kernel_sum = kernel_sum }
