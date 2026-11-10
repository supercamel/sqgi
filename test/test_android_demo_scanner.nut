local GLib=import("GLib"), Gio=import("Gio")
local Scanner=import("../demo/ip-scanner-android/src/scanner.nut")
function check(value,message) { if(!value) throw message }
function rejects(fn,value) {
    local rejected=false; try { fn(value) } catch(unused) { rejected=true }
    check(rejected,"Expected rejection: "+value)
}
check(Scanner.addresses("192.168.2.8/24").len()==254,"/24 host count")
check(Scanner.addresses("192.168.2.8/24")[0]=="192.168.2.1","/24 network normalization")
check(Scanner.addresses("10.1.2.3/31")[0]=="10.1.2.2","/31 includes both endpoints")
check(Scanner.addresses("127.0.0.1")[0]=="127.0.0.1","literal address")
foreach(value in ["10.0.0.1/23","256.1.1.1","localhost","1.2.3.4/33","1.2.3","1.2.3.4/"])
    rejects(Scanner.addresses,value)
check(Scanner.ports("80, 443,80").len()==2,"ports deduplicated")
foreach(value in ["0","65536","80,,443",",80","80,","80 443","-1",""])
    rejects(Scanner.ports,value)

local service=Gio.SocketService.new(), loop=GLib.MainLoop.new(null,false), error=null
local bound=service.add_address(Gio.InetSocketAddress.new(Gio.InetAddress.new_from_string("127.0.0.1"),0),
    Gio.SocketType.stream,Gio.SocketProtocol.tcp,null)
service.connect("incoming",function(connection,unused){ connection.close(null); return true })
service.start()
local found=0, completed=0, cancelled=0, operation=null
local deadline=GLib.timeout_add(GLib.PRIORITY_DEFAULT,5000,function(){error="Scanner timeout";loop.quit();return false})
operation=Scanner.start(["127.0.0.1"],[bound.get_port()],function(host,port,latency){
    check(host=="127.0.0.1" && port==bound.get_port() && latency>=0,"TCP result"); found++
},function(done,total){ check(done==1 && total==1,"progress") },function(stopped){
    check(!stopped && found==1,"Successful loopback scan"); completed++
    local hosts=[]; for(local i=0;i<40;i++) hosts.push("127.0.0.1")
    operation=Scanner.start(hosts,[bound.get_port()],function(h,p,l){error="Result after cancellation"},
        function(d,t){error="Progress after cancellation"},function(stopped){
            check(stopped,"Cancelled scan reported success"); cancelled++; loop.quit()
        })
    operation.cancel()
})
loop.run(); GLib.source_remove(deadline); service.stop(); service.close()
check(error==null,error); check(found==1 && completed==1 && cancelled==1,"Completion count")
print("PASS: IPv4/port validation, real loopback connection, progress and cancellation\n")
