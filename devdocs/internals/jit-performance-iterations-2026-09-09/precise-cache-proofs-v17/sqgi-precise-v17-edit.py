from pathlib import Path
import shutil
R=Path('/home/sam/Programming/sqgi');B=Path('/tmp/sqgi-precise-before-v17');assert not B.exists()
for name in ['Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc','test/cpp/test_sqjit_side_exit.cpp']:
 d=B/name;d.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(R/name,d)
p=R/'Squirrel3/squirrel/jit/sqjit_backend_aarch64_precise.inc';s=p.read_text()
pos=s.index('static void sqjit_a64_precise_init_caches')
s=s[:pos]+'''enum SQJitA64PreciseCacheProof {
    SQ_JIT_A64_CACHE_FIXED_OWNER = 1,
    SQ_JIT_A64_CACHE_FIXED_KEY = 2
};

'''+s[pos:]
s=s.replace('SQInteger cache_offset, bool array,\n', 'SQInteger cache_offset, unsigned cache_proof, bool array,\n')
s=s.replace('!sqjit_a64_emit_cmp_imm(buf,11,0) || !guard(SQ_JIT_A64_EQ) ||\n            !sqjit_a64_emit_ldr_w(buf,9,19,sqjit_a64_stack_type_disp(base))', '''!sqjit_a64_emit_cmp_imm(buf,11,0) || !guard(SQ_JIT_A64_EQ)) return false;
        if(!(cache_proof & SQ_JIT_A64_CACHE_FIXED_OWNER) &&
            (!sqjit_a64_emit_ldr_w(buf,9,19,sqjit_a64_stack_type_disp(base))''')
s=s.replace('!sqjit_a64_emit_cmp_reg(buf,9,10) || !guard(SQ_JIT_A64_NE)) return false;\n        if(!constant_key &&', '!sqjit_a64_emit_cmp_reg(buf,9,10) || !guard(SQ_JIT_A64_NE))) return false;\n        if(!constant_key && !(cache_proof & SQ_JIT_A64_CACHE_FIXED_KEY) &&')
s=s.replace('bool constant_key, SQInteger cache_offset, bool owning_reads, SQInteger &done)', 'bool constant_key, SQInteger cache_offset, unsigned cache_proof, bool owning_reads, SQInteger &done)')
s=s.replace('bool constant_key, SQInteger cache_offset, SQInteger &done)', 'bool constant_key, SQInteger cache_offset, unsigned cache_proof, SQInteger &done)')
s=s.replace('buf,proto,i,constant_key,cache_offset,array,', 'buf,proto,i,constant_key,cache_offset,cache_proof,array,')
s=s.replace('bool extended, bool constant_key, SQInteger cache_offset, bool owning_reads,', 'bool extended, bool constant_key, SQInteger cache_offset, unsigned cache_proof, bool owning_reads,')
s=s.replace('buf,proto,i,constant_key,cache_offset,owning_reads,done', 'buf,proto,i,constant_key,cache_offset,cache_proof,owning_reads,done')
s=s.replace('buf,proto,i,constant_key,cache_offset,done', 'buf,proto,i,constant_key,cache_offset,cache_proof,done')
s=s.replace('''    // Share a cache between sites using the same operand locations. This is
    // only a grouping heuristic: every use still checks both runtime operands.
''','''    // Share caches by operand locations. Mutable identities remain guarded;
    // complete write facts below can prove canonical parameters invariant.
''')
needle='''    bool exhausted = false;
    auto emit = [&](unsigned tier) -> bool {'''
block='''    // A first lexical use can still hit on later iterations or after a later
    // site branches backward. Cover every backward-branch span, not just a
    // selected loop header. Otherwise a group with no earlier use is cold.
    bool in_backedge[SQ_JIT_A64_IP_TABLE_SIZE] = {};
    SQSlotSet written;
    for(SQInteger ip=0;ip<proto->_ninstructions;++ip) {
        written |= analysis.facts[ip].writes;
        const SQInteger target = analysis.facts[ip].target;
        if(target >= 0 && target <= ip)
            for(SQInteger n=target;n<=ip;++n) in_backedge[n] = true;
    }
    bool cache_seen[MAX_CACHES] = {}, cache_may_hit[SQ_JIT_A64_IP_TABLE_SIZE] = {};
    unsigned cache_proof[MAX_CACHES] = {};
    for(SQInteger n=0;n<cache_count;++n) {
        const CacheOperands &item = operands[n];
        if(item.base < proto->_nparameters && !written.test(item.base))
            cache_proof[n] |= SQ_JIT_A64_CACHE_FIXED_OWNER;
        if(item.literal || (item.key < proto->_nparameters && !written.test(item.key)))
            cache_proof[n] |= SQ_JIT_A64_CACHE_FIXED_KEY;
    }
    for(SQInteger ip=0;ip<proto->_ninstructions;++ip) {
        const SQInteger n = cache_at[ip];
        if(n < 0) continue;
        cache_may_hit[ip] = in_backedge[ip] || cache_seen[n];
        cache_seen[n] = true;
    }
    // Fixed parameters retain their original tag/bits throughout this no-call,
    // no-allocation activation. A nonnull helper-filled slot still gates every
    // use, and the loaded value may change. Nothing persists across activation.
    bool exhausted = false;
    auto emit = [&](unsigned tier) -> bool {'''
assert s.count(needle)==1;s=s.replace(needle,block)
s=s.replace('''            tier >= 2 ? cache_offset : -1,tier >= 3,tier >= 4,tier >= 5,fast_done)''','''            tier >= 2 && cache_may_hit[ip] ? cache_offset : -1,
            cache_at[ip] >= 0 ? cache_proof[cache_at[ip]] : 0,
            tier >= 3,tier >= 4,tier >= 5,fast_done)''')
s=s.replace('''        // Read the slot pointer but never dereference it until all identity
        // checks pass. Misses, changed receiver/key tags and changed raw bits
        // retain the checked resolver, which replaces the activation entry.''','''        // Read the slot pointer but never dereference it until it is nonnull
        // and every mutable identity matches. Proven fixed parameters cannot
        // change tag/bits inside this activation. Misses retain the resolver.''')
p.write_text(s)
