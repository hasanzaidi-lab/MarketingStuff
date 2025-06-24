

---

# ✅ Optionals

### 1. What is Optional?

An **optional** is a type that can hold either a value or `nil` to indicate the absence of a value.

```swift
var name: String? = "Hasan"
name = nil // valid
```

Why? Because some data might not be available yet. It’s Swift’s way of handling nullability safely.

### 2. Ways to Safely Unwrap Optionals

* **if let**: Safe unwrapping using optional binding

```swift
if let name = name {
    print(name)
} else {
    print("No name")
}
```

* **guard let**: Same as if-let but exits early

```swift
func greet(name: String?) {
    guard let name = name else {
        print("No name")
        return
    }
    print("Hello, \(name)")
}
```

* **Optional Chaining**: Access nested optionals safely

```swift
let length = person?.address?.street?.count
```

* **Nil-Coalescing Operator (`??`)**: Provide default

```swift
let name = optionalName ?? "Guest"
```

* **Force unwrap (risky)**: Use only when 100% sure

```swift
let name = name!
```

### 3. Difference Between if let vs guard let

* `if let` unwraps in a local scope
* `guard let` unwraps early and lets you use the value after

Use `guard let` in functions to exit early if required data is missing.

### 4. Optional Chaining

Allows calling properties/methods/subscripts on optional values.

```swift
let zipCode = user?.address?.zipCode
```

### 5. Force Unwrapping

```swift
let name: String? = "Hasan"
print(name!) // only safe if not nil
```

Use when the optional definitely contains a value.

### 6. Valid Force Unwrapping Example

```swift
let url = URL(string: "https://apple.com")!
```

Because you're confident the string is valid.

### 7. What are Optionals Behind the Scenes?

Optionals are implemented as:

```swift
enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}
```

### 8. Difference: `nil` vs `NULL`

* `nil` is Swift’s representation of no value.
* `NULL` is from C/Objective-C.

### 9. Nil Coalescing Operator `??`

Returns the optional’s value or a default.

```swift
let name = userName ?? "Anonymous"
```

### 10. let vs var

* `let`: Immutable constant
* `var`: Mutable variable

---

# 🧩 Enums

### 11. What is Enum?

An enum defines a group of related values.

```swift
enum Direction {
    case north, south, east, west
}
```

### 12. What are Associated Values?

Allows enum cases to store extra data.

```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
```

### 13. Associated vs Raw Value

* **Associated Value**: carries dynamic data per case.
* **Raw Value**: fixed underlying type.

```swift
enum Planet: Int { case mercury = 1, venus, earth }
```

### 14. Can Enum Have Functions?

Yes.

```swift
enum Light {
    case red, green
    func signal() -> String {
        switch self {
        case .red: return "Stop"
        case .green: return "Go"
        }
    }
}
```

---

# 📦 Properties

### 15. Computed Properties

Return value based on logic:

```swift
var fullName: String { firstName + " " + lastName }
```

### 16. Stored Properties

Physically store values:

```swift
var age = 30
```

### 17. Lazy Properties

Initialized when accessed:

```swift
lazy var imageLoader = ImageLoader()
```

### 18. When to Use Lazy?

Use when:

* The property is not always used
* Setup is expensive (e.g., network call)
  Avoid when:
* Needed early or on multiple threads

### 19. Static and Class Properties

```swift
class Car {
    static var wheels = 4
    class var description: String { "This is a car." }
}
```

### 20. Static vs Class

* `static`: cannot be overridden
* `class`: can be overridden by subclass

---

# 🆚 Class vs Struct

### 21. Class vs Struct

* Class = reference type (shared)
* Struct = value type (copied)

### 22. Value vs Reference

```swift
struct Point { var x: Int }
var a = Point(x: 10)
var b = a
b.x = 20 // `a.x` stays 10
```

### 23. When to Use Class or Struct

Use Struct:

* Immutable
* Light-weight
  Use Class:
* Inheritance
* Shared reference

### 24. How to Mutate Struct

```swift
struct Counter {
    var count = 0
    mutating func increment() { count += 1 }
}
```

### 25. Where Stored

* Structs → Stack
* Classes → Heap

### 26. Stack vs Heap

* Stack: fast, auto-cleanup
* Heap: slower, needs reference tracking (ARC)

---

# 📜 Protocols

### 27. What is Protocol

Blueprint with required methods/properties.

```swift
protocol Greetable {
    func greet()
}
```

### 28. Use Cases

* Delegation
* Abstraction
* Testing
* Polymorphism

### 29. Variables in Protocols

```swift
var name: String { get set }
```

### 30. Optional Protocol Methods

Only possible in `@objc` protocols.

```swift
@objc protocol Speaker {
    @objc optional func talk()
}
```

### 31. Protocol Extensions

```swift
extension Greetable {
    func greet() { print("Hello") }
}
```

### 32. Can You Add Stored Props?

❌ No. Only computed.

### 33. Why Not?

Protocol doesn’t allocate memory—only defines behavior.

### 34. Associated Type

Generic placeholder.

```swift
protocol Identifiable {
    associatedtype ID
    var id: ID { get }
}
```

---

# 🔁 Generics

### 35. What is Generics

Write reusable, type-safe code.

```swift
func swap<T>(_ a: inout T, _ b: inout T) { let temp = a; a = b; b = temp }
```

### 36. Example

Reusable List, Networking wrappers

### 37. Any vs Generics

* `Any` = lose type safety
* `Generics` = compile-time safe

### 38. Generic Stack

```swift
struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) { items.append(item) }
    mutating func pop() -> T? { items.popLast() }
}
```

---

# ➕ Extensions

### 39. What is Extension

Add behavior to existing types.

```swift
extension String {
    func reversedString() -> String { String(self.reversed()) }
}
```

### 40. Can Add Variables?

Only computed ones. No stored props.

---

# 📘 General

### 41. Type Safety

Compile-time checking of types.

### 42. Type Inference

```swift
let age = 30 // inferred as Int
```

### 43. Swift Collections

* Array
* Set
* Dictionary

### 44. Reference vs Value Types

```swift
class Car {}
struct Bike {}
```

### 45. Higher Order Functions

* `map`, `filter`, `reduce`, `compactMap`, `flatMap`

### 46. `map` vs `compactMap`

* `map`: transforms
* `compactMap`: removes nil

### 47. Use of Reduce

```swift
let sum = [1, 2, 3].reduce(0, +)
```

### 48. Initializers

* Designated: `init()`
* Convenience: `convenience init()`
* Failable: `init?()`

### 49. Defer Keyword

Run code last in scope.

```swift
defer { print("Cleanup") }
```

---

# 🔗 Closures

### 50. What is Closure

Block of code you can pass around.

```swift
let greet = { print("Hi") }
greet()
```

### 51. Closure Type

Closures are **reference types**.

### 52. Types of Closures

* Trailing
* Escaping
* Auto-closure

### 53. Escaping vs Non-Escaping

```swift
func fetch(completion: @escaping () -> Void) {}
```

Escaping used after function returns.

### 54. Auto Closure

```swift
func log(_ msg: @autoclosure () -> String) {
    print(msg())
}
log("Error")
```

---

