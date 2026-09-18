#include "kernel.h"
#include "math.h"
#include <algorithm>
#include <cerrno>
#include <cctype>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include <limits>
#include <map>
#include <deque>
#include <chrono>
#include <sstream>

namespace sqkernel {
namespace {
struct Token { std::string text; int line; };
struct Value { int slot; Type type; };
struct Variable { Value value; int parameter; };
class Parser {
    std::vector<Token> tokens;
    size_t pos = 0;
    Module &module;
    Function *fn = nullptr;
    std::vector<std::map<std::string, Variable>> scopes;
    // Parameter and local storage descriptors; only actual parameters enter the ABI.
    std::vector<Parameter> storage;
    int depth = 0;
    struct Depth {
        Parser &p;
        explicit Depth(Parser &p):p(p) { if(++p.depth > 64) p.fail("nesting limit exceeded"); }
        ~Depth() { --p.depth; }
    };
    const Token &peek() const { return tokens[pos]; }
    bool at(const char *s) const { return peek().text == s; }
    bool take(const char *s) { if(!at(s)) return false; ++pos; return true; }
    void need(const char *s) { if(!take(s)) fail(std::string("expected '") + s + "'"); }
    [[noreturn]] void fail(const std::string &s) const {
        throw std::runtime_error(module.filename + ":" + std::to_string(peek().line) + ": " + s);
    }
    std::string name() {
        const std::string s = peek().text;
        if(s.empty() || !(isalpha((unsigned char)s[0]) || s[0]=='_')) fail("expected identifier");
        static const char *reserved[] = {"export","struct","class","in","inout","if","else","for","while","return","require","true","false","i64","f64","bool","void"};
        for(auto r:reserved) if(s==r) fail("reserved identifier: " + s);
        ++pos; return s;
    }
    Type type() {
        if(take("i64")) return Type::I64;
        if(take("f64")) return Type::F64;
        if(take("bool")) return Type::Bool;
        if(take("void")) return Type::Void;
        fail("expected supported scalar type (i64, f64, bool, void)");
    }
    int slot(Type type=Type::Void) { if(fn->slots >= 16384) fail("temporary value limit exceeded (16384)"); fn->slot_types.push_back(type); return fn->slots++; }
    int emit(Op op, Type t=Type::Void, int dst=-1, int a=-1, int b=-1, uint64_t imm=0, int line=0) {
        if(fn->code.size() >= 8192) fail("instruction limit exceeded");
        if(dst>=0 && op!=Op::Store) {
            Type result=(op==Op::Eq || op==Op::Ne || op==Op::Lt || op==Op::Le || op==Op::Gt || op==Op::Ge)?Type::Bool:
                op==Op::LocalAddress?Type::Pointer:t;
            if(fn->slot_types.at(dst)!=Type::Void && fn->slot_types[dst]!=result) fail("inconsistent temporary type");
            fn->slot_types[dst]=result;
        }
        fn->code.push_back({op,t,dst,a,b,imm,line ? line : peek().line,(int)module.functions.size()});
        return (int)fn->code.size()-1;
    }
    Value constant(Type t,uint64_t bits) { int s=slot(); emit(Op::Constant,t,s,-1,-1,bits); return {s,t}; }
    void same(Type a,Type b) { if(a!=b || a==Type::Void) fail("type mismatch; no implicit conversions"); }
    Variable find(const std::string &n) {
        for(auto i=scopes.rbegin();i!=scopes.rend();++i) { auto v=i->find(n); if(v!=i->end()) return v->second; }
        fail("unknown variable: " + n);
    }
    void bind(const std::string &n,Variable v) {
        if(scopes.back().count(n)) fail("duplicate variable: " + n);
        scopes.back()[n]=v;
    }
    const Record *record(const std::string &n) const {
        for(auto &r:module.records) if(r.name==n) return &r;
        return nullptr;
    }
    struct Address { int pointer,index; Type type; bool writable; };
    Address address(Variable v) {
        const Parameter &p=storage[v.parameter];
        Value index;
        if(p.instance) index=constant(Type::I64,0);
        else {
            need("["); index=expression(); need("]"); same(index.type,Type::I64);
            emit(Op::Bounds,Type::I64,-1,index.slot,p.length_slot,p.extent);
        }
        size_t field=0;
        Type t=p.type;
        if(!p.record.empty()) {
            need("."); std::string n=name(); const Record *r=record(p.record);
            for(;field<r->fields.size();++field) if(r->fields[field].name==n) break;
            if(field==r->fields.size()) fail("unknown struct field: " + n);
            t=r->fields[field].type;
        }
        // Checked extent and bounded allocation guarantee this cell offset fits.
        if(p.stride!=1) { auto k=constant(Type::I64,p.stride); int s=slot(); emit(Op::Mul,Type::I64,s,index.slot,k.slot); index={s,Type::I64}; }
        if(field) { auto k=constant(Type::I64,field); int s=slot(); emit(Op::Add,Type::I64,s,index.slot,k.slot); index={s,Type::I64}; }
        return {v.value.slot,index.slot,t,p.writable};
    }
    Value helper_call(const std::string &n, const Variable *receiver=nullptr) {
        const Function *callee=nullptr;
        for(auto &f:module.functions) if(f.name==n) callee=&f;
        if(!callee) fail("helper must be defined earlier; recursion and forward calls are unsupported: " + n);
        std::vector<Value> args;
        std::vector<int> references;
        if(receiver) { args.push_back(receiver->value); references.push_back(receiver->parameter); }
        if(!at(")")) do {
            size_t i=args.size();
            if(i>=callee->parameters.size()) fail("wrong helper argument count");
            if(callee->parameters[i].borrowed()) {
                auto v=find(name());
                if(v.parameter<0 || !storage[v.parameter].borrowed()) fail("expected borrowed argument");
                args.push_back(v.value); references.push_back(v.parameter);
            } else { args.push_back(expression()); references.push_back(-1); }
        } while(take(","));
        need(")");
        if(args.size()!=callee->parameters.size()) fail("wrong helper argument count");
        CallSite call; call.function=(size_t)(callee-module.functions.data());
        std::vector<int> lengths;
        for(size_t i=0;i<args.size();++i) {
            const auto &target=callee->parameters[i];
            if(target.borrowed()) {
                if(references[i]<0) fail("expected borrowed argument");
                const auto &source=storage[references[i]];
                if(source.type!=target.type || source.record!=target.record || source.instance!=target.instance ||
                   (!target.dynamic && (source.dynamic || source.extent!=target.extent)))
                    fail("borrowed argument schema/extent mismatch");
                if(target.writable && !source.writable) fail("cannot pass in parameter to mutable helper or method");
                for(size_t j=0;j<i;++j) if(references[j]==references[i] && (target.writable || callee->parameters[j].writable))
                    fail("overlapping mutable helper arguments");
                if(target.dynamic) {
                    lengths.push_back(source.dynamic?source.length_slot:constant(Type::I64,source.extent).slot);
                }
            } else same(args[i].type,target.type);
            call.arguments.push_back(args[i].slot);
        }
        int result=callee->result==Type::Void?-1:slot();
        call.arguments.insert(call.arguments.end(),lengths.begin(),lengths.end());
        size_t site=fn->calls.size(); fn->calls.push_back(std::move(call));
        emit(Op::Call,callee->result,result,-1,-1,site);
        return {result,callee->result};
    }
    bool method_call(Variable v) const {
        return v.parameter>=0 && storage[v.parameter].instance &&
               pos+2<tokens.size() && tokens[pos].text=="." && tokens[pos+2].text=="(";
    }
    Value call_method(Variable v) {
        need("."); std::string method=name(); need("(");
        return helper_call(storage[v.parameter].record+"."+method,&v);
    }
    Value function_call(const std::string &n) {
        if(fn && fn->owner.empty() && fn->name==n) fail("recursion is unsupported: "+n);
        // Previously declared user helpers shadow standard math names.
        for(const auto &f:module.functions) if(f.name==n) return helper_call(n);
        int index=math_builtin_index(n);
        if(index<0) return helper_call(n);
        const auto &spec=math_builtin(index);
        std::vector<Value> args;
        if(!at(")")) do {
            if(args.size()>=(size_t)spec.arity()) fail("wrong math argument count: "+n);
            auto arg=expression();
            if(arg.type!=Type::F64) fail("math arguments must be f64: "+n);
            args.push_back(arg);
        } while(take(","));
        need(")");
        if(args.size()!=(size_t)spec.arity()) fail("wrong math argument count: "+n);
        Type result=spec.predicate?Type::Bool:Type::F64;
        int dst=slot(); emit(Op::Math,result,dst,args[0].slot,
            args.size()==2?args[1].slot:-1,(uint64_t)index);
        return {dst,result};
    }
    Value primary() {
        Depth guard(*this);
        if(take("(")) { auto v=expression(); need(")"); return v; }
        if(take("-")) {
            auto v=primary(); if(v.type!=Type::I64 && v.type!=Type::F64) fail("negation requires number");
            int s=slot(); emit(Op::Neg,v.type,s,v.slot); return {s,v.type};
        }
        if(take("!")) { auto v=primary(); same(v.type,Type::Bool); auto z=constant(Type::Bool,0); int s=slot(); emit(Op::Eq,Type::Bool,s,v.slot,z.slot); return {s,Type::Bool}; }
        if(take("true")) return constant(Type::Bool,1);
        if(take("false")) return constant(Type::Bool,0);
        if(!peek().text.empty() && isdigit((unsigned char)peek().text[0])) {
            std::string s=peek().text; ++pos;
            if(s.find_first_of(".eE")!=std::string::npos) {
                std::istringstream stream(s); stream.imbue(std::locale::classic()); double d; stream>>d;
                if(!stream || !stream.eof() || !std::isfinite(d)) fail("invalid f64 literal");
                uint64_t bits; memcpy(&bits,&d,8); return constant(Type::F64,bits);
            }
            errno=0; char *end=nullptr; unsigned long long v=strtoull(s.c_str(),&end,10);
            if(errno || *end || v>uint64_t(INT64_MAX)) fail("i64 literal out of range");
            return constant(Type::I64,v);
        }
        std::string n=name();
        if(take("(")) return function_call(n);
        Variable v=find(n);
        if(method_call(v)) return call_method(v);
        if(v.parameter>=0 && storage[v.parameter].borrowed()) {
            const auto &p=storage[v.parameter];
            if(!p.instance && take(".")) {
                need("len"); need("("); need(")");
                if(!p.dynamic) return constant(Type::I64,p.extent);
                int s=slot(); emit(Op::Copy,Type::I64,s,p.length_slot); return {s,Type::I64};
            }
            Address a=address(v); int s=slot(); emit(Op::Load,a.type,s,a.pointer,a.index); return {s,a.type};
        }
        // Snapshot a value: later assignments must not alter earlier operands.
        int s=slot(); emit(Op::Copy,v.value.type,s,v.value.slot); return {s,v.value.type};
    }
    int precedence(const std::string &s) const {
        if(s=="||") return 1;
        if(s=="&&") return 2;
        if(s=="==" || s=="!=") return 3;
        if(s=="<" || s=="<=" || s==">" || s==">=") return 4;
        if(s=="+" || s=="-") return 5;
        if(s=="*" || s=="/" || s=="%") return 6;
        return 0;
    }
    Value expression(int min=1) {
        Depth guard(*this);
        Value left=primary();
        while(precedence(peek().text)>=min) {
            std::string op=peek().text; int prec=precedence(op); ++pos;
            if(op=="&&" || op=="||") {
                same(left.type,Type::Bool);
                int dst=slot(); emit(Op::Copy,Type::Bool,dst,left.slot);
                int branch;
                if(op=="&&") branch=emit(Op::JumpFalse,Type::Bool,-1,left.slot);
                else { auto z=constant(Type::Bool,0); int inv=slot(); emit(Op::Eq,Type::Bool,inv,left.slot,z.slot); branch=emit(Op::JumpFalse,Type::Bool,-1,inv); }
                auto right=expression(prec+1); same(right.type,Type::Bool);
                emit(Op::Copy,Type::Bool,dst,right.slot); fn->code[branch].immediate=fn->code.size();
                left={dst,Type::Bool}; continue;
            }
            auto right=expression(prec+1); same(left.type,right.type);
            Op code=Op::Add;
            if(op=="-") code=Op::Sub; else if(op=="*") code=Op::Mul; else if(op=="/") code=Op::Div; else if(op=="%") code=Op::Rem;
            else if(op=="==") code=Op::Eq; else if(op=="!=") code=Op::Ne;
            else if(op=="<") code=Op::Lt; else if(op=="<=") code=Op::Le; else if(op==">") code=Op::Gt; else if(op==">=") code=Op::Ge;
            if(op=="%" && left.type!=Type::I64) fail("remainder requires i64 operands");
            bool compare=prec<=4;
            if(left.type==Type::Bool && op!="==" && op!="!=") fail("invalid Boolean operator");
            int s=slot(); emit(code,left.type,s,left.slot,right.slot);
            left={s,compare?Type::Bool:left.type};
        }
        return left;
    }
    void local_storage(Parameter p) {
        p.writable=true;
        if(take("[")) {
            std::string extent=peek().text;
            if(extent.empty() || !isdigit((unsigned char)extent[0])) fail("local array extent must be a positive literal");
            ++pos; char *end=nullptr; errno=0;
            auto count=strtoull(extent.c_str(),&end,10);
            if(*end || errno || !count || count>8192) fail("local array extent exceeds storage limit (8192 cells)");
            p.extent=(size_t)count; need("]");
            if(!p.record.empty() && record(p.record)->is_class) fail("local class arrays are unsupported");
            if(p.type==Type::Bool) fail("bool arrays are unsupported");
        } else {
            if(p.record.empty() || !record(p.record)->is_class) fail("struct locals require a fixed array extent");
            p.instance=true; p.extent=1;
        }
        size_t cells=p.extent*p.stride;
        size_t total=cells;
        for(const auto &region:fn->local_storage) total+=region.cells;
        if(total>8192) fail("local storage limit exceeded (65536 bytes)");
        size_t region=fn->local_storage.size();
        fn->local_storage.push_back({-1,cells});
        // Reset at the declaration, including each iteration of a loop.
        emit(Op::LocalZero,Type::Void,-1,-1,-1,region);
        int pointer=slot(); emit(Op::LocalAddress,Type::I64,pointer,-1,-1,region);
        int descriptor=(int)storage.size(); storage.push_back(p);
        bind(p.name,{{pointer,p.type},descriptor});
    }
    void simple() {
        const Record *r=record(peek().text);
        // A struct and scalar helper may have the same name in existing code.
        if(r && pos+1<tokens.size() && !tokens[pos+1].text.empty() &&
           (isalpha((unsigned char)tokens[pos+1].text[0]) || tokens[pos+1].text[0]=='_')) {
            Parameter p; p.record=r->name; p.stride=r->fields.size(); ++pos;
            p.name=name(); local_storage(p); return;
        }
        if(at("i64") || at("f64") || at("bool")) {
            Type t=type(); std::string n=name();
            if(at("[")) { Parameter p; p.name=n; p.type=t; local_storage(p); return; }
            need("="); Value v=expression(); same(t,v.type);
            int s=slot(); emit(Op::Copy,t,s,v.slot); bind(n,{{s,t},-1}); return;
        }
        std::string n=name();
        if(take("(")) { function_call(n); return; }
        Variable v=find(n);
        if(method_call(v)) { call_method(v); return; }
        bool memory=v.parameter>=0 && storage[v.parameter].borrowed();
        Address a={-1,-1,Type::Void,false};
        Type t=v.value.type;
        if(memory) { a=address(v); t=a.type; if(!a.writable) fail("cannot write an in parameter"); }
        std::string op=peek().text;
        if(op!="=" && op!="+=" && op!="-=" && op!="*=" && op!="%=") fail("expected assignment");
        ++pos;
        Value old={-1,t};
        if(op!="=") { old.slot=slot(); if(memory) emit(Op::Load,t,old.slot,a.pointer,a.index); else emit(Op::Copy,t,old.slot,v.value.slot); }
        Value rhs=expression(); same(t,rhs.type);
        if(op=="%=" && t!=Type::I64) fail("remainder requires i64 operands");
        if(op!="=") { if(t==Type::Bool) fail("invalid Boolean assignment"); int s=slot(); emit(op=="+="?Op::Add:op=="-="?Op::Sub:op=="%="?Op::Rem:Op::Mul,t,s,old.slot,rhs.slot); rhs={s,t}; }
        if(memory) emit(Op::Store,t,rhs.slot,a.pointer,a.index);
        else emit(Op::Copy,t,v.value.slot,rhs.slot);
    }
    // Returns true only when every path returns.
    bool statement() {
        Depth guard(*this);
        if(take("{")) {
            scopes.emplace_back(); bool returns=false;
            while(!take("}")) { if(at("<eof>")) fail("unterminated block"); if(returns) fail("unreachable statement"); returns=statement(); }
            scopes.pop_back(); return returns;
        }
        if(take("return")) {
            if(fn->result==Type::Void) { need(";"); emit(Op::Return); }
            else { auto v=expression(); same(fn->result,v.type); need(";"); emit(Op::Return,v.type,-1,v.slot); }
            return true;
        }
        if(take("require")) { need("("); auto v=expression(); same(v.type,Type::Bool); need(")"); need(";"); emit(Op::Require,Type::Bool,-1,v.slot); return false; }
        if(take("if")) {
            need("("); auto v=expression(); same(v.type,Type::Bool); need(")");
            int branch=emit(Op::JumpFalse,Type::Bool,-1,v.slot);
            if(!at("{")) fail("control-flow bodies require braces");
            bool yes=statement();
            int end=emit(Op::Jump); fn->code[branch].immediate=fn->code.size(); bool no=false;
            if(take("else")) { if(!at("{")) fail("else requires braces"); no=statement(); }
            fn->code[end].immediate=fn->code.size(); return yes && no;
        }
        bool isfor=take("for");
        if(isfor || take("while")) {
            scopes.emplace_back(); need("(");
            if(isfor) { simple(); need(";"); }
            int start=(int)fn->code.size(); emit(Op::Tick);
            auto v=expression(); same(v.type,Type::Bool);
            int branch=emit(Op::JumpFalse,Type::Bool,-1,v.slot);
            std::vector<Instruction> step;
            if(isfor) {
                need(";"); size_t first=fn->code.size(); simple();
                step.assign(fn->code.begin()+first,fn->code.end()); fn->code.resize(first);
                // Step expressions with branches would require relocation.
                for(auto &i:step) if(i.op==Op::Jump || i.op==Op::JumpFalse) fail("prototype for-step must be straight-line");
            }
            need(")"); if(!at("{")) fail("loop requires braces"); statement();
            for(auto &i:step) emit(i.op,i.type,i.dst,i.a,i.b,i.immediate,i.line);
            emit(Op::Jump,Type::Void,-1,-1,-1,start);
            fn->code[branch].immediate=fn->code.size(); scopes.pop_back(); return false;
        }
        simple(); need(";"); return false;
    }
    void function(Type result,const std::string &function_name,bool exported,const std::string &owner="") {
        Function f; f.exported=exported; f.result=result; f.owner=owner;
        f.name=owner.empty()?function_name:owner+"."+function_name;
        for(auto &other:module.functions) if(other.name==f.name) fail("duplicate function");
        if(owner.empty() && (f.name=="array" || (record(f.name) && record(f.name)->is_class))) fail("function name reserved for host array constructor");
        fn=&f; scopes.clear(); scopes.emplace_back(); need("(");
        if(!owner.empty()) {
            Parameter self; self.name="this"; self.record=owner; self.instance=true;
            self.writable=true; self.extent=1; self.stride=record(owner)->fields.size();
            int s=slot(Type::Pointer); bind("this",{{s,Type::Void},0}); f.parameters.push_back(self);
        }
        if(!at(")")) do {
            Parameter p; bool borrow=false;
            if(take("in")) borrow=true; else if(take("inout")) { borrow=true; p.writable=true; }
            if(record(peek().text)) { p.record=peek().text; ++pos; p.stride=record(p.record)->fields.size(); }
            else { p.type=type(); if(p.type==Type::Void) fail("void parameter"); }
            p.name=name();
            if(take("[")) {
                if(take("]")) p.dynamic=true;
                else {
                    if(at("<eof>")) fail("missing array extent");
                    std::string n=peek().text; ++pos; char *end=nullptr; errno=0; unsigned long long extent=strtoull(n.c_str(),&end,10);
                    if(n.empty() || !isdigit((unsigned char)n[0]) || *end || errno || extent==0 || extent>1048576) fail("array extent must be a literal in 1..1048576");
                    p.extent=(size_t)extent; need("]");
                }
            }
            if(!p.record.empty() && record(p.record)->is_class) {
                if(p.dynamic || p.extent) fail("arrays of class references are not supported yet");
                p.instance=true; p.extent=1;
            }
            if(borrow != p.borrowed()) fail("array parameters require in/inout, as do class references; scalar parameters are by value");
            if(!p.record.empty() && !p.borrowed()) fail("structs require array parameters");
            if(p.borrowed() && p.type==Type::Bool) fail("prototype bool arrays are unsupported");
            int s=slot(p.borrowed()?Type::Pointer:p.type); bind(p.name,{{s,p.type},(int)f.parameters.size()}); f.parameters.push_back(p);
            if(f.parameters.size()>MaxParameters) fail("parameter limit exceeded");
        } while(take(","));
        need(")");
        for(auto &p:f.parameters) if(p.dynamic) p.length_slot=slot(Type::I64);
        storage=f.parameters;
        if(!at("{")) fail("expected function body"); bool returns=statement();
        if(!returns) { if(f.result!=Type::Void) fail("function must return on every path"); emit(Op::Return); }
        module.functions.push_back(std::move(f)); fn=nullptr;
        if(module.functions.size()>64) fail("function limit exceeded");
    }
public:
    Parser(Module &m,const std::string &source):module(m) {
        if(source.size()>1024*1024) throw std::runtime_error("kernel source exceeds 1 MiB");
        int line=1;
        for(size_t p=0;p<source.size();) {
            unsigned char c=source[p];
            if(isspace(c)) { if(c=='\n') ++line; ++p; continue; }
            if(source.compare(p,2,"//")==0) { while(p<source.size() && source[p]!='\n') ++p; continue; }
            if(source.compare(p,2,"/*")==0) {
                p+=2; while(p+1<source.size() && source.compare(p,2,"*/")!=0) { if(source[p]=='\n') ++line; ++p; }
                if(p+1>=source.size()) throw std::runtime_error(m.filename+":"+std::to_string(line)+": unterminated comment");
                p+=2; continue;
            }
            size_t begin=p++;
            if(isalpha(c) || c=='_') { while(p<source.size() && (isalnum((unsigned char)source[p]) || source[p]=='_')) ++p; }
            else if(isdigit(c)) {
                while(p<source.size() && isdigit((unsigned char)source[p])) ++p;
                if(p<source.size() && source[p]=='.') { ++p; while(p<source.size() && isdigit((unsigned char)source[p])) ++p; }
                if(p<source.size() && (source[p]=='e' || source[p]=='E')) { ++p; if(p<source.size() && (source[p]=='+' || source[p]=='-')) ++p; while(p<source.size() && isdigit((unsigned char)source[p])) ++p; }
            } else if(p<source.size()) {
                std::string two=source.substr(begin,2);
                if(two=="==" || two=="!=" || two=="<=" || two==">=" || two=="+=" || two=="-=" || two=="*=" || two=="%=" || two=="&&" || two=="||") ++p;
            }
            tokens.push_back({source.substr(begin,p-begin),line});
            if(tokens.size()>65536) throw std::runtime_error("kernel token limit exceeded");
        }
        tokens.push_back({"<eof>",line});
    }
    void run() {
        while(!at("<eof>")) {
            bool is_class=take("class");
            if(is_class || take("struct")) {
                Record r; r.name=name(); r.is_class=is_class;
                if(record(r.name) || (is_class && r.name=="array")) fail("duplicate or reserved record name");
                if(is_class) for(const auto &f:module.functions) if(f.name==r.name) fail("record/function name collision");
                need("{");
                module.records.push_back(r);
                size_t index=module.records.size()-1;
                bool methods=false;
                std::vector<std::string> members;
                while(!take("}")) {
                    Type t=type(); std::string n=name();
                    if(is_class && (n=="this" || n=="constructor" || n[0]=='_')) fail("reserved member name");
                    if(std::find(members.begin(),members.end(),n)!=members.end()) fail("duplicate field or method");
                    members.push_back(n);
                    if(at("(")) {
                        if(!is_class) fail("structs cannot have methods");
                        if(module.records[index].fields.empty()) fail("class requires fields before methods");
                        methods=true; function(t,n,false,r.name);
                    } else {
                        if(methods) fail("fields must precede methods");
                        if(t==Type::Void || (!is_class && t==Type::Bool)) fail("unsupported field type");
                        need(";"); module.records[index].fields.push_back({n,t});
                        if(module.records[index].fields.size()>64) fail("struct field limit exceeded");
                    }
                }
                need(";"); if(module.records[index].fields.empty()) fail("empty struct or class");
                continue;
            }
            bool exported=take("export"); Type result=type(); std::string n=name();
            function(result,n,exported);
        }
    }
};
}

std::shared_ptr<Module> compile(const std::string &source,const std::string &filename) {
    const auto start=std::chrono::steady_clock::now();
    if(!supported()) throw std::runtime_error("kernel native backend unavailable on this host");
    auto m=std::make_shared<Module>(); m->filename=filename; Parser(*m,source).run();
    verify(*m);
    for(auto &f:m->functions) {
        m->stats.instructions+=f.code.size(); m->stats.values+=f.slots;
        for(const auto &r:f.local_storage) m->stats.local_bytes+=r.cells*8;
        f.floating=uses_floating_environment(f);
        for(const auto &i:f.code) if(i.op==Op::Bounds || i.op==Op::Require || i.op==Op::Tick ||
            i.op==Op::Rem || (i.op==Op::Div && i.type==Type::I64)) f.checked=true;
        for(const auto &call:f.calls) {
            f.floating=f.floating || m->functions.at(call.function).floating;
            f.checked=f.checked || m->functions.at(call.function).checked;
        }
    }
    lower(*m);
    m->stats.compile_ms=std::chrono::duration<double,std::milli>(std::chrono::steady_clock::now()-start).count();
    return m;
}
const char *status_name(Status s) {
    switch(s) { case Success:return "success"; case BoundsError:return "array index out of bounds";
    case RequirementError:return "require failed"; case BudgetError:return "execution budget exceeded";
    case ArithmeticError:return "invalid integer division or remainder"; } return "unknown kernel error";
}
bool uses_floating_environment(const Function &f) {
    if(f.floating) return true;
    // Include transitive helper effects computed during module verification.
    // Conservatively include all f64 instructions, even bitwise-only copies.
    for(const auto &i:f.code) if(i.type==Type::F64) return true;
    return false;
}

}

