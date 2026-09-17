// Run from repository root. CPU time, median of five warm samples.
local D=import("demo/kernels/support.nut");
function timed(fn,repeats) {local start=clock();for(local i=0;i<repeats;i++)fn();return (clock()-start)*1e9/repeats;}
function median(values){values.sort();return values[values.len()/2];}
function bench(name,native,script,verify,copy_in,copy_out) {
    native();script();verify();
    local repeats=1;
    // Calibrate on the slower script path, aiming for 10ms per sample.
    while(repeats<65536 && timed(script,repeats)*repeats<1e7)repeats*=2;
    local nt=[],st=[],ci=[],co=[];
    for(local sample=0;sample<5;sample++) {
        if(sample%2==0){nt.append(timed(native,repeats));st.append(timed(script,repeats));}
        else {st.append(timed(script,repeats));nt.append(timed(native,repeats));}
        ci.append(timed(copy_in,repeats));co.append(timed(copy_out,repeats));verify();
    }
    local kernel_ns=median(nt),script_ns=median(st);
    D.check(kernel_ns>0 && script_ns>0,"timer resolution too low");
    print(format("%s repeats=%d kernel_ns=%.1f squirrel_ns=%.1f speedup=%.2f copy_in_ns=%.1f copy_out_ns=%.1f\n",
        name,repeats,kernel_ns,script_ns,script_ns/kernel_ns,median(ci),median(co)));
}
local started=clock(),reductions=D.load("reductions"),histogram=D.load("histogram"),astar=D.load("astar");
print(format("backend=%s compile_three_modules_ms=%.3f\n",sqgi.kernel.backend,(clock()-started)*1000.0));
local values=array(1024,0.0),typed=reductions.array("f64",1024),nr=0.0,sr=0.0;
for(local i=0;i<1024;i++){values[i]=(i%31-15).tofloat()/8.0;typed.set(i,values[i]);}
bench("sum/1024",function(){nr=reductions.sum(typed,1024);},
    function(){sr=0.0;foreach(x in values)sr+=x;},function(){D.check(nr==sr,"sum mismatch");},
    function(){for(local i=0;i<1024;i++)typed.set(i,values[i]);},function(){local x=nr;});
local samples=array(1024,0),bins=array(16,0),copied=array(16,0),input=histogram.array("i64",1024),output=histogram.array("i64",16);
for(local i=0;i<1024;i++){samples[i]=i%16;input.set(i,samples[i]);}
bench("histogram/1024",function(){histogram.histogram(input,output,1024);},
    function(){for(local i=0;i<16;i++)bins[i]=0;foreach(x in samples)bins[x]++;},
    function(){for(local i=0;i<16;i++)D.check(output.get(i)==bins[i],"histogram mismatch");},
    function(){for(local i=0;i<1024;i++)input.set(i,samples[i]);},
    function(){for(local i=0;i<16;i++)copied[i]=output.get(i);});
// Same linear-scan A* algorithm and tie order on both sides. Storage is reused.
local board=array(256,0),grid=astar.array("i64",256),state=astar.array("Search",256),path=astar.array("i64",256);
local g=array(256,0),f=array(256,0),parent=array(256,-1),status=array(256,0),route=array(256,-1),copied_path=array(256,-1);
function distance(cell){return abs(cell/16-15)+abs(cell%16-15);}
function script_search() {
    for(local i=0;i<256;i++){g[i]=1000000;f[i]=1000000;parent[i]=-1;status[i]=0;route[i]=-1;}
    g[0]=0;f[0]=distance(0);status[0]=1;
    while(true) {
        local current=-1,best=1000000;
        for(local i=0;i<256;i++)if(status[i]==1&&f[i]<best){best=f[i];current=i;}
        if(current<0)return -1;
        if(current==255){local length=0;while(current!=-1){route[length++]=current;current=parent[current];}return length;}
        status[current]=2;local row=current/16,col=current%16;
        for(local direction=0;direction<4;direction++) {
            local r=row,c=col;
            if(direction==0)r--;if(direction==1)r++;if(direction==2)c--;if(direction==3)c++;
            if(r>=0&&r<16&&c>=0&&c<16){local next=r*16+c;
                if(board[next]==0&&status[next]!=2){local candidate=g[current]+1;
                    if(candidate<g[next]){g[next]=candidate;f[next]=candidate+distance(next);parent[next]=current;status[next]=1;}}}
        }
    }
}
foreach(pattern in ["open","maze","unreachable"]) {
    for(local i=0;i<256;i++){local r=i/16,c=i%16;board[i]=(pattern=="maze"?((c==5&&r!=12)||(c==10&&r!=3)):pattern=="unreachable"?r==8:false)?1:0;grid.set(i,board[i]);}
    local native_length=0,script_length=0;
    bench("astar/"+pattern,function(){native_length=astar.search(grid,state,path,0,255);},
        function(){script_length=script_search();},
        function(){D.check(native_length==script_length,"A* length mismatch");for(local i=0;i<256;i++)D.check(path.get(i)==route[i],"A* path mismatch");},
        function(){for(local i=0;i<256;i++)grid.set(i,board[i]);},
        function(){for(local i=0;i<256;i++)copied_path[i]=path.get(i);});
}
