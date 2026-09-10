# Fresh V27 profile and tail evidence

Full56 speedup versus the frozen audit: 1.878306123×.

Flat profile percentages describe each measured process. They are not direct
before/after speedups, and native addresses from different processes are not
joined. All seven captures report zero lost samples.

## Largest runtime ratios versus node

| Workload | SQGI ns/op | Engine ns/op | Ratio |
|---|---:|---:|---:|
| kernels-seed17/object_member_write_fallback | 472.331 | 12.627 | 37.406× |
| members/buffers_31 | 371.280 | 12.317 | 30.144× |
| members/buffers_7 | 372.005 | 12.394 | 30.014× |
| methods/publish_class | 368.660 | 13.562 | 27.183× |
| methods/publish_table | 359.120 | 13.374 | 26.852× |
| methods/transfer_class | 417.560 | 18.134 | 23.026× |
| methods/transfer_table | 403.140 | 17.964 | 22.442× |
| methods/publish_mixed | 369.865 | 20.883 | 17.711× |
| owners/class_owners_5 | 123.155 | 8.180 | 15.056× |
| owners/class_owners_19 | 122.745 | 8.216 | 14.939× |
| owners/class_owners_2 | 122.825 | 8.346 | 14.717× |
| owners/table_owners_19 | 123.045 | 8.372 | 14.697× |

## Largest runtime ratios versus gjs

| Workload | SQGI ns/op | Engine ns/op | Ratio |
|---|---:|---:|---:|
| members/buffers_31 | 371.280 | 18.270 | 20.322× |
| members/buffers_7 | 372.005 | 20.385 | 18.249× |
| methods/transfer_class | 417.560 | 31.265 | 13.356× |
| methods/publish_class | 368.660 | 28.250 | 13.050× |
| methods/publish_table | 359.120 | 28.105 | 12.778× |
| methods/transfer_table | 403.140 | 31.945 | 12.620× |
| kernels-seed17/math_intrinsic | 111.194 | 9.831 | 11.310× |
| roots-seed17/root_integer_result | 65.335 | 6.085 | 10.737× |
| kernels-seed17/object_member_write_fallback | 472.331 | 46.894 | 10.072× |
| kernels-seed17/dynamic_member | 724.069 | 78.950 | 9.171× |
| roots-seed17/receiver_integer | 54.325 | 5.975 | 9.092× |
| floats/pressure_8 | 93.730 | 10.410 | 9.004× |

## kernels: leading V27 flat symbols

- 23.07% `SQVM::Execute` (sqgi)
- 10.19% `0x0000ffffab564164` ([JIT] tid 711019)
- 6.56% `0x0000ffffab563164` ([JIT] tid 711019)
- 4.82% `0x0000ffffab562164` ([JIT] tid 711019)
- 3.65% `0x0000ffffab561230` ([JIT] tid 711019)
- 2.99% `SQTable::Get` (sqgi)
- 1.69% `0x0000ffffab5611c0` ([JIT] tid 711019)
- 1.68% `0x0000ffffab561244` ([JIT] tid 711019)

## applications: leading V27 flat symbols

- 15.83% `SQVM::Execute` (sqgi)
- 13.06% `SQJitWriteLog::RecordMember` (sqgi)
- 5.37% `sqjit_a64_root_fallback_safe` (sqgi)
- 5.03% `sqjit_a64_helper_array_get_object` (sqgi)
- 4.85% `sqjit_a64_helper_member_set_integer_logged` (sqgi)
- 4.38% `SQTable::Get` (sqgi)
- 3.35% `sqjit_a64_borrow_member_ptr_value` (sqgi)
- 3.23% `SQJitWriteLog::CanRelease` (sqgi)

## roots: leading V27 flat symbols

- 14.52% `SQJitWriteLog::CanRelease` (sqgi)
- 13.00% `sqjit_a64_helper_member_set_integer_logged` (sqgi)
- 12.78% `sqjit_a64_borrow_member_ptr_value` (sqgi)
- 6.76% `sqjit_a64_resolve_root_store_slot` (sqgi)
- 6.57% `SQJitWriteLog::RecordMember` (sqgi)
- 5.65% `sqjit_a64_helper_member_closure_guard` (sqgi)
- 5.36% `sqjit_a64_helper_instance_field_set_integer_logged` (sqgi)
- 5.20% `sqjit_a64_helper_member_set_reference_logged` (sqgi)

## members: leading V27 flat symbols

- 22.13% `SQVM::Execute` (sqgi)
- 8.33% `sqjit_a64_precise_step<(SQOpcode)9, true>` (sqgi)
- 4.98% `SQJitWriteLog::CanReleaseInContext` (sqgi)
- 4.00% `sqjit_a64_precise_step<(SQOpcode)1, false>` (sqgi)
- 3.51% `sqjit_a64_precise_step<(SQOpcode)14, false>` (sqgi)
- 2.51% `sqjit_try_execute_current` (sqgi)
- 2.37% `sqjit_a64_precise_step<(SQOpcode)13, false>` (sqgi)
- 2.21% `sqjit_a64_precise_step<(SQOpcode)8, false>` (sqgi)

## owners: leading V27 flat symbols

- 14.03% `sqjit_a64_precise_step<(SQOpcode)4, false>` (sqgi)
- 2.77% `SQJitWriteLog::CanReleaseInContext` (sqgi)
- 2.16% `0x0000ffff95de96c0` ([JIT] tid 711268)
- 1.96% `0x0000ffff95de8498` ([JIT] tid 711268)
- 1.73% `0x0000ffff95de84e4` ([JIT] tid 711268)
- 1.61% `0x0000ffff95de93c0` ([JIT] tid 711268)
- 1.58% `0x0000ffff95de9aac` ([JIT] tid 711268)
- 1.47% `0x0000ffff95de911c` ([JIT] tid 711268)

## methods: leading V27 flat symbols

- 48.88% `SQVM::Execute` (sqgi)
- 5.23% `sqjit_try_execute_current` (sqgi)
- 3.53% `sqjit_try_execute_current_loop` (sqgi)
- 3.08% `SQVM::LeaveFrame` (sqgi)
- 3.04% `sqjit_try_execute_closure` (sqgi)
- 2.61% `SQVM::StartCall` (sqgi)
- 2.31% `SQVM::Return` (sqgi)
- 1.88% `SQVM::ObjCmp` (sqgi)

## floats: leading V27 flat symbols

- 8.60% `0x0000ffff8f62990c` ([JIT] tid 711353)
- 6.76% `0x0000ffff8f629838` ([JIT] tid 711353)
- 6.74% `0x0000ffff8f625164` ([JIT] tid 711353)
- 6.13% `0x0000ffff8f629414` ([JIT] tid 711353)
- 5.52% `0x0000ffff8f6262a0` ([JIT] tid 711353)
- 4.92% `0x0000ffff8f629764` ([JIT] tid 711353)
- 4.91% `0x0000ffff8f6281e4` ([JIT] tid 711353)
- 4.30% `0x0000ffff8f629690` ([JIT] tid 711353)

## Follow-up checks

Confirm the successful emission tier and native helper execution for buffer
workloads before applying the shared-helper draft. Near-full code and absence
of an owning-store opcode alone do not prove the selected tier or a speedup.
Methods still need parent-loop/call overhead analysis; owner DLOAD is a separate
lead. Preserve canonical-frame ownership and exact-exit semantics in every path.
