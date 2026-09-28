local kernel = sqgi.kernel.load("answer.sqk")
if (kernel.answer() != 42) throw "incorrect kernel result"
print("SCRIPT COMPLETE kernel\n")
