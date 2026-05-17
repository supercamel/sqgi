// test/test_subclass_errors.nut
//
// Hits the error-paths of sqgi.register_class — bad arg shapes, missing keys,
// wrong types, duplicate registration. These paths exist for embedder
// hygiene but were untested.

function expect_throw(fn, expected_substr, label) {
    try {
        fn()
    } catch (e) {
        local s = "" + e
        if (s.find(expected_substr) == null) {
            throw "[FAIL] " + label + ": expected '" + expected_substr
                  + "' in error, got '" + s + "'"
        }
        return
    }
    throw "[FAIL] " + label + ": expected throw, got none"
}

local Gio = import("Gio")

// 1. non-table arg
expect_throw(function() {
    sqgi.register_class("just a string")
}, "expected a table", "non-table arg")

// 2. missing name
expect_throw(function() {
    sqgi.register_class({ parent = Gio.Application, overrides = {} })
}, "missing 'name'", "missing name")

// 3. name not a string
expect_throw(function() {
    sqgi.register_class({ name = 42, parent = Gio.Application, overrides = {} })
}, "'name' must be a string", "name not string")

// 4. missing parent
expect_throw(function() {
    sqgi.register_class({ name = "SqgiErrTestNoParent", overrides = {} })
}, "missing 'parent'", "missing parent")

// 5. parent not a class
expect_throw(function() {
    sqgi.register_class({
        name = "SqgiErrTestBadParent",
        parent = "not a class",
        overrides = {}
    })
}, "'parent' must be a class", "parent not a class")

// 6. duplicate registration name — register once, then again with same name
local A = sqgi.register_class({
    name = "SqgiErrTestDup",
    parent = Gio.Application,
    overrides = {}
})
expect_throw(function() {
    sqgi.register_class({
        name = "SqgiErrTestDup",
        parent = Gio.Application,
        overrides = {}
    })
}, "already registered", "duplicate name")

// 7. unknown vfunc name in overrides — should warn but not throw.
//    Exercises sqgi_subclass.c "vfunc '%s' not found" path.
local _cls7 = sqgi.register_class({
    name = "SqgiErrTestUnknownVfunc",
    parent = Gio.Application,
    overrides = {
        activate = function(self) {},
        not_a_real_vfunc = function(self) {}
    }
})
// Construction must still succeed — the bad override is dropped with a warning.
local _app7 = sqgi.new_object(_cls7, { "application-id": "org.example.sqgi.subclass.unknown.vfunc" })
if (_app7 == null) throw "[FAIL] unknown vfunc: construction failed"

// 8. vfunc with unsupported signature — local_command_line takes char***
//    which we cannot marshal through libffi. The override must be dropped
//    gracefully (sqgi_make_vfunc_trampoline returns NULL → warning, continue).
local _cls8 = sqgi.register_class({
    name = "SqgiErrTestUnsupportedVfunc",
    parent = Gio.Application,
    overrides = {
        activate = function(self) {},
        local_command_line = function(self, args) { return true }
    }
})
local _app8 = sqgi.new_object(_cls8, { "application-id": "org.example.sqgi.subclass.unsupp.vfunc" })
if (_app8 == null) throw "[FAIL] unsupported vfunc: construction failed"

print("[OK] test_subclass_errors passed\n")
