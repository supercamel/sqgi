#include "sqgi_gi_call_plan.h"
#include "sqgi_vm.h"
#include <stdio.h>
#include <string.h>

#define CHECK(c, msg) do { if(!(c)) { fprintf(stderr,"FAIL: %s\n",msg); ++failures; } } while(0)
int main(void)
{
    int failures = 0;
    GIRepository *repo = g_irepository_get_default();
    CHECK(g_irepository_require(repo,"GLib","2.0",0,NULL),"load GLib metadata");
    const char *names[] = {"get_monotonic_time","file_get_contents","base64_decode","spawn_sync"};
    const gint visible[] = {0,1,1,5};
    const gint outputs[] = {0,1,0,3};
    for(guint i=0; i<G_N_ELEMENTS(names); ++i) {
        GIBaseInfo *info = g_irepository_find_by_name(repo,"GLib",names[i]);
        CHECK(info && g_base_info_get_type(info)==GI_INFO_TYPE_FUNCTION,"find callable");
        if(!info) continue;
        SqgiCallPlan *p = sqgi_call_plan_new((GIFunctionInfo *)info);
        CHECK(p->n_visible==visible[i],"hidden input arguments excluded");
        CHECK(p->n_visible_out==outputs[i],"output lengths hidden and values preserved");
        if(i==3) CHECK(p->n_args>8,"large signature exceeds inline storage");
        gint compact=2, legacy=2;
        for(gint j=0; j<p->n_args; ++j) {
            gboolean in=p->args[j].direction!=GI_DIRECTION_OUT;
            CHECK(p->compact_slots[j]==(p->visible[j]?compact++:-1),"compact argument positions");
            CHECK(p->legacy_slots[j]==(in?legacy++:-1),"legacy argument positions");
        }
        sqgi_call_plan_free(p); g_base_info_unref(info);
    }
    // Exercise a cached signature repeatedly, including both argument layouts,
    // marshalling failure, callback reentry and independently owned VM teardown.
    const char *script =
        "local G=import(\"GLib\");\n"
        "for(local i=0;i<30;i++) {\n"
        " if(G.ascii_tolower(65)!=97) throw \"scalar call\";\n"
        " if(G.base64_encode(\"hello\")!=\"aGVsbG8=\" || G.base64_encode(\"hello\",5)!=\"aGVsbG8=\") throw \"argument layouts\";\n"
        " local caught=false; try { G.ascii_tolower(\"bad\") } catch(e) { caught=true };\n"
        " if(!caught || G.ascii_tolower(66)!=98) throw \"failed call polluted plan\";\n"
        "}\n"
        "local context=G.MainContext.default(); local calls=0;\n"
        "local recursive=null; recursive=function(n) { context.invoke_full(0,function() { calls++; if(n>0) recursive(n-1); return false }); };\n"
        "if(!context.acquire()) throw \"context acquire\"; recursive(5); context.release();\n"
        "if(calls!=6) throw \"recursive callback arguments\"; recursive=null;\n";
    for(int i=0; i<3; ++i) {
        HSQUIRRELVM v=sqgi_vm_new();
        CHECK(v,"create VM");
        if(!v) continue;
        CHECK(SQ_SUCCEEDED(sqgi_vm_dobuffer(v,script,strlen(script),"GI call plans")),"repeat calls and callback reentry");
#ifndef _WIN32
        const char *large="local G=import(\"GLib\"); for(local i=0;i<3;i++) { local r=G.spawn_sync(null,[\"/bin/true\"],null,0,null); if(r.len()!=3 || r[2]!=0) throw \"large signature output\"; }";
        CHECK(SQ_SUCCEEDED(sqgi_vm_dobuffer(v,large,strlen(large),"GI large signature")),"large signature heap storage");
#endif
        sqgi_vm_free(v);
    }
    return failures ? 1 : 0;
}
