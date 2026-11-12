local GLib=import("GLib"),Gio=import("Gio")
local mode=vargv[0]
if(mode=="throw")throw "Deliberate qualification failure"
if(mode=="wait"){while(true)GLib.usleep(100000)}
if(mode=="hold"){
 local request=sqgi.json.parse(vargv[1]),count=0
 local pid=split(Gio.File.new_for_path("/proc/self/stat").load_contents(null)[0]," ")[0]
 while(true){
  local text=sqgi.json.stringify({pid=pid,token=request.token,heartbeat=count++})
  GLib.file_set_contents(request.path,text,text.len());GLib.usleep(100000)
 }
}
if(mode=="bulk"){
 local count=vargv[1].tointeger(),part="0123456789abcdef",chunk=""
 for(local i=0;i<4096;i++)chunk+=part[i%part.len()].tochar()
 for(local i=0;i<count;i++)assert(stdin.readn('b')==part[i%part.len()])
 for(local i=0;i<count/chunk.len();i++)print(chunk)
 foreach(byte in "bulk complete\n")stderr.writen(byte,'b');return 0
}
local result={argument=vargv[1],value=GLib.getenv("SQGI_WORKER_TEST"),removed=GLib.getenv("SQGI_WORKER_REMOVED"),cwd=GLib.get_current_dir(),
    pid=split(Gio.File.new_for_path("/proc/self/stat").load_contents(null)[0]," ")[0]}
print(sqgi.json.stringify(result)+"\n")
return 17
