set pagination off
set debuginfod enabled off
set confirm off
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_TRACE 0
python
import gdb, pathlib, json, hashlib
out=pathlib.Path('/tmp/sqgi-precise-loop-variants-study/profiles')
seen={}
checks=[]
class Capture(gdb.Breakpoint):
    def stop(self):
        try:
            name=gdb.parse_and_eval('(char*)proto->_name._unVal.pString->_val').string()
            if name!='counter_work':return False
            for label,field in [('primary','_loop_code'),('alternate','_loop_alternate_code')]:
                code=gdb.parse_and_eval('jit->'+field)
                entry=int(code['entry']); size=int(code['size'])
                if not entry or not size:continue
                raw=bytes(gdb.selected_inferior().read_memory(entry,size))
                digest=hashlib.sha256(raw).hexdigest()
                if label in seen:
                    assert seen[label]['entry']==entry and seen[label]['sha256']==digest, 'mapping changed'
                    checks.append(label)
                    continue
                seen[label]=dict(entry=entry,mapped_bytes=size,sha256=digest)
                (out/f'counter_work-{label}.bin').write_bytes(raw)
                (out/f'counter_work-{label}.asm').write_text(gdb.execute(f'disassemble /r {entry},{entry+size}',to_string=True))
                print('JIT_CAPTURE',label,hex(entry),size,digest)
            (out/'counter_work-mappings.json').write_text(json.dumps(dict(mappings=seen,unchanged_rechecks=checks),indent=2)+'\n')
        except Exception as exc:
            print('JIT_CAPTURE_ERROR',str(exc))
        return False
Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:550',internal=True)
end
run test/bench_root_workloads.nut --iterations=1003 --warmups=1
python
assert set(seen)=={'primary','alternate'}, seen
assert 'primary' in checks and 'alternate' in checks, checks
print('JIT_CAPTURE_VERIFIED both immutable loop mappings')
end
