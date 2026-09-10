set pagination off
set debuginfod enabled off
set environment SQGI_JIT_PRECISE_EXITS 1
set confirm off
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_TRACE 0
python
import gdb, pathlib, re, json
out = pathlib.Path('/tmp/sqgi-v25-self-publication-study/profiles')
seen = set()
class Capture(gdb.Breakpoint):
    def __init__(self, spec, mode):
        super().__init__(spec, internal=True)
        self.mode=mode
    def stop(self):
        try:
            name=gdb.parse_and_eval('(char*)proto->_name._unVal.pString->_val').string()
            if name not in ['recycle','transfer','publish','table_apply','apply']: return False
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
            instructions=[]
            count=int(gdb.parse_and_eval('proto->_ninstructions'))
            for j in range(count):
                inst=gdb.parse_and_eval(f'proto->_instructions[{j}]')
                instructions.append({k:int(inst[k]) for k in ['op','_arg0','_arg1','_arg2','_arg3']})
            literals=[]
            for j in range(int(gdb.parse_and_eval('proto->_nliterals'))):
                typ=gdb.parse_and_eval(f'proto->_literals[{j}]._type')
                value=gdb.parse_and_eval(f'(char*)proto->_literals[{j}]._unVal.pString->_val').string() if int(typ)==int(gdb.parse_and_eval('OT_STRING')) else str(typ)
                literals.append(value)
            (out/f'{name}-bytecode.json').write_text(json.dumps(dict(instructions=instructions,literals=literals),indent=2)+'\n')
            print('JIT_CAPTURE',name,self.mode,hex(entry),size)
        except Exception as exc:
            print('JIT_CAPTURE_ERROR',self.mode,str(exc))
        return False
capture = Capture('/home/sam/Programming/sqgi/Squirrel3/squirrel/jit/sqjit.cpp:610','frame')
print('JIT_CAPTURE_BREAKPOINT',capture.number)

end
run test/bench_member_owners.nut --iterations=1003 --warmups=1
run test/bench_member_methods.nut --iterations=1003 --warmups=1
run test/bench_member_workloads.nut --iterations=1003 --warmups=1
python
assert {name for name,mode in seen} == {'recycle','transfer','publish','table_apply','apply'},seen
print('JIT_CAPTURE_VERIFIED five canonical-frame functions')
end
