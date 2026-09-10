set pagination off
set confirm off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_TRACE 0
python
import gdb, pathlib, re
out = pathlib.Path('/tmp/sqgi-a64-guards-study/profiles')
seen = set()
class Capture(gdb.Breakpoint):
    def __init__(self, spec, mode):
        super().__init__(spec, internal=True)
        self.mode=mode
    def stop(self):
        try:
            name=gdb.parse_and_eval('(char*)proto->_name._unVal.pString->_val').string()
            if name not in ['numeric_loop_kernel','float_call_kernel','direct_call_kernel','recycle','math_intrinsic_kernel','matrix_kernel']: return False
            key=(name,self.mode)
            if key in seen: return False
            code=gdb.parse_and_eval('proto->_jit->_entry->_code' if self.mode=='frame' else 'proto->_jit->_loop_code')
            entry=int(code['entry']); size=int(code['size'])
            if not entry or not size: return False
            seen.add(key)
            raw=bytes(gdb.selected_inferior().read_memory(entry,size))
            (out/f'{name}-{self.mode}.bin').write_bytes(raw)
            asm=gdb.execute(f'disassemble /r {entry},{entry+size}',to_string=True)
            (out/f'{name}-{self.mode}.asm').write_text(asm)
            print('JIT_CAPTURE',name,self.mode,hex(entry),size)
        except Exception as exc:
            print('JIT_CAPTURE_ERROR',self.mode,str(exc))
        return False
Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:120','frame')
Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:445','loop')
end
run
