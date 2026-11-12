local Gtk=import("Gtk","4.0"),Gio=import("Gio"),GLib=import("GLib")
local app=Gtk.Application.new("org.sqgi.android.compilerqualification",Gio.ApplicationFlags.non_unique)
local tests=["test_jit_correctness.nut","test_jit_loop_regressions.nut","test_jit_math.nut","test_jit_fastpath.nut","test_jit_perf_correctness.nut","test_kernel.nut","test_kernel_locals.nut","test_kernel_small_calls.nut"]
local report={passed=[],failed=[],backend=sqgi.kernel.backend,available=sqgi.kernel.available,jit=GLib.getenv("SQGI_JIT")},at=0,label=null
::vargv<-[]
function save(){Gio.File.new_for_path(GLib.get_home_dir()+"/compiler-result.json").replace_contents(sqgi.json.stringify(report),null,false,Gio.FileCreateFlags.replace_destination,null)}
app.connect("activate",function(){
 local window=Gtk.ApplicationWindow.new(app);window.set_title("Android LLVM qualification");window.set_default_size(1000,700)
 label=Gtk.Label.new("Checking Android JIT and typed kernels...");label.set_wrap(true);window.set_child(label);window.present()
 GLib.timeout_add(GLib.PRIORITY_DEFAULT,150,function(){
   if(at>=tests.len()){report.complete<-true;save();label.set_text("LLVM on Android\n\n"+report.passed.len()+" passed, "+report.failed.len()+" failed\n\nTyped kernel backend: "+report.backend);return false}
   local name=tests[at++];label.set_text("Testing "+name)
   try{
    local source=Gio.File.new_for_path("test/"+name).query_info("standard::type,standard::size",Gio.FileQueryInfoFlags.none,null)
    assert(source.get_file_type()==Gio.FileType.regular && source.get_size()>256)
    loadfile("test/"+name).call(getroottable());report.passed.append(name)
   }catch(error){report.failed.append({name=name,error=error.tostring()})}
   save();return true
 })
})
app.run([])
