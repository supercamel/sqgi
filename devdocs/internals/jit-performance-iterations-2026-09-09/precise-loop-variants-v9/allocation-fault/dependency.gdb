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
target=0
injected=False
reset_live=False
class Find(gdb.Breakpoint):
    def stop(self):
        global target
        dest=int(gdb.parse_and_eval('destination'))
        if dest and not target: target=dest
        return False
class Inject(gdb.Breakpoint):
    def stop(self):
        global injected
        if not target or injected or int(gdb.parse_and_eval('this')) != target: return False
        gdb.execute('set variable sqgi_fail_next_new = 1')
        injected=True
        print('ALTERNATE_DEPENDENCY_FAULT_ARMED')
        return False
class Reset(gdb.Breakpoint):
    def stop(self):
        global reset_live
        if injected and not reset_live and int(gdb.parse_and_eval('this'))==target and int(gdb.parse_and_eval('this->entry')):
            reset_live=True
            print('ALTERNATE_INSTALLED_MAPPING_CLEANED')
        return False
Find('sqjit_backend_compile_loop',internal=True)
Inject('SQJitCode::RetainWeakReference',internal=True)
Reset('SQJitCode::Reset',internal=True)
end
run test/bench_root_workloads.nut --iterations=1003 --warmups=1
python
print('ALTERNATE_DEPENDENCY_FAULT_VERIFIED',injected,reset_live)
end
