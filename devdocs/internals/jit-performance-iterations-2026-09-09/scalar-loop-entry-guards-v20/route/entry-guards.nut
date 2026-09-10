function marker(x) { return x; }
function entry_leaf(x) { return x+1; }
function entry_root(n) { marker(0); local sum=0; for(local i=0;i<n;i++) { sum+=entry_leaf(i); sum+=entry_leaf(i); } return marker(sum); }
function entry_parameter(n,fn) { marker(0); local sum=0; for(local i=0;i<n;i++) sum+=fn(i); return marker(sum); }
foreach(n in [7,19,37]) {
 if(entry_root(n)!=n*(n+1)) throw "root entry checksum";
 if(entry_parameter(n,entry_leaf)!=n*(n+1)/2) throw "parameter entry checksum";
}
