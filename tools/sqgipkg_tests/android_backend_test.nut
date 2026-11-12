// JSON bridge for the external acceptance harness; all exercised work is SQGI.
local C = import("../sqgipkg_lib/android/common.nut")
try {
    local request = sqgi.json.parse(C.read(vargv[0])), result = null
    if (request.operation == "native-java") {
        import("../sqgipkg_lib/android/assemble.nut").native_java(request.sdk, request.destination)
        result = true
    } else if (request.operation == "angle-selection") {
        result = import("../sqgipkg_lib/android/device.nut").angle_selection(request.packages, request.drivers, request.package)
    } else if (request.operation == "emulator-command") {
        local emulator = import("../sqgipkg_lib/android/emulator.nut")
        result = emulator.command(request.paths, emulator.port(request.port), request.headless, C.get(request,"gpu"))
    } else if (request.operation == "provision-tool") {
        result = import("../sqgipkg_lib/android/provision.nut").prepare(request.input, request.offline)
    } else if (request.operation == "host-toolchain") {
        result = import("../sqgipkg_lib/android/toolchain.nut").identity(request)
    } else if (request.operation == "resolve-toolchain") {
        local environment = import("../sqgipkg_lib/android/environment.nut")
        if ("host_arch" in request) environment.host_arch = function() { return request.host_arch }
        result = import("../sqgipkg_lib/android/toolchain.nut").resolve(request)
    } else if (request.operation == "wrapper") {
        local wrapper = import("../sqgipkg_lib/android/wrapper.nut")
        result = { platform = wrapper.available(request.metadata, "platform"), entry = wrapper.available(request.metadata, "entry") }
    } else if (request.operation == "host-inputs") {
        result = import("../sqgipkg_lib/android/host_inputs.nut").identify(request.roots)
    } else if (request.operation == "compat") {
        local pkg = import("../sqgipkg_lib/main.nut").SqgiPkg([])
        result = import("../sqgipkg_lib/android/compat.nut").normalize(request.args, pkg.long_options)
    } else if (request.operation == "android-resources") {
        import("../sqgipkg_lib/android/resources.nut").prepare(request.destination, request.project, C.get(request, "icon", ""), C.get(request, "sdk"))
        result = true
    } else if (request.operation == "project-stage") {
        local pkg = import("../sqgipkg_lib/main.nut").SqgiPkg([])
        local opts = pkg.parse_args([], { manifest = request.manifest, target = request.target })
        pkg.mkdir_p(request.destination)
        if (pkg.is_android(opts)) result = pkg.android_stage_application(opts, request.destination)
        else {
            local scripts = {}, entry = pkg.stage_app_scripts(opts, request.destination, scripts)
            if (pkg.starts_with(opts.target, "win-")) foreach (spec in opts.windows.files) pkg.copy_file_spec(opts, spec, request.destination)
            else pkg.stage_extra_files(opts, request.destination, scripts)
            result = { entry = entry }
        }
    } else if (request.operation == "sdk") {
        local sdk = import("../sqgipkg_lib/android/sdk.nut").SDK(request.root, request.abi, request.min_api)
        if (request.validate) sdk.validate()
        result = { sha256 = sdk.sha256, abi = sdk.abi }
        if (C.get(request, "namespaces", false)) result.namespaces <- sdk.resolve_namespaces().metadata.namespaces
    } else if (request.operation == "elf") {
        result = import("../sqgipkg_lib/android/elf.nut").inspect(request.path, request.abi)
    } else if (request.operation == "rpath") {
        result = import("../sqgipkg_lib/android/elf.nut").remove_build_rpath(request.source, request.destination, request.roots)
    } else if (request.operation == "encode") {
        result = C.encoded(request.value)
    } else if (request.operation == "relative") {
        result = C.relative(request.value)
    } else if (request.operation == "artifact") {
        result = import("../sqgipkg_lib/android/payload.nut").verify_artifact(request.path, request.abis)
    } else if (request.operation == "splits") {
        result = import("../sqgipkg_lib/android/payload.nut").verify_splits(request.paths, request.abi)
    } else if (request.operation == "prepared") {
        import("../sqgipkg_lib/android/payload.nut").validate_prepared(request.root, request.sha256, request.abi)
        result = true
    } else if (request.operation == "resolve-sdk") {
        result = import("../sqgipkg_lib/android/packages.nut").resolve(request.request)
    } else if (request.operation == "combine") {
        result = import("../sqgipkg_lib/android/bundle.nut").combine(request.inputs, request.destination)
    } else if (request.operation == "gradle") {
        result = import("../sqgipkg_lib/android/toolchain.nut").gradle(request.offline)
    } else if (request.operation == "resolve-modules") {
        result = import("../sqgipkg_lib/android/modules.nut").resolve(request.request, request.sdk_base, request.work, "readelf")
    } else if (request.operation == "native-order") {
        result = import("../sqgipkg_lib/android/native.nut").ordered(request.projects)
    } else if (request.operation == "image-partitions") {
        local input = import("Gio").File.new_for_path(request.path).read(null)
        try { result = import("../sqgipkg_lib/android/image.nut").partitions(input, request.start, request.size) }
        catch (caught) { input.close(null); throw caught }
        input.close(null)
    } else if (request.operation == "inspection") {
        local runtime = import("../sqgipkg_lib/android/inspection.nut").Inspection(request.abi, C.get(request, "root"))
        if (C.get(request, "prepare", false)) runtime.prepare(C.get(request, "offline", false))
        else runtime.validate()
        result = { root = runtime.directory, identity = runtime.identity, manifest_sha256 = C.file_hash(runtime.manifest) }
    } else if (request.operation == "gi-check") {
        local context = import("../sqgipkg_lib/android/gi.nut").Context(request.context, request.dynamic_paths)
        if ("args" in request) context.validate_gir_includes(request.args, request.directories)
        if ("elf" in request) context.elf(request.elf)
        result = true
    } else if (request.operation == "native-clean-environment") {
        local env = import("../sqgipkg_lib/android/source.nut").clean_environment()
        result = { path = env.PATH, xmllint = env.SQGI_ANDROID_XMLLINT }
    } else if (request.operation == "native-build-directory") {
        import("../sqgipkg_lib/android/source.nut").prepare_directory(request.directory, request.context)
        result = true
    } else if (request.operation == "native-source-provenance") {
        result = import("../sqgipkg_lib/android/source.nut").source_provenance(request.project, request.source, C.get(request, "excludes", []))
    } else if (request.operation == "runtime-source-provenance") {
        result = import("../sqgipkg_lib/android/runtime.nut").identity(request.source, C.get(request, "configuration"))
    } else if (request.operation == "native-expand") {
        result = import("../sqgipkg_lib/android/source.nut").expand(request.value, request.variables)
    } else if (request.operation == "native-cmake-flags") {
        result = import("../sqgipkg_lib/android/source.nut").cmake_flags(request.values)
    } else if (request.operation == "native-shims") {
        result = import("../sqgipkg_lib/android/source.nut").shims(request.work)
    } else if (request.operation == "device-select") {
        result = import("../sqgipkg_lib/android/device.nut").select(request.devices, request.serial, request.abis, request.minimum)
    } else if (request.operation == "development-compatible") {
        import("../sqgipkg_lib/android/device.nut").compatible_project(request.installed, request.current)
        result = true
    } else if (request.operation == "development-snapshot") {
        result = import("../sqgipkg_lib/android/device.nut").snapshot(request.source, request.project, request.base_id)
    } else if (request.operation == "native-entry") {
        local module = import("../sqgipkg_lib/android/entry.nut")
        module.validate(request.entry)
        if ("projects" in request) module.owner(request.entry, request.projects)
        if ("library" in request) module.symbols(request.library, request.entry, "readelf")
        result = true
    } else if (request.operation == "gir") {
        result = import("../sqgipkg_lib/android/gir.nut").read(request.path)
    } else if (request.operation == "exports-init") {
        import("../sqgipkg_lib/android/exports.nut").initialize(request.sdk_base, request.root)
        result = true
    } else if (request.operation == "exports-files") {
        import("../sqgipkg_lib/android/exports.nut").export_files(request.root, request.owner, request.installed)
        result = true
    } else throw "Unknown Android test operation"
    print(sqgi.json.stringify({ ok = true, result = result }) + "\n")
} catch (error) {
    print(sqgi.json.stringify({ ok = false, error = error.tostring() }) + "\n")
    return 1
}
return 0