namespace sqkernel {
void verify(const Module &m) {
    std::vector<size_t> depth(m.functions.size()), live_bytes(m.functions.size());
    size_t instructions=0;
    for(size_t n=0;n<m.functions.size();++n) {
        const auto &f=m.functions[n];
        auto fail=[&](const std::string &why) {throw std::runtime_error(m.filename+": "+f.name+": invalid kernel IR: "+why);};
        if(f.slots<0 || (size_t)f.slots<f.argument_slots() || f.slots>16384) fail("temporary limit (16384)");
        instructions+=f.code.size();
        if(f.code.empty() || f.code.size()>8192 || instructions>65536) fail("instruction budget (8192/function, 65536/module)");
        size_t locals=0, child_bytes=0; depth[n]=1;
        for(const auto &r:f.local_storage) {if(!r.cells || r.cells>8192) fail("invalid storage extent"); locals+=r.cells*8;}
        if(locals>65536) fail("local storage exceeds 65536 bytes");
        for(const auto &c:f.calls) {
            // Current declaration-before-use syntax makes the graph topological.
            if(c.function>=n) fail("recursive or unresolved helper call");
            if(c.arguments.size()!=m.functions[c.function].argument_slots()) fail("call argument count");
            for(int a:c.arguments) if(a<0 || a>=f.slots) fail("call argument slot");
            depth[n]=std::max(depth[n],depth[c.function]+1);
            child_bytes=std::max(child_bytes,live_bytes[c.function]);
        }
        if(depth[n]>32) fail("call depth exceeds 32");
        live_bytes[n]=locals+child_bytes;
        if(live_bytes[n]>262144) fail("active source-local storage exceeds 262144 bytes");
        for(const auto &i:f.code) {
            if(i.dst < -1 || i.a < -1 || i.b < -1 || i.dst>=f.slots || i.a>=f.slots || i.b>=f.slots) fail("slot reference");
            if((i.op==Op::Jump || i.op==Op::JumpFalse) && i.immediate>f.code.size()) fail("branch target");
            if((i.op==Op::LocalAddress || i.op==Op::LocalZero) && i.immediate>=f.local_storage.size()) fail("storage reference");
            if(i.op==Op::Call) {
                if(i.immediate>=f.calls.size()) fail("call reference");
                if(i.type!=m.functions[f.calls[i.immediate].function].result || ((i.dst<0)!=(i.type==Type::Void))) fail("call result type");
            }
        }
        if(f.slot_types.size()!=(size_t)f.slots) fail("missing temporary types");
        auto expect=[&](int slot,Type type) {
            if(slot<0 || slot>=f.slots || f.slot_types[slot]!=type) fail("operand type mismatch");
        };
        std::vector<std::vector<int>> reads(f.code.size());
        std::vector<int> writes(f.code.size(),-1);
        for(size_t pc=0;pc<f.code.size();++pc) {
            const auto &i=f.code[pc];
            auto read=[&](int slot,Type type) {expect(slot,type);reads[pc].push_back(slot);};
            Type result=i.type;
            bool produces=true;
            switch(i.op) {
            case Op::Constant:break;
            case Op::Copy:case Op::Neg:read(i.a,i.type);break;
            case Op::Add:case Op::Sub:case Op::Mul:case Op::Div:case Op::Rem:
            case Op::Eq:case Op::Ne:case Op::Lt:case Op::Le:case Op::Gt:case Op::Ge:
                read(i.a,i.type);read(i.b,i.type);
                if(i.op>=Op::Eq && i.op<=Op::Ge) result=Type::Bool;
                break;
            case Op::Math: {
                size_t count;math_builtins(count);
                if(i.immediate>=count) fail("math builtin reference");
                const auto &spec=math_builtin(i.immediate);read(i.a,Type::F64);
                if(spec.arity()==2) read(i.b,Type::F64);
                if(i.type!=(spec.predicate?Type::Bool:Type::F64)) fail("math result type");
                break;
            }
            case Op::LocalAddress:result=Type::Pointer;break;
            case Op::LocalZero:case Op::Jump:case Op::Tick:produces=false;break;
            case Op::Load:read(i.a,Type::Pointer);read(i.b,Type::I64);break;
            case Op::Store:read(i.a,Type::Pointer);read(i.b,Type::I64);read(i.dst,i.type);produces=false;break;
            case Op::Bounds:read(i.a,Type::I64);if(i.b>=0) read(i.b,Type::I64);produces=false;break;
            case Op::Require:case Op::JumpFalse:read(i.a,Type::Bool);produces=false;break;
            case Op::Return:
                if(i.type!=f.result) fail("return type");
                if(i.type!=Type::Void) read(i.a,i.type);
                produces=false;break;
            case Op::Call: {
                const auto &site=f.calls.at(i.immediate);const auto &callee=m.functions[site.function];
                for(size_t a=0;a<site.arguments.size();++a) {
                    Type type=a>=callee.parameters.size()?Type::I64:
                        callee.parameters[a].borrowed()?Type::Pointer:callee.parameters[a].type;
                    read(site.arguments[a],type);
                }
                produces=i.type!=Type::Void;break;
            }
            }
            if(produces) {if(result==Type::Void) fail("void temporary");expect(i.dst,result);writes[pc]=i.dst;}
        }
        // Definite assignment over basic blocks. Unreachable instructions do not
        // participate; loops intersect their back-edge state with entry state.
        std::vector<size_t> leaders{0};
        for(size_t pc=0;pc<f.code.size();++pc) {
            auto op=f.code[pc].op;
            if(op==Op::Jump || op==Op::JumpFalse) leaders.push_back(f.code[pc].immediate);
            if(op==Op::Jump || op==Op::JumpFalse || op==Op::Return) leaders.push_back(pc+1);
        }
        leaders.push_back(f.code.size());std::sort(leaders.begin(),leaders.end());
        leaders.erase(std::unique(leaders.begin(),leaders.end()),leaders.end());
        size_t blocks=leaders.size()-1,words=(f.slots+63)/64;
        std::vector<std::vector<size_t>> successors(blocks);
        for(size_t block=0;block<blocks;++block) {
            const auto &last=f.code[leaders[block+1]-1];
            auto edge=[&](size_t pc) {if(pc<f.code.size()) successors[block].push_back(std::lower_bound(leaders.begin(),leaders.end(),pc)-leaders.begin());};
            if(last.op==Op::Jump || last.op==Op::JumpFalse) edge(last.immediate);
            if(last.op!=Op::Jump && last.op!=Op::Return) edge(leaders[block+1]);
        }
        std::vector<std::vector<uint64_t>> input(blocks,std::vector<uint64_t>(words,UINT64_MAX));
        std::fill(input[0].begin(),input[0].end(),0);
        for(size_t a=0;a<f.argument_slots();++a) input[0][a/64]|=uint64_t(1)<<(a%64);
        std::vector<bool> reached(blocks,false),queued(blocks,false);reached[0]=queued[0]=true;
        std::deque<size_t> work{0};
        while(!work.empty()) {
            auto block=work.front();work.pop_front();queued[block]=false;
            auto output=input[block];
            for(size_t pc=leaders[block];pc<leaders[block+1];++pc) if(writes[pc]>=0) output[writes[pc]/64]|=uint64_t(1)<<(writes[pc]%64);
            for(size_t next:successors[block]) {
                bool changed=!reached[next];reached[next]=true;
                for(size_t w=0;w<words;++w) {auto value=input[next][w]&output[w];changed|=value!=input[next][w];input[next][w]=value;}
                if(changed && !queued[next]) {work.push_back(next);queued[next]=true;}
            }
        }
        for(size_t block=0;block<blocks;++block) if(reached[block]) {
            const auto &last=f.code[leaders[block+1]-1];
            if(((last.op==Op::Jump || last.op==Op::JumpFalse) && last.immediate==f.code.size()) ||
               (last.op!=Op::Jump && last.op!=Op::Return && leaders[block+1]==f.code.size()))
                fail("reachable function fallthrough");
            auto defined=input[block];
            for(size_t pc=leaders[block];pc<leaders[block+1];++pc) {
                for(int slot:reads[pc]) if(!(defined[slot/64]&(uint64_t(1)<<(slot%64)))) fail("read before assignment at line "+std::to_string(f.code[pc].line));
                if(writes[pc]>=0) defined[writes[pc]/64]|=uint64_t(1)<<(writes[pc]%64);
            }
        }

    }
}
Function flatten(const Module &m,size_t index,size_t max_slots) {
    const auto &source=m.functions.at(index);
    Function f=source; f.code.clear(); f.calls.clear(); f.local_storage.clear();
    auto capacity=[&] {
        if((size_t)f.slots>max_slots) throw std::runtime_error(m.filename+": "+source.name+": native backend frame limit exceeded ("+std::to_string(max_slots)+" cells)");
        if(f.code.size()>8192) throw std::runtime_error(m.filename+": "+source.name+": native backend expanded instruction limit exceeded (8192)");
    };
    capacity();
    std::vector<int> storage;
    for(const auto &r:source.local_storage) {
        storage.push_back(f.slots); f.local_storage.push_back({f.slots,r.cells});
        f.slots+=(int)r.cells; capacity();
    }
    std::vector<size_t> offsets(source.code.size()+1);
    std::vector<std::pair<size_t,size_t>> branches;
    for(size_t pc=0;pc<source.code.size();++pc) {
        offsets[pc]=f.code.size(); auto i=source.code[pc];
        if(i.op==Op::LocalZero) {
            auto r=source.local_storage.at(i.immediate);
            for(size_t k=0;k<r.cells;++k) f.code.push_back({Op::Constant,Type::I64,storage.at(i.immediate)+(int)k,-1,-1,0,i.line});
        } else if(i.op==Op::Call) {
            const auto &call=source.calls.at(i.immediate);
            auto callee=flatten(m,call.function,max_slots);
            int base=f.slots; f.slots+=callee.slots; capacity();
            for(auto r:callee.local_storage) {r.first+=base; f.local_storage.push_back(r);}
            for(size_t a=0;a<call.arguments.size();++a) f.code.push_back({Op::Copy,Type::I64,base+(int)a,call.arguments[a],-1,0,i.line});
            size_t start=f.code.size();
            std::vector<size_t> map(callee.code.size()+1); size_t end=start;
            for(size_t k=0;k<callee.code.size();++k) {map[k]=end;end+=(callee.code[k].op==Op::Return && i.dst>=0)?2:1;}
            map.back()=end;
            for(auto ins:callee.code) {
                if(ins.op==Op::Return) {
                    if(i.dst>=0) f.code.push_back({Op::Copy,i.type,i.dst,ins.a+base,-1,0,ins.line});
                    f.code.push_back({Op::Jump,Type::Void,-1,-1,-1,end,ins.line});
                } else {
                    if(ins.dst>=0) ins.dst+=base;
                    if(ins.a>=0) ins.a+=base;
                    if(ins.b>=0) ins.b+=base;
                    if(ins.op==Op::Jump || ins.op==Op::JumpFalse) ins.immediate=map.at(ins.immediate);
                    if(ins.op==Op::LocalAddress) ins.immediate+=base;
                    f.code.push_back(ins);
                }
            }
        } else {
            if(i.op==Op::LocalAddress) i.immediate=storage.at(i.immediate);
            if(i.op==Op::Jump || i.op==Op::JumpFalse) branches.push_back({f.code.size(),i.immediate});
            f.code.push_back(i);
        }
        capacity();
    }
    offsets.back()=f.code.size();
    for(auto branch:branches) f.code[branch.first].immediate=offsets.at(branch.second);
    return f;
}
}
