#include "sqgi_vm.h"
#include <glib.h>
#include <glib/gstdio.h>
#include <string.h>
#ifndef G_OS_WIN32
#include <unistd.h>
#endif

static SQInteger release_token(SQUserPointer data, SQInteger size)
{
    (void)size;
    ++**(int **)data;
    return 0;
}

static void write_module(const char *dir, const char *name, const char *source)
{
    char *path = g_build_filename(dir, name, NULL);
    GError *error = NULL;
    g_assert_true(g_file_set_contents(path, source, -1, &error));
    g_assert_no_error(error);
    g_free(path);
}

static HSQUIRRELVM new_vm(const char *dir)
{
    HSQUIRRELVM v = sqgi_vm_new();
    g_assert_nonnull(v);
    sq_pushroottable(v);
    sq_pushstring(v, "cacheDir", -1);
    sq_pushstring(v, dir, -1);
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);
    return v;
}

static void run(HSQUIRRELVM v, const char *source)
{
    SQInteger top = sq_gettop(v);
    g_assert_cmpint(sqgi_vm_dobuffer(v, source, (SQInteger)strlen(source),
                                   "import-cache-test"), ==, SQ_OK);
    g_assert_cmpint(sq_gettop(v), ==, top);
}

int main(void)
{
    GError *error = NULL;
    char *dir = g_dir_make_tmp("sqgi-import-cache-XXXXXX", &error);
    g_assert_no_error(error);
    char *a = g_build_filename(dir, "a", NULL);
    char *b = g_build_filename(dir, "b", NULL);
    g_assert_cmpint(g_mkdir(a, 0700), ==, 0);
    g_assert_cmpint(g_mkdir(b, 0700), ==, 0);
    write_module(dir, "value.nut", "if (!(\"loads\" in getroottable())) ::loads <- 0;"
                 "::loads++; return {count=loads, changed=false, Type=class {}};");
    write_module(dir, "weak.nut", "::weakTarget <- {}; return weakTarget.weakref();");
    write_module(dir, "null.nut", "::nullLoads++; return null;");
    write_module(dir, "retry.nut", "::attempts++; if (attempts == 1) throw \"retry me\"; return 42;");
    write_module(dir, "syntax.nut", "local = broken;");
    write_module(dir, "cycle-a.nut", "return import(\"cycle-b.nut\");");
    write_module(dir, "cycle-b.nut", "return import(\"cycle-a.nut\");");
    write_module(dir, "thread.nut", "::threadLoads++; return {fromThread=true};");
    write_module(a, "same.nut", "return {name=\"a\"};");
    write_module(b, "same.nut", "return {name=\"b\"};");
    write_module(a, "child.nut", "return import(\"same.nut\");");
    write_module(b, "child.nut", "return import(\"same.nut\");");
    write_module(dir, "token.nut", "local value=::cacheToken; delete ::cacheToken; return {token=value};");
    HSQUIRRELVM v = new_vm(dir);
    int released = 0;
    sq_pushroottable(v);
    sq_pushstring(v, "cacheToken", -1);
    *(int **)sq_newuserdata(v, sizeof(int *)) = &released;
    sq_setreleasehook(v, -1, release_token);
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);
    run(v, "import(cacheDir+\"/token.nut\"); collectgarbage();");
    g_assert_cmpint(released, ==, 0);
    run(v, "local x = import(cacheDir+\"/value.nut\"); x.changed=true;"
           "local instance=x.Type();"
           "for(local i=0;i<1000;i++) {"
           " local y=import(cacheDir+\"/a/.././value.nut\");"
           " assert(x==y); assert(instance instanceof y.Type); }"
           "assert(loads==1); ::weakExport <- x.weakref();");
    run(v, "collectgarbage(); collectgarbage();"
           "assert(weakExport!=null); assert(weakExport.changed);"
           "assert(import(cacheDir+\"/value.nut\")==weakExport);"
           "::nullLoads <- 0; assert(import(cacheDir+\"/null.nut\")==null);"
           "assert(import(cacheDir+\"/null.nut\")==null); assert(nullLoads==1);"
           "assert(import(cacheDir+\"/a/child.nut\").name==\"a\");"
           "assert(import(cacheDir+\"/b/child.nut\").name==\"b\");");
