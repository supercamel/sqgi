# Chapter 5 - Classes and Inheritance

Functions group behavior. Classes group **behavior together with state**. They're how you model real-world things in code — a window, a player, a budget tracker — and they're also how SQGI talks to GObject types underneath.

## 5.1 Why classes?

If you only have a few related variables, you can use a table:

```squirrel
local player = { name = "ada", hp = 100 }
function damage(p, amount) { p.hp -= amount }
```

This works, but it has two problems:

1. The function `damage` is loose; there's no obvious link between it and the player table.
2. There's no template — every new player has to be built up manually.

A class fixes both:

```squirrel
class Player {
    name = null
    hp = 100

    constructor(name) {
        this.name = name
    }

    function damage(amount) {
        hp -= amount
    }
}

local p = Player("ada")
p.damage(20)
print(p.name + " hp=" + p.hp + "\n")  // ada hp=80
```

## 5.2 Anatomy

```squirrel
class Name {
    member1 = default_value   // instance field
    member2 = default_value

    constructor(args) {       // optional; runs when you create an instance
        this.member1 = args
    }

    function method(args) {   // a method
        return this.member1
    }
}
```

Read it as a recipe:

- **Fields** declare what each instance carries.
- **Constructor** initializes an instance.
- **Methods** are functions that have access to `this`, the current instance.

To create an instance, call the class as if it were a function: `Player("ada")`. Squirrel automatically allocates an instance, sets the fields to their default values, and runs the constructor.

## 5.3 `this`

Inside a method, `this` refers to the instance the method was called on:

```squirrel
class Account {
    balance = 0

    function deposit(amount) {
        this.balance += amount
        return this.balance
    }
}
```

You can usually omit `this.` when accessing fields and methods (Squirrel auto-resolves), but **writing it explicitly is clearer**, especially for newcomers, and avoids accidentally shadowing fields with parameters.

## 5.4 Inheritance with `extends`

A class can `extends` another class. The child inherits fields and methods, and can override or extend them.

```squirrel
class Animal {
    name = null

    constructor(name) {
        this.name = name
    }

    function speak() {
        print(this.name + " makes a sound\n")
    }
}

class Dog extends Animal {
    function speak() {
        print(this.name + " barks\n")
    }
}

local d = Dog("rex")
d.speak()  // rex barks
```

If `Dog` doesn't define a constructor, the parent's is used.

## 5.5 Calling the parent: `base`

Inside an overriding method, `base.method(...)` calls the parent's version of the method.

```squirrel
class LoudDog extends Dog {
    function speak() {
        base.speak()
        print("(loudly!)\n")
    }
}
```

This is useful when you want to extend behavior rather than replace it.

## 5.6 `instanceof`

Check at runtime whether an instance descends from a class:

```squirrel
local d = Dog("rex")
print(d instanceof Animal)  // true
print(d instanceof Dog)     // true
```

This is the right tool for branching based on type. It also works with built-in types like `sqgi.GError` (chapter 6).

## 5.7 Metamethods

Squirrel lets classes hook into language-level operations by defining methods with special names. The most important ones:

| Metamethod | When it runs |
|---|---|
| `_tostring` | When the instance is converted to a string |
| `_typeof` | What `typeof inst` returns |
| `_get(key)` | When you read `inst.something` and that slot doesn't exist |
| `_set(key, val)` | When you write to a slot that doesn't exist |
| `_add`, `_sub`, `_mul`, ... | Arithmetic operators |
| `_cmp(other)` | Comparison (`<`, `>`, `==`) |

Example: a custom string representation.

```squirrel
class Point {
    x = 0
    y = 0

    constructor(x, y) {
        this.x = x
        this.y = y
    }

    function _tostring() {
        return "(" + this.x + ", " + this.y + ")"
    }
}

local p = Point(3, 4)
print(p + "\n")  // (3, 4)
```

Concatenating `p` with a string triggers `_tostring()` automatically.

## 5.8 Static class members

A class itself is an object too. You can attach values to it directly:

```squirrel
class Config {
    static VERSION = "1.0"
    static DEFAULTS = { retries = 3 }
}

print(Config.VERSION + "\n")
```

Use `static` for constants and shared data that don't belong to any one instance.

## 5.9 A complete example: a budget tracker

```squirrel
class Budget {
    name = null
    entries = null
    limit = 0

    constructor(name, limit) {
        this.name = name
        this.entries = []
        this.limit = limit
    }

    function add(label, amount) {
        this.entries.append({ label = label, amount = amount })
    }

    function total() {
        local sum = 0
        foreach (e in this.entries) sum += e.amount
        return sum
    }

    function remaining() {
        return this.limit - this.total()
    }

    function _tostring() {
        return format("[%s] %d/%d", this.name, this.total(), this.limit)
    }
}

local b = Budget("groceries", 200)
b.add("apples", 5)
b.add("bread",  3)
print(b + "\n")                  // [groceries] 8/200
print("left: " + b.remaining() + "\n")
```

Things worth noticing:

- `entries = null` plus `this.entries = []` in the constructor. If you wrote `entries = []` directly as a default, **all instances would share the same array** because the default is evaluated once. Always initialize mutable defaults (`[]`, `{}`) inside the constructor.
- `_tostring` integrates with `print` automatically.
- The class fully encapsulates a single concept.

## 5.10 Looking ahead: classes and GObject

SQGI uses Squirrel classes to represent GObject types and to let you subclass them. When you write:

```squirrel
local Gio = import("Gio")
local app = sqgi.new_object(Gio.Application, { "application-id" = "org.x" })
```

…you're instantiating a GObject class that SQGI has exposed as a Squirrel class. We'll dig into this in chapters 7 and 8.

## 5.11 Exercises

1. Add a `Stack` class with `push`, `pop`, `peek`, `len`.
2. Build a `Polygon` base class with `Triangle` and `Rectangle` subclasses that override `area()`.
3. Add `_tostring` to your `Stack` so `print` shows `Stack(3 items)`.
4. Extend `Budget` with `clear()` that empties entries.

## 5.12 What's next

Chapter 6 covers what to do when things go wrong: exceptions, the `sqgi.GError` class, and async cancellation patterns.
