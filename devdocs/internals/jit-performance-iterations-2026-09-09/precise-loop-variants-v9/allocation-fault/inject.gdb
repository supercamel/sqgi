set pagination off
set confirm off
set debuginfod enabled off
set environment LD_PRELOAD /tmp/sqgi-precise-loop-variants-study/allocation-fault/throw_new.so
set environment SQGI_JIT 1
set environment SQGI_JIT_THRESHOLD 1
set environment SQGI_JIT_PRECISE_EXITS 1
set environment SQGI_JIT_TRACE stats
python
import gdb
injected = False
class Inject(gdb.Breakpoint):
    def stop(self):
        global injected
        if injected: return False
        if int(gdb.parse_and_eval('destination')) == 0: return False
        gdb.execute('set variable sqgi_fail_next_new = 1')
        injected = True
        print('ALTERNATE_NEW_FAULT_ARMED')
        return False
Inject('sqjit_backend_compile_loop',internal=True)
end
run test/bench_root_workloads.nut --iterations=1003 --warmups=1
python
print('ALTERNATE_NEW_FAULT_INJECTED',injected)
end
