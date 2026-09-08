#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqbytecode.h"
#include <stdio.h>
#include <string.h>
#include <vector>
#include <limits>
#include <sstream>
#ifdef SQ_ENABLE_JIT
#include "jit/sqjit_context.h"
#include "jit/sqjit_observe.h"
#include "jit/sqjit_platform.h"
#endif
#define CHECK(c, msg) do { if(!(c)) { fprintf(stderr, "FAIL: %s\n", msg); ++rc; } } while(0)

struct Buffer { std::vector<unsigned char> data; size_t offset = 0; };
static SQInteger write_buffer(SQUserPointer p, SQUserPointer data, SQInteger size)
{
    Buffer &b = *(Buffer *)p;
    unsigned char *bytes = (unsigned char *)data;
    b.data.insert(b.data.end(), bytes, bytes + size);
    return size;
}
static SQInteger read_buffer(SQUserPointer p, SQUserPointer data, SQInteger size)
{
    Buffer &b = *(Buffer *)p;
    if(size < 0 || (size_t)size > b.data.size() - b.offset) return -1;
    memcpy(data, b.data.data() + b.offset, size); b.offset += size;
    return size;
}
static bool execute(SQVM *v, const SQChar *source, bool roundtrip = false)
{
    SQInteger top = sq_gettop(v);
    bool ok = SQ_SUCCEEDED(sq_compilebuffer(v, source, scstrlen(source), _SC("optimizer"), SQTrue));
    if(ok && roundtrip) {
        Buffer buffer;
        ok = SQ_SUCCEEDED(sq_writeclosure(v, write_buffer, &buffer));
        sq_pop(v, 1);
        ok = ok && SQ_SUCCEEDED(sq_readclosure(v, read_buffer, &buffer));
    }
    if(ok) { sq_pushroottable(v); ok = SQ_SUCCEEDED(sq_call(v, 1, SQFalse, SQTrue)); }
    if(!ok) {
        sq_getlasterror(v); const SQChar *msg = NULL;
        if(SQ_SUCCEEDED(sq_getstring(v, -1, &msg))) scprintf(_SC("FAIL: %s\n"), msg);
    }
    sq_settop(v, top);
    return ok;
}
static SQFunctionProto *get_proto(SQVM *v, const SQChar *name)
{
    sq_pushroottable(v); sq_pushstring(v, name, -1);
    if(SQ_FAILED(sq_get(v, -2))) { sq_pop(v, 1); return NULL; }
    HSQOBJECT obj; sq_getstackobj(v, -1, &obj);
    SQFunctionProto *p = sq_type(obj) == OT_CLOSURE ? _closure(obj)->_function : NULL;
    sq_pop(v, 2); return p;
}

