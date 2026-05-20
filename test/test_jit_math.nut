// Math-heavy regression test for the optional Squirrel bytecode JIT.
//
// This intentionally avoids GI calls and focuses on bytecode that a JIT should
// eventually optimize: local integer arithmetic, float arithmetic, array
// indexing, branches, loops, and small function calls.

function check(cond, msg) { if (!cond) throw "[FAIL] " + msg }

local MATRIX_SIZE = 8
local MATRIX_MOD = 1000003
local CHECK_MOD = 1000000007

function absf(x) {
    return x < 0.0 ? -x : x
}

function approx(actual, expected, epsilon, label) {
    if (absf(actual - expected) > epsilon) {
        throw format("[FAIL] %s got %.9f expected %.9f", label, actual, expected)
    }
}

function make_matrix(seed) {
    local m = []
    for (local r = 0; r < MATRIX_SIZE; r++) {
        local row = []
        for (local c = 0; c < MATRIX_SIZE; c++) {
            row.push(((r * 17 + c * 31 + seed * 13) % 23) - 11)
        }
        m.push(row)
    }
    return m
}

function matmul8(a, b) {
    local out = []
    for (local r = 0; r < MATRIX_SIZE; r++) {
        local row = []
        for (local c = 0; c < MATRIX_SIZE; c++) {
            local sum = 0
            for (local k = 0; k < MATRIX_SIZE; k++) {
                sum = (sum + a[r][k] * b[k][c]) % MATRIX_MOD
            }
            row.push(sum)
        }
        out.push(row)
    }
    return out
}

function matrix_checksum(iterations) {
    local a = make_matrix(3)
    local b = make_matrix(7)
    local checksum = 0

    for (local i = 0; i < iterations; i++) {
        local c = matmul8(a, b)
        checksum = (checksum * 131 + c[i % MATRIX_SIZE][(i * 3) % MATRIX_SIZE]) % CHECK_MOD

        // Keep the matrices bounded but changing so the loops cannot collapse
        // into a single repeated multiply.
        a[i % MATRIX_SIZE][(i + 1) % MATRIX_SIZE] =
            (a[i % MATRIX_SIZE][(i + 1) % MATRIX_SIZE] + c[(i + 2) % MATRIX_SIZE][i % MATRIX_SIZE]) % 97
        b[(i + 3) % MATRIX_SIZE][(i + 5) % MATRIX_SIZE] =
            (b[(i + 3) % MATRIX_SIZE][(i + 5) % MATRIX_SIZE] - c[i % MATRIX_SIZE][(i + 4) % MATRIX_SIZE]) % 89
    }

    return checksum
}

function dot3(a, b) {
    return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

function cross3(a, b) {
    return [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0]
    ]
}

function transform_point(m, p) {
    return [
        m[0] * p[0] + m[1] * p[1] + m[2] * p[2] + m[3],
        m[4] * p[0] + m[5] * p[1] + m[6] * p[2] + m[7],
        m[8] * p[0] + m[9] * p[1] + m[10] * p[2] + m[11]
    ]
}

function geometry_checksum(iterations) {
    local transform = [
        1.125, -0.250, 0.375, 3.500,
        0.500, 0.875, -0.125, -2.250,
        -0.375, 0.625, 1.250, 1.750
    ]
    local axis = [0.25, -0.75, 1.50]
    local p = [1.0, 2.0, -3.0]
    local total = 0.0

    for (local i = 0; i < iterations; i++) {
        local q = transform_point(transform, p)
        local n = cross3(q, axis)
        total += dot3(q, n) * 0.0001
        total += dot3(q, q) * 0.001

        local step = ((i % 17).tofloat() - 8.0) * 0.03125
        p[0] = q[0] * 0.03125 + n[0] * 0.0025 + step
        p[1] = q[1] * -0.015625 + n[1] * 0.0015 - step * 0.5
        p[2] = q[2] * 0.020000 + n[2] * -0.0010 + step * 0.25
    }

    return total
}

function mixed_branch_checksum(iterations) {
    local x = 0
    local y = 1

    for (local i = 0; i < iterations; i++) {
        if (((i + x) % 5) == 0) {
            x = (x + i * 7 + y) % CHECK_MOD
        }
        else if ((i % 3) == 0) {
            y = (y * 11 + x + i) % CHECK_MOD
        }
        else {
            x = (x + y + 13) % CHECK_MOD
            y = (y + i * 3 + 17) % CHECK_MOD
        }
    }

    return (x * 31 + y * 17) % CHECK_MOD
}

local matrix = matrix_checksum(140)
local geometry = geometry_checksum(12000)
local branchy = mixed_branch_checksum(20000)

check(matrix == -207833281, "matrix checksum " + matrix)
approx(geometry, 253.261078, 0.001, "geometry checksum")
check(branchy == 767946796, "branch checksum " + branchy)

print("test_jit_math.nut passed\n")
