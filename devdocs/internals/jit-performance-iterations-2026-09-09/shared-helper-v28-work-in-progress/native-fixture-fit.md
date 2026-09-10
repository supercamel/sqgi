The first56-add fixture executed correctly but selected helper-only tier7,
so its new native-coverage assertion correctly failed. A34-function size sweep
identified23–25adds as actual shared tier6,26adds as shared tier3. The test now
uses24adds (7896bytes), whose unshared tier6 attempts exhaust the8192-byte buffer.
This checks the new route rather than weakening the shared-call/native-arithmetic
assertion. Both original failure and all coarse/refined probe artifacts remain.
Only the native test count changed; the backend implementation is unchanged.
