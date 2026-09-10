set pagination off
set confirm off
set breakpoint pending on
set debuginfod enabled off
set environment LD_PRELOAD /tmp/sqgi-v24-allocation-fault/throw_new.so
python
import gdb
armed=False
class Inject(gdb.Breakpoint):
    def stop(self):
        global armed
        if armed or not bool(gdb.parse_and_eval('allow_intrinsics')): return False
        gdb.execute('set variable sqgi_fail_next_new = 1')
        armed=True
        print('EXPANDED_NEW_FAULT_ARMED')
        return False
Inject('sqjit_a64_compile_precise',internal=True)
end
run new
python
print('EXPANDED_NEW_FAULT_INJECTED',armed)
assert armed
end
