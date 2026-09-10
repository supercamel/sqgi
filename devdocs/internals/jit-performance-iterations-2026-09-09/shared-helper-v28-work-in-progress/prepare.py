from pathlib import Path
import hashlib,difflib,json
R=Path('/home/sam/Programming/sqgi');D=Path('/tmp/sqgi-v28-shared-helper-draft')
p=Path('Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc');old=(R/p).read_text();t=old
changes={
 'auto emit = [&](unsigned tier, bool owning_postincrement, bool cold_lookups) -> bool {':'auto emit = [&](unsigned tier, bool owning_postincrement, bool cold_lookups, bool shared_helpers) -> bool {',
 '        if(compact) {\n            // A compact cold tier retains native control flow and checked':'        if(compact || shared_helpers) {\n            // Shared cold calls retain native control flow and checked',
 '    if(compact) {\n        const SQInteger trampoline=buf.size;':'    if(compact || shared_helpers) {\n        const SQInteger trampoline=buf.size;'
}
for a,b in changes.items():assert t.count(a)==1,a;t=t.replace(a,b)
# The optional trampoline can itself exhaust the buffer. Mark emission complete
# only after it and its BL relocations succeed; install failure still stops retry.
assert t.count('    emitted = true;\n')==1
t=t.replace('    emitted = true;\n','')
t=t.replace('    if(!native->_code.Install(buf.bytes, buf.size)) {','    emitted = true;\n    if(!native->_code.Install(buf.bytes, buf.size)) {')
a='''    for(int tier=6;tier>=0;--tier) {
        if(tier>=5 && has_cold_literal) {
            if(emit((unsigned)tier,has_postincrement,true)) return true;
            if(!exhausted) return false;
        }
        if(tier>=4 && has_postincrement) {
            if(emit((unsigned)tier,true,false)) return true;
            if(!exhausted) return false;
        }
        // Optional growth must first fall back to the existing layout at the
        // same tier, preserving previously fitting cache/copy/store fast paths.
        if(emit((unsigned)tier,false,false)) return true;
        if(!exhausted) return false;
    }
    return emit(7,false,false);'''
b='''    for(int tier=6;tier>=0;--tier) {
        // Preserve every fitting layout at this tier before trying shared cold
        // helper setup. Only buffer exhaustion may reach another layout. The
        // shared form can retain richer fast paths before lowering the tier;
        // its extra call/return cost must be measured on actual helper misses.
        for(unsigned shared=0;shared<(tier ? 2u : 1u);++shared) {
            if(tier>=5 && has_cold_literal) {
                if(emit((unsigned)tier,has_postincrement,true,shared!=0)) return true;
                if(!exhausted) return false;
            }
            if(tier>=4 && has_postincrement) {
                if(emit((unsigned)tier,true,false,shared!=0)) return true;
                if(!exhausted) return false;
            }
            if(emit((unsigned)tier,false,false,shared!=0)) return true;
            if(!exhausted) return false;
        }
    }
    return emit(7,false,false,false);'''
assert t.count(a)==1;t=t.replace(a,b)
(D/'sqjit_backend_aarch64_precise.inc').write_text(t)
(D/'candidate.patch').write_text(''.join(difflib.unified_diff(old.splitlines(True),t.splitlines(True),'a/'+str(p),'b/'+str(p))))
h=lambda data:hashlib.sha256(data).hexdigest()
(D/'draft-manifest.json').write_text(json.dumps({'source':str(p),'base_sha256':h(old.encode()),'draft_sha256':h(t.encode()),'applied':False,'compiled':False,'measured':False,'status':'Pending V27 fresh profile and emission-tier evidence'},indent=2)+'\n')
print('Prepared one-file shared-helper draft outside production')

# The checked fixture must execute shared rich calls, including a resolver cache
# argument and a late committed side exit. Its exact emitted fit is untested yet.
test_path=Path('test/cpp/test_sqjit_side_exit.cpp');old_test=(R/test_path).read_text()
assert old_test.count('int main()\n{')==1
test_text=old_test.replace('int main()\n{',(D/'shared-helper-test.inc').read_text()+'int main()\n{').replace('int failures = generated_literal_addresses()', 'int failures = generated_shared_helpers() + generated_literal_addresses()').replace('native_test_groups==14,"all fourteen','native_test_groups==15,"all fifteen')
(D/'test_sqjit_side_exit.cpp').write_text(test_text)
(D/'native-test.patch').write_text(''.join(difflib.unified_diff(old_test.splitlines(True),test_text.splitlines(True),'a/'+str(test_path),'b/'+str(test_path))))
