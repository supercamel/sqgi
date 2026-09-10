from pathlib import Path
R=Path('/home/sam/Programming/sqgi');D=Path('/tmp/sqgi-v27-draft')
p=R/'Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc';s=p.read_text()
# Draft only. Production remains byte-identical to frozen V26 during measurement.
anchor='// Produce an existing raw slot in x11.'
pos=s.index(anchor);s=s[:pos]+(D/'literal-address.inc').read_text()+'\n'+s[pos:]
s=s.replace('unsigned cache_proof, bool array,\n    SQJitA64Reloc', 'unsigned cache_proof, bool array, SQInteger cold_literal,\n    SQJitA64Reloc')
s=s.replace('    if(cached) {\n        // Read the slot pointer', '    if(cached) {\n        if(cold_literal>=0) {\n            if(!sqjit_a64_precise_literal_address(buf,proto,cold_literal,base,cache_offset,guards,nguards)) return false;\n        }\n        else {\n        // Read the slot pointer')
s=s.replace('        if(array_ready >= 0 && !sqjit_a64_patch_branch', '        }\n        if(array_ready >= 0 && !sqjit_a64_patch_branch')
s=s.replace('unsigned cache_proof, bool owning_reads, SQInteger &done)', 'unsigned cache_proof, SQInteger cold_literal, bool owning_reads, SQInteger &done)')
s=s.replace('unsigned cache_proof, SQInteger &done)', 'unsigned cache_proof, SQInteger cold_literal, SQInteger &done)')
s=s.replace('cache_offset,cache_proof,array,\n        guards', 'cache_offset,cache_proof,array,cold_literal,\n        guards')
s=s.replace('unsigned cache_proof, bool owning_reads, bool owning_copies', 'unsigned cache_proof, SQInteger cold_literal, bool owning_reads, bool owning_copies')
s=s.replace('cache_offset,cache_proof,owning_reads,done)', 'cache_offset,cache_proof,cold_literal,owning_reads,done)')
s=s.replace('cache_offset,cache_proof,done)', 'cache_offset,cache_proof,cold_literal,done)')
anchor='    // Fixed parameters retain their original tag/bits'
pos=s.index(anchor)
s=s[:pos]+'''    SQInteger cold_literal[SQ_JIT_A64_IP_TABLE_SIZE];
    bool has_cold_literal=false;
    for(SQInteger ip=0;ip<proto->_ninstructions;++ip) {
        cold_literal[ip]=-1;
        const SQInteger n=cache_at[ip];
        if(n<0 || cache_may_hit[ip] || !constant_key[ip]) continue;
        const SQInteger literal=operands[n].key;
        const SQObjectType type=sq_type(proto->_literals[literal]);
        // Integer, boolean and string literal hashes have no floating conversion
        // edge cases. Other literal kinds retain the existing resolver.
        if(type!=OT_STRING && type!=OT_INTEGER && type!=OT_BOOL) continue;
        cold_literal[ip]=literal;has_cold_literal=true;
    }
'''+s[pos:]
s=s.replace('auto emit = [&](unsigned tier, bool owning_postincrement) -> bool {','auto emit = [&](unsigned tier, bool owning_postincrement, bool cold_lookups) -> bool {')
s=s.replace('tier >= 2 && cache_may_hit[ip] ? cache_offset : -1,','tier >= 2 && (cache_may_hit[ip] || (cold_lookups && cold_literal[ip]>=0)) ? cache_offset : -1,')
s=s.replace('cache_at[ip] >= 0 ? cache_proof[cache_at[ip]] : 0,\n            tier >= 3,', 'cache_at[ip] >= 0 ? cache_proof[cache_at[ip]] : 0,\n            cold_lookups ? cold_literal[ip] : -1,\n            tier >= 3,')
s=s.replace('    for(int tier=6;tier>=0;--tier) {\n        if(tier>=4', '''    for(int tier=6;tier>=0;--tier) {
        if(tier>=5 && has_cold_literal) {
            if(emit((unsigned)tier,has_postincrement,true)) return true;
            if(!exhausted) return false;
        }
        if(tier>=4''')
s=s.replace('emit((unsigned)tier,true)', 'emit((unsigned)tier,true,false)').replace('emit((unsigned)tier,false)', 'emit((unsigned)tier,false,false)').replace('emit(7,false)', 'emit(7,false,false)')
(D/'sqjit_backend_aarch64_precise.inc').write_text(s)
import difflib
(D/'draft.patch').write_text(''.join(difflib.unified_diff(p.read_text().splitlines(True),s.splitlines(True),'a/'+str(p.relative_to(R)),'b/'+str(p.relative_to(R)))))
print('Prepared V27 compiler draft outside production')

p=R/'test/cpp/test_sqjit_side_exit.cpp';s=p.read_text();s=s.replace('int main()\n{',(D/'literal-address-test.inc').read_text()+'\nint main()\n{')
s=s.replace('int failures = generated_owning_postincrement()', 'int failures = generated_literal_addresses() + generated_owning_postincrement()').replace('native_test_groups==13','native_test_groups==14').replace('all thirteen AArch64','all fourteen AArch64')
(D/'test_sqjit_side_exit.cpp').write_text(s)
