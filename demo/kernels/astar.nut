local D=import("demo/kernels/support.nut"),m=D.load("astar");
local grid=m.array("i64",256),state=m.array("Search",256),path=m.array("i64",256);
local board=array(256,0);
// Two walls with offset gaps force a detour.
for(local row=0;row<16;row++) {
    if(row!=12)board[row*16+5]=1;
    if(row!=3)board[row*16+10]=1;
}
for(local i=0;i<256;i++)grid.set(i,board[i]);
local length=m.search(grid,state,path,0,255);
// Independent BFS establishes the shortest distance, not just reachability.
local distances=array(256,-1),queue=[0],head=0;distances[0]=0;
while(head<queue.len()) {
    local cell=queue[head++],r=cell/16,c=cell%16;
    foreach(delta in [[-1,0],[1,0],[0,-1],[0,1]]) {
        local nr=r+delta[0],nc=c+delta[1];
        if(nr>=0&&nr<16&&nc>=0&&nc<16) {
            local next=nr*16+nc;
            if(board[next]==0&&distances[next]<0){distances[next]=distances[cell]+1;queue.append(next);}
        }
    }
}
D.check(length==distances[255]+1,"A* shortest path length");
local marked=clone board;
for(local i=0;i<length;i++) {
    local cell=path.get(i);D.check(cell>=0&&cell<256&&board[cell]==0,"path traversability");marked[cell]=2;
    if(i>0){local previous=path.get(i-1);D.check(abs(cell/16-previous/16)+abs(cell%16-previous%16)==1,"path adjacency");}
}
D.check(path.get(0)==255&&path.get(length-1)==0,"path endpoints");
print("A*: "+(length-1)+" moves (BFS verified), # walls, * path\n");
for(local row=0;row<16;row++) {
    local line="";for(local col=0;col<16;col++){local i=row*16+col;line+=i==0?"S":i==255?"G":marked[i]==1?"#":marked[i]==2?"*":".";}
    print(line+"\n");
}
