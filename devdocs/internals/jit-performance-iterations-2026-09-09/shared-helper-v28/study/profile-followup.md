# Fresh V28 profile and tail evidence

Full56 speedup versus the frozen audit: 1.881308282×.

Flat profile percentages describe each measured process. They are not direct
before/after speedups, and native addresses from different processes are not
joined. All seven captures report zero lost samples.

## Largest runtime ratios versus node

| Workload | SQGI ns/op | Engine ns/op | Ratio |
|---|---:|---:|---:|
| kernels-seed17/object_member_write_fallback | 472.481 | 12.609 | 37.472× |
| members/buffers_31 | 348.790 | 12.340 | 28.264× |
| members/buffers_7 | 348.040 | 12.394 | 28.081× |
| methods/publish_class | 369.900 | 13.662 | 27.076× |
| methods/publish_table | 359.875 | 13.395 | 26.867× |
| methods/transfer_class | 417.355 | 17.641 | 23.658× |
| methods/transfer_table | 403.115 | 17.910 | 22.508× |
| methods/publish_mixed | 370.575 | 20.905 | 17.727× |
| owners/class_owners_19 | 123.585 | 8.171 | 15.125× |
| owners/class_owners_5 | 123.220 | 8.225 | 14.981× |
| owners/table_owners_19 | 123.610 | 8.368 | 14.772× |
| owners/class_owners_2 | 123.170 | 8.353 | 14.745× |

## Largest runtime ratios versus gjs

| Workload | SQGI ns/op | Engine ns/op | Ratio |
|---|---:|---:|---:|
| members/buffers_31 | 348.790 | 18.295 | 19.065× |
| members/buffers_7 | 348.040 | 20.500 | 16.978× |
| methods/transfer_class | 417.355 | 31.295 | 13.336× |
| methods/publish_class | 369.900 | 28.260 | 13.089× |
| methods/publish_table | 359.875 | 28.175 | 12.773× |
| methods/transfer_table | 403.115 | 32.050 | 12.578× |
| kernels-seed17/math_intrinsic | 111.319 | 9.850 | 11.301× |
| roots-seed17/root_integer_result | 65.315 | 6.090 | 10.725× |
| kernels-seed17/object_member_write_fallback | 472.481 | 46.925 | 10.069× |
| kernels-seed17/dynamic_member | 724.981 | 79.000 | 9.177× |
| roots-seed17/receiver_integer | 54.380 | 6.000 | 9.063× |
| floats/pressure_8 | 93.815 | 10.400 | 9.021× |

## kernels: leading V28 flat symbols

- 23.31% `SQVM::Execute` (sqgi)
- 10.16% `0x0000ffff89b62164` ([JIT] tid 724780)
- 6.19% `0x0000ffff89b61164` ([JIT] tid 724780)
- 4.55% `0x0000ffff89b60164` ([JIT] tid 724780)
- 4.08% `0x0000ffff89b5f230` ([JIT] tid 724780)
- 2.34% `SQTable::Get` (sqgi)
- 2.01% `sqjit_number_conversion_guard` (sqgi)
- 1.74% `0x0000ffff89b5f1c0` ([JIT] tid 724780)

## applications: leading V28 flat symbols

- 16.62% `SQVM::Execute` (sqgi)
- 14.51% `SQJitWriteLog::RecordMember` (sqgi)
- 5.15% `sqjit_a64_helper_member_set_integer_logged` (sqgi)
- 5.04% `sqjit_a64_helper_array_get_object` (sqgi)
- 5.02% `sqjit_a64_root_fallback_safe` (sqgi)
- 4.87% `SQTable::Get` (sqgi)
- 3.24% `sqjit_a64_borrow_member_ptr_value` (sqgi)
- 2.58% `SQJitWriteLog::CanRelease` (sqgi)

## roots: leading V28 flat symbols

- 15.37% `SQJitWriteLog::RecordMember` (sqgi)
- 13.39% `sqjit_a64_borrow_member_ptr_value` (sqgi)
- 12.03% `sqjit_a64_helper_member_set_integer_logged` (sqgi)
- 10.62% `sqjit_a64_helper_member_closure_guard` (sqgi)
- 9.41% `sqjit_a64_helper_member_set_reference_logged` (sqgi)
- 7.36% `SQJitWriteLog::CanRelease` (sqgi)
- 5.75% `sqjit_a64_resolve_root_store_slot` (sqgi)
- 2.62% `0x0000ffffb81431c0` ([JIT] tid 724944)

## members: leading V28 flat symbols

- 23.66% `SQVM::Execute` (sqgi)
- 5.00% `sqjit_a64_precise_step<(SQOpcode)1, false>` (sqgi)
- 3.75% `sqjit_a64_precise_step<(SQOpcode)13, false>` (sqgi)
- 3.59% `SQJitWriteLog::CanReleaseInContext` (sqgi)
- 2.83% `sqjit_a64_precise_step<(SQOpcode)14, false>` (sqgi)
- 2.58% `sqjit_a64_precise_step<(SQOpcode)13, true>` (sqgi)
- 2.42% `sqjit_a64_precise_step<(SQOpcode)21, false>` (sqgi)
- 2.42% `SQVM::ObjCmp` (sqgi)

## owners: leading V28 flat symbols

- 10.73% `sqjit_a64_precise_step<(SQOpcode)4, false>` (sqgi)
- 2.40% `SQJitWriteLog::CanReleaseInContext` (sqgi)
- 1.97% `0x0000ffff87e94c7c` ([JIT] tid 725015)
- 1.74% `0x0000ffff87e956c0` ([JIT] tid 725015)
- 1.71% `0x0000ffff87e94498` ([JIT] tid 725015)
- 1.51% `0x0000ffff87e9436c` ([JIT] tid 725015)
- 1.51% `0x0000ffff87e9476c` ([JIT] tid 725015)
- 1.39% `0x0000ffff87e944e4` ([JIT] tid 725015)

## methods: leading V28 flat symbols

- 49.88% `SQVM::Execute` (sqgi)
- 6.01% `sqjit_try_execute_current` (sqgi)
- 3.20% `sqjit_try_execute_current_loop` (sqgi)
- 2.80% `sqjit_try_execute_closure` (sqgi)
- 2.80% `SQVM::Return` (sqgi)
- 2.49% `SQVM::StartCall` (sqgi)
- 2.42% `SQVM::LeaveFrame` (sqgi)
- 1.88% `sqjit_on_function_enter` (sqgi)

## floats: leading V28 flat symbols

- 8.56% `0x0000ffff9c95d90c` ([JIT] tid 725095)
- 7.34% `0x0000ffff9c95d690` ([JIT] tid 725095)
- 6.71% `0x0000ffff9c95c1e4` ([JIT] tid 725095)
- 5.51% `0x0000ffff9c95d764` ([JIT] tid 725095)
- 5.10% `0x0000ffff9c95f164` ([JIT] tid 725095)
- 4.28% `0x0000ffff9c95d838` ([JIT] tid 725095)
- 3.67% `0x0000ffff9c95d5bc` ([JIT] tid 725095)
- 3.66% `0x0000ffff9c95a2a0` ([JIT] tid 725095)

## Follow-up checks

The buffer probe confirms shared tier3 code and 528 fewer helper calls across
four successful native invocations. Inspect remaining helper and VM costs;
the shared trampoline may support an ABI-preserving tail branch as a separate
measured follow-up. Methods still need parent-loop/call overhead work, and
owner DLOAD remains a separate lead. No cross-process address join is used.
