| Suite | Cases | SQGI / Node | SQGI / GJS | SQGI / committed |
| --- | ---: | ---: | ---: | ---: |
| kernels-seed17 | 15 | 4.90× | 4.18× | 1.01× |
| applications-seed17 | 8 | 6.76× | 4.10× | 0.91× |
| roots-seed17 | 4 | 18.00× | 10.46× | 0.52× |
| members | 6 | 12.92× | 9.91× | 1.01× |
| owners | 10 | 106.34× | 50.77× | 2.98× |
| methods | 6 | 57.94× | 29.03× | 2.58× |
| floats | 7 | 9.68× | 7.73× | 0.79× |

| Aggregate | SQGI / Node | SQGI / GJS |
| --- | ---: | ---: |
| geomean | 15.36× | 10.13× |
| p90 | 99.79× | 51.09× |
| maximum | 118.54× | 56.16× |

| Workload | SQGI ns | Node ns | GJS ns | / Node | / GJS | SQGI range / median |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| kernels-seed17/direct_call | 34.76 | 6.92 | 10.84 | 5.02× | 3.21× | 0.5% |
| kernels-seed17/branch_call | 32.52 | 4.90 | 7.15 | 6.64× | 4.55× | 3.2% |
| kernels-seed17/float_call | 21.42 | 2.67 | 9.66 | 8.02× | 2.22× | 2.1% |
| kernels-seed17/numeric_loop | 23.21 | 7.58 | 12.98 | 3.06× | 1.79× | 0.5% |
| kernels-seed17/vector | 387.79 | 598.03 | 536.44 | 0.65× | 0.72× | 1.6% |
| kernels-seed17/dynamic_member | 1541.46 | 110.73 | 80.54 | 13.92× | 19.14× | 1.2% |
| kernels-seed17/dynamic_key_get_set | 186.14 | 63.24 | 28.45 | 2.94× | 6.54× | 0.7% |
| kernels-seed17/object_member_write_fallback | 477.01 | 12.89 | 47.77 | 37.02× | 9.99× | 0.4% |
| kernels-seed17/array_append | 115.89 | 29.99 | 17.50 | 3.86× | 6.62× | 5.0% |
| kernels-seed17/array_write | 37.44 | 4.58 | 6.10 | 8.18× | 6.14× | 1.2% |
| kernels-seed17/array_read | 7.56 | 2.66 | 3.57 | 2.84× | 2.12× | 1.6% |
| kernels-seed17/array_float | 7.21 | 2.22 | 3.11 | 3.25× | 2.32× | 1.2% |
| kernels-seed17/math_intrinsic | 205.37 | 41.60 | 9.99 | 4.94× | 20.56× | 0.8% |
| kernels-seed17/math_variable | 221.97 | 156.86 | 109.27 | 1.42× | 2.03× | 0.8% |
| kernels-seed17/matrix | 319.14 | 23.05 | 67.21 | 13.84× | 4.75× | 0.5% |
| applications-seed17/route_balanced | 53.53 | 6.19 | 6.52 | 8.65× | 8.21× | 2.3% |
| applications-seed17/route_skewed | 52.15 | 5.85 | 6.79 | 8.92× | 7.67× | 3.5% |
| applications-seed17/pricing_events | 58.99 | 11.24 | 17.60 | 5.25× | 3.35× | 1.4% |
| applications-seed17/filter_stream | 56.20 | 5.10 | 9.72 | 11.02× | 5.78× | 1.4% |
| applications-seed17/records_64 | 132.72 | 15.88 | 39.39 | 8.36× | 3.37× | 5.6% |
| applications-seed17/records_4096 | 260.66 | 20.57 | 43.91 | 12.67× | 5.94× | 18.3% |
| applications-seed17/word_count | 268.01 | 75.20 | 126.21 | 3.56× | 2.12× | 0.7% |
| applications-seed17/graph_walk | 12.54 | 4.84 | 8.17 | 2.59× | 1.54× | 7.0% |
| roots-seed17/receiver_integer | 59.53 | 4.55 | 6.04 | 13.09× | 9.86× | 0.8% |
| roots-seed17/root_integer | 337.57 | 6.74 | 19.04 | 50.11× | 17.73× | 3.2% |
| roots-seed17/root_reference | 102.29 | 7.29 | 16.30 | 14.03× | 6.27× | 2.2% |
| roots-seed17/root_integer_result | 66.50 | 5.83 | 6.08 | 11.40× | 10.93× | 0.8% |
| members/table_events_97 | 498.56 | 77.12 | 71.35 | 6.46× | 6.99× | 0.2% |
| members/class_events_97 | 447.50 | 75.28 | 53.71 | 5.94× | 8.33× | 0.4% |
| members/buffers_7 | 435.89 | 12.55 | 20.82 | 34.72× | 20.94× | 0.3% |
| members/buffers_31 | 435.51 | 12.49 | 18.58 | 34.86× | 23.44× | 0.4% |
| members/calibrate_17 | 85.41 | 8.75 | 15.22 | 9.76× | 5.61× | 1.0% |
| members/calibrate_67 | 86.29 | 8.41 | 14.64 | 10.26× | 5.89× | 1.5% |
| owners/table_owners_1 | 906.01 | 9.08 | 17.73 | 99.79× | 51.09× | 4.5% |
| owners/table_owners_2 | 865.74 | 8.91 | 17.48 | 97.21× | 49.51× | 7.3% |
| owners/table_owners_5 | 845.10 | 8.48 | 18.02 | 99.66× | 46.91× | 5.7% |
| owners/table_owners_19 | 844.42 | 8.51 | 18.20 | 99.24× | 46.41× | 7.5% |
| owners/table_owners_257 | 878.77 | 8.95 | 19.65 | 98.22× | 44.71× | 0.9% |
| owners/class_owners_1 | 1006.93 | 8.49 | 17.93 | 118.54× | 56.16× | 2.4% |
| owners/class_owners_2 | 936.46 | 8.46 | 17.43 | 110.68× | 53.73× | 7.4% |
| owners/class_owners_5 | 944.11 | 8.30 | 18.12 | 113.78× | 52.09× | 6.7% |
| owners/class_owners_19 | 961.93 | 8.32 | 18.18 | 115.64× | 52.90× | 5.1% |
| owners/class_owners_257 | 978.82 | 8.61 | 17.60 | 113.71× | 55.62× | 1.5% |
| methods/transfer_table | 1239.11 | 18.10 | 32.58 | 68.46× | 38.04× | 0.9% |
| methods/transfer_class | 1315.10 | 18.37 | 31.75 | 71.59× | 41.41× | 1.2% |
| methods/transfer_mixed | 1313.08 | 29.57 | 62.29 | 44.40× | 21.08× | 1.1% |
| methods/publish_table | 858.61 | 13.56 | 28.51 | 63.31× | 30.11× | 1.5% |
| methods/publish_class | 894.92 | 13.71 | 28.74 | 65.28× | 31.14× | 1.8% |
| methods/publish_mixed | 894.50 | 21.26 | 46.52 | 42.08× | 19.23× | 1.6% |
| floats/filter | 23.91 | 2.48 | 3.91 | 9.64× | 6.12× | 2.0% |
| floats/channels_4 | 79.89 | 5.49 | 4.70 | 14.55× | 17.00× | 1.3% |
| floats/pressure_8 | 155.00 | 10.42 | 10.60 | 14.88× | 14.62× | 1.8% |
| floats/integration | 37.94 | 7.85 | 6.00 | 4.83× | 6.32× | 2.6% |
| floats/retained_input | 45.50 | 4.27 | 4.12 | 10.66× | 11.03× | 3.0% |
| floats/branching | 31.98 | 6.55 | 12.96 | 4.88× | 2.47× | 2.5% |
| floats/helper_control | 55.84 | 3.68 | 8.88 | 15.19× | 6.28× | 1.5% |
