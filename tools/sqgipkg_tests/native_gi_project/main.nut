local SqHello = import("SqHello", "1.0")

local sum = SqHello.add(7, 35)
if (sum != 42) {
    print("unexpected native sum: " + sum + "\n")
    return 10
}

local greeting = SqHello.greet("SQGI")
if (greeting != "Hello, SQGI from native GI") {
    print("unexpected native greeting: " + greeting + "\n")
    return 11
}

print(greeting + "; sum=" + sum + "\n")
return 0
