function check(ok,message){if(!ok)throw message}
function exercise(){
 local keep=5,outer=@()keep,first=null,second=null,caught=null
 try {
  local value=42,other={text="saved"}
  first=function(delta=0){value+=delta;return value}
  second=@()other.text
  throw "expected"
 }catch(problem){
  caught=problem
  local reused={unrelated=true}
  check(first()==42,"Try closure lost its captured integer inside catch")
  keep=7
 }
 check(caught=="expected","Catch did not receive the original error")
 check(second()=="saved","Try closure lost its captured object")
 check(first(1)==43,"Captured local no longer mutable after catch")
 keep=9;check(outer()==9,"Outer live scope was incorrectly closed")
 local escaped=null,catchClosure=null
 try {
  local middle=13
  escaped=@()middle
  try {
   local inner=29
   local readInner=@()inner
   throw readInner
  }catch(error){
   check(error()==29,"Inner try capture changed on first catch")
   catchClosure=error
   middle=17
   throw "again"
  }
 }catch(error){check(error=="again","Rethrow changed value")}
 check(escaped()==17 && catchClosure()==29,"Nested unwinding corrupted captures")
 return first
}
for(local i=0;i<2000;i++){local fn=exercise();check(fn()==43,"Capture lost after its defining frame returned")}
print("PASS escaped closures across catch, nested rethrow, mutable outer scope and frame return\n")
