#include <squirrel.h>
#include <cstdio>
#include <cstring>
static int failures=0,fast_calls=0,regular_calls=0,effects=0,released=0;
#define CHECK(c,msg) do{if(!(c)){std::fprintf(stderr,"FAIL: %s\n",msg);++failures;}}while(0)
struct Context {SQInteger offset;};
static SQInteger release(SQUserPointer,SQInteger){++released;return 0;}
static SQInteger regular(HSQUIRRELVM v) {
    ++regular_calls;SQInteger x=0;SQUserPointer context=nullptr;
    sq_getinteger(v,2,&x);sq_getuserdata(v,-1,&context,nullptr);
    sq_pushinteger(v,x+static_cast<Context*>(context)->offset);return 1;
}
static SQRESULT leaf(SQUserPointer context,const void *args,SQInteger count,
                     SQUnsignedInteger stride,HSQOBJECT *result,const SQChar **error) {
    ++fast_calls;
    if(count!=2){*error=_SC("arity");return SQ_ERROR;}
    const auto &arg=*reinterpret_cast<const HSQOBJECT*>(static_cast<const char*>(args)+stride);
    if(arg._type!=OT_INTEGER){*error=_SC("type");return SQ_ERROR;}
    SQInteger x=arg._unVal.nInteger;
    if(x==-1){++effects;*error=_SC("leaf failed after effect");return SQ_ERROR;}
    if(x==-2){result->_type=OT_STRING;result->_unVal.pString=nullptr;return SQ_OK;}
    if(x==0){result->_type=OT_NULL;return SQ_OK;}
    if(x==-3){result->_type=OT_FLOAT;result->_unVal.fFloat=1.25;return SQ_OK;}
    if(x==-4){result->_type=OT_BOOL;result->_unVal.nInteger=1;return SQ_OK;}
    result->_type=OT_INTEGER;result->_unVal.nInteger=x+static_cast<Context*>(context)->offset;
    return SQ_OK;
}
static void hook(HSQUIRRELVM,SQInteger,const SQChar*,SQInteger,const SQChar*){}
static bool script(HSQUIRRELVM v,const char *source) {
    SQInteger top=sq_gettop(v);
    bool ok=SQ_SUCCEEDED(sq_compilebuffer(v,source,(SQInteger)std::strlen(source),"leaf-test",SQTrue));
    if(ok){sq_pushroottable(v);ok=SQ_SUCCEEDED(sq_call(v,1,SQFalse,SQFalse));}
    if(!ok){sq_getlasterror(v);const SQChar *error=nullptr;sq_getstring(v,-1,&error);std::fprintf(stderr,"%s\n",error?error:"unknown script failure");}
    sq_settop(v,top);return ok;
}
int main() {
    HSQUIRRELVM v=sq_open(128);
    sq_pushroottable(v);sq_pushstring(v,"leaf",-1);
    auto context=static_cast<Context*>(sq_newuserdata(v,sizeof(Context)));context->offset=17;
    sq_setreleasehook(v,-1,release);sq_newclosure(v,regular,1);
    CHECK(SQ_SUCCEEDED(sq_setnativeleaf(v,-1,leaf,context)),"register leaf");
    sq_setparamscheck(v,2,".i");sq_newslot(v,-3,SQFalse);sq_pop(v,1);
    CHECK(script(v,"if(leaf(25)!=42||leaf(-3)!=1.25||leaf(-4)!=true||leaf(0)!=null)throw \"results\";"),"scalar/null results");
    CHECK(fast_calls==4&&regular_calls==0,"direct calls use leaf");
    CHECK(script(v,"if(leaf.call(null,25)!=42||leaf.acall([null,25])!=42)throw \"call API\";"),"call and acall");
    int before=fast_calls;
    CHECK(script(v,"local caught=0;try{leaf();}catch(e){caught++;}try{leaf(1.0);}catch(e){caught++;}if(caught!=2)throw \"checks\";"),"native arity/type checks");
    CHECK(fast_calls==before,"checks happen before leaf");
    CHECK(script(v,"local caught=0;try{leaf(-1);}catch(e){if(e.find(\"after effect\")!=null)caught++;}try{leaf(-2);}catch(e){if(e.find(\"non-scalar\")!=null)caught++;}if(caught!=2)throw \"errors\";"),"errors and invalid result rejected");
    CHECK(effects==1&&regular_calls==0,"error never replays regular callback");
    before=fast_calls;sq_setnativedebughook(v,hook);
    CHECK(script(v,"if(leaf(25)!=42)throw \"debug\";"),"debug fallback");
    sq_setnativedebughook(v,nullptr);
    CHECK(fast_calls==before&&regular_calls==1,"debug uses ordinary native frame");
    CHECK(script(v,"function forward(){return leaf(25);} if(forward()!=42)throw \"tail\"; local co=newthread(function(){return leaf(25);}); if(co.call()!=42)throw \"coroutine\";"),"tail-position and coroutine calls");
    CHECK(script(v,"bound <- leaf.bindenv({}); delete leaf; collectgarbage(); if(bound(25)!=42)throw \"bound\";"),"bound clone retains context and uses regular path");
    CHECK(released==0,"captured owner still alive");
    CHECK(script(v,"delete bound; delete forward; collectgarbage();"),"release closures");
    CHECK(released==1,"captured context released exactly once");
    sq_close(v);
    if(!failures)std::puts("native leaf dispatch tests passed");
    return failures?1:0;
}
