from pathlib import Path
import shutil
P=Path('/tmp/sqgi-v27-allocation-fault');D=Path('/tmp/sqgi-v28-allocation-fault');D.mkdir(exist_ok=True)
for name in ['fail_exec.cpp','fail_exec.so','throw_new.cpp','throw_new.so']:
 shutil.copy2(P/name,D/name)
(D/'inject.gdb').write_text((P/'inject.gdb').read_text().replace(str(P),str(D)))
t=(P/'probe.cpp').read_text().replace('#include <cstring>','#include <cstring>\n#include <string>')
t=t.replace('    const bool strict=', '    const bool shared=argc>1 && strstr(argv[1],"shared");\n    const bool strict=')
needle='    if(SQ_FAILED(sq_compilebuffer(v,source,';idx=t.index(needle)
t=t[:idx]+'''    std::basic_string<SQChar> shared_source;
    if(shared) {
        shared_source=_SC("function work(r,x) { r.count=r.count+1; local s=0; local flag=!x; if(flag) s=s+1;");
        for(int n=0;n<24;++n) shared_source+=_SC("s=s+x;");
        shared_source+=_SC("return s+r.tail; } record <- {count=0,label=\\"q\\",tail=7};");
        source=shared_source.c_str();
    }
'''+t[idx:]
t=t.replace('sq_pushobject(v,record);SQInteger value=-1;', 'sq_pushobject(v,record);if(shared) sq_pushinteger(v,2);SQInteger value=-1;')
t=t.replace('sq_call(v,2,SQTrue,SQFalse)', 'sq_call(v,shared ? 3 : 2,SQTrue,SQFalse)').replace('value!=2 ||', 'value!=(shared ? 55 : 2) ||')
needle='    }\n    v->temp_reg.Null();';assert t.count(needle)==1
t=t.replace(needle,'''        if(shared && o.compilation.compiled) {
            const SQJitCode &code=p->_jit->_entry->_code;bool calls=false,arithmetic=false;
            for(SQInteger off=0;off+4<=code.MappedSize();off+=4) {
                uint32_t word;memcpy(&word,(const unsigned char *)code.Entry()+off,4);
                calls=calls || (word&0xfc000000u)==0x94000000u;
                arithmetic=arithmetic || word==0x8b0a0129u;
            }
            if(!calls || !arithmetic) {rc=8;break;}
            printf("SHARED_RICH_NATIVE=1\\n");
        }
'''+needle)
(D/'probe.cpp').write_text(t)
t=Path('/tmp/sqgi-v27-run-faults.sh').read_text().replace('v27','v28').replace('V27','V28')
t=t.replace('./probe cold-reference > cold-reference.log 2>&1', './probe cold-reference > cold-reference.log 2>&1\n./probe shared-reference > shared-reference.log 2>&1')
t=t.replace('gdb -q -batch -x inject.gdb', 'LD_PRELOAD=/tmp/sqgi-v28-allocation-fault/fail_exec.so ./probe shared-exec > shared-exec.log 2>&1\ngdb -q -batch -x inject.gdb')
t=t.replace("'cold-reference.log','cold-exec.log']", "'cold-reference.log','cold-exec.log','shared-reference.log','shared-exec.log']")
t=t.replace("'post-exec.log','cold-exec.log']", "'post-exec.log','cold-exec.log','shared-exec.log']")
t=t.replace(" if n=='new.log':", " if n.startswith('shared-'):assert 'SHARED_RICH_NATIVE=1' in s,n\n if n=='new.log':")
Path('/tmp/sqgi-v28-run-faults.sh').write_text(t)
print('Prepared eleven allocation probes, including shared-rich reference and failure/retry')
