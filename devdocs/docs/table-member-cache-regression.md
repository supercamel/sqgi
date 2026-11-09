# Table member lookup after growth

Adding a fourth field to a table could make a cached nested member lookup read
an unrelated slot after rehashing. The interpreter and JIT shared the affected
cache, so disabling JIT did not avoid the bug.

The fix already landed in commit
`953b5b4e563c28b16b84312ac2a3686e47fa658c`. The former layout-version
guard could survive a rehash: `Rehash` restored the old version, and the final
`NewSlot` call replaced the already-inserted key without incrementing it.
`SQTable::GetCachedSlot` now checks the current slot bounds and requested key
before accepting a cached index. A moved key falls back to normal lookup.

`test/test_table_member_cache.nut` preserves the reported insertion/read sequence
and exact keys, since their hash placement triggers the stale lookup. It also
checks method lookup, further growth and replacement. CTest runs it with JIT
disabled and with a low JIT threshold:

```sh
cmake -S . -B build
cmake --build build --target sqgi-bin sqgi_test_cpp_sqmembercache
ctest --test-dir build -R 'table_member_cache|sqmembercache' --output-on-failure
```

To qualify an installed or packaged runtime, run that actual executable:

```sh
SQGI_JIT=0 /path/to/sqgi test/test_table_member_cache.nut
SQGI_JIT=1 SQGI_JIT_THRESHOLD=1 /path/to/sqgi test/test_table_member_cache.nut
```

Success prints `table member cache tests passed` and exits zero. Rebuild and
reinstall a runtime containing the fix if either invocation fails; rebuilding
the checkout alone does not update an installed executable.