int main()
{
    int rc = 0;
    // Overflow/error expressions must remain runtime operations. Compiling
    // them must itself be safe under UBSan; deliberately do not execute them.
    {
        SQVM *v = sq_open(64);
        const SQInteger hi = std::numeric_limits<SQInteger>::max();
        const char *operators[] = {"+1", "*2", "/(-1)", "%(-1)", "-1", "/0"};
        const unsigned char opcodes[] = {_OP_ADD, _OP_MUL, _OP_DIV, _OP_MOD, _OP_SUB, _OP_DIV};
        for(int n = 0; n < 6; ++n) {
            std::basic_ostringstream<SQChar> source;
            source << _SC("return function() { return ");
            if(n >= 2 && n <= 4) source << _SC("(-") << hi << _SC("-1)");
            else source << hi;
            for(const char *c = operators[n]; *c; ++c) source << (SQChar)*c;
            source << _SC("; }");
            std::basic_string<SQChar> text = source.str();
            SQInteger top = sq_gettop(v);
            bool compiled = SQ_SUCCEEDED(sq_compilebuffer(v, text.c_str(), text.size(), _SC("overflow"), SQTrue));
            CHECK(compiled, "overflow boundary expression compiles safely");
            if(compiled) {
                HSQOBJECT obj; sq_getstackobj(v, -1, &obj);
                SQFunctionProto *p = _funcproto(_closure(obj)->_function->_functions[0]);
                bool retained = false;
                for(SQInteger ip = 0; ip < p->_ninstructions; ++ip) retained |= p->_instructions[ip].op == opcodes[n];
                CHECK(retained, "overflow and division errors are not constant-folded");
            }
            sq_settop(v, top);
        }
        sq_close(v);
    }
    SQInteger counts[2] = {};
    for(int optimized = 0; optimized < 2; ++optimized) for(int jit = 0; jit < 2; ++jit) {
        SQVM *v = sq_open(64);
        v->_sharedstate->_bytecode_optimization = optimized != 0;
        sq_enabledebuginfo(v, SQTrue);
#ifdef SQ_ENABLE_JIT
        SQJitContext &ctx = sqjit_context(v->_sharedstate);
        ctx.enabled = jit != 0; ctx.threshold = 1; ctx.trace = ctx.trace_stats = false;
        sqjit_observe_enable(v);
#endif
        CHECK(execute(v, _SC(
            "function constant() { return (2+3)*4 }\n"
            "function branch(x) { if(false) { x=x+999 }; return x+1 }\n"
            "function untyped(x) { return x+0 }\n"
            "function twice(x) { return (x*7)+(x*7) }\n"
            "function native_tail(a) { return a.len() }\n"
            "function zero() { local x=2+3; return x/0 }\n"
            "function trapped() { local x=2+3; try { x=x/0 } catch(e) { return x }; return -1 }\n"
            "function captured() { local x=2+3; local f=function() { x=11 }; f(); return x+1 }\n"
            "function mapping() {\n local named=2+3;\n if(false) { named=999 }\n return named/0;\n}\n"
        )), "define differential kernels");
        CHECK(execute(v, _SC(
            "if(constant()!=20) throw \"literal arithmetic\"; if(branch(3)!=4 || branch(8)!=9) throw \"constant branch\"; if(untyped(\"a\")!=\"a0\") throw \"string addition\";\n"
            "local calls=0; local obj=class { function _mul(x) { calls++; return 7 } }();\n"
            "if(twice(obj)!=14 || calls!=2) throw \"metamethod effects\";\n"
            "if(native_tail([1,2,3])!=3 || trapped()!=5 || captured()!=12) throw \"call/trap/outer effects\";\n"
            "local threw=false; try { zero() } catch(e) { threw=true }; if(!threw) throw \"division by zero moved away\";\n"
            "function truth(x) { if(0) return 99; if(0.0) return 98; if(true) return x+1; return 97 }\n"
            "if(truth(2)!=3) throw \"truth rules\";\n"
        ), true), "optimized/unoptimized interpreter/JIT and serialization agree");
        CHECK(execute(v, _SC(
            "function joined(flag) { local a=0; if(flag) a=17; else a=17; return a*3+2 }\n"
            "function different(flag) { local a=0; if(flag) a=17; else a=19; return a*3+2 }\n"
            "function loop_facts(n) { local a=2; local b=7; for(local i=0;i<n;i++) { a=a+3; if(i%2==0) b=b+1 }; return a*100+b }\n"
            "function loop_branch(n) { local sum=0; local x=1; while(n>0) { if(x==1) x=2; else x=1; sum+=x; n-- }; return sum }\n"
            "function exception_join() { local x=2; try { x=19; x=x/0 } catch(e) { return x+1 }; return -1 }\n"
            "for(local i=0;i<6;i++) { if(joined(i%2==0)!=53 || different(i%2==0)!=(i%2==0?53:59)) throw \"join facts\"; }\n"
            "if(loop_facts(0)!=207 || loop_facts(4)!=1409 || loop_branch(5)!=8 || exception_join()!=20) throw \"loop/exception facts\";\n"
        ), true), "forward joins, backedges, exceptional edges and serialization");
        if(optimized) {
            SQFunctionProto *joined = get_proto(v, _SC("joined"));
            bool arithmetic = false;
            for(SQInteger ip=0; joined && ip<joined->_ninstructions; ++ip)
                arithmetic |= joined->_instructions[ip].op == _OP_MUL || joined->_instructions[ip].op == _OP_ADD;
            CHECK(joined && !arithmetic, "equal branch constants eliminate downstream arithmetic");
        }
        SQFunctionProto *p = get_proto(v, _SC("constant"));
        CHECK(p, "constant prototype exists");
        if(p) {
            counts[optimized] = p->_ninstructions;
            if(optimized) {
                SQInteger operations = 0;
                bool folded = false;
                for(SQInteger ip = 0; ip < p->_ninstructions; ++ip) {
                    if(p->_instructions[ip].op != _OP_LINE) ++operations;
                    if(p->_instructions[ip].op == _OP_LOADINT && p->_instructions[ip]._arg1 == 20) folded = true;
                }
                CHECK(operations == 2 && folded,
                    "literal expression collapses to load and return");
            }
        }
        p = get_proto(v, _SC("mapping"));
        CHECK(p, "metadata prototype exists");
        if(p) {
            for(SQInteger n = 0; n < p->_ninstructions; ++n) if(p->_instructions[n].op == _OP_DIV)
                CHECK(p->GetLine(&p->_instructions[n]) == 12, "surviving error instruction retains source line");
            for(SQInteger n = 0; n < p->_nlocalvarinfos; ++n) {
                const SQLocalVarInfo &local = p->_localvarinfos[n];
                CHECK(local._start_op <= local._end_op && local._end_op < (SQUnsignedInteger)p->_ninstructions,
                    "local variable ranges map to surviving instructions");
            }
        }
#if defined(SQ_ENABLE_JIT) && (SQJIT_HAS_X64_NATIVE || SQJIT_HAS_EXTERNAL_NATIVE)
        if(optimized && jit) {
            SQJitObservation o = {};
            CHECK(sqjit_observe_proto(get_proto(v, _SC("branch")), o) && o.frame.successes + o.direct.successes > 0,
                "constant branch simplification unlocks native execution");
        }
#endif
        sq_close(v);
    }
    CHECK(counts[1] < counts[0], "bytecode instruction count improves");
    return rc ? 1 : 0;
}
