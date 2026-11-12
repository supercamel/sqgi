local pkg=import("../sqgipkg_lib/main.nut").SqgiPkg([])
local opts=pkg.new_options()
opts.name="Launcher Test";opts.app_id="org.sqgi.test.launcher"
opts.windows.gdk_backend="win32"
if(vargv.len()>1)opts.entry_type=vargv[1]
local entry=opts.entry_type=="native"?"bin/native.exe":"share/sqgi/app/main.nut"
assert(import("../sqgipkg_lib/windows/launcher.nut").build(pkg,opts,vargv[0],"LauncherTest",entry))
