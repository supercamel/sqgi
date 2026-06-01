// test/test_math_extended.nut

function check(cond, msg) {
    if (!cond) throw "[FAIL] " + msg
}

function absf(x) {
    return x < 0.0 ? -x : x
}

function approx(actual, expected, epsilon, label) {
    if (!(actual == actual) || absf(actual - expected) > epsilon) {
        throw format("[FAIL] %s got %.9f expected %.9f", label, actual, expected)
    }
}

local root = getroottable()
local funcs = [
    "sinh", "cosh", "tanh",
    "asinh", "acosh", "atanh",
    "exp2", "expm1", "log2", "log1p",
    "cbrt", "hypot", "fmod", "trunc", "round",
    "isnan", "isinf", "isfinite"
]

foreach (name in funcs) {
    check(name in root, "missing math function " + name)
    check(typeof(root[name]) == "function", "math symbol is not function " + name)
}

foreach (name in ["E", "TAU", "HALF_PI", "SQRT2", "LN2", "LN10"]) {
    check(name in root, "missing math constant " + name)
    check(typeof(root[name]) == "float", "math constant is not float " + name)
}

approx(sinh(1.0), 1.1752012, 0.00001, "sinh")
approx(cosh(1.0), 1.5430806, 0.00001, "cosh")
approx(tanh(1.0), 0.7615942, 0.00001, "tanh")
approx(asinh(1.0), 0.8813736, 0.00001, "asinh")
approx(acosh(2.0), 1.3169580, 0.00001, "acosh")
approx(atanh(0.5), 0.5493062, 0.00001, "atanh")

approx(exp2(3.0), 8.0, 0.00001, "exp2")
approx(expm1(1.0), E - 1.0, 0.00001, "expm1")
approx(log2(8.0), 3.0, 0.00001, "log2")
approx(log1p(1.0), LN2, 0.00001, "log1p")

approx(cbrt(27.0), 3.0, 0.00001, "cbrt")
approx(hypot(3.0, 4.0), 5.0, 0.00001, "hypot")
approx(fmod(7.5, 2.0), 1.5, 0.00001, "fmod")
approx(trunc(-1.75), -1.0, 0.00001, "trunc")
approx(round(-1.5), -2.0, 0.00001, "round")

check(isnan(sqrt(-1.0)), "isnan recognizes NaN")
check(isinf(log(0.0)), "isinf recognizes infinity")
check(isfinite(PI), "isfinite recognizes finite value")
check(!isfinite(log(0.0)), "isfinite rejects infinity")
check(!isnan(1.0), "isnan rejects finite value")

approx(E, 2.7182818, 0.00001, "E")
approx(TAU, 6.2831853, 0.00001, "TAU")
approx(HALF_PI, PI / 2.0, 0.00001, "HALF_PI")
approx(SQRT2, 1.4142136, 0.00001, "SQRT2")
approx(LN2, 0.6931472, 0.00001, "LN2")
approx(LN10, 2.3025851, 0.00001, "LN10")

print("test_math_extended.nut passed\n")
