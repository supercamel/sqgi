#include "sqgi_kernel.h"
#include "kernel/kernel.h"
#include <cstring>
#include <cstdio>
#include <glib/gstdio.h>
#include <new>
#include <vector>

namespace {
using namespace sqkernel;
char holder_tag, buffer_tag;
struct Holder { std::shared_ptr<Module> module; size_t index; };
struct Buffer {
    std::shared_ptr<Module> module;
    std::string type;
    size_t count, stride;
    std::vector<uint64_t> cells;
};
struct CloseFile { void operator()(FILE *file) const { fclose(file); } };
SQInteger release_holder(SQUserPointer p,SQInteger) { ((Holder*)p)->~Holder(); return 0; }
SQInteger release_buffer(SQUserPointer p,SQInteger) { ((Buffer*)p)->~Buffer(); return 0; }
template<class T> T *userdata(HSQUIRRELVM v,SQInteger i,void *wanted) {
    void *p=nullptr,*tag=nullptr;
    if(SQ_FAILED(sq_getuserdata(v,i,&p,&tag)) || tag!=wanted) throw std::runtime_error("kernel: invalid typed handle");
    return (T*)p;
}
std::string string_arg(HSQUIRRELVM v,SQInteger i) {
    const SQChar *s=nullptr; SQInteger length=0;
    if(SQ_FAILED(sq_getstringandsize(v,i,&s,&length))) throw std::runtime_error("kernel: expected string");
    return std::string(s,(size_t)length);
}
SQInteger integer_arg(HSQUIRRELVM v,SQInteger i) {
    SQInteger n=0;
    if(sq_gettype(v,i)!=OT_INTEGER || SQ_FAILED(sq_getinteger(v,i,&n))) throw std::runtime_error("kernel: expected i64 integer");
    return n;
}
uint64_t scalar(HSQUIRRELVM v,SQInteger i,Type t) {
    uint64_t bits=0;
    if(t==Type::I64) { SQInteger n=integer_arg(v,i); static_assert(sizeof(n)==8,"kernel prototype requires 64-bit Squirrel integers"); memcpy(&bits,&n,8); }
    else if(t==Type::F64) {
        SQFloat f=0;
        if(sq_gettype(v,i)!=OT_FLOAT || SQ_FAILED(sq_getfloat(v,i,&f))) throw std::runtime_error("kernel: expected f64 float (use 1.0, not 1)");
        static_assert(sizeof(f)==8,"kernel prototype requires binary64 Squirrel floats"); memcpy(&bits,&f,8);
    } else {
        SQBool b=SQFalse;
        if(sq_gettype(v,i)!=OT_BOOL || SQ_FAILED(sq_getbool(v,i,&b))) throw std::runtime_error("kernel: expected bool");
        bits=b?1:0;
    }
    return bits;
}
void push_scalar(HSQUIRRELVM v,Type t,uint64_t bits) {
    if(t==Type::F64) { double d; memcpy(&d,&bits,8); sq_pushfloat(v,d); }
    else if(t==Type::Bool) sq_pushbool(v,bits?SQTrue:SQFalse);
    else { SQInteger n; memcpy(&n,&bits,8); sq_pushinteger(v,n); }
}
const Record *record(const Buffer &b) {
    for(auto &r:b.module->records) if(r.name==b.type) return &r;
    return nullptr;
}
size_t buffer_index(HSQUIRRELVM v,const Buffer &b) {
    SQInteger n=integer_arg(v,2);
    if(n<0 || (uint64_t)n>=b.count) throw std::runtime_error("kernel: host array index out of bounds");
    return (size_t)n*b.stride;
}
SQInteger buffer_get(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=2) throw std::runtime_error("kernel array.get expects index");
        auto b=userdata<Buffer>(v,1,&buffer_tag); size_t offset=buffer_index(v,*b);
        if(auto r=record(*b)) {
            sq_newtable(v);
            for(size_t n=0;n<r->fields.size();++n) { sq_pushstring(v,r->fields[n].name.c_str(),-1); push_scalar(v,r->fields[n].type,b->cells[offset+n]); sq_newslot(v,-3,SQFalse); }
        } else push_scalar(v,b->type=="f64"?Type::F64:Type::I64,b->cells[offset]);
        return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
SQInteger buffer_set(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=3) throw std::runtime_error("kernel array.set expects index, value");
        auto b=userdata<Buffer>(v,1,&buffer_tag); size_t offset=buffer_index(v,*b);
        if(auto r=record(*b)) {
            if(sq_gettype(v,3)!=OT_TABLE || (size_t)sq_getsize(v,3)!=r->fields.size()) throw std::runtime_error("kernel: struct value requires exact field table");
            std::vector<uint64_t> values;
            for(auto &f:r->fields) {
                sq_pushstring(v,f.name.c_str(),-1);
                if(SQ_FAILED(sq_rawget(v,3))) throw std::runtime_error("kernel: missing struct field " + f.name);
                values.push_back(scalar(v,-1,f.type)); sq_poptop(v);
            }
            for(size_t n=0;n<values.size();++n) b->cells[offset+n]=values[n];
        } else b->cells[offset]=scalar(v,3,b->type=="f64"?Type::F64:Type::I64);
        return 0;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
void method(HSQUIRRELVM v,const char *name,SQFUNCTION function) {
    sq_pushstring(v,name,-1); sq_newclosure(v,function,0); sq_newslot(v,-3,SQFalse);
}
SQInteger array_new(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=4) throw std::runtime_error("kernel module.array expects type, count");
        auto h=userdata<Holder>(v,-1,&holder_tag);
        std::string type=string_arg(v,2); SQInteger count=integer_arg(v,3); size_t stride=1;
        if(type!="f64" && type!="i64") {
            const Record *r=nullptr; for(auto &candidate:h->module->records) if(candidate.name==type) r=&candidate;
            if(!r) throw std::runtime_error("kernel: unknown array element type " + type);
            stride=r->fields.size();
        }
        if(count<=0 || count>1048576 || (uint64_t)count*stride>8*1024*1024) throw std::runtime_error("kernel: array allocation limit exceeded");
        // Construct into a temporary first: allocation failure cannot leave a half-built userdata.
        Buffer value{h->module,type,(size_t)count,stride,std::vector<uint64_t>((size_t)count*stride,0)};
        void *p=sq_newuserdata(v,sizeof(Buffer)); new(p) Buffer(std::move(value));
        sq_settypetag(v,-1,&buffer_tag); sq_setreleasehook(v,-1,release_buffer);
        sq_newtable(v); method(v,"get",buffer_get); method(v,"set",buffer_set); sq_setdelegate(v,-2);
        return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
SQInteger invoke(HSQUIRRELVM v) {
    try {
        auto h=userdata<Holder>(v,-1,&holder_tag); const Function &f=h->module->functions[h->index];
        if(sq_gettop(v)!=(SQInteger)f.parameters.size()+2) throw std::runtime_error("kernel: wrong argument count for " + f.name);
        std::vector<uint64_t> arguments;
        std::vector<std::pair<Buffer*,bool>> borrowed;
        for(size_t n=0;n<f.parameters.size();++n) {
            const Parameter &p=f.parameters[n]; SQInteger i=(SQInteger)n+2;
            if(!p.extent) { arguments.push_back(scalar(v,i,p.type)); continue; }
            auto b=userdata<Buffer>(v,i,&buffer_tag);
            std::string type=p.record.empty()?(p.type==Type::F64?"f64":"i64"):p.record;
            if(b->module!=h->module || b->type!=type || b->count!=p.extent) throw std::runtime_error("kernel: array schema/extent mismatch for " + p.name);
            // Prototype has no views: identity is an exact overlap test.
            for(auto other:borrowed) if(other.first==b && (other.second || p.writable)) throw std::runtime_error("kernel: overlapping mutable arguments");
            borrowed.push_back({b,p.writable}); arguments.push_back((uint64_t)(uintptr_t)b->cells.data());
        }
        // Arguments and captured module are rooted by the native-call VM frame.
        // Generated code cannot call the VM, allocate, resize or release owners.
        Call call{arguments.data(),0,1000000,0};
        Status status=execute(*h->module,h->index,call);
        if(status!=Success) throw std::runtime_error(h->module->filename+":"+std::to_string(call.error_line)+": "+f.name+": "+status_name(status));
        if(f.result==Type::Void) return 0;
        push_scalar(v,f.result,call.result); return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
void closure(HSQUIRRELVM v,const char *name,SQFUNCTION function,const std::shared_ptr<Module> &module,size_t index) {
    sq_pushstring(v,name,-1);
    void *p=sq_newuserdata(v,sizeof(Holder)); new(p) Holder{module,index};
    sq_settypetag(v,-1,&holder_tag); sq_setreleasehook(v,-1,release_holder);
    sq_newclosure(v,function,1); sq_setnativeclosurename(v,-1,name); sq_newslot(v,-3,SQFalse);
}
void push_module(HSQUIRRELVM v,const std::shared_ptr<Module> &module) {
    sq_newtable(v); closure(v,"array",array_new,module,0);
    for(size_t n=0;n<module->functions.size();++n) if(module->functions[n].exported) closure(v,module->functions[n].name.c_str(),invoke,module,n);
}
SQInteger compile_source(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)<2 || sq_gettop(v)>3) throw std::runtime_error("kernel.compile expects source and optional filename");
        std::string source=string_arg(v,2),filename=sq_gettop(v)==3?string_arg(v,3):"<kernel>";
        push_module(v,compile(source,filename)); return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
SQInteger load_source(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=2) throw std::runtime_error("kernel.load expects filename");
        std::string filename=string_arg(v,2);
        if(filename.find('\0')!=std::string::npos) throw std::runtime_error("kernel: invalid filename");
        std::unique_ptr<FILE,CloseFile> file(g_fopen(filename.c_str(),"rb"));
        if(!file) throw std::runtime_error("kernel: cannot open " + filename);
        std::string source; char block[4096];
        size_t count;
        while((count=fread(block,1,sizeof(block),file.get()))!=0) {
            source.append(block,count);
            if(source.size()>1024*1024) throw std::runtime_error("kernel source exceeds 1 MiB");
        }
        if(ferror(file.get())) throw std::runtime_error("kernel: source read failed");
        push_module(v,compile(source,filename)); return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
}
extern "C" void sqgi_kernel_register(HSQUIRRELVM v) {
    sq_pushroottable(v); sq_pushstring(v,"sqgi",-1);
    if(SQ_FAILED(sq_rawget(v,-2))) { sq_poptop(v); return; }
    sq_pushstring(v,"kernel",-1); sq_newtable(v);
    method(v,"compile",compile_source); method(v,"load",load_source);
    sq_pushstring(v,"available",-1); sq_pushbool(v,sqkernel::supported()?SQTrue:SQFalse); sq_newslot(v,-3,SQFalse);
    sq_pushstring(v,"backend",-1); sq_pushstring(v,sqkernel::backend_name(),-1); sq_newslot(v,-3,SQFalse);
    sq_newslot(v,-3,SQFalse); sq_pop(v,2);
}
