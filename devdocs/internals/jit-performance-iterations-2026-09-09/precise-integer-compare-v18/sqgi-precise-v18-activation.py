from pathlib import Path
r=Path('/home/sam/Programming/sqgi');p=r/'test/cpp/test_sqjit_side_exit.cpp';s=p.read_text()
s=s.replace('''        "local dead=[11].weakref(); if(cached_kind(r,dead)!=null) throw \\"cached dead weak reload\\"; r.payload=5;\\n"''','''        // Clear the caller's sole temporary owner before calling cached_kind.
        // Otherwise its first GET must correctly side-exit to release that owner.
        "local dead=[11].weakref(); local cleared=r.count;"
        " if(dead.ref()!=null) throw \\"dead weak fixture\\";"
        " if(cached_kind(r,dead)!=null) throw \\"cached dead weak reload\\"; r.payload=5;\\n"''')
anchor='static bool run(SQVM *v, const SQChar *source)';s=s.replace(anchor,'static int native_test_groups = 0;\n\n'+anchor)
needle='#if SQJIT_HAS_EXTERNAL_NATIVE\n    SQVM *v';assert s.count(needle)==10,s.count(needle);s=s.replace(needle,'#if SQJIT_HAS_EXTERNAL_NATIVE\n    ++native_test_groups;\n    SQVM *v')
needle='''    SQVM *v = sq_open(64);
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    ctx.enabled = true; ctx.threshold = 1000000;'''
assert s.count(needle)==1
s=s.replace(needle,'''#if defined(__aarch64__) && defined(__linux__)
    CHECK(native_test_groups==10,"all ten AArch64 generated-code test groups actually execute");
    fprintf(stdout,"[coverage] executed %d AArch64 generated-code groups\\n",native_test_groups);
#endif
'''+needle)
p.write_text(s)
p=r/'test/cpp/test_sqjit_contracts.cpp';s=p.read_text();s=s.replace('static SQInteger stub()', 'static bool loop_variant_tests_ran = false;\n\nstatic SQInteger stub()')
s=s.replace('''static void loop_variant_tests(int &rc)
{
#if SQJIT_HAS_EXTERNAL_NATIVE''','''static void loop_variant_tests(int &rc)
{
#if SQJIT_HAS_EXTERNAL_NATIVE
    loop_variant_tests_ran = true;''')
s=s.replace('''    loop_variant_tests(rc);
    SQVM *v''','''    loop_variant_tests(rc);
#if defined(__aarch64__) && defined(__linux__)
    CHECK(loop_variant_tests_ran,"AArch64 loop adaptation and lifetime contracts actually execute");
    fprintf(stdout,"[coverage] executed AArch64 loop adaptation and lifetime contracts\\n");
#endif
    SQVM *v''');p.write_text(s)
