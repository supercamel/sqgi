local Gtk=import("Gtk","4.0"),GLib=import("GLib"),Gio=import("Gio"),Worker=import("SqWorker","1.0")
local app=Gtk.Application.new("org.sqgi.android.workerqualification",Gio.ApplicationFlags.non_unique)
local report={passed=false,cases=[],running="starting"},label=null,children=[],finished=false
local root=GLib.getenv("SQGI_APP_SHARE"),expected="héllo 🛰 日本語",parent=split(Gio.File.new_for_path("/proc/self/stat").load_contents(null)[0]," ")[0]
local expectedCwd=GLib.get_current_dir(),stage=0,repeats=0
local lifecycleBusy=false
function lifecycleSave(value){local text=sqgi.json.stringify(value);GLib.file_set_contents(GLib.get_home_dir()+"/worker-lifecycle.json",text,text.len())}
function lifecyclePoll(){
 local request=Gio.File.new_for_path(GLib.get_home_dir()+"/worker-request.json")
 if(!report.passed || lifecycleBusy || !request.query_exists(null))return true
 lifecycleBusy=true
 try{
  local value=sqgi.json.parse(request.load_contents(null)[0]);request.delete(null)
  assert(value.action=="native-crash" || value.action=="parent-death")
  local state={action=value.action,token=value.token,parent=parent,phase="waiting"}
  local child=start("hold",Gio.SubprocessFlags.stdout_silence|Gio.SubprocessFlags.stderr_silence,
      sqgi.json.stringify({path=GLib.get_home_dir()+"/worker-live.json",token=value.token}))
  lifecycleSave(state)
  child.wait_async(null,function(process,result){try{
   process.wait_finish(result)
   assert(value.action=="native-crash" && !process.get_if_exited() && !process.get_successful())
   state.exit_status<-process.get_exit_status();state.term_sig<-process.get_term_sig()
   smoke(function(){state.phase="recovered";state.replacement_pid<-report.last_child.pid;lifecycleSave(state);lifecycleBusy=false})
  }catch(error){state.error<-error.tostring();lifecycleSave(state)}})
 }catch(error){lifecycleSave({error=error.tostring()})}
 return true
}
function save(){local text=sqgi.json.stringify(report);GLib.file_set_contents(GLib.get_home_dir()+"/worker-result.json",text,text.len());label.set_text(text)}
function fail(error){if(finished)return;finished=true;report.error<-error.tostring();foreach(child in children)try{child.force_exit()}catch(ignored){};save()}
function start(mode,flags,argument=""){
 local launcher=Worker.Launcher.new(flags);launcher.set_cwd(root)
 launcher.setenv("SQGI_WORKER_TEST","child-only",true);launcher.setenv("SQGI_WORKER_TEST","ignored",false)
 launcher.setenv("SQGI_WORKER_REMOVED","remove-me",true);launcher.unsetenv("SQGI_WORKER_REMOVED")
 local child=launcher.spawnv(["sqgi",root+"/worker.nut",mode,argument]);children.append(child);return child
}
function done(name){report.cases.append(name);save();sqgi.timeout_add(1,function(){if(!finished)try{next()}catch(error){fail(error)};return false})}
function wait(child,callback){child.wait_async(null,function(process,result){try{process.wait_finish(result);callback(process)}catch(error){fail(error)}})}
function smoke(callback){
 local child=start("smoke",Gio.SubprocessFlags.stdout_pipe|Gio.SubprocessFlags.stderr_pipe,expected)
 wait(child,function(process){
  local output=process.get_stdout_pipe().read_bytes(4096,null).get_data(),errors=process.get_stderr_pipe().read_bytes(4096,null).get_data()
  local value=sqgi.json.parse(output)
  assert(process.get_if_exited() && process.get_exit_status()==17 && !process.get_successful())
  assert(value.argument==expected && value.value=="child-only" && value.removed==null && value.cwd==expectedCwd && value.pid!=parent)
  assert(GLib.getenv("SQGI_WORKER_TEST")==null && errors.len()==0)
  report.last_child<-value;report.parent<-parent;callback()
 })
}
function bulk(){
 local count=262144,payload="";for(local i=0;i<count/16;i++)payload+="0123456789abcdef"
 local child=start("bulk",Gio.SubprocessFlags.stdin_pipe|Gio.SubprocessFlags.stdout_pipe|Gio.SubprocessFlags.stderr_pipe,count.tostring())
 local state={written=false,read=false,waited=false,output="",offset=0}
 local finish=function(){if(state.written && state.read && state.waited){assert(state.output==payload);assert(child.get_successful());assert(child.get_stderr_pipe().read_bytes(4096,null).get_data()=="bulk complete\n");done("256 KiB stdin/stdout with asynchronous backpressure")}}
 local write=null;write=function(){
  local remaining=GLib.Bytes.new(payload.slice(state.offset))
  child.get_stdin_pipe().write_bytes_async(remaining,GLib.PRIORITY_DEFAULT,null,function(stream,result){try{
   local n=stream.write_bytes_finish(result);assert(n>0);state.offset+=n
   if(state.offset<count)write();else{stream.close(null);state.written=true;finish()}
  }catch(error){fail(error)}})
 }
 local read=null;read=function(){child.get_stdout_pipe().read_bytes_async(16384,GLib.PRIORITY_DEFAULT,null,function(stream,result){try{
  local bytes=stream.read_bytes_finish(result)
  if(bytes.get_size()){state.output+=bytes.get_data();assert(state.output.len()<=count);read()}
  else{state.read=true;finish()}
 }catch(error){fail(error)}})}
 read();write();wait(child,function(process){state.waited=true;finish()})
}
function next(){
 stage++;report.running="stage "+stage;save()
 if(stage==1){smoke(function(){done("isolated PID, Unicode arguments, cwd, child-only environment and exit status")});return}
 if(stage==2){bulk();return}
 if(stage==3){
  local child=start("wait",Gio.SubprocessFlags.stdout_silence|Gio.SubprocessFlags.stderr_silence),cancel=Gio.Cancellable.new()
  child.wait_async(cancel,function(process,result){try{
   local cancelled=false;try{process.wait_finish(result)}catch(error){cancelled=true};assert(cancelled)
   assert(!process.get_if_exited());process.force_exit()
   wait(process,function(stopped){assert(!stopped.get_if_exited() && stopped.get_term_sig()==9);done("cancellable wait and forced termination")})
  }catch(error){fail(error)}});cancel.cancel();return
 }
 if(stage==4){
  local child=start("throw",Gio.SubprocessFlags.stdout_silence|Gio.SubprocessFlags.stderr_pipe)
  wait(child,function(process){assert(process.get_if_exited() && process.get_exit_status()!=0);assert(process.get_stderr_pipe().read_bytes(16384,null).get_size()>0);done("script failure reports nonzero exit")});return
 }
 if(stage==5){
  local group=[];for(local i=0;i<8;i++)group.append(start("wait",Gio.SubprocessFlags.stdout_silence|Gio.SubprocessFlags.stderr_silence))
  local rejected=false;try{start("wait",Gio.SubprocessFlags.stdout_silence|Gio.SubprocessFlags.stderr_silence)}catch(error){rejected=true};assert(rejected)
  local remaining=group.len();foreach(child in group){child.force_exit();wait(child,function(process){assert(!process.get_if_exited());remaining--;if(remaining==0)done("eight concurrent workers; ninth rejected; all reaped")})};return
 }
 if(stage==6){
  if(repeats<12){repeats++;stage--;smoke(function(){done("reused worker slot "+repeats)});return}
  stage++;report.passed=true;report.running="complete";finished=true;save();return
 }
}
app.connect("activate",function(){
 local window=Gtk.ApplicationWindow.new(app);window.set_title("Android worker qualification");window.set_default_size(1000,700)
 label=Gtk.Label.new("Checking isolated SQGI workers...");label.set_wrap(true);window.set_child(label);window.present()
 sqgi.timeout_add(180000,function(){if(!finished)fail("Worker qualification timed out at "+report.running);return false})
 sqgi.timeout_add(100,lifecyclePoll)
 try{next()}catch(error){fail(error)}
})
app.run([])
