#include "sqgi_kernel.h"
#include "kernel/kernel.h"
#include <cstring>
#include <cstdio>
#include <glib/gstdio.h>
#include <new>
#include <vector>
#ifdef SQGI_ENABLE_LLVM_SQUIRREL
#include "kernel/inline.h"
#include <atomic>
#endif

namespace {
using namespace sqkernel;
char holder_tag, buffer_tag;
#ifdef SQGI_ENABLE_LLVM_SQUIRREL
std::atomic<uint64_t> next_identity{1};
#endif
struct Holder {
    std::shared_ptr<Module> module;
    size_t index;
    std::vector<const Record*> schemas;
    std::string error;
    PreparedCall prepared;
#ifdef SQGI_ENABLE_LLVM_SQUIRREL
    const uint64_t identity=next_identity.fetch_add(1,std::memory_order_relaxed);
#endif
    SQObjectType scalar_types[4],result_type;
    Holder(const std::shared_ptr<Module> &module,size_t index):module(module),index(index),prepared{nullptr,true},scalar_types{},result_type(OT_NULL) {}
};
struct Buffer {
    std::shared_ptr<Module> module;
    Type type;
    const Record *schema; // Immutable record owned by module; null for scalars.
    size_t count, stride;
    std::vector<uint64_t> cells;
    bool instance;
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
uint64_t scalar_value(const HSQOBJECT &value,Type t) {
    uint64_t bits=0;
    if(t==Type::I64) {
        if(value._type!=OT_INTEGER) throw std::runtime_error("kernel: expected i64 integer");
        static_assert(sizeof(SQInteger)==8,"kernel prototype requires 64-bit Squirrel integers");
        memcpy(&bits,&value._unVal.nInteger,8);
    } else if(t==Type::F64) {
        if(value._type!=OT_FLOAT) throw std::runtime_error("kernel: expected f64 float (use 1.0, not 1)");
        static_assert(sizeof(SQFloat)==8,"kernel prototype requires binary64 Squirrel floats");
        memcpy(&bits,&value._unVal.fFloat,8);
    } else {
        if(value._type!=OT_BOOL) throw std::runtime_error("kernel: expected bool");
        bits=value._unVal.nInteger?1:0;
    }
    return bits;
}
uint64_t scalar(HSQUIRRELVM v,SQInteger i,Type t) {
    HSQOBJECT value;
    if(SQ_FAILED(sq_getstackobj(v,i,&value))) throw std::runtime_error("kernel: missing scalar argument");
    return scalar_value(value,t);
}
void push_scalar(HSQUIRRELVM v,Type t,uint64_t bits) {
    if(t==Type::F64) { double d; memcpy(&d,&bits,8); sq_pushfloat(v,d); }
    else if(t==Type::Bool) sq_pushbool(v,bits?SQTrue:SQFalse);
    else { SQInteger n; memcpy(&n,&bits,8); sq_pushinteger(v,n); }
}
const Record *record(const Buffer &b) {
    return b.schema;
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
        } else push_scalar(v,b->type,b->cells[offset]);
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
        } else b->cells[offset]=scalar(v,3,b->type);
        return 0;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
void method(HSQUIRRELVM v,const char *name,SQFUNCTION function) {
    sq_pushstring(v,name,-1); sq_newclosure(v,function,0); sq_newslot(v,-3,SQFalse);
}
void closure(HSQUIRRELVM v,const char *name,SQFUNCTION function,const std::shared_ptr<Module> &module,size_t index);
SQInteger invoke(HSQUIRRELVM v);
SQInteger buffer_len(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=1) throw std::runtime_error("kernel array.len expects no arguments");
        auto b=userdata<Buffer>(v,1,&buffer_tag);
        sq_pushinteger(v,(SQInteger)b->count); return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
size_t instance_field(HSQUIRRELVM v,const Buffer &b) {
    if(!b.instance) throw std::runtime_error("kernel: expected typed instance");
    auto name=string_arg(v,2);
    for(size_t i=0;i<b.schema->fields.size();++i) if(b.schema->fields[i].name==name) return i;
    throw std::runtime_error("kernel: unknown typed field " + name);
}
SQInteger instance_get(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=2) throw std::runtime_error("kernel: invalid field read");
        auto b=userdata<Buffer>(v,1,&buffer_tag); auto i=instance_field(v,*b);
        push_scalar(v,b->schema->fields[i].type,b->cells[i]); return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
SQInteger instance_set(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=3) throw std::runtime_error("kernel: invalid field write");
        auto b=userdata<Buffer>(v,1,&buffer_tag); auto i=instance_field(v,*b);
        b->cells[i]=scalar(v,3,b->schema->fields[i].type); return 0;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
SQInteger instance_new(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=2) throw std::runtime_error("kernel class constructor expects no arguments");
        auto h=userdata<Holder>(v,-1,&holder_tag);
        const auto &r=h->module->records[h->index];
        Buffer value{h->module,Type::Void,&r,1,r.fields.size(),std::vector<uint64_t>(r.fields.size(),0),true};
        void *p=sq_newuserdata(v,sizeof(Buffer)); new(p) Buffer(std::move(value));
        sq_settypetag(v,-1,&buffer_tag); sq_setreleasehook(v,-1,release_buffer);
        sq_newtable(v); method(v,"_get",instance_get); method(v,"_set",instance_set);
        for(size_t i=0;i<h->module->functions.size();++i) {
            const auto &f=h->module->functions[i];
            if(f.owner==r.name) closure(v,f.name.substr(r.name.size()+1).c_str(),invoke,h->module,i);
        }
        sq_setdelegate(v,-2); return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
SQInteger array_new(HSQUIRRELVM v) {
    try {
        if(sq_gettop(v)!=4) throw std::runtime_error("kernel module.array expects type, count");
        auto h=userdata<Holder>(v,-1,&holder_tag);
        std::string type=string_arg(v,2); SQInteger count=integer_arg(v,3); size_t stride=1;
        Type element_type=type=="f64"?Type::F64:Type::I64;
        const Record *schema=nullptr;
        if(type!="f64" && type!="i64") {
            const Record *r=nullptr; for(auto &candidate:h->module->records) if(candidate.name==type) r=&candidate;
            if(!r) throw std::runtime_error("kernel: unknown array element type " + type);
            if(r->is_class) throw std::runtime_error("kernel: class arrays are not supported yet");
            schema=r; element_type=Type::Void; stride=r->fields.size();
        }
        if(count<0 || count>1048576 || (uint64_t)count*stride>8*1024*1024) throw std::runtime_error("kernel: array allocation limit exceeded");
        // Construct into a temporary first: allocation failure cannot leave a half-built userdata.
        Buffer value{h->module,element_type,schema,(size_t)count,stride,std::vector<uint64_t>((size_t)count*stride,0),false};
        void *p=sq_newuserdata(v,sizeof(Buffer)); new(p) Buffer(std::move(value));
        sq_settypetag(v,-1,&buffer_tag); sq_setreleasehook(v,-1,release_buffer);
        sq_newtable(v); method(v,"get",buffer_get); method(v,"set",buffer_set); method(v,"len",buffer_len); sq_setdelegate(v,-2);
        return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
void run(Holder &h,const void *objects,SQInteger count,SQUnsignedInteger stride,HSQOBJECT &result) {
    const Function &f=h.module->functions[h.index];
    if(count!=(SQInteger)f.parameters.size()+(f.owner.empty()?1:0)) throw std::runtime_error("kernel: wrong argument count for " + f.name);
    uint64_t arguments[MaxParameters*2];
    struct Borrowed { Buffer *buffer; bool writable; };
    Borrowed borrowed[MaxParameters]; size_t borrowed_count=0;
    for(size_t n=0;n<f.parameters.size();++n) {
        const Parameter &p=f.parameters[n];
        // The VM supplies the actual object stride; no SQObjectPtr layout is
        // assumed here beyond its public SQObject base at each element.
        const HSQOBJECT &value=*reinterpret_cast<const HSQOBJECT*>(
            static_cast<const char*>(objects)+(n+(f.owner.empty()?1:0))*stride);
        if(!p.borrowed()) { arguments[n]=scalar_value(value,p.type); continue; }
        void *data=nullptr,*tag=nullptr;
        if(SQ_FAILED(sq_getobjuserdata(&value,&data,&tag)) || tag!=&buffer_tag)
            throw std::runtime_error("kernel: invalid typed handle");
        auto b=static_cast<Buffer*>(data);
        if(b->module!=h.module || b->type!=p.type || b->schema!=h.schemas[n] || b->instance!=p.instance || (!p.dynamic && b->count!=p.extent))
            throw std::runtime_error("kernel: array schema/extent mismatch for " + p.name);
        for(size_t j=0;j<borrowed_count;++j)
            if(borrowed[j].buffer==b && (borrowed[j].writable || p.writable))
                throw std::runtime_error("kernel: overlapping mutable arguments");
        borrowed[borrowed_count++]={b,p.writable};
        arguments[n]=(uint64_t)(uintptr_t)b->cells.data();
        if(p.dynamic) arguments[p.length_slot]=b->count;
    }
    // Both adapters retain the closure/module and all buffers for this call.
    // Generated code cannot call the VM, allocate, resize or release owners.
    Call call{arguments,0,1000000,0};
    Status status=execute(h.prepared,call);
    if(status!=Success) throw std::runtime_error(h.module->filename+":"+std::to_string(call.error_line)+": "+f.name+": "+status_name(status));
    result._unVal.raw=0;
    if(f.result==Type::Void) result._type=OT_NULL;
    else if(f.result==Type::F64) {result._type=OT_FLOAT;memcpy(&result._unVal.fFloat,&call.result,8);}
    else {result._type=f.result==Type::Bool?OT_BOOL:OT_INTEGER;memcpy(&result._unVal.nInteger,&call.result,8);}
}
SQRESULT invoke_leaf(SQUserPointer context,const void *objects,SQInteger count,
                     SQUnsignedInteger stride,HSQOBJECT *result,const SQChar **error) {
    auto &h=*static_cast<Holder*>(context);
    try { run(h,objects,count,stride,*result);return SQ_OK; }
    catch(const std::exception &e) {
        // No retry: failures may follow writes. Own diagnostic text until the
        // VM copies it, without calling any VM API from this leaf callback.
        try {h.error=e.what();*error=h.error.c_str();}
        catch(...) {*error="kernel: failed to allocate error diagnostic";}
        return SQ_ERROR;
    }
}
// Small scalar exports and instance methods avoid the general argument walker. Guard
// every argument before entry; failures use the existing diagnostic path.
template<size_t N,bool Instance=false> SQRESULT invoke_scalars(SQUserPointer context,const void *objects,SQInteger count,
                     SQUnsignedInteger stride,HSQOBJECT *result,const SQChar **error) {
    auto &h=*static_cast<Holder*>(context);
    if(count!=SQInteger(N+1))return invoke_leaf(context,objects,count,stride,result,error);
    uint64_t arguments[(N+Instance)?(N+Instance):1];
    if(Instance) {
        const auto &receiver=*static_cast<const HSQOBJECT*>(objects);
        void *data=nullptr,*tag=nullptr;
        if(SQ_FAILED(sq_getobjuserdata(&receiver,&data,&tag)) || tag!=&buffer_tag)
            return invoke_leaf(context,objects,count,stride,result,error);
        auto b=static_cast<Buffer*>(data);
        if(b->module!=h.module || b->type!=Type::Void || b->schema!=h.schemas[0] || !b->instance || b->count!=1)
            return invoke_leaf(context,objects,count,stride,result,error);
        arguments[0]=(uint64_t)(uintptr_t)b->cells.data();
    }
    for(size_t n=0;n<N;++n) {
        const auto &value=*reinterpret_cast<const HSQOBJECT*>(static_cast<const char*>(objects)+(n+1)*stride);
        if(value._type!=h.scalar_types[n])return invoke_leaf(context,objects,count,stride,result,error);
        if(value._type==OT_BOOL)arguments[n+Instance]=value._unVal.nInteger?1:0;
        else memcpy(&arguments[n+Instance],&value._unVal,8);
    }
    Call call{arguments,0,1000000,0};
    Status status=execute(h.prepared,call);
    if(status!=Success) {
        // Execution may have effects. Format the error without re-entering.
        try {
            const auto &f=h.module->functions[h.index];
            h.error=h.module->filename+":"+std::to_string(call.error_line)+": "+f.name+": "+status_name(status);
            *error=h.error.c_str();
        } catch(...) {*error="kernel: failed to allocate error diagnostic";}
        return SQ_ERROR;
    }
    result->_type=h.result_type;
    result->_unVal.raw=call.result;
    return SQ_OK;
}
SQObjectType object_type(Type type) {
    return type==Type::I64?OT_INTEGER:type==Type::F64?OT_FLOAT:type==Type::Bool?OT_BOOL:OT_NULL;
}
SQInteger invoke(HSQUIRRELVM v) {
    try {
        auto h=userdata<Holder>(v,-1,&holder_tag);
        SQInteger count=sq_gettop(v)-1;
        const auto &f=h->module->functions[h->index];
        if(count!=(SQInteger)f.parameters.size()+(f.owner.empty()?1:0))
            throw std::runtime_error("kernel: wrong argument count for " + h->module->functions[h->index].name);
        HSQOBJECT objects[MaxParameters+1],result;
        for(SQInteger i=0;i<count;++i)sq_getstackobj(v,i+1,&objects[i]);
        run(*h,objects,count,sizeof(HSQOBJECT),result);
        if(result._type==OT_NULL)return 0;
        sq_pushobject(v,result);return 1;
    } catch(const std::exception &e) { return sq_throwerror(v,e.what()); }
}
void closure(HSQUIRRELVM v,const char *name,SQFUNCTION function,const std::shared_ptr<Module> &module,size_t index) {
    sq_pushstring(v,name,-1);
    // Resolve record identity once, after compilation has finished growing the
    // module's record vector. Each holder and buffer retains that module.
    Holder value(module,index);
    if(function==invoke) for(const auto &parameter:module->functions[index].parameters) {
        const Record *schema=nullptr;
        if(!parameter.record.empty())for(const auto &record:module->records)
            if(record.name==parameter.record) { schema=&record; break; }
        value.schemas.push_back(schema);
    }
    SQLEAFFUNCTION leaf=invoke_leaf;
    if(function==invoke) {
        value.prepared=prepare(*module,index);
        const auto &f=module->functions[index];
        const bool instance=!f.owner.empty();
        const size_t offset=instance?1:0;
        bool scalars=f.parameters.size()>=offset && f.parameters.size()-offset<=4;
        if(instance && (f.parameters.empty() || !f.parameters[0].instance))scalars=false;
        for(size_t n=offset;n<f.parameters.size();++n)if(f.parameters[n].borrowed())scalars=false;
        if(scalars) {
            for(size_t n=offset;n<f.parameters.size();++n)value.scalar_types[n-offset]=object_type(f.parameters[n].type);
            value.result_type=object_type(f.result);
            const SQLEAFFUNCTION exports[]={invoke_scalars<0>,invoke_scalars<1>,invoke_scalars<2>,invoke_scalars<3>,invoke_scalars<4>,
        invoke_scalars<0,true>,invoke_scalars<1,true>,invoke_scalars<2,true>,invoke_scalars<3,true>,invoke_scalars<4,true>};
            const SQLEAFFUNCTION methods[]={invoke_scalars<0,true>,invoke_scalars<1,true>,invoke_scalars<2,true>,invoke_scalars<3,true>,invoke_scalars<4,true>};
            leaf=(instance?methods:exports)[f.parameters.size()-offset];
        }
    }
    void *p=sq_newuserdata(v,sizeof(Holder)); new(p) Holder(std::move(value));
    sq_settypetag(v,-1,&holder_tag); sq_setreleasehook(v,-1,release_holder);
    sq_newclosure(v,function,1);
    if(function==invoke)sq_setnativeleaf(v,-1,leaf,p);
    sq_setnativeclosurename(v,-1,name); sq_newslot(v,-3,SQFalse);
}
void push_module(HSQUIRRELVM v,const std::shared_ptr<Module> &module) {
    sq_newtable(v); closure(v,"array",array_new,module,0);
    for(size_t n=0;n<module->records.size();++n) if(module->records[n].is_class)
        closure(v,module->records[n].name.c_str(),instance_new,module,n);
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
#ifdef SQGI_ENABLE_LLVM_SQUIRREL
bool sqgi_kernel_describe_leaf(SQLEAFFUNCTION leaf,void *context,SQKernelInline &out) {
    const SQLEAFFUNCTION entries[]={invoke_scalars<0>,invoke_scalars<1>,invoke_scalars<2>,invoke_scalars<3>,invoke_scalars<4>,
        invoke_scalars<0,true>,invoke_scalars<1,true>,invoke_scalars<2,true>,invoke_scalars<3,true>,invoke_scalars<4,true>};
    bool known=false;for(auto entry:entries)if(leaf==entry)known=true;
    if(!known || !context)return false;
    auto &h=*static_cast<Holder*>(context);
    out.module=h.module;out.function=h.index;out.identity=h.identity;
    out.leaf=leaf;out.context=context;out.prepared=h.prepared;return true;
}
bool sqgi_kernel_inline_receiver(const SQKernelInline &k,const HSQOBJECT &value,uint64_t *&cells) {
    const auto &f=k.module->functions[k.function];
    if(f.owner.empty() || f.parameters.empty() || !f.parameters[0].instance)return false;
    void *data=nullptr,*tag=nullptr;
    if(SQ_FAILED(sq_getobjuserdata(&value,&data,&tag)) || tag!=&buffer_tag)return false;
    const auto &b=*static_cast<Buffer*>(data);
    const Record *schema=nullptr;
    for(const auto &r:k.module->records)if(r.name==f.owner)schema=&r;
    if(b.module!=k.module || b.type!=Type::Void || b.schema!=schema || !b.instance || b.count!=1)return false;
    cells=static_cast<Buffer*>(data)->cells.data();return true;
}
extern "C" void sqgi_llvm_register(HSQUIRRELVM v);
#endif
extern "C" void sqgi_kernel_register(HSQUIRRELVM v) {
#ifdef SQGI_ENABLE_LLVM_SQUIRREL
    sqgi_llvm_register(v);
#endif
    sq_pushroottable(v); sq_pushstring(v,"sqgi",-1);
    if(SQ_FAILED(sq_rawget(v,-2))) { sq_poptop(v); return; }
    sq_pushstring(v,"kernel",-1); sq_newtable(v);
    method(v,"compile",compile_source); method(v,"load",load_source);
    sq_pushstring(v,"available",-1); sq_pushbool(v,sqkernel::supported()?SQTrue:SQFalse); sq_newslot(v,-3,SQFalse);
    sq_pushstring(v,"backend",-1); sq_pushstring(v,sqkernel::backend_name(),-1); sq_newslot(v,-3,SQFalse);
    sq_newslot(v,-3,SQFalse); sq_pop(v,2);
}
