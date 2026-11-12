local result = import("probe.nut").check()
result.token <- vargv[0]
print(sqgi.json.stringify(result) + "\n")
