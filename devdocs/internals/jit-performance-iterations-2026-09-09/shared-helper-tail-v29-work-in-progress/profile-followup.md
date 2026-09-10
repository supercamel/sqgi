# Fresh V29 profile and tail evidence

Full56 speedup versus the frozen audit: 1.882226095×.

Flat profile percentages describe each measured process. They are not direct
before/after speedups, and native addresses from different processes are not
joined. All seven captures report zero lost samples.

## Largest runtime ratios versus node

| Workload | SQGI ns/op | Engine ns/op | Ratio |
|---|---:|---:|---:|
| kernels-seed17/object_member_write_fallback | 472.813 | 12.616 | 37.476× |
| methods/publish_class | 369.500 | 13.669 | 27.032× |
| members/buffers_31 | 333.570 | 12.348 | 27.015× |
| members/buffers_7 | 333.740 | 12.415 | 26.883× |
| methods/publish_table | 359.860 | 13.405 | 26.846× |
| methods/transfer_class | 419.185 | 17.641 | 23.762× |
| methods/transfer_table | 405.210 | 17.772 | 22.800× |
| methods/publish_mixed | 371.500 | 20.938 | 17.742× |
| owners/class_owners_5 | 123.510 | 8.200 | 15.062× |
| owners/class_owners_19 | 123.030 | 8.177 | 15.046× |
| owners/class_owners_2 | 123.245 | 8.353 | 14.754× |
| owners/table_owners_19 | 123.315 | 8.379 | 14.716× |

## Largest runtime ratios versus gjs

| Workload | SQGI ns/op | Engine ns/op | Ratio |
|---|---:|---:|---:|
| members/buffers_31 | 333.570 | 18.380 | 18.149× |
| members/buffers_7 | 333.740 | 20.495 | 16.284× |
| methods/transfer_class | 419.185 | 31.340 | 13.375× |
| methods/publish_class | 369.500 | 28.210 | 13.098× |
| methods/publish_table | 359.860 | 28.200 | 12.761× |
| methods/transfer_table | 405.210 | 32.085 | 12.629× |
| kernels-seed17/math_intrinsic | 111.294 | 9.850 | 11.299× |
| roots-seed17/root_integer_result | 65.625 | 6.110 | 10.741× |
| kernels-seed17/object_member_write_fallback | 472.813 | 46.919 | 10.077× |
| kernels-seed17/dynamic_member | 725.525 | 78.894 | 9.196× |
| roots-seed17/receiver_integer | 54.540 | 5.980 | 9.120× |
| floats/pressure_8 | 93.905 | 10.470 | 8.969× |

## kernels: leading V29 flat symbols

- 22.22% `SQVM::Execute` (sqgi)
- 9.85% `0x0000ffffbab32164` ([JIT] tid 737714)
- 6.42% `0x0000ffffbab31164` ([JIT] tid 737714)
- 4.92% `0x0000ffffbab30164` ([JIT] tid 737714)
- 3.37% `0x0000ffffbab2f230` ([JIT] tid 737714)
- 3.00% `SQTable::Get` (sqgi)
- 2.20% `0x0000ffffbab2f1c0` ([JIT] tid 737714)
- 1.69% `sqjit_number_conversion_guard` (sqgi)

## applications: leading V29 flat symbols

- 15.80% `SQVM::Execute` (sqgi)
- 13.92% `SQJitWriteLog::RecordMember` (sqgi)
- 5.97% `sqjit_a64_helper_array_get_object` (sqgi)
- 5.32% `sqjit_a64_borrow_member_ptr_value` (sqgi)
- 4.80% `sqjit_a64_root_fallback_safe` (sqgi)
- 3.66% `SQTable::Get` (sqgi)
- 3.38% `sqjit_a64_helper_member_set_integer_logged` (sqgi)
- 3.21% `SQJitWriteLog::CanRelease` (sqgi)

## roots: leading V29 flat symbols

- 15.28% `sqjit_a64_borrow_member_ptr_value` (sqgi)
- 11.80% `SQJitWriteLog::RecordMember` (sqgi)
- 10.51% `SQJitWriteLog::CanRelease` (sqgi)
- 9.33% `sqjit_a64_helper_member_set_integer_logged` (sqgi)
- 7.78% `sqjit_a64_helper_member_set_reference_logged` (sqgi)
- 7.26% `sqjit_a64_resolve_root_store_slot` (sqgi)
- 4.84% `sqjit_a64_helper_member_closure_guard` (sqgi)
- 4.58% `sqjit_a64_helper_instance_field_set_integer_logged` (sqgi)

## members: leading V29 flat symbols

- 22.78% `SQVM::Execute` (sqgi)
- 5.71% `sqjit_a64_precise_step<(SQOpcode)1, false>` (sqgi)
- 3.92% `sqjit_a64_precise_step<(SQOpcode)14, false>` (sqgi)
- 3.83% `SQJitWriteLog::CanReleaseInContext` (sqgi)
- 2.76% `sqjit_try_execute_current` (sqgi)
- 2.73% `sqjit_a64_precise_step<(SQOpcode)8, false>` (sqgi)
- 2.38% `sqjit_a64_precise_step<(SQOpcode)13, true>` (sqgi)
- 2.30% `sqjit_a64_precise_step<(SQOpcode)4, false>` (sqgi)

## owners: leading V29 flat symbols

- 12.41% `sqjit_a64_precise_step<(SQOpcode)4, false>` (sqgi)
- 2.85% `0x0000ffff986d76c0` ([JIT] tid 737933)
- 2.65% `0x0000ffff986d6498` ([JIT] tid 737933)
- 1.96% `0x0000ffff986d64e4` ([JIT] tid 737933)
- 1.85% `0x0000ffff986d7a90` ([JIT] tid 737933)
- 1.62% `SQJitWriteLog::CanReleaseInContext` (sqgi)
- 1.27% `0x0000ffff986d7a80` ([JIT] tid 737933)
- 1.27% `0x0000ffff986d7228` ([JIT] tid 737933)

## methods: leading V29 flat symbols

- 50.28% `SQVM::Execute` (sqgi)
- 5.13% `sqjit_try_execute_current` (sqgi)
- 3.83% `sqjit_try_execute_current_loop` (sqgi)
- 3.22% `SQVM::Return` (sqgi)
- 2.43% `SQVM::StartCall` (sqgi)
- 2.13% `SQVM::LeaveFrame` (sqgi)
- 2.07% `SQVM::ObjCmp` (sqgi)
- 2.05% `sqjit_try_execute_closure` (sqgi)

## floats: leading V29 flat symbols

- 7.36% `0x0000ffff8ca3d838` ([JIT] tid 738005)
- 7.35% `0x0000ffff8ca3d4e8` ([JIT] tid 738005)
- 6.11% `0x0000ffff8ca39164` ([JIT] tid 738005)
- 5.52% `0x0000ffff8ca3d690` ([JIT] tid 738005)
- 5.52% `0x0000ffff8ca3d414` ([JIT] tid 738005)
- 4.29% `0x0000ffff8ca3c1e4` ([JIT] tid 738005)
- 4.13% `0x0000ffff8ca3f164` ([JIT] tid 738005)
- 3.68% `0x0000ffff8ca3b198` ([JIT] tid 738005)

## Follow-up checks

The buffer helper count remains 1244 across four successful native calls;
the body is unchanged under pointer normalization and the shared tail is now
24 bytes. Inspect actual runtime changes and remaining helper/VM costs.
Parent-loop/call coverage remains a larger structural gap. No addresses from
different processes are joined, and PC fractions are not speedup estimates.
