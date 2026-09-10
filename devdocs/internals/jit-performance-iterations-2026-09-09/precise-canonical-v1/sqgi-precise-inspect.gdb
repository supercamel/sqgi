set pagination off
set confirm off
set debuginfod enabled off
set env SQGI_JIT=1
set env SQGI_JIT_THRESHOLD=1
set env SQGI_JIT_PRECISE_EXITS=1
python
class Dump(gdb.Breakpoint):
    def stop(self):
        p=gdb.parse_and_eval('proto')
        name=p['_name']['_unVal']['pString']['_val'].address.cast(gdb.lookup_type('char').pointer()).string()
        print('NAME',repr(name))
        if name.startswith('recycle'):
            for ip in range(int(p['_ninstructions'])):
                i=p['_instructions'][ip]
                print('BC',ip,'op',int(i['op']),int(i['_arg0']),int(i['_arg1']),int(i['_arg2']),int(i['_arg3']))
            self.enabled=False
        return False
Dump('sqjit_backend_compile_proto')
end
run test/bench_member_owners.nut --iterations=103 --warmups=1
