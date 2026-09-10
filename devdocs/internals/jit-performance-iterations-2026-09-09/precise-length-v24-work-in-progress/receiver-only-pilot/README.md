# Receiver-only pilot, superseded

This snapshot passed both release and both strict sanitizer 100-test runs plus
both 41-case holdout runs. The subsequent callee-alias witness exposed another
private-compiler ordering defect; those green runs did not cover that alias.
There are no accepted performance results for this pilot. Root development logs
without the callee revision prefix describe this snapshot.
