#include "kernel.h"
#include <algorithm>
#include <cerrno>
#include <cctype>
#include <cmath>
#include <cstring>
#include <cstdlib>
#include <limits>
#include <map>
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
        static const char *reserved[] = {"export","struct","in","inout","if","else","for","while","return","require","true","false","i64","f64","bool","void"};
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
    int slot() { if(fn->slots >= 384) fail("prototype native frame limit exceeded"); return fn->slots++; }
    int emit(Op op, Type t=Type::Void, int dst=-1, int a=-1, int b=-1, uint64_t imm=0, int line=0) {
        if(fn->code.size() >= 8192) fail("instruction limit exceeded");
        fn->code.push_back({op,t,dst,a,b,imm,line ? line : peek().line});
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
        const Parameter &p=fn->parameters[v.parameter];
        need("["); Value index=expression(); need("]"); same(index.type,Type::I64);
        emit(Op::Bounds,Type::I64,-1,index.slot,-1,p.extent);
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
    Value inline_call(const std::string &n) {
        const Function *callee=nullptr;
        for(auto &f:module.functions) if(f.name==n) callee=&f;
        if(!callee) fail("helper must be defined earlier; recursion and forward calls are unsupported: " + n);
        std::vector<Value> args;
        if(!at(")")) do { args.push_back(expression()); } while(take(","));
        need(")");
        if(args.size()!=callee->parameters.size()) fail("wrong helper argument count");
        if(callee->result==Type::Void) fail("void helpers are unsupported in prototype expressions");
        int base=fn->slots;
        for(int i=0;i<callee->slots;++i) slot();
        for(size_t i=0;i<args.size();++i) {
            if(callee->parameters[i].extent) fail("prototype helpers accept scalar arguments only");
            same(args[i].type,callee->parameters[i].type);
            emit(Op::Copy,args[i].type,base+(int)i,args[i].slot);
        }
        int result=slot();
        // Every original instruction maps to one instruction; Return needs two.
        std::vector<int> offsets(callee->code.size()+1);
        int end=(int)fn->code.size();
        for(size_t i=0;i<callee->code.size();++i) { offsets[i]=end; end+=callee->code[i].op==Op::Return ? 2 : 1; }
        offsets.back()=end;
        for(auto ins:callee->code) {
            if(ins.op==Op::Return) {
                emit(Op::Copy,callee->result,result,ins.a+base);
                emit(Op::Jump,Type::Void,-1,-1,-1,end);
            } else {
                if(ins.dst>=0) ins.dst+=base;
                if(ins.a>=0) ins.a+=base;
                if(ins.b>=0) ins.b+=base;
                if(ins.op==Op::Jump || ins.op==Op::JumpFalse) ins.immediate=offsets.at(ins.immediate);
                emit(ins.op,ins.type,ins.dst,ins.a,ins.b,ins.immediate,ins.line);
            }
        }
        return {result,callee->result};
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
        if(take("(")) return inline_call(n);
        Variable v=find(n);
        if(v.parameter>=0 && fn->parameters[v.parameter].extent) {
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
        if(s=="*" || s=="/") return 6;
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
            if(op=="-") code=Op::Sub; else if(op=="*") code=Op::Mul; else if(op=="/") code=Op::Div;
            else if(op=="==") code=Op::Eq; else if(op=="!=") code=Op::Ne;
            else if(op=="<") code=Op::Lt; else if(op=="<=") code=Op::Le; else if(op==">") code=Op::Gt; else if(op==">=") code=Op::Ge;
            bool compare=prec<=4;
            if(left.type==Type::Bool && op!="==" && op!="!=") fail("invalid Boolean operator");
            int s=slot(); emit(code,left.type,s,left.slot,right.slot);
            left={s,compare?Type::Bool:left.type};
        }
        return left;
    }
    void simple() {
        if(at("i64") || at("f64") || at("bool")) {
            Type t=type(); std::string n=name(); need("="); Value v=expression(); same(t,v.type);
            int s=slot(); emit(Op::Copy,t,s,v.slot); bind(n,{{s,t},-1}); return;
        }
        std::string n=name(); Variable v=find(n);
        bool memory=v.parameter>=0 && fn->parameters[v.parameter].extent;
        Address a={-1,-1,Type::Void,false};
        Type t=v.value.type;
        if(memory) { a=address(v); t=a.type; if(!a.writable) fail("cannot write an in parameter"); }
        std::string op=peek().text;
        if(op!="=" && op!="+=" && op!="-=" && op!="*=") fail("expected assignment");
        ++pos;
        Value old={-1,t};
        if(op!="=") { old.slot=slot(); if(memory) emit(Op::Load,t,old.slot,a.pointer,a.index); else emit(Op::Copy,t,old.slot,v.value.slot); }
        Value rhs=expression(); same(t,rhs.type);
        if(op!="=") { if(t==Type::Bool) fail("invalid Boolean assignment"); int s=slot(); emit(op=="+="?Op::Add:op=="-="?Op::Sub:Op::Mul,t,s,old.slot,rhs.slot); rhs={s,t}; }
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
                if(two=="==" || two=="!=" || two=="<=" || two==">=" || two=="+=" || two=="-=" || two=="*=" || two=="&&" || two=="||") ++p;
            }
            tokens.push_back({source.substr(begin,p-begin),line});
            if(tokens.size()>65536) throw std::runtime_error("kernel token limit exceeded");
        }
        tokens.push_back({"<eof>",line});
    }
    void run() {
        while(!at("<eof>")) {
            if(take("struct")) {
                Record r; r.name=name(); if(record(r.name)) fail("duplicate struct"); need("{");
                while(!take("}")) {
                    Type t=type(); if(t!=Type::I64 && t!=Type::F64) fail("prototype struct fields must be i64 or f64");
                    std::string n=name(); for(auto &f:r.fields) if(f.name==n) fail("duplicate field");
                    need(";"); r.fields.push_back({n,t}); if(r.fields.size()>64) fail("struct field limit exceeded");
                }
                need(";"); if(r.fields.empty()) fail("empty struct"); module.records.push_back(r); continue;
            }
            Function f; f.exported=take("export"); f.result=type(); f.name=name();
            for(auto &other:module.functions) if(other.name==f.name) fail("duplicate function");
            if(f.name=="array") fail("function name reserved for host array constructor");
            fn=&f; scopes.clear(); scopes.emplace_back(); need("(");
            if(!at(")")) do {
                Parameter p; bool borrow=false;
                if(take("in")) borrow=true; else if(take("inout")) { borrow=true; p.writable=true; }
                if(record(peek().text)) { p.record=peek().text; ++pos; p.stride=record(p.record)->fields.size(); }
                else { p.type=type(); if(p.type==Type::Void) fail("void parameter"); }
                p.name=name();
                if(take("[")) {
                    if(at("<eof>")) fail("missing array extent");
                    std::string n=peek().text; ++pos; char *end=nullptr; errno=0; unsigned long long extent=strtoull(n.c_str(),&end,10);
                    if(n.empty() || !isdigit((unsigned char)n[0]) || *end || errno || extent==0 || extent>1048576) fail("array extent must be a literal in 1..1048576");
                    p.extent=(size_t)extent; need("]");
                }
                if(borrow != (p.extent!=0)) fail("array parameters require in/inout; scalar parameters are by value");
                if(!p.record.empty() && !p.extent) fail("prototype structs require fixed array parameters");
                if(p.extent && p.type==Type::Bool) fail("prototype bool arrays are unsupported");
                int s=slot(); bind(p.name,{{s,p.type},(int)f.parameters.size()}); f.parameters.push_back(p);
                if(f.parameters.size()>32) fail("parameter limit exceeded");
            } while(take(","));
            need(")"); if(!at("{")) fail("expected function body"); bool returns=statement();
            if(!returns) { if(f.result!=Type::Void) fail("function must return on every path"); emit(Op::Return); }
            module.functions.push_back(std::move(f)); fn=nullptr;
            if(module.functions.size()>64) fail("function limit exceeded");
        }
    }
};
}

std::shared_ptr<Executable> lower(const Function &);
std::shared_ptr<Module> compile(const std::string &source,const std::string &filename) {
    if(!supported()) throw std::runtime_error("kernel native backend unavailable: prototype requires x86_64");
    auto m=std::make_shared<Module>(); m->filename=filename; Parser(*m,source).run();
    for(auto &f:m->functions) m->native.push_back(lower(f));
    return m;
}
const char *status_name(Status s) {
    switch(s) { case Success:return "success"; case BoundsError:return "array index out of bounds";
    case RequirementError:return "require failed"; case BudgetError:return "execution budget exceeded";
    case ArithmeticError:return "invalid integer division"; } return "unknown kernel error";
}
}