#ifndef G_OS_WIN32
    char *alias = g_build_filename(dir, "alias.nut", NULL);
    g_assert_cmpint(symlink("value.nut", alias), ==, 0);
    run(v, "assert(import(cacheDir+\"/alias.nut\")==weakExport); assert(loads==1);");
    g_assert_cmpint(g_remove(alias), ==, 0);
    g_free(alias);
#endif
    run(v, "local w=import(cacheDir+\"/weak.nut\"); assert(typeof w==\"weakref\");"
           "local cached=import(cacheDir+\"/weak.nut\"); assert(typeof cached==\"weakref\");"
           "assert(cached==w); delete ::weakTarget; collectgarbage(); assert(w.ref()==null);"
           "assert(typeof import(cacheDir+\"/weak.nut\")==\"weakref\");");
    run(v, "::attempts <- 0; local caught=false;"
           "try { import(cacheDir+\"/retry.nut\"); } catch(e) { caught=e==\"retry me\"; }"
           "assert(caught); assert(import(cacheDir+\"/retry.nut\")==42);"
           "assert(import(cacheDir+\"/retry.nut\")==42); assert(attempts==2);"
           "foreach(name in [\"missing.nut\",\"syntax.nut\"]) {"
           " caught=false; try { import(cacheDir+\"/\"+name); } catch(e) {caught=true;} assert(caught); }"
           "caught=false; try { import(cacheDir+\"/cycle-a.nut\"); }"
           "catch(e) {caught=e.find(\"circular module import\")!=null;} assert(caught);");
    write_module(dir, "missing.nut", "return 17;");
    write_module(dir, "syntax.nut", "return 23;");
    write_module(dir, "cycle-b.nut", "return 29;");
    run(v, "assert(import(cacheDir+\"/missing.nut\")==17);"
           "assert(import(cacheDir+\"/syntax.nut\")==23);"
           "assert(import(cacheDir+\"/cycle-a.nut\")==29);"
           "::threadLoads <- 0; local t=newthread(function(){return import(cacheDir+\"/thread.nut\");});"
           "local x=t.call(); t=null; collectgarbage();"
           "assert(x==import(cacheDir+\"/thread.nut\")); assert(threadLoads==1);"
           "local fresh=dofile(cacheDir+\"/value.nut\"); assert(fresh!=weakExport);"
           "assert(loads==2); assert(import(cacheDir+\"/value.nut\")==weakExport);");
    /* Simultaneous VMs must never share exports or loading markers. */
    HSQUIRRELVM other = new_vm(dir);
    run(other, "local x=import(cacheDir+\"/value.nut\"); assert(loads==1); assert(!x.changed);");
    sqgi_vm_free(v);
    g_assert_cmpint(released, ==, 1);
    run(other, "assert(import(cacheDir+\"/value.nut\").count==1); assert(loads==1);");
    sqgi_vm_free(other);
    for (int i=0;i<3;i++) {
        v=new_vm(dir);
        run(v, "assert(import(cacheDir+\"/value.nut\").count==1); assert(loads==1);");
        sqgi_vm_free(v);
    }
    const char *files[] = {"value.nut", "token.nut", "weak.nut", "null.nut", "retry.nut", "syntax.nut", "missing.nut",
                          "cycle-a.nut", "cycle-b.nut", "thread.nut", "a/same.nut", "b/same.nut",
                          "a/child.nut", "b/child.nut"};
    for (guint i=0;i<G_N_ELEMENTS(files);i++) {
        char *path=g_build_filename(dir,files[i],NULL);
        g_assert_cmpint(g_remove(path), ==, 0);
        g_free(path);
    }
    g_assert_cmpint(g_rmdir(a), ==, 0);
    g_assert_cmpint(g_rmdir(b), ==, 0);
    g_assert_cmpint(g_rmdir(dir), ==, 0);
    g_free(a); g_free(b); g_free(dir);
    return 0;
}
