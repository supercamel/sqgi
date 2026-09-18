function check(value, message) { if(!value) throw message; }
function divide(x,y) { return x/y; }
function remainder(x,y) { return x%y; }
function plus(x,y) { return x+y; }
function minus(x,y) { return x-y; }
function times(x,y) { return x*y; }
function negative(x) { return -x; }
function increment(x) { ++x; return x; }
function decrement(x) { --x; return x; }
function post(x) { local old=x++; return [old,x]; }
local minimum = -9223372036854775807-1, maximum = 9223372036854775807;
for(local n=0;n<20;n++) {
    check(divide(100,-7)==-14 && remainder(-100,7)==-2, "signed arithmetic");
    local error=null;
    try { divide(minimum,-1); } catch(e) { error=e; }
    check(error!=null && error.find("overflow")!=null, "division overflow raises");
    check(remainder(minimum,-1)==0, "minimum remainder");
    check(plus(maximum,1)==minimum && minus(minimum,1)==maximum, "add/sub wrapping");
    check(times(maximum,2)==-2 && negative(minimum)==minimum, "multiply/negate wrapping");
    check(increment(maximum)==minimum && decrement(minimum)==maximum, "increment wrapping");
    local p=post(maximum);
    check(p[0]==maximum && p[1]==minimum, "postincrement wrapping");
}
// Exercise both value-producing comparisons and fused comparison branches.
function compare_values(a,b) { return [a<b,a<=b,a>b,a>=b,a<=>b]; }
function compare_branches(a,b) {
    local bits=0;
    if(a<b) bits+=1;
    if(a<=b) bits+=2;
    if(a>b) bits+=4;
    if(a>=b) bits+=8;
    return bits;
}
function compare_alias(a,b) { a=a<b; b=b>=0; return [a,b]; }
local ordered=[minimum,minimum+1,-1,0,1,maximum-1,maximum];
for(local round=0;round<20;round++) {
    foreach(i,a in ordered) foreach(j,b in ordered) {
        local expected=i==j?0:(i<j?-1:1);
        local r=compare_values(a,b);
        check(r[0]==(expected<0) && r[1]==(expected<=0) &&
              r[2]==(expected>0) && r[3]==(expected>=0) && r[4]==expected,
              "integer comparison extremes");
        check(compare_branches(a,b)==(expected<0?3:(expected>0?12:10)),
              "integer comparison branches");
        local alias=compare_alias(a,b);
        check(alias[0]==(expected<0) && alias[1]==(j>=3), "comparison alias");
    }
}
check(compare_branches("a","b")==3, "string comparison fallback");
check(compare_branches(1,1.5)==3 && compare_branches(2.5,2)==12,
      "mixed numeric comparison fallback");
class Compared {
    value=0;
    constructor(v) { value=v; }
    function _cmp(other) { return value<=>other.value; }
}
check(compare_branches(Compared(-1),Compared(1))==3,
      "comparison metamethod fallback");
print("integer edge tests passed\n");
