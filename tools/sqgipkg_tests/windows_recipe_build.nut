// Exercise the production machine-file generators and recipe cache handling.
local GLib=import("GLib")
local pkg=import("../sqgipkg_lib/main.nut").SqgiPkg([])
local opts=pkg.new_options(),root=vargv[0],system=vargv[1],value=vargv[2]
opts.target="win-dir";opts.manifest_dir=root;opts.output_dir=root+"/output"
opts.windows.sysroot=root+"/sysroot";opts.entry_type="native";opts.entry_project="fixture"
local project={name="fixture",dir=root+"/source",build_system=system,options={},libraries=[],typelibs=[],stage=""}
local cross=pkg.recipe_cross_file(opts,system=="cmake")
if(system=="cmake")pkg.write_windows_cmake_toolchain(opts,cross)
else pkg.write_windows_meson_cross_file(opts,cross)
local source=pkg.read_file(cross)
if(system=="cmake")source+="\nset(CMAKE_CXX_FLAGS_INIT \"-DTEST_VALUE="+value+"\")\n"
else {local at=source.find("[built-in options]")+"[built-in options]".len();source=source.slice(0,at)+"\ncpp_args = ['-DTEST_VALUE="+value+"']"+source.slice(at)}
pkg.write_file(cross,source)
pkg.run_native_recipe(opts,project)
print("Recipe build complete: "+pkg.recipe_build_dir(opts,project)+"\n")
