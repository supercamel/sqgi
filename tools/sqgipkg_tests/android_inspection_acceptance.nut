// Run through an installed backend, including provisioning, without Python.
local Gio = import("Gio")
local request = sqgi.json.parse(Gio.File.new_for_path(vargv[0]).load_contents(null)[0])
local C = import(request.backend + "/common.nut"), I = import(request.backend + "/inspection.nut")
local S = import(request.backend + "/sdk.nut")
local runtime = I.Inspection(request.abi, request.location).prepare(true)
local metadata = sqgi.json.parse(C.read(runtime.manifest)), reference = sqgi.json.parse(C.read(request.reference))
if (!C.equal(metadata.sysroot, reference.sysroot) || metadata.qemu_sha256 != reference.qemu_sha256)
    throw "SQGI inspection provisioning differs from the reference userspace"
local sdk = S.SDK(request.sdk, request.abi, 31).validate()
runtime.execute(request.binary, [request.script], [sdk.prefix + "/lib"], [sdk.prefix + "/lib/girepository-1.0"])
local result = sqgi.json.parse(C.read("native-result.json"))
if (!result.passed || result.abi != request.abi || result.layout_size != (request.abi == "arm64-v8a" ? 32 : 24))
    throw "Native inspection execution failed or selected the wrong ABI"
C.atomic_json(request.report, { abi = request.abi, root = runtime.directory, identity = runtime.identity,
    manifest_sha256 = C.file_hash(runtime.manifest), same_userspace_as_reference = true, execution = result })
print("PASS: SQGI-provisioned " + request.abi + " userspace and native execution\n")
